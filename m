Return-Path: <krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <5AE12E4A.90907@samsung.com>
References: <20180424203239.21885-1-krzk@kernel.org> <CGME20180424203603epcas5p4cdd2039eabe7039e4daf286ed4c1ecc0@epcas5p4.samsung.com>
 <20180424203239.21885-7-krzk@kernel.org> <5AE12E4A.90907@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 26 Apr 2018 09:59:15 +0200
Message-ID: <CAJKOXPc4oDAFThxVszOrCr+yEaK85W3AeYTcLFyGm0-6TLyZyw@mail.gmail.com>
Subject: Re: [RFC 06/10] thermal: samsung: Remove support for Exynos5440
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>,
	Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 26, 2018 at 3:41 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote=
:
> Hi Krzysztof,
>
> On 2018=EB=85=84 04=EC=9B=94 25=EC=9D=BC 05:32, Krzysztof Kozlowski wrote=
:
>> The Exynos5440 is not actively developed, there are no development
>> boards available and probably there are no real products with it.
>> Remove wide-tree support for Exynos5440.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  .../devicetree/bindings/thermal/exynos-thermal.txt |  14 +-
>>  drivers/thermal/samsung/exynos_tmu.c               | 155 +-------------=
-------
>>  drivers/thermal/samsung/exynos_tmu.h               |   1 -
>>  3 files changed, 4 insertions(+), 166 deletions(-)
>
>
> After applied this patch, I tested the build and found out
> 'exynos5440' keyword. There is one comment including 'exynos5440' as foll=
owing:
>
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsu=
ng/exynos_tmu.c
> index f92f470bce21..cb525228cfe1 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -943,7 +943,7 @@ static void exynos4210_tmu_clear_irqs(struct exynos_t=
mu_data *data)
>          * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
>          * states that INTCLEAR register has a different placing of bits
>          * responsible for FALL IRQs than INTSTAT register.  Exynos5420
> -        * and Exynos5440 documentation is correct (Exynos4210 doesn't
> +        * documentation is correct (Exynos4210 doesn't
>          * support FALL IRQs at all).
>          */
>         writel(val_irq, data->base + tmu_intclear);
>
> After removing it, looks good to me.
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks, I left this comment intentionally as it has some meaning even
when Exynos5440 is not supported.

Best regards,
Krzysztof
