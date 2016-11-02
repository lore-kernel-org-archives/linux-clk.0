Return-Path: <mw@semihalf.com>
MIME-Version: 1.0
In-Reply-To: <20161102003750.GL16026@codeaurora.org>
References: <1474789673-3837-1-git-send-email-mw@semihalf.com>
 <1474789673-3837-2-git-send-email-mw@semihalf.com> <20161102003750.GL16026@codeaurora.org>
From: Marcin Wojtas <mw@semihalf.com>
Date: Wed, 2 Nov 2016 11:59:51 +0100
Message-ID: <CAPv3WKfttYwYhWbHbSbeT7fq00rhnaSu5RODPnmDR8kOmBZo0g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] clk: mvebu: migrate CP110 system controller to
 clk_hw API and registration
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	=?UTF-8?Q?Gregory_Cl=C3=A9ment?= <gregory.clement@free-electrons.com>,
	nadavh@marvell.com, Lior Amsalem <alior@marvell.com>, Tomasz Nowicki <tn@semihalf.com>,
	"jaz@semihalf.com" <jaz@semihalf.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Thanks!

2016-11-02 1:37 GMT+01:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 09/25, Marcin Wojtas wrote:
>> Now that we have clk_hw based provider APIs to register clks, we
>> can get rid of struct clk pointers while registering clks in Armada
>> CP110 system controller driver. This commit introduces new
>> API and registration for all clocks in CP110 HW blocks.
>>
>> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
>> ---
>
> Applied to clk-next
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
