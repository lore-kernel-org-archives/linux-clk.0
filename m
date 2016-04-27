Return-Path: <w.egorov@phytec.de>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with a
 single range" to the regulator tree
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>
References: <E1aukkg-0007km-6s@debutante> <2754883.PYP7KbpM33@diego>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, a.zummo@towertech.it, pawel.moll@arm.com, rtc-linux@googlegroups.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, alexandre.belloni@free-electrons.com, dianders@chromium.org, galak@codeaurora.org, zyw@rock-chips.com, lee.jones@linaro.org, linux-clk@vger.kernel.org
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <57205DC2.7070506@phytec.de>
Date: Wed, 27 Apr 2016 08:35:46 +0200
MIME-Version: 1.0
In-Reply-To: <2754883.PYP7KbpM33@diego>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 26.04.2016 21:33, Heiko St=FCbner wrote:
> Am Montag, 25. April 2016, 18:56:54 schrieb Mark Brown:
>> The patch
>>
>>    regulator: rk808: remove linear range definitions with a single range
>>
>> has been applied to the regulator tree at
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
> with this patch applied, 4.6.0-rc5-next-20160426 fails to boot on=20
> rk3288-veyron devices with the bug below. Reverting this one patch
> results in the system booting again:
>
This is because I missed to add the correct ops for LDO=5FREG3 in this patc=
h.
