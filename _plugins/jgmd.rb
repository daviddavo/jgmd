module JustGetMyData
    class Generator < Jekyll::Generator
        priority :highest
        def generate(site)
            site.data['trans'].keys.each do |lang|
                # First /lang/index.html
                site.pages << LanguagePage.new(site, site.dest, '', lang)
            end                
        end
    end

    class LanguagePage < Jekyll::Page
        def initialize(site, base, dir, lang)
            # TODO: Check if flag exists
            @lang = lang
            @short = lang.split('-')[0]
            super(site, base, @short, 'index.html')

            if @short == 'en' then
                puts 'This is en'
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