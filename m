Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9048595F;
	Mon, 21 Sep 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998327; cv=fail; b=gxyd4ygEwOtTjliJFg1L1QBLHtm1Fq6pV3d8VF9ux7eXbxLr7LSwJ9uchm79W6B8lXBJzOiQWS6MEe4xhohn4DhT6NUtRinDX/QUkRbfxR5QwTgtKOyTc30MJZJiHb4Kq6RWoay44SXEQzHYnOUa3T9l1eDf8psS6jrGYzo7TJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998327; c=relaxed/simple;
	bh=17gi/QdmBQPK5Sng65g+nVCg6AGyKsmEZCPh2n8KSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgIpzLoKOmjoBb4QhQoDLkTP4MEAJ9iGLW7FpRZeDDn7KabDaZ21JXoB+J4X7QkSWN8I7WIqAwG60EV3KG4WeY5fLdlvwgybcsWN2RfvjdyNFmT105ii/3YeHkxK8GUqSwjdjQMVS2G7g+O6W4jI2o7jdmgMfWlVhI16xb2j/S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gixeAlrD; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gixeAlrD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWghDVgV0de4UKS2A0eb4c5Qyij5zoNq/6FooynC0ydIZgNDFIiQjhzhfPXWkkcxw+oEc7VX1iZaveP8whfvIC2mSZhisLoGvSYyez9DFgaMD13wONf2vp4q/AM4nFrdWeWKohvywgWzKandv/J/5mVu1zgRSSYP/R7Zf5k8a/IUcPi1BZmik2EdMl4lQ1ZJpwHTt2hy5Nzif8YHmx46i0ONXfwosjNUpa2vacKaDDv0FyUgrDd1RX9NLgTim7Mcg/1QugPUynwM9FlJfWYPOBoPW/PC76uBy3sLo82DhyNwsZOO8WnkNHFbIZz9NKlqPmfuG+IZ3Kw40OF//YokNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMB9yZq3wroIYIRkZle2kJkQdB8w8HRH9XPo2tV5AbA=;
 b=Po5aUaStn3dc25mpS75NpN0/q5S3dmEpaTV3c8ouO+t0POSP7u0Wla+HUqwQr3N7Y7rDDGwUk4FMEPEnycNL1/zmiZ+SODzwLmUw6guEhY8KHyGmbAWav1VTyWYitW73gXK90WBbSbxb4u63kXFtU9pgYmKHR7H/7lf1sbtle2nBEkjg7BxSx84Dtb7WIbsoW6H0mwDEoATW5AK5op8u71sCNJnY6nzVcyr6rVgwtOsyoJNg7SkVohQnlWNNzuGKbyTW+4rpHtTdBVHtve/OqGPN/oPFR0yoHOX1KVOQRN9WuJrX0yGNpD9tmCVchJuCKoFbkR2sQbq+rjtHx6ocIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMB9yZq3wroIYIRkZle2kJkQdB8w8HRH9XPo2tV5AbA=;
 b=gixeAlrDxd+e6O/gNyhz/RX+4SoAzgEj5BHjoPRPa/vozbWuBkfmQkaAWwYRiTTshzQl/u/iYoBKe0euRM1NYlBkSeCAZA+LmR0HUiRTF/zaFtbOPbP9E+5ORyNkrWvUfvgDZWYQQDx1Ez8l11t2wa/cPESn8creayc701aycc8=
Received: from TYCPR01CA0167.jpnprd01.prod.outlook.com (2603:1096:400:2b2::7)
 by OS7PR01MB18410.jpnprd01.prod.outlook.com (2603:1096:604:4c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:22 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b2:cafe::9f) by TYCPR01CA0167.outlook.office365.com
 (2603:1096:400:2b2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:21 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id ED8ED300025F;
	Mon, 21 Sep 2026 22:45:16 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
Date: Mon, 21 Sep 2026 13:44:25 +0000
Message-ID: <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|OS7PR01MB18410:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82860b84-304d-43a9-1896-08df17e694e1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|10067099003|5023799004|11063799006|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XdiJRLmz+jYjbVyAYMav+IxT69bROu3KDh2d6p8xCZCEcICko/tnZy1SYs5O/rSLrUWt5fVq7fEazEyVzpIaKqNiczDH6A8qKpZxBVtNEZjtoRNR8/5JkO0sPqz6MAIjU5Gkyz1J+/58pbBg7YHD9CcLCxBnovr7eEXRvZW93iA2ol0iaT1misWnH3u+YDpFFIfyBPuBTaxOuJFrvy3Z5512qxTtle/R1Jmzm4hBCMoYTws+St6qnbZU8NnKThvDubfDfiVJIhm7fL4Glyj1CLE/4pkZf4Wk+6pWCRdOlN8pv0WolAGiop2bU5WgCD+rtO8m4wSc7HxKZOlE/82bJB2g4aulvz5e+u7IjvoyPGEJW1yBrcoszjzMGg9D3NZ/DAVwfAMvDs6CStHBtDPTk2uFXDM4yp0gpyQQLdlT4OkbTw380VWx/iFnujPHzynRMX6mhVRKjTlqe6/FkEpKPZJ+oeN2UFmBNWYeBE05B3yGDYH7LAESyL3FpxoGHq9sQCK5EF1tSrGx0W5/vRm1ibMR1PR0SKD+4/D3SixblTIUTAMTaYdlhIc/lSffBw5Xgbypc7vmJd+NoBG5hb9zJxPjLOBHoIYVG5CXq9Pg4V6r7lE130SrGZ5nDB8YBmQuq+hD/+HnI3R3J0IEscfHwIZlhmXSLxKa5+UGLQjwXYgG6ClykrgGz2M0xRsbRN/kh529Oy6yakwkj9I3J8tozA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(10067099003)(5023799004)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m5ZxzgmhoQbfF0Fw2vmyMQOagt0mWRonC7JjVNsqCZQtwQlTs7yOY7c5AyYhjS6ePyx53Hrbto+brjHITxH5U4bR1BeQWolJ4cnhKVJD+hEIigNXG5oIpjCHm98ut44T3+33TJYjp/OGGnSy18rM32QqUccbQqAdtQFNM1X9DcwFrLHAWFPfXNdyFdY8lVNcYbQc7QCTQjIx3r3MyD4KqLRBBoTj/vG4aMQkAu/e1T7HwEuF14ocppKv09nCWv0BJLkusYa7CBgKB4m1klkd0Lqb7o8M/Lqmcq3uKQCFz2TcIvg4wVFz9bL//eZ4hfGIv993DzVqFTMx6Z/1Ia366iFEDHamVl3dsjUSL/2J8eiW6RT513bPQKLQ7YU8P9eseMTrdjfTHdJnprO880KSwOn69KeBvNeJk1j9czz5yYz4lIy+nZZ0C7qmt7iGXUCN
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:21.7095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82860b84-304d-43a9-1896-08df17e694e1
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18410

Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
[RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Renamed file to include vendor prefix
- Added vendor prefix to include macros
- Added Reviewed-by tag

 .../clock/renesas,r8a774a3-cpg-mssr.h         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h

diff --git a/include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h b/include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
new file mode 100644
index 000000000000..09121a30e066
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R8A774A3_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R8A774A3_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a774a3 CPG Core Clocks */
+#define R8A774A3_CLK_Z			0
+#define R8A774A3_CLK_Z2			1
+#define R8A774A3_CLK_ZG			2
+#define R8A774A3_CLK_ZTR		3
+#define R8A774A3_CLK_ZTRD2		4
+#define R8A774A3_CLK_ZT			5
+#define R8A774A3_CLK_ZX			6
+#define R8A774A3_CLK_S0D1		7
+#define R8A774A3_CLK_S0D2		8
+#define R8A774A3_CLK_S0D3		9
+#define R8A774A3_CLK_S0D4		10
+#define R8A774A3_CLK_S0D6		11
+#define R8A774A3_CLK_S0D8		12
+#define R8A774A3_CLK_S0D12		13
+#define R8A774A3_CLK_S1D2		14
+#define R8A774A3_CLK_S1D4		15
+#define R8A774A3_CLK_S2D1		16
+#define R8A774A3_CLK_S2D2		17
+#define R8A774A3_CLK_S2D4		18
+#define R8A774A3_CLK_S3D1		19
+#define R8A774A3_CLK_S3D2		20
+#define R8A774A3_CLK_S3D4		21
+#define R8A774A3_CLK_LB			22
+#define R8A774A3_CLK_CL			23
+#define R8A774A3_CLK_ZB3		24
+#define R8A774A3_CLK_ZB3D2		25
+#define R8A774A3_CLK_ZB3D4		26
+#define R8A774A3_CLK_CR			27
+#define R8A774A3_CLK_CRD2		28
+#define R8A774A3_CLK_SD0H		29
+#define R8A774A3_CLK_SD0		30
+#define R8A774A3_CLK_SD1H		31
+#define R8A774A3_CLK_SD1		32
+#define R8A774A3_CLK_SD2H		33
+#define R8A774A3_CLK_SD2		34
+#define R8A774A3_CLK_SD3H		35
+#define R8A774A3_CLK_SD3		36
+#define R8A774A3_CLK_RPC		37
+#define R8A774A3_CLK_RPCD2		38
+#define R8A774A3_CLK_MSO		39
+#define R8A774A3_CLK_CANFD		40
+#define R8A774A3_CLK_HDMI		41
+#define R8A774A3_CLK_CSI0		42
+#define R8A774A3_CLK_CP			43
+#define R8A774A3_CLK_CPEX		44
+#define R8A774A3_CLK_R			45
+#define R8A774A3_CLK_OSC		46
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A774A3_CPG_MSSR_H__ */
-- 
2.34.1

