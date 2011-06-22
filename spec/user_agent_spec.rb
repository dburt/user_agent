require File.expand_path('../spec_helper', __FILE__)

describe UserAgent do
  before(:each) do
    @agent = UserAgent.new 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/528.4+ (KHTML, like Gecko) Version/4.0dp1 Safari/526.11.2'
  end

  describe ".engine_version" do
    it "can detect webkit" do

    end
  end

  describe "#initialize" do
    it "should allow a user agent string to be passed" do
      UserAgent.new('foo').source.should == 'foo'
    end
  end

  describe "#os" do
    it "should return operating system symbol" do
      @agent.os.should == 'OS X 10.5'
    end
  end

  describe "#engine" do
    it "should return engine symbol" do
      @agent.engine.should == :webkit
    end
  end

  describe "#engine_version" do
    it "should return engine version" do
      @agent.engine_version.should == '528.4'
    end
  end

  describe "#to_s" do
    it "should return the user agent string" do
      @agent.to_s.should == @agent.source
    end
  end

  describe "#inspect" do
    it "should return string presenting the engine, os, version, etc" do
      @agent.inspect.should == '#<UserAgent: name: :safari, version: "4.0dp1", os: "OS X 10.5", platform: :macintosh, engine: :webkit, engine_version: "528.4">'
    end
  end

  describe "#name" do
    it "should return the agent name symbol" do
      @agent.name.should == :safari
    end
  end

  describe "#eql?" do
    it "returns true for same source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('foo')
      a.should eql(b)
    end

    it "returns false for different source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('bar')
      a.should_not eql(b)
    end

    it "returns false for different classes" do
      a = UserAgent.new('foo')
      b = Class.new.new
      a.should_not eql(b)
    end
  end

  describe "#==" do
    it "returns true for same source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('foo')
      a.should == b
    end

    it "returns false for different source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('bar')
      a.should_not == b
    end

    it "returns false for different classes" do
      a = UserAgent.new('foo')
      b = Class.new.new
      a.should_not == b
    end
  end
end