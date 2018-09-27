Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665A7C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 02:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE1C621570
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 02:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="SAk76x8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1C621570
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbeI0IsF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 04:48:05 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19101 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbeI0IsF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 04:48:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5bac412a0000>; Wed, 26 Sep 2018 19:32:10 -0700
Received: from HQMAIL101.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 26 Sep 2018 19:32:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 26 Sep 2018 19:32:08 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 27 Sep
 2018 02:32:08 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Sep 2018 02:32:07 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5bac41260006>; Wed, 26 Sep 2018 19:32:07 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH V2] clk: tegra: Fixes for MBIST work around
Date:   Thu, 27 Sep 2018 10:32:03 +0800
Message-ID: <20180927023203.9218-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1538015530; bh=P1w64rSLbdt9kKSFCk2B29OjCz9mwlAmGGmJ3hSN/as=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=SAk76x8t1MDLBP73W7tAk04MQb+rlymHeg6XQqhdw5J+kCgnskKe7tf8mIdiUwDke
         /1zxPNSQwevJ4B2T41JIfa5WVJ8PQ7xqNtg2BinjuKSgpbE42pdXmzbkhw6jHdUjxs
         9Y8SAzjAn+m6+nhCUEICem1L2ZGuUBowS9JCfXN0Zcbw+Zf0MOKgj/6trirZ47jBax
         RMnMwQPZjWt3gfEuH0VX9CY0be2d1d7WmGN9WbecyOkfyspzazaHG31M8O1ElADRiO
         py6WmFg8fTLUd3NM65AQlLRIxpNU+BrsqvxDHryU6mwjTCyGtzeQNW3TKo6boro/wF
         x4vJMG2jv7kbQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927023203.NUUDm07WNL6q8BkCoxWv1iYeW0wtQV1-gnvMGijB9Qs@z>

Fix some incorrect data in LVL2 offset and bit mask.

Fixes: e403d0057343 ("clk: tegra: MBIST work around for Tegra210")
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
V2:
Add "Fixes" tag.
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra=
210.c
index 9eb1cb14fce1..290f7cb6a051 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2603,7 +2603,7 @@ static struct tegra210_domain_mbist_war tegra210_pg_m=
bist_war[] =3D {
 	[TEGRA_POWERGATE_MPE] =3D {
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
 		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
-		.lvl2_mask =3D BIT(2),
+		.lvl2_mask =3D BIT(29),
 	},
 	[TEGRA_POWERGATE_SOR] =3D {
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
@@ -2654,14 +2654,14 @@ static struct tegra210_domain_mbist_war tegra210_pg=
_mbist_war[] =3D {
 		.num_clks =3D ARRAY_SIZE(nvdec_slcg_clkids),
 		.clk_init_data =3D nvdec_slcg_clkids,
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
-		.lvl2_offset =3D LVL2_CLK_GATE_OVRC,
+		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
 		.lvl2_mask =3D BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_NVJPG] =3D {
 		.num_clks =3D ARRAY_SIZE(nvjpg_slcg_clkids),
 		.clk_init_data =3D nvjpg_slcg_clkids,
 		.handle_lvl2_ovr =3D tegra210_generic_mbist_war,
-		.lvl2_offset =3D LVL2_CLK_GATE_OVRC,
+		.lvl2_offset =3D LVL2_CLK_GATE_OVRE,
 		.lvl2_mask =3D BIT(9) | BIT(31),
 	},
 	[TEGRA_POWERGATE_AUD] =3D {
--=20
2.19.0

