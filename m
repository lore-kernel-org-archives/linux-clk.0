Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:37902 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680AbbFZKUW (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:20:22 -0400
Date: Fri, 26 Jun 2015 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rjui@broadcom.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: iproc: add initial common clock support
Message-ID: <20150626102010.GA32189@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Ray Jui,

The patch 5fe225c105fd: "clk: iproc: add initial common clock
support" from May 5, 2015, leads to the following static checker
warning:

	drivers/clk/bcm/clk-iproc-asiu.c:229 iproc_asiu_setup()
	warn: did you mean to pass the address of 'clk_name'

drivers/clk/bcm/clk-iproc-asiu.c
   218          for (i = 0; i < num_clks; i++) {
   219                  struct clk_init_data init;
   220                  struct clk *clk;
   221                  const char *parent_name;
   222                  struct iproc_asiu_clk *asiu_clk;
   223                  const char *clk_name;
   224  
   225                  clk_name = kzalloc(IPROC_CLK_NAME_LEN, GFP_KERNEL);

We shouldn't do this allocation.  of_property_read_string_index() will
just re-assign "clk_name" so the memory is leaked.

   226                  if (WARN_ON(!clk_name))
   227                          goto err_clk_register;
   228  
   229                  ret = of_property_read_string_index(node, "clock-output-names",
   230                                                      i, &clk_name);
   231                  if (WARN_ON(ret))
   232                          goto err_clk_register;
   233  
   234                  asiu_clk = &asiu->clks[i];
   235                  asiu_clk->name = clk_name;
   236                  asiu_clk->asiu = asiu;
   237                  asiu_clk->div = div[i];
   238                  asiu_clk->gate = gate[i];
   239                  init.name = clk_name;
   240                  init.ops = &iproc_asiu_ops;
   241                  init.flags = 0;
   242                  parent_name = of_clk_get_parent_name(node, 0);
   243                  init.parent_names = (parent_name ? &parent_name : NULL);
   244                  init.num_parents = (parent_name ? 1 : 0);
   245                  asiu_clk->hw.init = &init;


regards,
dan carpenter
