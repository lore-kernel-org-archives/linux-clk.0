Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279572F0C74;
	Fri,  7 Aug 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118080; cv=fail; b=KhjfbhJnwiB3uLiYwFoLN208njW06ALRaYib/hZQkqux0fEY+YoUO7gEpyEISeOyDf0ba8IPo/fetgWR+YNRkSmfvz8tvUnU38ELxftPogUUar/f31wD1jDm5ID0hehPsoaYHN7dbk4WTBNCUejbgF3m5+MZtNt2AM6OwyvttXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118080; c=relaxed/simple;
	bh=338ptiUTWWoMwWdpQttRy3dgubGyrHLUkHVu23CTOz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unsdsItIuHQ+0PP5oYJnAjQOv3l/mnJ/0+9yIiisQ74HQLaMRbAGqop1DY/insz/riaI2bo3x4kwISxfjzH8cIA+yi4VBKDS7z3SbmYEkXJjGd/sH3/9WSUfqTqkJfx4+laW2djBohZwpKIbz4Is4z9ZGAMbSp6LkCH5X6vYMgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VTlb9PxD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C6oh+ean; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VTlb9PxD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C6oh+ean"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FKQk7781650;
	Fri, 7 Aug 2026 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Tq5p+NPk0teehs0uY8knuW9/4BlK4X7ElgB84Lt3qPA=; b=
	VTlb9PxDgEuNkfDLUudsRF8B7k4ZWCDvMCYymTq/aUDZftgUgiotXSzXmW76IOyu
	uE7yfzKQf6IIzaFz+ow/Vkl9bLC6ihnIUoq8IRSv8jH/LxvGvfcfHdabNiSSDSMJ
	gNSegJaPJgffjwNpQrfslIWEBtsXZrbu0abxc4N8GS2y0/9JtvNei1m23KI1Dhq8
	WkiN9YYXRMPjBdiTT5qxsdoLbIs17cXKyuFJGmatOKtu8VU0wfPIZe8zgvOw1Dhp
	WkMbz6HzjaGyj2kpGe0PQeVeRFrd7HowMFHjs1KW2tjXqNQqzc6ESUkIOJ+6rBrU
	6fY3OqeFcfR/rgpamR2U7g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021130.outbound.protection.outlook.com [52.101.62.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69vcb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 10:54:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAzllqsnIaX5Qe46mSxC6aVRSjON/3yA7ouIZ1+BSF5/tOI2Yzg7lfD2vz/sUkuQpWWCJ648WJXc1TFwFWbzpaItE70ylP7xnDibRxBvlb4vUlRmjK6OH1OtUBqC5HGjfFuax+PhdKDcD9OO/HAOmN8aKD+e0/0SN65cJUOCR2xPE/uK8fXGU+KefzHOhjavphRd253IfvJ/DBhGaIqEsF7mSWgCatvxSckgES7WJ0Zf3USpBUGRelY7qeyah9PLGoCZ1+fe+p3ZFxLlHNCLmoDF230L1QDe4KWjn8wfhB+E0ZC2BLfvq/pTCLkEjxZN/O4cXHbJIVzzaP28tkEwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq5p+NPk0teehs0uY8knuW9/4BlK4X7ElgB84Lt3qPA=;
 b=oWZFXJPBC+VPx2Xc13x7iFidHWIoiacEpo/VLAROAd+Qt5uSRfZBB0MR7cjg5wSmmVGx+3MiEVqEvIzDjzhcHe4gnntZxy5MtcY7a81u99BHIplszTlf2XFmh/7BhOymktkw5U0AK5aFizLkROap+RJlKS6VSDKLdCLXGerYcPnhgg2xo8Br4jXuvvYWIajo1GLh5Qypm9fystE4+NH0h8yhdvZLZ2KW6SEnQgFT8iUdAkwVQ7odmp+9lVRbdnHcas1UX9Pcw2dnVGbJSYTgUd51wAo7ns6hgz9ljuEJuNDYMmm/ggyE0AhgMu7Jxh44kM5Wopp1mKWV13h/H72EPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq5p+NPk0teehs0uY8knuW9/4BlK4X7ElgB84Lt3qPA=;
 b=C6oh+ean3BVjGwIGd3CGXRiQ7BY/QOOCzw1cUgbHhOzLOmls2ejsVVfE//Amic20O14AHuIC/wSbLzfN/4/S1eeZiT6ji7anuqztdQ6y7xIJSfdtaTflCZlmWqBADfq3Bdub6ILGRg7TbNVm0k1tci1otzDFIyhElC5zrSqfpJI=
Received: from BLAPR03CA0016.namprd03.prod.outlook.com (2603:10b6:208:32b::21)
 by CH6PR19MB506268.namprd19.prod.outlook.com (2603:10b6:610:30c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 15:54:08 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::4c) by BLAPR03CA0016.outlook.office365.com
 (2603:10b6:208:32b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 15:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 15:54:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7FC26406550;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 63F19822552;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v7 2/3] clk: cs2600: Add Fractional-N clock driver
Date: Fri,  7 Aug 2026 16:54:05 +0100
Message-ID: <20260807155406.752721-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CH6PR19MB506268:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 632c122f-81a5-41e4-57f7-08def49c1d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|36860700016|376014|16102099003|18002099003|22082099003|10067099003|6133799003|11063799006|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	CNgAD7gy+EY60M/ubVFZLmisNauroN8aufBSiAw2hNTmOVZzbVOHksfL1wNoEU/Eq/VNPL7WWjOc/15yFEZYHweun7fsFKQAVrTFleM2zQHsAPWhiEWJRDB/JalA0wH6TI7FegPILMokilXWIYeRSby2p2xVUp2117740hiF1R6FjfBB+s9lGgEQ1iMoJ7dRz01gR0NAmpC+fYeO3juOXSYtHgJ3WXfa5dLgvfA6UxuGhp5XEXpQgHOPHw7+38L8Imc3SYaaGLfM7Q6TWHS5Td+XYmWutT+wULlzJGcLKw6A7gz4XKrv1QGLQzGGq6nGzvYH5fbuyHJwZ4gtag2l8qIddhifNADewls+pkNcpWEa6fRcfrGhBYNL+PeixMtMPUP2vEIGF68JK5/UfV83QJDxUyagWV8Q0CraCh3g3PugSvl0UyrYwwSsox1VSsvQ2M1ow5O52Q9ZH1UT0BnW2T220WzOgJfRSFurME2Hbiap+JwDTCJQISTGj/55cwZgBZqe78gsVPy8w+EjSFLT6Hpqm1jMVSyw3sgIKhLQlzIUuhp9f/qn858pG3rrVQ3cGIB3FPDBUg1v7SIxlUo+9IQENOVjIbsLIIhGW9heXnjq4BhUNvd1Xb57xMsFaJNY7hRjdU7dpWvt7lqkYjtAvSYFdr/KQo3VmmYzC+SckuEJ4TkHH05hMY2dynomuwHAoUMqQ3oNF/UBd9mLSFCO3A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(36860700016)(376014)(16102099003)(18002099003)(22082099003)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S1u0Sl+MGdGAykfvMpCPsM8pq8ZOX7mUBIGUiX2lfhPbqtAa+mK9qJ5TAh4w6X9OZp5enESpbISaDW1dD3/qZeeiUEBB21iFzAmIaJeGe63VlWDDjd28nEfA0h7r4pFpclo7QJfpFXo29/kMkz20Bhtb0jgkLXgmakjY4G1sjOGBZWVzWmGj+QXB6Z/U0qGrSVgdFtUhQjugILK1IE4zgGTq6RDOiTup4KH6PkpkCewRrdmPIXzeYkOKJL9/vDA4yt+VtcIkfPWtwuCVsBXDsJ2Sdurtko0FSMsic78rUKKU2ZWEAe+nzv47eCvC2WiwOvqbINjbjmmO7zwNACm2ZDrOvuOrXpce8oAGXrWnxVCpH7AlipJ+NWfnowmwgZ2DnNZhjuIjlu6294nmS3Pr0/dL5r3WjiVkNv07BbpRPHbl9WdHZtOhSG13lxDFY977
X-Exchange-RoutingPolicyChecked:
	bByfC+4FFOVAbQxQ2YOIt9NcdG9PJtc3PKItg9IgRbvIPWtQpfPmKcUHcKQT7T9b8a4pyjCdzhEr1qeYKIyQA64qAUroImfEhJPnunpcepjwxPor/WEk0YocNAM7FEZ4xRHCp8MMjqH8ZQfdOZlOYx8m4qVvnHhY8Yny3ahvfa8fsJOfnJVfqrV6k45HcJFrReiOLZS4WwSzmFjg9O2WDsB5zeyd0fugCRUnY8/tzxpxUF8XzvUdfiDygyVSR1+qdPrMRnTQJyr6Kn26JM/bIv+yQQCdfcsp0VNHRDDryryk01E1Mxu9B03QVxr/K/gkO2MiJNAj9ffYEIVsP57g9w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:54:07.5794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 632c122f-81a5-41e4-57f7-08def49c1d5c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB506268
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfX2tb7JxNJ0EEm
 4VaLggt+0aaWYtEoTvgF76GN5iCz6VCGn2NKz7yACzAw84JQZGNry+nBLUVtoSFEQKQ6SxXcUYe
 RD5uFxGzMOBhXdYYxO/tnNYU2CFsRxg=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75ffaa cx=c_pps
 a=7kgNGXaSmB15KJ6u7rEBag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Yk8DAn5qYztc0rMJqD4A:9
X-Proofpoint-GUID: x97F3QkMn-EuT3qFOdU2eIHTfpIdquUh
X-Proofpoint-ORIG-GUID: x97F3QkMn-EuT3qFOdU2eIHTfpIdquUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfXy1DG5WL3rhy8
 CuwAZfd7XZVqiI5ykggww6MXoErPFljs0bydfJl6c5WPsRwalnV09OQqfry18CYb8GR3/UkoX11
 nGfNno1yJrvzAJGSL8DLg/cd2FIKZZyjnXRtnyacPJ2wpiVrXHbDcC8A+bt785cthPRKgkSLJFm
 J7PmjxAvBl5Dnt5exZnPLcDtlDqDLDeJpBGJ2L3B9mjobi4Fys7RFkFkHEmevnlb106EiQHM3Gi
 t1M8jJZp2Ovu8yBDqGJMf6sGALCHAqCWRQsxhZAXJIuC7qp+MCF0C8AAc/05Wf9PZOjEsISOXKg
 P/gnQ3zQpr6ZB9cdZdb94OsJtlozAZ7gXdeQpCbLiWdB+3aoCN+tYOBmEUM5THWmOjevj1ttGXh
 k/svFQAJJPWz9atRE9ZTR7Ksynz+56gXuXJ81tCPxbr+9BA+v7HVNOjFpMy6KE0hXg2HFIUhpoo
 a7jIJS/jI2wzijmGqGg==
X-Proofpoint-Spam-Reason: safe

From: Paul Handrigan <paulha@opensource.cirrus.com>

Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
and multiplier.

The CS2600 is a system-clocking device using a hybrid fractional-N analog
PLL and a digital frequency-locked loop (FLL). The CS2600 enables frequency
synthesis and clock generation from a stable timing reference clock. The
device can generate low-jitter clocks between 6 MHz and 75 MHz from a noisy
clock reference between 50 Hz and 30 MHz, or from a stable clock reference
between 8 MHz and 75 MHz.

The timing reference clock (REF_CLK_IN) can be an external clock source
or the internal oscillator. This clock drives the PLL and is always
required to generate output clocks, even if it is not used as the frequency
reference.

The frequency reference source can be either REF_CLK_IN or an external
clock on CLK_IN.

The PLL_OUT clock frequency is a ratio of the chosen frequency reference.
The ratio is a fixed-point number of either 12.20 or 20.12 precision. The
lower-precision high-multiplication 20.12 ratios are only available when
CLK_IN is the frequency reference.

In smart mode the CS2600 will synthesize the output based on REF_CLK_IN
until a clock is present on CLK_IN; it then performs a glitchless switch
to CLK_IN as the frequency reference. A variant of smart mode
automatically enables the PLL output only when CLK_IN becomes available.

Three output pins are derived from PLL_OUT:

  CLK_OUT:   Gated output from PLL_OUT.
  BCLK_OUT:  Divided from PLL_OUT.
  FSYNC_OUT: Divided from PLL_OUT.

The BCLK_OUT and FSYNC_OUT have different sets of available divide ratios
intended to provide the typical frequency relation between bit clock and
frame clock on I2S/TDM audio interfaces. They can also be inverted with
respect to CLK_OUT to support various formats of serial audio data.
FSYNC_OUT has the additional feature that it can be either a 50:50 duty
cycle or a pulse of a programmable number of BCLK cycles.

This configuration is modeled in the driver as:

                 +------------+
  REF_CLK_IN ----| Hybrid PLL | PLL_OUT    +--------+
                 |   + FLL    |-----+------|  GATE  |--------- CLK_OUT
      CLK_IN ----|            |     |      +--------+
                 +------------+     |
                                    |      +---------+
                                    +------| DIVIDER |-------- BCLK_OUT
                                    |      +---------+
                                    |
                                    |      +---------+
                                    +------| DIVIDER |-------- FSYNC_OUT
                                           +---------+

OF properties define the hardware-level configuration to match the
hardware that the CS2600 is driving.

The CS2600_ERR_xxx register bits are not used in the driver but are
defined in the header file as a convenience for anyone debugging a
system.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V7:
- Make use of the holding buffer in the CS2600 for writes to frozen bits.
  The removes the need to clear and set FREEZE_EN around those writes,
  instead FREEZE_EN is toggled after the writes.

- Set req->rate in cs2600_bclk_determine_rate() and
  cs2600_fsync_determine_rate()

- Deleted the spurious check of PLL_EN1 in cs2600_pll_out_prepare().
  It would always be 0 so this code did nothing.
  
- Use regmap_multi_reg_write() two write both ratio registers in one
  function call. Makes the error handling tidier because there's only
  one error return.

- Set CLK_SET_RATE_GATE on the PLL_OUT and CLK_OUT clocks.

- Set reg_stride in the regmap.

- Delete if statements that checked cs2600->ref_clk for NULL.
  It's enforced during probe() that this cannot be NULL.
  
- Check in cs2600_clk_register() that there is at least one parent.
  
- Delete the check in cs2600_pll_out_set_parent() that the parent index
  fits in the register field. The call to clk_hw_get_parent_by_index()
  already checked that the index is valid.
  
- Added some more error checks on regmap writes.

- Check return value of regmap_test_bits() for error.

- Log detected device ID and revision at dev_dbg level instead of dev_info.

- Renamed two local variables that hold the divide index to 'div_index'
  (instead of 'div_val').
  
- Order local variables in cs2600_clk_register() by line length.

Changes in V6:
- Merged the functions to calculate synth mode and mult mode ratios. The
  math is the same, only the fixed-point precision is different. The new
  cs2600_calc_ratio() function calculates at 20:20 fixed point and then
  converts to 20:12 if the value is too large for 12:20.
  This also simplifies the calling code because it doesn't need all the
  checks of which ratio function it should be calling.
- Re-worked the rounding of calculated rates so that they didn't drift
  away from the best rate when the clock core passed the rounded rate from
  determine_rate() back into set_rate().
- Changed various parts of the recalc_rate()/determine_rate()/set_rate()
  functions that relied on the state of the other clock registers to make
  decisions. There's no guarantee whether those other clocks have been
  configured yet so the decision making could be invalid.
- Removed the use of different ratio slots depending on the mode. The
  The CS2600 doesn't care which slots are used for synth and mult ratio.
  Using fixed slots simplifies the code.
- Split the large cs2600_pll_out_prepare() into helper functions.
- Request ref_clk when starting the PLL. It is the system clock of the
  CS2600 so it is always required to clock the chip even if it isn't the
  frequency reference parent. In previous versions ref_clk was only
  enabled by being the parent, which meant the CS2600 wasn't clocked when
  using mult mode with clk_in as the frequency reference parent.
- Fix cs2600_pll_out_set_parent() to properly reconfigure the PLL when
  changing parents. The parent selection isn't a simple mux, it changes
  PLL mode and selected ratio registers. Previously the mode bit was
  written but the mode ratio registers weren't updated to match.
- Factor out the BCLK and FSYNC divider lookup into a single function. The
  lookup code is the same apart from the divide value that each register
  field value represents. The divide values are provided as an array.
- Don't attempt to set a best_parent_rate when setting BCLK/FSYNC rate.
  The parent (CLK_OUT) rate is not arbitrary, it must match the requirements
  of the device being clocked, and only the consumer driver will know
  what is correct.
- Set CLK_SET_PARENT_GATE on the PLL. Its configuration cannot be updated
  atomically, so it must be stopped to reconfigure it.
- Split several functions into separate functions for calculating a value
  and get/set the register.
- Use FIELD_PREP() and FIELD_GET() instead of multiple custom macros.
- Fix inverted register unfreeze and freeze that meant the bits affected
  by FREEZE_EN were not actually updated.
- Use a DEFINE_GUARD to implement the register field unfreeze.
- Rename cs2600_ref_clk_bound_rate() to cs2600_ref_clk_set_divider() to
  indicate it's actually setting the rate, not just finding a rounded value.
- Remove inappropriate use of in_range() that required some confusing
  math to pass the correct value into in_range(). It's clearer to do
  normal min/max comparison.
- Use DIV_ROUND_UP_ULL() to convert PPM to a frequency delta instead of
  open-coding it.
- Initialize all the clocks using a single common loop.
- Use clk_init_data.parent_hws to set FSYNC, BCLK and CLK_OUT parent as
  PLL_OUT, instead of looking up PLL_OUT by name and setting FSYNC, BCLK
  and CLK_OUT parent to that name.
- Smart mode selection is now two boolean properties instead of an enum
  property. One property select smart mode, the other property enables
  suppression of PLL_OUT until there is clock on CLK_IN.
- Added properties to invert FSYNC and BCLK relative to CLK_OUT.
- Added property to set the duty cycle of FSYNC (required when clocking
  TDM audio formats).
- Use match_string() instead of a string of strcmp() to lookup
  cirrus,aux1-output-source value.
- Use of the internal oscillator is now explictly flagged by the presence
  of the cirrus,internal-oscillator property. Previously the driver
  inferred it from the absence of a ref_clk in clock-names.
- More error checking.

Changes before V6:
Sorry, the previously upstreamed versions don't have a changelist for
me to copy into here.

 MAINTAINERS                     |    1 +
 drivers/clk/Kconfig             |    1 +
 drivers/clk/Makefile            |    1 +
 drivers/clk/cirrus/Kconfig      |   10 +
 drivers/clk/cirrus/Makefile     |    3 +
 drivers/clk/cirrus/clk-cs2600.c | 1229 +++++++++++++++++++++++++++++++
 drivers/clk/cirrus/clk-cs2600.h |  163 ++++
 7 files changed, 1408 insertions(+)
 create mode 100644 drivers/clk/cirrus/Kconfig
 create mode 100644 drivers/clk/cirrus/Makefile
 create mode 100644 drivers/clk/cirrus/clk-cs2600.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c2328066fede..9523e6d61bc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6218,6 +6218,7 @@ M:	patches@opensource.cirrus.com
 L:	patches@opensource.cirrus.com
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/cirrus,cs2600*
+F:	drivers/clk/cirrus/*
 F:	include/dt-bindings/clock/cirrus,cs2600*
 
 CIRRUS LOGIC HAPTIC DRIVERS
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..e576c6cd33f4 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -509,6 +509,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/cirrus/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..b1e3bb794d7f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
+obj-y					+= cirrus/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
diff --git a/drivers/clk/cirrus/Kconfig b/drivers/clk/cirrus/Kconfig
new file mode 100644
index 000000000000..5674d6554f96
--- /dev/null
+++ b/drivers/clk/cirrus/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config COMMON_CLK_CS2600
+	tristate "Clock driver for CS2600 Fractional-N Clock Synthesizer & Clock Multiplier"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the CS2600 clock synthesizer
+	  and multiplier.
diff --git a/drivers/clk/cirrus/Makefile b/drivers/clk/cirrus/Makefile
new file mode 100644
index 000000000000..182612dbb96a
--- /dev/null
+++ b/drivers/clk/cirrus/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_COMMON_CLK_CS2600)		+= clk-cs2600.o
diff --git a/drivers/clk/cirrus/clk-cs2600.c b/drivers/clk/cirrus/clk-cs2600.c
new file mode 100644
index 000000000000..977a4bf3c31d
--- /dev/null
+++ b/drivers/clk/cirrus/clk-cs2600.c
@@ -0,0 +1,1229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// CS2600  --  CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
+//
+// Copyright (C) 2024-2026 Cirrus Logic, Inc. and
+//			   Cirrus Logic International Semiconductor Ltd.
+
+#include <dt-bindings/clock/cirrus,cs2600-clock.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#include "clk-cs2600.h"
+
+#define hw_to_cs2600_clk(_hw)	container_of(_hw, struct cs2600_clk_hw, hw)
+
+static const struct reg_default cs2600_reg[] = {
+	{ CS2600_PLL_CFG1, 0x0080 },
+	{ CS2600_PLL_CFG2, 0x0008 },
+	{ CS2600_RATIO1_1, 0x0000 },
+	{ CS2600_RATIO1_2, 0x0000 },
+	{ CS2600_RATIO2_1, 0x0000 },
+	{ CS2600_RATIO2_2, 0x0000 },
+	{ CS2600_PLL_CFG3, 0x0000 },
+	{ CS2600_OUTPUT_CFG1, 0x0000 },
+	{ CS2600_OUTPUT_CFG2, 0x0000 },
+	{ CS2600_PHASE_ALIGNMENT_CFG1, 0x0000 },
+};
+
+static bool cs2600_read_and_write_reg(unsigned int reg)
+{
+	switch (reg) {
+	case CS2600_PLL_CFG1:
+	case CS2600_PLL_CFG2:
+	case CS2600_RATIO1_1:
+	case CS2600_RATIO1_2:
+	case CS2600_RATIO2_1:
+	case CS2600_RATIO2_2:
+	case CS2600_PLL_CFG3:
+	case CS2600_OUTPUT_CFG1:
+	case CS2600_OUTPUT_CFG2:
+	case CS2600_PHASE_ALIGNMENT_CFG1:
+	case CS2600_UNLOCK_INDICATORS:
+	case CS2600_ERROR_STS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cs2600_writeable_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == CS2600_SW_RESET)
+		return true;
+
+	return cs2600_read_and_write_reg(reg);
+}
+
+static bool cs2600_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS2600_DEVICE_ID1:
+	case CS2600_DEVICE_ID2:
+		return true;
+	default:
+		return cs2600_read_and_write_reg(reg);
+	}
+}
+
+static bool cs2600_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS2600_UNLOCK_INDICATORS:
+	case CS2600_ERROR_STS:
+	case CS2600_SW_RESET:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cs2600_precious_reg(struct device *dev, unsigned int reg)
+{
+	if (reg == CS2600_SW_RESET)
+		return true;
+
+	return false;
+}
+
+static const struct regmap_config cs2600_regmap_config = {
+	.reg_bits	= 16,
+	.reg_stride	= 2,
+	.val_bits	= 16,
+	.max_register	= CS2600_MAX_REGISTER,
+	.reg_defaults	= cs2600_reg,
+	.num_reg_defaults = ARRAY_SIZE(cs2600_reg),
+	.readable_reg	= cs2600_readable_reg,
+	.writeable_reg	= cs2600_writeable_reg,
+	.volatile_reg	= cs2600_volatile_reg,
+	.precious_reg	= cs2600_precious_reg,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
+static inline bool cs2600_is_smart_mode(struct cs2600 *cs2600)
+{
+	return (cs2600->mode == CS2600_SMART_CLKIN_ONLY_MODE ||
+		cs2600->mode == CS2600_SMART_MODE);
+}
+
+static int cs2600_ref_clk_set_divider(struct cs2600 *cs2600, unsigned long rate_in)
+{
+	unsigned int val;
+
+	if ((rate_in >= 32000000) && (rate_in <= 75000000)) {
+		val = 0x0;
+	} else if ((rate_in >= 16000000) && (rate_in <= 37500000)) {
+		val = 0x1;
+	} else if ((rate_in >= 8000000) && (rate_in <= 18750000)) {
+		val = 0x2;
+	} else {
+		dev_err(cs2600->dev, "Invalid refclk %lu\n", rate_in);
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
+				  CS2600_REF_CLK_IN_DIV_MASK,
+				  FIELD_PREP(CS2600_REF_CLK_IN_DIV_MASK, val));
+}
+
+static unsigned long cs2600_get_freq_variation(unsigned long freq,
+					       unsigned long ppm)
+{
+	return (unsigned long)DIV_ROUND_UP_ULL((u64)freq * ppm, 1000000);
+}
+
+static int cs2600_calc_ratio(struct cs2600 *cs2600,
+			     unsigned long rate,
+			     unsigned long parent_rate,
+			     unsigned int *ratio_out,
+			     bool *hi_res)
+{
+	u64 rate_shifted = (u64)rate;
+	u64 ratio;
+
+	if (parent_rate == 0)
+		return -EINVAL;
+
+	if ((rate < CS2600_CLK_OUT_MIN) || (rate > CS2600_CLK_OUT_MAX))
+		return -EINVAL;
+
+	/* Try high-resolution mode first */
+	*hi_res = true;
+	rate_shifted <<= CS2600_12_20_SHIFT;
+	ratio = div_u64(rate_shifted, parent_rate);
+
+	if (ratio > CS2600_12_20_RATIO_MAX) {
+		*hi_res = false;
+		ratio >>= (CS2600_12_20_SHIFT - CS2600_20_12_SHIFT);
+
+		if (ratio > CS2600_20_12_RATIO_MAX) {
+			dev_err(cs2600->dev, "Ratio %lu:%lu too large\n", parent_rate, rate);
+			return -EINVAL;
+		}
+	}
+
+	*ratio_out = ratio;
+
+	return 0;
+}
+
+static unsigned int cs2600_calc_smart_synth_ratio(struct cs2600 *cs2600,
+						  unsigned long clkin_rate,
+						  unsigned int m_ratio,
+						  bool hi_res,
+						  unsigned long refclk_rate)
+{
+	u64 m_rate_32_20 = (u64)clkin_rate * m_ratio;
+
+	/* If low-res adjust 32.12 value to 32.20 */
+	if (!hi_res)
+		m_rate_32_20 <<= (CS2600_12_20_SHIFT - CS2600_20_12_SHIFT);
+
+	return (unsigned int)div_u64(m_rate_32_20, refclk_rate);
+}
+
+static unsigned long cs2600_calc_rounded_integer_rate(struct cs2600 *cs2600,
+						      unsigned long parent_rate,
+						      unsigned long target_rate)
+{
+	unsigned int ratio;
+	bool hi_res;
+	u64 fout;
+	int ret;
+
+	ret = cs2600_calc_ratio(cs2600, target_rate, parent_rate, &ratio, &hi_res);
+	if (ret)
+		return 0;
+
+	fout = (u64)ratio * parent_rate;
+	if (hi_res)
+		fout >>= CS2600_12_20_SHIFT;
+	else
+		fout >>= CS2600_20_12_SHIFT;
+
+	/*
+	 * If it's fractional round to the next higher integer, so that if
+	 * it is passed to set_rate() it will produce the same ratio and
+	 * target frequency we just calculated.
+	 */
+	if (fout != target_rate)
+		fout++;
+
+	if (fout < CS2600_CLK_OUT_MIN)
+		return 0;
+
+	return fout;
+}
+
+static unsigned long cs2600_pll_out_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+
+	if ((parent_rate == 0) || (cs2600->pll_target_rate == 0))
+		return 0;
+
+	if (parent_rate == cs2600->pll_parent_rate)
+		return cs2600->pll_target_rate;
+
+	return cs2600_calc_rounded_integer_rate(cs2600, parent_rate, cs2600->pll_target_rate);
+}
+
+static int cs2600_pll_out_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	unsigned long out_rate;
+
+	out_rate = cs2600_calc_rounded_integer_rate(cs2600, req->best_parent_rate, req->rate);
+	if (out_rate == 0)
+		return -EINVAL;
+
+	req->rate = out_rate;
+
+	return 0;
+}
+
+static int cs2600_set_resolution_mode(struct cs2600 *cs2600, bool hi_res)
+{
+	unsigned int val = 0;
+
+	if (hi_res)
+		val = CS2600_RATIO_CFG;
+
+	return regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3, CS2600_RATIO_CFG, val);
+}
+
+enum cs2600_ratio_slot {
+	CS2600_RATIO_SLOT_1,
+	CS2600_RATIO_SLOT_2,
+};
+
+static const struct {
+	u8 h;
+	u8 l;
+} cs2600_ratio_regs[] = {
+	[CS2600_RATIO_SLOT_1] = { .h = CS2600_RATIO1_1, .l = CS2600_RATIO1_2 },
+	[CS2600_RATIO_SLOT_2] = { .h = CS2600_RATIO2_1, .l = CS2600_RATIO2_2 },
+};
+
+static int cs2600_write_ratio(struct cs2600 *cs2600, enum cs2600_ratio_slot slot,
+			      unsigned int ratio)
+{
+	struct reg_sequence sequence[] = {
+		{ .reg = cs2600_ratio_regs[slot].l, .def = ratio & 0xFFFF },
+		{ .reg = cs2600_ratio_regs[slot].h, .def = ratio >> 16 },
+	};
+
+	return regmap_multi_reg_write(cs2600->regmap, sequence, ARRAY_SIZE(sequence));
+}
+
+static int cs2600_pll_out_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	unsigned int ratio, smart_s_ratio;
+	bool hi_res;
+	int ret;
+
+	ret = cs2600_calc_ratio(cs2600, rate, parent_rate, &ratio, &hi_res);
+	if (ret)
+		return ret;
+
+	switch (cs2600->mode) {
+	case CS2600_SMART_MODE:
+		/*
+		 * Calc synth ratio to match the actual mult output frequency
+		 * to minimise the frequency change when the PLL switches from
+		 * synth to mult.
+		 */
+		smart_s_ratio = cs2600_calc_smart_synth_ratio(cs2600, parent_rate,
+							      ratio, hi_res,
+							      cs2600->refclk_rate);
+		ret = cs2600_write_ratio(cs2600, CS2600_RATIO_SLOT_2, smart_s_ratio);
+		if (ret < 0)
+			return ret;
+		break;
+	case CS2600_SMART_CLKIN_ONLY_MODE:
+		ret = cs2600_write_ratio(cs2600, CS2600_RATIO_SLOT_2, 0);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		/* Low-resolution ratios can only be used in mult mode */
+		ret = regmap_test_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_MODE_SEL);
+		if (ret < 0)
+			return ret;
+
+		if (!hi_res && !ret)
+			return -EINVAL;
+
+		break;
+	}
+
+	ret = cs2600_write_ratio(cs2600, CS2600_RATIO_SLOT_1, ratio);
+	if (ret < 0)
+		return ret;
+
+	ret = cs2600_set_resolution_mode(cs2600, hi_res);
+	if (ret < 0)
+		return ret;
+
+	cs2600->pll_target_rate = rate;
+	cs2600->pll_parent_rate = parent_rate;
+
+	return 0;
+}
+
+static int cs2600_pll_out_is_prepared(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	ret = regmap_test_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
+	if (ret < 0) {
+		dev_err(cs2600->dev, "Failed to read PLL_CFG1:%d\n", ret);
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int cs2600_enable_pll(struct cs2600 *cs2600, bool enable)
+{
+	int ret;
+
+	ret = regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG1,
+				 CS2600_PLL_EN1,
+				 FIELD_PREP(CS2600_PLL_EN1, !!enable));
+	if (ret < 0)
+		return ret;
+
+	return regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2,
+				  FIELD_PREP(CS2600_PLL_EN2, !!enable));
+}
+
+static int cs2600_wait_for_pll_lock(struct cs2600 *cs2600)
+{
+	int i, ret;
+
+	usleep_range(1000, 1100);
+	for (i = 0; i < CS2600_LOCK_ATTEMPTS_MAX; i++) {
+		ret = regmap_test_bits(cs2600->regmap, CS2600_UNLOCK_INDICATORS,
+				       CS2600_F_UNLOCK_STICKY);
+		if (ret < 0)
+			return ret;
+
+		if (ret == 0)
+			return 0;
+
+		ret = regmap_write(cs2600->regmap, CS2600_UNLOCK_INDICATORS,
+				   CS2600_CLEAR_INDICATORS);
+		if (ret < 0)
+			return ret;
+
+		usleep_range(200, 300);
+	}
+
+	dev_err(cs2600->dev, "PLL did not lock\n");
+
+	return -ETIMEDOUT;
+}
+
+static int _cs2600_pll_out_prepare(struct cs2600 *cs2600)
+{
+	int ret;
+
+	ret = cs2600_enable_pll(cs2600, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * clkin-only mode configures the PLL so that it only starts
+	 * when clock is present on CLK_IN. So don't wait for lock here.
+	 */
+	if (cs2600->mode == CS2600_SMART_CLKIN_ONLY_MODE)
+		return 0;
+
+	ret = regmap_write(cs2600->regmap, CS2600_UNLOCK_INDICATORS,
+			   CS2600_CLEAR_INDICATORS);
+	if (!ret)
+		ret = cs2600_wait_for_pll_lock(cs2600);
+
+	if (ret < 0)
+		cs2600_enable_pll(cs2600, false);
+
+	return ret;
+}
+
+static int cs2600_pll_out_prepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	/* REF_CLK is always required to clock the PLL */
+	ret = clk_prepare_enable(cs2600->ref_clk);
+	if (ret < 0) {
+		dev_err(cs2600->dev, "Failed to enable ref_clk: %d\n", ret);
+		return ret;
+	}
+
+	ret = _cs2600_pll_out_prepare(cs2600);
+	if (ret < 0) {
+		clk_disable_unprepare(cs2600->ref_clk);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+
+static void cs2600_pll_out_unprepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+
+	regmap_clear_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
+	regmap_clear_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_EN2);
+
+	clk_disable_unprepare(cs2600->ref_clk);
+}
+
+static int cs2600_pll_out_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	struct clk_hw *parent_clk_hw;
+	unsigned long parent_rate;
+	unsigned int old_mode_sel;
+	int ret;
+
+	parent_clk_hw = clk_hw_get_parent_by_index(hw, index);
+	if (!parent_clk_hw)
+		return -EINVAL;
+
+	/* CLK_IN is the only parent in smart mode */
+	if (cs2600_is_smart_mode(cs2600))
+		return 0;
+
+	parent_rate = clk_hw_get_rate(parent_clk_hw);
+
+	ret = regmap_read(regmap, CS2600_PLL_CFG2, &old_mode_sel);
+	if (ret) {
+		dev_err(cs2600->dev, "Read PLL_CFG2 failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_MODE_SEL,
+				 index);
+	if (ret < 0)
+		return ret;
+
+	if (cs2600->pll_target_rate == 0)
+		return 0;
+
+	ret = cs2600_pll_out_set_rate(hw, cs2600->pll_target_rate, parent_rate);
+	if (ret) {
+		regmap_update_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_MODE_SEL, old_mode_sel);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static u8 cs2600_pll_out_get_parent(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	/* CLK_IN is the only parent in smart mode */
+	if (cs2600_is_smart_mode(cs2600))
+		return 0;
+
+	ret = regmap_test_bits(regmap, CS2600_PLL_CFG2, CS2600_PLL_MODE_SEL);
+	if (ret < 0)
+		return 0;
+
+	return (u8)ret;
+}
+
+static int cs2600_clk_out_prepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+
+	return regmap_clear_bits(regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
+}
+
+static void cs2600_clk_out_unprepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+
+	regmap_set_bits(regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
+}
+
+static int cs2600_clk_out_is_prepared(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	ret = regmap_test_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_CLK_OUT_DIS);
+	if (ret < 0) {
+		dev_err(cs2600->dev, "Failed to read PLL_CFG1:%d\n", ret);
+		return 0;
+	}
+
+	return !ret;
+}
+
+static const u16 cs2600_bclk_div[] = {
+	1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48,
+	0 /* terminator */
+};
+
+static int cs2600_get_clk_div_index(const u16 *divs, unsigned int rate, unsigned int parent_rate)
+{
+	unsigned long calc_rate, freq_var;
+	int i;
+
+	freq_var = cs2600_get_freq_variation(rate, CS2600_20_12_PPM);
+
+	for (i = 0; divs[i]; i++) {
+		calc_rate = parent_rate / divs[i];
+		if (in_range(rate, calc_rate - freq_var, 2 * freq_var))
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int cs2600_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int div_index;
+
+	if (rate > CS2600_BCLK_OUT_MAX || rate < CS2600_BCLK_OUT_MIN)
+		return -EINVAL;
+
+	if (parent_rate > CS2600_CLK_OUT_MAX || parent_rate < CS2600_CLK_OUT_MIN)
+		return -EINVAL;
+
+	div_index = cs2600_get_clk_div_index(cs2600_bclk_div, rate, parent_rate);
+	if (div_index < 0) {
+		dev_err(cs2600->dev, "Cannot set bclk %lu from parent rate %lu\n", rate,
+			parent_rate);
+
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_DIV_MASK,
+				  FIELD_PREP(CS2600_BCLK_DIV_MASK, div_index));
+}
+
+static int cs2600_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int div_index;
+
+	if (req->rate > CS2600_BCLK_OUT_MAX || req->rate < CS2600_BCLK_OUT_MIN)
+		return -EINVAL;
+
+	div_index = cs2600_get_clk_div_index(cs2600_bclk_div, req->rate, req->best_parent_rate);
+	if (div_index < 0) {
+		dev_err(cs2600->dev, "BCLK_OUT cannot be derived from the parent rate");
+		return -EINVAL;
+	}
+
+	req->rate = req->best_parent_rate / cs2600_bclk_div[div_index];
+
+	return 0;
+}
+
+static unsigned long cs2600_bclk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, CS2600_OUTPUT_CFG1, &val);
+	if (ret) {
+		dev_err(cs2600->dev, "Read bclk divider failed: %d\n", ret);
+		return 0;
+	}
+
+	val = FIELD_GET(CS2600_BCLK_DIV_MASK, val);
+	if ((val < ARRAY_SIZE(cs2600_bclk_div)) && cs2600_bclk_div[val])
+		return (parent_rate / cs2600_bclk_div[val]);
+
+	dev_err(cs2600->dev, "Cannot find bclk divide value for index=%#x\n", val);
+
+	return 0;
+}
+
+static int cs2600_bclk_prepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	int ret;
+
+	ret = regmap_set_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
+			      CS2600_PHASE_ALIGN_EN | CS2600_PHASE_ALIGN_STB_EN);
+	if (ret < 0)
+		return ret;
+
+	return regmap_clear_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_DIS);
+}
+
+static void cs2600_bclk_unprepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	int ret;
+
+	ret = regmap_test_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS);
+	if (ret > 0)
+		regmap_clear_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
+				  CS2600_PHASE_ALIGN_EN |
+				  CS2600_PHASE_ALIGN_STB_EN);
+
+	regmap_set_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_DIS);
+}
+
+static int cs2600_bclk_is_prepared(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	ret = regmap_test_bits(cs2600->regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_DIS);
+	if (ret < 0) {
+		dev_err(cs2600->dev, "Failed to read OUTPUT_CFG1:%d\n", ret);
+		return 0;
+	}
+
+	return !ret;
+}
+
+static const u16 cs2600_fsync_div[] = {
+	16, 32, 64, 128, 256, 512, 1024, 192, 384, 768, 1536, 576, 1152,
+	0 /* terminator */
+};
+
+static int cs2600_fsync_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int div_index;
+
+	if (rate > CS2600_FSYNC_OUT_MAX || rate < CS2600_FSYNC_OUT_MIN)
+		return -EINVAL;
+
+	if (parent_rate > CS2600_CLK_OUT_MAX || parent_rate < CS2600_CLK_OUT_MIN)
+		return -EINVAL;
+
+	div_index = cs2600_get_clk_div_index(cs2600_fsync_div, rate, parent_rate);
+	if (div_index < 0) {
+		dev_err(cs2600->dev, "Cannot set fsync %lu from parent rate %lu\n",
+			rate, parent_rate);
+
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_DIV_MASK,
+				  FIELD_PREP(CS2600_FSYNC_DIV_MASK, div_index));
+}
+
+static int cs2600_fsync_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int div_index;
+
+	if (req->rate > CS2600_FSYNC_OUT_MAX || req->rate < CS2600_FSYNC_OUT_MIN)
+		return -EINVAL;
+
+	div_index = cs2600_get_clk_div_index(cs2600_fsync_div, req->rate, req->best_parent_rate);
+	if (div_index < 0) {
+		if (req->best_parent_rate)
+			dev_err(cs2600->dev, "FSYNC_OUT cannot be derived from the parent rate");
+
+		return -EINVAL;
+	}
+
+	req->rate = req->best_parent_rate / cs2600_fsync_div[div_index];
+
+	return 0;
+}
+
+static unsigned long cs2600_fsync_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	struct cs2600 *cs2600 = clk_hw->priv;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, CS2600_OUTPUT_CFG1, &val);
+	if (ret) {
+		dev_err(cs2600->dev, "Read fsync divider failed: %d\n", ret);
+		return 0;
+	}
+
+	val = FIELD_GET(CS2600_FSYNC_DIV_MASK, val);
+	if ((val < ARRAY_SIZE(cs2600_fsync_div)) && cs2600_fsync_div[val])
+		return (parent_rate / cs2600_fsync_div[val]);
+
+	dev_err(cs2600->dev, "Cannot find fsync divide value for index=%#x\n", val);
+
+	return 0;
+}
+
+static int cs2600_fsync_prepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	int ret;
+
+	ret = regmap_set_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
+			      CS2600_PHASE_ALIGN_EN | CS2600_PHASE_ALIGN_STB_EN);
+	if (ret < 0)
+		return ret;
+
+	return regmap_clear_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS);
+}
+
+static void cs2600_fsync_unprepare(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct regmap *regmap = clk_hw->priv->regmap;
+	int ret;
+
+	ret = regmap_test_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_BCLK_OUT_DIS);
+	if (ret > 0)
+		regmap_clear_bits(regmap, CS2600_PHASE_ALIGNMENT_CFG1,
+				  CS2600_PHASE_ALIGN_EN |
+				  CS2600_PHASE_ALIGN_STB_EN);
+
+	regmap_set_bits(regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS);
+}
+
+static int cs2600_fsync_is_prepared(struct clk_hw *hw)
+{
+	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
+	struct cs2600 *cs2600 = clk_hw->priv;
+	int ret;
+
+	ret = regmap_test_bits(cs2600->regmap, CS2600_OUTPUT_CFG1, CS2600_FSYNC_OUT_DIS);
+	if (ret < 0) {
+		dev_err(cs2600->dev, "Failed to read OUTPUT_CFG1:%d\n", ret);
+		return 0;
+	}
+
+	return !ret;
+}
+
+struct cs2600_clk {
+	const char *name;
+	const struct clk_ops ops;
+	unsigned long flags;
+};
+
+static const struct cs2600_clk cs2600_clks[CS2600_OUT_CLK_MAX] = {
+	[CS2600_PLL_OUT] = { /* Internal clock */
+		.name = "pll_out",
+		.ops = {
+			.get_parent	= cs2600_pll_out_get_parent,
+			.set_parent	= cs2600_pll_out_set_parent,
+			.recalc_rate	= cs2600_pll_out_recalc_rate,
+			.determine_rate = cs2600_pll_out_determine_rate,
+			.set_rate	= cs2600_pll_out_set_rate,
+			.prepare	= cs2600_pll_out_prepare,
+			.is_prepared	= cs2600_pll_out_is_prepared,
+			.unprepare	= cs2600_pll_out_unprepare,
+		},
+		.flags = CLK_SET_PARENT_GATE | CLK_SET_RATE_GATE,
+	},
+	[CS2600_CLK_OUT] = {
+		.name = "clk_out",
+		.ops = {
+			.prepare	= cs2600_clk_out_prepare,
+			.unprepare	= cs2600_clk_out_unprepare,
+			.is_prepared	= cs2600_clk_out_is_prepared,
+		},
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	},
+	[CS2600_BCLK_OUT] = {
+		.name = "bclk_out",
+		.ops = {
+			.recalc_rate	= cs2600_bclk_recalc_rate,
+			.determine_rate = cs2600_bclk_determine_rate,
+			.set_rate	= cs2600_bclk_set_rate,
+			.prepare	= cs2600_bclk_prepare,
+			.unprepare	= cs2600_bclk_unprepare,
+			.is_prepared	= cs2600_bclk_is_prepared,
+
+		},
+	},
+	[CS2600_FSYNC_OUT] = {
+		.name = "fsync_out",
+		.ops = {
+			.recalc_rate	= cs2600_fsync_recalc_rate,
+			.determine_rate = cs2600_fsync_determine_rate,
+			.set_rate	= cs2600_fsync_set_rate,
+			.prepare	= cs2600_fsync_prepare,
+			.unprepare	= cs2600_fsync_unprepare,
+			.is_prepared	= cs2600_fsync_is_prepared,
+
+		},
+	},
+};
+
+static int cs2600_clk_get(struct cs2600 *cs2600)
+{
+	struct clk *clk_in, *ref_clk;
+
+	ref_clk = devm_clk_get(cs2600->dev, "ref_clk_in");
+	if (IS_ERR(ref_clk))
+		return PTR_ERR(ref_clk);
+
+	cs2600->refclk_rate = clk_get_rate(ref_clk);
+	if (cs2600->refclk_rate < 8000000 || cs2600->refclk_rate > 75000000) {
+		return dev_err_probe(cs2600->dev, -EINVAL,
+				     "Invalid REFCLK Frequency %lu\n",
+				     cs2600->refclk_rate);
+	}
+
+	clk_in = devm_clk_get_optional(cs2600->dev, "clk_in");
+	if (IS_ERR(clk_in))
+		return PTR_ERR(clk_in);
+
+	cs2600->ref_clk = ref_clk;
+	cs2600->clk_in = clk_in;
+
+	return 0;
+}
+
+static struct clk_hw *cs2600_of_clk_get(struct of_phandle_args *clkspec,
+					void *data)
+{
+	unsigned int index = clkspec->args[0];
+	struct cs2600 *cs2600 = data;
+
+	/* PLL_OUT is an internal clock */
+	if (index > CS2600_OUT_CLK_MAX - 1) {
+		dev_err(cs2600->dev, "Invalid clock index %d\n", index);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &cs2600->hw[index].hw;
+}
+
+static int cs2600_clk_register(struct cs2600 *cs2600)
+{
+	struct clk_init_data init[ARRAY_SIZE(cs2600->hw)] = { };
+	const char *names[ARRAY_SIZE(cs2600_clks)];
+	const struct clk_hw *out_clocks_parent;
+	int ret, i, n, input_num = 0;
+	const char *parent_names[2];
+
+	static_assert(ARRAY_SIZE(cs2600_clks) == ARRAY_SIZE(cs2600->hw));
+
+	for (i = 0; i < ARRAY_SIZE(cs2600->hw); i++) {
+		init[i].name = cs2600_clks[i].name;
+		init[i].ops = &cs2600_clks[i].ops;
+		init[i].flags = cs2600_clks[i].flags;
+		cs2600->hw[i].hw.init = &init[i];
+		cs2600->hw[i].priv = cs2600;
+	}
+
+	n = of_property_read_string_array(cs2600->dev->of_node,
+					  "clock-output-names",
+					  names, ARRAY_SIZE(names));
+	for (i = 0; i < n; i++)
+		init[i].name = names[i];
+
+	/* ref_clk_in is only a parent option in manual mode */
+	if (!cs2600_is_smart_mode(cs2600))
+		parent_names[input_num++] = __clk_get_name(cs2600->ref_clk);
+
+	if (cs2600->clk_in)
+		parent_names[input_num++] = __clk_get_name(cs2600->clk_in);
+
+	if (input_num == 0)
+		return dev_err_probe(cs2600->dev, -EINVAL, "No parent clocks\n");
+
+	init[CS2600_PLL_OUT].parent_names = parent_names;
+	init[CS2600_PLL_OUT].num_parents = input_num;
+
+	/* The parent of all out clocks is the internal pll_out */
+	out_clocks_parent = &cs2600->hw[CS2600_PLL_OUT].hw;
+	for (i = CS2600_CLK_OUT; i < ARRAY_SIZE(cs2600->hw); i++) {
+		init[i].parent_hws = &out_clocks_parent;
+		init[i].num_parents = 1;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cs2600->hw); i++) {
+		ret = devm_clk_hw_register(cs2600->dev, &cs2600->hw[i].hw);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(cs2600->dev, cs2600_of_clk_get, cs2600);
+}
+
+static int cs2600_set_mode(struct cs2600 *cs2600)
+{
+	unsigned int s_slot = 0;
+	int ret;
+
+	if (device_property_present(cs2600->dev, "cirrus,smart-mode")) {
+		cs2600->mode = CS2600_SMART_MODE;
+		s_slot = 1;
+
+		if (device_property_present(cs2600->dev, "cirrus,smart-mode-clkin-only"))
+			cs2600->mode = CS2600_SMART_CLKIN_ONLY_MODE;
+	}
+
+	ret = regmap_clear_bits(cs2600->regmap, CS2600_PLL_CFG2, CS2600_M_RATIO_SEL_MASK);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_S_RATIO_SEL_MASK,
+				  FIELD_PREP(CS2600_S_RATIO_SEL_MASK, s_slot));
+}
+
+static int cs2600_set_output_inverts(struct cs2600 *cs2600)
+{
+	unsigned int field_val = 0;
+
+	if (device_property_present(cs2600->dev, "cirrus,bclk-invert"))
+		field_val |= CS2600_BCLK_INV;
+
+	if (device_property_present(cs2600->dev, "cirrus,fsync-invert"))
+		field_val |= CS2600_FSYNC_INV;
+
+	return regmap_update_bits(cs2600->regmap, CS2600_OUTPUT_CFG1,
+				  CS2600_BCLK_INV | CS2600_FSYNC_INV,
+				  field_val);
+}
+
+static int cs2600_set_fsync_duty(struct cs2600 *cs2600)
+{
+	u32 val;
+	int ret;
+
+	ret = device_property_read_u32(cs2600->dev, "cirrus,fsync-duty-cycles", &val);
+	if (ret == -EINVAL)
+		return 0;
+
+	if (ret < 0)
+		return ret;
+
+	if ((val < CS2600_FSYNC_MIN_CYCLES) || (val > CS2600_FSYNC_MAX_CYCLES) ||
+	    !is_power_of_2(val))
+		return dev_err_probe(cs2600->dev, -EINVAL, "Invalid FSYNC duty cycle %u\n", val);
+
+	return regmap_update_bits(cs2600->regmap, CS2600_OUTPUT_CFG1,
+				  CS2600_FSYNC_DUTY_CYCLE_MASK,
+				  FIELD_PREP(CS2600_FSYNC_DUTY_CYCLE_MASK,
+				  ffs(val)));
+}
+
+static const char * const cs2600_aux1_output_names[] = {
+	"ref_clk_in",
+	"clk_in",
+	"freq_unlock",
+	"phase_unlock",
+	"clkin_missing",
+};
+
+static const u8 cs2600_aux1_output_modes[] =  {
+	CS2600_AUX1_OUT_REF_CLK_IN_VAL,
+	CS2600_AUX1_OUT_CLK_IN_VAL,
+	CS2600_AUX1_OUT_FREQ_UNLOCK_VAL,
+	CS2600_AUX1_OUT_PHASE_UNLOCK_VAL,
+	CS2600_AUX1_OUT_NO_CLKIN_VAL,
+};
+
+static int cs2600_set_aux1_output(struct cs2600 *cs2600)
+{
+	const char *source;
+	unsigned int val;
+	int i, ret;
+
+	if (device_property_read_string(cs2600->dev, "cirrus,aux1-output-source", &source))
+		return 0;
+
+	i = match_string(cs2600_aux1_output_names, ARRAY_SIZE(cs2600_aux1_output_names), source);
+	if (i < 0)
+		return dev_err_probe(cs2600->dev, -EINVAL, "Invalid aux1 output %s\n", source);
+
+	static_assert(ARRAY_SIZE(cs2600_aux1_output_modes) == ARRAY_SIZE(cs2600_aux1_output_names));
+	val = cs2600_aux1_output_modes[i];
+
+	ret = regmap_update_bits(cs2600->regmap, CS2600_OUTPUT_CFG2,
+				 CS2600_AUX1OUT_SEL, FIELD_PREP(CS2600_AUX1OUT_SEL, val));
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(cs2600->regmap, CS2600_PLL_CFG1, CS2600_AUX1_OUT_DIS);
+}
+
+static int cs2600_set_refclk_source(struct cs2600 *cs2600)
+{
+	unsigned int src_field_val;
+
+	if (device_property_present(cs2600->dev, "cirrus,internal-oscillator")) {
+		if (cs2600->refclk_rate != CS2600_INTERNAL_OSC_RATE) {
+			return dev_err_probe(cs2600->dev, -EINVAL,
+					     "Illegal rate for internal oscillator\n");
+		}
+		src_field_val = CS2600_SYSCLK_SRC_OSC;
+	} else {
+		src_field_val = CS2600_SYSCLK_SRC_REFCLK;
+	}
+
+	return regmap_update_bits(cs2600->regmap, CS2600_PLL_CFG3,
+				  CS2600_SYSCLK_SRC_MASK,
+				  FIELD_PREP(CS2600_SYSCLK_SRC_MASK, src_field_val));
+}
+
+static int cs2600_parse_properties(struct cs2600 *cs2600)
+{
+	int ret;
+
+	ret = cs2600_set_mode(cs2600);
+	if (ret)
+		return ret;
+
+	ret = cs2600_set_output_inverts(cs2600);
+	if (ret)
+		return ret;
+
+	ret = cs2600_set_fsync_duty(cs2600);
+	if (ret)
+		return ret;
+
+	ret = cs2600_set_aux1_output(cs2600);
+	if (ret)
+		return ret;
+
+	ret = cs2600_set_refclk_source(cs2600);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cs2600_check_device_id(struct cs2600 *cs2600)
+{
+	struct device *dev = cs2600->dev;
+	unsigned int dev_id, rev;
+	int ret;
+
+	ret = regmap_read(cs2600->regmap, CS2600_DEVICE_ID1, &dev_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't read device ID\n");
+
+	if (dev_id != CS2600_DEVICE_ID_VALUE)
+		return dev_err_probe(dev, -ENODEV, "Invalid device id %#x\n",
+				     dev_id);
+
+	ret = regmap_read(cs2600->regmap, CS2600_DEVICE_ID2, &rev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't read device revision\n");
+
+	dev_dbg(dev, "ID %x Rev %X", dev_id, rev);
+
+	return 0;
+}
+
+static int cs2600_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct cs2600 *cs2600;
+	int ret;
+
+	cs2600 = devm_kzalloc(dev, sizeof(*cs2600), GFP_KERNEL);
+	if (!cs2600)
+		return -ENOMEM;
+
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Error with vdd supply\n");
+
+	cs2600->dev = dev;
+	i2c_set_clientdata(client, cs2600);
+
+	cs2600->regmap = devm_regmap_init_i2c(client, &cs2600_regmap_config);
+	if (IS_ERR(cs2600->regmap))
+		return dev_err_probe(dev, PTR_ERR(cs2600->regmap),
+				     "Regmap not created\n");
+
+	/* Required to wait at least 20ms after vdd is enabled */
+	usleep_range(20000, 21000);
+	ret = cs2600_check_device_id(cs2600);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(cs2600->regmap, CS2600_SW_RESET, CS2600_SW_RST_VAL);
+	if (ret)
+		return ret;
+
+	/* Required to wait at least 5ms after software reset */
+	usleep_range(5000, 6000);
+	ret = cs2600_clk_get(cs2600);
+	if (ret)
+		return dev_err_probe(dev, ret, "Invalid parent clocks\n");
+
+	/* Set outputs to HiZ */
+	ret = regmap_set_bits(cs2600->regmap, CS2600_PLL_CFG1,
+			      CS2600_CLK_OUT_DIS | CS2600_AUX1_OUT_DIS);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(cs2600->regmap, CS2600_OUTPUT_CFG1,
+			      CS2600_BCLK_OUT_DIS | CS2600_FSYNC_OUT_DIS);
+	if (ret)
+		return ret;
+
+	ret = cs2600_parse_properties(cs2600);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot parse dt params\n");
+
+	ret = cs2600_ref_clk_set_divider(cs2600, cs2600->refclk_rate);
+	if (ret) {
+		return dev_err_probe(dev, ret, "Invalid ref_clk %lu Hz\n",
+				     cs2600->refclk_rate);
+	}
+
+	ret = cs2600_clk_register(cs2600);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register clocks\n");
+
+	return 0;
+}
+
+static const struct of_device_id cs2600_of_match[] = {
+	{ .compatible = "cirrus,cs2600", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs2600_of_match);
+
+static const struct i2c_device_id cs2600_id[] = {
+	{ .name = "cs2600", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cs2600_id);
+
+static struct i2c_driver cs2600_driver = {
+	.driver = {
+		.name = "cs2600",
+		.of_match_table = cs2600_of_match,
+	},
+	.probe		= cs2600_i2c_probe,
+	.id_table	= cs2600_id,
+};
+
+module_i2c_driver(cs2600_driver);
+
+MODULE_DESCRIPTION("CS2600 clock driver");
+MODULE_AUTHOR("Paul Handrigan <paulha@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/cirrus/clk-cs2600.h b/drivers/clk/cirrus/clk-cs2600.h
new file mode 100644
index 000000000000..53570e065620
--- /dev/null
+++ b/drivers/clk/cirrus/clk-cs2600.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * CS2600 clock driver
+ *
+ * Copyright (C) 2023-2026 Cirrus Logic, Inc. and
+ *			   Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef _CS2600_H
+#define _CS2600_H
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+
+/* Registers */
+
+#define CS2600_PLL_CFG1			0x0002
+#define CS2600_PLL_CFG2			0x0004
+
+#define CS2600_RATIO1_1			0x0006
+#define CS2600_RATIO1_2			0x0008
+#define CS2600_RATIO2_1			0x000A
+#define CS2600_RATIO2_2			0x000C
+
+#define CS2600_PLL_CFG3			0x0016
+#define CS2600_SW_RESET			0x0058
+#define CS2600_OUTPUT_CFG1		0x0100
+#define CS2600_OUTPUT_CFG2		0x0102
+#define CS2600_PHASE_ALIGNMENT_CFG1	0x0108
+
+#define CS2600_DEVICE_ID1		0x0110
+#define CS2600_DEVICE_ID2		0x0112
+
+#define CS2600_UNLOCK_INDICATORS	0x0114
+#define CS2600_ERROR_STS		0x0116
+
+#define CS2600_MAX_REGISTER		CS2600_ERROR_STS
+
+/* Register Fields */
+
+/* PLL_CFG1 */
+#define CS2600_S_RATIO_SEL_MASK		GENMASK(12, 11)
+#define CS2600_PLL_EN1			BIT(8)
+#define CS2600_AUX1_OUT_DIS		BIT(1)
+#define CS2600_CLK_OUT_DIS		BIT(0)
+
+/* PLL_CFG2 */
+#define CS2600_FREEZE_EN		BIT(11)
+#define CS2600_PLL_EN2			BIT(8)
+#define CS2600_M_RATIO_SEL_MASK		GENMASK(2, 1)
+#define CS2600_PLL_MODE_SEL		BIT(0)
+
+/* PLL_CFG3 */
+#define CS2600_OUT_GATE			BIT(12)
+#define CS2600_RATIO_CFG		BIT(11)
+#define CS2600_REF_CLK_IN_DIV_MASK	GENMASK(4, 3)
+#define CS2600_SYSCLK_SRC_MASK		GENMASK(2, 1)
+
+#define CS2600_SYSCLK_SRC_REFCLK	1
+#define CS2600_SYSCLK_SRC_OSC		2
+
+/* SW_RESET */
+#define CS2600_SW_RST_VAL		0x5A
+
+/* OUTPUT_CFG1 */
+#define	CS2600_BCLK_INV			BIT(7)
+#define	CS2600_BCLK_OUT_DIS		BIT(6)
+#define CS2600_FSYNC_DUTY_CYCLE_MASK	GENMASK(4, 2)
+#define	CS2600_FSYNC_INV		BIT(1)
+#define	CS2600_FSYNC_OUT_DIS		BIT(0)
+#define CS2600_BCLK_DIV_MASK		GENMASK(15, 12)
+#define CS2600_FSYNC_DIV_MASK		GENMASK(11, 8)
+
+/* PHASE_ALIGNMENT_CFG1 */
+#define CS2600_PHASE_ALIGN_EN		BIT(15)
+#define CS2600_PHASE_ALIGN_STB_EN	BIT(7)
+
+/* OUTPUT_CFG2 */
+#define CS2600_AUX1OUT_SEL		GENMASK(12, 10)
+#define CS2600_AUX2OUT_SEL		GENMASK(9, 8)
+
+/* UNLOCK_INDICATORS */
+#define CS2600_P_UNLOCK_STICKY		BIT(3)
+#define CS2600_P_UNLOCK			BIT(2)
+#define CS2600_F_UNLOCK_STICKY		BIT(1)
+#define CS2600_F_UNLOCK			BIT(0)
+
+/* ERROR_STS */
+#define CS2600_ERR_DEV_DEFECT		BIT(7)
+#define CS2600_ERR_OTP_CORRUPT		BIT(6)
+#define CS2600_ERR_REG_CFG		BIT(5)
+#define CS2600_ERR_PLL_DISABLED		BIT(4)
+#define CS2600_ERR_HW_CFG		BIT(3)
+#define CS2600_ERR_REFCLK_MISSING	BIT(2)
+#define CS2600_ERR_CLKIN_UNSTABLE	BIT(1)
+#define CS2600_ERR_CLKIN_MISSING	BIT(0)
+
+#define CS2600_LOCK_ATTEMPTS_MAX	100
+#define CS2600_CLEAR_INDICATORS		0xA
+
+#define CS2600_REFCLK_INPUT		0
+#define CS2600_CLK_IN_INPUT		1
+
+#define CS2600_12_20_SHIFT		20
+#define CS2600_20_12_SHIFT		12
+#define CS2600_12_20_PPM		1
+#define CS2600_20_12_PPM		224
+#define CS2600_12_20_RATIO_MAX		0xffffffffUL
+#define CS2600_20_12_RATIO_MAX		0xffffffffUL
+
+#define CS2600_CLK_OUT_MIN		6000000
+#define CS2600_CLK_OUT_MAX		75000000
+#define CS2600_BCLK_OUT_MIN		(CS2600_CLK_OUT_MIN / 48)
+#define CS2600_BCLK_OUT_MAX		CS2600_CLK_OUT_MAX
+#define CS2600_FSYNC_OUT_MIN		(CS2600_CLK_OUT_MIN / 1536)
+#define CS2600_FSYNC_OUT_MAX		(CS2600_CLK_OUT_MAX / 16)
+
+#define CS2600_FSYNC_MIN_CYCLES		1
+#define CS2600_FSYNC_MAX_CYCLES		32
+
+#define CS2600_AUX1_OUT_REF_CLK_IN_VAL	 0x0
+#define CS2600_AUX1_OUT_CLK_IN_VAL	 0x1
+#define CS2600_AUX1_OUT_FREQ_UNLOCK_VAL  0x3
+#define CS2600_AUX1_OUT_PHASE_UNLOCK_VAL 0x4
+#define CS2600_AUX1_OUT_NO_CLKIN_VAL	 0x7
+
+#define CS2600_OUT_CLK_MAX		4
+#define CS2600_INTERNAL_OSC_RATE	12000000
+
+#define CS2600_DEVICE_ID_VALUE		0x2600
+
+struct cs2600;
+
+struct cs2600_clk_hw {
+	struct clk_hw hw;
+	struct clk_init_data init;
+	struct cs2600 *priv;
+};
+
+enum cs2600_mode {
+	CS2600_MANUAL_MODE = 0,
+	CS2600_SMART_MODE = 1,
+	CS2600_SMART_CLKIN_ONLY_MODE = 2,
+};
+
+/* CS2600 private data */
+struct cs2600 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct cs2600_clk_hw hw[CS2600_OUT_CLK_MAX];
+
+	struct clk *clk_in;
+	struct clk *ref_clk;
+
+	enum cs2600_mode mode;
+	unsigned long refclk_rate;
+	unsigned long pll_target_rate;
+	unsigned long pll_parent_rate;
+};
+
+#endif
-- 
2.47.3

