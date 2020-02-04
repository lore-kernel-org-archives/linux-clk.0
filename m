Return-Path: <SRS0=s2jw=3Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1357BC3524A
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 05:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA07B2166E
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 05:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FboWx0Na"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgBDFte (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Feb 2020 00:49:34 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59866 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgBDFte (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Feb 2020 00:49:34 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0145X8ai108321;
        Tue, 4 Feb 2020 05:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=CBUyglYdLchsx9i5Z2bhRRSmrP6RzPQmEPfE7PuPtHg=;
 b=FboWx0Na3qdhcMSZyT1tbdx1L2CU+KPT9BAspJVJ9qWWDLBhbBHceq8s5JYMa6fshFhm
 6bdE7i2mhDwnF+RtGPRsIU1m4C7fQBOMvPWTVFdQgpuupSLYNwMVqhdwvakLMGNmcYyH
 4ZKndTEZyPlxQ/0dZ0zFUUd25c0gFTyyJ+QM1PJsJHccMHtdATOB1eIrhuwksHwmaku6
 0bZBb4l0EegisgSm82Y4ai422kj4rEhvuuljXyhGrtyuhKRs7W9Ubg+xvcbvx9u9vit9
 dUHO9s0CJDIBIrSfZydUgYWfDvuJwp4SskMdE07gQv1G4m279whhw11jcacNu7hjZzvA sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xw19qc77x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 05:49:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0145mR5S044669;
        Tue, 4 Feb 2020 05:49:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xxsbm4qpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 05:49:30 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0145nTum015530;
        Tue, 4 Feb 2020 05:49:29 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 21:49:28 -0800
Date:   Tue, 4 Feb 2020 08:49:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     wen.he_1@nxp.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: ls1028a: Add clock driver for Display output
 interface
Message-ID: <20200204054922.xdahdazjnql4alb7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=877
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040042
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=934 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040041
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Wen He,

This is a semi-automatic email about new static checker warnings.

The patch d37010a3c162: "clk: ls1028a: Add clock driver for Display 
output interface" from Dec 13, 2019, leads to the following Smatch 
complaint:

    drivers/clk/clk-plldig.c:195 plldig_init()
     warn: variable dereferenced before check 'parent' (see line 190)

drivers/clk/clk-plldig.c
   189		struct clk_hw *parent = clk_hw_get_parent(hw);
   190		unsigned long parent_rate = clk_hw_get_rate(parent);
                                                            ^^^^^^
Dereferenced inside function.

   191		unsigned long val;
   192		unsigned long long lltmp;
   193		unsigned int mfd, fracdiv = 0;
   194	
   195		if (!parent)
                    ^^^^^^^
Check too late.

   196			return -EINVAL;
   197	

regards,
dan carpenter
