const CheckBox = ({ name, inputs, setInputs }) => {
  const handleCheckChange = () => {
    if (inputs.includes(name)) {
      setInputs(inputs.filter((input) => input !== name))
    }
    else {
      setInputs(inputs.concat(name))
    }
  }

  return (
    <input
      type='checkbox'
      name={name}
      onChange={handleCheckChange}
    />
  )
}

export default CheckBox