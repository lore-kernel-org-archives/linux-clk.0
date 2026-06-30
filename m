Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6752B3F39F6;
	Tue, 30 Jun 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834966; cv=fail; b=YGTw1uKHnKg4zTXjIUpibOkM3WrEZBlxrOrL0jVI5LTylpmtHeU85tX/fTZ7Iy7B7X9k3a2Vh9eT6H0YGCjEqu8Tf/Dk5+XQWE9Gq9KHe06jGynUrp2SJ5W7CxqvBCsCPV78s5hJY5flvZxGRiLnNe6WHPhLgy3/etAiNXn2cY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834966; c=relaxed/simple;
	bh=K2Eqg8452ICyfkDmRLmmMBULVcW/EFFoL43kvCm/c20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNxTqvqQFMqHSfUeo48Vn962X7rdYDzttmzRNDzzP8iFMjKZa87ujG2vdoYU0wzr26oPgKD8VannJpxTypbmC9ZZ5Y7ucrl1a0m4V9v83Jw7Vv9SeYeRz+NhN03ME+7yUGINotJOoPEJuTYqL0cH05A6Jdjk70M8sZbiBHpJpYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Yb/TITqq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cD1Kaxc8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Yb/TITqq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cD1Kaxc8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UFZYnL050732;
	Tue, 30 Jun 2026 10:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=scCccj3G0Eq9zmK+5Z0jgtdUupG7a+2JgW8OMuJmXX0=; b=
	Yb/TITqqNJKuV2GmBEIP4hpr1h9MaU44TkyjrBqwB8ai/GxQmyDUAt0VBM4A6O3Z
	oFcImFh7tJuQOx2ECwbWfYuWIf/vtq2maDDWKcqx715ZKOojzNgHkZdqFZhapwPm
	bWiPGAUfcBCveYyMI+Rw0FFTKlB6aRSIxYMLfBU94aGQ1Qv/jqWxkUZAf7NiyR2t
	R5RqU4SbnivefIhnPVzG7z02lX04K/UKWNDnNH57GdiVO012b+mkXuRAxJXboxqF
	eiavAAMKbcoZIoINz1vXxooPaW/2X7TgdAgV8+Wo0AseFNLJnZ2gg7q6+kUHvnzl
	MEml5ixsT/f1DAi2p813zw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022093.outbound.protection.outlook.com [40.93.195.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e5r0ccx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 10:55:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NI4txzGR8Ufm/EF0RTwNeQicCWKPIxt3Z9ytUSAWsyJ9DOz2u6CivXeUg6j1s3mKqBFKTB5Wg544l/VgjX70NOAScbQspYn36gtxplRqXzvXvxIOE4tEQnIgEI0rSW/LFu+Fak5M7JhKHHImwqYPCRNIcHr9cxxCKCfSY//plUrdyO/gLdTVIg99/VY0LG83LUNrtsRA3MVm0bjT8l81WvraSmPKSPo2di3GexV3KOBrbwBWMXJJgEiWgXiGMT0zhddrB4amDOMyso+CMWTY6Qw/NKo8rUWNSL7hf/vpu7WmDzsCKvo1O7z2Qra+oSjANMACJrREMJX4x3Bh7C6l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scCccj3G0Eq9zmK+5Z0jgtdUupG7a+2JgW8OMuJmXX0=;
 b=EzbpeIER0ussEgwhwsBn/FmvsZZWwf3CyShTDOQ5QpdoCdkbkF0H+PQu9oNXDlIUAZ9qtLHjFIWD9vaUw+Oco38zbtQ3UOhz1XychxKJtcZeucnzv8+gA+wsAepRvrShSF+nWi1cmNYaye7ij8hKDmJklzb++/NAI+LiJK0LN9fdD8RXi/8ZQBsdaEFKPapgNo5ETMIINn50qrxQRYc+4oLIRsQ4CeCBU3ti967IAcLA3FsUTSNsjGtCntPG+v8pDYVQ+X3DoQfMv/xuXeKL54TVZChEtmQJEWLyxBeM6LhA8Jd1N4w2F4qOv/XiyoT1G8UW4aHYzJKjuhjQVbs2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scCccj3G0Eq9zmK+5Z0jgtdUupG7a+2JgW8OMuJmXX0=;
 b=cD1Kaxc8BNOkmHdMlf8IlKBNkO55VRubY85jkHhlHIxEG5huJuIwN8fs6sALV6oZtKPgn4k3ye5QjFf7oyKHzZdZxIA0mnBXBx6WoedtXB2uL80T1G0/o9fY11HwNDaLlewcJs2Dai6Z9hULaDAC24VC4PTSYpb6GXy4xT5JrX8=
Received: from BL1PR13CA0342.namprd13.prod.outlook.com (2603:10b6:208:2c6::17)
 by DM6PR19MB4026.namprd19.prod.outlook.com (2603:10b6:5:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 15:55:51 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::30) by BL1PR13CA0342.outlook.office365.com
 (2603:10b6:208:2c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:55:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 15:55:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EB47406542;
	Tue, 30 Jun 2026 15:55:49 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5F20482026C;
	Tue, 30 Jun 2026 15:55:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 1/3] dt-bindings: clock: cs2600: Add support for the CS2600
Date: Tue, 30 Jun 2026 16:55:47 +0100
Message-ID: <20260630155549.824059-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630155549.824059-1-rf@opensource.cirrus.com>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DM6PR19MB4026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ac01502-9cd9-4d77-f3ec-08ded6c00ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|3023799007|22082099003|16102099003|5023799004|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	imMIH7/dR82ifyn/kDGgaf+QzgNFyPnvLOYO83MGr5r2k3dT7UCdrwvn/k5XzAUo5Fi24OreDj8lx5fYWTf5eMDn+J0WGfRjiov/jXsr5LcYdxahCgJC+QOi5jaMJjOhq7LlXAHjkY77K/VtUSLD6FtDrLWxhLs+O0DzjqMXP0c4t6I8X3jsDNakr0X8h1G/3h+MnbJvr+BMusvt7bkdOZo2dj5ZYiwck4W9UTq//6FBrUX9yNM06jlvwIOc+dVCvC4h1p7R5nIMcskAwX6UQJH5f1gbhPQxECS53LTB63XFl3CyJBYq6nq4cN7RUKu/2pQQ3OW1zUi3eWyM9Ni4xUKQJh7b/7xm3bAt/kYe6ByyqZTpzkcFakV16oaYTtnmRFAeuhjfRpom6lg0LC5GLzSkmQd+fp7cRC8CQ0s8kgD/HiCnmAq60caqRru2W9GRcBROVxuOxZoWXmOLkvV7CgGhmqbxpsGdP32Cd1A60OiE5eWULMq8PUq+WinlTu5r9dXEzCR0akL8jTaByx3MFUBv/nCg5CmddhIslOolotJx1BDqrACQqctn3wf42SlJ0Lx/IbXceXfUEIPiQjzsgQISF5hmeXflp0wClYw8NwZVGsZ2Awdr9pOWEJX+rVDScx1gRUfiG7Q4rwy4kYdMfg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(3023799007)(22082099003)(16102099003)(5023799004)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JWIMSzl9N/7TNaMRxmVh6bVyTz5IHp+3/hb5L7kWXyY5f+8OWG9bwEiS4pZ/lEi3nA3mCLVfLnGDe58yz/fG6wH4AU85fyG/nZTs24F3Q9bksGInMc+YObtKEfNBiVfvmmn6g7Ur0kWs1peJDG34KeV0SNguL39jQXFyg929LiDXjzPIu3rg3b4nxDKbDodG7xPFn5Bp8lqrA7x91BFqYn7aaP3V50YayGShmrDqIXLvn0+tL+GhYvdoT4cfjYMRKr6vC3cBXjZk+1xk403QnDc2ePTpjTyCRa+WhB/haY2N4P3KyDkrBofBGNik1O0/wHip6jCak8cZ0Lt9+eO5Ef0PmZCWMBbKh0PsvJREoIi3sopt20paJ9x4X61IZt5PuAwbdYBJEK7d4q45xkNRMUvliS1/DJBUzZfxcN/6KASdMEE2/OZY2MBL9JdE56IS
X-Exchange-RoutingPolicyChecked:
	cISO3W1hXI6IqbL/SFWmsxhd6ZXgvu22oB5qg6xjjw6s+iSrI8LF6tpRoSBqFTUAkNBw2VVtfobpBVyfFanubbjimLQJqd99wKz8+Grqy4japdCpQ3JrdkPEwUw+55EU4mnBoTMBMxjGP760VhRzefc19KtM0YmetGjYl0qOXiFXlK/l+R5JFkS85j0HAgQ36NuMfp+1gQDkxnXG+SseMm+SAgApT6ScWkLCykMJixGXIUa7t52cqzu9oUtMQT1ev/2hMofC9o297clulP28ca8ZmYrT6EI3mwGEQbQ7c3CrJlxWbGW/4v+F0ovwhvvAkWWZd9Lq9taq/J3V53hUGQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:55:50.4339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac01502-9cd9-4d77-f3ec-08ded6c00ef7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4026
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0OSBTYWx0ZWRfX3wn961hdSgwn
 g59be2B17UV9LkJPl0ZdWPgLq73N3VJr/pjq9jCx1iMHxgqYW7WMXHihMI4nCfYn8I5MJ434bfw
 mgY9KqH68eHuv6y8NPfxYnfTiSySQSI=
X-Proofpoint-ORIG-GUID: Y4pUmnT39yLWF-9U-d9dol1VCqBeI_qZ
X-Proofpoint-GUID: Y4pUmnT39yLWF-9U-d9dol1VCqBeI_qZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0OSBTYWx0ZWRfX0LJjRdP+77U4
 5EVTJavLaRTci2GAUMT/LIvHJxzeooKR6vNbpUSiFlxkO14Zat4dFuvJcG1qJPCDg8NtolwUrWe
 lzJu69BpKf8Je4KkkO7YaoGNanXdLYeFY8lzalotaKiv7AJ5gBD4y7UIqI1bu971znc7vz98h9o
 YIZIeL2aaVtcvZ5WYkfmBxfeDdBtLO2LFCSgjUTASGrLthKp5fvJ/7Iw3bBKYn9M4esG6JGzCWK
 JTQyiVL35hwb1GOhPDojdkj72lXq5cM7ZR6lTr7UzDVE9iTi/Tt+NCuWuOQY4zmcFmdxMi/MYZx
 pfAaIore1bSsC+KYWtt7d4YFlOgwHVlBcNyz+6g6ZTXgbskbuNPFriNlEEpQg2fdCSyH2JBiZt7
 1ikU9/3LYVU7yQYhYJRiWj0/eRyxgV2dPFim1Hu0A5jSadbKigMgN2Vu8aOMe8rXDjfHyglg2Hm
 dPfWH/oWEIOmDl4A6NA==
X-Authority-Analysis: v=2.4 cv=eLojSnp1 c=1 sm=1 tr=0 ts=6a43e70e cx=c_pps
 a=0DdwKqzxgU9dCJ3Pc4DlvA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=KKAkSRfTAAAA:8 a=Oq1YXhrhtB0JhpzoPREA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Reason: safe

From: Paul Handrigan <paulha@opensource.cirrus.com>

Add device tree schema for the Cirrus Logic CS2600 clock generator.

The majority of the schema is typical clock, power and I2C
properties.

Passes dt_binding_check:
make dt_binding_check DT_SCHEMA_FILES=clock/cirrus,cs2600.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dtb

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---

Changes in V6:
- Fixed clock naming in descriptions to match datasheet.
- Fixed clock-names property values to match datasheet names.

- Added cirrus,internal-oscillator boolean to flag that the internal
  oscillator is the clock source. Previously the driver inferred this
  if clock-names did not contain "ref_clk_in", but this made it difficult
  to enforce dts correctness because there was no way to tell whether
  ref_clk_in was intentionally or accidentally missing.

- Changed the cirrus,clock-mode enum property into two booleans, since
  effectively it was two separate features masquerading as an enum:
  - cirrus,smart-mode present to enable smart mode.
  - cirrus,smart-mode-clkin-only to enable a feature where the output will
    be suppressed until both input clocks are present.

- Changes to cirrus,aux-output-source property:
    - Renamed to cirrus,aux1-output-source because it's for the AUX1 pin.
    - Added more options.
    - Renamed the "no_clkin" option to "clkin_missing".
    - Reformatted the description as a list instead of one long sentence.

- Changed clock-names from an enum to an ordered list of const.
  This implicitly ensures ref_clk_in is always required.

- Added properties to invert bclk and fsync outputs.
- Added property cirrus,fsync-duty-cycles.
- Added #clock-cells and vdd-supply to the list of required properies.
- Rewritten description description section.
- Reordered the property list to put common properties before custom
  cirrus properties.
- Added more examples.
- Added header file to define the clock indexes for DT consumers of the
  CS2600 clocks.

 Note:
 V5 was Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 but I haven't carried this forward because the changes in V6 are large.

Changes in V5:
- Change dt-binding to dt-bindings in commit message
- Add minItems to clocks
- Remove unneeded comments for the cirrus,aux-output-source enums

Changes in V4:
- Change DT description to add more detail.
- Move reg property to keep consistant with the required list.
- Add enum to string DT inputs and change the input values to lower case.
- Change unevaluatedProperties to additionalProperties

Changes in V3:
- Changed clock-names in device tree to an enum since the both clocks
  are not always required.
- Changed cirrus,aux-output-source to a string input.
- Added cirrus,clock-mode as a string input.
- Fixed ordering in DT example.
- Removed dt-bindings .h file.

Changes in V2:
- Remove | from after "description" in DT binding.
- Remove description from "clocks" in DT binding.
- Change ref_clk to xti
- Clarify auxiliary clock pin
- Change DT example to not have "reg" for the bus
- Change DT example to change i2c@0 to i2c
- Remove "OUTPUT" from the clock ouputs in the dt binding include file.

 .../bindings/clock/cirrus,cs2600.yaml         | 262 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 .../dt-bindings/clock/cirrus,cs2600-clock.h   |  18 ++
 3 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600-clock.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
new file mode 100644
index 000000000000..5f7da2ba87a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
@@ -0,0 +1,262 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+  The CS2600 is a system-clocking device that enables frequency synthesis
+  and clock generation from a stable timing reference clock. The device can
+  generate low-jitter clocks from a noisy clock reference at frequencies as
+  low as 50 Hz. The CS2600 has two clock inputs: REF_CLK_IN and CLK_IN.
+  REF_CLK_IN can be either a crystal or an external clock source.
+  REF_CLK_IN is always required to clock the PLL. Either REF_CLK_IN or
+  CLK_IN can be used as the reference frequency from which the output
+  frequency is derived.
+
+  The clock tree of the CS2600 is:
+
+                 +------------+
+  REF_CLK_IN ----| Hybrid PLL | PLL_OUT    +--------+
+                 |   + FLL    |-----+------|  GATE  |--------- CLK_OUT
+      CLK_IN ----|            |     |      +--------+
+                 +------------+     |
+                                    |      +---------+
+                                    +------| DIVIDER |-------- BCLK_OUT
+                                    |      +---------+
+                                    |
+                                    |      +---------+
+                                    +------| DIVIDER |-------- FSYNC_OUT
+                                           +---------+
+
+  Clock output names are defined in <dt-bindings/clock/cirrus,cs2600-clock.h>
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2600
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ref_clk_in
+      - const: clk_in
+
+  vdd-supply:
+    description: Power Supply
+
+  clock-output-names:
+    maxItems: 4
+    description:
+      Names for the output clocks corresponding to PLL_OUT, CLK_OUT,
+      BCLK_OUT and FSYNC_OUT.
+
+  cirrus,aux1-output-source:
+    description: |
+      Selects the signal  routed to the AUX1_OUT pin:
+        - "ref_clk_in"    the clock on REF_CLK_IN
+        - "clk_in"        the clock on CLK_IN
+        - "phase_unlock"  indicate the input and output clocks are not in phase,
+        - "freq_unlock"   indicate the PLL is unlocked,
+        - "clkin_missing" indicate no clock present at clk_in pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - ref_clk_in
+      - clk_in
+      - phase_unlock
+      - freq_unlock
+      - clkin_missing
+    default: ref_clk_in
+
+  cirrus,internal-oscillator:
+    description:
+      Use the internal oscillator as the source of REF_CLK_IN. The clocks
+      and clock-names properties must provide a fixed-rate clock of exactly
+      12000000 Hz as the ref_clk_in clock.
+    type: boolean
+
+  cirrus,smart-mode:
+    description:
+      Use REF_CLK_IN as the frequency reference until CLK_IN is present,
+      with a glitchless switch to CLK_IN as the frequency reference when
+      CLK_IN is present.
+    type: boolean
+
+  cirrus,smart-mode-clkin-only:
+    description:
+      In Smart Mode keep PLL_OUT disabled until there is clock on CLK_IN.
+    type: boolean
+
+  cirrus,bclk-invert:
+    description:
+      Invert the BCLK output.
+    type: boolean
+
+  cirrus,fsync-invert:
+    description:
+      Invert the FSYNC output.
+    type: boolean
+
+  cirrus,fsync-duty-cycles:
+    description:
+      FSYNC output duty. The number of BCLK cycles that FSYNC is asserted.
+      If not present the duty is 50%.
+      This is determined by the type of audio port that is being clocked.
+      For example TDM formats typically define FSYNC is a pulse of 1 BCLK
+      at the start of a frame.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2, 4, 8, 16, 32 ]
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+  - vdd-supply
+
+allOf:
+  - if:
+      required:
+        - cirrus,smart-mode-clkin-only
+    then:
+      required:
+        - cirrus,smart-mode
+
+  # Require clk_in for smart mode
+  - if:
+      required:
+        - cirrus,smart-mode
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Smart mode */
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,smart-mode;
+      };
+    };
+
+  - |
+    /* Smart mode with PLL_OUT suppressed until CLK_IN is available */
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&xtl_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,smart-mode;
+        cirrus,smart-mode-clkin-only;
+      };
+    };
+
+  - |
+    /* Manual mode using only internal oscillator */
+    intosc_clk: intosc-clk {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <12000000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&intosc_clk>;
+        clock-names = "ref_clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,internal-oscillator;
+      };
+    };
+
+  - |
+    /* Manual mode using internal oscillator and external clk_in */
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&intosc_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,internal-oscillator;
+      };
+    };
+
+  - |
+    /* Invert FSYNC output clock */
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&intosc_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,fsync-invert;
+      };
+    };
+
+  - |
+    /* Change FSYNC duty */
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@2c {
+        compatible = "cirrus,cs2600";
+        reg = <0x2c>;
+        #clock-cells = <1>;
+        clocks = <&intosc_clk>, <&sync_clock>;
+        clock-names = "ref_clk_in", "clk_in";
+        vdd-supply = <&vreg>;
+        cirrus,fsync-duty-cycles = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..fc91c4389237 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6213,6 +6213,13 @@ F:	sound/hda/codecs/side-codecs/cs*
 F:	sound/hda/codecs/side-codecs/hda_component*
 F:	sound/soc/codecs/cs*
 
+CIRRUS LOGIC CLOCK DRIVERS
+M:	patches@opensource.cirrus.com
+L:	patches@opensource.cirrus.com
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/cirrus,cs2600*
+F:	include/dt-bindings/clock/cirrus,cs2600*
+
 CIRRUS LOGIC HAPTIC DRIVERS
 M:	James Ogletree <jogletre@opensource.cirrus.com>
 M:	Fred Treven <fred.treven@cirrus.com>
diff --git a/include/dt-bindings/clock/cirrus,cs2600-clock.h b/include/dt-bindings/clock/cirrus,cs2600-clock.h
new file mode 100644
index 000000000000..bde505e17813
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,cs2600-clock.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause*/
+/*
+ * CS2600 clock driver
+ *
+ * Copyright (C) 2023-2025 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_CS2600_H
+#define __DT_BINDINGS_CLOCK_CS2600_H
+
+/* Clock output indexes */
+#define CS2600_PLL_OUT			0
+#define CS2600_CLK_OUT			1
+#define CS2600_BCLK_OUT			2
+#define CS2600_FSYNC_OUT		3
+
+#endif /* __DT_BINDINGS_CLOCK_CS2600_H */
-- 
2.47.3

