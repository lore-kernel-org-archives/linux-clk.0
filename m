Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044757;
	b=K/NeYUZwWIyJPB61vGFPJ4pClOlA5CHg330mXlxo6yP6Z+DAbyL/FOQ93/6Y1s4uZNBD
	 vW4otZDPdrvsrNoYMon764HW9faGTVmL/N5Mb6kM3xhowhddLMV8PGvrCUlLVilg/mPTD
	 9X4sHFfnNjTrAMZHtgqRdg3Trq7Y3Hrjhp1E2xesJMcnJ4ttxTaqAqktyBt8C0jeYz8wA
	 ugMNbJWPwnYGXAW0MXZ3Gxd2VSj/2+cO98VkyxwvXnqMMzFnjUkIZdGcxEPiah1szq366
	 BISvw8Q7Acnh+/+wN+FX16k+KZh/uJEcmUH8irr3vCUF+4vRydIGgl+1igeZloKzPlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044757;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=UvArlSTolFIeqt5t+Y0etJbjJLN3TV47XlbFJkIURdc=;
	b=gF80iy/fxkMt2uqWDKW1QLDR6mbjqY6WCoZ16zsHKcxTQaVK1Z1+HADIVleeF7z3xY/X
	 VVVWW1QuM0JXYjL0/wdjMMNOAqMfDz29W1yhcZ03+8G9yiV9v8KljprIWBeKcwEjYCvol
	 hFwLcv9UQmEJe+3KCI3+oinZmcNVgkvrcz+QJkSRecDxmpNil9buPQKk7LnnYIhQ5ldPK
	 g163flEIM8IyAfMkG8DiYLTFavCYiQyRqpquTkvCG533HYoA0BQDIUVrsvsQlqQEICPD0
	 En1YxeQkNChUeHHrvYVJx/VW9aB7OwGYAgAk4vslyq2SPiWGZzmOsPjSkf79SfgcY6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CgdRDtk3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.39
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882060A2614;
	Wed, 18 Nov 2026 23:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E882060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CgdRDtk3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPXeMQKwGgqYjR6a9sro38iYNr5DADi7nlqoJiTrqHfAjw7AgkqyAB3bl0UCZDgXOywxLVPy3G37qEIEiNwp0xCOB4xZpsT7YyFu5xNQCP7rfwic5lQC+Qb1IBC5s4pKML1xayvGMqU16MzbY2fahBK3M1uqcc9wuLpq9rpUlm8kImb0RVxND0frdzVCNQtxGPuenZK5ylPeI87fP52ToxvbR+c2s/BDvwXSj4ajTZ0iwB03kIqGKtlbBHfHbzSGsU8Oqj/IVcD0yx5hwoFC3LHsZ8eaAf+CO7lMPbPXhuyc4Vg1C9seJt/Kf0JiLlbitMbHpAolQdsrb/M3PJrIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvArlSTolFIeqt5t+Y0etJbjJLN3TV47XlbFJkIURdc=;
 b=ZoBG2VF7dAJmZKgESpr1LxqwbgfYZ4C0Yl5fwRl6WBqpsiKAtZEU6WDrnunO2yHYicEOWvPgCUjBpEb4/z6t89cdSntJwvmBtw8TKF/q/GBCx4lQtfkPeCSr/qdBK0oGHJB9tMVhfVT3Pzngny/tCjM67EGQEfKMFFCPtVKwZJNcET495noHhmKSrl+gWIpIFuP+9yQEcZtM5BwiX5YcM/0uPilB8aFMuSrzNdI2/v9iCUXCTWBUchH6GjTekj2mM1MS8rutj4tZZCWfRT/QR5i/U/GfXQNbgiiXpqTzHflO6YoRWlzX1Uca4GMg8MJep6GD9nT7n0jb99aTuwr5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvArlSTolFIeqt5t+Y0etJbjJLN3TV47XlbFJkIURdc=;
 b=CgdRDtk3KQXt7lBKP2lymFbIFVNILmvyHxzEDgfJ6YHOU6KAxRfYiU7vf4gismj2PyIHAXc8lzZCtr9l4lwBQ81BA060FO0VKk347x1Le2JDwSelNL/nnbjKXGkGj8p79QLdM6/h/4Btc9X9PkDzO3Nz3Fbn9a6pcXZLgWT/Eok=
Received: from BL1PR13CA0066.namprd13.prod.outlook.com (2603:10b6:208:2b8::11)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:27 +0000
Received: from IA0PEPF0000003C.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::f) by BL1PR13CA0066.outlook.office365.com
 (2603:10b6:208:2b8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Wed,
 18 Nov 2026 23:32:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003C.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:25 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:24 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:23 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>
CC: Naman Trivedi <naman.trivedimanojbhai@amd.com>, Senthil Nathan Thangaraj
	<senthilnathan.thangaraj@amd.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/15] dt-bindings: clock: versal: add Versal Gen 2 compatible string
Date: Wed, 18 Nov 2026 15:32:04 -0800
Message-ID: <20261118233211.4121361-9-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003C:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b7bc24-1498-4663-8bb8-08df45cc34ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261021123027099003|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4uKMCf8m7daTCSagBVwlUYgHebYZZqOAQBOQNix5fRURXsXr5FPsWvkMsPJEGOG0aJB4ZNcWJ5Xiu+DZNB6uZAzuQfPiwgR6UmMQ9GQURXIUHcIvjRnwmanshB5z4EflVX02RQfxjLNqxpwgEb1VXDeFa3+v1OK+FjPqbJJcjAczjNjAnBZvni0mUBhxLc/P7GMOIFEYk+4Yz9U8sLUA/uZpa9eUYhEAwBA7/R9HamHbM7RssjjGxJW35Qc5lUxoUf4czhwovdSlWl0xkYU5ST1FGIvlgF4kK4AJLoNcCCtkZxw/9O5criTKyPD3V5Qq37hxY2vCWH94xf0oXPJFdyr5Cnhk4Qo3EF83iXtm3KBhyEO+7J4yf6vsNqpU0NLIMTFjq7dj4oNQZiHTF/yaUcIrR6VjVuxfz+TU65RziuoJPTyOmX1RQxIBmRsw6IX49PWuHRCFvnyNlXwfVSRzbZ7aIhtz2oYNxYqD4OtIxbd1gbOTb2Et54Z1VlJbmDWjRXRRHvgcuLs7A6XuXW85jXVevSZS6mXL2fq8BGZT8g7BnX1i1dOFrhCpsJ5mRl2XLowauD485ZipnkCVpKXVygRsvYi5pdjP8PcsW9Yc/mVps6Fw7eW/GWDH9lNSlE7TbOMlnIkUG8q3XpqTrC4BJFJ1Uhs1bSfAo/p9kVLkkwt9kaCD4siZ2JNQrLDA9ZHI7DKFfLhls+ajJMxSgoqMlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261021123027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zLNM0tULdNaWfnVahJAd5ThXHo8tzW3azbDG3PyzQKbn5/ksjmOZdrPDIEWYjCjQXIkSQMJ/xR8qB5Ve+8/jKdYooN5c9flKfkJuKwFz7LgV66Pt/Bn0BducjrYeLLK+SULqM9/2cDhvkh2IguAa5ZK891XKtnl6tEhstWB916ukwlobjq0mQTSnPedVjLUL+iE9uPPKOb8b/xR4nulfRbCX7/u6cO+tqp3faVUn6RsN94leyDBMmiEZgjYLYgPra0Zr+hPgOB8cilKK/wh8ghyNNuLWKbxoZwPXL1oXjlPEqhhOOo6oLAuXnVFwz+pkg4+fYNV/jcrXR03lJ36OJwlVy/501GwGQw9jl6E79ge3sCPh6IpD6eaTtwREpj+CizOEi36e7qsjaA4DuBk3/5knLHro2oJc3VuC9dcyKLAWWd0lUzoT7zFrcLBD4iYN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:27.3237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b7bc24-1498-4663-8bb8-08df45cc34ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170

From: Naman Trivedi <naman.trivedimanojbhai@amd.com>

Add compatible string for Versal Gen 2 clock driver and validate
clock-names for xlnx,versal2-clk compatible.

Signed-off-by: Naman Trivedi <naman.trivedimanojbhai@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 1f36ccc4cde1..e06f1ebc192a 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -17,10 +17,13 @@ description: |
 properties:
   compatible:
     oneOf:
-      - const: xlnx,versal-clk
+      - enum:
+          - xlnx,versal-clk
+          - xlnx,versal2-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
+              - xlnx,versal2-clk
           - const: xlnx,versal-clk
 
   "#clock-cells":
-- 
2.34.1

