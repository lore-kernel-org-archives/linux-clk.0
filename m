Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:41335 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbFZPbe (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 11:31:34 -0400
Message-ID: <558D7053.1000106@broadcom.com>
Date: Fri, 26 Jun 2015 08:31:31 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <linux-clk@vger.kernel.org>
Subject: Re: clk: iproc: add initial common clock support
References: <20150626102010.GA32189@mwanda>
In-Reply-To: <20150626102010.GA32189@mwanda>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Dan,

On 6/26/2015 3:20 AM, Dan Carpenter wrote:
> Hello Ray Jui,
> 
> The patch 5fe225c105fd: "clk: iproc: add initial common clock
> support" from May 5, 2015, leads to the following static checker
> warning:
> 
> 	drivers/clk/bcm/clk-iproc-asiu.c:229 iproc_asiu_setup()
> 	warn: did you mean to pass the address of 'clk_name'
> 
> drivers/clk/bcm/clk-iproc-asiu.c
>    218          for (i = 0; i < num_clks; i++) {
>    219                  struct clk_init_data init;
>    220                  struct clk *clk;
>    221                  const char *parent_name;
>    222                  struct iproc_asiu_clk *asiu_clk;
>    223                  const char *clk_name;
>    224  
>    225                  clk_name = kzalloc(IPROC_CLK_NAME_LEN, GFP_KERNEL);
> 
> We shouldn't do this allocation.  of_property_read_string_index() will
> just re-assign "clk_name" so the memory is leaked.
> 

I'll submit a patch to fix this. Thanks.

>    226                  if (WARN_ON(!clk_name))
>    227                          goto err_clk_register;
>    228  
>    229                  ret = of_property_read_string_index(node, "clock-output-names",
>    230                                                      i, &clk_name);
>    231                  if (WARN_ON(ret))
>    232                          goto err_clk_register;
>    233  
>    234                  asiu_clk = &asiu->clks[i];
>    235                  asiu_clk->name = clk_name;
>    236                  asiu_clk->asiu = asiu;
>    237                  asiu_clk->div = div[i];
>    238                  asiu_clk->gate = gate[i];
>    239                  init.name = clk_name;
>    240                  init.ops = &iproc_asiu_ops;
>    241                  init.flags = 0;
>    242                  parent_name = of_clk_get_parent_name(node, 0);
>    243                  init.parent_names = (parent_name ? &parent_name : NULL);
>    244                  init.num_parents = (parent_name ? 1 : 0);
>    245                  asiu_clk->hw.init = &init;
> 
> 
> regards,
> dan carpenter
> 
