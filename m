Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53608 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752677AbdDETnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2017 15:43:15 -0400
Date: Wed, 5 Apr 2017 12:43:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, carlo@caione.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] clk: meson-gxbb: Add MALI clocks
Message-ID: <20170405194313.GM18246@codeaurora.org>
References: <1490177935-9646-1-git-send-email-narmstrong@baylibre.com>
 <1490177935-9646-3-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490177935-9646-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/22, Neil Armstrong wrote:
> +/*
> + * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
> + * muxed by a glitch-free switch.
> + */
> +
> +static u32 mux_table_mali_0_1[] = {0, 1, 2, 3, 4, 5, 6, 7};
> +static const char *gxbb_mali_0_1_parent_names[] = {

const char * const?

> +	"xtal", "gp0_pll", "mpll2", "mpll1", "fclk_div7",
> +	"fclk_div4", "fclk_div3", "fclk_div5"
> +};
> +
[..]
> +	},
> +};
> +
> +static u32 mux_table_mali[] = {0, 1};
> +static const char *gxbb_mali_parent_names[] = {

It's a pattern, so I can only suspect something else is going on.

> +	"mali_0", "mali_1"
> +};
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
