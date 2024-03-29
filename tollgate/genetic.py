# ===============================================================================
# Chromosome:
# ===============================================================================
#   (price, edge_id, min_edge_length, edge_offset, operating_hours)
# -------------------------------------------------------------------------------
# price: MIN - MAX
# -------------------------------------------------------------------------------
# edge_id: in edges
# min_edge_length: MIN
# edge_offset: N
#    min_edge_length > edge_offset
# -------------------------------------------------------------------------------
# operating_hours:
#   1 = 16:00 - 00:00
#   2 = 08:00 - 16:00
#   4 = 00:00 - 08:00
#   3 = 08:00 - 16:00, 16:00 - 00:00
#   5 = 00:00 - 08:00, 16:00 - 00:00
#   6 = 00:00 - 08:00, 08:00 - 16:00
#   7 = 00:00 - 08:00, 08:00 - 16:00, 16:00 - 00:00
# -------------------------------------------------------------------------------

import random
import numpy
from pprint import pprint

from deap import base
from deap import tools
from deap import creator
from deap import algorithms

from constants  import *
from options    import settings
from state      import state
from simulation import run_genetic_algorithm, simulation_fitness
from tollgate   import Tollgate

toolbox = base.Toolbox()
population = None
history = tools.History()
logbook = tools.Logbook()
logbook.header = "gen", "evals", "min", "avg", "max", "std"

def individual_to_tollgates(individual):
    tollgates = []
    for i in range(0, len(individual), settings.individual_size):
        tollgates.append(
            Tollgate(individual[i], individual[i+1], individual[i+2])
        )
    return tollgates

def evaluate_fitness(individual):
    state.tollgates = individual_to_tollgates(individual)
    run_genetic_algorithm()
    return simulation_fitness()

def initialize():
    random.seed()
    creator.create("FitnessMulti", base.Fitness, weights=(-1.0, 1.0))
    creator.create("Individual", list, fitness=creator.FitnessMulti)
    
    toolbox.register("price", random.uniform,
                     settings.tollgate_min_price,
                     settings.tollgate_max_price)
    toolbox.register("edge_id", random.randint, 0, len(state.edges)-1)
    toolbox.register("edge_offset", random.randint,
                     settings.tollgate_min_offset,
                     settings.tollgate_min_lane_length)

    toolbox.register("individual", tools.initCycle, creator.Individual,
                     ( toolbox.price,
                       toolbox.edge_id,
                       toolbox.edge_offset ),
                     n=settings.tollgate_max_count
    )
    toolbox.register("population", tools.initRepeat, list, toolbox.individual)
    toolbox.register("mate", tools.cxBlend, alpha=settings.crossover_blend_alpha)
    toolbox.register("mutate", tools.mutGaussian,
                     mu=settings.mutation_gaussian_mean,
                     sigma=settings.mutation_gaussian_sigma,
                     indpb=settings.mutation_independent_probability)
    toolbox.register("select", tools.selTournament, tournsize=3)
    toolbox.register("evaluate", evaluate_fitness)

    if settings.output_genealogy:
        toolbox.decorate("mate", history.decorator)
        toolbox.decorate("mutate", history.decorator)

def run():
    population = toolbox.population(n=settings.population_size)
    if settings.output_genealogy:
        history.update(population)
    
    stats = tools.Statistics(key=lambda ind: ind.fitness.values)
    stats.register("avg", numpy.mean)
    stats.register("std", numpy.std)
    stats.register("min", numpy.min)
    stats.register("max", numpy.max)

    pop, logbook = None, None
    if settings.screenshot_directory:
        pop, logbook = run_algorithm(pop=population,
                                     cxpb=settings.crossover_probability,
                                     mutpb=settings.mutation_probability,
                                     ngen=settings.generation_size,
                                     stats=stats)
    else:
        pop, logbook = algorithms.eaSimple(population, toolbox,
                                           cxpb=settings.crossover_probability,
                                           mutpb=settings.mutation_probability,
                                           ngen=settings.generation_size,
                                           stats=stats, verbose=True)
    output_results(pop, logbook)
    if settings.output_genealogy:
        show_genealogy()

def run_algorithm(pop, cxpb, mutpb, ngen, stats):
    for g in range(ngen):
        state.generation = g
        settings.output_statistics.write('\nGeneration {}\n\n'.format(g))
        offspring = map(toolbox.clone, toolbox.select(pop, len(pop)))
        offspring = algorithms.varAnd(offspring, toolbox, cxpb, mutpb)
        invalid_ind = [ind for ind in offspring if not ind.fitness.valid]
 
        fitnesses = []
        for i, ind in enumerate(invalid_ind):
            state.individual = i
            fitness = toolbox.evaluate(ind)
            fitnesses.append(fitness)
            settings.output_statistics.write(
                'Individiaul {} Fitness {} Price {} Edge {} Offset {}\n'.format(
                    i, fitness, ind[0], state.edges_list[int(ind[1]) % len(state.edges)], ind[2]))
            settings.output_statistics.flush()
        for ind, fit in zip(invalid_ind, fitnesses):
            ind.fitness.values = fit

        pop[:] = offspring
        nevals = len(fitness)
        record = stats.compile(pop)
        logbook.record(gen=g, evals=nevals, **record)
        settings.output_statistics.write('\n\n' + str(logbook) + '\n\n')
        settings.output_statistics.flush()

def output_results(pop, logbook):
    print logbook    
    print '\n'
    for p in pop:
        for i in individual_to_tollgates(p):
            print i
    print '\nBEST\n\n'
    for i in individual_to_tollgates(tools.selBest(pop, 1)[0]):
        print i

def show_genealogy():
    import matplotlib.pyplot as plt
    import networkx
    
    graph = networkx.DiGraph(history.genealogy_tree)
    graph = graph.reverse()
    colors = [toolbox.evaluate(history.genealogy_history[i])[0] for i in graph]
    networkx.draw(graph, node_color=colors)
    plt.savefig(settings.output_genealogy)
