Return-Path: <SRS0=uDsh=AH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DA2C433DF
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 10:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A325920768
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 10:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hui5oA2q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgFZKc1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jun 2020 06:32:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:52114 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgFZKc1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2020 06:32:27 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QASBh4019204;
        Fri, 26 Jun 2020 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=wWOui74+N5Elgy4qv/dhximBDVv/l3ZbFJn2n7TeYvg=;
 b=Hui5oA2q0/c20IRaFyps/ks2/1sGtU/16RCv0iJSR9QsgeGtw1eY6nDSR5LGwpkQxARj
 IyqEZodjClrKmLGLqunEGaTabH6ySqkf68eEVrUcVOv8R8Bir0jZM8L96N1rSmCfbNLT
 TAurdKPoCJ4KCR4N8wW2JLqLZh04n9wRfXbsz7j1GBzGk6WU8xGMK3jooLfX/R4NmaMD
 5lco6oY4BMbbbC/HyODhez8pVKlxSZeWAgrsQBcI0+TugRkKYkQoABuNV88gXZ2ghrQd
 90Wuqhkf7WD0BxPhHJ2U0gSLuQbaEJnP1oSJkgLONKvanK+v06HbwMqZGfasWGcvcujT sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31uustwbuf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:32:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QATVjM089171;
        Fri, 26 Jun 2020 10:32:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 31uurtykb3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:32:25 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05QAWOt7028820;
        Fri, 26 Jun 2020 10:32:24 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:32:23 +0000
Date:   Fri, 26 Jun 2020 13:32:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     aford173@gmail.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: vc5: Enable addition output configurations of the
 Versaclock
Message-ID: <20200626103218.GA314155@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=769 bulkscore=0 suspectscore=3 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=774
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=3 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260076
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Adam Ford,

The patch 260249f929e8: "clk: vc5: Enable addition output
configurations of the Versaclock" from Jun 3, 2020, leads to the
following static checker warning:

	drivers/clk/clk-versaclock5.c:795 vc5_get_output_config()
	warn: missing error code here? 'of_get_child_by_name()' failed. 'ret' = '0'

drivers/clk/clk-versaclock5.c
   784  static int vc5_get_output_config(struct i2c_client *client,
   785                                   struct vc5_hw_data *clk_out)
   786  {
   787          struct device_node *np_output;
   788          char *child_name;
   789          int ret = 0;
   790  
   791          child_name = kasprintf(GFP_KERNEL, "OUT%d", clk_out->num + 1);
                ^^^^^^^^^^
No check for NULL which will lead to an Oops on the next line.

   792          np_output = of_get_child_by_name(client->dev.of_node, child_name);
                                                                      ^^^^^^^^^^
Dereferenced without checking inside function.

   793          kfree(child_name);
   794          if (!np_output)
   795                  goto output_done;
                        ^^^^^^^^^^^^^^^^^
Why not just "return 0;" so that it's obvious this path is a success
path.  :/  Do nothing gotos have a typical forgot to set the error
code bug but direct returns don't suffer from this problem.

People think that do nothing gotos will force future developers think
about error handling but this is not supported by data.  My experience
is that nothing can force people to think about error handling.

   796  
   797          ret = vc5_update_mode(np_output, clk_out);
   798          if (ret)
   799                  goto output_error;
   800  
   801          ret = vc5_update_power(np_output, clk_out);
   802          if (ret)
   803                  goto output_error;
   804  
   805          ret = vc5_update_slew(np_output, clk_out);
   806  
   807  output_error:
   808          if (ret) {
   809                  dev_err(&client->dev,
   810                          "Invalid clock output configuration OUT%d\n",
   811                          clk_out->num + 1);
   812          }
   813  
   814          of_node_put(np_output);
   815  
   816  output_done:
   817          return ret;
   818  }

regards,
dan carpenter
