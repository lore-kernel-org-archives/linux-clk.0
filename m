Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jimmy Xu <zmxu@marvell.com>,  Andrew Lunn <andrew@lunn.ch>,  "linux-mmc\@vger.kernel.org" <linux-mmc@vger.kernel.org>,  Mike Turquette <mturquette@baylibre.com>,  "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,  Nadav Haklai <nadavh@marvell.com>,  Ziji Hu <huziji@marvell.com>,  Victor Gu <xigu@marvell.com>,  Doug Jones <dougj@marvell.com>,  linux-clk <linux-clk@vger.kernel.org>,  Jisheng Zhang <jszhang@marvell.com>,  Yehuda Yitschak <yehuday@marvell.com>,  Marcin Wojtas <mw@semihalf.com>,  Kostya Porotchkin <kostap@marvell.com>,  Hanna Hawa <hannah@marvell.com>,  Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,  Jason Cooper <jason@lakedaemon.net>,  Rob Herring <robh+dt@kernel.org>,  Ryan Gao <ygao@marvell.com>,  "Wei\(SOCP\) Liu" <liuw@marvell.com>,  "linux-arm-kernel\@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,  Stephen B
 oyd <sboyd@codeaurora.org>,  Adrian Hunter <adrian.hunter@intel.com>,  Wilson Ding <dingwei@marvell.com>
Subject: Re: [PATCH v6 00/14] mmc: Add support to Marvell Xenon SD Host Controller
References: <cover.ff78bebe0384f650a51e5e6f0f1dca6e7894b53b.1487091464.git-series.gregory.clement@free-electrons.com>
	<87y3x0ajdv.fsf@free-electrons.com>
	<CAPDyKFqXQmuxWFZwcnTgQcKU_t5MKCtBj6s+tv5gzVWS11x0qA@mail.gmail.com>
Date: Fri, 10 Mar 2017 11:15:35 +0100
In-Reply-To: <CAPDyKFqXQmuxWFZwcnTgQcKU_t5MKCtBj6s+tv5gzVWS11x0qA@mail.gmail.com>
	(Ulf Hansson's message of "Mon, 20 Feb 2017 20:32:58 +0100")
Message-ID: <87innhjv3s.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Ulf,
=20
 On lun., f=C3=A9vr. 20 2017, Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On 20 February 2017 at 17:59, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>> Hi Ulf,
>>
>>  On mar., f=C3=A9vr. 14 2017, Gregory CLEMENT <gregory.clement@free-elec=
trons.com> wrote:
>>
>>> Hello,
>>>
>>> This the sixth version of the series adding support for the SDHCI
>>> Xenon controller. It can be currently found on the Armada 37xx and the
>>> Armada 7K/8K but will be also used in more Marvell SoC (and not only
>>> the mvebu ones actually).
>>>
>>> Most of the following changes had been discussed on the mailing list,
>>> except the new compatible string.
>>>
>>
>> I think that with this version we addressed all the concerns expressed
>> about the previous version. Do you think that you will be able to apply
>> this series for 4.11 or do you still see any issues?
>>
>> Thanks,
>>
>> Gregory
>
> We are in the merge window for v4.11, so new material is out of the
> question. I am preparing the PR to Linus as this very moment.

v4.11-rc1 was released last week, do you want that I rebase the series
ontop of it ?

On our side we made several tests of this version of the driver on
various hardware and everything works as expected. We only notice some
configuration to update for the dts on some board but it didn't impact
the driver itself.

Gregory


>
> Anyway, I will look into the series as soon as I can.
>
> Kind regards
> Uffe
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
