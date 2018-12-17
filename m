Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BIGNUM_EMAILS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563FEC43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24A4B2133F
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="wgShcUbe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731747AbeLQOqK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:46:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:52600 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbeLQOqK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 09:46:10 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wBHEhoQj069547;
        Mon, 17 Dec 2018 14:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=3Xzl5oPwI+W71kQZHbZK62b/lq7lfBbMYI0c+S++EuA=;
 b=wgShcUbewzjAD53U6VjTpWCwcl+US8JqsfnmZ1iy7XsRh3EUf/8TjL34xgQZEvbCoXn8
 Zv6c8YkBnSI/FABNt+716IEAPl9TYaeOs8s9bzZyCkrsIa/AWswchZy1E7r95YtVaJWs
 MVWfSyqpKkYSZKAO4EflmXI5a0IkzUbWRTE1Zp9lnYpQiM/FFu17cOsLFmkrXPRFLM06
 fPqhDhMDUbfWaQtSzq31AXwevED8XWq3utHzA7/OjQzvHffGD9/vuPnrd0SNGPZfRqXJ
 wqPn43a6sB8VYwAQilyXFG9rqXHqNrfWkXt/irqrNT18JPNdGOYY8lPYlvcJ496aOlSU yA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2130.oracle.com with ESMTP id 2pcq4dp6ah-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Dec 2018 14:46:07 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id wBHEk1uB005585
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Dec 2018 14:46:01 GMT
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id wBHEk1qU024250;
        Mon, 17 Dec 2018 14:46:01 GMT
Received: from kadam (/197.157.0.24)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Dec 2018 06:46:00 -0800
Date:   Mon, 17 Dec 2018 17:45:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     t-kristo@ti.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: ti: divider: add driver internal API for parsing
 divider data
Message-ID: <20181217144553.GA11066@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9109 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=812
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1812170131
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Tero Kristo,

The patch 4f6be5655dc9: "clk: ti: divider: add driver internal API
for parsing divider data" from Feb 9, 2017, leads to the following
static checker warning:

	drivers/clk/ti/divider.c:491 ti_clk_register_divider()
	warn: 'table' isn't an ERR_PTR

drivers/clk/ti/divider.c
   468  struct clk *ti_clk_register_divider(struct ti_clk *setup)
   469  {
   470          struct ti_clk_divider *div = setup->data;
   471          struct clk_omap_reg reg = {
   472                  .index = div->module,
   473                  .offset = div->reg,
   474          };
   475          u8 width;
   476          u32 flags = 0;
   477          u8 div_flags = 0;
   478          const struct clk_div_table *table;
   479          struct clk *clk;
   480  
   481          if (div->flags & CLKF_INDEX_STARTS_AT_ONE)
   482                  div_flags |= CLK_DIVIDER_ONE_BASED;
   483  
   484          if (div->flags & CLKF_INDEX_POWER_OF_TWO)
   485                  div_flags |= CLK_DIVIDER_POWER_OF_TWO;
   486  
   487          if (div->flags & CLKF_SET_RATE_PARENT)
   488                  flags |= CLK_SET_RATE_PARENT;
   489  
   490          table = _get_div_table_from_setup(div, &width);
   491          if (IS_ERR(table))
                           ^^^^^

NULL is actually allowed here so we can't just change this to a check
for NULL.  Prior to this commit if the:

	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);

allocation failed then table was PTR_ERR(-ENOMEM).  I guess we should
change it back.  We could probably do sothing like the diff below?

   492                  return (struct clk *)table;
   493  
   494          clk = _register_divider(NULL, setup->name, div->parent,
   495                                  flags, &reg, div->bit_shift,
   496                                  width, -EINVAL, div_flags, table);
   497  
   498          if (IS_ERR(clk))
   499                  kfree(table);
   500  
   501          return clk;
   502  }


diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 8d77090ad94a..c4335eba2b2e 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	num_dividers = i;
 
 	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
-	if (!tmp)
+	if (!tmp) {
+		*table = PTR_ERR(-ENOMEM);
 		return -ENOMEM;
+	}
 
 	valid_div = 0;
 	*width = 0;
