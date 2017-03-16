Return-Path: <jszhang@marvell.com>
Date: Thu, 16 Mar 2017 10:24:17 +0800
From: Jisheng Zhang <jszhang@marvell.com>
To: Ziji Hu <huziji@marvell.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Gregory CLEMENT
	<gregory.clement@free-electrons.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>, "Andrew
 Lunn" <andrew@lunn.ch>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Mike Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jimmy Xu
	<zmxu@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
        Ryan Gao
	<ygao@marvell.com>, Doug Jones <dougj@marvell.com>,
        Victor Gu
	<xigu@marvell.com>, "Wei(SOCP) Liu" <liuw@marvell.com>,
        Wilson Ding
	<dingwei@marvell.com>,
        Yehuda Yitschak <yehuday@marvell.com>,
        Marcin Wojtas
	<mw@semihalf.com>, Hanna Hawa <hannah@marvell.com>,
        Kostya Porotchkin
	<kostap@marvell.com>
Subject: Re: [PATCH v6 08/14] mmc: sdhci-xenon: Add Marvell Xenon SDHC core
 functionality
Message-ID: <20170316102417.0909bccc@xhacker>
In-Reply-To: <10855817-e693-e007-9499-c4e97936fadb@marvell.com>
References: <cover.ff78bebe0384f650a51e5e6f0f1dca6e7894b53b.1487091464.git-series.gregory.clement@free-electrons.com>
	<cb885ae19e7c467908cdaa1f1cc8d95a7217d663.1487091464.git-series.gregory.clement@free-electrons.com>
	<CAPDyKFpH+RGAZGoVCuCOKJ2iEa+Y=cNNcM-uKhkYaTpmogXCKA@mail.gmail.com>
	<10855817-e693-e007-9499-c4e97936fadb@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-clk.vger.kernel.org>

Hi Ziji

On Wed, 15 Mar 2017 21:58:43 +0800 Ziji Hu wrote:

> Hi Ulf,
> 
> On 2017/3/15 21:11, Ulf Hansson wrote:
> > On 14 February 2017 at 18:01, Gregory CLEMENT
> > <gregory.clement@free-electrons.com> wrote:  
> >> From: Hu Ziji <huziji@marvell.com>  
> <snip>
> >> +config MMC_SDHCI_XENON
> >> +       tristate "Marvell Xenon eMMC/SD/SDIO SDHCI driver"
> >> +       depends on MMC_SDHCI_PLTFM
> >> +       help
> >> +         This selects Marvell Xenon eMMC/SD/SDIO SDHCI.
> >> +         If you have a machine with integrated Marvell Xenon SDHC IP,  
> > 
> > /s/SDHC/SDHCI
> >   
> 
> 	Sorry. I don't get your point.
> 	Could you please give more detailed comments?

Ulf want you to s/SDHC/SDHCI in the line "If you have .....", I.E
change the line to:
If you have a machine with integrated Marvell Xenon SDHCI IP,

Thanks,
Jisheng
