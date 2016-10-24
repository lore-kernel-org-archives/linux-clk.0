Return-Path: <lars@metafoo.de>
Subject: Re: [PATCH] clk: keystone: Fix an error checking
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20161023081249.24668-1-christophe.jaillet@wanadoo.fr>
 <20161024103614.GW4469@mwanda>
Cc: ssantosh@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <04b36f2d-69d5-110c-9ad8-a869a00ed2c9@metafoo.de>
Date: Mon, 24 Oct 2016 12:41:57 +0200
MIME-Version: 1.0
In-Reply-To: <20161024103614.GW4469@mwanda>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10/24/2016 12:36 PM, Dan Carpenter wrote:
> On Sun, Oct 23, 2016 at 10:12:49AM +0200, Christophe JAILLET wrote:
>> clk_register_pll() can return ERR_PTR(-ENOMEM) so here the check against
>> NULL only is not correct.
>>
> 
> Change the ERR_PTR(-ENOMEM) to a NULL instead.

In this particular case propagate the error returned by clk_register().
