Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794832318;
	b=BF+KGKfH7nUTn4iyvGJVuASe8PcTTOdJzbPD+qPIhC8iBwe2KmthFboVuBnfRVOZBRTI
	 4iQRxxDzJm5cn0W75+76+bGR3JnTeQN+cZl3O9yoebmgiO/cdlFC9+UKSB/F7U/iQk9gc
	 30wlOlTzP4K9ZzHYyAqMfrz34XD3WWel0suyIAkyMWHAPAKau2MT/jNXaD+1xyJCcelhE
	 FJ1Kn8QZcH8PuenDAAjYy+87KRo7Y1AaGyaBE6w0Uycuo4MiQDJgVSJ2+wjexeu7FNjvM
	 N+v0YeukwP2p16ux3dhI+l+dg1h3ohN14RTyAD6jBLBYpebh3jl2a7grct95/gmQxgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832318;
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
	bh=u+MJ2UAgWlLd4u7ouaduPW/8nG6ijzHdsulNJMWKwIE=;
	b=YvS2/PaZSYr30lPtxQx5bm3IX5lJVqzbfIyfMvaVwQ1Jb4MHFlm7620cvD8MPkHik2fv
	 iGODeU41G5QabMZQmPgZHTNcOGWJWx5/MofpSI5YBtVsG+zUAD4D2xKAKqzRoYJwSqEeA
	 +lWJ4Et+cmW7T1iRA4tobaOtTHbwQnmABam6rRGCJTR3vyZqC0w+Nb8ymEMMpKYBWvG1C
	 dgDAmK05SCKdGIz/S+Mf1s6Pl/KbXTOSBzVI0ZuoQyJLJSkllfsSYd3l2O4llq3n6iDj3
	 +mf/hhTbowEcH8buan+0wjMcr5PE5hIiRG1uVdRYcVV49I8a6PZT9b/mZsi4o2XXx0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.104
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023104.outbound.protection.outlook.com [40.107.44.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE32606A31C;
	Mon, 16 Nov 2026 12:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWHX5o1MVEfVcZT7+JA1/GDRm8SQCL1CcODeTkHVDfSS5jAGXNSLEvjK/aggTCEqv4dyuY2VYsiLuioRw9hdZ9JQ2i2tpZjyRbnUQUA84u0MORmqHTQqwP5NCpYo3Zsa8YGLKToC0jdlGH2dyVPFxUYg5hth6KV+h9IDXy4M1v4h7CwiCrB6tuDSEUPwI1tfMdDsUyJGtuwmIO3flUp++JTDw7IBdzUeI1zZZ93uLefezNgmQ1piY21CFMMSdn5wd+J3jdAXQPnCZSHb/Bu51HkS12nwrUwWjRK7vcmBkO053P88h2vQKUnOMT9pmqTKn5XmKGs2X4L2jWA2j+hPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+MJ2UAgWlLd4u7ouaduPW/8nG6ijzHdsulNJMWKwIE=;
 b=lWJlV7NO0BvyJfdhjrGAdNzwPxJ18yW+zgbss5EhBw9HSylyJTNKWLcmXjALXilYPhARRT5I9YTs9db1Qud1v0JuTTUhRfeYHwCZKqLaywC3bxciW5c8nsyfZAwlozAGf+02BsEkZ9ahmOdMoqtpY9BXrESfaxQ+RyEwKW8Sxk9oMtT/WoGB2HMNoHcpCawu/H6VJV4YCWT6Az566baUyra88Lfar9KkIqN1PScveVFGdGEYvE1oblakZvHCQdSGK8cUMti1z/YdeiaHr4QVvdBG7qog4fsGFvOhlyUn0i40ER4LDMhQs0K+Odi7nu4pdqYn9vrUr1VvrDfUTfPCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0022.apcprd02.prod.outlook.com (2603:1096:990:76::7)
 by SEZPR06MB5117.apcprd06.prod.outlook.com (2603:1096:101:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 12:31:54 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:990:76:cafe::2e) by JH0PR02CA0022.outlook.office365.com
 (2603:1096:990:76::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 12:31:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 12:31:53 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8A8F4427EFC6;
	Mon, 16 Nov 2026 20:31:51 +0800 (CST)
Date: Mon, 16 Nov 2026 20:31:50 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Brian Masney <masneyb@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates
 as an irqchip
Message-ID: <avr3tuaSUxAZObcz@ubuntu>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
 <179443508445.1143992.8301638068435530250.b4-review@b4>
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
In-Reply-To: <179443508445.1143992.8301638068435530250.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEZPR06MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: fecade71-5377-46db-3237-08df43dd9896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|4143699003|56012099006|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YXqvfzh8zsvmqNJzGZ6AW2rLm0OMyp6T8tbPiE1+XRrzYMcgf2chHBx/O4dpFqGV+Ekz7E5q4pdDsgxIQffnS0KuA7Aq2J0nNGr/NVXIASqZmJwHUZ6wNtNWvwjYLbjv8ITFwBLN//7XnV8GBY46G6sCJOLkFgMyEgtKWbCCG0GsG2AITlW9ic1OwBkuFpZfTVBryrJlLuRmGF4Ixvjap/1qOuF/wdbyIcZjUmVmbKdiI3EY1HjkCRfXxu1Gu/yyKS9jQms9Rg6PaYwR2q/GUyALlNisT3kmT8Uket8rvYYqDYAB2EGk+aHavR30KTqldyLi7sN84So1pGs1Y5Ux1mr1A/R/eTfyQWckbq6sd2z9/y2LzSU+5eVEALLny/uA/abAZN/Pv8TToIzPIrD0GWtYqAFqup9xjSc/SsxYL+cu3i/CjLkD+KCz5+5VIGEvQfB1u7zMLYNT1OSyM+P4oJowWgoS43X3dcUDpEiQWQMnewNDmhRkZMoKsErWxpwzQGbG9+gHWzVBEh4Cc/8xerroaRZdcQQZ+hk6vJfLNPROknpK+hOCjv5C7gdolXIMZP4NqHNWOoPYO9tL4F2VxbHkh93bEUYiRO4fdeYauKPpfYxfrvuUktZ6pCAM5kNUl3TZgJIFJIZta6FWm79Z9p8Hf+HDaKbZTCDazvcmEtsqMnlkguC3VkHeCl82N4ZT
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(4143699003)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kuFTGtok5FwWoA9fEtzvZDh+n60Fuh5sxCVM/Fg4Qe3ShDgvTfUK3qJqI/OCp1tSk8ljsvlDhb7dHDm6NtkkT8jNk0U0//ad4AnRtjbOBDroXgu2ogWnUEpm0RAkH3dYO2TypuucuDjM1yawPgQih9jXvZcoaxqwRJbd3wHVWwjfrDZMpLloYjgR+pn+fsBQ3wA7oiQlyj6hW/1J+aBSeYaoVZrdCtenD7UhCo9FbPlSBKK7e/5W+a5/ZbO49VFT3KBmNvXoDpCWfW/Ma7VbuhJ6eFNLqtsVCv7QLOazlXoqs+2O12MHLM51x28fjsHSwxXvK/hpWIvzrmQv+wjWRjP5fwQwR0WLBRnNg4z33RaGItn/2+qiyayqUsLny2AUYpcxnh5jY9jMjWoMJOjZuNlwxuAkcqqtWo7GtvNf2QjDAFHFmLe07mMy6oBRD8j3
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:31:53.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fecade71-5377-46db-3237-08df43dd9896
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5117

Hi Brian,

> The irqchip driver doesn't belong in the clk subsystem, and it needs to
> go in the irqchip subsystem. You can use the auxilary device like what's
> done for the reset driver today.

Thanks, I'll move the IRQ implementation into a new auxiliary driver under
drivers/irqchip/, following the existing reset driver pattern.

The clock driver will register the auxiliary device, and the IRQ driver
will use the parent's regmap and the same CRU DT node. No new DT node or
changes to reset-sky1-audss.c are needed. I'll preserve the CRU power and
IRQ quiescing protections when splitting the implementation.

I'll include this in the next revision.

Best regards,
Jelly
