Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004624;
	b=vYM/L+5aMbHxglIcfbM2wJIJSPIWEUgge8aHSyBQB8GMjXVvMc+Brg4L9PodYefx3/bJ
	 MxC/XCYmSGQNmaGqG/K1EvyZzGCyxpJr2gfAfzrIpwfDEo9TeYxSn5lbfecvO+f+FR3qT
	 tO0GELJe6qey0GSmAeDc+rJmL3bjUaf0S9/2Z4nWTEpjHiNVsCSNeEs/BS5GT7eo1yI39
	 7W4E56SmKF9BvKuSUKTezf91ku5Ws3vq2TDJY83I5TXTisi3niz8SDK2QbkoffuJ1tJ2I
	 5V2XxDCr4Bf4WOaWQJY56NqPX79gmTASBWeQG4GyiH4uE62ODM6icOUDInD7Xpaw6KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004624;
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
	bh=wOn/pGEezpQoBd9mjToSeDVf7ZtMRTL7JcTDuGSTQWA=;
	b=AhzPQKQ9JeYSAPWoKFduHTGc68tcha+yqPruYTT8IwbmCYDDbQQrSaqblmKqKXmkHVdk
	 495HXVCozYwyNZv5XKjO6g06C9oTpn/h6CZCL1VCG9hxvVreVv5bpcJocP3jERQI/6pZ5
	 asYHay9hKl8AElgPZMcxedvEmEaTWUTNDSKPcwzz4Vi9SJ3OYZNUhaX5BA3gSp1vK4yPS
	 kxMcPhYqvnqLKJbp7CzbO1hj50KED2yFutqIxvWSkIFywxP0IqLSmnBKFRv6oK7qQzJh6
	 y560+3YeHWNbkuOHSqRBSkA4uc7FJ1oAnwAMsX4fSImIerh8RYAEgNR4LwOjWkejvng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=A+IbsQLr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.71
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88833606A31C;
	Wed, 18 Nov 2026 12:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88833606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=A+IbsQLr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bV4qge6wZO/HXpxyuKa10u63zisSSlrEV1zbRCB+78/LvHb6/zyZaA2kIUqvI+5iTmwjtE/q+6rbrSOMKrQumhd7jGUBdPuaQlPIU4ORioEwQT2SjX0yOgDAVa5IgKpavseV3RgwGbB4BlCkhBORHAt3CeXgNcTATz401sIfT+LHBMcfNnsAfHFVkTxDgBaYSHePRxKhB9AfbDlIo6Dx5DAeEWXKrCH8FtmcrKstYaNzQza22z4w70SmZCz1Q+NqwWMja4BeGdNJ3V5Z4q7YG7mWdUF4aEWEMOzBkzPaXGy/XL2b3ALhNhh8t/ytGkr+7gfKuKknqudFXYHU2nl/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOn/pGEezpQoBd9mjToSeDVf7ZtMRTL7JcTDuGSTQWA=;
 b=ekTXkJ8vvAlwj71frP/cPro0F3kbkDNwPp/Sh8nrzHv42/v3w1IGX8+/3DKYD3FQD7yWTXp4M987hljtPQGQ5b7+P0jgT589AwIK59/z9wZ/YdgU55utDGAveFwwDweIA8wSokFO4CVj3kV5o0YaaxhbN6IqiHxvILmj+MxllwUmbKVs9DgsRYANnbbkIwzFqZlBt0r7M/kovczy74mFOHm31WcJwIk1CNzXtfegoSIACJPE3AFZ0ayU8joOBNdiaZNhw1L0y8RnW8mwSXftox6gECsV8df8E1fa1M6R5FjNo5bjqjMPTdmwt7N5gtkWc0ekJDLUspsBrE/jwWMMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOn/pGEezpQoBd9mjToSeDVf7ZtMRTL7JcTDuGSTQWA=;
 b=A+IbsQLrBILIXSHwbvWeutY6LknaPOQ2EU+jR7PFiZtImm9AzqLAcpUZpfNGxzIW2dA2Kz7xhJb8ZQ1VtAV7beifNQzSdHM3/REbaHC5q/tD+AyNl8C8IfujzpO7OpETAYM5BL7DxOY2KRE/2UNAV/8vK91bP77Vwc1kWKR0Zn2jGoXbNusoDIAoMfDfHIIFkm6l/8ofFPurSwe2ZpqjDE/cleZMR3IILdnTz+95qvurJuYCEWl1lVg5r//qXpD9cU9WAW7xSl0WasIk4x0NwX2NtFpTIX9zmpedEt6VoDHVtuQt9N2b9ikVAuFmABujh29Qr1pBIVmUW1dOgspzLw==
Received: from AS4P192CA0051.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::10)
 by PA2PR10MB8603.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:23:36 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::95) by AS4P192CA0051.outlook.office365.com
 (2603:10a6:20b:658::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 12:23:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 12:23:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:24:18 +0100
Received: from [10.252.6.76] (10.252.6.76) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 13:23:32 +0100
Message-ID: <67ff81c6-fba3-4357-b297-079c2ea2ebc0@foss.st.com>
Date: Wed, 18 Nov 2026 13:23:31 +0100
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
Subject: Re: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
To: Conor Dooley <conor@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
 <20261110-confidant-bundle-08385b99bd78@spud>
 <c4f08bb7-cea5-4f79-8a11-4045220f3b89@foss.st.com>
 <20261112-worsening-yahoo-323ef21dc921@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261112-worsening-yahoo-323ef21dc921@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|PA2PR10MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: a39c2c03-8806-4dfe-b353-08df456ec3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|4143699003|11063799006|56012099006|261102123227099003|261026140227099003|261026121527099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261102124527099003|261009223027099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	UyX5g47/B4ZUEvMXQYORjct/949TyySHPWJ3hz7JHUsUpQ1Z66cBRfmt0/+BQNb6nA2JPQWjAJpUKDreCqcbigtqat6VEJ2sw/nKeDM2d2GuNDWIvlJd6hiast1/Xa7+CO23r7oA0lZRnUG0m7qZWRRC0gBsSRij7V+OnGynm6fnr2jACxmNXAzEdYutgyz2Mfiv8CXrqe+hW31O07Ol0X0OIZMf/KBWCxp90CA/oY8LtpjxRt/X+LJeGMr2gVA2ZBR3hWBuMz+mSEvDg73Sz56xFQH6icplHyt7c6vC+jWXQ2aMMasvcsxc/GNtS1Kxm/lAGxukTBZSzhd+tbIMam2qpuKT+08hH4qbwzxI880F3Y8+EcKvKos4YQGDRJOQY+NemtP7SEx8STtamyJMe7Mq9ixgzm/k+vJkb4PXrlpLb3l18DKKaiZo9yaohOFoUedQtSU47yPl8pCqUwE72ikoO1aJrpHe8VRXOpSBQQW9ESIsrghZV4pvnLAOdcihTmJQMBxE/fFlI903k3WegFWtlzUc5Xcd6lI8EOaHfgpXAoYKlUd+Kwt4rRAXir+9sU/vjAGdmzwx9kXQSnB0oWPXHTyc7FCAC9QSV9AAAs3euNXZ29mcggiGIA6R/8mb2DhH2H2BoHRp3L9M/wzhtSDY9KcUm6y9fMZZMY3J9dU=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(4143699003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261102124527099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MMXbBTi3FpxtQj+51xKZh3CgtpmXbQuKPpQsrjhnhvW5mjVrD2OqOD/L1gwyahGKfuQGXM2gNAkdi0kYT/CJMzuMS0DmrUEWDUQ1yePPItdNCd2gfrfjrxuSPQ6OJe9oOtb3HAU+8QC/qp4QaHUNiQ2GCbiEUepVtVQ9SBxjEx5q7oBRrDvxZodivjkmS3mrVK/GWaAZjIOhrMoaWYeP8nfuQM3RRIkU4QeIV88PxC3V++EhjAo1+KPvF8C8KWnWbSPWW7NPjgdDDu01oR8eoLINtt7qCszXznDImtuzhsWeDEIGlL0ekKUo6LObeTJDFjIfdwvfWWdAs/SG8fVQV1OTPU+kAdhnaD0H0XqoMR+/1i49Wir/8SsPfRXDav/Uz62/v8J6l0isPWxlIfWZpa1bze3n0sZOcQr+Qpms6EDCFlbMktxXMST9yemjv5wu
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:23:34.1595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39c2c03-8806-4dfe-b353-08df456ec3bb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8603

Hi Conor,

On 11/12/26 19:38, Conor Dooley wrote:
> On Thu, Nov 12, 2026 at 09:36:59AM +0100, Gabriel FERNANDEZ wrote:
>> Hi Conor,
>>
>> Thanks for review
>>
>> On 11/10/26 19:54, Conor Dooley wrote:
>>> On Tue, Nov 10, 2026 at 11:42:17AM +0100, Gabriel Fernandez wrote:
>>>> The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
>>>> SYSCFG is described by a clock-controller sub-node of the SYSCFG node.
>>>>
>>>> Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
>>>> and STM32MP25x and not allowed on the other SoCs.
>>>>
>>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>> Why does this need a child node at all, can't the clock controller
>>> properties go straight into this syscon node?
>>>
>>> Cheers,
>>> Conor.
>> I sent a v2 [1] shortly before your reply, which explains this in the
>> commit message, but the question still applies to it, so let me answer
>> here.
>>
>>  From a hardware point of view, the mux inputs could indeed be described
>> in the SYSCFG node. The problem is that this node is a "syscon": when
>> the syscon core creates the regmap of the node (syscon_node_to_regmap()
>> or syscon_regmap_lookup_by_*()), it takes the first clock of the node as
>> the clock of the registers, keeps it prepared and enables/disables it
>> around each register access.
>>
>> The SYSCFG has no clock gate in the RCC, so this first clock would be
>> the LTDC kernel clock, i.e. the first input of the mux. It would then be
>> enabled on every SYSCFG access by all the users of this syscon (PCIe,
>> ComboPHY, Ethernet, OMM...).
> Why are any of these things getting probed before the clock controller?
> I had it in my head that clock initialisation was done super early on,
> before smp even begins, so the clock driver would probe and generate the
> regmap before this can happen?
Only the clock providers declared with CLK_OF_DECLARE() are initialised
that early. Here the SYSCFG node isn't bound to a clock driver but to
the STM32MP2 SYSCFG driver (drivers/soc/st), a platform driver which
populates the USB2 PHY sub-nodes. The mux parents come from the RCC,
which is also a platform driver, with SCMI parents.

That said, your suggestion was the right direction, and Krzysztof asked
for the same on v2. v3 [1] drops the child node and puts the clock
properties in the SYSCFG node. The SYSCFG driver now creates the regmap
itself and registers it with of_syscon_register_regmap() before

populating its sub-nodes and creating the clock device, so the syscon

core doesn't attach the LTDC kernel clock to it.


Best regards,
Gabriel

>
>> Registering our own regmap with of_syscon_register_regmap() from the
>> SYSCFG driver doesn't solve it either: these users reach the SYSCFG
>> through vendor phandles (st,syscon, st,syscfg-amcr) or by compatible,
>> which are not tracked by fw_devlink, so one of them can create the
>> syscon regmap, with the clock, before the SYSCFG driver probes.
>>
>> Apart from adding a dummy clock in first position, which would describe
>> something which doesn't exist in the hardware, I didn't find a way to
>> keep these properties in the SYSCFG node. So the mux is described by a
>> sub-node with its own clock inputs, like the USB2 PHYs of the SYSCFG
>> which are already described as sub-nodes.
>>
>> In v2, the '#clock-cells' property of the SYSCFG node is deprecated, so
>> that the sub-node is the only provider of this clock. No driver ever
>> registered a clock on the SYSCFG node, so this doesn't change anything
>> for existing devicetrees.
>>
>> [1] https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com
>>
>> Best regards,
>>
>> Gabriel
>>
>>
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>>>> index a559f8b03b84..38c844e8f19d 100644
>>>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>>>> @@ -45,6 +45,10 @@ properties:
>>>>      "#size-cells":
>>>>        const: 1
>>>> +  clock-controller:
>>>> +    type: object
>>>> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
>>>> +
>>>>    patternProperties:
>>>>      "^phy@2[48]00$":
>>>>        type: object
>>>> @@ -80,6 +84,7 @@ allOf:
>>>>            - "#address-cells"
>>>>            - "#clock-cells"
>>>>            - "#size-cells"
>>>> +        - clock-controller
>>>>            - phy@2400
>>>>            - phy@2800
>>>>        else:
>>>> @@ -87,6 +92,7 @@ allOf:
>>>>            '#address-cells': false
>>>>            '#clock-cells': false
>>>>            '#size-cells': false
>>>> +        clock-controller: false
>>>>            phy@2400: false
>>>>            phy@2800: false
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
