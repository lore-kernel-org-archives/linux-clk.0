Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [RFC 04/10] clk: samsung: Remove support for Exynos5440
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark
	Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Tomasz Figa
	<tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar
	<viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin
	<edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede
	<hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
	<andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej
	Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern
	<stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>, Jingoo Han
	<jingoohan1@gmail.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <8e4e4712-4b21-83f8-fa06-142e9557a251@samsung.com>
Date: Wed, 25 Apr 2018 14:49:24 +0200
MIME-version: 1.0
In-reply-to: <20180424203239.21885-5-krzk@kernel.org>
Content-type: text/plain; charset="utf-8"
References: <20180424203239.21885-1-krzk@kernel.org>
	<CGME20180424203341epcas5p3a6db7d58b0ce8940d03711823fbf6e41@epcas5p3.samsung.com>
	<20180424203239.21885-5-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

Cc: Jingoo Han

On 04/24/2018 10:32 PM, Krzysztof Kozlowski wrote:
> The Exynos5440 is not actively developed, there are no development
> boards available and probably there are no real products with it.
> Remove wide-tree support for Exynos5440.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks Krzysztof, patch applied, assuming there is no issues with applying 
patches from this series individually through the subsystem trees.

-- 
Regards,
Sylwester
