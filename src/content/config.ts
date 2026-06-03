import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

/**
 * The `questions` collection is the single source of truth.
 * Every question lives in its own Markdown file under
 * src/content/questions/<section>/<slug>.md
 *
 * This Zod schema is what validates incoming pull requests:
 * if a contributor's frontmatter is missing a field or uses an
 * invalid value (e.g. difficulty: "tricky"), `astro build` FAILS,
 * which turns the PR's CI check red — no manual policing needed.
 */
const questions = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/questions' }),
  schema: z.object({
    // The interview question itself.
    question: z.string().min(8),

    // Must match one of the known sections (drives routing + grouping).
    section: z.enum(['backend', 'frontend', 'database', 'ai', 'general']),

    // Keep difficulty constrained so the UI badges stay consistent.
    difficulty: z.enum(['easy', 'medium', 'hard']),

    // Free-form topic tags, optional.
    tags: z.array(z.string()).default([]),

    // Optional manual ordering within a section (lower = earlier).
    order: z.number().optional(),

    // Optional attribution — contributors may credit themselves.
    author: z.string().optional(),
  }),
});

export const collections = { questions };
