You are tasked with making the perfect peanut butter and jelly sandwich! Follow the prompts to see your sandwich come to life! If your instructions are not clear, your sandwich might turn out a little wonky. -> bread_step

VAR has_blood = false
VAR used_hands_pb = false
VAR bread_breaking = false
VAR bread_in_package = false
VAR no_pb = false
VAR hair_in_jelly = false
VAR jar_on_bread = false
VAR bread_wonky = false

=== bread_step ===
    * Grab a piece of bread 
      You grabbed the bread with your fist and now it is breaking apart. 
      ~ bread_breaking = true
      ** Continue with the same piece -> knife_step
      ** Pick up another piece of bread using both hands and a cupping motion 
        The bread folded in half and broke apart as you used both hands. 
        ~ bread_breaking = true
        *** Pick up another piece of bread using your pointer and thumb fingers -> knife_step
        *** Give up. Bread is overrated. -> DONE 
            -> DONE
      ** Pick up another piece of bread using your pointer and thumb fingers -> knife_step
    * Pick up a piece of bread 
      You picked up the bread while it was still in the package!
      ~ bread_in_package = true
      ** Open the package of bread -> knife_step
      ** Continue with the bread still in the package -> knife_step
    * Open the package of bread 
        ** Pull out two pieces of bread -> knife_step
        ** Grab two pieces of bread 
        You grabbed the bread with your fist and now it is breaking apart. 
        ~ bread_breaking = true
            *** Continue with the same piece -> knife_step
            *** Pick up another piece of bread using both hands and a cupping motion 
            The bread folded in half and broke apart as you used both hands. 
            ~ bread_breaking = true
            **** Pick up another piece of bread using your pointer and thumb fingers -> knife_step
            **** Give up 
            -> DONE


== knife_step ===
* Grab the knife with your hand
    You grabbed the knife from the wrong side and now you have cut your hand.
    ~ has_blood = true
    ** Clean up the blood
       Now your hands are clean and there is no blood to be found!
       *** Use your hand to grab the knife from the handle -> pb_step
       *** Continue holding the knife with the blades in your hand 
            Your hands are throbbing at this point. 
            **** Start this section over -> knife_step
            **** Continue -> pb_step
    ** Continue with the sandwich making process
       There is some blood on your knife but that is okay! 
       *** Continue holding the knife with the blades in your hand -> pb_step
       *** Switch the knife around and hold it from the handle -> pb_step
    ** Use your other hand to grab the knife from the handle
       There is a some blood on the knife but that is okay! 
       *** Continue holding the knife with your non dominant hand -> pb_step
       *** Switch hands and hold the knife with your bloody dominant hand from the handle -> pb_step
* Pick up the knife carefully -> pb_step
* Put peanut butter onto the bread
    You have now placed the jar of peanut butter on top of the piece of bread. 
    ** Start over -> bread_step
    ** Take the jar of peanut butter off the bread -> bread_step

-> DONE

=== pb_step ===
* Spread the peanut butter onto the bread
    You have now used your hands to spread the peanut butter onto the bread. If they were still bloody, your sandwich is now too!
    ~ used_hands_pb = true
    ** Start over -> bread_step
    ** Continue spreading the peanut butter with your hands -> jelly_step
    ** Grab the knife and put it into the jar of peanut butter
        The knife is in the peanut butter with the handle down. 
        *** Pick up the knife and use the handle side to spread the peanut butter onto the bread -> jelly_step
        *** Pick up the knife and turn it around and then spread the peanut butter onto the bread -> jelly_step
* Use the knife and put it into the jar of peanut butter
    The knife is in the peanut butter with the handle down. 
    ** Pick up the knife and use the handle side to spread the peanut butter onto the bread -> jelly_step
    ** Pick up the knife and turn it around and then spread the peanut butter onto the bread -> jelly_step
* Use the knife to spread the peanut butter onto the bread 
    You did not specify how much peanut butter so now there is a singular dollop on the bread. 
    ** Add more peanut butter onto the bread -> jelly_step
    ** Move onto the next step -> jelly_step
    ~ no_pb = true

-> DONE

=== jelly_step ===
* Take the knife and put it in the jelly
       The entire knife, including the handle, is now submerged in the jelly jar.
    ** Take the knife out -> combine_step
    ** Leave the knife inside and grab another one -> combine_step
    ** Shake the jar upside down so the knife falls out -> combine_step
* Spread the jelly onto the bread
       You did not specify where, so the jelly is now spread onto the table. 
    ** Scrape it off and put it onto the bread -> combine_step
    ~hair_in_jelly = true
    ** Try again and this time say "onto the bread" -> jelly_step
    ** Give up and eat dry peanut butter bread -> DONE
* Place jelly onto the bread
       You have now placed the **entire jar of jelly** onto the bread. 
    ** Open the jar and take the jelly out -> combine_step
    ** Leave the jar there, it adds texture -> combine_step
    ~ jar_on_bread = true

=== combine_step ===
* Place the second piece of bread on top
       You gently set the bread **next to** the sandwich instead.
    ** Try again, but actually **on** the sandwich -> last_step
    ** Stack it **under** the first piece instead -> jelly_step
    ~ bread_wonky = true
    ** Clap the two pieces together like a sandwich clap -> DONE
* Smush the sandwich together
       You pressed too hard and now the peanut butter and jelly have exploded out the sides
    ** Wipe up the mess and eat what's left -> last_step
    ** Try again but use **gentle** force -> last_step
* Cut the sandwich in half
      You did not specify which direction, so now you have a **vertical** sandwich.
    ** Specify "diagonal" and try again. -> last_step
    ** Specify "horizontal" and try again. -> last_step
    ** Cut it into **four** pieces instead. -> last_step
* Take a bite
      You forgot to **pick up** the sandwich, so you just bit the air.
    ** Pick up the sandwich first, then bite. -> last_step
    ** Continue biting the air because at this point, why not. -> last_step


=== last_step ===
You have now constructed your sandwich! Is it as good as you thought it would be? 

* Take a bite  
    ~ temp bite_description = ""

    { has_blood and used_hands_pb:
        ~ bite_description += "The flavors of peanut butter and jelly mix perfectly except for the lingering taste of iron. "
    }
    { has_blood:
        ~ bite_description += "The sandwich tastes great, but you can't help noticing a metallic aftertaste... you should have washed your hands first. "
    }
    { used_hands_pb:
        ~ bite_description += "Something feels off. The peanut butter is a bit warm and the jelly texture is questionable. Maybe using your hands wasn’t the best idea? "
    }
    { bread_breaking and bread_wonky:
        ~ bite_description += "You take a bite, but the sandwich is falling apart. You should have used another piece of bread when you had the chance. "
    }
    { bread_in_package:
        ~ bite_description += "The taste of plastic lingers in your throat bite after bite. Taking the bread out of the package should have been your first step. "
    }
    { no_pb:
        ~ bite_description += "All you taste is jelly. Where did the peanut butter go? "
    }
    { hair_in_jelly:
        ~ bite_description += "The jelly you scraped off the table has visible dirt and hair in it. Be more sanitary next time! "
    }
    { jar_on_bread:
        ~ bite_description += "The jar is still on the sandwich. How are you going to eat it? "
    }

    { bite_description != "":
        { bite_description }
    - else:
        You take a bite. The peanut butter and jelly **blend together in perfect harmony**.   
        You’ve made **the perfect sandwich.**  
        Congratulations!  
    }

    -> DONE


