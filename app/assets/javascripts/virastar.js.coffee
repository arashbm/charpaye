# there are <n> types of things virastar should detect:
# Absolutly wrong things: like english numbers in persian words or ZWNJ stuff
# Warning: like می‌باشد and stuff
# Advices: like long sentences.
virastar = (html) ->
    # check for punctuations and spacing before/after.
    # check for english ' " ,
    # check for latin numerals in persian words
    # check for dot as floating point
    # check for ZWNJ between می and verb root.
    # check for می‌باشد and its variants.
    # check for ZWNJ before تر, ترین, ها, های and other joining suffixes
    # check for arabic ک ی ه ۴ ۵ ۶ ...
    # check for extra ZWNJ and spacing
    # check for sentences starting with english words.
    # check for long sentences and paragraphs.
    # check for one-sentence paragraphs
    # check for long numbers
