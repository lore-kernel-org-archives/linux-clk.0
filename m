Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Nov 2017 15:53:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: maxime.ripard@free-electrons.com, wens@csie.org,
	mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: sunxi-ng: a83t: Fix i2c buses bits
Message-ID: <20171114235354.GG11955@codeaurora.org>
References: <20171105165134.5199-1-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20171105165134.5199-1-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/05, Mylène Josserand wrote:
> i2c1 and i2c2 bits for CCU are not bit 0 but bit 1 and bit 2.
> Because of that, the i2c0 (bit 0) was not correctly configured.
> Fixed the correct bits for i2c1 and i2c2.
> 
> Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
