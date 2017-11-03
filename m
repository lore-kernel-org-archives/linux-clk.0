Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Nov 2017 08:11:00 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: maxime.ripard@free-electrons.com, wens@csie.org,
	mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: a83t: Fix i2c buses bits
Message-ID: <20171103151100.GR11011@codeaurora.org>
References: <20171103105747.26335-1-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20171103105747.26335-1-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/03, Mylène Josserand wrote:
> i2c1 and i2c2 bits for CCU are not bit 0 but bit 1 and bit 2.
> Because of that, the i2c0 (bit 0) was not correctly configured.
> Fixed the correct bits for i2c1 and i2c2.
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
> ---

Please add a Fixes tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
