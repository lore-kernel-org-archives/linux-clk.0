Return-Path: <huziji@marvell.com>
Subject: Re: [PATCH v6 08/14] mmc: sdhci-xenon: Add Marvell Xenon SDHC core
 functionality
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Gregory CLEMENT
	<gregory.clement@free-electrons.com>
References: <cover.ff78bebe0384f650a51e5e6f0f1dca6e7894b53b.1487091464.git-series.gregory.clement@free-electrons.com>
 <cb885ae19e7c467908cdaa1f1cc8d95a7217d663.1487091464.git-series.gregory.clement@free-electrons.com>
 <CAPDyKFpH+RGAZGoVCuCOKJ2iEa+Y=cNNcM-uKhkYaTpmogXCKA@mail.gmail.com>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>, Andrew Lunn
	<andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
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
	<zmxu@marvell.com>, Jisheng Zhang <jszhang@marvell.com>,
        Nadav Haklai
	<nadavh@marvell.com>, Ryan Gao <ygao@marvell.com>,
        Doug Jones
	<dougj@marvell.com>, Victor Gu <xigu@marvell.com>,
        "Wei(SOCP) Liu"
	<liuw@marvell.com>, Wilson Ding <dingwei@marvell.com>,
        Yehuda Yitschak
	<yehuday@marvell.com>,
        Marcin Wojtas <mw@semihalf.com>, Hanna Hawa
	<hannah@marvell.com>,
        Kostya Porotchkin <kostap@marvell.com>
From: Ziji Hu <huziji@marvell.com>
Message-ID: <10855817-e693-e007-9499-c4e97936fadb@marvell.com>
Date: Wed, 15 Mar 2017 21:58:43 +0800
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpH+RGAZGoVCuCOKJ2iEa+Y=cNNcM-uKhkYaTpmogXCKA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Ulf,

On 2017/3/15 21:11, Ulf Hansson wrote:
> On 14 February 2017 at 18:01, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>> From: Hu Ziji <huziji@marvell.com>
<snip>
>> +config MMC_SDHCI_XENON
>> +       tristate "Marvell Xenon eMMC/SD/SDIO SDHCI driver"
>> +       depends on MMC_SDHCI_PLTFM
>> +       help
>> +         This selects Marvell Xenon eMMC/SD/SDIO SDHCI.
>> +         If you have a machine with integrated Marvell Xenon SDHC IP,
> 
> /s/SDHC/SDHCI
> 

	Sorry. I don't get your point.
	Could you please give more detailed comments?

>> +         say Y or M here.
>> +         If unsure, say N.
>> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
>> index ccc9c4cba154..b0a2ab4b256e 100644
>> --- a/drivers/mmc/host/Makefile
>> +++ b/drivers/mmc/host/Makefile
>> @@ -82,3 +82,6 @@ obj-$(CONFIG_MMC_SDHCI_BRCMSTB)               += sdhci-brcmstb.o
>>  ifeq ($(CONFIG_CB710_DEBUG),y)
>>         CFLAGS-cb710-mmc        += -DDEBUG
>>  endif
>> +
>> +obj-$(CONFIG_MMC_SDHCI_XENON)  += sdhci-xenon-driver.o
>> +sdhci-xenon-driver-y           += sdhci-xenon.o
> 
> Why not only this:
> obj-$(CONFIG_MMC_SDHCI_XENON) += sdhci-xenon.o
> 

	Yes. Will try.

>> diff --git a/drivers/mmc/host/sdhci-xenon.c b/drivers/mmc/host/sdhci-xenon.c
>> new file mode 100644
<snip>
> 
> ff --git a/drivers/mmc/host/sdhci-xenon.h b/drivers/mmc/host/sdhci-xenon.h
>> new file mode 100644
>> index 000000000000..69de711db9eb
>> --- /dev/null
>> +++ b/drivers/mmc/host/sdhci-xenon.h
> 
> You should probably put all this in the c-file instead. That is how
> most other sdhci variants does it.
> 

	Unfortunately, we have some registers like XENON_SLOT_EMMC_CTRL
	which are accessed by both sdhci-xenon.c and sdhci-xenon-phy.c

> [...]
> 
> Overall this looks good to me, however I think Adrian needs to have a
> quick look as well.
> 
> One additional very minor nitpick. Perhaps you can align on the
> function names prefix, as those currently varies between "whatever",
> "xenon_" and "sdhci_xenon_".
> 
	Sure. Will fix them as you request.

	Thank you.

Best regards,
Hu Ziji

> Kind regards
> Uffe
> 
