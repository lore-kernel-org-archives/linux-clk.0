Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6C44CF59;
	Wed,  6 May 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076407; cv=fail; b=JxRSP24pLlvfBPuoD31mdM/D0pUj67p/YPKTps7vRARM2EfIBkAJ4AXVWj1s3susuICrtof7vspq8HAyOpFhlygmTFzFwh5C2RYz/7uE4WCTYuADhCpVs6p0eWjS6eikin8RaEfcSg9kK9RWDEEj+D4wOsdBhUeLYl1Gc4LeMHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076407; c=relaxed/simple;
	bh=riPfw/zSZhZ5A7Qm9ULByrR29VeLutIxQsHnzkK5mVw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptCwmqLRRgj0xWByrrl2DpT0RY6PwX8Q/vUWPeXF7ydyGwzLa5kj8AM6o4HjDtrGNXeHgzOcusf57kWdKGFqdfLYx1sd6YHUf1i62gBz1DLtIZR1R8mB9Y5IfIY46iAJcIAbFS5Q6lefbLJ25uLxeWqrn7m4cfd2bR3zmA4z0VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=myW27Ymt; arc=fail smtp.client-ip=40.93.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="myW27Ymt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMQ674YKP1+gWj4pD3kw5WJ4QzBEVT1/vAolGLzDC/QYJq1E2rj6Ls2puve2+crmIBAeHc7U2KdT34C/lTaU+MeTDMQjTrie93g8z5/WworQzoac1X9MoylYdU6LBX4K9jxr6oxCohFCIdY/dP1+luAFq0E3wlT3fgxVDSGfKBQdUt3FJLYvDCs+eb7xyiajLwkv/lz7IwJtpnmQeQ+mDC5XF+AByXSv04NAT0i+SBPdYnhZ4NC4KwiF463I/lEp+1g6Xau/ylu+Sq/WxWGBbKNxpR0b0qiJ4dkD5ZS/uR5FAldsNKzC6ExojtetaJbE/sPnu+32aw2BzbQnYKgApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2uaXvFyOPrHGhDiEghKRxA4ukwMLrgGBi7EXrbkhqk=;
 b=SQF3HfVLVK9eS9CXUYd2q1dv2lsmTzrcIDt2aF29qA8K7Z44xTP6JvY2orQSx8mpBN7Q1fmHAzmW7ldB0kZ20IM16pMFBdhmzzPjRryMPv1isnFmUQiHqPwuSB4q9h2t5XZ5pCzy0Hdqh9ze+3lxDRB26TqLtuKejA3pvX6crYtva9+doPqloszI8ak1Tg+OtZ99FQf7ZM8SZf+uxLz3Vr6+MgpnvGSw6Ek6+dwuellVb9j6UmyE8c/JjirE7CrgzOln5SCgrE+CVscAYaMmYXVjeTvoit+61vMPi+bVlzsndwP9pt4+JEKnIZCl0JVAzW8D+SoltsYc/0sF4dW19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2uaXvFyOPrHGhDiEghKRxA4ukwMLrgGBi7EXrbkhqk=;
 b=myW27Ymt81nkYdfAhmxW9f/bTNzAwMePdBn35cEG4t/LEwm15FlO7EwE3i8UO4QnVkyNMsarX9F1zBstLpcdszX9OewDfyODLS7ji85KtNl4rRliBkm/hUHeTEA43IwJYIh32Vk/lP4co7tatgDxd2qdtfzPwGAFRH+VPXmzR4w=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 14:06:42 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:191:cafe::a3) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 14:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Wed, 6 May 2026 14:06:41 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:06:41 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:06:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:06:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E6fD21514332;
	Wed, 6 May 2026 09:06:41 -0500
Date: Wed, 6 May 2026 09:06:41 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v7 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode
 support
Message-ID: <20260506140641.4vukihz33vzzeanq@eternal>
References: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
 <20260506-ti-sci-jacinto-s2r-restore-irq-v7-1-037098a35215@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-1-037098a35215@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH7PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3d99a6-caa4-4106-8207-08deab78b2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cG16kSWGDuCoxVLQSnaT8YGWvKcYh0blqjjv6MfaDVVMc7yELannWKSqLysAlSAlWJujdxYEwxlpySs2UbcAs8S71yVdlVxefLQZyyfNwZtPug5zrfYIQ+B3psssYEYBwpK79BUkjAyAH3ETTm7Jjg3wvuRilTTMxv2YuGDjCWgh/usfy1CW21low4/eg0ae9uWAmiO7XdTkBKCAvfNMg80GcD6QUuwYCscjbVvgD2SXxecbQU+Wed7gf5waQbUW8Bu4qmZUSsXNIi+USQDjcVfgcp8kOtO8FaFuWj3tpFDnv8GfKngh5oyDtSoIYYCHHFDZS4IOEoRp0G7XzQwCUk7T5MIn7/q5XzsR7Ji7x0ZYCLhfgmhU6+e8WBDCxvD7pGmPtV+hnnd2y+vdO5HCm2gLZD66Kvb3Tol5oRPbUy+eFgQisD4sQTkovu3r8OjwiKKan6hzee7xXJ+Wl5UJlgWQDutKfbDvTd4YVFav/r+nz8l2rw2XnjnUeuFrTkwu8sPFtSIDEk50tURVG0T3hlOdjkrx9xN0dKeEGa/aW9k5zyMc+s6KEwNPwQBYZZCgzMIy+0+19v1vZsEBb17AgrqrUVts5mYVBlVn1Ck7Bw80A39UHmzK/WgFbIk/uLEbMt+C6aEkt52F4BqJZAu2cDqJcwbLEo7tIpML4j6dM6P45gmWYiImyTIsKADoaMB/VRJ3LwVKyZn4ruzBv21zsmDH7XgaBOddmkTFVzgSsfA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HGyiabP9bPE4e/ZjJ6yPB1YDajYzodv/aXxcYAVyREydl1eF31Yk5n1bh4I342TvbT/f7heyYb989JlwwgHee+cfi+XNEkk6qc3XQ+2K6B+ha8rZVG0J+asEIL15XuYT1V2QEir6UcYA5J68nx/G+LABWCHhAkKF12q1v8laVr1ukxqz84VluI8iRggeG/20wMNsHBVo09BHbW8L7JGk38LSEq62UnlDj6zpbXTw9frfQrgyCkfenkRHpD2Uo7u4I9rF20xWTKW8PlGHY7AF6pJGIzr3mqa9YKoOx6Fc3mtnYwggBeoM8w7fGaNyO/9tdD5vfqDQRq0uePkTFkrKFLbo6pQSbsDEvpLfAk0fD5dHBCvLrrjOWiSnbSS0lx9vsIxRbWy5aK9ycZJ5Dzg6mWTUadqufF/bDLiXqSEfByRGCjTggWzjrVVgfflcK+7T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:06:41.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3d99a6-caa4-4106-8207-08deab78b2e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081

On 10:35-20260506, Thomas Richard (TI) wrote:
> In BOARDCFG_MANAGED mode, the low power mode configuration is done
> statically for the DM via the boardcfg. Constraints are not supported, and
> prepare_sleep() is not needed.
> 

minor nit:
[..]
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 4616127e33ff..d90de59e29eb 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -150,6 +150,7 @@ struct ti_sci_msg_req_reboot {
>   *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
>   *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
>   *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
> + *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg

will be good to keep this under 100 chars

>   *
>   * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
>   * providing currently available SOC/firmware capabilities. SoC that don't
> @@ -162,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
>  #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
>  #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
>  #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
> +#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
>  #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
>  	u64 fw_caps;
>  } __packed;
> 
> -- 
> 2.53.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
