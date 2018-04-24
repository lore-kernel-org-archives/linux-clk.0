Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180424205636.cdp4czq6hhs5gu5a@kozik-lap>
References: <20180424203239.21885-1-krzk@kernel.org> <CAK8P3a2CZU1CYFt0fdVSFFnj2Wg=mUcC=yuWAW7zDO0u2Q2dUQ@mail.gmail.com>
 <20180424205636.cdp4czq6hhs5gu5a@kozik-lap>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 24 Apr 2018 23:12:15 +0200
Message-ID: <CAK8P3a1Az9acSZwdhPz+Gwy6nSL=WAB6-z6Cq9m=nPLzF240_A@mail.gmail.com>
Subject: Re: [RFC 00/10] ARM: Remove support for Exynos5440
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, IDE-ML <linux-ide@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi <linux-spi@vger.kernel.org>, linux-usb@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>,
	Jaehoon Chung <jh80.chung@samsung.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 24, 2018 at 10:56 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Apr 24, 2018 at 10:50:58PM +0200, Arnd Bergmann wrote:
>> On Tue, Apr 24, 2018 at 10:32 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The only dependency is through Kconfig symbol (SOC_EXYNOS5440).  After
> applying 10/10, which removes SOC_EXYNOS5440, some automatic code
> testers can complain about non-existing Kconfig option.  That's not big
> issue because all this will go away so indeed we could take everything
> in one release.

Right, I wouldn't worry about that. Kbuild itself doesn't warn about missing
symbols, so this is only for helpful automated checks that tell us that there
is still some pending work.

       Arnd
