# Product Development Process

**Note:** I have a WIP for updating this document in this ChatGPT session: https://chatgpt.com/c/686f26b4-d9dc-8004-91a0-634d7e4d0907

This repository captures a simple framework for defining and documenting how products progress from high-level goals to technical implementation. The aim is to keep the process straightforward enough that it can be reused across projects.

## Overview

There are three broad phases:

1. **The Why** – defining goals or KPIs.
2. **The What** – a product spec that describes the desired outcome without prescribing the technical solution.
3. **The How** – the technical plan for implementation.

These phases represent a handoff from product thinking to technical execution. The "what" should be stable before the "how" begins so that engineering can confidently plan their work.

## The Why

A "why" states what you hope to achieve in measurable terms. In most cases it should read like a KPI or SMART goal: "move this metric by this amount in this timeframe." The exception is when you're building a way to measure something for the first time. You can view that as bringing the ability to measure a metric from 0 to 1—effectively moving that KPI into existence.

## The What

The "what" (sometimes called the product spec or product requirements) defines the problem and the intended user experience, independent of how it will be solved. User stories, wireframes, or other artifacts may support the spec, but the key is that it focuses on desired behavior and outcomes, not the technical details.

Product thinkers should feel free to write a "what" even if they aren't technical. However, once the "what" is agreed upon, changing it later can affect timelines or other engineering decisions, so it should be treated as stable for the duration of technical planning.

## The How

The technical team decides how to fulfill the "what." This includes architecture choices, tasks, and sequencing. The "how" is informed by the "what" and may require clarifying questions, but it should not redefine the problem.

---

Feel free to clone or reference this repository when starting a new project. Keeping these phases in mind can help teams communicate expectations and manage handoffs more effectively.
