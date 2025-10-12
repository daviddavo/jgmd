module JustGetMyData
    class Generator < Jekyll::Generator
        priority :highest
        def generate(site)
            site.data['trans'].keys.each do |lang|
                # First /lang/index.html
                site.pages << LanguagePage.new(site, site.source, lang)
            end
        end
    end

    class LanguagePage < Jekyll::PageWithoutAFile
        def initialize(site, base, lang)
            # TODO: Check if flag exists
            @lang = lang
            @short = lang.split('-')[0]
            
            @site = site
            @base = base
            @dir = @short
            @name = 'index.html'
            @path = File.join(@dir, @name)

            self.process(@name)

            if @short == 'en' then
                @data = {
                    'layout' => 'redirect',
                    'redirect_to' => '/'
                }
            else
                @data = {
                    'layout' => 'default',
                    'lang' => @lang,
                    'short' => @short
                }
            end
        end
    end
end
