Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CCF3603E9;
	Wed,  1 Jul 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896361; cv=fail; b=J9DNOQy1SZH1RHYFgHyrZEynWhiEkEbQQ+g/aXWTa3XKLMGriRUKlac7hIg7vRtkLCDsMEo8aMH4OJHeGwKoFBNB9/3xIgOlgK2Q6T96F+I6JBoar9SyMAYmk+kz4V/IjoXEF6iyy70QtV9U1YjORxNy9gHTjyQ6aplFkDGIvJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896361; c=relaxed/simple;
	bh=m2K2x2E1R9OUPZ1bR/xvhck9z3JIyDJrkDDScP1NkbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzfAMxTqLQdlWTVTAuWPYJ5Yl9fr7d94KUHAlIwAQd1I8EGhW8K+rvVSrHyc8LDKsXA57fNWufhkdGrr1vFk6YkyqbMl2ParsHJF7tiQlkse9BCvyPdYI2UmdaU4hwHL6ElyJokUboyO35rQdyWKuFwumrpFjaXhnCytLdM+hec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QPouVZMm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yfT4qyZr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QPouVZMm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yfT4qyZr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNjL7s882835;
	Wed, 1 Jul 2026 03:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VIDDiKd1uUBP5hklo+VMVUHD2GxCbX9QZH2F1xGUNW0=; b=
	QPouVZMmwgVIV0ndPer+ww2LzE2A4YdyffdRhy+qIVVId9gFPOy569Be34g0kGhV
	VmhNCidM0o7Tlg17mIKFX9SW4FLyu2e8McfC2J9q0gPvrunwlRJwR1GYrS8gOm9C
	/T2UnUh96i4i17O8xyex6I2TSpuZCikVeoTYRXP/T0CBJ+YeuhHT7gmyW7Aep+PR
	tkwZO+zoCn1WxLm88V7kqCHPlEnkS0A+KWGDXKVdhbC7cP1xUU74x9PLK46DbnvV
	ihplz9JmXE1UonKZdw3kSmVqfvp8GoJI+Fzkz5EJesec4dMn17u7LitnSOrp1+8H
	M9S8KhDrz3nH1yY9A5MbeQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022105.outbound.protection.outlook.com [52.101.48.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e5r1kgq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 03:59:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=artEEgMro2Isf3LpvYGFmC13yz9THCOrR3B4bC987qpGKiuLBKvQXaxhv0RUM8xW/sl/lF+9hDXjnV5Sq97K6FWgVMMBj8CYz/VVaPeWBB0I/OSxHLp5Enxtvob3n1dvrKdbBXeFawTVx2NIndaW/nqoJ0guQMpDVR7RLbScwhDlt5xnbnH80THMcWvphRA0T3C35sCEtz3AaLA3/ipdquHztQG7etV6VOGaWuZbgFExT7pp8nc5b3SH3mhQ0GY0UuW2AZTH8mtWEDG28HUsqjXgRXvTTeg22hwDTfMnJOrmh6tDTVgtngKd6HtQCaPHo3vtb7FvTDIRzvLN+unsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIDDiKd1uUBP5hklo+VMVUHD2GxCbX9QZH2F1xGUNW0=;
 b=XvQufrU4pw3TizxrBYRIvlqfFIlXo6hVRqkXCjJvBQEF3RtbWtL/QxElm7TswY0xKz7mUQjnwQ82BzK9VQVY72MRiO1HV+7rcivRZPe85gjYidmKWeFGxUTxaSchUrSDWwAXSg0qytWYemWUJ4bo5cOXPYKLbxywIp8ZKns0aVA52sSWCaviynPb29HLDP4tGzEqpCuX8q148abfQeCrZJoRC/JDXU74C4w+SaCVY39t+Xff1WWQfSE5Y0MXRc6IvhB89JgzxlS/KQlEDt2LRUxp/G205P8WdMrrd4AVy9BISsZ6n7f+tRMO4AAfE++CaQfHXaq+yFp6iyu7o3k+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIDDiKd1uUBP5hklo+VMVUHD2GxCbX9QZH2F1xGUNW0=;
 b=yfT4qyZr63yiHD/S9u/pNk/5qG02UiTo/jcjAJwV7ad9wSy7wbxqf+OxiDjz3Dx+0HofFXWc34K5qGtb8mS07ea7fDYZ3X616kUp4o6i5+sRo+/q3NWKPI8jeDDONIp4+j5kCT68rtnSeaz/QWguLU716cs7eelNb/SL/zjcRUU=
Received: from SJ0PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:33b::34)
 by BY5PR19MB3730.namprd19.prod.outlook.com (2603:10b6:a03:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 08:59:09 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:33b:cafe::d) by SJ0PR05CA0029.outlook.office365.com
 (2603:10b6:a03:33b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 08:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.0
 via Frontend Transport; Wed, 1 Jul 2026 08:59:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 99D3A406543;
	Wed,  1 Jul 2026 08:59:06 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 87C7F820244;
	Wed,  1 Jul 2026 08:59:06 +0000 (UTC)
Message-ID: <83e6beb5-9686-4897-b6aa-66266df0edcf@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 09:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: cs2600: Add support for the
 CS2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-2-rf@opensource.cirrus.com>
 <20260701-optimal-honest-earthworm-db18cf@quoll>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260701-optimal-honest-earthworm-db18cf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|BY5PR19MB3730:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c39c56-acc2-4d59-6b77-08ded74f0307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|23010399003|36860700016|18002099003|22082099003|16102099003|4143699003|5023799004|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cPEjej2wvdyj3ioUUcSx8wob1MYK0K4PtBAg63tppGAAqwDoLCJ10qA00+obJi0LeS1wRZ8Y86IYBiQzQbDH5S0wYBqjCWy8h3t4T7EC2y339nDCPiHgYVpQ7g2zDg2RttAr/vz9pKHvlF29PRPsLcm60fIRIfeFwkIlLExqafbYU0003/tlrAhK9x2UAMVBGOoJACaZoGZkKXG4d/u1v1P7ztCbAmqP/5Zk97V3zKWcf6wbApGQehTYBvV+oNxrd93K3uXLcmjFvwg0FWnxUqpxoLw11Cht2FOl1Jt43spToUXfuskqu+5IbydChr3Fm5kFtBb+OL9mft8X5NPoEwxo9KSJuQk/9WFFGtEs2Yo9Dcay6LLLrfsPWXDbY+HsoRvKiuu3nhgrW6U2JzLguzF9cF/GCxXjTHaUUoNkwq8bhr2lXkfXuIVkACKcsuH9mcswBplRVT5bp8w2wTYQdMqFXaHbTJIQ0Ceem25k/4TU898Z4GZFKuGZRCcFUOqrhi6K0SRaBSBMP5YZPcsEbvYVSMdZ840NLO+zYPcxovgdEYwZ7YHQm8kTKYUVXYcdLn0TRaBlADDMwG+oGAeCfWLKX3OJDKONU6IduFuNh/5TGnxyTALYm8sa/pJjKnqz4hJGb2r3rXkQTaTeqt90valCfWvaVigcf1YYBUwwpXQwr/0Cjgm/T/r1j4cXdp7qvxr3ekcp75lPEFEpGmPzlw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(16102099003)(4143699003)(5023799004)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6RBBZ4J1kQhy5OF6kRmKGvF9vyVLkzEiigFaRs3f1FyS+Y4Xc/LmssvrklolicU/TQz0q87VOKbcWtbTKiZ3LR0f7be87v4J/+5tkF2IxRAJMn5izVO2iVgaxANzimH+VCrVJzMvrVx5wOCrFs0vlBJJUKRgRn3f14pajJnMOkkhD+pcBYqSJ6T/Uur6EsKQei5EeAzKp2SOJWO3dKzHN1Sv1fyPvACvqEr6ETWty5c3VQIbrzsP2K16wSBPcNTxHj+Xrx0VGAn0+o5PQrBlZCF8xoXoDNkiWNVtGKblVKpZ7OAY6Nrol8fWaitME37dkLwKpXdNYx3RE885azh/O98K+d0hCVvYkFxYPB8NRLoaIPHNbD950QSPN3f9MzoUtnruPibIuIFJ9vZUmm/gOUYbLzNxmw2BR61pxPdnqVGfTwkFm1ju+ceIOKaQJevR
X-Exchange-RoutingPolicyChecked:
	ZQvYNleEY3VARjA66zpQIS8U2WGJYkym8iD99ImJnnOn9mSe/Oi0aIkTemCpI/e3T/Ri+IjHP3iGMmhNRkkKfmxrDj/UGTtXdAGcuCiizaFdvy+K0huYN1Je+Zhh99zSakDpbFNbM8SrwYw54Wci8LY37YB4LoXqGgWv0G6owxHj1p8IjJfqUov8kEqxAai2Z5QvjzLxloe622nm7JngkLbTtbaRAyuiVXJG2itvOrGKhxXrzrliX30P/ds87sAoROaATuFF3BqEir3N9YkW2EiJ/puqusUc+tgcvsyWfDXFoc7d6xSEOJ9sHpRY3oAcaPwPKvyL1DtHFCEAwKOpfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:59:08.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c39c56-acc2-4d59-6b77-08ded74f0307
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3730
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXwPp+azH4U3t5
 PdnZt0aGlSL8kmp11phAjI6pXf6BdAH6/JKvMY7vMTJg9SpC0I47q0g2dFsFfpfrJZZjhdawbnW
 mNXbseY3t75pgsS7aFOWo/yE3CfLvLE=
X-Proofpoint-ORIG-GUID: 5m9Wp8A_qE2NSH9LFCu0yr-dRYm0E2cI
X-Proofpoint-GUID: 5m9Wp8A_qE2NSH9LFCu0yr-dRYm0E2cI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXytFrdS5CV+pA
 UIYbRqBaGGhW/lv9BksPXE4QZRNysjCeOTILMMV1hCAOKW3C5J2oxVzlQZdmoyvzFOGU32qBL/7
 v8CrjrerrVTfc0OJOphbdAf2bssYt8LbNF8sI3PV9PwrYCy0VyQdpCjmU6SxPtTxwdc7TIT/rz/
 gdsCT7mCbSlaDNlH4YDQ2Ay4Z4b/0k9ukPn+ng+3k3VbU+RhLviCHvEcr4VmlmRbGCsRgfLYXn9
 SPHZgEbLHO7fN4qh29j9SIBqRKvSWK6++rVFTkPQVbG6OxmxkePzwHUFvoN2COnXrnBAMtvknMV
 swqIkn07hx+Rjnu2qTsoH2VNm5hOJ23QsliL3lvgDNakEHgnvxJTEUo7/GfW187zxm1nYsizzEo
 THsRdSmpUY1WNiVI5rtlZNrO6l52IM/gCxJHBoLP3/Eme6LL+7o8JGuSVBVXeC/mjz1/yPVaMEV
 gf+fHWrhY3/FG4j44pg==
X-Authority-Analysis: v=2.4 cv=eLojSnp1 c=1 sm=1 tr=0 ts=6a44d6e3 cx=c_pps
 a=mtSqpVOEitwwaRRTiGNoZQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=KKAkSRfTAAAA:8 a=iT2qJT8EYCgS6yjfehUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Reason: safe

On 01/07/2026 7:48 am, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 04:55:47PM +0100, Richard Fitzgerald wrote:
>> From: Paul Handrigan <paulha@opensource.cirrus.com>
>>
>> Add device tree schema for the Cirrus Logic CS2600 clock generator.
>>
>> The majority of the schema is typical clock, power and I2C
>> properties.
>>
>> Passes dt_binding_check:
>> make dt_binding_check DT_SCHEMA_FILES=clock/cirrus,cs2600.yaml
>>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>    CHKDT   ./Documentation/devicetree/bindings
>>    LINT    ./Documentation/devicetree/bindings
>>    STYLE   ./Documentation/devicetree/bindings
>>    DTEX    Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dts
>>    DTC [C] Documentation/devicetree/bindings/clock/cirrus,cs2600.example.dtb
> 
> Why is this in the commit msg? What is its purpose? Do you see any of
> this in any commits?
>

Purpose is to inform people that I ran the check and it passes.
If you don't want that information I'm fine with that. I'll leave it out
in V7.

> 
>>
>> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
>> Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>
>> Changes in V6:
>> - Fixed clock naming in descriptions to match datasheet.
>> - Fixed clock-names property values to match datasheet names.
>>
>> - Added cirrus,internal-oscillator boolean to flag that the internal
>>    oscillator is the clock source. Previously the driver inferred this
>>    if clock-names did not contain "ref_clk_in", but this made it difficult
>>    to enforce dts correctness because there was no way to tell whether
>>    ref_clk_in was intentionally or accidentally missing.
>>
>> - Changed the cirrus,clock-mode enum property into two booleans, since
>>    effectively it was two separate features masquerading as an enum:
>>    - cirrus,smart-mode present to enable smart mode.
>>    - cirrus,smart-mode-clkin-only to enable a feature where the output will
>>      be suppressed until both input clocks are present.
>>
>> - Changes to cirrus,aux-output-source property:
>>      - Renamed to cirrus,aux1-output-source because it's for the AUX1 pin.
>>      - Added more options.
>>      - Renamed the "no_clkin" option to "clkin_missing".
>>      - Reformatted the description as a list instead of one long sentence.
>>
>> - Changed clock-names from an enum to an ordered list of const.
>>    This implicitly ensures ref_clk_in is always required.
>>
>> - Added properties to invert bclk and fsync outputs.
>> - Added property cirrus,fsync-duty-cycles.
>> - Added #clock-cells and vdd-supply to the list of required properies.
>> - Rewritten description description section.
>> - Reordered the property list to put common properties before custom
>>    cirrus properties.
>> - Added more examples.
>> - Added header file to define the clock indexes for DT consumers of the
>>    CS2600 clocks.
>>
>>   Note:
>>   V5 was Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>   but I haven't carried this forward because the changes in V6 are large.
> 
> Dropping my tag is right thing to do, but making significant changes to
> hardware at v6 is very odd. Bindings represent here the hardware, so how
> is that v5 had one view of hardware and the next revision rewrites it
> completely.
>
> Probably answer - v5 was heavily incomplete - but we do ask to make it
> complete in the first place (see writing bindings), so all my previous
> review was waste of time.

Unfortunately I can't do anything about previous versions. I apologize
on behalf of Cirrus that they could have been better. I've made what I
think are improvements in V6.

V5 was sent in Dec 2024. That's over a year to (a) find issues with V5
and (b) incorporate learnings from non-Linux products about how the
CS2600 will be used by manufacturers.

> 
> This will wait for review.
> 
>> +examples:
>> +  - |
>> +    /* Smart mode */
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      clock-controller@2c {
>> +        compatible = "cirrus,cs2600";
>> +        reg = <0x2c>;
>> +        #clock-cells = <1>;
>> +        clocks = <&xtl_clk>, <&sync_clock>;
>> +        clock-names = "ref_clk_in", "clk_in";
>> +        vdd-supply = <&vreg>;
>> +        cirrus,smart-mode;
>> +      };
>> +    };
>> +
> 
> Two examples max.
> 

That's an unfortunate rule. But if that's the rule I'll trim it
to 2.

> Best regards,
> Krzysztof
> 

