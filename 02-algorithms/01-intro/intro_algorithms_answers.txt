# Algorithms in Daily Life

## Washing dishes

```
WashDishes:

    IF dishwasher contains clean dishes THEN
        FOR each dish in dishwasher
            take dish from dishwasher
            put away dish
        END FOR
    ENDIF
    
    FOR each dish in dishrack
        dry dish
        put away dish
    END FOR

    FOR each dish in sink
        take dish from sink
        scrape dish into garbage
            
        IF dishwasher is not full THEN 
            put dish into dishwasher
        ELSE 
            IF dishwasher is not running THEN
                put dishwasher soap into dishwasher
                close dishwasher
                turn on dishwasher
            ENDIF
            handwash dish
            put dish into dishrack
        ENDIF
    END FOR
```

## Making coffee

```
MakeCoffee:

    SET numberOfScoops to 0
    WHILE numberOfScoops < 8
        take scoop of coffee from can
        put scoop of coffee into filter
        INCREMENT numberOfScoops
    ENDWHILE
    
    put filter into basket
    
    fill reservoir
    UNTIL water level is 8
    
    turn on coffee maker
    
```

## Mowing the lawn
```
    take mower from garage
    
    fill tank with gas
    UNTIL tank is full
    
    SET primed to 0
    WHILE primed < 5
        prime motor
        INCREMENT primed
    ENDWHILE
    
    REPEAT
        pull crank
    UNTIL motor is running
    
    WHILE there is unmowed grass
        pick a patch of unmowed grass
        mow that patch
    ENDWHILE
    
    turn off mower
    put mower into garage
```

        