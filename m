Return-Path: <w.egorov@phytec.de>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with a
 single range" to the regulator tree
To: Mark Brown <broonie@kernel.org>
References: <E1aukkg-0007km-6s@debutante> <2754883.PYP7KbpM33@diego>
 <57205DC2.7070506@phytec.de> <20160427135048.GQ3217@sirena.org.uk>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, linux-rockchip@lists.infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org, a.zummo@towertech.it, pawel.moll@arm.com, rtc-linux@googlegroups.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, alexandre.belloni@free-electrons.com, dianders@chromium.org, galak@codeaurora.org, zyw@rock-chips.com, lee.jones@linaro.org, linux-clk@vger.kernel.org
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <5720C750.3050104@phytec.de>
Date: Wed, 27 Apr 2016 16:06:08 +0200
MIME-Version: 1.0
In-Reply-To: <20160427135048.GQ3217@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 27.04.2016 15:50, Mark Brown wrote:
> On Wed, Apr 27, 2016 at 08:35:46AM +0200, Wadim Egorov wrote:
>> On 26.04.2016 21:33, Heiko St=FCbner wrote:
>>> with this patch applied, 4.6.0-rc5-next-20160426 fails to boot on=20
>>> rk3288-veyron devices with the bug below. Reverting this one patch
>>> results in the system booting again:
>> This is because I missed to add the correct ops for LDO=5FREG3 in this p=
atch.
> Any ETA on a fix or should I revert?
this patch

http://lists.infradead.org/pipermail/linux-rockchip/2016-April/008674.html

will fix the issue.

The regulator patches from v4 are based on top of
commit 4a5ed8c1adc3 ("regulator: rk808: remove unused rk808=5Freg=5Fops=5Fr=
anges")
