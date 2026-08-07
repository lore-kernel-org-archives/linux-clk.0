Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CE39A4C4;
	Fri,  7 Aug 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118087; cv=fail; b=VptCDPKZ2BNZzwPBHOANVJ08zAQWIZCeqtlmUvhRMCjacqZKxFXx0TqCRzSWHBGyBeqKCXcaa54eOEzrPoySokgmdxwPHeUopQKuffUmSpAk2EoEGzicaYQ77nFmxilErDnawfb3PO5MUhiUG1NtH1hwc4EgZHbcPUqr/ARwZaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118087; c=relaxed/simple;
	bh=q757Y0yF7r7Uu+EvrREXRtehTD1vfvEJ4LzgmztT7tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIHISdqwnwpd7eWovQRecPjA2l4hszP9cjcGmbw6CID1KoG2zizoR34jZRCZGYyPNe3VzWrmixk14AGmJYEiztIxNM2v1xePDEj6yOLGcOborrJ+kuDyykmKwjr3bPeUxtTLpGXDING7lynjnAmWNr/km9+KMvS6Y0d0Ooh9JqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R2chG1VB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ewml0/qt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R2chG1VB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ewml0/qt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FKFXC781243;
	Fri, 7 Aug 2026 10:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aDfgjw7+DLNoVYeIPbGgCoA44T4i+axZ01HB7rixWyw=; b=
	R2chG1VBHQ8891X9j/DM+hkRzJdAQ7w7LS92GVF8vsKEGYCN3wSWKDlGgaL+YJ8R
	vuFdDgl+TY+cveMfEYG6/C4KCUySypKyZyMpbX0fMv6aadYwkw+PxxuEu32MJwdl
	KcpQfUi2PFLjzn+QzD6mudWNt6fDeEwqQ7t2n78AmuaiJH3EwOssc6H6AijumIrL
	D0C9g5AVF0hAUlu/gGof/tOH65Jyo+sq5HCZRHqTzumbjMmfGYCazUv/XrsBPVql
	2P3Qo+SZDCcnLzQHEyX/PQLsuaYiDLSXG+8HQSqD8Itz650WlbgTBafFqdJdzqVK
	1ZGa5zdvek7EuJrZKt5Org==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020127.outbound.protection.outlook.com [52.101.201.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69vcu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 10:54:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD6SSpr6UD5W0R0TLwq8fH4oV777P+sB28coAhWnWaygSzoLw6XoOLLpJ9hAPg0Mq/d0r7Ovz8fteWaymQHSf5ZuPqLXXAxMThj1BSwboIiSMz+/o1xk8Dq3qP/Xq++MGOgwBHZKeULGmhdIqQ2XQV6PzJkqXlurNUkZrbKYzYSzwA3qKz2UXZkZ+RVUWh1RBTlfxw1bBPhE8Z38+9ZCKyOAuhcIAgjKS7zT3kiXVNe+Tt/VAb7hW5lZyGm4dCQM/Sk5IFv3PHdZb6mLtKBsfgvZH1Kc9MrBgzMIEfDD8WbrC6R4q49X49ILukWTYPIbwZGbblruelI/tx27a2zF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDfgjw7+DLNoVYeIPbGgCoA44T4i+axZ01HB7rixWyw=;
 b=poJaMK3756Eil0jOw52s1jdxNlRhrEc3Psq302OhN+YvWc4uhqZSgdvRfFP+LA8FCyg/FYw+CPyDIz6OGqTLZ4J0j3UzBCWz04MQFVjwUFoI4NssYrgRIHWoTl8cVQfTh3+6B9w/vOL7lpIcvO4Kqhaba6zkit5jRZq8/oTqkeGCkZKSRrm1p703XYxdIA0zwHPJ6+/l1SHQpqjZeS4NBW2QF5hJCkKwmxdKUvhrzn7FmWlefwI8Ze4fAVcR8YhSUGE5JUeelZDuz5CX8/RAfem52TkUtMcpMoaLqGpc/Ocy8g2JRW50uI4YBbhd5Z1e9p9dBleWhf0GYm2gXE+mIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDfgjw7+DLNoVYeIPbGgCoA44T4i+axZ01HB7rixWyw=;
 b=ewml0/qtBLcLMUdqIT5/d4lrKL1XQSLGI15W0RDZGa25cXq/txcHcWDh/cKpbVyHHKYGCEPZ68rjdsukwQWxLuj3bE7bb6maVhpHLsbKjjWHuow9uJ8xuLS3sDw/M+w04oAT/7A3z52JAdxQftZtk5aChxEpbJvBl6is0Elq/9E=
Received: from DM6PR06CA0088.namprd06.prod.outlook.com (2603:10b6:5:336::21)
 by LV0PR19MB9663.namprd19.prod.outlook.com (2603:10b6:408:31f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 15:54:08 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:336:cafe::53) by DM6PR06CA0088.outlook.office365.com
 (2603:10b6:5:336::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 15:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.0
 via Frontend Transport; Fri, 7 Aug 2026 15:54:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 82BD8406552;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CFCC822554;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v7 3/3] clk: cs2600: Add KUnit test for CS2600 driver
Date: Fri,  7 Aug 2026 16:54:06 +0100
Message-ID: <20260807155406.752721-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807155406.752721-1-rf@opensource.cirrus.com>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|LV0PR19MB9663:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fcfa73c0-b11c-496b-dd89-08def49c1d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|36860700016|376014|18002099003|22082099003|16102099003|10067099003|6133799003|56012099006|5023799004|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	e2wtEjf/7Q+pYEmRmQiDP7teHqAusiNbATPBQBnxJl48TUvvXPs//kCFx2HoE4H8Dwa59T3CXR/WVz1J92zQZsNRWLfCNMyc23lHXPN4JrNZJf+NP9i+hs8bcMepltzLX3o6dpyrKYnJW+Jx7m2bppQ1KRw1J8MdHqwgb+0k/MphaH7wg3bM5kchNvkhTU1LH4P9kaXRW3xES4i9d7WN7Wur0u0nnJE1qItRUkQ9X8R2AuIBLF3QXcpn1/e8NRu05xoDgYCXhuiF/7pMZmlm/mQzG3+wEh4J3rsU/V/grNPyGKimSNeRibNdqM5rZ25OOXqITC3JG2LFGDHR0ztWFTQKa52ylT+FTySYRlrbgTgqAwJMoN1yvAbLW3T3wWiioL7nV/3+ZclqdG3EMwVmWNHuUWbi4tSd8hiCGfO4BuZDFQLSElWV3+3bhxfzizHCg9nTqXpr6zcLoK3IkyPt3CamL1OpjeJteXyQIaE5AqT5qIZc5JpXx1pO7myXxenmRQj0E8xePvx8rrJejfTVtJwsHWodnrfJkJr6WDhKA0HZolVQsG9HaF7CjUgc42TbcIdo7scULH2f0puun5UHNR9lCrejo7lX2dFfOwBTe4xhBrKyzd61inpCm0aFmRusuBOJw+MW+62YSJgHOoG5yFR7TQRhii5SqfpCafia7HfTjav8S5C7qWfoJbR0fJ+o/Qslh846G/mUbcei0wLulw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(16102099003)(10067099003)(6133799003)(56012099006)(5023799004)(3023799007)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vXJpQok0+SehtNZl1hzpz8pNOqySwzzS5PZT8Vrf44zpmxeamruEVlnvbgTf2UxXQlu7LzcCvYUBzO/PVL3/7sK05beC9VeKtrITylDvvXZKP2RT0P1a/YtTupFTIRJ1lGWLqEqK+FQ4BflSc+uATUyf8lmYyHnCVJqsU4hKjL2yAd6Jn+FM0CUmGXbha5kxWNdssiPESPrQi6SUMNqb/qOolNTNJ8UObTq7yQ+BVsHZ4x9bFj1sUTmtq4DvGRsOuUokMVnxRknIPWTU6NtAY6gt5jM4QGp5mMQ7Q/yBYan7lmqDAsKH/2xYg0blxpKW8Yu6QYopzJPBBUgupDEuAkjF9SImL4qH7f10RWSLpEX/VRltjNi6etA5hNAwNlJT8l1jUFHFA4GOc0LgbZGw+CPpACIb2CIaTpXf9qLrxaOOFZ1r7GG1fuIqmv1c+X0D
X-Exchange-RoutingPolicyChecked:
	fLFQPhVI6BkMaqMSVYMV+zCfdwosLMD6MGnmGW6xP4ui1mSZDn4YqIAM9akc9PdaO5Dqbkq+sT17hygm9fScP6C5LEwqQPWxam5oT4Y2/ZgSEdK3ByzSQgMFmPD+ZZKck4HpNxRt0fRmL8fV6XtwIIBXnOK1xzYmUv1JhtghGCXO1XbyBHfTC7NYzse7PqWnvkugadwP7Pr42+ROJefNZySfCFBXD/fEAWyUIGjrnXulvpl+1bXk1OWwAoOdHQ2T70DGuqns6SRe2dZTeAXFBbU6dgEpxktGZRLLHh6ksus549osE/s3hiccn5xPQkHI6NoyGHNdlu6WXpvgd+5bwQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:54:07.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfa73c0-b11c-496b-dd89-08def49c1d4c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9663
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfX64X7NKokjhrX
 RqlNTb1gK9XJCUl1+RhEvjO6MlOiL/g+1nesE0kxhMpenZNZgMRIgy8AP67wrj1druBRbQ2GuQT
 CGe4kP2CjmjVSq1/9RlwCO5jptYsIRA=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75ffb4 cx=c_pps
 a=PudVcg9mnr0bxBTXJVVJTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=DkNOkyxyAGSGt88BuvQA:9
X-Proofpoint-GUID: joKB3VSLDbfbEIKiLx2L4AMe0W8QQRS0
X-Proofpoint-ORIG-GUID: joKB3VSLDbfbEIKiLx2L4AMe0W8QQRS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfXzXlIdyMuDjsu
 LPr43FB2bOwQ2Fk7u3g8Luk3V0ZVTSB3JCiog8luUrRh/FNzSliU7dF1lOh/5W2fDSBPHveoMW9
 OQb9IChgT4EWFBWGQKeRIWlr5k2F19yElcOq0L3xK8TtMj8QMlm7NHFcBt3ynNrxNxGRId3pLo9
 vmJs2/IzUpBEOUJ9EXhvaLxeryaxJU8nU3gfHzX5MdqglOvYUoFeAnjDRLxOv9vAq5ADKCt6I6D
 MXwoBsDR1LoyLPSW9hSGOsXMCOR+51UauGsx55Hm+QCN5F3urCArEkNQBngQzau9tv8vYUGGbR6
 +27NnN5/Y1eawRU9uWh4vTp1tmmfMX1FK+9ty5SF9V/XozEnC8CWYWt9NcPd0uahvpFPy+NDnqm
 uwMojK7mzZ5kubTqaOaO+CyQYsgmuvJcSkLonOKNKRJanaaCwr0TuQ+N1TOLc4nsgIAHLojdhXt
 RjnXtAMOWacQ5MG/AdQ==
X-Proofpoint-Spam-Reason: safe

Add a KUnit test for the CS2600 clock driver.

This test uses a mock I2C host driver and mock regmap to partially
emulate the hardware. The regmap is permanently in cache-only mode so
that it will act as an emulation of a set of device registers.

The bulk of the testing is to confirm that the frequency ratio and PLL
configuration register fields are set correctly. The PLL configuration
and ratio precision depend on several factors:

- The frequency reference source (REF_CLK_IN or CLK_IN).
- The magnitude of frequency difference between input and output clocks.
- Whether the CS2600 is operating in smart mode.

The test uses hardcoded tables of the expected ratio register settings
for pairs of IN:OUT clock frequencies in various modes. The values in
these tables were derived independently from the calculation code in
the clk-cs2600.c driver. The purpose of this is to avoid false test
passes caused by the test code having the same calculation bug as the
code it is testing. Using an independent source of ratios reduces this
risk. These tables do not attempt to test every possible ratio, but
focus on (a) typical frequencies, and (b) edge cases where rounding is
expected.

Devicetree overlay files are used to configure properties for a variety
of possible hardware configurations. There are test cases to validate
that the properties are applied correctly.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V7:
- Fixed missing clock disable on each loop in cs2600_kunit_synth_ratio(),
  cs2600_kunit_mult_ratio(), cs2600_kunit_smart_ratio() and
  cs2600_kunit_smart_clkin_only_ratio().

- In cs2600_kunit_change_parent_same_clkout() re-read config registers
  after calling clk_set_rate().

- In cs2600_kunit_bclk_divider() and cs2600_kunit_fsync_divider() use a
  64-bit multiple to calculate the delta so that illegal values can't
  make it overflow.

- Fix use-after-put of the device_node in cs2600_kunit_case_common_init().

- Validate arguments in cs2600_kunit_i2c_xfer() instead of assuming they
  cannot be wrong.

- Delete unused local variable in cs2600_kunit_smart_clkin_only_ratio().

- Depend on CONFIG_DTC.
  
New in V6 series.

 drivers/clk/cirrus/Kconfig                    |   14 +
 drivers/clk/cirrus/Makefile                   |   24 +
 drivers/clk/cirrus/clk-cs2600-kunit.c         | 2526 +++++++++++++++++
 drivers/clk/cirrus/clk-cs2600-kunit.h         |   18 +
 drivers/clk/cirrus/kunit_clk_cs2600.dtsi      |   40 +
 .../clk/cirrus/kunit_clk_cs2600_assigned.dtso |   27 +
 .../kunit_clk_cs2600_aux1_out_clk_in.dtso     |   17 +
 ...it_clk_cs2600_aux1_out_clk_in_missing.dtso |   17 +
 ...kunit_clk_cs2600_aux1_out_freq_unlock.dtso |   17 +
 ...unit_clk_cs2600_aux1_out_phase_unlock.dtso |   17 +
 .../kunit_clk_cs2600_aux1_out_ref_clk_in.dtso |   17 +
 .../cirrus/kunit_clk_cs2600_bclk_invert.dtso  |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_duty_1.dtso |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_duty_2.dtso |   17 +
 .../kunit_clk_cs2600_fsync_duty_32.dtso       |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_invert.dtso |   17 +
 .../kunit_clk_cs2600_manual_intosc_clkin.dtso |   17 +
 .../kunit_clk_cs2600_manual_intosc_only.dtso  |   17 +
 .../kunit_clk_cs2600_manual_refclk_clkin.dtso |   16 +
 .../kunit_clk_cs2600_manual_refclk_only.dtso  |   16 +
 .../kunit_clk_cs2600_name_output_clocks.dtso  |   23 +
 ...it_clk_cs2600_smart_clkin_only_intosc.dtso |   19 +
 ...it_clk_cs2600_smart_clkin_only_refclk.dtso |   18 +
 .../cirrus/kunit_clk_cs2600_smart_intosc.dtso |   18 +
 .../cirrus/kunit_clk_cs2600_smart_refclk.dtso |   17 +
 25 files changed, 2980 insertions(+)
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.h
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600.dtsi
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_assigned.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in_missing.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_freq_unlock.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_phase_unlock.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_ref_clk_in.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_bclk_invert.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_1.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_2.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_32.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_invert.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_clkin.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_only.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_clkin.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_only.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_name_output_clocks.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_intosc.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_refclk.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_intosc.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_refclk.dtso

diff --git a/drivers/clk/cirrus/Kconfig b/drivers/clk/cirrus/Kconfig
index 5674d6554f96..fbf1ec8262be 100644
--- a/drivers/clk/cirrus/Kconfig
+++ b/drivers/clk/cirrus/Kconfig
@@ -8,3 +8,17 @@ config COMMON_CLK_CS2600
 	help
 	  If you say yes here you get support for the CS2600 clock synthesizer
 	  and multiplier.
+
+config COMMON_CLK_CS2600_KUNIT_TEST
+	tristate "KUnit test for CS2600 clock driver" if !KUNIT_ALL_TESTS
+	depends on COMMON_CLK_CS2600
+	depends on KUNIT
+	depends on DTC
+	depends on REGULATOR
+	depends on REGULATOR_FIXED_VOLTAGE
+	default KUNIT_ALL_TESTS
+	help
+	  Build the KUnit tests for the Cirrus Logic CS2600
+	  clock driver.
+
+	  If unsure say N.
diff --git a/drivers/clk/cirrus/Makefile b/drivers/clk/cirrus/Makefile
index 182612dbb96a..be59a601d936 100644
--- a/drivers/clk/cirrus/Makefile
+++ b/drivers/clk/cirrus/Makefile
@@ -1,3 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_COMMON_CLK_CS2600)		+= clk-cs2600.o
+
+clk-cs2600_kunit-y :=		clk-cs2600-kunit.o \
+				kunit_clk_cs2600_assigned.dtbo.o \
+				kunit_clk_cs2600_aux1_out_clk_in.dtbo.o \
+				kunit_clk_cs2600_aux1_out_clk_in_missing.dtbo.o \
+				kunit_clk_cs2600_aux1_out_freq_unlock.dtbo.o \
+				kunit_clk_cs2600_aux1_out_phase_unlock.dtbo.o \
+				kunit_clk_cs2600_aux1_out_ref_clk_in.dtbo.o \
+				kunit_clk_cs2600_bclk_invert.dtbo.o \
+				kunit_clk_cs2600_fsync_duty_1.dtbo.o \
+				kunit_clk_cs2600_fsync_duty_2.dtbo.o \
+				kunit_clk_cs2600_fsync_duty_32.dtbo.o \
+				kunit_clk_cs2600_fsync_invert.dtbo.o \
+				kunit_clk_cs2600_manual_intosc_clkin.dtbo.o \
+				kunit_clk_cs2600_manual_intosc_only.dtbo.o \
+				kunit_clk_cs2600_manual_refclk_clkin.dtbo.o \
+				kunit_clk_cs2600_manual_refclk_only.dtbo.o \
+				kunit_clk_cs2600_name_output_clocks.dtbo.o \
+				kunit_clk_cs2600_smart_clkin_only_intosc.dtbo.o \
+				kunit_clk_cs2600_smart_clkin_only_refclk.dtbo.o \
+				kunit_clk_cs2600_smart_intosc.dtbo.o \
+				kunit_clk_cs2600_smart_refclk.dtbo.o
+
+obj-$(CONFIG_COMMON_CLK_CS2600_KUNIT_TEST)	+= clk-cs2600_kunit.o
diff --git a/drivers/clk/cirrus/clk-cs2600-kunit.c b/drivers/clk/cirrus/clk-cs2600-kunit.c
new file mode 100644
index 000000000000..2fd3f3ff4ef3
--- /dev/null
+++ b/drivers/clk/cirrus/clk-cs2600-kunit.c
@@ -0,0 +1,2526 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// KUnit test for the Cirrus Logic CS2600 clock driver.
+//
+// Copyright (C) 2026 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <dt-bindings/clock/cirrus,cs2600-clock.h>
+#include <kunit/clk.h>
+#include <kunit/of.h>
+#include <kunit/platform_device.h>
+#include <kunit/resource.h>
+#include <kunit/test.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-cs2600.h"
+#include "clk-cs2600-kunit.h"
+
+/* Used for non-parameterized tests so that there is a valid value */
+#define CS2600_KUNIT_DEFAULT_REFCLK_RATE 12000000
+
+KUNIT_DEFINE_ACTION_WRAPPER(clk_disable_unprepare_wrapper,
+			    clk_disable_unprepare, struct clk *);
+
+struct cs2600_kunit_priv {
+	struct kunit *test;
+
+	struct platform_driver i2c_pdrv;
+	struct i2c_adapter adapter;
+	struct regmap *regmap;
+	unsigned int force_unlock_status;
+
+	struct platform_driver refclk_pdrv;
+	struct clk_hw *refclk_hw;
+	unsigned int refclk_rate;
+
+	struct platform_driver clkin_pdrv;
+	struct clk_hw *clkin_hw;
+	unsigned int clkin_rate;
+
+	struct platform_driver consumer_pdrv;
+	struct clk *pllout;
+	struct clk *clkout;
+	struct clk *bclk;
+	struct clk *fsync;
+	struct completion consumers_completion;
+};
+
+struct cs2600_kunit_ratio_config {
+	unsigned int clk_in;
+	unsigned int clk_out;
+	u32 r;
+	bool hires;
+};
+
+struct cs2600_kunit_div_config {
+	unsigned int pll_out;
+	unsigned int bf_out;
+	u32 r;
+};
+
+struct cs2600_kunit_params {
+	unsigned int ref_clk;
+	unsigned int clk_in;
+	const struct cs2600_kunit_ratio_config *s_ratios;
+	const struct cs2600_kunit_ratio_config *m_ratios;
+};
+
+/*
+ * Expected ratios are hardcoded from independent known-good data.
+ * This avoids the possibility that calculating them from an algorithm has the
+ * same mistake in both the driver and test code, and so incorrectly marks a
+ * test as passed.
+ *
+ * These are deliberately partially unsorted to help detect bugs.
+ *
+ * Tables for source clocks < 6MHz are for multiplier mode.
+ * Tables for source clocks between 6MHz and 30MHz are for either mode.
+ * Tables for source clocks > 30MHz are for synthesizer mode.
+ * The minimum clk_out is 6.0 MHz and this is only possible for certain
+ * input clocks. Where it is impossible the .r value is given as 0.
+ */
+static const struct cs2600_kunit_ratio_config cs2600_kunit_50_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x3a980000, .hires = false },
+	{ .clk_out =  8000000, .r = 0x27100000, .hires = false },
+	{ .clk_out =  6000000, .r = 0x1d4c0000, .hires = false },
+	{ .clk_out = 24576000, .r = 0x78000000, .hires = false },
+	{ .clk_out = 12000001, .r = 0x3a980051, .hires = false },
+	{ .clk_out = 12000011, .r = 0x3a980385, .hires = false },
+	{ .clk_out = 12000012, .r = 0x3a9803d7, .hires = false },
+	{ .clk_out = 11999999, .r = 0x3a97ffae, .hires = false },
+	{ .clk_out = 11999988, .r = 0x3a97fc28, .hires = false },
+	{ .clk_out = 11999987, .r = 0x3a97fbd7, .hires = false },
+	{ .clk_out =  8000004, .r = 0x27100147, .hires = false },
+	{ .clk_out =  6144000, .r = 0x1e000000, .hires = false },
+	{ .clk_out =  6250000, .r = 0x1e848000, .hires = false },
+	{ .clk_out =  6400000, .r = 0x1f400000, .hires = false },
+	{ .clk_out =  8192000, .r = 0x28000000, .hires = false },
+	{ .clk_out =  9600000, .r = 0x2ee00000, .hires = false },
+	{ .clk_out = 12288000, .r = 0x3c000000, .hires = false },
+	{ .clk_out = 13500000, .r = 0x41eb0000, .hires = false },
+	{ .clk_out = 19200000, .r = 0x5dc00000, .hires = false },
+	{ .clk_out = 22579200, .r = 0x6e400000, .hires = false },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_2k_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x01770000, .hires = false },
+	{ .clk_out =  8000000, .r = 0xfa000000, .hires = true },
+	{ .clk_out =  6000000, .r = 0xbb800000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x03000000, .hires = false },
+	{ .clk_out = 12000001, .r = 0x01770002, .hires = false },
+	{ .clk_out = 12000011, .r = 0x01770016, .hires = false },
+	{ .clk_out = 12000012, .r = 0x01770018, .hires = false },
+	{ .clk_out = 11999999, .r = 0x0176fffd, .hires = false },
+	{ .clk_out = 11999988, .r = 0x0176ffe7, .hires = false },
+	{ .clk_out = 11999987, .r = 0x0176ffe5, .hires = false },
+	{ .clk_out =  8000004, .r = 0xfa000831, .hires = true },
+	{ .clk_out =  6144000, .r = 0xc0000000, .hires = true },
+	{ .clk_out =  6250000, .r = 0xc3500000, .hires = true },
+	{ .clk_out =  6400000, .r = 0xc8000000, .hires = true },
+	{ .clk_out =  8192000, .r = 0x01000000, .hires = false },
+	{ .clk_out =  9600000, .r = 0x012c0000, .hires = false },
+	{ .clk_out = 12288000, .r = 0x01800000, .hires = false },
+	{ .clk_out = 13500000, .r = 0x01a5e000, .hires = false },
+	{ .clk_out = 19200000, .r = 0x02580000, .hires = false },
+	{ .clk_out = 22579200, .r = 0x02c19999, .hires = false },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_48k_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x0fa00000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x0a6aaaaa, .hires = true },
+	{ .clk_out =  6000000, .r = 0x07d00000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x20000000, .hires = true },
+	{ .clk_out = 12000001, .r = 0x0fa00015, .hires = true },
+	{ .clk_out = 12000011, .r = 0x0fa000f0, .hires = true },
+	{ .clk_out = 12000012, .r = 0x0fa00106, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0f9fffea, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0f9ffef9, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0f9ffee4, .hires = true },
+	{ .clk_out =  8000004, .r = 0x0a6aab02, .hires = true },
+	{ .clk_out =  6144000, .r = 0x08000000, .hires = true },
+	{ .clk_out =  6250000, .r = 0x08235555, .hires = true },
+	{ .clk_out =  6400000, .r = 0x08555555, .hires = true },
+	{ .clk_out =  8192000, .r = 0x0aaaaaaa, .hires = true },
+	{ .clk_out =  9600000, .r = 0x0c800000, .hires = true },
+	{ .clk_out = 12288000, .r = 0x10000000, .hires = true },
+	{ .clk_out = 13500000, .r = 0x11940000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x19000000, .hires = true },
+	{ .clk_out = 22579200, .r = 0x1d666666, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_1_4112M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x0880dee, .hires = true },
+	{ .clk_out =  8000000, .r = 0x05ab3f4, .hires = true },
+	{ .clk_out =  6000000, .r = 0,	       .hires = true },
+	{ .clk_out = 24576000, .r = 0x116a3b3, .hires = true },
+	{ .clk_out = 12000001, .r = 0x0880def, .hires = true },
+	{ .clk_out = 12000011, .r = 0x0880df6, .hires = true },
+	{ .clk_out = 12000012, .r = 0x0880df7, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0880ded, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0880de5, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0880de4, .hires = true },
+	{ .clk_out =  8000004, .r = 0x05ab3f7, .hires = true },
+	{ .clk_out =  6144000, .r = 0x045a8ec, .hires = true },
+	{ .clk_out =  6250000, .r = 0x046dc96, .hires = true },
+	{ .clk_out =  6400000, .r = 0x0488ff6, .hires = true },
+	{ .clk_out =  8192000, .r = 0x05ce13b, .hires = true },
+	{ .clk_out =  9600000, .r = 0x06cd7f2, .hires = true },
+	{ .clk_out = 12288000, .r = 0x08b51d9, .hires = true },
+	{ .clk_out = 13500000, .r = 0x0990fac, .hires = true },
+	{ .clk_out = 19200000, .r = 0x0d9afe4, .hires = true },
+	{ .clk_out = 22579200, .r = 0x1000000, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_8M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x00180000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x00100000, .hires = true },
+	{ .clk_out =  6000000, .r = 0x000c0000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x003126e9, .hires = true },
+	{ .clk_out = 12000001, .r = 0x00180000, .hires = true },
+	{ .clk_out = 12000011, .r = 0x00180001, .hires = true },
+	{ .clk_out = 12000012, .r = 0x00180001, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0017ffff, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0017fffe, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0017fffe, .hires = true },
+	{ .clk_out =  8000004, .r = 0x00100000, .hires = true },
+	{ .clk_out =  6144000, .r = 0x000c49ba, .hires = true },
+	{ .clk_out =  6250000, .r = 0x000c8000, .hires = true },
+	{ .clk_out =  6400000, .r = 0x000ccccc, .hires = true },
+	{ .clk_out =  8192000, .r = 0x0010624d, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00133333, .hires = true },
+	{ .clk_out = 12288000, .r = 0x00189374, .hires = true },
+	{ .clk_out = 13500000, .r = 0x001b0000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x00266666, .hires = true },
+	{ .clk_out = 22579200, .r = 0x002d288c, .hires = true },
+	{ .clk_out = 75000000, .r = 0x00960000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x0095ffff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x00400000, .hires = true },
+	{ .clk_out = 49152000, .r = 0x00624dd2, .hires = true },
+	{ .clk_out = 45158400, .r = 0x005a5119, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_12M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x00100000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x000aaaaa, .hires = true },
+	{ .clk_out =  6000000, .r = 0x00080000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x0020c49b, .hires = true },
+	{ .clk_out = 12000001, .r = 0x00100000, .hires = true },
+	{ .clk_out = 12000011, .r = 0x00100000, .hires = true },
+	{ .clk_out = 12000012, .r = 0x00100001, .hires = true },
+	{ .clk_out = 11999999, .r = 0x000fffff, .hires = true },
+	{ .clk_out = 11999988, .r = 0x000ffffe, .hires = true },
+	{ .clk_out = 11999987, .r = 0x000ffffe, .hires = true },
+	{ .clk_out =  8000004, .r = 0x000aaaab, .hires = true },
+	{ .clk_out =  6144000, .r = 0x00083126, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00085555, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00088888, .hires = true },
+	{ .clk_out =  8192000, .r = 0x000aec33, .hires = true },
+	{ .clk_out =  9600000, .r = 0x000ccccc, .hires = true },
+	{ .clk_out = 12288000, .r = 0x0010624d, .hires = true },
+	{ .clk_out = 13500000, .r = 0x00120000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x00199999, .hires = true },
+	{ .clk_out = 22579200, .r = 0x001e1b08, .hires = true },
+	{ .clk_out = 75000000, .r = 0x00640000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x0063ffff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x002aaaaa, .hires = true },
+	{ .clk_out = 49152000, .r = 0x00418937, .hires = true },
+	{ .clk_out = 45158400, .r = 0x003c3611, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_16M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x000c0000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x00080000, .hires = true },
+	{ .clk_out =  6000000, .r = 0x00060000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x00189374, .hires = true },
+	{ .clk_out = 12000001, .r = 0x000c0000, .hires = true },
+	{ .clk_out = 12000011, .r = 0x000c0000, .hires = true },
+	{ .clk_out = 12000012, .r = 0x000c0000, .hires = true },
+	{ .clk_out = 11999999, .r = 0x000bffff, .hires = true },
+	{ .clk_out = 11999988, .r = 0x000bffff, .hires = true },
+	{ .clk_out = 11999987, .r = 0x000bffff, .hires = true },
+	{ .clk_out =  8000004, .r = 0x00080000, .hires = true },
+	{ .clk_out =  6144000, .r = 0x000624dd, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00064000, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00066666, .hires = true },
+	{ .clk_out =  8192000, .r = 0x00083126, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00099999, .hires = true },
+	{ .clk_out = 12288000, .r = 0x000c49ba, .hires = true },
+	{ .clk_out = 13500000, .r = 0x000d8000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x00133333, .hires = true },
+	{ .clk_out = 22579200, .r = 0x00169446, .hires = true },
+	{ .clk_out = 75000000, .r = 0x004b0000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x004affff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x00200000, .hires = true },
+	{ .clk_out = 49152000, .r = 0x003126e9, .hires = true },
+	{ .clk_out = 45158400, .r = 0x002d288c, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_19_2M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x000a0000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x0006aaaa, .hires = true },
+	{ .clk_out =  6000000, .r = 0x00050000, .hires = true },
+	{ .clk_out = 24576000, .r = 0x00147ae1, .hires = true },
+	{ .clk_out = 12000001, .r = 0x000a0000, .hires = true },
+	{ .clk_out = 12000011, .r = 0x000a0000, .hires = true },
+	{ .clk_out = 12000012, .r = 0x000a0000, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0009ffff, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0009ffff, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0009ffff, .hires = true },
+	{ .clk_out =  8000004, .r = 0x0006aaaa, .hires = true },
+	{ .clk_out =  6144000, .r = 0x00051eb8, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00053555, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00055555, .hires = true },
+	{ .clk_out =  8192000, .r = 0x0006d3a0, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00080000, .hires = true },
+	{ .clk_out = 12288000, .r = 0x000a3d70, .hires = true },
+	{ .clk_out = 13500000, .r = 0x000b4000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x00100000, .hires = true },
+	{ .clk_out = 22579200, .r = 0x0012d0e5, .hires = true },
+	{ .clk_out = 75000000, .r = 0x003e8000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x003e7fff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x001aaaaa, .hires = true },
+	{ .clk_out = 49152000, .r = 0x0028f5c2, .hires = true },
+	{ .clk_out = 45158400, .r = 0x0025a1ca, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_24_576M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x0007d000, .hires = true },
+	{ .clk_out =  8000000, .r = 0x00053555, .hires = true },
+	{ .clk_out =  6000000, .r = 0x0003e800, .hires = true },
+	{ .clk_out = 24576000, .r = 0x00100000, .hires = true },
+	{ .clk_out = 12000001, .r = 0x0007d000, .hires = true },
+	{ .clk_out = 12000011, .r = 0x0007d000, .hires = true },
+	{ .clk_out = 12000012, .r = 0x0007d000, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0007cfff, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0007cfff, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0007cfff, .hires = true },
+	{ .clk_out =  8000004, .r = 0x00053555, .hires = true },
+	{ .clk_out =  6144000, .r = 0x00040000, .hires = true },
+	{ .clk_out =  6250000, .r = 0x000411aa, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00042aaa, .hires = true },
+	{ .clk_out =  8192000, .r = 0x00055555, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00064000, .hires = true },
+	{ .clk_out = 12288000, .r = 0x00080000, .hires = true },
+	{ .clk_out = 13500000, .r = 0x0008ca00, .hires = true },
+	{ .clk_out = 19200000, .r = 0x000c8000, .hires = true },
+	{ .clk_out = 22579200, .r = 0x000eb333, .hires = true },
+	{ .clk_out = 75000000, .r = 0x0030d400, .hires = true },
+	{ .clk_out = 74999999, .r = 0x0030d3ff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x0014d555, .hires = true },
+	{ .clk_out = 49152000, .r = 0x00200000, .hires = true },
+	{ .clk_out = 45158400, .r = 0x001d6666, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_25M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x0007ae14, .hires = true },
+	{ .clk_out =  8000000, .r = 0x00051eb8, .hires = true },
+	{ .clk_out =  6000000, .r = 0,		.hires = true },
+	{ .clk_out = 24576000, .r = 0x000fba88, .hires = true },
+	{ .clk_out = 12000001, .r = 0x0007ae14, .hires = true },
+	{ .clk_out = 12000011, .r = 0x0007ae14, .hires = true },
+	{ .clk_out = 12000012, .r = 0x0007ae14, .hires = true },
+	{ .clk_out = 11999999, .r = 0x0007ae14, .hires = true },
+	{ .clk_out = 11999988, .r = 0x0007ae13, .hires = true },
+	{ .clk_out = 11999987, .r = 0x0007ae13, .hires = true },
+	{ .clk_out =  8000004, .r = 0x00051eb8, .hires = true },
+	{ .clk_out =  6144000, .r = 0x0003eea2, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00040000, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00041893, .hires = true },
+	{ .clk_out =  8192000, .r = 0x00053e2d, .hires = true },
+	{ .clk_out =  9600000, .r = 0x000624dd, .hires = true },
+	{ .clk_out = 12288000, .r = 0x0007dd44, .hires = true },
+	{ .clk_out = 13500000, .r = 0x0008a3d7, .hires = true },
+	{ .clk_out = 19200000, .r = 0x000c49ba, .hires = true },
+	{ .clk_out = 22579200, .r = 0x000e7360, .hires = true },
+	{ .clk_out = 75000000, .r = 0x00300000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x002fffff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x00147ae1, .hires = true },
+	{ .clk_out = 49152000, .r = 0x001f7510, .hires = true },
+	{ .clk_out = 45158400, .r = 0x001ce6c0, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_27M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x00071c71, .hires = true },
+	{ .clk_out =  8000000, .r = 0x0004bda1, .hires = true },
+	{ .clk_out =  6000000, .r = 0,		.hires = true },
+	{ .clk_out = 24576000, .r = 0x000e9045, .hires = true },
+	{ .clk_out = 12000001, .r = 0x00071c71, .hires = true },
+	{ .clk_out = 12000011, .r = 0x00071c72, .hires = true },
+	{ .clk_out = 12000012, .r = 0x00071c72, .hires = true },
+	{ .clk_out = 11999999, .r = 0x00071c71, .hires = true },
+	{ .clk_out = 11999988, .r = 0x00071c71, .hires = true },
+	{ .clk_out = 11999987, .r = 0x00071c71, .hires = true },
+	{ .clk_out =  8000004, .r = 0x0004bda1, .hires = true },
+	{ .clk_out =  6144000, .r = 0x0003a411, .hires = true },
+	{ .clk_out =  6250000, .r = 0x0003b425, .hires = true },
+	{ .clk_out =  6400000, .r = 0x0003cae7, .hires = true },
+	{ .clk_out =  8192000, .r = 0x0004dac1, .hires = true },
+	{ .clk_out =  9600000, .r = 0x0005b05b, .hires = true },
+	{ .clk_out = 12288000, .r = 0x00074822, .hires = true },
+	{ .clk_out = 13500000, .r = 0x00080000, .hires = true },
+	{ .clk_out = 19200000, .r = 0x000b60b6, .hires = true },
+	{ .clk_out = 22579200, .r = 0x000d6159, .hires = true },
+	{ .clk_out = 75000000, .r = 0x002c71c7, .hires = true },
+	{ .clk_out = 74999999, .r = 0x002c71c7, .hires = true },
+	{ .clk_out = 32000000, .r = 0x0012f684, .hires = true },
+	{ .clk_out = 49152000, .r = 0x001d208a, .hires = true },
+	{ .clk_out = 45158400, .r = 0x001ac2b2, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_30M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x00066666, .hires = true },
+	{ .clk_out =  8000000, .r = 0x00044444, .hires = true },
+	{ .clk_out =  6000000, .r = 0,		.hires = true },
+	{ .clk_out = 24576000, .r = 0x000d1b71, .hires = true },
+	{ .clk_out = 12000001, .r = 0x00066666, .hires = true },
+	{ .clk_out = 12000011, .r = 0x00066666, .hires = true },
+	{ .clk_out = 12000012, .r = 0x00066666, .hires = true },
+	{ .clk_out = 11999999, .r = 0x00066666, .hires = true },
+	{ .clk_out = 11999988, .r = 0x00066665, .hires = true },
+	{ .clk_out = 11999987, .r = 0x00066665, .hires = true },
+	{ .clk_out =  8000004, .r = 0x00044444, .hires = true },
+	{ .clk_out =  6144000, .r = 0x000346dc, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00035555, .hires = true },
+	{ .clk_out =  6400000, .r = 0x000369d0, .hires = true },
+	{ .clk_out =  8192000, .r = 0x00045e7b, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00051eb8, .hires = true },
+	{ .clk_out = 12288000, .r = 0x00068db8, .hires = true },
+	{ .clk_out = 13500000, .r = 0x00073333, .hires = true },
+	{ .clk_out = 19200000, .r = 0x000a3d70, .hires = true },
+	{ .clk_out = 22579200, .r = 0x000c0ad0, .hires = true },
+	{ .clk_out = 75000000, .r = 0x00280000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x0027ffff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x00111111, .hires = true },
+	{ .clk_out = 49152000, .r = 0x001a36e2, .hires = true },
+	{ .clk_out = 45158400, .r = 0x001815a0, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_ratio_config cs2600_kunit_75M_ratios[] = {
+	{ .clk_out = 12000000, .r = 0x00028f5c, .hires = true },
+	{ .clk_out =  8000000, .r = 0x0001b4e8, .hires = true },
+	{ .clk_out =  6000000, .r = 0,		.hires = true },
+	{ .clk_out = 24576000, .r = 0x00053e2d, .hires = true },
+	{ .clk_out = 12000001, .r = 0x00028f5c, .hires = true },
+	{ .clk_out = 12000011, .r = 0x00028f5c, .hires = true },
+	{ .clk_out = 12000012, .r = 0x00028f5c, .hires = true },
+	{ .clk_out = 11999999, .r = 0x00028f5c, .hires = true },
+	{ .clk_out = 11999988, .r = 0x00028f5b, .hires = true },
+	{ .clk_out = 11999987, .r = 0x00028f5b, .hires = true },
+	{ .clk_out =  8000004, .r = 0x0001b4e8, .hires = true },
+	{ .clk_out =  6144000, .r = 0x00014f8b, .hires = true },
+	{ .clk_out =  6250000, .r = 0x00015555, .hires = true },
+	{ .clk_out =  6400000, .r = 0x00015d86, .hires = true },
+	{ .clk_out =  8192000, .r = 0x0001bf64, .hires = true },
+	{ .clk_out =  9600000, .r = 0x00020c49, .hires = true },
+	{ .clk_out = 12288000, .r = 0x00029f16, .hires = true },
+	{ .clk_out = 13500000, .r = 0x0002e147, .hires = true },
+	{ .clk_out = 19200000, .r = 0x00041893, .hires = true },
+	{ .clk_out = 22579200, .r = 0x0004d120, .hires = true },
+	{ .clk_out = 75000000, .r = 0x00100000, .hires = true },
+	{ .clk_out = 74999999, .r = 0x000fffff, .hires = true },
+	{ .clk_out = 32000000, .r = 0x0006d3a0, .hires = true },
+	{ .clk_out = 49152000, .r = 0x000a7c5a, .hires = true },
+	{ .clk_out = 45158400, .r = 0x0009a240, .hires = true },
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_div_config cs2600_kunit_fsync_divs[] = {
+	{ .pll_out =  6144000, .bf_out =  48000,  .r = 3 },
+	{ .pll_out =  6144000, .bf_out =  96000,  .r = 2 },
+	{ .pll_out =  6144000, .bf_out = 192000,  .r = 1 },
+	{ .pll_out =  6144000, .bf_out = 384000,  .r = 0 },
+
+	{ .pll_out = 12288000, .bf_out =  24000,  .r = 5 },
+	{ .pll_out = 12288000, .bf_out =  48000,  .r = 4 },
+	{ .pll_out = 12288000, .bf_out =  96000,  .r = 3 },
+	{ .pll_out = 12288000, .bf_out = 192000,  .r = 2 },
+	{ .pll_out = 12288000, .bf_out = 384000,  .r = 1 },
+	{ .pll_out = 12288000, .bf_out = 768000,  .r = 0 },
+
+	{ .pll_out = 16384000, .bf_out =  16000,  .r = 6 },
+	{ .pll_out = 16384000, .bf_out =  32000,  .r = 5 },
+	{ .pll_out = 16384000, .bf_out =  64000,  .r = 4 },
+	{ .pll_out = 16384000, .bf_out = 128000,  .r = 3 },
+
+	{ .pll_out = 24576000, .bf_out =  16000,  .r = 10 },
+	{ .pll_out = 24576000, .bf_out =  32000,  .r = 9 },
+	{ .pll_out = 24576000, .bf_out =  48000,  .r = 5 },
+	{ .pll_out = 24576000, .bf_out =  64000,  .r = 8 },
+	{ .pll_out = 24576000, .bf_out =  96000,  .r = 4 },
+	{ .pll_out = 24576000, .bf_out = 128000,  .r = 7 },
+	{ .pll_out = 24576000, .bf_out = 192000,  .r = 3 },
+	{ .pll_out = 24576000, .bf_out = 384000,  .r = 2 },
+	{ .pll_out = 24576000, .bf_out = 768000,  .r = 1 },
+
+	{ .pll_out = 27648000, .bf_out =  24000,  .r = 12 },
+	{ .pll_out = 27648000, .bf_out =  48000,  .r = 11 },
+
+	{ .pll_out = 36864000, .bf_out =  48000,  .r = 9 },
+	{ .pll_out = 36864000, .bf_out =  96000,  .r = 8 },
+	{ .pll_out = 36864000, .bf_out = 192000,  .r = 7 },
+
+	{ .pll_out = 49152000, .bf_out =  48000,  .r = 6 },
+	{ .pll_out = 49152000, .bf_out =  96000,  .r = 5 },
+	{ .pll_out = 49152000, .bf_out = 192000,  .r = 4 },
+	{ .pll_out = 49152000, .bf_out = 384000,  .r = 3 },
+	{ .pll_out = 49152000, .bf_out = 768000,  .r = 2 },
+
+	{ .pll_out =  8467200, .bf_out =  44100,  .r = 7 },
+
+	{ .pll_out = 16934400, .bf_out =  44100,  .r = 8 },
+	{ .pll_out = 16934400, .bf_out =  88200,  .r = 7 },
+
+	{ .pll_out = 11289600, .bf_out =  44100,  .r = 4 },
+	{ .pll_out = 11289600, .bf_out =  88200,  .r = 3 },
+	{ .pll_out = 11289600, .bf_out = 176400,  .r = 2 },
+	{ .pll_out = 11289600, .bf_out = 352800,  .r = 1 },
+	{ .pll_out = 11289600, .bf_out = 705600,  .r = 0 },
+
+	{ .pll_out = 50803200, .bf_out =  44100,  .r = 12 },
+	{ .pll_out = 50803200, .bf_out =  88200,  .r = 11 },
+
+	{ .pll_out = 55296000, .bf_out =  48000,  .r = 12 },
+	{ .pll_out = 55296000, .bf_out =  96000,  .r = 11 },
+
+	{ /* terminator */}
+};
+
+static const struct cs2600_kunit_div_config cs2600_kunit_bclk_divs[] = {
+	{ .pll_out =  6144000, .bf_out =  1536000,  .r = 3 },
+	{ .pll_out =  6144000, .bf_out =  2048000,  .r = 2 },
+	{ .pll_out =  6144000, .bf_out =  3072000,  .r = 1 },
+	{ .pll_out =  6144000, .bf_out =  6144000,  .r = 0 },
+
+	{ .pll_out = 12288000, .bf_out =  1536000,  .r = 5 },
+	{ .pll_out = 12288000, .bf_out =  2048000,  .r = 4 },
+	{ .pll_out = 12288000, .bf_out =  3072000,  .r = 3 },
+	{ .pll_out = 12288000, .bf_out =  4096000,  .r = 2 },
+	{ .pll_out = 12288000, .bf_out =  6144000,  .r = 1 },
+	{ .pll_out = 12288000, .bf_out = 12288000,  .r = 0 },
+
+	{ .pll_out = 16384000, .bf_out =   512000,  .r = 9 },
+	{ .pll_out = 16384000, .bf_out =  1024000,  .r = 7 },
+	{ .pll_out = 16384000, .bf_out =  2048000,  .r = 5 },
+	{ .pll_out = 16384000, .bf_out =  4096000,  .r = 3 },
+
+	{ .pll_out = 24576000, .bf_out =   512000,  .r = 10 },
+	{ .pll_out = 24576000, .bf_out =   768000,  .r = 9 },
+	{ .pll_out = 24576000, .bf_out =  1024000,  .r = 8 },
+	{ .pll_out = 24576000, .bf_out =  1536000,  .r = 7 },
+	{ .pll_out = 24576000, .bf_out =  2048000,  .r = 6 },
+	{ .pll_out = 24576000, .bf_out =  3072000,  .r = 5 },
+	{ .pll_out = 24576000, .bf_out =  4096000,  .r = 4 },
+	{ .pll_out = 24576000, .bf_out =  6144000,  .r = 3 },
+	{ .pll_out = 24576000, .bf_out =  8192000,  .r = 2 },
+	{ .pll_out = 24576000, .bf_out = 12288000,  .r = 1 },
+	{ .pll_out = 24576000, .bf_out = 24576000,  .r = 0 },
+
+	{ .pll_out = 27648000, .bf_out =   576000,  .r = 10 },
+	{ .pll_out = 27648000, .bf_out =   864000,  .r = 9 },
+
+	{ .pll_out = 36864000, .bf_out =  1536000,  .r = 8 },
+	{ .pll_out = 36864000, .bf_out =  3072000,  .r = 6 },
+	{ .pll_out = 36864000, .bf_out =  6144000,  .r = 4 },
+
+	{ .pll_out = 49152000, .bf_out =  1536000,  .r = 9 },
+	{ .pll_out = 49152000, .bf_out =  3072000,  .r = 7 },
+	{ .pll_out = 49152000, .bf_out =  6144000,  .r = 5 },
+	{ .pll_out = 49152000, .bf_out = 12288000,  .r = 3 },
+	{ .pll_out = 49152000, .bf_out = 24576000,  .r = 1 },
+
+	{ .pll_out =  8467200, .bf_out =  1411200,  .r = 4 },
+
+	{ .pll_out = 16934400, .bf_out =  1411200,  .r = 6 },
+	{ .pll_out = 16934400, .bf_out =  2822400,  .r = 4 },
+
+	{ .pll_out = 11289600, .bf_out =  1411200,  .r = 5 },
+	{ .pll_out = 11289600, .bf_out =  2822400,  .r = 3 },
+	{ .pll_out = 11289600, .bf_out =  5644800,  .r = 1 },
+
+	{ .pll_out = 50803200, .bf_out =  1058400,  .r = 10 },
+	{ .pll_out = 50803200, .bf_out =  2116800,  .r = 8 },
+
+	{ .pll_out = 55296000, .bf_out =  1152000,  .r = 10 },
+	{ .pll_out = 55296000, .bf_out =  2304000,  .r = 8 },
+
+	{ /* terminator */}
+};
+
+static void cs2600_kunit_wait_for_probes(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_ASSERT_NE(test, 0,
+			wait_for_completion_timeout(&priv->consumers_completion,
+						    msecs_to_jiffies(1000)));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->pllout);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkout);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->bclk);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->fsync);
+}
+
+static void cs2600_kunit_clock_out_initially_disabled(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int aux2_out_sel;
+
+	/* All clock outputs off */
+	KUNIT_EXPECT_TRUE(test,
+			  regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test,
+			  regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test,
+			  regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS));
+
+	/* PLL off */
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1));
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2));
+
+	/* AUX2_OUT disabled */
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &aux2_out_sel));
+	aux2_out_sel = FIELD_GET(CS2600_AUX2OUT_SEL, aux2_out_sel);
+	KUNIT_EXPECT_EQ(test, 0, aux2_out_sel);
+}
+
+static void cs2600_kunit_aux1_out_disabled(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_TRUE(test,
+			  regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_AUX1_OUT_DIS));
+}
+
+static void cs2600_kunit_aux1_out_enabled(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_FALSE(test,
+			   regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_AUX1_OUT_DIS));
+}
+
+static void cs2600_kunit_aux1_out_ref_clk_in(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_aux1_out_ref_clk_in));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &val));
+	KUNIT_EXPECT_EQ(test, CS2600_AUX1_OUT_REF_CLK_IN_VAL, FIELD_GET(CS2600_AUX1OUT_SEL, val));
+	cs2600_kunit_aux1_out_enabled(test);
+}
+
+static void cs2600_kunit_aux1_out_clk_in(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_aux1_out_clk_in));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &val));
+	KUNIT_EXPECT_EQ(test, CS2600_AUX1_OUT_CLK_IN_VAL, FIELD_GET(CS2600_AUX1OUT_SEL, val));
+	cs2600_kunit_aux1_out_enabled(test);
+}
+
+static void cs2600_kunit_aux1_out_freq_unlock(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_aux1_out_freq_unlock));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &val));
+	KUNIT_EXPECT_EQ(test, CS2600_AUX1_OUT_FREQ_UNLOCK_VAL, FIELD_GET(CS2600_AUX1OUT_SEL, val));
+	cs2600_kunit_aux1_out_enabled(test);
+}
+
+static void cs2600_kunit_aux1_out_phase_unlock(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_aux1_out_phase_unlock));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &val));
+	KUNIT_EXPECT_EQ(test, CS2600_AUX1_OUT_PHASE_UNLOCK_VAL, FIELD_GET(CS2600_AUX1OUT_SEL, val));
+	cs2600_kunit_aux1_out_enabled(test);
+}
+
+static void cs2600_kunit_aux1_out_clk_in_missing(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_aux1_out_clk_in_missing));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG2, &val));
+	KUNIT_EXPECT_EQ(test, CS2600_AUX1_OUT_NO_CLKIN_VAL, FIELD_GET(CS2600_AUX1OUT_SEL, val));
+	cs2600_kunit_aux1_out_enabled(test);
+}
+
+static void cs2600_kunit_bclk_fsync_not_invert(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_intosc_only));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_FALSE(test, FIELD_GET(CS2600_BCLK_INV, val));
+	KUNIT_EXPECT_FALSE(test, FIELD_GET(CS2600_FSYNC_INV, val));
+}
+
+static void cs2600_kunit_bclk_invert(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_bclk_invert));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_TRUE(test, FIELD_GET(CS2600_BCLK_INV, val));
+	KUNIT_EXPECT_FALSE(test, FIELD_GET(CS2600_FSYNC_INV, val));
+}
+
+static void cs2600_kunit_fsync_invert(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_fsync_invert));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_FALSE(test, FIELD_GET(CS2600_BCLK_INV, val));
+	KUNIT_EXPECT_TRUE(test, FIELD_GET(CS2600_FSYNC_INV, val));
+}
+
+/* Register field value is correct for FSYNC duty cycle 50:50 */
+static void cs2600_kunit_fsync_duty_50_50(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_intosc_only));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_EQ(test, 0, FIELD_GET(CS2600_FSYNC_DUTY_CYCLE_MASK, val));
+}
+
+/* Register field value is correct for FSYNC duty cycle of 1 BCLK */
+static void cs2600_kunit_fsync_duty_1(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_fsync_duty_1));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_EQ(test, 1, FIELD_GET(CS2600_FSYNC_DUTY_CYCLE_MASK, val));
+}
+
+/* Register field value is correct for FSYNC duty cycle of 2 BCLKs */
+static void cs2600_kunit_fsync_duty_2(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_fsync_duty_2));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_EQ(test, 2, FIELD_GET(CS2600_FSYNC_DUTY_CYCLE_MASK, val));
+}
+
+/* Register field value is correct for FSYNC duty cycle of 32 BCLKs */
+static void cs2600_kunit_fsync_duty_32(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_fsync_duty_32));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &val));
+	KUNIT_EXPECT_EQ(test, 6, FIELD_GET(CS2600_FSYNC_DUTY_CYCLE_MASK, val));
+}
+
+/* Test DT renaming of output clocks is applied correctly */
+static void cs2600_kunit_name_output_clocks(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_name_output_clocks));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_STREQ(test, CS2600_KUNIT_CLKOUT_RENAME, __clk_get_name(priv->clkout));
+	KUNIT_EXPECT_STREQ(test, CS2600_KUNIT_BCLK_RENAME, __clk_get_name(priv->bclk));
+	KUNIT_EXPECT_STREQ(test, CS2600_KUNIT_FSYNC_RENAME, __clk_get_name(priv->fsync));
+}
+
+static void cs2600_kunit_sysclk_source_is_internal(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &val));
+	KUNIT_EXPECT_EQ(test, 2, FIELD_GET(CS2600_SYSCLK_SRC_MASK, val));
+}
+
+static void cs2600_kunit_sysclk_source_is_ref_clk_in(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val;
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &val));
+	KUNIT_EXPECT_EQ(test, 1, FIELD_GET(CS2600_SYSCLK_SRC_MASK, val));
+}
+
+/* CLKOUT, BCLK_OUT and FSYNC_OUT all have PLL_OUT as their parent clock */
+static void cs2600_kunit_parent_tree(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_ASSERT_FALSE(test, IS_ERR_OR_NULL(priv->pllout));
+	KUNIT_EXPECT_TRUE(test, clk_is_match(priv->pllout, clk_get_parent(priv->clkout)));
+	KUNIT_EXPECT_TRUE(test, clk_is_match(priv->pllout, clk_get_parent(priv->bclk)));
+	KUNIT_EXPECT_TRUE(test, clk_is_match(priv->pllout, clk_get_parent(priv->fsync)));
+}
+
+/* REFLK_CLK_IN is the only parent of the PLL */
+static void cs2600_kunit_single_refclk_parent(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	struct clk_hw *cs2600_pll_clk_hw = __clk_get_hw(clk_get_parent(priv->clkout));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs2600_pll_clk_hw);
+	KUNIT_EXPECT_EQ(test, 1, clk_hw_get_num_parents(cs2600_pll_clk_hw));
+	KUNIT_EXPECT_PTR_EQ(test, priv->refclk_hw, clk_hw_get_parent(cs2600_pll_clk_hw));
+}
+
+/*
+ * In manual mode using the internal oscillator, the choice of frequency
+ * references is the internal oscillator or CLK_IN.
+ */
+static void cs2600_kunit_intosc_clkin_parents(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	struct clk_hw *cs2600_pll_clk_hw = __clk_get_hw(clk_get_parent(priv->clkout));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs2600_pll_clk_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_EXPECT_EQ(test, 2, clk_hw_get_num_parents(cs2600_pll_clk_hw));
+	KUNIT_EXPECT_PTR_EQ(test, priv->clkin_hw,
+			    clk_hw_get_parent_by_index(cs2600_pll_clk_hw, 1));
+}
+
+/*
+ * In smart mode the parent source isn't selectable and the only parent
+ * should be CLK_IN.
+ */
+static void cs2600_kunit_smart_parents(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	struct clk_hw *cs2600_pll_clk_hw = __clk_get_hw(clk_get_parent(priv->clkout));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs2600_pll_clk_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_EXPECT_EQ(test, 1, clk_hw_get_num_parents(cs2600_pll_clk_hw));
+	KUNIT_EXPECT_PTR_EQ(test, priv->clkin_hw, clk_hw_get_parent(cs2600_pll_clk_hw));
+}
+
+/* Assert that PLL has both REF_CLK_IN and CLK_IN as parents */
+static void cs2600_kunit_refclk_clkin_parents(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	struct clk_hw *cs2600_pll_clk_hw = __clk_get_hw(clk_get_parent(priv->clkout));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs2600_pll_clk_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_EXPECT_EQ(test, 2, clk_hw_get_num_parents(cs2600_pll_clk_hw));
+	KUNIT_EXPECT_PTR_EQ(test, priv->refclk_hw,
+			    clk_hw_get_parent_by_index(cs2600_pll_clk_hw, 0));
+	KUNIT_EXPECT_PTR_EQ(test, priv->clkin_hw,
+			    clk_hw_get_parent_by_index(cs2600_pll_clk_hw, 1));
+}
+
+/* REF_CLK divider is set correctly to give a valid SYSCLK */
+static void cs2600_kunit_ref_clk_divider(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int val, sysclk_rate;
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &val));
+	switch (FIELD_GET(CS2600_REF_CLK_IN_DIV_MASK, val)) {
+	case 0:
+		sysclk_rate = params->ref_clk / 4;
+		break;
+	case 1:
+		sysclk_rate = params->ref_clk / 2;
+		break;
+	case 2:
+		sysclk_rate = params->ref_clk;
+		break;
+	default:
+		KUNIT_FAIL(test, "Illegal REF_CLK_IN_DIV: %#lx",
+			   FIELD_GET(CS2600_REF_CLK_IN_DIV_MASK, val));
+		return;
+	}
+
+	KUNIT_EXPECT_GE(test, sysclk_rate,  8000000);
+	KUNIT_EXPECT_LE(test, sysclk_rate, 18750000);
+}
+
+static unsigned int cs2600_kunit_get_ratio_val(struct kunit *test,
+					       unsigned int ratio_sel)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int addr1, addr2, val1, val2;
+
+	switch (ratio_sel) {
+	case 0:
+		addr1 = CS2600_RATIO1_1;
+		addr2 = CS2600_RATIO1_2;
+		break;
+	case 1:
+		addr1 = CS2600_RATIO2_1;
+		addr2 = CS2600_RATIO2_2;
+		break;
+	default:
+		KUNIT_ASSERT_LT(test, ratio_sel, 1);
+		return 0;
+	}
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, addr1, &val1));
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, addr2, &val2));
+
+	return (val1 << 16) | val2;
+}
+
+/* Synthesizer ratio is set correctly */
+static void cs2600_kunit_synth_ratio(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	const struct cs2600_kunit_ratio_config *ratios = params->s_ratios;
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int ratio_sel, pll_cfg2, ratio;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, ratios);
+
+	for (i = 0; ratios[i].clk_out != 0; i++) {
+		/* 6 MHz is out-of-range for some input clocks */
+		if (ratios[i].r == 0) {
+			KUNIT_ASSERT_EQ(test, ratios[i].clk_out, 6000000);
+			continue;
+		}
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, ratios[i].clk_out),
+				    "clk_out:%u s:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_prepare_enable(priv->clkout),
+				    "clk_out:%u s:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+		KUNIT_ASSERT_EQ(test, 0,
+				kunit_add_action_or_reset(test,
+							  clk_disable_unprepare_wrapper,
+							  priv->clkout));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &ratio_sel));
+		ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, ratio_sel);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_NE_MSG(test, 0, ratio,
+				    "clk_out:%u s:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+
+		/* M_RATIO_SEL must be the same as S_RATIO_SEL */
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_EXPECT_EQ(test, ratio_sel, FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2));
+
+		/* PLL_MODE must be synthesizer */
+		KUNIT_EXPECT_EQ(test, 0, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
+
+		KUNIT_EXPECT_EQ_MSG(test, ratios[i].r, ratio,
+				    "clk_out:%u s:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+
+		kunit_release_action(test, clk_disable_unprepare_wrapper, priv->clkout);
+	}
+}
+
+/* Multiplier mode ratio is set correctly */
+static void cs2600_kunit_mult_ratio(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	const struct cs2600_kunit_ratio_config *ratios = params->m_ratios;
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int ratio_sel, pll_cfg1, pll_cfg2, pll_cfg3, ratio;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, ratios);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw->clk);
+
+	/* Switch parent to clk_in */
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->pllout);
+	KUNIT_EXPECT_EQ(test, 0, clk_set_parent(priv->pllout, priv->clkin_hw->clk));
+
+	for (i = 0; ratios[i].clk_out != 0; i++) {
+		/* 6 MHz is out-of-range for some input clocks */
+		if (ratios[i].r == 0) {
+			KUNIT_ASSERT_EQ(test, ratios[i].clk_out, 6000000);
+			continue;
+		}
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, ratios[i].clk_out),
+				    "clk_out:%u m:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_prepare_enable(priv->clkout),
+				    "clk_out:%u m:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+		KUNIT_ASSERT_EQ(test, 0,
+				kunit_add_action_or_reset(test,
+							  clk_disable_unprepare_wrapper,
+							  priv->clkout));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		ratio_sel = FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_NE_MSG(test, 0, ratio,
+				    "clk_out:%u m:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+
+		/* S_RATIO_SEL must be the same as M_RATIO_SEL */
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_EXPECT_EQ(test, ratio_sel, FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1));
+
+		/* PLL_MODE must be multiplier */
+		KUNIT_EXPECT_EQ(test, 1, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+		KUNIT_EXPECT_EQ(test, ratios[i].hires, FIELD_GET(CS2600_RATIO_CFG, pll_cfg3));
+
+		KUNIT_EXPECT_EQ_MSG(test, ratios[i].r, ratio,
+				    "clk_out:%u m:%#x\n",
+				    ratios[i].clk_out, ratios[i].r);
+
+		kunit_release_action(test, clk_disable_unprepare_wrapper, priv->clkout);
+	}
+}
+
+/* Synth and mult ratios are set correct in smart mode. */
+static void cs2600_kunit_smart_ratio(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int ratio_sel, pll_cfg1, pll_cfg2, pll_cfg3, ratio;
+	u64 actual_fout_20_20;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, params->m_ratios);
+	KUNIT_ASSERT_NOT_NULL(test, params->s_ratios);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw->clk);
+
+	for (i = 0;
+	     (params->s_ratios[i].clk_out != 0) && (params->m_ratios[i].clk_out != 0);
+	     i++) {
+		/* Sanity check our test data */
+		KUNIT_ASSERT_EQ(test, params->s_ratios[i].clk_out,  params->m_ratios[i].clk_out);
+
+		/* 6 MHz is out-of-range for some input clocks */
+		if ((params->m_ratios[i].r == 0) || (params->s_ratios[i].r == 0)) {
+			KUNIT_ASSERT_EQ(test, params->m_ratios[i].clk_out, 6000000);
+			continue;
+		}
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, params->m_ratios[i].clk_out),
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_prepare_enable(priv->clkout),
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+		KUNIT_ASSERT_EQ(test, 0,
+				kunit_add_action_or_reset(test,
+							  clk_disable_unprepare_wrapper,
+							  priv->clkout));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		/* In smart mode S_RATIO_SEL must be different from M_RATIO_SEL */
+		KUNIT_EXPECT_NE(test,
+				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2),
+				FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1));
+
+		ratio_sel = FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_NE_MSG(test, 0, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		KUNIT_EXPECT_EQ(test, params->m_ratios[i].hires,
+				FIELD_GET(CS2600_RATIO_CFG, pll_cfg3));
+
+		KUNIT_EXPECT_EQ_MSG(test, params->m_ratios[i].r, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		if (params->m_ratios[i].hires)
+			actual_fout_20_20 = (u64)ratio * priv->clkin_rate;
+		else
+			actual_fout_20_20 = ((u64)ratio * priv->clkin_rate) << 8;
+
+		ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_NE_MSG(test, 0, ratio,
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		/*
+		 * The synth ratio is based on the actual mult ratio output,
+		 * not the original requested target rate, so the ratio is not
+		 * necessarily REFCLK_IN:TARGET_RATE.
+		 * Other test cases prove that the synth ratio calculation is
+		 * correct so here only test that the actual mult output rate
+		 * lies somewhere within the chosen synth ratio band.
+		 */
+		KUNIT_EXPECT_GE_MSG(test, actual_fout_20_20,
+				    (u64)ratio * priv->refclk_rate,
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+		KUNIT_EXPECT_LT_MSG(test, actual_fout_20_20,
+				    (u64)(ratio + 1) * priv->refclk_rate,
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		kunit_release_action(test, clk_disable_unprepare_wrapper, priv->clkout);
+	}
+}
+
+/*
+ * In smart mode with clkin-only the synth ratio should be 0 to suppress
+ * output while REF_CLK_IN is the frequency reference.
+ */
+static void cs2600_kunit_smart_clkin_only_ratio(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int ratio_sel, pll_cfg1, pll_cfg2, pll_cfg3, ratio;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, params->m_ratios);
+	KUNIT_ASSERT_NOT_NULL(test, params->s_ratios);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->clkin_hw->clk);
+
+	for (i = 0;
+	     (params->s_ratios[i].clk_out != 0) && (params->m_ratios[i].clk_out != 0);
+	     i++) {
+		/* 6 MHz is out-of-range for some input clocks */
+		if ((params->m_ratios[i].r == 0) || (params->s_ratios[i].r == 0)) {
+			KUNIT_ASSERT_EQ(test, params->m_ratios[i].clk_out, 6000000);
+			continue;
+		}
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, params->m_ratios[i].clk_out),
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_prepare_enable(priv->clkout),
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+		KUNIT_ASSERT_EQ(test, 0,
+				kunit_add_action_or_reset(test,
+							  clk_disable_unprepare_wrapper,
+							  priv->clkout));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		/* In smart mode S_RATIO_SEL must be different from M_RATIO_SEL */
+		KUNIT_EXPECT_NE(test,
+				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2),
+				FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1));
+
+		ratio_sel = FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_NE_MSG(test, 0, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		KUNIT_EXPECT_EQ(test, params->m_ratios[i].hires,
+				FIELD_GET(CS2600_RATIO_CFG, pll_cfg3));
+
+		KUNIT_EXPECT_EQ_MSG(test, params->m_ratios[i].r, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		/* In CLK_IN-only mode the S_RATIO must be zero */
+		ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_EQ_MSG(test, 0, ratio,
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		kunit_release_action(test, clk_disable_unprepare_wrapper, priv->clkout);
+	}
+}
+
+/* Change parent without changing output rate */
+static void cs2600_kunit_change_parent_same_clkout(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	struct cs2600_kunit_priv *priv = test->priv;
+	struct clk *refclk = clk_hw_get_clk_kunit(test, priv->refclk_hw, NULL);
+	struct clk *clkin = clk_hw_get_clk_kunit(test, priv->clkin_hw, NULL);
+	unsigned int ratio_sel, pll_cfg1, pll_cfg2, pll_cfg3, ratio;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, params->s_ratios);
+	KUNIT_ASSERT_NOT_NULL(test, params->m_ratios);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->pllout);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, refclk);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clkin);
+
+	for (i = 0;
+	     (params->s_ratios[i].clk_out != 0) && (params->m_ratios[i].clk_out != 0);
+	     i++) {
+		/* Sanity check our test data */
+		KUNIT_ASSERT_EQ(test, params->s_ratios[i].clk_out,  params->m_ratios[i].clk_out);
+
+		/* 6 MHz is out-of-range for some input clocks */
+		if ((params->m_ratios[i].r == 0) || (params->s_ratios[i].r == 0)) {
+			KUNIT_ASSERT_EQ(test, params->m_ratios[i].clk_out, 6000000);
+			continue;
+		}
+
+		/* REF_CLK_IN parent should be synth mode */
+		KUNIT_EXPECT_EQ(test, 0, clk_set_parent(priv->pllout, refclk));
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, params->s_ratios[i].clk_out),
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		KUNIT_EXPECT_EQ(test, 0, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
+		KUNIT_EXPECT_EQ(test, FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1),
+				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2));
+
+		ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_EQ_MSG(test, params->s_ratios[i].r, ratio,
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		/*
+		 * Change to CLK_IN without changing rate, ratio should be
+		 * changed to multiplier mode.
+		 */
+		KUNIT_EXPECT_EQ(test, 0, clk_set_parent(priv->pllout, clkin));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		KUNIT_EXPECT_EQ(test, 1, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
+		KUNIT_EXPECT_EQ(test, FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1),
+				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2));
+
+		/* Ratio should have changed if reference frequency has changed */
+		if (clk_get_rate(refclk) != clk_get_rate(clkin)) {
+			ratio_sel = FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);
+			ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+			KUNIT_EXPECT_NE_MSG(test, params->s_ratios[i].r, ratio,
+					    "clk_out:%u\n", params->s_ratios[i].clk_out);
+		}
+
+		/* clk_set_rate() should recalculate based on new parent frequency */
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, params->m_ratios[i].clk_out),
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		ratio_sel = FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_EQ_MSG(test, params->m_ratios[i].r, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+
+		/*
+		 * Change back to default parent and it should be synth mode again
+		 */
+		KUNIT_EXPECT_EQ(test, 0, clk_set_parent(priv->pllout, refclk));
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		KUNIT_EXPECT_EQ(test, 0, FIELD_GET(CS2600_PLL_MODE_SEL, pll_cfg2));
+		KUNIT_EXPECT_EQ(test, FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1),
+				FIELD_GET(CS2600_M_RATIO_SEL_MASK, pll_cfg2));
+
+		/* Ratio should have changed if reference frequency has changed */
+		if (clk_get_rate(refclk) != clk_get_rate(clkin)) {
+			ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
+			ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+			KUNIT_EXPECT_NE_MSG(test, params->m_ratios[i].r, ratio,
+					    "clk_out:%u\n", params->s_ratios[i].clk_out);
+		}
+
+		/* clk_set_rate() should recalculate based on new parent frequency */
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->clkout, params->s_ratios[i].clk_out),
+				    "clk_out:%u\n", params->s_ratios[i].clk_out);
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG1, &pll_cfg1));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG2, &pll_cfg2));
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_PLL_CFG3, &pll_cfg3));
+
+		ratio_sel = FIELD_GET(CS2600_S_RATIO_SEL_MASK, pll_cfg1);
+		ratio = cs2600_kunit_get_ratio_val(test, ratio_sel);
+		KUNIT_EXPECT_EQ_MSG(test, params->s_ratios[i].r, ratio,
+				    "clk_out:%u\n", params->m_ratios[i].clk_out);
+	}
+}
+
+/* PLL_EN bits match logical clock enable/disable state */
+static void cs2600_kunit_pll_enable_disable(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1));
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2));
+
+	KUNIT_EXPECT_EQ(test, 0, clk_set_rate(priv->pllout, 12000000));
+	KUNIT_EXPECT_EQ(test, 0, clk_prepare_enable(priv->pllout));
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   clk_disable_unprepare_wrapper,
+							   priv->pllout));
+
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2));
+
+	kunit_release_action(test, clk_disable_unprepare_wrapper, priv->pllout);
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1));
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2));
+}
+
+/* Clock prepare fails if PLL does not lock */
+static void cs2600_kunit_pll_no_lock(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	priv->force_unlock_status = true;
+
+	KUNIT_EXPECT_EQ(test, 0, clk_set_rate(priv->pllout, 12000000));
+	KUNIT_EXPECT_LT(test, clk_prepare_enable(priv->pllout), 0);
+
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1));
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2));
+}
+
+/* CLK_OUT_DIS bit matches logical clock enable/disable state */
+static void cs2600_kunit_clk_out_enable_disable(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1,
+						 CS2600_CLK_OUT_DIS));
+
+	KUNIT_EXPECT_EQ(test, 0, clk_set_rate(priv->clkout, 12000000));
+	KUNIT_EXPECT_EQ(test, 0, clk_prepare_enable(priv->clkout));
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   clk_disable_unprepare_wrapper,
+							   priv->clkout));
+
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1,
+						  CS2600_CLK_OUT_DIS));
+
+	kunit_release_action(test, clk_disable_unprepare_wrapper, priv->clkout);
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_PLL_CFG1,
+						 CS2600_CLK_OUT_DIS));
+}
+
+/*
+ * BCLK_OUT_DIS bit matches logical clock enable/disable state
+ * and enable/disable of BCLK clk does not affect FSYNC_OUT_DIS bit.
+ */
+static void cs2600_kunit_bclk_enable_disable(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_BCLK_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_FSYNC_OUT_DIS));
+
+	KUNIT_EXPECT_EQ(test, 0, clk_set_rate(priv->bclk, 1500000));
+	KUNIT_EXPECT_EQ(test, 0, clk_prepare_enable(priv->bclk));
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   clk_disable_unprepare_wrapper,
+							   priv->bclk));
+
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						  CS2600_BCLK_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_FSYNC_OUT_DIS));
+
+	kunit_release_action(test, clk_disable_unprepare_wrapper, priv->bclk);
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_BCLK_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_FSYNC_OUT_DIS));
+}
+
+/* BCLK divider register value is correct */
+static void cs2600_kunit_bclk_divider(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int out_cfg1, bclk_div;
+	uint64_t fdelta;
+	int i;
+
+	for (i = 0; cs2600_kunit_bclk_divs[i].pll_out != 0; i++) {
+		/* PLL_OUT is the input clock to the BCLK divider */
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->pllout, cs2600_kunit_bclk_divs[i].pll_out),
+				    "pll_out:%u bclk:%u\n",
+				    cs2600_kunit_bclk_divs[i].pll_out,
+				    cs2600_kunit_bclk_divs[i].bf_out);
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->bclk, cs2600_kunit_bclk_divs[i].bf_out),
+				    "clk_out:%u bclk:%u\n",
+				    cs2600_kunit_bclk_divs[i].pll_out,
+				    cs2600_kunit_bclk_divs[i].bf_out);
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &out_cfg1));
+		bclk_div = FIELD_GET(CS2600_BCLK_DIV_MASK, out_cfg1);
+		KUNIT_EXPECT_EQ_MSG(test, bclk_div, cs2600_kunit_bclk_divs[i].r,
+				    "clk_out:%u bclk:%u\n",
+				    cs2600_kunit_bclk_divs[i].pll_out,
+				    cs2600_kunit_bclk_divs[i].bf_out);
+
+		/*
+		 * Actual reported frequency can be slightly out because of
+		 * PLL resolution, but should be within worst-case PPM.
+		 */
+		fdelta = (cs2600_kunit_bclk_divs[i].bf_out * CS2600_20_12_PPM) >> 20;
+		KUNIT_EXPECT_GE_MSG(test, clk_get_rate(priv->bclk),
+				    cs2600_kunit_bclk_divs[i].bf_out - fdelta,
+				    "clk_out:%u bclk:%u\n",
+				    cs2600_kunit_bclk_divs[i].pll_out,
+				    cs2600_kunit_bclk_divs[i].bf_out);
+		KUNIT_EXPECT_LE_MSG(test, clk_get_rate(priv->bclk),
+				    cs2600_kunit_bclk_divs[i].bf_out,
+				    "clk_out:%u bclk:%u\n",
+				    cs2600_kunit_bclk_divs[i].pll_out,
+				    cs2600_kunit_bclk_divs[i].bf_out);
+	}
+}
+
+/*
+ * FSYNC_OUT_DIS bit matches logical clock enable/disable state
+ * and enable/disable of FSYNC clk does not affect BCLK_OUT_DIS bit.
+ */
+static void cs2600_kunit_fsync_enable_disable(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_FSYNC_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_BCLK_OUT_DIS));
+
+	KUNIT_EXPECT_EQ(test, 0, clk_set_rate(priv->fsync, 48000));
+	KUNIT_EXPECT_EQ(test, 0, clk_prepare_enable(priv->fsync));
+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
+							   clk_disable_unprepare_wrapper,
+							   priv->fsync));
+
+	KUNIT_EXPECT_FALSE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						  CS2600_FSYNC_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_BCLK_OUT_DIS));
+
+	kunit_release_action(test, clk_disable_unprepare_wrapper, priv->fsync);
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_FSYNC_OUT_DIS));
+	KUNIT_EXPECT_TRUE(test, regmap_test_bits(priv->regmap, CS2600_OUTPUT_CFG1,
+						 CS2600_BCLK_OUT_DIS));
+}
+
+/* FSYNC divider register value is correct */
+static void cs2600_kunit_fsync_divider(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int out_cfg1, fsync_div;
+	uint64_t fdelta;
+	int i;
+
+	for (i = 0; cs2600_kunit_fsync_divs[i].pll_out != 0; i++) {
+		/* PLL_OUT is the input clock to the FSYNC divider */
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->pllout, cs2600_kunit_fsync_divs[i].pll_out),
+				    "pll_out:%u fsync:%u\n",
+				    cs2600_kunit_fsync_divs[i].pll_out,
+				    cs2600_kunit_fsync_divs[i].bf_out);
+
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    clk_set_rate(priv->fsync, cs2600_kunit_fsync_divs[i].bf_out),
+				    "clk_out:%u fsync:%u\n",
+				    cs2600_kunit_fsync_divs[i].pll_out,
+				    cs2600_kunit_fsync_divs[i].bf_out);
+
+		KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &out_cfg1));
+		fsync_div = FIELD_GET(CS2600_FSYNC_DIV_MASK, out_cfg1);
+		KUNIT_EXPECT_EQ_MSG(test, fsync_div, cs2600_kunit_fsync_divs[i].r,
+				    "clk_out:%u fsync:%u\n",
+				    cs2600_kunit_fsync_divs[i].pll_out,
+				    cs2600_kunit_fsync_divs[i].bf_out);
+
+		/*
+		 * Actual reported frequency can be slightly out because of
+		 * PLL resolution, but should be within worst-case PPM.
+		 */
+		fdelta = (cs2600_kunit_fsync_divs[i].bf_out * CS2600_20_12_PPM) >> 20;
+		KUNIT_EXPECT_GE_MSG(test, clk_get_rate(priv->fsync),
+				    cs2600_kunit_fsync_divs[i].bf_out - fdelta,
+				    "clk_out:%u fsync:%u\n",
+				    cs2600_kunit_fsync_divs[i].pll_out,
+				    cs2600_kunit_fsync_divs[i].bf_out);
+
+		KUNIT_EXPECT_LE_MSG(test, clk_get_rate(priv->fsync),
+				    cs2600_kunit_fsync_divs[i].bf_out,
+				    "clk_out:%u fsync:%u\n",
+				    cs2600_kunit_fsync_divs[i].pll_out,
+				    cs2600_kunit_fsync_divs[i].bf_out);
+	}
+}
+
+/* assigned-clock-rates in DT is applied to the clocks */
+static void cs2600_kunit_assigned_clock_rates(struct kunit *test)
+{
+	struct cs2600_kunit_priv *priv = test->priv;
+	unsigned int out_cfg1, div;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_assigned));
+	cs2600_kunit_wait_for_probes(test);
+
+	KUNIT_EXPECT_EQ(test, CS2600_KUNIT_FSYNC_ASSIGNED, clk_get_rate(priv->fsync));
+	KUNIT_EXPECT_EQ(test, CS2600_KUNIT_BCLK_ASSIGNED, clk_get_rate(priv->bclk));
+	KUNIT_EXPECT_EQ(test, CS2600_KUNIT_CLKOUT_ASSIGNED, clk_get_rate(priv->clkout));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(priv->regmap, CS2600_OUTPUT_CFG1, &out_cfg1));
+	div = FIELD_GET(CS2600_FSYNC_DIV_MASK, out_cfg1);
+	KUNIT_EXPECT_EQ(test, div, CS2600_KUNIT_FSYNC_DIV_INDEX);
+
+	div = FIELD_GET(CS2600_BCLK_DIV_MASK, out_cfg1);
+	KUNIT_EXPECT_EQ(test, div, CS2600_KUNIT_BCLK_DIV_INDEX);
+}
+
+/* Register values after a soft reset */
+static const struct reg_sequence cs2600_kunit_regmap_reset_defaults[] = {
+	REG_SEQ0(CS2600_PLL_CFG1,		0x0080),
+	REG_SEQ0(CS2600_PLL_CFG2,		0x0008),
+	REG_SEQ0(CS2600_RATIO1_1,		0x0000),
+	REG_SEQ0(CS2600_RATIO1_2,		0x0000),
+	REG_SEQ0(CS2600_RATIO2_1,		0x0000),
+	REG_SEQ0(CS2600_RATIO2_2,		0x0000),
+	REG_SEQ0(CS2600_PLL_CFG3,		0x0000),
+	REG_SEQ0(CS2600_OUTPUT_CFG1,		0x0000),
+	REG_SEQ0(CS2600_OUTPUT_CFG2,		0x0000),
+	REG_SEQ0(CS2600_PHASE_ALIGNMENT_CFG1,	0x0000),
+	REG_SEQ0(CS2600_UNLOCK_INDICATORS,	0x0000),
+	REG_SEQ0(CS2600_ERROR_STS,		0x0000),
+};
+
+static int cs2600_kunit_regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	/* This should never be called */
+	return -EIO;
+}
+
+static int cs2600_kunit_regmap_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	/* This should never be called */
+	return -EIO;
+}
+
+static unsigned int cs2600_kunit_i2c_read_unlock_indicators(struct cs2600_kunit_priv *priv)
+{
+	/* Fake the unlock status based on the PLL enable status */
+	if (!priv->force_unlock_status &&
+	    regmap_test_bits(priv->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1) &&
+	    regmap_test_bits(priv->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2))
+		return 0;
+
+	return CS2600_P_UNLOCK | CS2600_P_UNLOCK_STICKY |
+	       CS2600_F_UNLOCK | CS2600_F_UNLOCK_STICKY;
+}
+
+/* If FREEZE_EN==1 some register bits can't be changed */
+static unsigned int cs2600_kunit_i2c_reg_get_freeze_mask(struct cs2600_kunit_priv *priv,
+							 unsigned int addr)
+{
+	if (!regmap_test_bits(priv->regmap, CS2600_PLL_CFG2,  CS2600_FREEZE_EN))
+		return 0xffff;
+
+	switch (addr) {
+	case CS2600_PLL_CFG1:
+		return 0;	/* whole register is blocked by FREEZE_EN */
+	case CS2600_PLL_CFG2:
+		return ~(u16)(CS2600_M_RATIO_SEL_MASK | CS2600_PLL_MODE_SEL);
+	case CS2600_OUTPUT_CFG1:
+		return ~(u16)(CS2600_BCLK_OUT_DIS | CS2600_FSYNC_OUT_DIS);
+	case CS2600_OUTPUT_CFG2:
+		return ~(u16)CS2600_AUX1OUT_SEL;
+	default:
+		return 0xffff;
+	}
+}
+
+static int cs2600_kunit_i2c_write(struct cs2600_kunit_priv *priv, unsigned int addr,
+				  unsigned int val)
+{
+	unsigned int write_mask;
+
+	switch (addr) {
+	case CS2600_SW_RESET:
+		if (val != 0x5a)
+			return 0;
+
+		return regmap_multi_reg_write(priv->regmap,
+					      cs2600_kunit_regmap_reset_defaults,
+					      ARRAY_SIZE(cs2600_kunit_regmap_reset_defaults));
+	default:
+		write_mask = cs2600_kunit_i2c_reg_get_freeze_mask(priv, addr);
+		return regmap_update_bits(priv->regmap, addr, write_mask, val);
+	}
+}
+
+static int cs2600_kunit_i2c_read(struct cs2600_kunit_priv *priv, unsigned int addr,
+				  unsigned int *val)
+{
+	switch (addr) {
+	case CS2600_UNLOCK_INDICATORS:
+		*val = cs2600_kunit_i2c_read_unlock_indicators(priv);
+		return 0;
+	default:
+		return regmap_read(priv->regmap, addr, val);
+	}
+}
+
+static int cs2600_kunit_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct cs2600_kunit_priv *priv = i2c_get_adapdata(adap);
+	unsigned int addr, val;
+	__be16 *bebuf;
+	int ret;
+
+	/* Regmap should never pass us garbage but protect against it anyway */
+	if (!msgs || num < 1 || msgs->len < sizeof(__be16))
+		return -EINVAL;
+
+	/* First word of first message is always the register address */
+	bebuf = (__force __be16 *)msgs[0].buf;
+	addr = be16_to_cpu(bebuf[0]);
+
+	/* A second word in the first message is a data write */
+	if (msgs[0].len >= 2 * sizeof(__be16)) {
+		val = be16_to_cpu(bebuf[1]);
+		ret = cs2600_kunit_i2c_write(priv, addr, val);
+		if (ret < 0)
+			return ret;
+
+		return 1;
+	}
+
+	/* If there is a second packet it is a read */
+	if (num == 2) {
+		ret = cs2600_kunit_i2c_read(priv, addr, &val);
+		if (ret < 0)
+			return ret;
+
+		bebuf = (__force __be16 *)msgs[1].buf;
+		bebuf[0] = cpu_to_be16(val);
+
+		return 2;
+	}
+
+	return 0;
+}
+
+static u32 cs2600_kunit_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C;
+}
+
+static const struct regmap_config cs2600_kunit_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 16,
+	.max_register	= CS2600_MAX_REGISTER,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
+static const struct regmap_bus cs2600_kunit_regmap_bus = {
+	.reg_read = cs2600_kunit_regmap_reg_read,
+	.reg_write = cs2600_kunit_regmap_reg_write,
+};
+
+static const struct i2c_algorithm cs2600_kunit_i2c_algo = {
+	.xfer = cs2600_kunit_i2c_xfer,
+	.functionality = cs2600_kunit_i2c_functionality,
+};
+
+static int cs2600_kunit_i2c_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs2600_kunit_priv *priv = container_of(to_platform_driver(dev->driver),
+						      struct cs2600_kunit_priv,
+						      i2c_pdrv);
+	int ret;
+
+	/* Create emulated chip register map */
+	priv->regmap = devm_regmap_init(dev, &cs2600_kunit_regmap_bus, priv,
+					&cs2600_kunit_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	regcache_cache_only(priv->regmap, true);
+
+	/*
+	 * The only known value is the device ID until the driver
+	 * issues a chip reset.
+	 */
+	regmap_write(priv->regmap, CS2600_DEVICE_ID1, 0x2600);
+	regmap_write(priv->regmap, CS2600_DEVICE_ID2, 0xb0);
+
+	strscpy(priv->adapter.name, pdev->name, sizeof(priv->adapter.name));
+	priv->adapter.owner = THIS_MODULE;
+	priv->adapter.algo = &cs2600_kunit_i2c_algo;
+	priv->adapter.dev.parent = dev;
+	priv->adapter.dev.of_node = dev->of_node;
+	i2c_set_adapdata(&priv->adapter, priv);
+
+	ret = devm_i2c_add_adapter(dev, &priv->adapter);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add I2C adapter\n");
+
+	return 0;
+}
+
+static int cs2600_kunit_refclk_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs2600_kunit_priv *priv = container_of(to_platform_driver(dev->driver),
+						      struct cs2600_kunit_priv,
+						      refclk_pdrv);
+	int ret;
+
+	priv->refclk_hw = devm_clk_hw_register_fixed_rate(dev, "cs2600_kunit_refclk",
+							  NULL, 0,
+							  priv->refclk_rate);
+	if (IS_ERR_OR_NULL(priv->refclk_hw))
+		return dev_err_probe(dev, PTR_ERR(priv->refclk_hw), "Failed to register refclk\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, priv->refclk_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register provider\n");
+
+	return 0;
+}
+
+static int cs2600_kunit_clkin_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs2600_kunit_priv *priv = container_of(to_platform_driver(dev->driver),
+						      struct cs2600_kunit_priv,
+						      clkin_pdrv);
+	int ret;
+
+	priv->clkin_hw = devm_clk_hw_register_fixed_rate(dev, "cs2600_kunit_clkin",
+							 NULL, 0,
+							 priv->clkin_rate);
+	if (IS_ERR_OR_NULL(priv->clkin_hw))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin_hw), "Failed to register clkin\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, priv->clkin_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register provider\n");
+
+	return 0;
+}
+
+static void cs2600_kunit_clk_consumer_driver_remove(struct platform_device *pdev)
+{
+}
+
+static int cs2600_kunit_clk_consumer_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs2600_kunit_priv *priv = container_of(to_platform_driver(dev->driver),
+						      struct cs2600_kunit_priv,
+						      consumer_pdrv);
+	struct clk_bulk_data *clocks;
+	int ret;
+
+	clocks = devm_kcalloc(dev, CS2600_FSYNC_OUT + 1, sizeof(*clocks), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+
+	clocks[CS2600_PLL_OUT].id = "pllout";
+	clocks[CS2600_CLK_OUT].id = "clkout";
+	clocks[CS2600_BCLK_OUT].id = "bclk";
+	clocks[CS2600_FSYNC_OUT].id = "fsync";
+
+	ret = devm_clk_bulk_get(dev, CS2600_FSYNC_OUT + 1, clocks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not get clocks\n");
+
+	priv->pllout = clocks[CS2600_PLL_OUT].clk;
+	priv->clkout = clocks[CS2600_CLK_OUT].clk;
+	priv->bclk = clocks[CS2600_BCLK_OUT].clk;
+	priv->fsync = clocks[CS2600_FSYNC_OUT].clk;
+
+	complete(&priv->consumers_completion);
+
+	return 0;
+}
+
+static const struct of_device_id cs2600_kunit_i2c_driver_of_match[] = {
+	{ .compatible = "cirrus,cs2600-kunit-i2c", },
+	{}
+};
+
+static const struct of_device_id cs2600_kunit_refclk_driver_of_match[] = {
+	{ .compatible = "cirrus,cs2600-kunit-refclk", },
+	{}
+};
+
+static const struct of_device_id cs2600_kunit_clkin_driver_of_match[] = {
+	{ .compatible = "cirrus,cs2600-kunit-clkin", },
+	{}
+};
+
+static const struct of_device_id cs2600_kunit_clk_consumer_driver_of_match[] = {
+	{ .compatible = "cirrus,cs2600-kunit-consumer", (void *)(uintptr_t)0 },
+	{}
+};
+
+static int cs2600_kunit_case_common_init(struct kunit *test)
+{
+	const struct cs2600_kunit_params *params = test->param_value;
+	struct cs2600_kunit_priv *priv;
+	struct device_node *np;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	test->priv = priv;
+	priv->test = test;
+	init_completion(&priv->consumers_completion);
+
+	if (params) {
+		priv->refclk_rate = params->ref_clk;
+		priv->clkin_rate = params->clk_in;
+	}
+
+	if (priv->refclk_rate == 0)
+		priv->refclk_rate = CS2600_KUNIT_DEFAULT_REFCLK_RATE;
+
+	/* Create dummy I2C bus driver */
+	priv->i2c_pdrv.probe = cs2600_kunit_i2c_driver_probe;
+	priv->i2c_pdrv.driver.of_match_table = cs2600_kunit_i2c_driver_of_match;
+	priv->i2c_pdrv.driver.name = "cs2600_kunit_i2c_driver";
+	priv->i2c_pdrv.driver.owner = THIS_MODULE;
+	KUNIT_ASSERT_EQ(test, 0, kunit_platform_driver_register(test, &priv->i2c_pdrv));
+
+	/* Create dummy refclk driver */
+	priv->refclk_pdrv.probe = cs2600_kunit_refclk_driver_probe;
+	priv->refclk_pdrv.driver.of_match_table = cs2600_kunit_refclk_driver_of_match;
+	priv->refclk_pdrv.driver.name = "cs2600_kunit_refclk_driver";
+	priv->refclk_pdrv.driver.owner = THIS_MODULE;
+	KUNIT_ASSERT_EQ(test, 0, kunit_platform_driver_register(test, &priv->refclk_pdrv));
+
+	/* Create dummy clkin driver */
+	priv->clkin_pdrv.probe = cs2600_kunit_clkin_driver_probe;
+	priv->clkin_pdrv.driver.of_match_table = cs2600_kunit_clkin_driver_of_match;
+	priv->clkin_pdrv.driver.name = "cs2600_kunit_clkin_driver";
+	priv->clkin_pdrv.driver.owner = THIS_MODULE;
+	KUNIT_ASSERT_EQ(test, 0, kunit_platform_driver_register(test, &priv->clkin_pdrv));
+
+	/* Create dummy consumers */
+	priv->consumer_pdrv.probe = cs2600_kunit_clk_consumer_driver_probe;
+	priv->consumer_pdrv.remove = cs2600_kunit_clk_consumer_driver_remove;
+	priv->consumer_pdrv.driver.of_match_table = cs2600_kunit_clk_consumer_driver_of_match;
+	priv->consumer_pdrv.driver.name = "cs2600_kunit_consumer_driver";
+	priv->consumer_pdrv.driver.owner = THIS_MODULE;
+	KUNIT_ASSERT_EQ(test, 0, kunit_platform_driver_register(test, &priv->consumer_pdrv));
+
+	/* Wait for probes if the test case init already loaded the overlay */
+	np = of_find_node_by_name(NULL, "cs2600-test-consumer");
+	if (!IS_ERR_OR_NULL(np))
+		cs2600_kunit_wait_for_probes(test);
+	of_node_put(np);
+
+	return 0;
+}
+
+static int cs2600_kunit_case_manual_intosc_only_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_intosc_only));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_manual_refclk_only_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_refclk_only));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_manual_intosc_clkin_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_intosc_clkin));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_manual_refclk_clkin_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_manual_refclk_clkin));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_smart_intosc_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_smart_intosc));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_smart_refclk_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_smart_refclk));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_smart_clkin_only_intosc_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_smart_clkin_only_intosc));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static int cs2600_kunit_case_smart_clkin_only_refclk_init(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_cs2600_smart_clkin_only_refclk));
+
+	return cs2600_kunit_case_common_init(test);
+}
+
+static void cs2600_kunit_refclk_param_desc(const struct cs2600_kunit_params *param,
+					   char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "ref_clk:%u", param->ref_clk);
+}
+
+static void cs2600_kunit_clkin_param_desc(const struct cs2600_kunit_params *param,
+					   char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "clk_in:%u", param->clk_in);
+}
+
+static void cs2600_kunit_refclk_clkin_param_desc(const struct cs2600_kunit_params *param,
+						 char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "ref_clk:%u clk_in:%u",
+		 param->ref_clk, param->clk_in);
+}
+
+static const struct cs2600_kunit_params cs2600_kunit_synth_mode_params[] = {
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios },
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios },
+	{ .ref_clk = 16000000, .s_ratios = cs2600_kunit_16M_ratios },
+	{ .ref_clk = 19200000, .s_ratios = cs2600_kunit_19_2M_ratios },
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios },
+	{ .ref_clk = 25000000, .s_ratios = cs2600_kunit_25M_ratios },
+	{ .ref_clk = 27000000, .s_ratios = cs2600_kunit_27M_ratios },
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios },
+};
+
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_synth_mode, cs2600_kunit_synth_mode_params,
+		  cs2600_kunit_refclk_param_desc);
+
+/* Internal oscillator is fixed at 12.0 MHz */
+static const struct cs2600_kunit_params cs2600_kunit_synth_mode_intosc_params[] = {
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios },
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_synth_mode_intosc, cs2600_kunit_synth_mode_intosc_params,
+		  cs2600_kunit_refclk_param_desc);
+
+static const struct cs2600_kunit_params cs2600_kunit_refclk_div_params[] = {
+	/* Limits of each range */
+	{ .ref_clk =   8000000 },
+	{ .ref_clk =  18750000 },
+	{ .ref_clk =  16000000 },
+	{ .ref_clk =  37500000 },
+	{ .ref_clk =  32000000 },
+	{ .ref_clk =  75000000 },
+
+	/* Some intermediate values */
+	{ .ref_clk = 12000000 },
+	{ .ref_clk = 16000000 },
+	{ .ref_clk = 24576000 },
+	{ .ref_clk = 27000000 },
+	{ .ref_clk = 48000000 },
+	{ .ref_clk = 64000000 },
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_refclk_div, cs2600_kunit_refclk_div_params,
+		  cs2600_kunit_refclk_param_desc);
+
+static const struct cs2600_kunit_params cs2600_kunit_mult_mode_params[] = {
+	{ .clk_in =       50, .m_ratios = cs2600_kunit_50_ratios },
+	{ .clk_in =     2000, .m_ratios = cs2600_kunit_2k_ratios },
+	{ .clk_in =    48000, .m_ratios = cs2600_kunit_48k_ratios },
+	{ .clk_in =  1411200, .m_ratios = cs2600_kunit_1_4112M_ratios },
+	{ .clk_in =  8000000, .m_ratios = cs2600_kunit_8M_ratios },
+	{ .clk_in = 12000000, .m_ratios = cs2600_kunit_12M_ratios },
+	{ .clk_in = 16000000, .m_ratios = cs2600_kunit_16M_ratios },
+	{ .clk_in = 19200000, .m_ratios = cs2600_kunit_19_2M_ratios },
+	{ .clk_in = 24576000, .m_ratios = cs2600_kunit_24_576M_ratios },
+	{ .clk_in = 25000000, .m_ratios = cs2600_kunit_25M_ratios },
+	{ .clk_in = 27000000, .m_ratios = cs2600_kunit_27M_ratios },
+	{ .clk_in = 30000000, .m_ratios = cs2600_kunit_30M_ratios },
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_mult_mode, cs2600_kunit_mult_mode_params,
+		  cs2600_kunit_clkin_param_desc);
+
+/* Subset of dual-input params with 12MHz refclk the only rate supported by intosc */
+static const struct cs2600_kunit_params cs2600_kunit_12Msynth_mult_params[] = {
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =        50, .m_ratios = cs2600_kunit_50_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =      2000, .m_ratios = cs2600_kunit_2k_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =     48000, .m_ratios = cs2600_kunit_48k_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =   1411200, .m_ratios = cs2600_kunit_1_4112M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =   8000000, .m_ratios = cs2600_kunit_8M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =  12000000, .m_ratios = cs2600_kunit_12M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =  16000000, .m_ratios = cs2600_kunit_16M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =  19200000, .m_ratios = cs2600_kunit_19_2M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =  24576000, .m_ratios = cs2600_kunit_24_576M_ratios,
+	},
+	{ .ref_clk = 12000000, .s_ratios = cs2600_kunit_12M_ratios,
+	  .clk_in =  30000000, .m_ratios = cs2600_kunit_30M_ratios,
+	},
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_12Msynth_mult, cs2600_kunit_12Msynth_mult_params,
+		  cs2600_kunit_refclk_clkin_param_desc);
+
+/*
+ * Subset of dual-input params with clk_in frequencies < 8 MHz.
+ * These are only allowed in manual multiplier mode
+ */
+static const struct cs2600_kunit_params cs2600_kunit_synth_mult_low_clkin_params[] = {
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =        50, .m_ratios = cs2600_kunit_50_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =      2000, .m_ratios = cs2600_kunit_2k_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =     48000, .m_ratios = cs2600_kunit_48k_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =   1411200, .m_ratios = cs2600_kunit_1_4112M_ratios,
+	},
+
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =        50, .m_ratios = cs2600_kunit_50_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =      2000, .m_ratios = cs2600_kunit_2k_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =     48000, .m_ratios = cs2600_kunit_48k_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =   1411200, .m_ratios = cs2600_kunit_1_4112M_ratios,
+	},
+
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =        50, .m_ratios = cs2600_kunit_50_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =      2000, .m_ratios = cs2600_kunit_2k_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =     48000, .m_ratios = cs2600_kunit_48k_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =   1411200, .m_ratios = cs2600_kunit_1_4112M_ratios,
+	},
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_synth_mult_low_clkin,
+		  cs2600_kunit_synth_mult_low_clkin_params,
+		  cs2600_kunit_refclk_clkin_param_desc);
+
+
+/* Subset of dual-input params with clk_in frequencies in range for smart mode */
+static const struct cs2600_kunit_params cs2600_kunit_synth_mult_params[] = {
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =   8000000, .m_ratios = cs2600_kunit_8M_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =  12000000, .m_ratios = cs2600_kunit_12M_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =  16000000, .m_ratios = cs2600_kunit_16M_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =  19200000, .m_ratios = cs2600_kunit_19_2M_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =  24576000, .m_ratios = cs2600_kunit_24_576M_ratios,
+	},
+	{ .ref_clk =  8000000, .s_ratios = cs2600_kunit_8M_ratios,
+	  .clk_in =  30000000, .m_ratios = cs2600_kunit_30M_ratios,
+	},
+
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =   8000000, .m_ratios = cs2600_kunit_8M_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =  12000000, .m_ratios = cs2600_kunit_12M_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =  16000000, .m_ratios = cs2600_kunit_16M_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =  19200000, .m_ratios = cs2600_kunit_19_2M_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =  24576000, .m_ratios = cs2600_kunit_24_576M_ratios,
+	},
+	{ .ref_clk = 24576000, .s_ratios = cs2600_kunit_24_576M_ratios,
+	  .clk_in =  30000000, .m_ratios = cs2600_kunit_30M_ratios,
+	},
+
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =   8000000, .m_ratios = cs2600_kunit_8M_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =  12000000, .m_ratios = cs2600_kunit_12M_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =  16000000, .m_ratios = cs2600_kunit_16M_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =  19200000, .m_ratios = cs2600_kunit_19_2M_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =  24576000, .m_ratios = cs2600_kunit_24_576M_ratios,
+	},
+	{ .ref_clk = 75000000, .s_ratios = cs2600_kunit_75M_ratios,
+	  .clk_in =  30000000, .m_ratios = cs2600_kunit_30M_ratios,
+	},
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_synth_mult, cs2600_kunit_synth_mult_params,
+		  cs2600_kunit_refclk_clkin_param_desc);
+
+static const struct cs2600_kunit_params cs2600_kunit_assigned_params[] = {
+	{ .ref_clk =  49152000 },
+};
+
+KUNIT_ARRAY_PARAM(cs2600_kunit_assigned, cs2600_kunit_assigned_params,
+		  cs2600_kunit_refclk_param_desc);
+
+#define CS2600_KUNIT_RATIO_CALC_SPEED_ATTR { .speed = KUNIT_SPEED_VERY_SLOW, }
+
+static struct kunit_case cs2600_kunit_manual_intosc_only_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_internal),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_single_refclk_parent),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_synth_ratio,
+			      cs2600_kunit_synth_mode_intosc_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_pll_no_lock),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_manual_refclk_only_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_ref_clk_in),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_single_refclk_parent),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_ref_clk_divider,
+			      cs2600_kunit_refclk_div_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_synth_ratio,
+			      cs2600_kunit_synth_mode_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_manual_intosc_clkin_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_internal),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_intosc_clkin_parents),
+
+	/* Internal oscillator can be used for synth mode */
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_synth_ratio,
+			      cs2600_kunit_synth_mode_intosc_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_mult_ratio,
+			      cs2600_kunit_mult_mode_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_change_parent_same_clkout,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_manual_refclk_clkin_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_ref_clk_in),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_refclk_clkin_parents),
+	KUNIT_CASE_PARAM(cs2600_kunit_ref_clk_divider, cs2600_kunit_refclk_div_gen_params),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_synth_ratio,
+			      cs2600_kunit_synth_mode_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_mult_ratio,
+			      cs2600_kunit_mult_mode_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_change_parent_same_clkout,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_change_parent_same_clkout,
+			      cs2600_kunit_synth_mult_low_clkin_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_change_parent_same_clkout,
+			      cs2600_kunit_synth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_smart_intosc_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_internal),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_smart_parents),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_ratio,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_smart_clkin_only_intosc_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_internal),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_smart_parents),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_clkin_only_ratio,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_smart_refclk_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_ref_clk_in),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_smart_parents),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_ratio,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_ratio,
+			      cs2600_kunit_synth_mult_low_clkin_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_ratio,
+			      cs2600_kunit_synth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_smart_clkin_only_refclk_cases[] = {
+	KUNIT_CASE(cs2600_kunit_clock_out_initially_disabled),
+	KUNIT_CASE(cs2600_kunit_aux1_out_disabled),
+	KUNIT_CASE(cs2600_kunit_sysclk_source_is_ref_clk_in),
+	KUNIT_CASE(cs2600_kunit_parent_tree),
+	KUNIT_CASE(cs2600_kunit_smart_parents),
+
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_clkin_only_ratio,
+			      cs2600_kunit_12Msynth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_smart_clkin_only_ratio,
+			      cs2600_kunit_synth_mult_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	KUNIT_CASE(cs2600_kunit_pll_enable_disable),
+	KUNIT_CASE(cs2600_kunit_clk_out_enable_disable),
+
+	{ /* terminator */ }
+};
+
+/*
+ * The FSYNC and BCLK dividers do not depend on the PLL mode or reference clock
+ * types, so don't need to be re-tested for every PLL configuration.
+ *
+ * The simple synth mode from the internal oscillator is sufficient to provide
+ * a dummy reference clock config for the dividers.
+ */
+static struct kunit_case cs2600_kunit_bclk_fsync_divider_cases[] = {
+	KUNIT_CASE(cs2600_kunit_bclk_enable_disable),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_bclk_divider,
+			      cs2600_kunit_synth_mode_intosc_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+	KUNIT_CASE(cs2600_kunit_fsync_enable_disable),
+	KUNIT_CASE_PARAM_ATTR(cs2600_kunit_fsync_divider,
+			      cs2600_kunit_synth_mode_intosc_gen_params,
+			      CS2600_KUNIT_RATIO_CALC_SPEED_ATTR),
+
+	{ /* terminator */ }
+};
+
+static struct kunit_case cs2600_kunit_of_config_cases[] = {
+	KUNIT_CASE(cs2600_kunit_aux1_out_ref_clk_in),
+	KUNIT_CASE(cs2600_kunit_aux1_out_clk_in),
+	KUNIT_CASE(cs2600_kunit_aux1_out_freq_unlock),
+	KUNIT_CASE(cs2600_kunit_aux1_out_phase_unlock),
+	KUNIT_CASE(cs2600_kunit_aux1_out_clk_in_missing),
+	KUNIT_CASE(cs2600_kunit_name_output_clocks),
+	KUNIT_CASE(cs2600_kunit_bclk_fsync_not_invert),
+	KUNIT_CASE(cs2600_kunit_bclk_invert),
+	KUNIT_CASE(cs2600_kunit_fsync_invert),
+	KUNIT_CASE(cs2600_kunit_fsync_duty_50_50),
+	KUNIT_CASE(cs2600_kunit_fsync_duty_1),
+	KUNIT_CASE(cs2600_kunit_fsync_duty_2),
+	KUNIT_CASE(cs2600_kunit_fsync_duty_32),
+	KUNIT_CASE_PARAM(cs2600_kunit_assigned_clock_rates,
+			 cs2600_kunit_assigned_gen_params),
+	{ /* terminator */ }
+};
+
+/* No clock properties - only clock source is internal oscillator */
+static struct kunit_suite cs2600_kunit_manual_intosc_only_suite = {
+	.name = "clk_cs2600_kunit_manual_intosc_only",
+	.init = cs2600_kunit_case_manual_intosc_only_init,
+	.test_cases = cs2600_kunit_manual_intosc_only_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Only clock property is ref_clk - only clock source is ref_clk */
+static struct kunit_suite cs2600_kunit_manual_refclk_only_suite = {
+	.name = "clk_cs2600_kunit_manual_refclk_only",
+	.init = cs2600_kunit_case_manual_refclk_only_init,
+	.test_cases = cs2600_kunit_manual_refclk_only_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* ref_clk and clk_in properties - ref_clk is internal oscillator */
+static struct kunit_suite cs2600_kunit_manual_intosc_clkin_suite = {
+	.name = "clk_cs2600_kunit_manual_clkin_only",
+	.init = cs2600_kunit_case_manual_intosc_clkin_init,
+	.test_cases = cs2600_kunit_manual_intosc_clkin_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* ref_clk and clk_in properties - both external clocks */
+static struct kunit_suite cs2600_kunit_manual_refclk_clkin_suite = {
+	.name = "clk_cs2600_kunit_manual_refclk_clkin",
+	.init = cs2600_kunit_case_manual_refclk_clkin_init,
+	.test_cases = cs2600_kunit_manual_refclk_clkin_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Smart mode using internal oscillator as reference */
+static struct kunit_suite cs2600_kunit_smart_intosc_suite = {
+	.name = "clk_cs2600_kunit_smart_intosc",
+	.init = cs2600_kunit_case_smart_intosc_init,
+	.test_cases = cs2600_kunit_smart_intosc_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Smart mode using external clock as reference */
+static struct kunit_suite cs2600_kunit_smart_refclk_suite = {
+	.name = "clk_cs2600_kunit_smart_refclk",
+	.init = cs2600_kunit_case_smart_refclk_init,
+	.test_cases = cs2600_kunit_smart_refclk_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Smart clkin-only mode - reference is internal oscillator */
+static struct kunit_suite cs2600_kunit_smart_clkin_only_intosc_suite = {
+	.name = "clk_cs2600_kunit_smart_clkin_only_intosc",
+	.init = cs2600_kunit_case_smart_clkin_only_intosc_init,
+	.test_cases = cs2600_kunit_smart_clkin_only_intosc_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Smart clkin-only mode - refclk is external source */
+static struct kunit_suite cs2600_kunit_smart_clkin_only_refclk_suite = {
+	.name = "clk_cs2600_kunit_smart_clkin_only_refclk",
+	.init = cs2600_kunit_case_smart_clkin_only_refclk_init,
+	.test_cases = cs2600_kunit_smart_clkin_only_refclk_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Test BCLK and FSYNC dividers. Uses the manual intosc-only PLL config. */
+static struct kunit_suite cs2600_kunit_bclk_fsync_divider_suite = {
+	.name = "clk_cs2600_kunit_bclk_fsync_dividers",
+	.init = cs2600_kunit_case_manual_intosc_only_init,
+	.test_cases = cs2600_kunit_bclk_fsync_divider_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+/* Test that OF properties take effect */
+static struct kunit_suite cs2600_kunit_of_config_suite = {
+	.name = "clk_cs2600_kunit_of_config",
+	.init = cs2600_kunit_case_common_init,
+	.test_cases = cs2600_kunit_of_config_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
+};
+
+kunit_test_suites(&cs2600_kunit_manual_intosc_only_suite,
+		  &cs2600_kunit_manual_refclk_only_suite,
+		  &cs2600_kunit_manual_intosc_clkin_suite,
+		  &cs2600_kunit_manual_refclk_clkin_suite,
+		  &cs2600_kunit_smart_intosc_suite,
+		  &cs2600_kunit_smart_refclk_suite,
+		  &cs2600_kunit_smart_clkin_only_intosc_suite,
+		  &cs2600_kunit_smart_clkin_only_refclk_suite,
+		  &cs2600_kunit_bclk_fsync_divider_suite,
+		  &cs2600_kunit_of_config_suite);
+
+MODULE_DESCRIPTION("KUnit test for the CS2600 clock driver");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/cirrus/clk-cs2600-kunit.h b/drivers/clk/cirrus/clk-cs2600-kunit.h
new file mode 100644
index 000000000000..2387610cc23b
--- /dev/null
+++ b/drivers/clk/cirrus/clk-cs2600-kunit.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * KUnit test for the Cirrus Logic CS2600 clock driver.
+ *
+ * Copyright (C) 2026 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#define CS2600_KUNIT_PLLOUT_RENAME	"renamed_pll"
+#define CS2600_KUNIT_CLKOUT_RENAME	"renamed_clk"
+#define CS2600_KUNIT_BCLK_RENAME	"renamed_bs"
+#define CS2600_KUNIT_FSYNC_RENAME	"renamed_fs"
+
+#define CS2600_KUNIT_CLKOUT_ASSIGNED	6144000
+#define CS2600_KUNIT_BCLK_ASSIGNED	1536000
+#define CS2600_KUNIT_FSYNC_ASSIGNED	96000
+#define CS2600_KUNIT_BCLK_DIV_INDEX	3
+#define CS2600_KUNIT_FSYNC_DIV_INDEX	2
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600.dtsi b/drivers/clk/cirrus/kunit_clk_cs2600.dtsi
new file mode 100644
index 000000000000..9fd11d322837
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/cirrus,cs2600-clock.h>
+
+&{/} {
+	dummy_vreg: VDD-DUMMY {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	cs2600_kunit_refclk: cs2600_kunit_refclk {
+		compatible = "cirrus,cs2600-kunit-refclk";
+		#clock-cells = <0>;
+	};
+
+	cs2600_kunit_clkin: cs2600_kunit_clkin {
+		compatible = "cirrus,cs2600-kunit-clkin";
+		#clock-cells = <0>;
+	};
+
+	cs2600_kunit_i2c: cs2600-kunit-i2c {
+		compatible = "cirrus,cs2600-kunit-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <400000>;
+	};
+
+	cs2600_test_consumer: cs2600-test-consumer {
+		compatible = "cirrus,cs2600-kunit-consumer";
+		clocks = <&cs2600 CS2600_PLL_OUT>, <&cs2600 CS2600_CLK_OUT>,
+			 <&cs2600 CS2600_BCLK_OUT>, <&cs2600 CS2600_FSYNC_OUT>;
+		clock-names = "pllout", "clkout", "bclk", "fsync";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_assigned.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_assigned.dtso
new file mode 100644
index 000000000000..fd2d7b3b5b10
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_assigned.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+#include "clk-cs2600-kunit.h"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+	};
+};
+
+&cs2600_test_consumer {
+	assigned-clocks = <&cs2600 CS2600_CLK_OUT>,
+			  <&cs2600 CS2600_BCLK_OUT>,
+			  <&cs2600 CS2600_FSYNC_OUT>;
+	assigned-clock-rates = <CS2600_KUNIT_CLKOUT_ASSIGNED
+				CS2600_KUNIT_BCLK_ASSIGNED
+				CS2600_KUNIT_FSYNC_ASSIGNED>;
+};
+
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in.dtso
new file mode 100644
index 000000000000..aeaa3740d6fd
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,aux1-output-source = "clk_in";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in_missing.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in_missing.dtso
new file mode 100644
index 000000000000..809e55f22d4d
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in_missing.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,aux1-output-source = "clkin_missing";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_freq_unlock.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_freq_unlock.dtso
new file mode 100644
index 000000000000..2d295792ef68
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_freq_unlock.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,aux1-output-source = "freq_unlock";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_phase_unlock.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_phase_unlock.dtso
new file mode 100644
index 000000000000..5c242cd06707
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_phase_unlock.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,aux1-output-source = "phase_unlock";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_ref_clk_in.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_ref_clk_in.dtso
new file mode 100644
index 000000000000..4e9205789ef4
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_ref_clk_in.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,aux1-output-source = "ref_clk_in";
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_bclk_invert.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_bclk_invert.dtso
new file mode 100644
index 000000000000..c3d89d7c8020
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_bclk_invert.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,bclk-invert;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_1.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_1.dtso
new file mode 100644
index 000000000000..f3e175c93c65
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_1.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,fsync-duty-cycles = <1>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_2.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_2.dtso
new file mode 100644
index 000000000000..11f308e49ff2
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_2.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,fsync-duty-cycles = <2>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_32.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_32.dtso
new file mode 100644
index 000000000000..00656af862d7
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_32.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,fsync-duty-cycles = <32>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_fsync_invert.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_invert.dtso
new file mode 100644
index 000000000000..d85b5d851266
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_fsync_invert.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+		cirrus,fsync-invert;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_clkin.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_clkin.dtso
new file mode 100644
index 000000000000..859b28daf25c
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_clkin.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		cirrus,internal-oscillator;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_only.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_only.dtso
new file mode 100644
index 000000000000..dba29f398774
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_only.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		cirrus,internal-oscillator;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_clkin.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_clkin.dtso
new file mode 100644
index 000000000000..5af4eb45fee0
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_clkin.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_only.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_only.dtso
new file mode 100644
index 000000000000..dc2bf6f4a90a
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_only.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>;
+		clock-names = "ref_clk_in";
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_name_output_clocks.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_name_output_clocks.dtso
new file mode 100644
index 000000000000..d05a69512bc6
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_name_output_clocks.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "clk-cs2600-kunit.h"
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		vdd-supply = <&dummy_vreg>;
+
+		clock-output-names =
+			CS2600_KUNIT_PLLOUT_RENAME,
+			CS2600_KUNIT_CLKOUT_RENAME,
+			CS2600_KUNIT_BCLK_RENAME,
+			CS2600_KUNIT_FSYNC_RENAME;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_intosc.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_intosc.dtso
new file mode 100644
index 000000000000..76fe2e5a01c9
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_intosc.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		cirrus,internal-oscillator;
+		cirrus,smart-mode;
+		cirrus,smart-mode-clkin-only;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_refclk.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_refclk.dtso
new file mode 100644
index 000000000000..83e1b57deeaa
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_refclk.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		cirrus,smart-mode;
+		cirrus,smart-mode-clkin-only;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_smart_intosc.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_smart_intosc.dtso
new file mode 100644
index 000000000000..893406b49f1c
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_smart_intosc.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		cirrus,internal-oscillator;
+		cirrus,smart-mode;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
diff --git a/drivers/clk/cirrus/kunit_clk_cs2600_smart_refclk.dtso b/drivers/clk/cirrus/kunit_clk_cs2600_smart_refclk.dtso
new file mode 100644
index 000000000000..6f46834cd2de
--- /dev/null
+++ b/drivers/clk/cirrus/kunit_clk_cs2600_smart_refclk.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_cs2600.dtsi"
+
+&cs2600_kunit_i2c {
+	cs2600: cs2600@2c {
+		compatible = "cirrus,cs2600";
+		reg = <0x2c>;
+		#clock-cells = <1>;
+		clocks = <&cs2600_kunit_refclk>, <&cs2600_kunit_clkin>;
+		clock-names = "ref_clk_in", "clk_in";
+		cirrus,smart-mode;
+		vdd-supply = <&dummy_vreg>;
+	};
+};
-- 
2.47.3

