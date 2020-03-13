module ErrorsModule
  class NumberOutOfRangeError < StandardError; end
  class SlotAlreadyPickedError < StandardError; end
  class EmptyNameError < StandardError; end
end
