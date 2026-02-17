Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83D302773;
	Tue, 17 Feb 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321322; cv=fail; b=r0kaF/XXlAlhMOPMkE/ugCO6rMVZmGsvJv5haO5AvQw3ZWYejwTukCZh9DfLMmweXiybtNHhp9y55sm+SGbNHMJRVh+2lRUVvc8eKz+vp6jdKHBYmNoYMGTDulK5h7dEkgWk0DXrFd8aFC4ewJS4YqIlZ3g17Xn2B3RB42q88hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321322; c=relaxed/simple;
	bh=b78CwHG+k6sd+aqhwJ+iWPvvknkrnC/y5rbXaQ0pYUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I5FJ3WFtxwqE2ySX5dj6/laU2yd5kWqB040a5HgLUK2xm8zJgAFFx6GT5wS5COLEOqKI0kwuUtW8NzFqy31nSQYWUe/zQ+VOg6Uy9jZks7UipCfPHId/dBjqvY7xJu/s+yIaPhBQHtPN/Hr2gLhp991JiRGumiQLjkRwEgmoQ2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Ai/lld2V; arc=fail smtp.client-ip=52.101.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Ai/lld2V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkw4R5djvCXxifs67TMKEoPGzxohgmGcIoiEJQqS1qiIInnXuuaLo3btyW7PyDKdGplVOq/hbMuW9kapdoQ3sWnhZz68eNSlJQlRyhgsBUbW4y7Ay4LgsdjtViEcpVVOVr0Jt7osxRTtDg+rQFl7XiNSjuN+aPXnvt5XYEVc6UElslz+kINzayKedh4HIu9NaEOJlb/gH4C75ft7VXMKY5G4+hdxKmDBOXgi2sInT+6qzhS850+nPAl8qJr5tvaEDyNrtZDJOKw95QsL3xB+CJQx9Txs0lqtZRN0WsxaXY4UlDSur5zFR+CdJB8sBuVPU3FlZaNp/UAf7Pdviy2AIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=bBL+MCY3kG897eJHX4qwpD95a/gDO3mFKMrV9xM9pE0RV1sU8iS67EiKjCdrjumkUR0jEkpbftL28FYO6pCzgiQURQAofrMUQ8fNS03d56HVzt+w5IEqUOdAcIgTbG/FLzALdN7bpuDXnT4uLmat838Kb44lX+5W8g8OQhz9r/4ad/ekXjBTMwK+eeIhEWcmXXGRuEH7ZOYwgeyFGySUCg30ISu0SOlv6njW24UwmFTOzb/aCXW5UwR4mvqVwqZIbNcDGLORADYW/ROrELIxwCe7IuJRcg2F98arfOikAPgotHTPeKOMpcYGVEfa93wnpvrTcadgz9iBXogaMWlo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=Ai/lld2VDYZMfYq9PMPoD7Gajx+7hEi/MuRT1UuxB6SvQIvOM7ewAZpwf/TtGkItIhXWeFvAqNoAP1pVczWYEfPplysmczWzzHJZFKPkutGU3tcvA6TSw6yumMW+wGGqVoew22FrJIdQP8QcO/jUT2Fq7V8fo7AT6Fu3zihSVpuHYWVKkKFToyZ0k1MKGiCITUKoI56jBGRRP/zHumG4rGwELANs25ISPCnd2IpL6QU6vHi8MtDT+PzQjyKLtFz6NMul+pjFHKFrgqESAsYmP50vnN5A3Y3DmRWd0fGpiEVTdRd6q/0emdnOuSypu3FkepriXKhL3m7LpHbrlz6+7Q==
Received: from BYAPR08CA0005.namprd08.prod.outlook.com (2603:10b6:a03:100::18)
 by EA2PR22MB5259.namprd22.prod.outlook.com (2603:10b6:303:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:41:58 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::58) by BYAPR08CA0005.outlook.office365.com
 (2603:10b6:a03:100::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 09:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:41:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 31A39E8F41;
	Tue, 17 Feb 2026 11:41:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Date: Tue, 17 Feb 2026 11:41:52 +0200
Message-ID: <20260217094152.19958-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|EA2PR22MB5259:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6491531f-30c8-4026-4809-08de6e08cb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+hzB+2/4ul0MaoH+5KsAtAZY4SJZVnMvwTXsGudxZl8MRPY4087MGyCG5Ks?=
 =?us-ascii?Q?nPnZG0RT3Yj+ETxhz9ilhTF6VieibkovWkqX24GWHkI2DMD87bp47R2lDQDJ?=
 =?us-ascii?Q?C8BTbQZywrvP11lb1YSaTY+I3tTjS9yP3jnItnKCAepVg8nfa73KHRerV31t?=
 =?us-ascii?Q?Scu02nt9R4sfXufd+TDuQP8gWEiIgQqy81eFcgzC1H26gbNgiT+PCmt+CM7H?=
 =?us-ascii?Q?Ye6/RrofN214yHdxS1/4NldHGol8NnJBWQWLV+ZRf3u0msQXG4iPFRbrAxQi?=
 =?us-ascii?Q?vpvujcG2YWWHu4pRhZ0Au/FwNFa4rkwBbbEjHDFtSIUnVbnq8C2e4DJHHDdF?=
 =?us-ascii?Q?ivvt8ZFBQQP+99a4dn5sqtz67powo7T2ACkNfYLRjE+YN3kJ4jC6sDtnE6Bv?=
 =?us-ascii?Q?Wt5DuXSubgJJpAsDAIWedNTXj0WsIK9CVGwJp9AJ3sKDHSRONor2i7nIkc0P?=
 =?us-ascii?Q?QwGeFpyG/j6HAitbiGkfTLVVjdx5s1f42iY7m0PKTDDN0Jb+Ga3ylwl73KhH?=
 =?us-ascii?Q?fXaA6cK/Xm5wdIEHBpbeyBG8LznVaQx9cbUw0Db0No/x0RSWve4Hpf30Y3V8?=
 =?us-ascii?Q?VDXxL9d8U/MDecYPe6cTDsV8SyJtJKB702+UBoSTZKtgr+H+sD0peOlnVdwU?=
 =?us-ascii?Q?/WLNGT0bYAziKhvQWZi73fyOLhG9KOxYt3iiOdsCBtsDrsIy4YN5w5JEgRWy?=
 =?us-ascii?Q?/Ao/TGI1O/zuGZX/IfuGviuQyf62zacO/++q1Pn4Nuy0xiyzy7VdcKuUwE07?=
 =?us-ascii?Q?apVcoHfYNPSXELpbrp5vGwnUV4zIb1zQPGAoxNtP4xiuUzY8XWb0ZhAyTi7A?=
 =?us-ascii?Q?IMpg4bZoNzct9Ddl9JheErgVX65yX2EeMskKKDp335uyVvTBla5OANnuBlyH?=
 =?us-ascii?Q?4SImORJSkNQCkhSqYN0dLP0UCLD164uCWR7MVBJY5FsycN7JQMyP1pESH2dB?=
 =?us-ascii?Q?2Z1IvyZj+AVbhCh9Ab7AvZGyBwk1aaHY0TImKMF35St3SILYOC9A2xUsM2Ij?=
 =?us-ascii?Q?mazGce0bu93t2RkWzzJeGzX0wmhgnOhQpV/30UoY3RPuAVBgYBfcXa61/m1b?=
 =?us-ascii?Q?uceCOGisf9VybA/FgO90zQwHDyTigvHomjPEK5QAEM5R6631LAZkICk1+gSa?=
 =?us-ascii?Q?wzabEI2M2K69XgIt3XlOj+IA9WcwSF25nuBHghkJ3vWVg/x77ouSYt0VL+pl?=
 =?us-ascii?Q?FcQJdedroJ2jR9Yuwn6sVOf+7WNyykKmm9M4LCXrjkGh2MzdoH7wSVk+tz5Q?=
 =?us-ascii?Q?GRtaYPdJS9nyi99poE/Hb5+p97RteKcFXVfXAUlJPaRI2KqqqD0/ALNHNDME?=
 =?us-ascii?Q?0fKEhhduCXncqK6AnT+TJgG0wVJchV2WTcb++f1WtwfAsleF4APsJA4dhaUz?=
 =?us-ascii?Q?+KnmQUhenrSfvt7rUSL9Ja1hlRdgET5GdySf6FQ8AiT81Dp7U7ew3EQ6yyLr?=
 =?us-ascii?Q?iSB+RvCv/kDLthp8DVYRzcLMTIP8ee2gnt16Vol+jnDy1zhJIOxujLbiV36L?=
 =?us-ascii?Q?WObXZ2E2mJG96aKUHY8MZxaBjqimslNekAYbgpL453arsDgZu1jf/sqsVjEO?=
 =?us-ascii?Q?LF/9/RxIWETU3n0j5f9kRJu64/+2h+xV1ALz52m7CmaVtY3Jif34mmEBBmk6?=
 =?us-ascii?Q?iu5y7yZ884vI/VhUWl3ZxT6VsmB2YeQGBUdTwlRxjnskXo0sY22FWYVzKigU?=
 =?us-ascii?Q?YaXP2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YedSF9MBiR3lWeIlL2tDxQWlk/N5huJttJQffxKeqMJWBzDUOUWZ+3/7qMbxM2A8R3jGIgZHc1ZWLhgSPGArEBFfE9RgtqQv6sN0SaNXp5BfMl3YYkqwG70dXxh1B+MZqg0CDwjHooCT+XCYGzxL85A7egfnrsDSzEe0vrVyQrQM8TOY0i3fj+bP32CokYCyulpmAsTvbM6YTomQylTMHA++T20i9YYFertCGFu+vmSnCtnfUJgRs/5HvAMBQfg9XOo3kL/cNniQHkK9uv9TE95+1AKbeP/wgSIcEO3D3F+4XeOsIGG2r4v27oj3BnYE/Qf1pEY5JgqpLip4fTqcfY5S9Jq4Z87Oi6lA7YEO4WZNCIK47lfGRlkhI3BFqhMQVk8lce1egnRFOxaCHWkfmsMPbZNBKaezpgW6Bc9o9ku4I3Ui3bg21P3y2FryE6jt
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:41:58.1875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6491531f-30c8-4026-4809-08de6e08cb6a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5259

The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/clk/imx/clk-pll14xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 36d0e80b55b8..84279cf9f12b 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
 
 static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
 	PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
+	PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
 	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
 	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
-- 
2.49.0

