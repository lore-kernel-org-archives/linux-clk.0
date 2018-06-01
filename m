Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180524052341.12422-1-chris.packham@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
References: <20180524052341.12422-1-chris.packham@alliedtelesis.co.nz>
Message-ID: <152788239546.225090.5366434047539311619@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: mvebu: use correct bit for 98DX3236 NAND
Date: Fri, 01 Jun 2018 12:46:35 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Chris Packham (2018-05-23 22:23:41)
> The correct fieldbit value for the NAND PLL reload trigger is 27.
> =

> Fixes: commit e120c17a70e5 ("clk: mvebu: support for 98DX3236 SoC")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Applied to clk-next
