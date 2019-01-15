Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E986C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 13:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70E8C20651
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 13:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UWOyozIh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbfAONmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 08:42:46 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:57992 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729245AbfAONmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 08:42:46 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x0FDXxN6016185;
        Tue, 15 Jan 2019 13:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=6PdrDj8yTqXCrL+xREC071KOrHS3FvYkCGKxNNTKaGo=;
 b=UWOyozIhuSZ7fd5aD8tyAkSFuaEBy6AowsunJZeUaWe+hbjXXqvRJBpAvyNhmMitleni
 1nppwJ8g56nv1YU3zMt8MjbnH7PyIGi3kWSpRfsMm3AtUA/wCl6BwbwG18ngOcOVBgmt
 WcTfs3YHEotUodV7BitLnDWK9EJl6ikXietLaM0dONKZ6NMop/XcicSErPS2P/e/sWMb
 gCaOBG6nnWyfziVlsFFxN+TqzL4ZwMfiFVjDzwfGISFVWDaci9GUUH+6L6JAtzsoUcCQ
 tovFqODUfc95O3qHxKWaR/RT1YfZpGrQEBXxdxo7h78R3tkSsverL1RjV70nSk59xu0s QA== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by userp2120.oracle.com with ESMTP id 2pybjs3vgm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jan 2019 13:42:40 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x0FDgdpo030487
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jan 2019 13:42:39 GMT
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x0FDgc4L028212;
        Tue, 15 Jan 2019 13:42:39 GMT
Received: from kadam (/197.157.34.180)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Jan 2019 05:42:37 -0800
Date:   Tue, 15 Jan 2019 16:42:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: ti: Fix error handling in
 ti_clk_parse_divider_data()
Message-ID: <20190115134229.GI4504@kadam>
References: <154706313779.15366.12078258980663060364@swboyd.mtv.corp.google.com>
 <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9136 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1901150114
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 15, 2019 at 10:01:49AM +0300, Dan Carpenter wrote:
> The ti_clk_parse_divider_data() function is only called from
> _get_div_table_from_setup().  That function doesn't look at the return
> value but instead looks at the "*table" pointer.  In this case, if the
> kcalloc() fails then *table is NULL (which means success).  It should
> instead be an error pointer.
> 
> The ti_clk_parse_divider_data() function has two callers.  One checks
> for errors and the other doesn't.  I have fixed it so now both handle
> errors.
> 
> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/clk/ti/divider.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index 8d77090ad94a..4c48ef424ad5 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
>  	num_dividers = i;
>  
>  	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
> -	if (!tmp)
> +	if (!tmp) {
> +		*table = PTR_ERR(-ENOMEM);

Oh wow...  I don't know how I screwed that up.  :(

Let me resend.

regards,
dan carpenter

