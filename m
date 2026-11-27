Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795775784;
	b=ZzTkOWqTBi9uLN+vp0qhoAJdh3ylK/CIATMdImVrW+4GbiKKgvCa/UGC5d9SDp7eRMdc
	 q9mCrpTewer/YAL3KYgvf4ZRRyWEGj1VLHXbUZlp7PjTe0M+FshDak2+d5fadvRBTK3ZL
	 jsZD2iCO2X4itcDvo1DPxVbLrprveM0j/RmhlvdGc16nZ3ga/CQfL9FuzRuj364XeMFNv
	 990WM8VC15Af4PkVAkfLKm/AU878KgdD+v5JRTCzM9syEfq8Ryr/LfdJSRmdtmryien88
	 14hf17OB5ZBUfhv7HO/bwmooJvx7HBujEzCiKXKRLU2Tg6oapMH0dPvrG6OxOwMJkHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775784;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=V+VPUGmTAWqw3XLUwXP0ubMfgBxIlpa/M7zcffCnMTE=;
	b=oKAV0gHb4MeS4zAn66TTMjvuI7YCgP3g6e2+jBAyRZxX2CF+XPBqAyBKYNQVoU+0tZOL
	 znBwsv0gsmzu1Nxorcgw5A6iw6i+WmbsF02xF0lcqRUyTgj7gO8KuNi06cjlsJemw+sVP
	 PsB/NgeFX77TYro/ih/Exv3mprKhgSQhSNe1BkCQ1RrRJAfYSDBGvF/NR2ytOI6blgpi2
	 vCMY7QzQ2jOXxo7pWapQNpYW3CamGF7WEVEGuuSrXaPRm9anG4lwsSDidHFZVnbHOqbY+
	 UMP2VWXIsAS4F5nLdnRg0zcQz1tIhVNZnS9zn5p8UCIdX6FEVcHXulLhT0S4V0wSs3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=U8CTTWrz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.45
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A89606A324;
	Fri, 27 Nov 2026 10:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A89606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=U8CTTWrz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iE8dINHy3tXa1xOGl8cWa3klPpkmsKviq4q4pbaw8zzwnJcpuRGLwJigE5XyCkEY7f4kTp1mY4y/tLbAHdFpE4KCefl2Q5v60yvxoEHAl0tI+1ALQswk8kEAcUhye1iA6HcvPsQS3k7eif3m9CgI+kWkkubcUSFdSqpdYH7fBz3PWCXaSnt2iasEnb04+ZkueS5+KWO6IlFunHKeeFtOfpSAI5+k/YLYBoIm1i5KP1N+Q12G0byFwN/5bS6KPBeWAu9hNTldAPavjiMy7NjIRuAWZX1Ct8CMS1rTF2Xhlo4uKMOCrl8QSY0NYil/MemLuq29/kCdQ6ofB+PX/0wz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+VPUGmTAWqw3XLUwXP0ubMfgBxIlpa/M7zcffCnMTE=;
 b=EZf3DNAo0gZvbjNss6e2lzo93ahsFJr/Y/88yo8d1anf4AAWol4pANQV8rAY6tU6VIX18vx1zJMNcSL9KuXHimnv+VNTv8Ae5ffpy3a7R8LU5VbtaQSB4Jk0MvzwVJCSqJDf/hg6b/842DzWXQ2Im/XhVZNWKdXkBFovzW5YD112zDnxCVk5v9quwm3xMM1+3DVNgmkEoDAKRimFa+NpCiDGSMaZoBV78vzlPK6pV4riaPwWwMBNFyRRwgGL91sixhi9hF3+YdfNrlQk6185Bwe2M8XwIRQevIJ5oijcrPHoNpJOYd6QL7XPUO2Pz8BTRgayWgP6uIQbFGCO1TD+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+VPUGmTAWqw3XLUwXP0ubMfgBxIlpa/M7zcffCnMTE=;
 b=U8CTTWrziXXiPbTtigeOy16y4163Uwrq5ECFvVUKQ/jTl6GeP51z4tGbbrDVeAY4zMTUwI0L2cJ6TgQxGeFVkSo19+61uiIEhJdbtBz8oXpYW4fXW+zv8xSwhgPXZesDauiqLDNDei0ePkbNoXd5YtSVCeASIzNHsYofAuM777GtRXAd6T7tGBWcZKtDTWQ4eB98K6PVVIKivhhErbCPn5UYLm+HaSroghU6gjvPxosoROryBvyrMsgREISsqHUk6KLp6t+D8OvQ8c7SV5TxDQaqC+cgPh1hcvyrpMROfUfi7fOVIbzBU96dwZuLgQaPpWM3RR0xkYiFwDRdffoeEQ==
Received: from AS9PR06CA0275.eurprd06.prod.outlook.com (2603:10a6:20b:45a::24)
 by DUZPR10MB8128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 10:36:19 +0000
Received: from AMS0EPF0000056A.eurprd02.prod.outlook.com
 (2603:10a6:20b:45a:cafe::6c) by AS9PR06CA0275.outlook.office365.com
 (2603:10a6:20b:45a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 10:36:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000056A.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 10:36:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 11:37:08 +0100
Received: from localhost (10.252.15.170) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 11:36:18 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH 0/2] clk: stm32mp13: remove LSE from the RNG1 kernel clock
 sources
Date: Fri, 27 Nov 2026 11:36:16 +0100
Message-ID: <20261127-ups_mp13_clk_rng-v1-0-86bef8c05ce9@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBdCWsC/x3MQQqAIBBA0avErBOaAouuEiFpYw2ViVIE0t2Tl
 m/xf4JIgSlCXyQIdHPk02VgWYBZJ7eQ4Dkb6qqWWKEUl4/q8Ngos28quEVYkih103ZaG8iZD2T
 5+ZfD+L4fZREH6mIAAAA=
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795775777; l=1847;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=DnuW2djP9F7+bnn9ufSCt9gzwW9eMZh1RspE6iHCCII=;
 b=mykrgMoIg/U5zX/+NZ7WmSLjosz/wtsyycIO5TwqxBeGPCydlgEUANmDGMO2tJ4sj7rtaFEBb
 SIMJmerZE1MB+tM7PNAzM/3Xm3xAfgsrjdj02wqoaejR+/xkkCMDRuN
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056A:EE_|DUZPR10MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: cee1c627-7b41-4331-c203-08df4c7245e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|18002099003|3023799007|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8CVWSUURHoPtWEvZgDktPsM+8SLYkfvpIGUmZnPwlz5GpGBmC4j5tGjRGeBCH77B3w7iPpWNoNZjN0au4P4vvgsyaAiFmM3lK3w1I1X2h7TY7SpiYmsJY5+7hHuzzq7wa2M2a4XtqoF7k/03toDMGjM0KzmcJwBTCqJQQ30Kl41nSZjY7C9VGqjkZWL28gemuC/vfkWd2ROJ4+DyuvkQDhkPLDVgCSicLmUfcbKnsgxkwknMatod7uOH+xWLa+BZf90M8eAeu76Gng9M6VK5W/BS6zRGNN/fu1G8IalmS65d8SDj8feXPWQ2F6xE+1jDzqz3u35F7NbHVHIgmew3HtARbdrqymR43gBPOD5uiCHKwNbt6sTEdiN7GCUb50vSUGNcJEx9tpyMuch5DPxDlQUCr8rOQJUJlNWCRqYv89Dg7Lngme5eMqV1mTSSxgdYJSJ7mJvtdV6T0X8EhnwVwsjfq8gWvfItDBPDgWC1cKIahxlEGfKD+weDQmaIWUmppuP+XxECgGlH1yix9UJ1QWGVQy3O5R8oF5VEKmOhLoWNMUQIpyXPAydQb2YguU0tqDX0I7FnDPIOGEuZKYIH7qvyKMfrlT4SEW0vsBCo4EojkOM2yy50dFFAnqvVHEjuIF0TrUcrlDxSOVN52o4BuRv+krR71sUVyBEOnHde8AABt7Ukb7vez1ivh0mknhmC78ZGInfggJP4CeKxRrvi7g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	54RmtwFoUj2ZuHlPsFeEZHpYwZSsto+IvdOJ3DaE19K/hdp0UXySr2k77r664+7tz776joV4D/VIqIGJ2l5P6yIOe5ikcJIqVmlxHtzamih5BuKJsZ5F5Tuv9EOySf6QKIp4GwdzjbBqX/ADgOxyasZb02Nfuw0ZqKbfX/CcKw39pFhUj0pS4G5nsK+8IK3ujEad+j+/arBRSU6ZJMLJ/rzuQCGyueZogcMeIVG8kN42HO5RlzjgkL68gAjWqsSdx5wz7J1jhSgDoFuWx7dyoWOOA2P5xeNRKSqeITMoDQ/EhiO7djZYldRTsfFxsKSf+ztqO96K7bM5jG6MUoOkgzoKep0f60D4Ix0gyYNQ9LZz05W6dYyKcsi0c0LR/F62n79TADcOvUaH7fw0cWoiRCoMNHi3mFKTHd1gJq5Lh4nx94PaFLOiMfLBVfjTX+pt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:36:19.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee1c627-7b41-4331-c203-08df4c7245e5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8128

On STM32MP13 silicon cut 1.1, the value 0b10 of the RNG1SRC field of
RCC_RNG1CKSELR is reserved: LSE can no longer be selected as the RNG1
kernel clock source.

The clock framework assumes that the parent index is the value of the
mux selector field, so the LSE entry can't simply be dropped from the
parent list: ck_lsi, which is encoded as 0b11, would then end up at
index 2 and the driver would write the reserved value 0b10 to select it.

This series therefore:
 - makes use of the (so far unused) "table" member of struct
   stm32_mux_cfg to translate between the parent index and the value of
   the selector field, as the generic clk-mux does. Muxes without a
   table are not affected;
 - removes ck_lse from the parents of rng1_k and describes the remaining
   ones (ck_csi, pll4_r, ck_lsi) with a table { 0, 1, 3 }.

If the hardware reports a value that is not in the table (e.g. LSE left
selected by an earlier boot stage), the clock is reported as an orphan
instead of being given a wrong parent.

rng1_k is not registered when RNG1 is secured (RNG1SECF set), for
instance when OP-TEE owns the RNG, so the series only matters for
configurations where Linux owns RNG1.

No in-tree device tree selects LSE as the parent of RNG1_K.

---
Gabriel Fernandez (2):
      clk: stm32: add support for a parent table in the muxes
      clk: stm32mp13: remove LSE from the RNG1 clock sources

 drivers/clk/stm32/clk-stm32-core.c | 35 +++++++++++++++++++++++++++++------
 drivers/clk/stm32/clk-stm32-core.h |  3 ++-
 drivers/clk/stm32/clk-stm32mp13.c  | 18 +++++++++++++-----
 3 files changed, 44 insertions(+), 12 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261016-ups_mp13_clk_rng-fe616b378bbc

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

