Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:31956 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932107AbbGJI0g (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jul 2015 04:26:36 -0400
Date: Fri, 10 Jul 2015 11:26:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: boris.brezillon@free-electrons.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: change clk_ops' ->determine_rate() prototype
Message-ID: <20150710082612.GC29999@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Boris Brezillon,

This is a semi-automatic email about new static checker warnings.

The patch 4a7c639697ef: "clk: change clk_ops' ->determine_rate() 
prototype" from Jul 7, 2015, leads to the following Smatch complaint:

drivers/clk/clk.c:458 clk_mux_determine_rate_flags()
	 error: we previously assumed 'parent' could be null (see line 452)

drivers/clk/clk.c
   451			if (core->flags & CLK_SET_RATE_PARENT) {
   452				ret = __clk_determine_rate(parent ? parent->hw : NULL,
                                                           ^^^^^^
Check for NULL.

   453							   &parent_req);
   454				if (ret)
   455					return ret;
   456	
   457				best = parent_req.rate;
   458				req->best_parent_hw = parent->hw;
                                                      ^^^^^^^^^^
Patch adds unchecked dereference.

   459				req->best_parent_rate = best;
   460			} else if (parent) {

regards,
dan carpenter
