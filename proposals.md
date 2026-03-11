# SNAB Extension Proposal Guide

*By Isabelle Santin*

# Section 1: Introduction

This document exists to outline and detail the procedure for extending the SNAB protocol. Proposals can be categorized as follows, in order of closeness to the core specification:

1. **Core extension** - these proposals are reserved for the highest priority features which have the greatest amount of support in the SNAB ecosystem. These proposals exists purely to advance the standard specification to the next version(s). 
2. **Language extension** - these proposals exist to outline a standardized, but language-specific feature of SNAB. The expectation is that all SNAB implementations for the affected language(s) will implement them accordingly. 
3. **User extension** - these proposals are purely informative and can be submitted by anyone. They document any other extensions which are used in applications which need to talk to each other but do not necessarily have to agree unilaterally on which type ID is which. 

The next sections detail the procedure for creating a SNAB extension proposal and how it may advance once proposed. 

# Section 2: Proposal

All proposals, except those created by SNAB specification authors, will start their life as *User* extensions. These proposals are to be submitted to the SNAB issue tracker, tagged correctly with the relevant language identifiers and degree of integration (Core, Language, or User). The proposal itself will include the following key items, in the given order:

1. Abstract - brief summary of the proposal, its purpose, and relevant authors.
2. Keywords - comma separated list of keywords that may be used to search for this proposal.
3. Impacted language(s) - comma separated list of language identifiers affected by this proposal.
4. Existing implementations (there must be more than one) - bullet list of relevant repositories which implement the proposal.
5. Explanation / justification - explain the reasons for this proposal and requirements for future implementations of it.

# Section 3: Advancement

While all proposals begin their life as User extensions, it is possible for them to advance to a higher degree of integration. User extensions are extensions created by any community member, and have at least two implementations in a given language. One implementation is not enough to constitute a proposal- for compatibility reasons, a given extension must be shared between two or more implementations to require standardization among those implementations. 

Once there are more than five implementations of a given proposal in the same language, an argument can be made for **advancement**. To request an advancement, the proposal should be forwarded to SNAB maintainers directly, either via Email or other preferred communication channels. One may also endorse a proposal as a major contributor, which can lend credibility to such requests. Such an advancement raises the proposal to the Language level. 

If at any point there are two or more impacted languages for a given proposal, and all impacted languages have at least one implementation, a User extension may advance to the Core level. This is the highest degree of integration possible, and will yield a new core specification version once finalized. There is currently no formal process for this finalization, however it will always involve verification of unit tests, compatibility checks against other proposals, and potentially merging proposals together into the same extension. 
