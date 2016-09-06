Return-Path: <baruch@tkos.co.il>
Date: Tue, 6 Sep 2016 20:59:51 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Marcin Wojtas <mw@semihalf.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	mturquette@baylibre.com, thomas.petazzoni@free-electrons.com,
	andrew@lunn.ch, jason@lakedaemon.net, tn@semihalf.com,
	stable@vger.kernel.org, nadavh@marvell.com, alior@marvell.com,
	jaz@semihalf.com, gregory.clement@free-electrons.com,
	sebastian.hesselbarth@gmail.com
Subject: Re: [PATCH v2 2/3] clk: mvebu: dynamically allocate resources in
 Armada CP110 system controller
Message-ID: <20160906175951.etybwtilfvyclrdb@tarshish>
References: <1473183117-11889-1-git-send-email-mw@semihalf.com>
 <1473183117-11889-3-git-send-email-mw@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473183117-11889-3-git-send-email-mw@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Marcin,

On Tue, Sep 06, 2016 at 07:31:56PM +0200, Marcin Wojtas wrote:
> +	cp110_clks = devm_kcalloc(&pdev->dev, sizeof(struct clk *),
> +				  CP110_CLK_NUM, GFP_KERNEL);
> +	if (!cp110_clks)
> +		return PTR_ERR(cp110_clks);

PTR_ERR(NULL) translates to 0. Should probably just return -ENOMEM.

> +	cp110_clk_data = devm_kzalloc(&pdev->dev,
> +				      sizeof(*cp110_clk_data),
> +				      GFP_KERNEL);
> +	if (!cp110_clk_data)
> +		return PTR_ERR(cp110_clk_data);

Ditto.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
