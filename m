Return-Path: <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: keystone: Fix an error checking
To: Lars-Peter Clausen <lars@metafoo.de>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20161023081249.24668-1-christophe.jaillet@wanadoo.fr>
 <20161024103614.GW4469@mwanda>
 <04b36f2d-69d5-110c-9ad8-a869a00ed2c9@metafoo.de>
Cc: ssantosh@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <0e4dca9a-28f4-c8e2-836d-0cb2bded5d52@wanadoo.fr>
Date: Mon, 24 Oct 2016 22:14:12 +0200
MIME-Version: 1.0
In-Reply-To: <04b36f2d-69d5-110c-9ad8-a869a00ed2c9@metafoo.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

Thanks for the review and comments.

I'll send another patch for that.
It will not be tagged as v2 because it will be part of a patch set for 
some other potential fixes.

CJ

Le 24/10/2016 à 12:41, Lars-Peter Clausen a écrit :
> On 10/24/2016 12:36 PM, Dan Carpenter wrote:
>> On Sun, Oct 23, 2016 at 10:12:49AM +0200, Christophe JAILLET wrote:
>>> clk_register_pll() can return ERR_PTR(-ENOMEM) so here the check against
>>> NULL only is not correct.
>>>
>> Change the ERR_PTR(-ENOMEM) to a NULL instead.
> In this particular case propagate the error returned by clk_register().
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
