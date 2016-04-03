Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: Add Oxford Semiconductor OXNAS Standard Clocks
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1459520791-13269-1-git-send-email-narmstrong@baylibre.com>
 <1459520791-13269-2-git-send-email-narmstrong@baylibre.com>
 <20160402005045.GX18567@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <5701210A.4060807@baylibre.com>
Date: Sun, 3 Apr 2016 15:56:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160402005045.GX18567@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/02/2016 02:50 AM, Stephen Boyd wrote:
> On 04/01, Neil Armstrong wrote:
>> +	if (!onecell_data)
>> +		return -ENOMEM;
>> +
>> +	regmap = syscon_node_to_regmap(of_get_parent(np));
> 
> Can we use dev_get_regmap(&pdev->dev.parent) here instead? I'd
> prefer device APIs over DT APIs here. 
> 

It will not work here since the parent node is a syscon, the call to syscon_node_to_regmap() will call of_syscon_register() and create the regmap, the dev_get_regmap() needs a proper platform device registered as regmap here.

Neil
