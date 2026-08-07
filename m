Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29C3161BA;
	Fri,  7 Aug 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118077; cv=fail; b=bY8O4Rc7C4uVgi41V/oVdRPGSe/QaQhn7HZPIX1gRJqfQP3hK/Xm7vg5bv2l5dq91zdENb6WNwybJDMkq3VnNn8zXY4QBEh/5LWCCkUNsyhhVCaeFmBOEIuo0d2QO/Y0XMz7ym7SxriLwYyLCe1hDqUnVYcXQOgG7S7EU7nAezg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118077; c=relaxed/simple;
	bh=WBnwrlmneAldmv1lj7MvjDLW9VTM/dTMjRm5/7DB6WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KO+UbmrtjtsYJaeoAjpQwC+OaXJoj6L7d+M25ustrUwMEle8pjkVWqbFWVRFDg4ZdPEdl3fHozWmhkoCeYBpFrFg4rWgJxofdPK0rlQ/5sjvNvcpuFcZyvj5eMozDMbVwBBPQd20D9FjJULH3sQE+vMEriu1Kdq72uG4qJ7Q9y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=N7j5WdyM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hCkm+sSB; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="N7j5WdyM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hCkm+sSB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FKQk8781650;
	Fri, 7 Aug 2026 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=GcarX10Zjhz4Yx97
	xDk3CDvXVmenT15uFVuHME6BSlc=; b=N7j5WdyM+5Ojd2ZpHWoZPTts3AZSTlgB
	dxKWppCaPcBvUcL0ZkU08RKsakF86YVyqVer2I/ajvby16RSFdwrSUCQ8K7e7DXZ
	SnItDl0snJ4Q2DdVXEqUIS2AnJE5XCmQzVlW06T6TRN4cMc/W13RyZ+BSACDrn7j
	5AwKe148ybqGMkalpWo7NIhCLoa9l2w2Q6NJecXBlwQ9sw/zCkh2uT0HDRD7+D+v
	bRd4U8EYH8KaMG5uUJmeUQJHsZA7mvgZ1c0DXKZH+evaGIfqBCoyMydO3rZJd7v3
	EJgQCk0A0nZaKGu0UYyrfFfKenN2Pcdz8lhLziBntKeAt3P80I5zUg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020093.outbound.protection.outlook.com [52.101.201.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69vcc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 10:54:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT6Z6OMLP/o1/6AUuviBIwU6YUMHlWREM5lcc/2r0uKHv91qkwzM/bNjU0lt+x7sl1SpabDvhCC6IAQ4jWWjuf5SO/55dW3bVjCTzbOnJS0/89zNMX6uvdA0IGY65nxQmXXSjqyZmZezbotsJ1e+aBBnQSo+T5sHS63c07G2Q2092qKq8nKrK9LlmpmOs+v5weVxzobeP0L8Ed0PlaDC5GSy8VswtMMznHqhL2ZNUDS0OaXnP8mz4uooWC4a3V6sAlytI9dVtxkBcB20jwf41pA4Ii2kLKOkaPVXLVFAuW0C+QiS2sePJIbS9INjtT1ok0YCSnR5q6bYkJsaz+33UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcarX10Zjhz4Yx97xDk3CDvXVmenT15uFVuHME6BSlc=;
 b=Hm2meBEf+hpAV+LJP6zErWJxQVT8kgRbwnt5o6DqofycVIQ7a2Ke5jOkPhq+Yp7WyVBk5DLXORrgKWcV/Ardt9bLY9owaTXilxTMEXYn6bAs9UINAEHD5HsbE8+tLvLq2DF5EvcY/eOkNHg+IqrtdAZq/0Fu5zWLeCQsCRq1rD6tcFViRzc5FkT0ieQKu6qH9rFR9W0LJLBO9XC/IQmx0KOFfUGDx97MV6lthdM/LtAAVHa4kcRK3dd+QYaqG1gddvAYu+3lnyg+q9QNscF6irre2MjqP1hrThC2cViIpvDFa7nw3AikxKkvuqqFzsI5NLQMM4LfMZY+z0cpCyoTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcarX10Zjhz4Yx97xDk3CDvXVmenT15uFVuHME6BSlc=;
 b=hCkm+sSBJ6rH7wrygu/RWCwDx7ZMhjdyj9G1OihMGIVVt5aLa1uenpASyimnwOjvltmjehhGsv/s3a/krmPCcpzX7fSecvft3u0tjnHSpi4EI3C3GTc9+153iBJAEGcGoa9U5OlFYy6NNdniW45P9zWwJT/qS3a7lhiw7Z+PmfU=
Received: from DS7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::12) by
 EAYPR19MB997292.namprd19.prod.outlook.com (2603:10b6:303:2be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 15:54:08 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:1ca:cafe::51) by DS7P220CA0002.outlook.office365.com
 (2603:10b6:8:1ca::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 15:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.0
 via Frontend Transport; Fri, 7 Aug 2026 15:54:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 723B840654B;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5839B82254E;
	Fri,  7 Aug 2026 15:54:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v7 0/3] Cirrus Logic CS2600 clock device
Date: Fri,  7 Aug 2026 16:54:03 +0100
Message-ID: <20260807155406.752721-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|EAYPR19MB997292:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2a8e7106-4169-4290-3a32-08def49c1d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|6133799003|56012099006|10067099003|16102099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	19lge4scfGrmgrJkHbHFlOOUjS4KUKxFwU9ZlTZxrSxzYmdnnsF2gAIuwAJy31MWDMsLGp5loPb6iUIBLKQk9fN6yG1HlEID6OYe8Ea+EP64/mvAyGCrN5BFpNPOWgcIOpNgLCtTk4dbhVIU1oidTgA5Z5P9RlyL4L5tJzLBlra2vdKoV3A0YIZKn0FR0ZyWwjER8jKQj0vRYaEpkyMqTiB6ZDzchH5y4JkKyIAdYuG/etFtUfwKU5ZNAZtsVfCNVqTntBJ7MLrkf2pG4SUWJ3rDlyngyqaGQ37zu7/3n9kBVl42iI0Zi5hMon9LoxUIOdGmixfLAgOgrVoiX6VP/3Ge5znQaj7Zn5Rsm8zrD9zjXbrBW4qNhdJSMdMXQ4VHMlRP+UIg6GCbQiTfeyLJsv9U4lPDbdOBxp6HvmkrjqFfD8F4IG6Kmtf3PTsS8z32SAeZ2WSB6jT7wWd/jilHgRPV2J6LzULqVr7OhaCpjH9xt95m8zTbc3ImGa5HX95pBms0QZwFynKLG8lNSgSQeb6ZaBd0dwD6vcHtoGaFd39ZB87EouHjLCnk5s64hUcU7D1hYGa0a54HmAfJM3L4a/d0ygLei69JcLjC4hSySQ7SFcZt+C2txHFEFCQE39m8VyzkfWt3rUzPXoQGxTsC9Z8MWlNg2wYIgd8c5ZQPtCQdvmr5i0vIk1hPvSR424wyVmHukFyZybGCvAZOJn0hsg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(6133799003)(56012099006)(10067099003)(16102099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OPvo52zPfO2ZzOpBFEEnYfJhCU1xL3eh19GDUqOA/gpmkB9EKaPhJBiWk0WZUQyBGWB2HXMM82OJF+7mo6rdUvdvsrLjVqAPXcV4f+1YGJPU+z+Km5n/YQs3Yj8MODnm6N+pa5/FfdCZt+jH77th7naDqSBQ7bvyMPkO93f0ZzSP/Bz2q63P734rMxjYGTvAOa/WysAqXNWh15+0Dd8RGYlj4opG4lHLwG58jkxwR8xpeibihhYpRRfMAMip2JCDXLJKkNO1u/wXGVE4ReFvZ3wazeB3wiumkjUqiooTRB3UjELPvpbtuwS4oZ8R+HfsAmc6fnMlkHwOWd0cL8LPenYGcy9k8hwwxR4CLgJwUvIUp6Fa0ntHdD7Q+NPe1E/7xYbLvrHI92wNmQCRAaq95jWfvfbCi0nZwj7w8V3A61GH5MurwRxqcj92H26az7cj
X-Exchange-RoutingPolicyChecked:
	H0m8quq2GpWxULZ6UCA55XYV0MpLXIMS7HnOD+a/L/7mjLv/Tofd3E3VyZ/LmeV0VhbruHM5TNgkCyU4AEnZcoEapGvoD3l821JsXuLYxKbmpU98YHD0QQJYmnzzI50BGW+6NcC+TpJfsaJ091h2aCp/4YjdqKRuLt65OlIwb2OwWccH+o87H/LFKmC3WlM2kHjyh1nYq8flbTFZ5DzeLo6wultGjyEv/tyaiZCkYZdXROkEZk1ZcEXzocJ6sxMSTUctD9aPsOwRzMD01Yjau8mfjJzE7t9OkqQsDUPQsHalu7Cp8KK9/bHh0l6HR013jCfJplkbeVNo+l4SKomNzA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:54:07.3777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8e7106-4169-4290-3a32-08def49c1d42
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB997292
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfXzn5QJK2qoLX9
 wGsTVeqTK2z60FmSoQoGiPgYMlE8Fb+8xWgkPoIC21gUt745meIHpG2YNsInyckCtmnjgMEUmXj
 RsaZDvYAbb3qJB9IQ2jOUJQ/Qv5VeVo=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75ffaa cx=c_pps
 a=bYRzraljH1LAKK9Y2O2T7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Zxh60nquOuz1sq3bpggA:9
X-Proofpoint-GUID: NX_fDF3cMKuiemFSQ63c6xswOWqN5eSX
X-Proofpoint-ORIG-GUID: NX_fDF3cMKuiemFSQ63c6xswOWqN5eSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNCBTYWx0ZWRfX5DcQ789iv89f
 G9oW6GVT0MYQBfR5jIJizpxYI2HZm5MLbHWeaN69W6Qixk12TMfpD8vTXTnn59kuYWvmlEgauWO
 4ELMutmp99/KjK8PU0jgvbngda+/3LaF7veay+y2txqcLlVW/YizpwKUVCq2TQl8xifMewQ7nm4
 OvCPf2ceozvstKh4j+hng3oN2ToXG9Hufs7fv4qyguLwGrm3ZD1vaEpCsVMX5xfuClfWlAnjM6q
 h9Xf47BrcntDvaAIaSTi/hF/VzNuCmlu7Mwsb8B6W9soMwxvPsZ8bQUSPSAau6/LxF8BuYKU+nR
 xKYxyM6/veNWbyMqSeVjX5TPnaGJfYaBJSUbIqpKs9Ecj8zWHAFiryS6L414OFBvx8x1ETzCyQI
 K3lt5T6B1tEkqwboNohS4WMas1EFuXi5dICKtF2zXQe7FK9qbyAnFJyUg+J7QLn/tD+ZZjzIlbh
 CO+tDBnKSh8SwFWUlSQ==
X-Proofpoint-Spam-Reason: safe

This patch set provides Common Clock Framework support for the
Cirrus Logic CS2600 Fractional-N Clock Synthesizer and Multiplier.

KUnit testing is included in the series.

Major changes:

v7 changes:
- Fix issues reported by Sashiko.
- Remove most examples from DT binding.

v6 changes:
- Convert DT smart mode selection from an enum property to two booleans.
- Fix DT clock names to match the datasheet names.
- Add DT property to explicitly flag that the internal oscillator should
  be used instead of inferring it from having a variable definition of
  clock-names.
- Add DT support for setting BCLK invert, FSYNC invert, and FSYNC duty
  cycles.
- More DT examples
- Merged and factored-out duplicated code in the driver.
- Fixed rounding errors that caused the calculated frequency to drift when
  it was passed into clock core and then passed back to the driver.
- Fixed driver bugs where the functions for one clock relied on the
  register values of other clocks being set already, which is not
  guaranteed.
- Fix a bug where the (mandatory) REF_CLK_IN wasn't requested and enabled
  when using CLK_IN as the frequency reference in manual mode.
- Lots of code cleanup in the driver
- Fix driver bugs.
- Added KUnit test.

v5 changes:
- Change dt-binding to dt-bindings in commit message
- Add minItems to clocks
- Remove unneeded comments for the cirrus,aux-output-source enums

v4 changes:
- Change DT discription to add more detial.
- Move reg property to keep consistent with the required list.
- Add enum to string DT inputs and change the input values to lower case.
- Change unevauatedProperties to additionalProperties
- Reove black line.

v3 changes:
- Changed clock-names in device tree to an emum since the both clocks
  are not always required.
- Changed cirrus,aux-output-source to a string input.
- Added cirrus,clock-mode as a string input.
- Fixed ordering in DT example.
- Removed dt-bindings .h file.
- Add in_range to allow for acceptable ranges for clock rates.

v2 changes:
- Remove | from after "discription" in DT binding.
- Remove discription from "clocks" in DT binding.
- Change ref_clk to xti
- Clarify auxiliary clock pin
- Change DT example to not have "reg" for the bus
- Change DT example to change i2c@0 to i2c
- Remove "OUTPUT" from the clock ouputs in the dt binding include file.
- Remove AUX_OUT defines
- Use do_div when dividing u64 by a u32
- Include the dt bindings include file
- Use the includes from the dt bindings include file aux output.
- Move of_device_id and i2c_device_id tables next to i2c_driver struct.

Paul Handrigan (2):
  dt-bindings: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

Richard Fitzgerald (1):
  clk: cs2600: Add KUnit test for CS2600 driver

 .../bindings/clock/cirrus,cs2600.yaml         |  170 ++
 MAINTAINERS                                   |    8 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cirrus/Kconfig                    |   24 +
 drivers/clk/cirrus/Makefile                   |   27 +
 drivers/clk/cirrus/clk-cs2600-kunit.c         | 2526 +++++++++++++++++
 drivers/clk/cirrus/clk-cs2600-kunit.h         |   18 +
 drivers/clk/cirrus/clk-cs2600.c               | 1229 ++++++++
 drivers/clk/cirrus/clk-cs2600.h               |  163 ++
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
 .../dt-bindings/clock/cirrus,cs2600-clock.h   |   18 +
 32 files changed, 4583 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/cirrus/Kconfig
 create mode 100644 drivers/clk/cirrus/Makefile
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.h
 create mode 100644 drivers/clk/cirrus/clk-cs2600.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600.h
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
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600-clock.h

-- 
2.47.3

