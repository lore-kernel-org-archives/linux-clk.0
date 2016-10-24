Return-Path: <dan.carpenter@oracle.com>
Date: Mon, 24 Oct 2016 13:36:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ssantosh@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: keystone: Fix an error checking
Message-ID: <20161024103614.GW4469@mwanda>
References: <20161023081249.24668-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161023081249.24668-1-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Oct 23, 2016 at 10:12:49AM +0200, Christophe JAILLET wrote:
> clk_register_pll() can return ERR_PTR(-ENOMEM) so here the check against
> NULL only is not correct.
> 

Change the ERR_PTR(-ENOMEM) to a NULL instead.  When we mix error
pointers and NULL, what it means is that NULL should be treated as a
success case.  That's not the case here, so we should just return NULL
since we don't actually care about the error codes.

regards,
dan carpenter
