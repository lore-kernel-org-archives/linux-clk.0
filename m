Return-Path: <adrian.hunter@intel.com>
Subject: Re: [PATCH v5 06/12] mmc: sdhci-xenon: Add Marvell Xenon SDHC core
 functionality
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
 <3546f143091c121face8ecbcbf7f6a4c41d2cec7.1484154449.git-series.gregory.clement@free-electrons.com>
 <CAPDyKFrwxix4zY4a1x9u6jh_gPfKTsaLnD8b8crum=pc5CN3AA@mail.gmail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ziji Hu <huziji@marvell.com>, Jimmy Xu <zmxu@marvell.com>,
 Jisheng Zhang <jszhang@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Ryan Gao <ygao@marvell.com>, Doug Jones <dougj@marvell.com>,
 Victor Gu <xigu@marvell.com>, "Wei(SOCP) Liu" <liuw@marvell.com>,
 Wilson Ding <dingwei@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>, Hanna Hawa <hannah@marvell.com>,
 Kostya Porotchkin <kostap@marvell.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Message-ID: <2e67332d-d8c3-fd24-1f81-72675a09927a@intel.com>
Date: Thu, 26 Jan 2017 14:39:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrwxix4zY4a1x9u6jh_gPfKTsaLnD8b8crum=pc5CN3AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 26/01/17 12:50, Ulf Hansson wrote:
> On 11 January 2017 at 18:19, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>> +                       priv->init_card_type = MMC_TYPE_MMC;
>> +                       mmc->caps |= MMC_CAP_NONREMOVABLE;
>> +
>> +                       /*
>> +                        * Force to clear BUS_TEST to
>> +                        * skip bus_test_pre and bus_test_post
>> +                        */
>> +                       mmc->caps &= ~MMC_CAP_BUS_WIDTH_TEST;
>> +                       mmc->caps2 |= MMC_CAP2_HC_ERASE_SZ |
> 
> This cap is a bit strange. It was added several years ago by Adrian
> Hunter, but I am wondering about the reason to why it's needed.
> 

MMC_CAP2_HC_ERASE_SZ relates to EXT-CSD ERASE_GROUP_DEF.

I think it was added to enable people to choose whether they wanted a large
or small erase granularity.  That probably doesn't matter if the card
supports TRIM.
