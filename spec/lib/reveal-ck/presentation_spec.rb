require 'spec_helper'

module RevealCK
  describe Presentation do

    describe '#add_slide' do

      it 'maintains a list of slides' do
        presentation = Presentation.new
        presentation.add_slide double('slide', html: "first")
        presentation.add_slide double('slide', html: "second")
      end

    end

    describe '#content' do

      let :presentation do
        presentation = Presentation.new
        presentation.add_slide double('slide', html: "first")
        presentation.add_slide double('slide', html: "second")
        presentation
      end

      let :content do
        presentation.content.strip
      end

      it 'returns the content from each slide' do
        expect(content).to start_with 'first'
        expect(content).to end_with 'second'
      end

    end

    describe '#theme' do
      it 'can be set and read' do
        presentation = Presentation.new
        presentation.theme = 'night'
        expect(presentation.theme).to eq 'night'
      end

      it 'has a default value of "default"' do
        expect(Presentation.new.theme).to eq 'default'
      end
    end

    it 'responds to #title= and #title' do
      presentation = Presentation.new
      presentation.title = 'My Favorite Slides'
      expect(presentation.title).to eq 'My Favorite Slides'
    end

    it 'responds to #author= and #author' do
      presentation = Presentation.new
      presentation.author = 'Hakim El Hattab'
      expect(presentation.author).to eq 'Hakim El Hattab'
    end

    describe '#slide' do
      it 'is a shortcut for creating a new Slide and calling #add_slide' do
        presentation = Presentation.new

        expect(Slide)
          .to(receive(:new)
                .with({ template: 'text', content: 'spec' })
                .and_call_original)

        expect(presentation)
          .to(receive(:add_slide)
                .with(kind_of(Slide)))

        presentation.eval "slide('text', { content: 'spec' })"
      end
    end

  end
end
