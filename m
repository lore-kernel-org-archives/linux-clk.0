Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1435756238-845-2-git-send-email-b.zolnierkie@samsung.com>
References: <1435756238-845-1-git-send-email-b.zolnierkie@samsung.com>
	<1435756238-845-2-git-send-email-b.zolnierkie@samsung.com>
Date: Thu, 2 Jul 2015 13:14:03 +0200
Message-ID: <CABxcv=kypxFJeFFciaz5=+M-AcFbtS1OEXMzRWMM+Zt272THjQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] clk: samsung: exynos5250: add cpu clock
 configuration data and instantiate cpu clock
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	"linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Bartlomiej,

On Wed, Jul 1, 2015 at 3:10 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> With the addition of the new Samsung specific cpu-clock type, the
> arm clock can be represented as a cpu-clock type. Add the CPU clock
> configuration data and instantiate the CPU clock type for Exynos5250.
>
> Changes by Bartlomiej:
> - split Exynos5250 support from the original patch
> - moved E5250_CPU_DIV[0,1]() macros to clk-exynos5250.c
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c   | 31 +++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos5250.h |  1 +
>  2 files changed, 32 insertions(+)

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>

and on an Exynos5250 Snow Chromebook:

Tested-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
