Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793894183;
	b=qGNsgcYdLozDhC1NRuO1JhPGOCPird/+f1ehmc3pwLB55pODmc5kMqnTTtKdutS4Gsvj
	 9KfTHPE7z8VoIIUrU1QywvVlimDN1ym6n9Rmr5sYHR26nsJwzlSCp9FdLqwTue0q9OCOR
	 Ot6kpXo7vNosLHqwqJ/lOWmmaCWLt6fendexg+wN1Xt6cEw3u1vhmGAAELhJEVD+XjpAO
	 RpdneojXMS2WGDM9DvV3cdekYWbQspLQe7PD6662BcIddFnyasRNO/u0N8u3mK/H+BUls
	 PUjCe+V1SobzLjm98QS3LfxCjYN1j+xUPYPfWrklD2owdYf/VRPcz8YdgubktivYiDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894183;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
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
	bh=2ipUJLWuDWY705aea4BTYyXx+OesFHC+PUT9Xug0NyM=;
	b=ucUkZPzSkDaqHEL+OJwZ4quDMjqT4iJ1rt1DJhUSrOO2nS62nCwPlx05pVsj/Zc4K5+Y
	 QpxVomyAtDE6wKBcpI9TMB+BkCvtwJtYXpZN4tBkV3GQv7yTrjMN749MWy4O8NBLEStNl
	 zAhOqu97kANHjBUf+P2vFX6/Xf6VhM8cJtoKdl6DWEMzZwNUBW5BK+3EiRed9xuWtlr6z
	 rg6dE7DMVyzgN3Ao1wc4TFvSqtjHzimjlsqF5w1S5yexO+zCUlykIohf77drLYkxtq7AY
	 fQbfEo+q3JjcqkZ8Aja21Bc9l94xKyAihTzv/fLi0RyM4eVN69deJfP2AH3B7mLo/KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=AAi8ytgr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.20
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313D606E571;
	Thu,  5 Nov 2026 15:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5313D606E571
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=AAi8ytgr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMIkStuSkNEUZTIUX6XB5l7OdLb2GxOm2t7ag4Oq0v49hQhrjp0DNrXSxJMkn07YVSLy7v03WEuE0Yhwz2bLKiYi8s/4uXY1Tq70QQjzWD7x3tPP+fhcoC+UtFfGoaVJU6d3QejZZNmJawAoyobXXKIHDM6fDXcdOMwx0TnYkQbvDbWQzIQqCMhz51DC8FnfGagUj1PXqCuRZwcevVzstYf4RXgKEm8pcnBGIetQxl787X1/l1y1oLQ/PVyZ4GGzQYQbRXXUmung9gSd8TXS79UPJMhLiQLkH0jh4UqmUFePXjNvzT59FAw6M6n3SE5e7BH2UAEJLlM+XulJAIZ/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ipUJLWuDWY705aea4BTYyXx+OesFHC+PUT9Xug0NyM=;
 b=iiNvlZ8EP8THaik+cjAbyxd5rJnbnPpptgjDs+xUPMP4jmVa6eWipUqHCnEQOOYX4SRIJxz9+5dXD7I+n9lSr30jvZVKpxyJTusOe8saHKoDGINktsFVMrAno0Q0RbvIeMQsx94Jt5KmZ1u0w3ygAscQI6ovD1WuEYnlnvJ57EdVFqGP+QGdMlhkv0ByomsckJvKoevnelJlDfwa+mhl6U3VVPMlaroc5x6E9V5t9hUYc4ngH/pM3bVTvhTDP5xZTEWVQYS4yYKL59LU1t4Oy74mU+IpKLNpVrKr2qlvBa2xMwLHXj4qjCrqfxMJCkaupM0Luu/vQE5nnP175V4dWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ipUJLWuDWY705aea4BTYyXx+OesFHC+PUT9Xug0NyM=;
 b=AAi8ytgrle8ksyOVVscIXm42C29YRMZGovzOs86568WR4TNt7NpVtiOTCjjrl6KELqmYlgGxp7ADax/0RYEmliQkFZAttlE2X59/Z9wUd1h3+Ioxrk9WvohVHheCmHcSg5Gp6fXKzatHWeCaxRTTmWzMihf6+FHZzBb0BbYNEQGNrn9prBBa03mz/UFs5icPQCkc9Syc0ICnemuI2c4+/JRy3O9Fg8AkneGP02MYwtNClbir3X7jpaP7tZYYmXuejbLZgqnSKLi/xQktuhUoIrZ4ta1Cq4KHy9UKmntyOSJFVMbENC9Sx/xnrBB0QOra2jmIPBiESU+zoLaS1Fvdzg==
Received: from DU6P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::12)
 by GV1PR10MB6025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:8f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 15:56:16 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::37) by DU6P191CA0012.outlook.office365.com
 (2603:10a6:10:540::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 15:56:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 15:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 16:56:45 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 16:56:14 +0100
Message-ID: <482bb998-9468-41dc-998d-29057caf48b4@foss.st.com>
Date: Thu, 5 Nov 2026 16:56:14 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: stm32mp25: add clock for D3 peripherals
 allocation for Cortex-CM0
To: Brian Masney <masneyb@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gwenael Treuveur <gwenael.treuveur@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-5-398d348ea8fd@foss.st.com>
 <179383310949.724795.2248553531492904727.b4-review@b4>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <179383310949.724795.2248553531492904727.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|GV1PR10MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 3766ff10-daad-4b23-e28a-08df3b5552f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	asWTUEsYwCm7vcGOkeIE9F/JraMXZ/CTinC6czOABDa1sxIOrkHvt9ilVFYryBHhvHQNyof31HoQVFQ3eW/iaHhJSN2IUxMBI1PbBqN1HPdg8Vl9clCgjYe8G99dSMhscHqFJQM/VIwFi6+P2DTxkqTboMjfXGJedqMFQ1296cOWX/fSUYAYfpRjapydKm0UKV6pWjEXAttbmh2gEsFHSQ98anCdzg3vDz1erwivFWG1d6VoFLQ8n8oHgJ8L1c78/Fak2Bb7rvor3VW6eswdjK4vWQQ1dzZ+zOBNdm42PbCFnequovrEpP1iORRT6UYhNgo5Q3vvRMIoq/JvrjbsxTK80Ws3LhCbsNw2eQAAU+fjiJRs4f16q8LhRLkI8kaTCGw/dcHZlmC//skkEBBXONnk3p1ZKAcsDrp2iMwR742jC0ECOVrnWkJm4rfgYB+sA3geJtNxpG9Zj46Vwzv4ICnF8l7sz8Va9M/igmHZheI598YtmRcnIabx3Ar60f+ZHjlYTjz6u9JHQ24zPJRbvB4kUF4raMHJ5cu9ukJWCJvWv/0h0fdHKCNLj013KAkbvn0UAxN8fOz1+B8uCr0wfQtKL4Hsuq6PwI7NgeEXMXxXlW5eNptTJcRChYAtFmyWweXgRdC0HYMoMEbZurc6P7ABuZwcaek+nb8mJMa26JXnvDrXE16wnUwjxN90tr+OqpT5evNWsH5gFncS8+Q5Mw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KXxnzV5vA1FVZegeDJn2j/ia284Lb+SStfJcZdreib9Z9xKnjgBFOp5tgqwsplQ4yh391g3tKxnOuo/Y+BWGL/6tTMW76kh8hEBLQmaDDryrCfEAmSfDbhZnUtml2OcRNX4sFlQkUdvgejaSZISadvnXL9zF/50/eJkC96xqgyX3/ful8KkmbOzSB8buFUbKi7NfmkXa/5QOLicWPRd8u32mqlnKFYRXPRlWMR+WgF1CRDlaoGvVLIm+j09aEVGKMgF6m/UHLgvGWGjEZeHsySaOkOgxO6pQDCivOli4EvoakctyVF1Dbh70tOCPERrSbw1J31irorBhu1WguAUIMh5WEVhVZ2ZhsXTWnxUDDhEWjqg+MnkhBno0NiLf+nlSeYmcPCpOrWkD64omXDvT9uFcmbB8iMZkaVEcEdZVeNKR8y6B8LMC+hsv6Ma+JuGx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:56:15.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3766ff10-daad-4b23-e28a-08df3b5552f8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6025

Hi Brian, thanks for the review!


On 11/4/26 23:58, Brian Masney wrote:
> Hi Gabriel,
>
>> GATE_<IP>AM allows to enable the Autonomous Mode of the D3 peripherals.
>> GATE_<IP>C3 allows to enable the allocation of the peripherals to CPU3.
>>
>> For any D3 peripheral allocated to CPU3 (CPU3 domain is used and AMEN),
>> MSIKERON must be set to allow the Stop modes. That is why all the
>> autonomous clocks have the MSI KER clock as their parent.
>>
>> Add the HSI KER, HSE KER and MSI KER clocks as new RCC input clocks and
>> register the C3 reset.
>>
>> Update the number of clocks of the provider to cover the new IDs.
>>
>> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   drivers/clk/stm32/clk-stm32mp25.c | 176 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 175 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
>> index 59abac0cc56a..3199cf18f4d3 100644
>> --- a/drivers/clk/stm32/clk-stm32mp25.c
>> +++ b/drivers/clk/stm32/clk-stm32mp25.c
>> @@ -18,7 +18,7 @@
>>   #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>>   
>>   /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
>> -#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
>> +#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
>>   
>>   /* Clock security definition */
>>   #define SECF_NONE		-1
>> @@ -38,6 +38,7 @@
>>   /* Register: RIFSC_SEMCR */
>>   #define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
>>   
>> +#define MP25_RIF_RCC_C3		72
>>   #define MP25_RIF_RCC_IS2M	107
>>   #define MP25_RIF_RCC_MCO1	108
>>   #define MP25_RIF_RCC_MCO2	109
>> @@ -126,6 +127,9 @@ enum {
>>   	TIMG2,
>>   	PLL3,
>>   	DSI_TXBYTE,
>> +	HSI_KER_ON,
>> +	HSE_KER_ON,
>> +	MSI_KER_ON,
>>   };
>>   
>>   static const struct clk_parent_data adc12_src[] = {
>> @@ -225,6 +229,10 @@ enum enum_gate_cfg {
>>   	GATE_ADC12,
>>   	GATE_ADC3,
>>   	GATE_ADF1,
>> +	GATE_ADF1AM,
>> +	GATE_ADF1C3,
>> +	GATE_C3,
>> +	GATE_C3AM,
>>   	GATE_CCI,
>>   	GATE_CRC,
>>   	GATE_CRYP1,
>> @@ -249,6 +257,7 @@ enum enum_gate_cfg {
>>   	GATE_ETHSWMAC,
>>   	GATE_ETHSWREF,
>>   	GATE_FDCAN,
>> +	GATE_GPIOZC3,
>>   	GATE_GPU,
>>   	GATE_HASH,
>>   	GATE_HDP,
>> @@ -260,22 +269,35 @@ enum enum_gate_cfg {
>>   	GATE_I2C6,
>>   	GATE_I2C7,
>>   	GATE_I2C8,
>> +	GATE_I2C8AM,
>> +	GATE_I2C8C3,
>>   	GATE_I3C1,
>>   	GATE_I3C2,
>>   	GATE_I3C3,
>>   	GATE_I3C4,
>> +	GATE_I3C4AM,
>> +	GATE_I3C4C3,
>>   	GATE_IS2M,
>>   	GATE_IWDG1,
>>   	GATE_IWDG2,
>>   	GATE_IWDG3,
>>   	GATE_IWDG4,
>>   	GATE_IWDG5,
>> +	GATE_LPDMAC3,
>>   	GATE_LPTIM1,
>>   	GATE_LPTIM2,
>>   	GATE_LPTIM3,
>> +	GATE_LPTIM3AM,
>> +	GATE_LPTIM3C3,
>>   	GATE_LPTIM4,
>> +	GATE_LPTIM4AM,
>> +	GATE_LPTIM4C3,
>>   	GATE_LPTIM5,
>> +	GATE_LPTIM5AM,
>> +	GATE_LPTIM5C3,
>>   	GATE_LPUART1,
>> +	GATE_LPUART1AM,
>> +	GATE_LPUART1C3,
>>   	GATE_LTDC,
>>   	GATE_LVDS,
>>   	GATE_MCO1,
>> @@ -285,6 +307,7 @@ enum enum_gate_cfg {
>>   	GATE_PCIE,
>>   	GATE_PKA,
>>   	GATE_RNG,
>> +	GATE_RTCC3,
>>   	GATE_SAES,
>>   	GATE_SAI1,
>>   	GATE_SAI2,
>> @@ -303,6 +326,8 @@ enum enum_gate_cfg {
>>   	GATE_SPI6,
>>   	GATE_SPI7,
>>   	GATE_SPI8,
>> +	GATE_SPI8AM,
>> +	GATE_SPI8C3,
>>   	GATE_TIM1,
>>   	GATE_TIM10,
>>   	GATE_TIM11,
>> @@ -354,6 +379,10 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>>   	GATE_CFG(GATE_ADC12,		RCC_ADC12CFGR,		1,	0),
>>   	GATE_CFG(GATE_ADC3,		RCC_ADC3CFGR,		1,	0),
>>   	GATE_CFG(GATE_ADF1,		RCC_ADF1CFGR,		1,	0),
>> +	GATE_CFG(GATE_ADF1AM,		RCC_ADF1CFGR,		3,	0),
>> +	GATE_CFG(GATE_ADF1C3,		RCC_C3CFGR,		23,	0),
>> +	GATE_CFG(GATE_C3,		RCC_C3CFGR,		1,	0),
>> +	GATE_CFG(GATE_C3AM,		RCC_C3CFGR,		3,	0),
>>   	GATE_CFG(GATE_CCI,		RCC_CCICFGR,		1,	0),
>>   	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
>>   	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
>> @@ -378,6 +407,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>>   	GATE_CFG(GATE_ETHSWMAC,		RCC_ETHSWCFGR,		1,	0),
>>   	GATE_CFG(GATE_ETHSWREF,		RCC_ETHSWCFGR,		21,	0),
>>   	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
>> +	GATE_CFG(GATE_GPIOZC3,		RCC_C3CFGR,		24,	0),
>>   	GATE_CFG(GATE_GPU,		RCC_GPUCFGR,		1,	0),
>>   	GATE_CFG(GATE_HASH,		RCC_HASHCFGR,		1,	0),
>>   	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
>> @@ -389,22 +419,35 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>>   	GATE_CFG(GATE_I2C6,		RCC_I2C6CFGR,		1,	0),
>>   	GATE_CFG(GATE_I2C7,		RCC_I2C7CFGR,		1,	0),
>>   	GATE_CFG(GATE_I2C8,		RCC_I2C8CFGR,		1,	0),
>> +	GATE_CFG(GATE_I2C8AM,		RCC_I2C8CFGR,		3,	0),
>> +	GATE_CFG(GATE_I2C8C3,		RCC_C3CFGR,		21,	0),
>>   	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
>>   	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
>>   	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
>>   	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
>> +	GATE_CFG(GATE_I3C4AM,		RCC_I3C4CFGR,		3,	0),
>> +	GATE_CFG(GATE_I3C4C3,		RCC_C3CFGR,		27,	0),
>>   	GATE_CFG(GATE_IS2M,		RCC_IS2MCFGR,		1,	0),
>>   	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
>>   	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
>>   	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
>>   	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
>>   	GATE_CFG(GATE_IWDG5,		RCC_IWDG5CFGR,		1,	0),
>> +	GATE_CFG(GATE_LPDMAC3,		RCC_C3CFGR,		25,	0),
>>   	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
>>   	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
>>   	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
>> +	GATE_CFG(GATE_LPTIM3AM,		RCC_LPTIM3CFGR,		3,	0),
>> +	GATE_CFG(GATE_LPTIM3C3,		RCC_C3CFGR,		16,	0),
>>   	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
>> +	GATE_CFG(GATE_LPTIM4AM,		RCC_LPTIM4CFGR,		3,	0),
>> +	GATE_CFG(GATE_LPTIM4C3,		RCC_C3CFGR,		17,	0),
>>   	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
>> +	GATE_CFG(GATE_LPTIM5AM,		RCC_LPTIM5CFGR,		3,	0),
>> +	GATE_CFG(GATE_LPTIM5C3,		RCC_C3CFGR,		18,	0),
>>   	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
>> +	GATE_CFG(GATE_LPUART1AM,	RCC_LPUART1CFGR,	3,	0),
>> +	GATE_CFG(GATE_LPUART1C3,	RCC_C3CFGR,		20,	0),
>>   	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
>>   	GATE_CFG(GATE_LVDS,		RCC_LVDSCFGR,		1,	0),
>>   	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
>> @@ -413,6 +456,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>>   	GATE_CFG(GATE_OSPIIOM,		RCC_OSPIIOMCFGR,	1,	0),
>>   	GATE_CFG(GATE_PCIE,		RCC_PCIECFGR,		1,	0),
>>   	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
>> +	GATE_CFG(GATE_RTCC3,		RCC_C3CFGR,		26,	0),
> In enum_gate_cfg, GATE_RTCC3 comes after GATE_RNG, but here it is
> placed before GATE_RNG. Keep the same order.
ok
>
>>   	GATE_CFG(GATE_RNG,		RCC_RNGCFGR,		1,	0),
>>   	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
>>   	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
>> @@ -432,6 +476,8 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>>   	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
>>   	GATE_CFG(GATE_SPI7,		RCC_SPI7CFGR,		1,	0),
>>   	GATE_CFG(GATE_SPI8,		RCC_SPI8CFGR,		1,	0),
>> +	GATE_CFG(GATE_SPI8AM,		RCC_SPI8CFGR,		3,	0),
>> +	GATE_CFG(GATE_SPI8C3,		RCC_C3CFGR,		19,	0),
>>   	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
>>   	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
>>   	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
>> @@ -518,6 +564,77 @@ static struct clk_stm32_gate ck_ker_adf1 = {
>>   	.hw.init = CLK_HW_INIT_INDEX("ck_ker_adf1", FLEXGEN_42, &clk_stm32_gate_ops, 0),
>>   };
>>   
>> +static struct clk_stm32_gate ck_ker_adf1_am = {
>> +	.gate_id = GATE_ADF1AM,
>> +	.hw.init = CLK_HW_INIT_HW("ck_ker_adf1_am", &ck_ker_adf1.hw, &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +/* C3 */
>> +static struct clk_stm32_gate ck_cpu3 = {
>> +	.gate_id = GATE_C3,
>> +	.hw.init = CLK_HW_INIT_INDEX("ck_cpu3", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
>> +};
>> +
>> +static struct clk_stm32_gate ck_cpu3_am = {
>> +	.gate_id = GATE_C3AM,
>> +	.hw.init = CLK_HW_INIT_HW("ck_cpu3_am", &ck_cpu3.hw, &clk_stm32_gate_ops, 0),
> Should these two clocks have CLK_IGNORE_UNUSED? set?
>
> Brian
No, I don't think so.

These clocks feed the Cortex-M0+ (CPU3), which sits in the D3
(SmartRun) power domain. The remoteproc driver enables ck_cpu3 and
ck_cpu3_am before starting the Cortex-M0+, and gates them again when
the Cortex-M0+ is stopped.

Because these clocks have a real consumer, CLK_IGNORE_UNUSED isn't
needed. If the Cortex-M0+ isn't used, we actually want
clk_disable_unused() to gate them and save power.

Best regards,
Gabriel

