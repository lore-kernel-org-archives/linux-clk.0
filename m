Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599FDC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C4BC2184B
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="WxWRFu/C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfADDHi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:38 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12326 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:38 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecde40000>; Thu, 03 Jan 2019 19:07:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:37 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 03 Jan 2019 19:07:37 -0800
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:37 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:37 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ecdf70000>; Thu, 03 Jan 2019 19:07:36 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH V4 12/20] cpufreq: tegra124: extend to support Tegra210
Date:   Fri, 4 Jan 2019 11:06:54 +0800
Message-ID: <20190104030702.8684-13-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571237; bh=PPMd8GwCi0gtOlc1OFpIYRkOzx8srUlhdmXvxSKaRmM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=WxWRFu/CQRoMxaR/UL2WfbIP4MTqggQHj6VxFkrSuap+JvQcxO2/rgdK9JHjnkoyv
         XUfSQ5G8Ar/xKikQOuO3RzWrsX6GbtTAhK0NC1uFcudufuqoLm29Kpx6Qz0xPqji3U
         mPD3l3ROdpoBQC9vSz3qY30zFVLdDnbHgYkzynbICxFaid2K6hnOYnl0CO1flKRxYa
         cjZhjGLasur//x98y3f0sNjuhaj/lR2BG/TynmP5eV5r+UU06HqHwft1hByPBl2tEu
         StxI7HCFHuVqHWjcC4D+snAdsA17llyjwyVSGMU/DyH0WQdQJem3FNCKT3V0WqUzoX
         gFaTHe7uzgyBg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tegra210 uses the same methodology as Tegra124 for CPUFreq controlling
that based on DFLL clock. So extending this driver to support Tegra210.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V4:
 - no change
*V3:
 - no change
*V2:
 - add two ack tags
---
 drivers/cpufreq/tegra124-cpufreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-=
cpufreq.c
index a1bfde0a7950..ba3795e13ac6 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -144,7 +144,8 @@ static int __init tegra_cpufreq_init(void)
 	int ret;
 	struct platform_device *pdev;
=20
-	if (!of_machine_is_compatible("nvidia,tegra124"))
+	if (!(of_machine_is_compatible("nvidia,tegra124") ||
+		of_machine_is_compatible("nvidia,tegra210")))
 		return -ENODEV;
=20
 	/*
--=20
2.20.1

