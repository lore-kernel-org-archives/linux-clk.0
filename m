Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Andrew Bresticker <abrestic@chromium.org>, linux-clk@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de, Georgi Djakov <georgi.djakov@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Santosh Shilimkar <ssantosh@kernel.org>, Viresh Kumar <viresh.linux@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Barry Song <baohua@kernel.org>, Alex Elder <elder@linaro.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@opensource.altera.com>, linux-kernel@vger.kernel.org, emilio@elopez.com.ar, dianders@chromium.org, Jason Cooper <jason@lakedaemon.net>, Chao Xie <chao.xie@marvell.com>, Tero Kristo <t-kristo@ti.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, mturquette@linaro.org, sboyd@codeaurora.org
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
Date: Sat, 25 Apr 2015 15:44:11 +0200
Message-ID: <8220650.vMaWphVIuC@diego>
In-Reply-To: <380631359.469897.1429964620007.JavaMail.open-xchange@oxbaltgw01.schlund.de>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de> <380631359.469897.1429964620007.JavaMail.open-xchange@oxbaltgw01.schlund.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

Am Samstag, 25. April 2015, 14:23:39 schrieb Stefan Wahren:
> > Heiko Stuebner <heiko@sntech.de> hat am 22. April 2015 um 22:53
> > geschrieben:
> > 
> > 
> > Using orphan clocks can introduce strange behaviour as they don't have
> > rate information at all and also of course don't track
> > 
> > [...]
> > 
> > 
> > As this changes the behaviour for orphan clocks, it would of course
> > benefit from more testing than on my Rockchip boards. To keep the
> > recipent-list reasonable and not spam to much I selected one (the topmost)
> > from the get_maintainer output of each drivers/clk entry.
> > Hopefully some will provide Tested-by-tags :-)
> 
> excuse me for my naive question, but what kind of tests do you expect
> (beside applying the patches)?

just a "everything that worked before still works" :-)

Using orphaned clocks should already produce strange issues most of the time - 
for example I see clk_disable mismatches when suspending a rk3288 board, 
before this patchset.

But nevertheless we now disallow the usage of orphaned clocks completely while 
before it was possible to knowingly/unknowingly use them.

And while hopefully most drivers should handle an EPROBE_DEFER from clk_get 
just fine, there may still be one or two lurking around that would need fixing 
then ;-)


Heiko
