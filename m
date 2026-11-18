Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004094;
	b=XgmtY0oxS8BxiKJ5JUA/colqmLPNlsJrZ544pOGcAysj8mwOffQdzwjJA+SMWUXzo8Wk
	 SieYpnKddslfMJWBxkcYxhWvghJwZiq6Of1tHcm9UP0QdFumIxnkE2N2pg9MVgCWgJUlE
	 aHx2SLJ859eP5NDt1OwOQq2DYHbjyykHtQyx3kjywrB2EfFtYjCwlrUUTactSKg2FkxtN
	 6S21dJmgaVWl+MTXknhwfp6NNDzYlCHUx8EbPK3J0CV6+q0NKbWIO0jxZmbZIE9TnaTpo
	 flHo9lvPPNKemJ0Kdv8fiVFRGIIVfcr737Hn5Bva46/W1aXziOAHSOyZk7riFDjd4MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004094;
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
	bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=;
	b=oQEVjDUptyX360MzWdbPiq78CURqDHHpY7V681ReNfjb87rGMQ+lpeeThc2kWftQqqLc
	 O70EW3ffBn8j7p09XWqUMO2O5k0qptrALHSTIy1qQQL3SSdRNK7QSEPopr3lOckH6qxu3
	 ciLY3KZnKiZZ3KknehDLL5YPT9RjvhelyOAg84d2RjYN4UFao1awjIyLjgU2J+9EaPYKU
	 LyS+NYOGBioOQdTGVJFDv1+vf0s4jFP9SbO7Nb090/hPE0X5AI7eRYQmP+wPPM0lyrFG+
	 RCCjEZZBdaByROn7HZuLvCYGpDixla5ly883W6ciGcmt0w7FEoW71ONKds+SAXo9DoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mLw9lvpu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.33
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D24606A31C;
	Wed, 18 Nov 2026 12:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mLw9lvpu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZimR3m8ip41iy1fkGmzlExSC5HBWJ6napqq6YvmqbkBW0FiO+Jjk8Tb5nFFqLO6IYaoLZ0Hu3wgBg3USeBtpn0CYmlEYtTnjWFxb3Qll4pP0FB1Bg6C9/ZNBq+03fAZbJf7hCVu2bVvYaf8GJIbPXUeFcAjyxg65v+vctAIcZ6FXDCrWJfpfyt1pPvh1xWdbCxg0dsLv2P/6QAShPpgZ8RSCtxfqrzRUP1TNl6Hx5YYlfu7nOcG+LjFCz9nvoFRpYcfcwKxBpT+bspll7iLDpOt4LITRkmz4spVd3BnNc5J0RmVUF0h6SlM0vzitJ5plmbE4ZWX3i4oVXzikAunwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=;
 b=TMihUCCGwO34yjNkPa5gXx3STPSJeRV3xYvSHNtZs/fzrlvGWpruncK+pOzWhfsFjuGNeOFujbN7iSdk70AXuf8H4ycjKfF1+w7ZceXeZt3rzwEL8OPkRt8EaAmISEHaQ3qFDz1Sm4ONFkkyVFrc55WsW5ZDtmzykszR7Z9OuBg8UgvChePfXqqyGM7kILkFC4BWeud+nf2POBYyPwXBPnDKCbWp4iD2yYmh6JUpGIsZfK3iBZMXNEg2NYOqD1fWuxgpbsasDYibjwpV0+5E0smz6T9yAC3v1OuIgL9LTsjsE3rw8+U93Mx2m9dqv0DVy2gRa8y/1rCTa/p/UmdzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Wcq9WTXiKWb5nk8BFrG3BUZ1YQY0s03a068+uKLHE=;
 b=mLw9lvpuM6wc7z8DURcnAIkmLxUD8CZDjndOwvYtu+u98bTdMTGbdzwAV6O+wJputA0dqiftSIDf6DX4wn1sodLIBKlth6MeZ4HCzuN/NEfwU1HN5NfQxIEp5sHEm1GyTa0olsDn0A88DTlDoN9CL4pQh8TTLFpKKNXi01l6u71qQncpMW5nyZByuuwjdXnJq6hwRCJF8p/qiNPb883FBB5iWo/RoWaC6jmeVX4t/zt2yESYd6D9FuV4ssZw5HlxIocyvmTFaeeXaE2vkpCSmcpm0F604UtkIywtlg+aIvgDAkxKHaIMaWJ8itHkp4T1KRNZw7iUzYdLZVC3gAa10g==
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by WA4PR10MB368572.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:14:46 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::90) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 12:14:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 12:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:15:30 +0100
Received: from [10.252.6.76] (10.252.6.76) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 13:14:44 +0100
Message-ID: <2aec79a0-54fc-4593-b4a9-7a2387f2c6c1@foss.st.com>
Date: Wed, 18 Nov 2026 13:14:43 +0100
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
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
 <20261113-honorable-competent-lynx-b1d5b8@quoll>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261113-honorable-competent-lynx-b1d5b8@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|WA4PR10MB368572:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ae6991-93cf-4858-ea7e-08df456d88e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|10067099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	/l0sM+VR6913LMAWTMzZlcQjVnWQ95b9lYHCTcbPSB0x2lEk9veHCmkmP6i/2DujqRT+9FBtxZTEr9NHpD5gy2016uVT0rC/ewr57fHOKKNIefbYe7/dgx7IVOPJB/MVNuvDx4/jXHhtEfXUniQ4FdpNEIPuj5Mjw+apb9Iqj/2qODMemUY7WKdm9bp3vQTtr+ON0o5Lap79sLpxd3twjNmVgBU9uLhIBgUgqmu9vgdYmI0N1Jm8IkPHcHxM3Pc/YwX01oChohXYya+Mkx5YZulOpHrQ4/bJZA6iWlabfaGxTgjMUY5KpmkgZkH8p1i25h5j9e1U/rKH6zZ5gNVFe3o+kbB8C7THYImfCGUiIL1qLJrqbQBvtjOQvJkOkQ3jmVYFXPxfIfaeuLq0ZchTJAQngCiD1jAQ6a3PdSSAaEYNVz4+4dmfpfD39AFOYhfH6broAC/ks9th5SX89mUw/RIFq+sulxVZHT3wU7o41/XuyRuLYlcxe4+OifUhLeRTIAW0haLugVJZo87rmWtOgLWAdEjeW9Z+QK74CrzjD2k5E7OtoIImB4gGE4UHXnmBqQHTUz+NgyThZwVdBFQXwSAqUljg3aT+b2yEzWelK/usdaFEVxsU1s6ddBo9TI8RXcuynghH4+WGtfg/I4sZHdhC4kBwthUYNKMnxJEnQl8=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rw6mThnM5MPGVJtxDOcbcaQMUxIdrPN6Tmxa+oFXiKGiJg28wYktjRo2n759mfb9Z28datruswjtfFJBRkGfMfCgUP1hdoDZuSj8LzqRGdWTG8SBwOCBSkJ3o1olRI5gXVQnXoqVO7njy/0aAMJTQkZvEnn0paiF8iRkhNMfUjVj+cEZL9qpVudMjTXh++QBvKNpJ2wYjvlu5g/96Gza1iBn3SR5j6+HubUY6JrToJ5cRu5P2n89ntvMPiZZOriDIvtyXNFKTAAKXnaxUXf9QFE9fXMXWdFOLT5YXRGhi90dK5CNzjA7anmJ1gfH+ow4Y1XiEVw4Ya9LWRWbLrT6OZwJhM2Pd2M0b9jFGA1kKKriWxFmLEHtQRAwTUlkKIUQrO992Gc1lwkBWL/HSUOJQyixvkpQZP9LxgznIpgqkYQWlkIzXZd+sx8qgQ+yv+j4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:14:45.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ae6991-93cf-4858-ea7e-08df456d88e3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB368572

Hi Krzysztof,

On 11/13/26 09:24, Krzysztof Kozlowski wrote:
> On Tue, Nov 10, 2026 at 02:10:22PM +0100, Gabriel Fernandez wrote:
>> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is described as the
>> provider of the LTDC pixel clock, but the inputs of this mux (LTDC
>> kernel clock, LVDS PHY pixel clock and DSI PHY byte lane clock) can't
>> be described by the "clocks" property of the SYSCFG node: the SYSCFG is
> Not true, you can.
>
>> a syscon, whose first clock is taken as the clock of its registers and
>> enabled around each register access.
> That's a driver problem, fix drivers.
>
>> Add a clock-controller sub-node to describe the mux with its own clock
>> inputs. It is required on STM32MP23x and STM32MP25x and not allowed on
>> the other SoCs.
>>
>> Deprecate the '#clock-cells' property of the SYSCFG node, which is no
>> longer required. No driver ever registered a clock on the SYSCFG node,
>> so this doesn't change anything for existing devicetrees.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index a559f8b03b84..13c02844a91f 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -38,6 +38,10 @@ properties:
>>   
>>     "#clock-cells":
>>       const: 0
>> +    deprecated: true
>> +    description:
>> +      The LTDC pixel clock multiplexer is described by the clock-controller
>> +      sub-node.
>>   
>>     "#address-cells":
>>       const: 1
>> @@ -45,6 +49,10 @@ properties:
>>     "#size-cells":
>>       const: 1
>>   
>> +  clock-controller:
>> +    type: object
>> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
>> +
>>   patternProperties:
>>     "^phy@2[48]00$":
> As you can easily see, each child needs addressing. This is one more
> argument why this is a fake device split, done only to match your driver
> limitation. Please fix your drivers.
Agreed. Sorry, I sent v3 [1] before answering here.

v3 drops the clock-controller sub-node and its binding: the mux inputs
are described by the clocks/clock-names properties of the SYSCFG node,
which remains the clock provider. It also keeps '#clock-cells' in the
SoC devicetrees, as you requested on patches 4/5 and 5/5.

The drivers are fixed instead: the STM32MP2 SYSCFG driver creates the
SYSCFG regmap and registers it with of_syscon_register_regmap(), so the
syscon core no longer attaches the first clock of the node to it. The
clock driver is an auxiliary driver, whose device is created by the
SYSCFG driver.

[1] 
https://lore.kernel.org/r/20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com

Best regards,

Gabriel


> Best regards,
> Krzysztof
