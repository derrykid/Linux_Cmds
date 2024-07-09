[toc]

# Syntax
[Syntax sheet](https://mermaid-js.github.io/mermaid/#/classDiagram) 

## Define a class
```mermaid
classDiagram
    class amimal{
        +variable1: int
        +variable2: String
        +getAge() int
        +doSomething() void
    }
```

## Accessibility

- `+` public
- `-` private
- `#` protected
- `~` package

## Relation

| Type   | Description                 |
|--------|-----------------------------|
| ..\|>  | Implemetation / realization |
| - -\|> | Inheritance / extend        |

## Annotation on class
```mermaid
classDiagram
class Shape{
    <<enum>>
    noOfVertices
    draw()
}
```

- <\<Interface>>
- <\<abstract>>
- <\<enum>> or <\<enumeration>>

## Comment
```mermaid
classDiagram
%% this is comment
class shape{
        
    }
```

## Label on relation
classA <|-- classB: [lable]
```mermaid
classDiagram
    classA <|-- classB: [extends]
```

## Setting the direction
```mermaid
classDiagram
  direction RL
  class Animal{
      <<Interface>>
        method1() int
        method2() String
  }
  class Dog{
    +getAge() int
    +getName() String
  }
    Dog ..|> Animal: Implement
```

