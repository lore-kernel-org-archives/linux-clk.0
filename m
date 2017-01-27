Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,  "linux-mmc\@vger.kernel.org" <linux-mmc@vger.kernel.org>,  Jason Cooper <jason@lakedaemon.net>,  Andrew Lunn <andrew@lunn.ch>,  Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,  "linux-arm-kernel\@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,  Mike Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  linux-clk <linux-clk@vger.kernel.org>,  "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,  Rob Herring <robh+dt@kernel.org>,  "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,  Ziji Hu <huziji@marvell.com>,  Jimmy Xu <zmxu@marvell.com>,  Jisheng Zhang <jszhang@marvell.com>,  Nadav Haklai <nadavh@marvell.com>,  Ryan Gao <ygao@marvell.com>,  Doug Jones <dougj@marvell.com>,  Victor Gu <xigu@marvell.com>,  "Wei\(SOCP\) Liu" <liuw@marvell.com>,  Wilson Ding <dingwei@marvell.com>,  Yehuda Yitschak <yehuday@marvell.com>,  Ma
  rcin Wojtas <mw@semihalf.com>,  Hanna Hawa <hannah@marvell.com>,  Kostya Porotchkin <kostap@marvell.com>
Subject: Re: [PATCH v5 05/12] dt: bindings: Add bindings for Marvell Xenon SD Host Controller
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
	<89c95d0084da6ad7132caa54ca66eb619d8a5090.1484154449.git-series.gregory.clement@free-electrons.com>
	<CAPDyKFrCxk37uVZ4wM-=iwX3-Cn9j+uh1KneJoopVzia2nKTVA@mail.gmail.com>
	<87fuk4yg1i.fsf@free-electrons.com>
	<CAPDyKFo-hpLd3W0zWykdg0swuciBeL=Cy9cur_0RoG8jApOh3w@mail.gmail.com>
Date: Fri, 27 Jan 2017 18:25:56 +0100
In-Reply-To: <CAPDyKFo-hpLd3W0zWykdg0swuciBeL=Cy9cur_0RoG8jApOh3w@mail.gmail.com>
	(Ulf Hansson's message of "Fri, 27 Jan 2017 16:36:36 +0100")
Message-ID: <87bmuswh23.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Ulf,
 
 On ven., janv. 27 2017, Ulf Hansson <ulf.hansson@linaro.org> wrote:

>>
>> But I am curious to know why do you think we could use it without any
>> need. Are you aware of some abuse of this property?
>
> Yes.
>

Actually I was hopping that you point some examples :)

But as you point mmc-ddr-3_3v I found my answers here:
http://www.spinics.net/lists/linux-mmc/msg38602.html

>>
>>>
>>> Perhaps you can elaborate exactly why it makes sense for your case. Or
>>> perhaps we already discussed this, in either case, please re-fresh my
>>> mind.
>>
>> For instance we need it now on the 7040DB board which does not have the
>> 1.8V signal voltage available.
>
> It it's better to describe what the controller/board support, instead
> of what it doesn't.
>
> I think you should be able to use other existing mmc DT bindings
> (perhaps also you need the brand new "mmc-ddr-3_3v"), instead of the
> "no-1-8-v".

OK I will try with this one. And if it works, I wonder if it worth
mentioning it as it is also part of the mmc binding.

Gregory

>
> Kind regards
> Uffe

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
