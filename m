Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E32CC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F82020449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="F2okpO+I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfADDHl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:41 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9118 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:40 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecdf10000>; Thu, 03 Jan 2019 19:07:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:40 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Jan 2019 19:07:40 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:39 +0000
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:39 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:39 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ecdf90003>; Thu, 03 Jan 2019 19:07:39 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH V4 13/20] cpufreq: dt-platdev: add Tegra210 to blacklist
Date:   Fri, 4 Jan 2019 11:06:55 +0800
Message-ID: <20190104030702.8684-14-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571249; bh=QObwn0jqultjTGM0CZhkFh5Dh9zvUp5S229eoA516eM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=F2okpO+IHutm+Ea3BPBcybC5Rri1pg8pyafO5KYfK92RPWmgLDxJbph0iZJPInE/N
         5owsGIPxYhAiBUAYmVL2UBgbRQnVNIBw1RlzRxuTfyWV5U6NV7I/XJVIIXsMDo8AMp
         CLeC+vKDuLjTjYHI6p764kSlmy/fMGKyBkZWEXl0/Vlo6t+bVpLUF4RlWn/qLsG5Z/
         As0nOIYhtuI1aUWdSmi4vTMg8akzLMgqXyjM7ivrXUeRNKTLLgvc8bIZn9P7hiX6DX
         fJpl6L8wSM1RXeSWnKY/psbxXO+CMzE6UyaX6tMkEQxjI96Bf7pNMlSuNOVMqNfLY8
         UhjnPCrnSbePQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tegra210 uses "tegra124-cpufreq" platform driver to register device data
for "cpufreq-dt" driver. So add it in the blacklist for
"cpufreq-dt-platdev" driver to drop that.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
*V4:
 - no change
*V3:
 - add ack tags
*V2:
 - new added in V2
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq=
-dt-platdev.c
index b1c5468dca16..47729a22c159 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -119,6 +119,7 @@ static const struct of_device_id blacklist[] __initcons=
t =3D {
 	{ .compatible =3D "mediatek,mt8176", },
=20
 	{ .compatible =3D "nvidia,tegra124", },
+	{ .compatible =3D "nvidia,tegra210", },
=20
 	{ .compatible =3D "qcom,apq8096", },
 	{ .compatible =3D "qcom,msm8996", },
--=20
2.20.1

