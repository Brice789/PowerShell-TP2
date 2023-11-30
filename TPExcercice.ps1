$A = 22,5,10,8,12,9,80


# The comma can also be used to initialize a single item array by placing the comma
# before the single item. For example, to create a single item array
# named $B containing the single value of 7, type:

$B = ,7


# You can also create and initialize an array using the range operator ( .. ). The
# following example creates an array containing the values 5 through 8.


$C = 5..8



# When no data type is specified, PowerShell creates each array as an object array
# (System.Object[]). To determine the data type of an array, use
# the GetType() method. For example:


$A.GetType()


#To cast an array, precede the variable name with an array type enclosed in brackets.


[int32[]]$ia = 1500, 2230, 3350, 4000


# $a = @("Hello World oe", "Hello World oe")
# $a.Count


# The array operator is useful in scripts when you are getting objects, but don't know
# how many to expect. For example:

# $p = @(Get-Process )
# $p

# $a = 0..9
# $a[3]


# $a[1..4]



$a = 0..9
# $a[-3..-1]
# $a[0,2+4..6]

# foreach ($element in $a) {
# $element
# }

for ($i = 0; $i -le ($a.length - 1); $i += 2) {
   # $a[$i]
}


$data = @(
[pscustomobject]@{FirstName='Kevin';LastName='Marquette'}
[pscustomobject]@{FirstName='John'; LastName='Doe'}
)

# $data[0]


# $data | Where-Object {$_.FirstName -eq 'Kevin'}
# $data | Where FirstName -eq Kevin

foreach($person in $data)
{
$person.FirstName = 'Ke'
}

foreach($person in $data)
{
$person = [pscustomobject]@{
FirstName='Kevin'
LastName='Marquette'
}
}