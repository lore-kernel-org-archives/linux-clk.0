Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908658;
	b=pz4n7cs3ef9GoyrvCbbqRDab0x9hR01xzrJJqjlVd7gfLQ1u0l1GFVxpDyXYqQeVTdYP
	 TtyUtDaY2V4DIbgBT2ra1bkkjv2XDYtvWzQwqRm9/O4dPyj8Hj7sqd8cxPXX3QKergfdg
	 1s5p0dixNTto3A0fFdPdSGxtJoSyARZDRMuStNBhPluu69ZdeN45XgtPK+oOUMO3MFaSi
	 gztKPPEpT7bkQh0KYSf77t+sLI9b3z8tVXjvloINOXx82wcWrb6MlYugpopkFZiUmCZQk
	 dlNhA0xIH5tiqhQKHTiWTwydcMoHLJBKgD8FuDP304qmOjI3dlgsMoIDOwujMiAOGlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908658;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=;
	b=B3dp4NQ9K7gtVx4FQpEGxfRdIrbK3zmaafbW/yd3TRMFMWl+nySG7wgB3i0LqjeO5dDc
	 LUq/kG57DDDcCOCmNQJfY43988G5BIVpDCn+H437Mbsx1OKfhI0V5Cndcf0QE+xkpXzT1
	 NL7PtXccfMOX/AqJ+ndVfhxFMxrKie95EGK53csxgdwppSZE1p1K5UHXITQWT6Lo4x338
	 D7Ea1+RyC3mLz1TpqbDGNZERyqyA1g91fv6IXiCe5VFKRhqKzZ9YiR+oX0RV8Nqlspf04
	 BlLTjXOxIn8daZD1lujcXQHHgEmyTjtOqnS384/m412ngVfkGBaSyDtpj/jBu3KUWkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.97
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023097.outbound.protection.outlook.com [52.101.127.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8C606A33D;
	Tue, 17 Nov 2026 09:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D8C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq5sNoeQbni7UpxAhY3rmWy3KXTwSmzXU28JM4+HxhWNRzgtsWDQGWwQGJjK0QuaV2GGSxEW8cggW3xjyl1srvVEMvWz5POxclNl6aiFwiKwC8/v6k8mZBRmeDQoP3GQxfNremsHFNDCdESoNy0zfXCGIifaqU4GUXPhOJFCNOoOe09iL+hyStYGfHA45dzjCxpZf2dhJ4KS1LdSqyvKNJaC0iPWacYP/VACJQ3JwtPmArqEgVkPF556o/xfdHdcpbGjmE4vE8XmFFeZU8FlKJ6iWdrgf/6/oAH8ctH5EEmSZUqWTbomgvrgQROvZyjCf0jOFrVGqeX2loacyo8oQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=;
 b=Wr2uWXvZq3mmmuNVKItEXuXdxq8EyDCzhzs5vVhJ4BMIbr2uWZfNUi7SDfPge8vJgjaQhYCSIUxJXp4s5cf6FotChbURE1FGC11AwhCnqvEVS9zCKRxwQhd5UkShTZJlEJxjtQ3kr9gyfd8y6fhagSlR17bQfL79lKgb2AzUXYBkLDoGaTTp6w8J8FXN2CH1E6u173iANdpQo9OgKpYKOYGViGrbpHYJk83CJbfBeG+/Ta1PD8sZyodUyufMbI9SalgTUaOigKnBcBMcJU6UdKeeDzm3Dtz9Ilsa78AJAqkG1krjs14fBnOuqDgA1KMbH4kstThITdW3wRYOtCfobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::15) by
 TY0PR06MB5802.apcprd06.prod.outlook.com (2603:1096:400:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:13 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:190:cafe::95) by SI2P153CA0030.outlook.office365.com
 (2603:1096:4:190::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Tue, 17
 Nov 2026 09:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:12 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D4BC140920E7;
	Tue, 17 Nov 2026 17:44:10 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 4/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Tue, 17 Nov 2026 17:44:07 +0800
Message-ID: <20261117094408.1393837-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TY0PR06MB5802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dffb4d43-5ecb-4bc3-db44-08df448f55e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|921020|261102123227099003|10067099003|56012099006|261026121527099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	chAg5SlE3f8D/rGGPCgStHm1mgTjurP257mZzizOx4FvdU8ipvOVZjge2762JyK7ksFdhDTHDyy/cDCcSgYsvVYv+g8zYY9Cve4hFmsXPKBoXptgfTZRnk0bN/oupEyT3IHVOfz1ONZZsVqnn0yST8Dmg6x3hJdZ/5DMi8PXFuH3O3qQGZEIxOutrEuEGJuYvssaQCe0cxvboP3gRpUSOzVXsHAfWETFz65vWtgg/mZkBbCL4XtH282WiBsL+OINKqUwu+rn4c7Fk4O6Dnfz8ZZ8EqbRdsGYW4Oh/DDWBYEqXkG0xz9rgya1WkboRi6/13WSbRHWUEmsLn+qd6YpDKDKd3ScTO4IoWeREl3pS9mJbGkPdHZ/aPAJ9DqufBq7WH5kcbcoOzSYEwmpc7XEuu3liHroxjDLvNfLMYLBt9KbC5lumBi5el96Q8UQgvt/gV1cmGmZ8K4NBErnQlFlqOyhYgRe/s85bpTTwyRzZd4xiEDW+e/5fKpScbR1cWtUuF+/cY5lzs/rLnH0/dL90aj9WLRixT1QFb2nOlhGBwy2fVrfJ8Vf5wvzbgUqa7mIYcVPh2nK2lVnZDqocxs6ubSypLoWzN6xWuKPQSRhJKmMWGLM4DGb0NrgU2Ezvedss7KpaZGw+cZhjAEnyrtln4q/fwza2Ee9iVhf1rNTMy6l4lSguMRNcRQxa1aAsskmeINITjWJKelZiP/QM6M90T9P4VIvYxkbvMGkHHzQf6uurq2BBnc58rgQTBOIviQ3
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(921020)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EMDdV2vL+AClFoPMYzAikfn0HTnq4+CgG3EJBZt7DWbI8bfai8mJrhdMRi6+LBSSbS8GYiVMfz1ISjLdyTx91221ldGhMSY5TIkUGc2uBZ/v5UEHjQ7WddbXGzUA0Qr2lcTd/DRzNY8fgT8nx2uwLSM9bfWDI3jZXN+9mm2nDfVNc+/0ZGeVFDAJhsQhNkHP4cmhUYxJrv9iN3VFWNnFC1KsDgNdco1WeEFpSVTB/E4bngEiSxtSYo4yKQa63fHji5Stk0Dd4i496ZeooioVulWWMOZg9pty39M7D3rsidju8ntPM66KeaFvxShzeq004CCzJ4SXVzH/nXmtjpUAFqf4F7YOemp1BnXqONkNvRrr49V1ql3zz/2mGwDSZWLlUgnWAYdUw47PvR3bmMiL3qUqe1uUvwAOMEg3B7s7dqOvYrWKrEXPLZjYacXhEgge
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:12.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffb4d43-5ecb-4bc3-db44-08df448f55e7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5802

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index eab3b31aeba7..59f3b59b47f5 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -47,6 +47,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0

