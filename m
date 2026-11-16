Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794832301;
	b=i6PShKCfx6vIjzUAYfUtfBo9ca5DGEfkqL9Y9VafiY/Byd5jaPsYVjEFDiSDOP20Lq6t
	 6QOyJ4yq4j+26onOWyjKQOdDP9aciXgVN88R2GEoVlqFMNA2b/WC1umOUu4C0KSThQCww
	 aAA8tgn5I3A2GuyjCB24cIaTQzhM907MymCRVSxJA8eBVhN0Nx/1M2sJXceOCABatvAPJ
	 ZqQxaM/PM26aysmuxftcBM5dTkbNm2AYbxkQtmS3Ve5U6raHltXe/EZHbT1jYjc1F1Hg5
	 ZMZUgugpCj+9b5Bi0+Pzjg85NHi6p0LLFvC6IjNqeINyg/dnKtOao7LoIhGT7D5Bzew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832301;
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
	bh=QKLY2jXyrAx2FalvWMFlssOa0JIKEGBWkZkA9F1hY2Y=;
	b=2I2V6driMee8cYYRHckRPDXJ7wDMHK5DRG1aBwpqdi4TQIop0G6+ShFHvBidAysGvUmo
	 4/KSVZkka+YIQ3oCPoJQTK0arWYr/LcG2DBsUYqWQp/i9+YRPaK9Tevaj2VgboDZ0CVfm
	 tl9aCjpwhqcubacTWCWJtHWbwZb29X16yaR4OeJ27/kpwcW/V+GQAV6cwb+KBnR4NevZu
	 uofylFdLmiYQZ5HABl2HBsiJty0np19tkZvsnT1hdhzxo0ZU1LAhuPSOgEncqp4UdVvVF
	 mHfmCiOs15KyJPwiWe3g8aeEpwnoWJPG9EueliX3Ej39/iJlaUmX8vOen8WdUAx8rQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.96
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022096.outbound.protection.outlook.com [40.107.75.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB4606A31C;
	Mon, 16 Nov 2026 12:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yclTqoHlCOtBVHSStUftblHFMXkkgSUldog+Dpf7MTEUJgoULOCZMH8MLMFEy9FM0SLkZWVaIRxYCaB3obO5KqaLKf3S5Q1b+EG4XseZxztx3qBg/L93LfJeAwFaMUCsTkasmC33UIlY2YGZt2D8dg1r7bUl8Rl2yLPSiZWUZ1P2VN2KgzWpUx8yyqydBTW/aZouFrk6nfzJx8hB27X4EJHOKH3dnQpBtOGhTK2KAVPEnYXckr8JhKlM4AICPJDZa06NlgEeVeUiyQFkiObuL9H23h3oYESbYEN99PmJgtyN7/uHt9LmZHGGijzp+BM1O5za4/ZOecvmWrDmipAUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKLY2jXyrAx2FalvWMFlssOa0JIKEGBWkZkA9F1hY2Y=;
 b=nasDwe8mu0HHdkqbQ/uMQNzoSdNsw8Dj1hnS3ZNohsXMg4I1xLqLcZOevcZLklQ2tNmQrGpl7DqZCBesc7D1R5siMqbegfw6sunrTWnX2L9E+iPEzNtkmMXEMTJgTrB479PLiAgUCenT2oCs0GC84ZqbMsT+WpgFfcVuS7sZO7OHxIW+oiPipHOg3FoQdtvT/FL/OXJ2E2VqyUO4DzUF3B/ToKHztw6bxSdLZ/ksT2jfKkwqX5BcDOcVL7dq1buu56zk0KZ9opuDIXv0f0ncSW2jvqxdMWMDQVZLEl4NKeW/azCmgoFBwk0JlkeoH5lnXImSpd24a1bVG7LKsSTejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) by OS8PR06MB7322.apcprd06.prod.outlook.com
 (2603:1096:604:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 12:31:36 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::16) by SI2PR01CA0012.outlook.office365.com
 (2603:1096:4:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:31:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:31:34 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6EBA8427EFC6;
	Mon, 16 Nov 2026 20:31:32 +0800 (CST)
Date: Mon, 16 Nov 2026 20:31:31 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <avr3o+uIV6llV8yw@ubuntu>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
 <20261111-victorious-persimmon-chimera-de9e4e@quoll>
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
In-Reply-To: <20261111-victorious-persimmon-chimera-de9e4e@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|OS8PR06MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb5f2bf-bdcb-46c0-c6af-08df43dd8dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|4143699003|56012099006|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pf0zm+RYeCYxviEVSMwjkWdxPNpyFyEXs1i2C4PIrdnu1whXG2aLTMKMw7fUGnKN0oSEXMUzJDvDrxsCqNiP4e71cBFjyjqX2laUhql6hqApo17hJHgQDNIrEf9m/J4RtF+CwaOOnhtUdwnCxgL6gpaaMcolrK5JL2yVzShzoVLWdXtyd3rynwxo2OL9WCJd8lpAW2TsIaryXFb7IIWaDBVXVeFPDtuEsr8OnPqUnqbd0KjqRPS3ccrdrCXZfbiWHFGYPaTxZLcEQOLP31SObm9PoAaEW5GwrSBe5gQxi0SzFrSTpIdbIIC8DmzHPK11qzVQgzlhnMOtI0lL1Dfg4WypiKYGeFqyaqNm93R7fxdxwZ3yh+FwGgsKLrD1JuP+fohWNlw3GqzOuLXM5Ji1/NquXTAnNgyZ4UZ0/PBgOhY8tRStmjtG+YAgLHck0zeSDItjdMaG1r1wMX+MHAW80pZRaT2PaSfr+S9c+OGewg6buVJOHhMfY0ClVZ1GG+IzXkHR9UzMgoFEhIy38KWNCBCCGcMvNeN3W99iIFIZt4iqvoAbL/aGKuIDXG140Dvdo0cI8RSLBS+xl4yPhzsF3VB4lbgGbx0yCzDYuVlqXIU1ctGdvgRLrDihau3hIhq4bkKt0mD47NP7o/vh1zns5vck/pNlO/SxGNF+kZFQ59qwF0/pEHOJ6ORgCv6+C3tWMa9Zw+8TZwiFVD7PoHjNsw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(56012099006)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q0OxCsUTiZ0PfdzvSfUzksAXy/S0fXobh2bzl7mBwesSt1+VKJPE4g7pXLlV9o8SQ7T/0ZGVqq1oxU1FOyZylJ+pM7la51NREiuSzGlGl28TSHN9EiiwWlU/iUlGuEhu5uON8wXkkSMHJqGjVlAwp3Ibxf3UsVUgHWY+KF7QdJXAGT7DmHfiF7uWOpBK0EAd1OkbpSljKifP7dSuPpWhcYYVKZsNBzyAOz6SgCa9agIh2VF0nKejcMSIUncY06g7HiO6MPTdoGjbg27nm628+SxZcKliX6YA0GAMQFRdIQakkEX4jaLuoJM6dflC73Hn4BCzwnCKLhyifNha/TIwpF8kLbAJtkjAPvc9ZbxzL9jX97+JlH1hOCEwgHyD3RogB3ZH95woU8dqqNzmi67SUHKIofU1kxgIJl4aZbk9Q+zjPe3kXqebQmhGQ7gzKuUY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:31:34.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb5f2bf-bdcb-46c0-c6af-08df43dd8dad
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7322

Hi Krzysztof,

> And everything could be simplified with:
>
> dependentRequired:
>   interrupt-controller: [ interrupts ]

Thanks, I'll use dependentRequired as suggested and drop the redundant
conditional requirement for '#interrupt-cells' in the next revision.

Best regards,
Jelly
