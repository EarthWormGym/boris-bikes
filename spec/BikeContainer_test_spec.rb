class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  # it_behaves_like BikeContainer
  include_examples BikeContainer
end
