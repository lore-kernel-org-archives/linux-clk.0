Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Apr 2016 18:27:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>,
	Hanna Hawa <hannah@marvell.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] clk: mvebu: new driver for Armada AP806 system
 controller
Message-ID: <20160402012731.GE18567@codeaurora.org>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459070777-18049-4-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1459070777-18049-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/27, Thomas Petazzoni wrote:
> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
> new file mode 100644
> index 0000000..c33c209
> --- /dev/null
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -0,0 +1,106 @@
> +
> +#define pr_fmt(fmt) "ap806-system-controller: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/clk.h>

Is this used?

> +#include <linux/clk-provider.h>
> +#include <linux/io.h>

Is this used?

> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
> +
> +#define AP806_SAR_REG			0x400
> +#define AP806_SAR_CLKFREQ_MODE_MASK	0x1f
> +
> +#define AP806_CLK_NUM 			4
> +
> +static struct clk *ap806_clks[AP806_CLK_NUM];
> +
> +static struct clk_onecell_data ap806_clk_data = {
> +	.clks = ap806_clks,
> +	.clk_num = AP806_CLK_NUM,
> +};
> +
> +static void __init ap806_syscon_clk_init(struct device_node *np)

Can this be a platform driver instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
