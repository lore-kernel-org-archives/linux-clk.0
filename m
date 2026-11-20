Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795139501;
	b=kS/l1emGIa9ypz/4fPZeqfcak2Q7A2E15Jo8AgLMqiUI4HQruODMj3NrJgrPzUoSsWpw
	 QWgk3QoX06NEl3o2UEkPGH7fvWNxoBU5riY16O6Tc3H8Hf8yUovCwVfFZvewfWdxPJilS
	 9OtlVv3KmcSuz+5/yqG09azjByayugyQpNdxSZ6RuT0xnwHUEZPUrAoTj2ylURe4QCcVY
	 1xa+MngeQgIfL6+Xf6wQrhvvBSoT6p6CAYbtaWDIyqu7HCw7jWK8Rvel3vlsf0WTbMPaK
	 SPSjW8WOustQ3y0ymQ+g2w5bUe+ZsOCq+52aqnHo68T4p27uveQaE9kG54uq4oxPoAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139501;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=uHTYH0hftu1/GRLYHKJXgTt7gRzt2O6NRsCJlLzAVM4=;
	b=vJkpl87vtQAGAs+RLwT5MUs/FP2WHkvDgvCS9Dalx53a86Us5CUMHEOwvkTWb1NKzBWW
	 k5qsakCgDIvH2hl3Cu98BZ2N43LFstGCw4DMXpYc9L+usJO9MSt3aTiKhrOntQhu/V+hi
	 CqYzvScvfaF5Cu6kIds/o0WGudCMM/rUQYUTb97DUD29frrnklu2WIx32aXj3i8qKc8ri
	 6UDI8mfNKmsP7exsDGRI1EWrRQdy0A8ZdC2s9k26vtE/ZA34O9wcEjNrrBI2r/qxl9v2n
	 sz1MtdHTLZZ9NYwso9G4lvB+tQwnAVP5LAhE0OsoAkiDQjK2zL12Ub+gwVp0LEcYFYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.117
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022117.outbound.protection.outlook.com [40.107.75.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F8606A325;
	Fri, 20 Nov 2026 01:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96F8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASWq0Y00RZq2Wyv0HD1YfDMx83oyXICM85o5s3e8tSCouEXp6vsjHf0PYdfps7iMVdxLykqPOOp/o/VC7dVkN2a8jzAI/X1LD1NxkMM3Z9UAQ0mo7XBTW3gDZ955Id6NNb3BgkqhC9kAV52sdCFq1SB5WeSfj1zX99FAlRjOuwYmKnC1nk2vmM6aAY82konATwy2VOpZZQNv4x8jiW80mH7nxJo96nfwlwIAwKkrAIGRE2fIK3ZNPLZUgByotUthoEGViqIJLThRF7YAElV5JjdwuGxZUdVz2sRAjs4bY3kzQY2N+vgNRiOATp4tsfsx5/HRkt6KY0k04AbaD+untg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHTYH0hftu1/GRLYHKJXgTt7gRzt2O6NRsCJlLzAVM4=;
 b=uZ9oLxXrZt/2ZlcLQk8TGF+NyWYvky6eysZ28wm5UdZxH8eTdc8ymm0f+XF6nZDnQi9URzy5tq4TtrYEjpi3/2vg4Bar0ut6kb0gpzsIHa6NWsHSBX1kVSrznp8g/JXRqg8dpHgzR2hQHC4t3k7ZRgzSDl0YBNZXPk2jogK14vtje1tzvB8mR3fB1el8m2pTkpbV7aMEftlosrZrKbVAEDOL+SIG06FXSRFqNHYvOVTlxFZmjF2/mhmcGN2yFuzGU2jFo4khqu9pt0DFfoWfj2mxMZSXlHb2rABp7tlsSsoTkaFOXIoO2f0UUzYAM0CfFwXG47oJcD+YQj6Z7Hc0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c9::6)
 by JH0PR06MB6512.apcprd06.prod.outlook.com (2603:1096:990:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 01:51:34 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:3c9:cafe::3d) by TYCP286CA0279.outlook.office365.com
 (2603:1096:400:3c9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 01:51:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 01:51:34 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1B63B40920E2;
	Fri, 20 Nov 2026 09:51:32 +0800 (CST)
Date: Fri, 20 Nov 2026 09:51:29 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Brian Masney <masneyb@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com,
	sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	tglx@kernel.org, devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: Re: [PATCH v4 3/5] clk: cix: Register the Sky1 AUDSS IRQ auxiliary
 device
Message-ID: <av+noTCzllh8pjJM@ubuntu>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
 <20261117094408.1393837-4-Jelly.Jia@cixtech.com>
 <179505256752.187996.952601612639868708.b4-review@b4>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179505256752.187996.952601612639868708.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|JH0PR06MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e93db2-c05d-47a5-91ec-08df46a8ce98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|23010399003|36860700016|376014|18002099003|22082099003|261009223027099003|56012099006|4143699003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CkNmjC5YOtyRsJiKsrhs5Fui7kEwXZUUwXfmpEi4Sl/KSe/9o4e7alOqaer2OrOr9rmaNrikiftjP+2GJQ4qEzl2+MkO7Nh2I1dhryBretRvaaiEUQt7NthLHdQ44N04cZ5ygpkmX7QwIrgjfv9fh0jo+T0CnDyI8hJCzCr9+T6qRreMVWKz5eq5tok8tb7ly+EpiYj59PdoDK7hf5N57ykY6Idk97x0hMNN6yLJmew6+4LHnKPtA5XMfDjMrV9Qo7PhuwKDWN9CfRYsO+9U2D8dsxdWe4uYnZqr7p3f7+IlunchkOkF28ACDFOjvgNtOK6QPr29Oh0q0Zm6DktHKgScpMSebdvCrFY62OfM/CNCaj/KWzmVMcs9bjQv92x4gy89JAKbVCEReWJFgTcq/akHuhgdcWbI8gMSMivOPBW/u3MrKP3JuXdJI3aS7sW/1gA6hZtGQyZLEjBxOe6ROB2mB99obEuZWadECCvv6MNcADLoaX6bB0YJVvSf5AhuMCaxwPbu/6UKtGGGiubdj0ZebBmYe+rtVWRtXONpNjwTpcv0tpXcKjjWh6tCw9/1DdJzDiEonm/ICBnYCa9bVIsek9x8F/P+1ybktlELLCC11IVweyVcB9yYxNvf01i0vxX6RF7ZRB/2PTMhGAQVVK6APTN8F4B4tKqobfzRjxAeOPg6ZFyOWvaO3G1HK0/OjwXmJRDaqvq+Oa8UD4MBhg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3/l58ZoV7OrUx8i7vHABGfpUjpHTr4sdZtimFtg7dbnJMQJ17lYnqXZBI5yCG1rtK+tmoJF3e6vvOE/MRMyfrlYRpNrHTflrHxAuXoqhNsOcTWgGwljMD7O8hhy5rW2ess9Tfm5BC5cyu7O2yFLZ2zzVch4PKQR3dRQM60e1YuLS/4/EyFcxHDwpLDuIvshf0rBVaknjfKPbA8SwAoyrsEfPDg300JmQ0VYFPdynjrdPffYQXSOjS0XZDGF0K+u+MKS/rVvqTB5mL7OoEl7qYo/gvq9LN92+doafCdJIbtPXns2VyYc7I9HYC5H0lvwQFVYTEGOgSkkeDugbzXmuofxH3IZ7esQ5QKoBWmk+hyoo5lo1Nz7TI2YHA0QOAq0SOOnPHBUsvf2NkI5n4kLUSLpl4M+Aoi+sCXrlEDzmQl4DWVXDg1/CH3NIxPguE2Cz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 01:51:34.1956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e93db2-c05d-47a5-91ec-08df46a8ce98
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6512

Hi Brian,

Thanks for the review.

> This, along with the defines should go in a separate commit.

Agreed. I'll move the INFO_AP_IRQC and INFO_SW_RESETN definitions
and their save/restore entries into a separate patch.

> I don't care which pattern you use but make it consistent within this
> driver.

I'll make the IRQ registration helper follow the existing reset
helper's #if IS_ENABLED() pattern, including the stub when disabled.

> Should this be a separate patch?

The reset_control_assert() error check is independent of the IRQ
integration. I'll drop that extra change from this series, leaving
the existing error-handling behaviour unchanged. The additional ret
variable will therefore no longer be needed.

> The IRQ driver uses the new pm_ptr(). Please use that.

The clock driver already uses pm_ptr() for its .pm pointer, but still
uses the SET_* PM macros. I'll switch to RUNTIME_PM_OPS() and
NOIRQ_SYSTEM_SLEEP_PM_OPS(), matching the IRQ driver, and remove
the unnecessary __maybe_unused annotations. The noirq suspend/resume
ordering will be retained.

I'll also remove the added bits.h include.

Best regards,
Jelly
