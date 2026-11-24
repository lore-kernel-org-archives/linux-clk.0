Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537069;
	b=xlE4EQABjZTxd785EM+k51MwKbW5pvwO5uWMAfT8krfEAAqKL/Wcwlk6OeI4xY9fuzTO
	 PSsS0fnel5Zq6Cm4Qi+kksFIMDKvS9xCYWO2DVx6b7UBRCpAZQ17yFuoVFTGbSJ1a1Mwk
	 65JwePuxCcclP6lUs8IbVImDEmc333nEzTHkfF58X2OC3BkxtR84+FJgNVopeABwYPNta
	 XhJ5zT9frh2W+vegYIr2kAF39pl4aj3XzxQQQ1n69yrCg52JehEOM+sBwfYfbr65EsS11
	 /D6TmIZfm8G+hSU/LbcI8SwSF3VLSSDeWCryvgalxFcUG99iQHNQ5faRhbi9etYCIDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537069;
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
	bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=;
	b=SjsZ+nv6gvbKIx8jE6od2XlKbl7AfW6Jb1Gx4zg1PYoU2osaSwRq4ifu4X9rRjMR4NkG
	 qQByuIwmY2ZmZJ8kB7e1R2izdArkJSDdngyT19Z1fi7Pz+H/zgx6Fptdc5ZKvTVfLtCnO
	 G9BKU06xAxNhRuqJZekpZ1JIhxVQCnbQ8ON599fEflZX0NHvOndVrhjfniyn7Ztrfl9Io
	 Gfd8ls1/CR6Qleqax1AHQR1Pr7OhqnQX8cYxM0c+CrtibZ+I8hKpVltnxcCP12wALzeXd
	 Cu9pDVHYSXo915aHtdoJWL7MuFcWDqp7Li57G9HHLh3KDXme3kK0Nk6Uai7TVd5wyaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iyE3KXc6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DB606A326;
	Tue, 24 Nov 2026 16:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iyE3KXc6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaU8GL6LapZ9P4hcGN++I/CErDflVZtPb54u3bDkvbo8bbsHLeAJsljd4NH9DL5KidorFCQ95CeKiRCRV3CR1LCG7dxgV7f5ZqeA//ks7xOS6Ef4hScWrjmks7Re/iWDh2DqI2npxegvN7qU8z0XxQraYmv4mMJF5xMdCcP3rpWdSZMv+Vl58tA25ci8CrttGK6FbZSnSE4aOVgAsOIOd94CiITSYLocLLrZ+8LmgTkVQD9d6Drc9znOr2QSCBORw97nWJuQvr2vBiE9hu1erYp1MooXqlbuhH5Zz353kGQfpYAfWJPR0UbixLL1AdDtJWLdmhBNnDjVIi6j9Enyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=;
 b=sQyKb2pd8xTrjLds6KXqxOyfkr/OjbDOlapPulamYTDBHueNpf+VugHOjJJG8K/sRSoEiWHxKjKoV9xORFVJ3Kzu+9mevCVKNKfFxsjzcNKDmoB+XZgp/RF2LB75hzwJ5aJGVB9Gu052Lz3WeVp3104szhz/5/YXCtcyGjN4Gd50VEEusHqIs36njCyOcOVol+QRxksUy9BdRDWkWm4OtAnymxIcyYLHtokClkJ/S/0eEHgDFK/M8BOzBSaLAFoHkQBb76Y8TfqLJEYoAB7AZRxsOPjXBbJ2frhKHSseGIth3mXhbACooDuNW+/lRD9mC8eusi/PgEsW2KPhMgghSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8urc8mUOkdbshTr4pNYNQWmM+6Ij81Dg8YariFexfA=;
 b=iyE3KXc6rDuZ6Vzxe2pAIO9bg0+kXrLfZLd3iKyuxQx822GU5aGO1w9lcWCez8FXJ/YppXU/dTQuOX37uG/AGgoWLDCW8lN04Zdn9PDfTTEKO9ZZcE/0mTiu7AAZtKeusY2hRn2MT/oLnYJl9vbf8lOydnOMeZrUon9Su6JliLnkQUkUZL+4ozghcX7Xi8lsZEEEqnli1atGPujKMjYTdUkHFSfTSHtzcybw7KZyYcEgLW768juz194lyFhz0lJMzqmy8aspdSrBDaF1J1+espl1gKWh18DFnjjBA3GuwSERRBd949QEU/B5I8Slb+XTc5aTA9VfovTjY0bTHPY0Cw==
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by PA4PR10MB5779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:268::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:17:44 +0000
Received: from AM1PEPF000C1AD9.eurprd02.prod.outlook.com
 (2603:10a6:20b:657:cafe::a0) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:17:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD9.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:17:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:18:32 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:17:43 +0100
Message-ID: <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
Date: Tue, 24 Nov 2026 17:17:41 +0100
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
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names for
 ETR and STM bus clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179553246414.44164.14668877546162285849.b4-review@b4>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <179553246414.44164.14668877546162285849.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD9:EE_|PA4PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: beff7a9a-1888-4ea8-08c5-08df4a46789d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|23010399003|10067099003|261102123227099003|261021121427099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jquk9cbcFpixDrU5z67EXOBVn4oKXWveKnpgoDVzpeS/s6mNKu+f3FVcmiAVd6FATzdawQN0OmBZcyZGIYXwJkQ9UtNxc5UwwYa8r0572n6BRTn8vITJLH27TUvY0nw5Qo2XWjhntJSvreOO2Jm2fCK5hBnNT6aQOH+JfzN9C9WxqmjIwOtTMRWktZYMA1rsjIvwTHLqpy8zuZD653S7zynXBfUBOiNQH80yKwgvJoHJORvxCugzqqAffE7JVdoJhToR0xhUfj/hDCwr65u8D2oLdaVxBnKL2P95WucGJ/GYc0hYmEzlDEzqej6wg98ZlguLqB3dI0jV1mjXIeyTQgX23SCRxgVEBWDzbZozDUCzAcpQYW+CRmtJoIajkahl4hGCnzoPklQKWDgcW3XJmD2aHXEjgigxYX+TfuRrTckRriDaiGqrvKJl3HLvOLbDQt5+xBMxrmrLXdjtQunuEGhIW5W9GGJPdDvsWTMqI8j2wfXR4PjNIXQ4gQNVmczlvxvVaN4+I1A+hoW/39pGSnrLmpTt+8UT634VEpwtqDRJ3fC+0Sh8SardqlsVBlnvRUiaSDBbFQvciPpqr7kjKU54ORDmDwkbW+PAy15w6bXMKEpOINOjp1OH742E1dfutSCVQ6w1WOB+AoodhBsJT/DN4PTDG+bEDgQHkWmVYOmRF1q8UhxwLoyjnxIqT6JBf46Rg2bj9bqufg6oYiwztA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(261102123227099003)(261021121427099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y0khRVlBMqN5ZvAVnq3n4drrm+WPoZ1BNN3ol6WahyzZD3JRwbTrcIBs7sGV2xhqLemTfPPduRBLL6YiJkwhoJVGmG3y+VJshsbE6HnNndnQHGIYyOmL6eLwfi7lpswKR6m4nIZvjyLJLUBop09nbj0B2xNFyUYObzNeDGtnz6/aQxJ0yWA/NCKtsmKY3DfwiaEjzh2K7l9XSogo6CxnKf9vvdWQsRq1UfF6mZXk54iSsFEY+oSVI0B9tzN148VeMxDYQjGyJLvMaqrU2tRVZFdMRtBFxh3MBfbLZFcOBvyRuLwcYYpg32G0V+JTj/ZMy2n8hn58rLsoQWKvihjTVm8pjK4CRdTtbD6JQVT0Ow/j7W5ABGpRvN+p0ByX68cgNMj6Aa6/mRoqAh85A2DXJaBs6P3bDqcR0OBYJAXs/MWzh2IIi1BhVf+ebTcdPhb0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:17:44.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beff7a9a-1888-4ea8-08c5-08df4a46789d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1AD9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5779

Hi Krzysztof,


On 11/24/26 16:01, Krzysztof Kozlowski wrote:
>> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
>> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
>> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
>> ETR is already CK_BUS_ETR, these names are confusing. They also differ
>> from the reference manual and from the STM32MP21 binding, which uses
>> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
>>
>> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
>> values, and keep the old names as deprecated aliases so that the
>> existing users are not affected.
>>
>> No functional change.
> That's ABI break, so clearly not true. Users of this ABI - this header -
> did compile before, now they don't.
Thanks for the review. Existing users should still compile: the patch keeps
the three old names as aliases at the end of the header:

+/* Deprecated identifiers, kept for backward compatibility */
+#define CK_BUS_STM500        CK_BUS_STM
+#define CK_SCMI_ETR        CK_SCMI_BUS_ETR
+#define CK_SCMI_STM500        CK_SCMI_BUS_STM

Old and new names expand to the same values (89, 87 and 122, unchanged
from before the patch), so neither the DTS/C sources using the old names
nor the DTB ABI are affected.

That said, you are right that "No functional change" does not describe
the ABI impact. I will make it explicit in v5:

   ABI impact: none. The numerical values are unchanged, so the binary
   ABI is not affected. The old names are kept as aliases of the new ones,
   so existing sources including this header still build. They are
   deprecated and new users should use the new names.

If you would rather not rename the identifiers at all, I can drop this
patch. It is the last one of the series and independent from patches 1-7.

Best regards,

Gabriel


> ABI impact must be explicit in commit msg.
>
> Best regards,
> Krzysztof
>
