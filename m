Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4A6C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 08:22:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E13F214C6
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 08:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fJZ5afpS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbeLRIW4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 03:22:56 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49846 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbeLRIW4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 03:22:56 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wBI8J4WU053052;
        Tue, 18 Dec 2018 08:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=cwr+YULXl//phtbx6UzzFbMU2T67CJo+fMRuHvVPBw4=;
 b=fJZ5afpS9gN1njR+igSIydkpUiS/gU4D8KFLv6ipSSzmzhaAquud5bfZqvj5PkFJcmzH
 5PgmMiQ0j/c4nTNQ43uE2IDXUfYMkY+Ge+aDCNey4VGDVCFuxGUe4MKsXY5Rqn7HDqlx
 qy7ZuKk2S9o1jWMnjIk2twnLiIJSO3cfSZqMr91Yvhn+fEgAsas01GlrwLCk/yyBiDWW
 WIzZOvJ8zoogs+FTu5pUxsO9hlMVAo7SN7cMh44LSSVlVIMl2ZYfCZ1HRMoWfk3Am3TS
 reBwv2TFkgdwbUjlzpFDsolPkiDHBF3hBYz3uFdRr3AFb/3NBiImSc+reeuh5s+SqVvW Mw== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by userp2120.oracle.com with ESMTP id 2pct8qsm4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Dec 2018 08:22:49 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wBI8MhiM004142
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Dec 2018 08:22:43 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wBI8Mgia004495;
        Tue, 18 Dec 2018 08:22:42 GMT
Received: from kadam (/197.157.0.59)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 Dec 2018 00:22:42 -0800
Date:   Tue, 18 Dec 2018 11:22:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: tegra: dfll: Fix a potential Oop in remove()
Message-ID: <20181218082241.GA440@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9110 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1812180075
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
should just return instead of dereferencing it.

Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 269d3595758b..edc31bb56674 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -133,9 +133,11 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 	struct tegra_dfll_soc_data *soc;
 
 	soc = tegra_dfll_unregister(pdev);
-	if (IS_ERR(soc))
+	if (IS_ERR(soc)) {
 		dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
 			PTR_ERR(soc));
+		return PTR_ERR(soc);
+	}
 
 	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-- 
2.17.1

