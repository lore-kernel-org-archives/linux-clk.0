Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mikko Perttunen <mperttunen@nvidia.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180711082104.27955-1-mperttunen@nvidia.com>
Cc: leonard.crestez@nxp.com, cyndis@kapsi.fi, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
References: <20180711082104.27955-1-mperttunen@nvidia.com>
Message-ID: <153253623910.48062.11060369743420676475@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: core: Potentially free connection id
Date: Wed, 25 Jul 2018 09:30:39 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Mikko Perttunen (2018-07-11 01:21:04)
> Patch "clk: core: Copy connection id" made it so that the connector
> id (con_id) is kstrdup_const'ed to cater to drivers that pass non-
> constant connection ids. The patch added the corresponding kfree_const
> to __clk_free_clk, but struct clk's can be freed also via __clk_put.
> Add the kfree_const call to __clk_put and add comments to both
> functions to remind that the logic in them should be kept in sync.
> =

> Fixes: 253160a8ad06 ("clk: core: Copy connection id")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Applied to clk-next
