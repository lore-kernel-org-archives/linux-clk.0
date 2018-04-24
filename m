Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180424203239.21885-1-krzk@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 24 Apr 2018 22:50:58 +0200
Message-ID: <CAK8P3a2CZU1CYFt0fdVSFFnj2Wg=mUcC=yuWAW7zDO0u2Q2dUQ@mail.gmail.com>
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

On Tue, Apr 24, 2018 at 10:32 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
>
> Overview
> ========
> Let's continue the removal of old platforms. We already get rid of Exynos4212.
> Now it's time for Exynos5440.
>
> The Exynos5440 (quad-core A15 with GMAC, PCIe, SATA) was targeting
> server platforms but it did not make it to the market really.  There are
> no development boards with it and probably there are no real products
> neither.  The development for Exynos5440 ended in 2013 and since then
> the platform is in maintenance mode.
>
> The only development happening around it is the PCIe driver for Exynos5433
> (ARMv8). [1]
>
> Removing Exynos5440, makes our life slightly easier:
> 1. Less maintenance,
> 2. Smaller code, less quirks,
> 3. No need to preserve (imaginary) backward-compatibility for Exynos PCIe
>    driver (so it is easier to add support for Exynos5433).
>
>
> Because of point (3) above - I left the PCIe and PCIe PHY drivers intact.
>
>
> Dependencies
> ============
> I think about starting with removal of DTS in some kernel release (patch 1/10).
> Then all drivers can be removed/updated - subsystem maintainers can pick their
> patches freely.
>
> Finally, after getting rid of all Exynos5440 symbols, the last patch (10/10) will
> end in arm-soc tree.
>
>
> Any comments?

I don't see any hard dependency here, if this is all unused, I think we
can apply both patches 1 and 10 into arm-soc at the same time as merging
the other patches through the respective subsystem trees.

      Arnd
