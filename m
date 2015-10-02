Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Oct 2015 13:45:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 5/5] clk: sunxi: mod1 clock support
Message-ID: <20151002204555.GA12338@codeaurora.org>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-6-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443512353-28073-6-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Maxime Ripard wrote:
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>

Is this include used?

> +	if (!gate)
> +		goto err_free_mux;
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	while (i < SUN4I_MOD1_MAX_PARENTS &&
> +	       (parents[i] = of_clk_get_parent_name(node, i)) != NULL)

Can we use of_clk_parent_fill() here?

> +		i++;
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
