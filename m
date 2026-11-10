Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307353;
	b=YnU2ot4Q0LO16fp3/xMaU2TMRc0cfkeB5s7dHIOD2MVMDhl8/NQ8w7wrAbJfpUnROmSz
	 /fhXory182SEy/OVJF8ndZsUpXpabDqPe7qqsY1KyAVSCiszGzawCW0o4Cca4qq5Eq9gR
	 NBrO7c4elhYkNrzfLqXD9K2ZbuGhPqEsIN85PTLBa8lRa84aLdAeFrI43orIOajpjN0ux
	 i4X3v0Aos6lxxYFhrOThYYEfKAuJGiZt6MO2YJjW7HsKy+Y90GxhulC8EGWiP5rgauHR1
	 9GAmN6wc0muc7HxGcnbNDLNQGG1ad4mmFXgcfO74uKSXMVdMaDKoAHu6/aPYNRcRTeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307353;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=qCfLfjwNWJRnvVFIUoBo0BsCjD9+hi5HO+3TwBVjesE=;
	b=GT9pNJcjdKDc++ITGBoJzYOtPn+FzdNNR1nGHZhlFkPtLI8fK7brW/02rn0oi/ByNePN
	 IMsQd4qyiA7KHn+uB5yRisoY9OYmuX46HfDt9vhqJd8LDH2wTAJ5ICvhtVFI5fDY1xdTS
	 GrefSSc0yf2z6llcXm7LZp1k1Rh6auERxkhDruR1zs9S4RsqliDXUcDYgOVOG51vRHIgU
	 chBbUPapwMgkspFO0PZYTWXYGu7PSZBMr79KodZY77nRk2IJ1zVm3tRozNSHCnWjkZ5EM
	 oDxUoNZHQYMLI1naUMDC+JDiRgySpF6NmT4faDOLoH2aCMAeDG0gee3wMrtyymHGrDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Ct35v5dx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.47
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B0F606A332;
	Tue, 10 Nov 2026 10:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B0F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Ct35v5dx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYvZO5+NkK6uNzwG3CKHbxagl9qb4ZG5rAz3dsplPIEDfIJffJwUTksjCVXSf3HdHz13gyss4Swcy37pRXTq8IwzCtxnScS9aOQ7C8pRzuiXxfGeJ59TeXOvBuHLpz3pab7FClT/T9QlPlGUAiFtrARYpW0V1luTEB4FT8BXMwQCZ1wK8ZqMlfRNRJQyemF4j/JYfNw/gBdI3rQtEq5UwYyvwx8V2vyVPDlhb8keTQumlfixBsQkOZKHDw3uPbA62w/DQogS/SdVZVz7GZG/z7NL9U0CdiX2ZIuShNYQL8w/NklRyiPKOUt5ZpIj5ceqgdHObrJtra+hSKCxavppRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCfLfjwNWJRnvVFIUoBo0BsCjD9+hi5HO+3TwBVjesE=;
 b=Ukm3IoUezX9iWbTSMn81gA0EYwmeenPxX3k+qBRrFx6KA1NROPXJ+gL08v3kbOt7UM+CpnNuG0ibsRs2TVsni6W3KXUS+cBNxO+LpL+yFeKbQ//UmpX5PO0yWyWnD1uc5UsMIkUyFuK+coLTxF71Vo0zK7amOzkN1e/SMz9EcHC8bUAGv+TVeWjy7rG3/wZ0lZHCppRVn591IJeMXW5oqmG8i5HC1JRHYfB7rusg7YjO2VR1Sxyksq48c5/P5ARlEQ1MUSeftzY0zrHtUnOtrmBICvjAvjjA4mIuEkfvl7/f0qlH5U2MFwRk1at+fxfjDAZ+vg3urEJJSCjPY2JXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCfLfjwNWJRnvVFIUoBo0BsCjD9+hi5HO+3TwBVjesE=;
 b=Ct35v5dxo8MKvMz6wUyHxKbY/rRQpSXAon0nCnH85N9EdwKTCuBe2hxc4ga6sqqFlEaZ0VbeAWtJgUK3UPVSqFtjnPf3lodL+x9ZOMdXLV/rD3JrXTJPKiCfCMddEcQZ9rQ9aYBlYjxbX7zQW+kIrHwVtsag9QeNmTjSzBTWXZiJS+OiosWsXhTVB4DaV1Oqcag9vga7od5eeJgGeARvz8nstGeNmhkne3AjYdDakJfsJFl9vG8Lv83391SZKqHo0yDHZ84iVBmsg4lpio270F3DSpNy1ySalyrKRzQo/hBs4jkhPJ+mGFdjGYj2eLrXziJZxz3M1C4Nv0vVe9ES3A==
Received: from DU7PR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::18) by GV1PR10MB8420.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Tue, 10 Nov
 2026 10:42:22 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::4a) by DU7PR01CA0045.outlook.office365.com
 (2603:10a6:10:50e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 10:42:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:19 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:22 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 11:42:17 +0100
Subject: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller sub-node
 to STM32MP2 SYSCFG
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307340; l=1430;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=y82585GSMjDb2449ZfDQs75fuTkCNTYc7Yvt5M4MjM8=;
 b=9f04Ft3laMBJ2ZuvcfGmgUAV8iFkzQ2jZN3pUSWc0nu1+WBMpBUID988EyP9vrgRvutZQikXo
 Xw78ay52S+rCcrRWT1xWofRz7nme3Hsau4Pq741EkMYaXecwvNNgVJt
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|GV1PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 652088f4-2970-4e99-89d4-08df3f174d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|7416014|11063799006|261021121427099003|56012099006|261026121527099003|261009223027099003|261102123227099003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hlGhUvVvOZXq45a6kaXKKEp3XSql2k+BzFVVogtQNsbMXjtfOxhGuCHR+zNqvWO3vTddjeX1NJyyhsjxjxcrkJrkT3B4TqSjEtNS5kxnfPuQriq4U/EKMsTBWkXuHMdtBjNGUtPgYnefIvgZr0dfLL8F1FqfJvpV0PMtJ7LLYzCvbBQcIJ6KIbT1pXaku1RD2KOpvqPSu1stkcwjP0K7pRdInTcQsORapGXuhLQgR0nRfKoPtNKnrTyHQhVRl4fDyi5m9Qt2EBcbZw+nWIa/yQlO+52qeLdV2wXfpLEQeUkH8g6Rmqn5GXhXqmhm98Y81z5zJad13ntGqFM3JiaCMqD7W8gWqWPxO9SlJsSidCEHDigOzZBkRCoy4ffWR6TgBA2RqYZnUNuXKA58oNftaOYZmRYiIs7wGjfhDoWMLwXwzS/5z1ZfdSqrQ3P5/Rqvdlo5/P52sP4N7YVrjw+WT2qwnNhHzK1bgtpwMGFK/3OaXh30WcTsk9jmB+TZSGVfsRHJzHmm4Hhq8f4P1tlVgQXaRjUwA8hLUuNlnkpaEGAeU/OuGcAa9RZJk+qzaxaAIIen3cu0jxI5XoxmC3YVrvqnZIgE+pF9kPLL+8eP8gNFV5TLw9g32viF7uM7WldB6zC3BXeJSlSGage45SdRvOjCnv3tK/9ybUrIIoiQZI4mD5VzcAEGF6a47r/k+Te8iuWL3c9pfTYYBT5ZPT7a5A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(7416014)(11063799006)(261021121427099003)(56012099006)(261026121527099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tQtlKDlVPLiXWlE5U0ij/YwrFVw5R8qhfqFDHEat6coxd1a2lp97V3v/ze2o7Dk3PtDM3w0sX0kwC56YBcyrtQolzu2hiR+sPJ5KofT1qPQhdNglQUj9viW3kqYtTBeXzv3zrxcVFGTjD9A9fF7INHsDWawEAP7JL8eich0G2U7eDVQ+XNzbRfcZp2B2VA+orAib6hugGJ/TOpghDgMwYs6eHyB4frp6cs9YdgqBXPOf5Qb1x2Ri6uaV705/WVATuyabZA1QLkIK22YKHZgk+3758F5hm0hIQIN4F1lK+PkYjFmkqMEcSK2K9584uFZSQaelW5uj/zv/eOmxD6L2oKr0QA5vBQ903MhK66bSgPMaiI/4XGbsQjSDVr5R9O01v5Lrh/zpOyq008H1GMWs//JapnxNzuXmgO1PeGcWm1INL9gGSAtcXyEfZoUp56GZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:22.7578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 652088f4-2970-4e99-89d4-08df3f174d9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8420

The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
SYSCFG is described by a clock-controller sub-node of the SYSCFG node.

Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
and STM32MP25x and not allowed on the other SoCs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..38c844e8f19d 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -45,6 +45,10 @@ properties:
   "#size-cells":
     const: 1
 
+  clock-controller:
+    type: object
+    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
+
 patternProperties:
   "^phy@2[48]00$":
     type: object
@@ -80,6 +84,7 @@ allOf:
         - "#address-cells"
         - "#clock-cells"
         - "#size-cells"
+        - clock-controller
         - phy@2400
         - phy@2800
     else:
@@ -87,6 +92,7 @@ allOf:
         '#address-cells': false
         '#clock-cells': false
         '#size-cells': false
+        clock-controller: false
         phy@2400: false
         phy@2800: false
 

-- 
2.43.0

