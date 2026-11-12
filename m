Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472625;
	b=idWuknWcTJ4vo+hwysZNBCdj35073kLe8dvkkVci8yOy/vK909PHgki3nzTuHwVrBJwd
	 uaqSsRIPH/PaMcWjGN7USBpKJAy2n1ghhBtPSByQzZGTr9L662OaVksIqimA/fwzGnFQp
	 lsliv33UoUjXys4SToElIJufjsLBpUGeSqPMrj2qNPAjk70Ey9lcG94j4/yq+9KpQMBQl
	 EmZPMCooOeNRY9jDxDnCLWZzKq7C9NI8Kubv8tFzTDstDgm2/nVAHggz6hyxWYVD05PYZ
	 9hZ15TnDGyibfHfqt67dp6BuWVVkS/WWof0l1sFcrcW0pDeNmi/k8zWDu3MvpaZj4qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472625;
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
	bh=w2zn7zBKFnW3u0uo/c51wplsYOKWCwojPLE2KnPlAx8=;
	b=yncIUOqjZ+FzkwGEo3pga40i8xVtnFwdDRpKD/FsDylDfA8xe4HemlA4onsHqxHLl4AP
	 GRmZ2G178Omy8KguWsJyqdF6qsbNWVH8rTcxqWe536rRhbT+cVxr4Sp6cD9YjQu5g1Spk
	 nh2WzViDoVduMsI9r3jXqRIYGRwkqyzYSGLGUhNrt1KR6vSivBllV47Fxd6iW0NLEYj5i
	 fXsuTbW4e0EH/n4ZVmrm/OqLLq8W+IBiK6MctgTkKFflNXO9QeK+PKhfkoreiZnLWeWpi
	 j+uml/adctMHtFdbnOO7IvbHKJr3UjYt8Qpmj6ucO6fwZol/aR4bK3b5xTmWmjocfcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BPQ4oeOj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.27
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C71606A890;
	Thu, 12 Nov 2026 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C71606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BPQ4oeOj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0oZZHlewf7fhulE/R4I1i5g0nrzh6ksqUSSlCm8096DXTNUS8lSWi99EZckhEKHSzFebR9Y0tN6a829jbIa+xyDxgHf4CvB6rJdrLjusy4Nmdf93XocRlIfE6kyx3L0ma1JPS/U9I4bwMzjFAlw19JYCn/nBHXFNiaRSvplzV7sQSAp2IulopewzaX22jWQGw4FvrlL6HCzyeAaIcu2qjCjlek47ZLNZwS52FTIh96f5HqZnqxtODjwCGqIokZRCGea0FdnVA+kx0FM2SaK+g3YVRVF4KyneLBmPFLMIie4luHPvB+Ozv5zUJ4ocgyXHN7YWhTbXHXVvnCu5DmDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2zn7zBKFnW3u0uo/c51wplsYOKWCwojPLE2KnPlAx8=;
 b=thh1Rpwv0uhEI4i6rXJ0tBV18d5++VDt146KL8DW1vmh1HWYoXsn32TQ3NK2FTkNllC14cZ/SmgJ1xLBD5m36rjrgmNdLse+fog4b+OO6sxGo54XQ1Q/PBYZt3SB53NChM5i4DM+O+XBimzxojQe11ppB2COFFDs9EpJPD08NsAMyAwXaBMm1+V1nNmy6nYp9erbLkP83tst6IR+nykXxDfpiC9V6M9/GfZGI/HN7AMoWyVrDqzwddt7s8pKiSCCiE0NCdfSewaimCCHP4TveZAvOaUsue4m0v8i1dV+Ox5FVSGH+NbSuJOzJiV9htXZCiNT+h1VNpaTGV1yOOmSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2zn7zBKFnW3u0uo/c51wplsYOKWCwojPLE2KnPlAx8=;
 b=BPQ4oeOj5ylKa9G4ONOKMCvt5EwpflUI02d3TxRG6hSey79T1rXHAudZAoZ38+bgwzwqm7beZI8eReO0vzrCCvz41WKkQiuS8oy2Jtzkyq6xxz9D4PGdxrSXqTqDGHj9OFjvsiW8GVSL4LJjV/t1sGtIJSXY6X6fSClVVWA8dryIwV+CMcUSGlFbTbMBZs3Pa3bzAKZCzWLxv9nCcRZi6/Eg+QwbKYAHfZi4OPuhq9jvpz7DNW1mA/j89aF7UnOodXjSTf3x6qf5e+voDmZQGD9x3Jkx9xhQPUHvcEKWl4e9gw/JTyVTK0BY1hsUjVr7xwFepvCj1jQn94foWjEsPQ==
Received: from DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) by AS8PR10MB7546.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:37:01 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::83) by DUZPR01CA0237.outlook.office365.com
 (2603:10a6:10:4b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 12 Nov 2026 08:37:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:37:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 09:37:41 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 12 Nov
 2026 09:36:59 +0100
Message-ID: <c4f08bb7-cea5-4f79-8a11-4045220f3b89@foss.st.com>
Date: Thu, 12 Nov 2026 09:36:59 +0100
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
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261110-confidant-bundle-08385b99bd78@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|AS8PR10MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 157f1756-290f-487a-1953-08df40981ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|4143699003|11063799006|56012099006|261026140227099003|261009223027099003|261022105027099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261022075727099003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8afAIice5/xMROc+8noieLgUbu7ah63yTUM51Oa+ysbbqpm7YmiCy8FYKBDvmC5Pasx/JA87gLckV3TapSTTium5DdnsiC/M4TndEc+J+2yu3PXwhS+I5XQlJ1+IQRYHrxtLPynVScQHYNX5tiZ2JJJ4/6ywDUE6f1RLkX/wAjDULqaPeSrcm97pX7qHw2Ai6QrhWWI/6obqQAZ1tyLI5y19NBe0QfPcFKJpDI+QkUv2tMzZS/bRzjV0sZxBhcQEai/E/reGCZDy0XHGYN6M9o8nl/w4koUgqHRCVmvBj1eCN1OoK2uiTj+QOM6mELw1HVIsZBrNG8lM54Ms20eGqKH8KTjni+Av4CcjeN9Yhn1MEQjGu9CzeZFu/yXyf3/hlry4UlUk7xizMIzSs0d9yimTUsuLYAZm8UIcuelEvf045vqQo/MDtBVNIdgmXm/IUdUiMBtPK6HslZyl+Ywmd37TpWGkvO24qEW2KtvcIDKMhlB7ChC6wJHJwpa9/M509Frc/nWGS/NKi0QatqbsW2tqdE9rZ3dN2M53EQPZ1ZIcTpwQnwrrzTCF+8jIxM5wu5MtxqATR/FuprqtBdzI5CAlJQ759BBWQXkhQ9RIxcqGPaUuJ11h+OfvDsNpz59/IwWqGBafkH3c9ksAsWD+zKgXrr0Y0TGZpAkYtVk4Pvw=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(4143699003)(11063799006)(56012099006)(261026140227099003)(261009223027099003)(261022105027099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261022075727099003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p5WFCKE7dc8DUtGymDXbQhDbAyypED6vtFxzoEnU9x8XW5dSQ2/OHGX41LjdLJN32PWxqerfAdMEDoNMxCum5qrGQ1m8cD5Xir1QaqyN69q/+0Yq+GKx68bZGPlSdSiVzBSt5Jp36PmGdijB9S6ikNA8GPhc6LqCmh3/Erf9ratzQgR+q5EqRwkXzThK0Dg9SFPK/1WGlWm/LjxnbYXslixBWzK4PB3Vcx+0tTKDJOJ58cOjCe8n89MVV058vFqVNNHqOZh5IpgBHTG7TR/SE6nVE4otv6NJLCIvkDOlj8vFSViv2Qq7RaxzN6/2OTNoOS4VCooW/sar723Mlj2b4RSz/FbEmsCwmMyUJxz8c/Fy0vi8cr83ikBNnPcnOpeEIUjVvviGLwMAELsNJV1EuTI/VCV7praT5mYHysv88HVfMiCzg/Ar2NZwZ+BALekS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:37:00.4256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 157f1756-290f-487a-1953-08df40981ec5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7546

Hi Conor,

Thanks for review

On 11/10/26 19:54, Conor Dooley wrote:
> On Tue, Nov 10, 2026 at 11:42:17AM +0100, Gabriel Fernandez wrote:
>> The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
>> SYSCFG is described by a clock-controller sub-node of the SYSCFG node.
>>
>> Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
>> and STM32MP25x and not allowed on the other SoCs.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Why does this need a child node at all, can't the clock controller
> properties go straight into this syscon node?
>
> Cheers,
> Conor.

I sent a v2 [1] shortly before your reply, which explains this in the
commit message, but the question still applies to it, so let me answer
here.

 From a hardware point of view, the mux inputs could indeed be described
in the SYSCFG node. The problem is that this node is a "syscon": when
the syscon core creates the regmap of the node (syscon_node_to_regmap()
or syscon_regmap_lookup_by_*()), it takes the first clock of the node as
the clock of the registers, keeps it prepared and enables/disables it
around each register access.

The SYSCFG has no clock gate in the RCC, so this first clock would be
the LTDC kernel clock, i.e. the first input of the mux. It would then be
enabled on every SYSCFG access by all the users of this syscon (PCIe,
ComboPHY, Ethernet, OMM...).

Registering our own regmap with of_syscon_register_regmap() from the
SYSCFG driver doesn't solve it either: these users reach the SYSCFG
through vendor phandles (st,syscon, st,syscfg-amcr) or by compatible,
which are not tracked by fw_devlink, so one of them can create the
syscon regmap, with the clock, before the SYSCFG driver probes.

Apart from adding a dummy clock in first position, which would describe
something which doesn't exist in the hardware, I didn't find a way to
keep these properties in the SYSCFG node. So the mux is described by a
sub-node with its own clock inputs, like the USB2 PHYs of the SYSCFG
which are already described as sub-nodes.

In v2, the '#clock-cells' property of the SYSCFG node is deprecated, so
that the sub-node is the only provider of this clock. No driver ever
registered a clock on the SYSCFG node, so this doesn't change anything
for existing devicetrees.

[1] 
https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com

Best regards,

Gabriel


>
>> ---
>>   Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index a559f8b03b84..38c844e8f19d 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -45,6 +45,10 @@ properties:
>>     "#size-cells":
>>       const: 1
>>   
>> +  clock-controller:
>> +    type: object
>> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
>> +
>>   patternProperties:
>>     "^phy@2[48]00$":
>>       type: object
>> @@ -80,6 +84,7 @@ allOf:
>>           - "#address-cells"
>>           - "#clock-cells"
>>           - "#size-cells"
>> +        - clock-controller
>>           - phy@2400
>>           - phy@2800
>>       else:
>> @@ -87,6 +92,7 @@ allOf:
>>           '#address-cells': false
>>           '#clock-cells': false
>>           '#size-cells': false
>> +        clock-controller: false
>>           phy@2400: false
>>           phy@2800: false
>>   
>>
>> -- 
>> 2.43.0
>>
