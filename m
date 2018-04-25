Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Wed, 25 Apr 2018 08:18:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [RFC 03/10] cpufreq: exynos: Remove support for Exynos5440
Message-ID: <20180425024824.7ej2sz5jlbiuqeqh@vireshk-i7>
References: <20180424203239.21885-1-krzk@kernel.org>
 <20180424203239.21885-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180424203239.21885-4-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 24-04-18, 22:32, Krzysztof Kozlowski wrote:
> The Exynos5440 is not actively developed, there are no development
> boards available and probably there are no real products with it.
> Remove wide-tree support for Exynos5440.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/cpufreq/cpufreq-exynos5440.txt        |  28 --
>  drivers/cpufreq/Kconfig.arm                        |  14 -
>  drivers/cpufreq/Makefile                           |   1 -
>  drivers/cpufreq/exynos5440-cpufreq.c               | 452 ---------------------
>  4 files changed, 495 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-exynos5440.txt
>  delete mode 100644 drivers/cpufreq/exynos5440-cpufreq.c

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
