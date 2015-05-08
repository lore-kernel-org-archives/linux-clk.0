Return-Path: <k.kozlowski@samsung.com>
Message-id: <554C3617.10906@samsung.com>
Date: Fri, 08 May 2015 13:05:43 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk samsung exynos5420 add CLK_RECALC_NEW_RATES flag to
 mout_apll and mout_kpll clock.
References: <1431020935-5025-1-git-send-email-linux.amoon@gmail.com>
 <CAJKOXPcCc8j=i5FPdF62bGKar74+4U=C9BPN9ar2j52Y8dSMwA@mail.gmail.com>
 <CANAwSgT8aa5svHgLbkNkSPXWT_hLez8e4cBws2ajEB9p56WHFA@mail.gmail.com>
In-reply-to: 
 <CANAwSgT8aa5svHgLbkNkSPXWT_hLez8e4cBws2ajEB9p56WHFA@mail.gmail.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08.05.2015 13:01, Anand Moon wrote:
> Hi Krysztof,
> 
> Actually the patch is based on https://lkml.org/lkml/2015/4/3/389
> I don't know how to measure the energy consumption when compared to
> cpufreq-exynos.

It does not have to be energy consumption. It may be something else
visible, like wrong values for clock rates. I don't know, it is your
patch so you should know *what is fixed* (or changed).

Best regards,
Krzysztof
