Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793251124;
	b=aNCP18B7A9Lgc4xnvaz+f0Fq6Z4fb4Akd9ku3Ehrs9KVdInEH93wTzafDbXJvaShlMdX
	 nE34C1JkZx6/QKMHsY1W7Rramw6Ok+en6FZ/NIWgSYBpsiEuEAFYuidOKK7L0+e0IbVaB
	 Soev523OV5k+XIYl36aruGGZ7qQUAaO3AKp0io89lcX+6jB72Od0nhrlkn5kRTU8I/crV
	 BkCE01R62BS53CY98XooGgDrdCqTOFaBPA0lbA7iraB1WROStnQq9PJ8H+oj4gMdOlf+c
	 F+mWxnhWM/JxDlaepLwZl95kqnpNk20U+eCDyhH4AXevUBtfLEcUMRmPYkXa9HYVZtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251124;
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
	bh=nN2H5DGgqfsM6LhOOow1rNzEnF6r4+OX8KtRg8lWZs8=;
	b=rpTxhdtVDp3hcuVTO00/InCFdVNdVeF2INEoXo2eF3Jvn98eh+OZLqf8AYjl9i1ePOwd
	 XUVV8+LNT/SlwivjSBpbzz8Nf3RbtDqV01SDogDR1xtTDcXrAI9JjObG1kEhgqwyNkRh0
	 4P+cx8aq5ZMXLL6whUMpCvxtC6yEhbTwkxxyvWY0qdB79mjvZT+ZSdTnTyJhStGyAfqVE
	 6DtsgL8Xbb///CSCZ5bTKp4zWOE4ydyjEKQjuohDjCXnCDaBfHlyk1lfCWH7DVq7DPSqi
	 iD1gFcNfaaKKL/f30POxlPKqqrW2ri8KqCvyqRq3Aburi1hqWWUZziukrT3fLufymXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.89
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022089.outbound.protection.outlook.com [52.101.126.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABB606A31A;
	Thu, 29 Oct 2026 05:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23ABB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvXOUxVetVzXyIrygtiMXbzV3o5kOmMQDIgsqsA28E5LW/VjUg7STzF+/khO6ZmZJ2mUNk9vTuNr/EmkyQFLCqxYt5unmsXa6F5SOexNQWj48q8ZY8leeWICczb27IMJ2iV3YCwKqfW8dKWXRU+1rrGvAnVzm6a+A8U5WhwemaXNdhUfd+flGE9b5SK7z9pt5K5oj5sU+ufCydG+F5RzkfhCdsUmvg4/pYBHqUQldsWnAouasN5AUvgp3srIpjCQEbsrYlecjKJbf+qpotMuH5KxA7vjXs1PqKkCppgPcyHvnOaKYfIu2Y5sCMGK7TJWX5odkFjTqs/h2sTfwqr+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN2H5DGgqfsM6LhOOow1rNzEnF6r4+OX8KtRg8lWZs8=;
 b=ZEq7dNx3TfmAwyWqgSYuqjahSoXjf3dn+Inx1XlcXJCcs0uShEjaHkyye4xnUUlRm68cRgZwLpeT6LRw8jAAVewv7pJeZrt23X07YyOvdiifZ7X+ZFNXZERv5tj8NTKl1gj38xKXkWwnhNyv2RaaJ4I2vH3QVK7rtJQ2OhVpjscYFZr9aM+B8RUaXRhRsuhFU8a7YkTzDxU4kFoTcYXUDFPC66lLUcsjyhhk158pp1Jg99ai3Ye99vwsPklEAvISnyIA7rZN8BpGfr1RZPAFvAdtfKz1hIarek8Nqz0Uag+73qnk+HhwD0XJBTVd8Kdtmyxg88pXMTchyOVVNiZ9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0003.jpnprd01.prod.outlook.com (2603:1096:604:dc::8)
 by OSQPR06MB7183.apcprd06.prod.outlook.com (2603:1096:604:295::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:18:38 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:dc:cafe::4a) by OS3PR01CA0003.outlook.office365.com
 (2603:1096:604:dc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 05:18:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 05:18:37 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C744D4102B51;
	Thu, 29 Oct 2026 13:18:35 +0800 (CST)
Date: Thu, 29 Oct 2026 13:18:34 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auLXKpDj9xBTKC04@ubuntu>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-5-Jelly.Jia@cixtech.com>
 <auInKn0Z7TUP8yl7@lizhi-Precision-Tower-5810>
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
In-Reply-To: <auInKn0Z7TUP8yl7@lizhi-Precision-Tower-5810>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|OSQPR06MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f236fd3-481d-4f28-4a9c-08df357c1660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s7obFAYCo7GQTs/nObuqL3QMRKZlChBSVRPxKJl37BjEaxubzXxnnMw0hwSKzNd5JvYoOTq6CXkuj9j8s64bX0aLdHAW3EQESKSJUI2NCXdzwPWHmUtIKR4xaofQSxI/CnGIwNcQnmuTN/9xyy63uagf2A1Jg79Jqt80mTyOj2ugYbdceqXzFlrXar9fB4JUH6y3PdpGSSBAfKebph8ZJRczBa2W/O/NBCXbpoSS+BZh5vKaG6MMc0Wb5BPwmo1SnSGQJ98JTsL5raAkSQEcrVnGjutRf2jqMLROWcBOXUDHLTqqyLcdi+ZKf/LJDebDNuM0DBC/jOpv3Tv6S0zvavydpCMhlya0JYU5m4FHE5D1t+xjIPCTBhXNLXxAGJeMwu3ZNeoqa1MVz9ksWtUYoWe0IzR+ZnXvm/WphOLhIZgQLdDQ0Qiq34UJNNiyEgnUTBiFLq9smh5qPXd1AthU468N5SxWH3pbseD4Let/njhH0bpBJEqCyya51a4qszRc8A7wWIvJ9YgIB+DKHPGjQTAXPbQ4HCf0NmclPeexiKwnHZqRR9/xYDkx0kwkxsFgoDIXk4/WvZf06UbNgRvqlFsG8SM3eIbG3z33DjRuA9Edmh0UFiV/BGu/oFqJmjwhK8wnzl3wIiVJkzBn/uuZ3+LzA0l7WaCCOEglDsge3JbpNqa7o+Ao46EosbbejFgcyd2cSLjPFUVtoviaX2dwjw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ypBSLJAiRVpI1920V7IyiGKDWuxWrPlCZG5lqGEoKtYCJIev0CYWtUxhDCmoP9N/0BC4oJO5Ai3FKJ+9qZiZH4EWWJUpT4Xg2mIdZ2hC4ChveXTendFUQB9RYAHFYEddu5Yeot0iBsKRvB+d4vj9whsLQlDTYVJWi9GMxTniVWR+HYW/xHk2Q1A04SXCKBSm8p3PyRGui9kbDx4827+LaRaW2szB9Fu+3hg4m4jSdZIGI/rUjiIhU7mXaGerYfpnFBSKq+cjTLqL79gL6F5sOtjY29kxBUndORBE/NeBUTx3Vc8uG7MgQT6o6B7YAvUVRtxhTUHZ0Rh5xUU0BkLpdUNpOrlyO6Flg0XDsgAu0WQlR/4Imaba9Axna452kpCd9NipG2mUFCJNWLuTIjI3CHJ8/tM8Hwy6CS9lZk9K+btHWX67rYDw36USkprL63Im
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:18:37.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f236fd3-481d-4f28-4a9c-08df357c1660
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7183

Hi Frank,

On Wed, Oct 28, 2026 at 12:47:38PM -0400, Frank Li wrote:
> dma-channel-mask is u32 array. If nchan >= 32, you should check
> dma-channel-mask[1].

Thanks for reviewing. Yes, the common property is a u32 array.
For DMA-350, however, the TRM specifies:
"Number of DMA channels between 1 and 8 (NUM_CHANNELS)".

A single u32 therefore covers all supported channels, and patch 3/5
also restricts dma-channel-mask to maxItems: 1.

Best regards,
Jelly
