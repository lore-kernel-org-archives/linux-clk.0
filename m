Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044C8C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1D78217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fakne98h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbeLRJNK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:10 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14253 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbeLRJNI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:08 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba1d0000>; Tue, 18 Dec 2018 01:13:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:06 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 01:13:06 -0800
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:06 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:06 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba200002>; Tue, 18 Dec 2018 01:13:06 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 09/20] clk: tegra: dfll: add CVB tables for Tegra210
Date:   Tue, 18 Dec 2018 17:12:21 +0800
Message-ID: <20181218091232.23532-10-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124381; bh=gb60aT2ZCZdSUeJ8O1odnRJW+KjtZ9UjJCTgkeT1ljE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=fakne98hd83+jIcmoJxW0Q2MM4wFCZSL4qFKcy33gYwIxwitgmbo8npt5UojgBs3I
         XPWlQLqvTpr/K6m76WcvFBdluTos++F6l0ObNrYgLS1w22iWvf2t8vTCddGbFlEuih
         RlJYtB3JoxtpmQAd2iJ9o97VgOUyUOytNEt0bsK2ksl7F8KFGEMJMdoFs+sX0rDGKO
         yAPcifc8ny7/AhsFdkTassWm2x+NJMQ6WNNE9jF7eGLohkj/U0Ay3iLi4Wpb6N6TYr
         O5rhlnHDGsnjvU4KD2XNmQ2NQuned6F4ZQe50btM1eZw6PJAOVKi5O2O1OXL0LIw1+
         VEiVajnh9DHzA==
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
---
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
index e87f73957c6f..1fcad135ace0 100644
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

