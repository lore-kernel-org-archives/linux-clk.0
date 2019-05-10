Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0444FC04A6B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 14:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D172175B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 14:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfEJOUh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 May 2019 10:20:37 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:45292 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727247AbfEJOUh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 May 2019 10:20:37 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4AE48GK006882;
        Fri, 10 May 2019 09:20:35 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2scba3jsku-1;
        Fri, 10 May 2019 09:20:34 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 2310D611C8AF;
        Fri, 10 May 2019 09:22:04 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 10 May
 2019 15:20:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 10 May 2019 15:20:34 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E28402A1;
        Fri, 10 May 2019 15:20:33 +0100 (BST)
Date:   Fri, 10 May 2019 15:20:33 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2] clk: lochnagar: Use new parent_data approach to
 register clock parents
Message-ID: <20190510142033.GD45394@ediswmail.ad.cirrus.com>
References: <20190510105540.10091-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190510105540.10091-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100098
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 10, 2019 at 11:55:39AM +0100, Charles Keepax wrote:
> Switch over to the more modern style of registering parents and simplify
> the code in the process.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v1:
>  - Add config structure used from of_device_id for version specific
>    configuration
> 
> Regarding the globally unique names being the same as the DT
> names. There isn't really much intention that this driver would
> use globally unique names and I am only really populating them
> to avoid NULL pointer dereferences in the core. If there is
> something it would make more sense to populate in those fields
> I am happy to do so.  However, the names for the clocks as
> used from DT are fairly specific and I am unclear what else
> I would put in that field.
> 
> Thanks,
> Charles
> 
>  drivers/clk/clk-lochnagar.c | 194 +++++++++++++++++++-------------------------
>  1 file changed, 82 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
> index a2f31e58ee483..a0b8f67707e79 100644
> --- a/drivers/clk/clk-lochnagar.c
> +++ b/drivers/clk/clk-lochnagar.c
> @@ -42,46 +42,45 @@ struct lochnagar_clk_priv {
>  	struct regmap *regmap;
>  	enum lochnagar_type type;

oops type should have gone here as well apologies will send a
version 3.

Thanks,
Charles

