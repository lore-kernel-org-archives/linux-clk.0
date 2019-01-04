Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350CFC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E67D620449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eDmxE4dx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfADDHc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:32 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12316 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:32 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecddd0000>; Thu, 03 Jan 2019 19:07:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 03 Jan 2019 19:07:30 -0800
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:30 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:30 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ecdf00004>; Thu, 03 Jan 2019 19:07:29 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH V4 09/20] clk: tegra: dfll: add CVB tables for Tegra210
Date:   Fri, 4 Jan 2019 11:06:51 +0800
Message-ID: <20190104030702.8684-10-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571230; bh=iDqLB4o/bbfEikb7kKXuL9vJvETMDD2co47hMxRCZBQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=eDmxE4dxoB5n6v73le/PF9K47BNs+yRMVCVJnCo8fvJfCAhcUn1NlYf/Hmg0C8Ksy
         4Ix1gj8oE8JAKAbKnskfWnRHWHaCU6Cz0yb0FjKEc8qbMP6iCa2T3QzV3BY36v6kjM
         Doy++J5dMZj3xRAg8DdyQkRI5RjuJ79ZV0WHarZN0FpsPVXvRNVSfGHpi1DVFg2pC3
         xCDJjrTOHKWhhFGYztajrPQhu1MwN609JVjW/2YpSd4WsuDbYsVLw0v3KpSp+vkz1k
         rrgHUeQT6dQgbY5atwqVvoKojc8oD1QDNzfrNhM8Q+nAe+QA66A/Ojd6rQhJPX6+Y5
         x8HmO7esu3K2w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add CVB tables with different chip characterization, so that we can
generate the customize OPP table that suitable for different chips with
different SKUs.

The parameter 'tune_high_min_millivolts' is first time introduced in
this patch, which didn't use in the DFLL driver for clock and voltage
tuning before. It will be used later when DFLL in high voltage range.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
*V4:
 - add ack tags
*V3:
 - update the commit message for 'tune_high_min_millivolts' parameter
*V2:
 - no update
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 426 +++++++++++++++++++++
 drivers/clk/tegra/cvb.h                    |   1 +
 2 files changed, 427 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra=
/clk-tegra124-dfll-fcpu.c
index 92b83f50a765..49a17916f61b 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -88,6 +88,421 @@ static const struct cvb_table tegra124_cpu_cvb_tables[]=
 =3D {
 	},
 };
=20
+static const unsigned long tegra210_cpu_max_freq_table[] =3D {
+	[0] =3D 1912500000UL,
+	[1] =3D 1912500000UL,
+	[2] =3D 2218500000UL,
+	[3] =3D 1785000000UL,
+	[4] =3D 1632000000UL,
+	[5] =3D 1912500000UL,
+	[6] =3D 2014500000UL,
+	[7] =3D 1734000000UL,
+	[8] =3D 1683000000UL,
+	[9] =3D 1555500000UL,
+	[10] =3D 1504500000UL,
+};
+
+#define CPU_CVB_TABLE \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{ 1007452, -23865, 370 } }, \
+		{  306000000UL,	{ 1052709, -24875, 370 } }, \
+		{  408000000UL,	{ 1099069, -25895, 370 } }, \
+		{  510000000UL,	{ 1146534, -26905, 370 } }, \
+		{  612000000UL,	{ 1195102, -27915, 370 } }, \
+		{  714000000UL,	{ 1244773, -28925, 370 } }, \
+		{  816000000UL,	{ 1295549, -29935, 370 } }, \
+		{  918000000UL,	{ 1347428, -30955, 370 } }, \
+		{ 1020000000UL,	{ 1400411, -31965, 370 } }, \
+		{ 1122000000UL,	{ 1454497, -32975, 370 } }, \
+		{ 1224000000UL,	{ 1509687, -33985, 370 } }, \
+		{ 1326000000UL,	{ 1565981, -35005, 370 } }, \
+		{ 1428000000UL,	{ 1623379, -36015, 370 } }, \
+		{ 1530000000UL,	{ 1681880, -37025, 370 } }, \
+		{ 1632000000UL,	{ 1741485, -38035, 370 } }, \
+		{ 1734000000UL,	{ 1802194, -39055, 370 } }, \
+		{ 1836000000UL,	{ 1864006, -40065, 370 } }, \
+		{ 1912500000UL,	{ 1910780, -40815, 370 } }, \
+		{ 2014500000UL,	{ 1227000,      0,   0 } }, \
+		{ 2218500000UL,	{ 1227000,      0,   0 } }, \
+		{          0UL,	{       0,      0,   0 } }, \
+	}
+
+#define CPU_CVB_TABLE_XA \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{ 1250024, -39785, 565 } }, \
+		{  306000000UL,	{ 1297556, -41145, 565 } }, \
+		{  408000000UL,	{ 1346718, -42505, 565 } }, \
+		{  510000000UL,	{ 1397511, -43855, 565 } }, \
+		{  612000000UL,	{ 1449933, -45215, 565 } }, \
+		{  714000000UL,	{ 1503986, -46575, 565 } }, \
+		{  816000000UL,	{ 1559669, -47935, 565 } }, \
+		{  918000000UL,	{ 1616982, -49295, 565 } }, \
+		{ 1020000000UL,	{ 1675926, -50645, 565 } }, \
+		{ 1122000000UL,	{ 1736500, -52005, 565 } }, \
+		{ 1224000000UL,	{ 1798704, -53365, 565 } }, \
+		{ 1326000000UL,	{ 1862538, -54725, 565 } }, \
+		{ 1428000000UL,	{ 1928003, -56085, 565 } }, \
+		{ 1530000000UL,	{ 1995097, -57435, 565 } }, \
+		{ 1606500000UL,	{ 2046149, -58445, 565 } }, \
+		{ 1632000000UL,	{ 2063822, -58795, 565 } }, \
+		{          0UL,	{       0,      0,   0 } }, \
+	}
+
+#define CPU_CVB_TABLE_EUCM1 \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{  734429, 0, 0 } }, \
+		{  306000000UL,	{  768191, 0, 0 } }, \
+		{  408000000UL,	{  801953, 0, 0 } }, \
+		{  510000000UL,	{  835715, 0, 0 } }, \
+		{  612000000UL,	{  869477, 0, 0 } }, \
+		{  714000000UL,	{  903239, 0, 0 } }, \
+		{  816000000UL,	{  937001, 0, 0 } }, \
+		{  918000000UL,	{  970763, 0, 0 } }, \
+		{ 1020000000UL,	{ 1004525, 0, 0 } }, \
+		{ 1122000000UL,	{ 1038287, 0, 0 } }, \
+		{ 1224000000UL,	{ 1072049, 0, 0 } }, \
+		{ 1326000000UL,	{ 1105811, 0, 0 } }, \
+		{ 1428000000UL,	{ 1130000, 0, 0 } }, \
+		{ 1555500000UL,	{ 1130000, 0, 0 } }, \
+		{ 1632000000UL,	{ 1170000, 0, 0 } }, \
+		{ 1734000000UL,	{ 1227500, 0, 0 } }, \
+		{          0UL,	{       0, 0, 0 } }, \
+	}
+
+#define CPU_CVB_TABLE_EUCM2 \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{  742283, 0, 0 } }, \
+		{  306000000UL,	{  776249, 0, 0 } }, \
+		{  408000000UL,	{  810215, 0, 0 } }, \
+		{  510000000UL,	{  844181, 0, 0 } }, \
+		{  612000000UL,	{  878147, 0, 0 } }, \
+		{  714000000UL,	{  912113, 0, 0 } }, \
+		{  816000000UL,	{  946079, 0, 0 } }, \
+		{  918000000UL,	{  980045, 0, 0 } }, \
+		{ 1020000000UL,	{ 1014011, 0, 0 } }, \
+		{ 1122000000UL,	{ 1047977, 0, 0 } }, \
+		{ 1224000000UL,	{ 1081943, 0, 0 } }, \
+		{ 1326000000UL,	{ 1090000, 0, 0 } }, \
+		{ 1479000000UL,	{ 1090000, 0, 0 } }, \
+		{ 1555500000UL,	{ 1162000, 0, 0 } }, \
+		{ 1683000000UL,	{ 1195000, 0, 0 } }, \
+		{          0UL,	{       0, 0, 0 } }, \
+	}
+
+#define CPU_CVB_TABLE_EUCM2_JOINT_RAIL \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{  742283, 0, 0 } }, \
+		{  306000000UL,	{  776249, 0, 0 } }, \
+		{  408000000UL,	{  810215, 0, 0 } }, \
+		{  510000000UL,	{  844181, 0, 0 } }, \
+		{  612000000UL,	{  878147, 0, 0 } }, \
+		{  714000000UL,	{  912113, 0, 0 } }, \
+		{  816000000UL,	{  946079, 0, 0 } }, \
+		{  918000000UL,	{  980045, 0, 0 } }, \
+		{ 1020000000UL,	{ 1014011, 0, 0 } }, \
+		{ 1122000000UL,	{ 1047977, 0, 0 } }, \
+		{ 1224000000UL,	{ 1081943, 0, 0 } }, \
+		{ 1326000000UL,	{ 1090000, 0, 0 } }, \
+		{ 1479000000UL,	{ 1090000, 0, 0 } }, \
+		{ 1504500000UL,	{ 1120000, 0, 0 } }, \
+		{          0UL,	{       0, 0, 0 } }, \
+	}
+
+#define CPU_CVB_TABLE_ODN \
+	.speedo_scale =3D 100,	\
+	.voltage_scale =3D 1000,	\
+	.entries =3D {		\
+		{  204000000UL,	{  721094, 0, 0 } }, \
+		{  306000000UL,	{  754040, 0, 0 } }, \
+		{  408000000UL,	{  786986, 0, 0 } }, \
+		{  510000000UL,	{  819932, 0, 0 } }, \
+		{  612000000UL,	{  852878, 0, 0 } }, \
+		{  714000000UL,	{  885824, 0, 0 } }, \
+		{  816000000UL,	{  918770, 0, 0 } }, \
+		{  918000000UL,	{  915716, 0, 0 } }, \
+		{ 1020000000UL,	{  984662, 0, 0 } }, \
+		{ 1122000000UL,	{ 1017608, 0, 0 } }, \
+		{ 1224000000UL,	{ 1050554, 0, 0 } }, \
+		{ 1326000000UL,	{ 1083500, 0, 0 } }, \
+		{ 1428000000UL,	{ 1116446, 0, 0 } }, \
+		{ 1581000000UL,	{ 1130000, 0, 0 } }, \
+		{ 1683000000UL,	{ 1168000, 0, 0 } }, \
+		{ 1785000000UL,	{ 1227500, 0, 0 } }, \
+		{          0UL,	{       0, 0, 0 } }, \
+	}
+
+struct cvb_table tegra210_cpu_cvb_tables[] =3D {
+	{
+		.speedo_id =3D 10,
+		.process_id =3D 0,
+		.min_millivolts =3D 840,
+		.max_millivolts =3D 1120,
+		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 10,
+		.process_id =3D 1,
+		.min_millivolts =3D 840,
+		.max_millivolts =3D 1120,
+		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 9,
+		.process_id =3D 0,
+		.min_millivolts =3D 900,
+		.max_millivolts =3D 1162,
+		CPU_CVB_TABLE_EUCM2,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 9,
+		.process_id =3D 1,
+		.min_millivolts =3D 900,
+		.max_millivolts =3D 1162,
+		CPU_CVB_TABLE_EUCM2,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 8,
+		.process_id =3D 0,
+		.min_millivolts =3D 900,
+		.max_millivolts =3D 1195,
+		CPU_CVB_TABLE_EUCM2,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 8,
+		.process_id =3D 1,
+		.min_millivolts =3D 900,
+		.max_millivolts =3D 1195,
+		CPU_CVB_TABLE_EUCM2,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 7,
+		.process_id =3D 0,
+		.min_millivolts =3D 841,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE_EUCM1,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 7,
+		.process_id =3D 1,
+		.min_millivolts =3D 841,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE_EUCM1,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 6,
+		.process_id =3D 0,
+		.min_millivolts =3D 870,
+		.max_millivolts =3D 1150,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 6,
+		.process_id =3D 1,
+		.min_millivolts =3D 870,
+		.max_millivolts =3D 1150,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+		}
+	},
+	{
+		.speedo_id =3D 5,
+		.process_id =3D 0,
+		.min_millivolts =3D 818,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 5,
+		.process_id =3D 1,
+		.min_millivolts =3D 818,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 4,
+		.process_id =3D -1,
+		.min_millivolts =3D 918,
+		.max_millivolts =3D 1113,
+		CPU_CVB_TABLE_XA,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune1 =3D 0x17711BD,
+		}
+	},
+	{
+		.speedo_id =3D 3,
+		.process_id =3D 0,
+		.min_millivolts =3D 825,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE_ODN,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 3,
+		.process_id =3D 1,
+		.min_millivolts =3D 825,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE_ODN,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 2,
+		.process_id =3D 0,
+		.min_millivolts =3D 870,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+		}
+	},
+	{
+		.speedo_id =3D 2,
+		.process_id =3D 1,
+		.min_millivolts =3D 870,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+		}
+	},
+	{
+		.speedo_id =3D 1,
+		.process_id =3D 0,
+		.min_millivolts =3D 837,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 1,
+		.process_id =3D 1,
+		.min_millivolts =3D 837,
+		.max_millivolts =3D 1227,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 0,
+		.process_id =3D 0,
+		.min_millivolts =3D 850,
+		.max_millivolts =3D 1170,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x20091d9,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+	{
+		.speedo_id =3D 0,
+		.process_id =3D 1,
+		.min_millivolts =3D 850,
+		.max_millivolts =3D 1170,
+		CPU_CVB_TABLE,
+		.cpu_dfll_data =3D {
+			.tune0_low =3D 0xffead0ff,
+			.tune0_high =3D 0xffead0ff,
+			.tune1 =3D 0x25501d0,
+			.tune_high_min_millivolts =3D 864,
+		}
+	},
+};
+
 static const struct dfll_fcpu_data tegra124_dfll_fcpu_data =3D {
 	.cpu_max_freq_table =3D tegra124_cpu_max_freq_table,
 	.cpu_max_freq_table_size =3D ARRAY_SIZE(tegra124_cpu_max_freq_table),
@@ -95,11 +510,22 @@ static const struct dfll_fcpu_data tegra124_dfll_fcpu_=
data =3D {
 	.cpu_cvb_tables_size =3D ARRAY_SIZE(tegra124_cpu_cvb_tables)
 };
=20
+static const struct dfll_fcpu_data tegra210_dfll_fcpu_data =3D {
+	.cpu_max_freq_table =3D tegra210_cpu_max_freq_table,
+	.cpu_max_freq_table_size =3D ARRAY_SIZE(tegra210_cpu_max_freq_table),
+	.cpu_cvb_tables =3D tegra210_cpu_cvb_tables,
+	.cpu_cvb_tables_size =3D ARRAY_SIZE(tegra210_cpu_cvb_tables),
+};
+
 static const struct of_device_id tegra124_dfll_fcpu_of_match[] =3D {
 	{
 		.compatible =3D "nvidia,tegra124-dfll",
 		.data =3D &tegra124_dfll_fcpu_data,
 	},
+	{
+		.compatible =3D "nvidia,tegra210-dfll",
+		.data =3D &tegra210_dfll_fcpu_data
+	},
 	{ },
 };
=20
diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
index bcf15a089b93..91a1941c21ef 100644
--- a/drivers/clk/tegra/cvb.h
+++ b/drivers/clk/tegra/cvb.h
@@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
 	u32 tune0_low;
 	u32 tune0_high;
 	u32 tune1;
+	unsigned int tune_high_min_millivolts;
 };
=20
 struct cvb_table {
--=20
2.20.1

