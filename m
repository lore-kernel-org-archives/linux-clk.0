Return-Path: <huziji@marvell.com>
Subject: Re: [PATCH v7 06/13] dt: bindings: Add bindings for Marvell Xenon SD
 Host Controller
To: Rob Herring <robh@kernel.org>,
        Gregory CLEMENT
	<gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
 <ecacddaa5d38b678e1c8c95b56f65f4a39527ead.1490886907.git-series.gregory.clement@free-electrons.com>
 <20170403161926.wfj7foddu33gxuae@rob-hp-laptop>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        Jason Cooper
	<jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mike Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jimmy Xu <zmxu@marvell.com>, Jisheng Zhang
	<jszhang@marvell.com>,
        Nadav Haklai <nadavh@marvell.com>, Ryan Gao
	<ygao@marvell.com>,
        Doug Jones <dougj@marvell.com>, Victor Gu
	<xigu@marvell.com>,
        "Wei(SOCP) Liu" <liuw@marvell.com>, Wilson Ding
	<dingwei@marvell.com>,
        Yehuda Yitschak <yehuday@marvell.com>,
        Marcin Wojtas
	<mw@semihalf.com>, Hanna Hawa <hannah@marvell.com>,
        Kostya Porotchkin
	<kostap@marvell.com>
From: Hu Ziji <huziji@marvell.com>
Message-ID: <df6d0972-21ce-589f-d786-7334f526867a@marvell.com>
Date: Tue, 4 Apr 2017 01:07:26 +0800
MIME-Version: 1.0
In-Reply-To: <20170403161926.wfj7foddu33gxuae@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Rob,

On 2017/4/4 0:19, Rob Herring wrote:
> ----------------------------------------------------------------------
> On Thu, Mar 30, 2017 at 05:22:58PM +0200, Gregory CLEMENT wrote:
>> From: Hu Ziji <huziji@marvell.com>
>>
>> Marvell Xenon SDHC can support eMMC/SD/SDIO.
>> Add Xenon-specific properties.
>> Also add properties for Xenon PHY setting.
>>
>> Signed-off-by: Hu Ziji <huziji@marvell.com>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.txt | 170 +++++++-
>>  1 file changed, 170 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.txt
> 
> I acked v6 and it seems like a minor change, though I had to search for 
> both because there is no revision history nor explanation why you didn't 
> add my ack.
>

	Sorry for missing your ACK.

	I add a few but important comments on common Xenon power implementations
	in the examples. It is recorded in the cover letter.
	v6->v7:
	 - Add comments on vqmmc and vmmc in examples in dt binding doc.

	I was a little unsure if we can still add your ACK after adding the comment.
 	We will add your ACK back if we have to release another version later.

	Thank you.

Best regards,
Hu Ziji

> Acked-by: Rob Herring <robh@kernel.org> 
> 
