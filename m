Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3B1C6FF6;
	Thu, 16 Oct 2025 02:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760583475; cv=fail; b=NWP4cZoKevwiRMUG+fyG7V02zlvELUyElrQXeIbyG3fb9RvA96NIx+zF7KFL41S63DwAmK8dosRK0zygoLn9a0J5UTIu8ew0muO5YsZxLa2xQLSq59745XPtmEIDxtialJN9W+aUwLjDlXR4YmrdBTkYE2t/ltxN/fzql/7JyfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760583475; c=relaxed/simple;
	bh=ZGUAj8pf177vxYlSqd9LJjOafHaLbc+Ssyc5X5pvr4w=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E/F55Qiux39dHWGnilqfsQrPnlihaYyJP5R8zUnC2sI1VixJStZPIwRkmbcodgcTcbQhXZkaQw+usDCnWPPG0CZhaPdFeE9W1zN28EBETTIU4Rjd1W34xvDD9ynvuejMjmk+QB5wA9tcYl6pF7lZt2VxjbehxvlOvTvSD7ucW3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kySNXkTM; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kySNXkTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqpaKGSn6q1nZvP7b+ic93YNCvczudZJXqp25xi7FUao+qJ+i+o6fJins3mFaIFJAQh9BX+WihIKQXKjvXtZ0TRDizf2oY5OCD6XtICJgX/D4W9jjKUgoYRltDfPdubr/Ij+lBL3aBQR63jtmWlIzygb5D2+Cd3/6cw0OMKEkr5EKpfoSMgjnSYT23r2U1d0MlJIR4o1FHtQP7AFERDQmHZlP6fa1U0jaJTlJW1B+dgKvXZ/W9iCBT6s6GWmp+OPCCBBBxHNNlVEqZBsnf6ni89oEXtiC77VsUSZ9xAD6KNiA64IoOYL3bs2G26oYOzr0uJqjKLpqlPxQKC9o3oksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ7Fx91T/DYZB+QDB1Cs0WWcPCDsO3UUg1PUVJi4IDo=;
 b=SuD4XxuDlOVHCuSSfpmYxG34lgQ/pHE8WSXpzp7jPEK/7V2nTQQdL4hwiPu0sbREsdEoRpLXLBvZYrDQfAC2xZw6HyqBAZQAXpLbL6MT6JoQm7pk8W8O9v6J/33GlWH9QcxdgPuWwGIbl0Rwp45ceSq7SfvWn697iZKrDq8JFgXgsx8GIcpnlO84pK4A18taVNgM3eGqJ0ScQH8yPphi55qdlz/6eAU/1ErIGSmmuO1Y7gsT7tjFhOTJq7dl+nA4IbDq5wMcqwHx8ft4RerSV+URoIfJTcAnIBJxskftS3/a7bJbRyvQNboz4jp9k4ZPOB1OcH+SUE7AUSWhdsQY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ7Fx91T/DYZB+QDB1Cs0WWcPCDsO3UUg1PUVJi4IDo=;
 b=kySNXkTMLJyJOh30JHgGiuj0E/5a8Sz+mnLfuTrqEHAWJJ3CXvlGkYzrKjHnP/Fv+gFv2s5WYGgke3bMk1rb2VMtIE4NSBNHCUzEAIcOwSpOpMlES430ncUGFZYre/jMF0vW3GjivtPXYsRtXK4nZycQy1NIqNYI6EQNBczdENbi0Oi2yhWaHXYuF92gE96Q70H2jHcWdG8Hts4Wv09HyVML6i2DkejpP9j1nlv4C7CjWosVvOZ33KumS4bse+4eTKwKM7H7vKp5cuyIb16pUOWl6hnhrwyOmwRvE20JckwDYnIvaPG8VOyRXgWqVbsh+UIxNhZgwe09CyfYd5JDwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 02:57:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 02:57:50 +0000
Message-ID: <b6170f87-f2ff-4c54-a8f8-adf9a1941785@nxp.com>
Date: Thu, 16 Oct 2025 10:58:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
 <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Language: en-US
In-Reply-To: <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0165.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c0ca8c-3eb0-4059-07da-08de0c5fcae6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|19092799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OERKRjZ4RUhTdjBhdjlubFAwKzE1RGs0WHE2N3VPcEZ4Si9xcmgvNDZmcENG?=
 =?utf-8?B?NW00RDBUZHFZcUVadkhOSHdZcVdaZEJ2UlFmYy9mbnJzWUVCanVJWUMwMXBv?=
 =?utf-8?B?UGthMnNGUU03YThJbkpXV1hiWE9FUmNjT2N4UGlMZXBrb1E1dEZrL2RXTjFh?=
 =?utf-8?B?bFFzNml4dVpsRExZaEwrS2N3bGVNSHN6cDhvSW1iSjdCc2lkK1l0dTJnQ2lk?=
 =?utf-8?B?KzVBckpwbDBET1htQmw2SlVMMGJ6VjY2U0M2SkxOUkFCZW5sMTFiQmdMOUsw?=
 =?utf-8?B?YURJeHNLMWxwNFhWYVhVc3Q1TzArWHpscFZ0c0Z3ZTE0TG1Nb1NuMXhhc3J6?=
 =?utf-8?B?YUduakFNR055OXluSEVyTHIwZEN6OUdLVFhVcUFpYWR6L3F0WVRQR0E4RVVa?=
 =?utf-8?B?NGx1bVREd2xrWGE3RTZyNEI3eGJDR0ZFTGtFTnBnd3JuZGJ1UHJ2bWdsM0dR?=
 =?utf-8?B?RjdmQy95ZVY1N3Z2eXdmcWpvVkFiay9BZlM1SmUvRXBEd3U2RmNpY2c3M01V?=
 =?utf-8?B?dE9qd2JPV0phc0VrLytNOGx1bW5uZ2J5eXQzaUpCSHlZaURZQlJHV3RTM0tC?=
 =?utf-8?B?Vnd2NmNxMzI2RDQ2SVFoRzFlcXlPVGxPQTU5MEVDc1lTUjNRTi8xUG9zOUdH?=
 =?utf-8?B?YmJpYnNNeVJURE91b3dsZlVLck5mQzlqSHRVUWlqV2l3QkhJMzV0N2M1dnhD?=
 =?utf-8?B?bFVmZnZCNy9zWGZvdHEyVEVVbjFBcXZQcTNmSTVVaHZMTUUxR2pSTnhrTVpW?=
 =?utf-8?B?RHhxcWNkcStCZzVOenptUzYzQmNjVzhFZkN6MGo4OEp2dkF6YUxyb0pwY3Bs?=
 =?utf-8?B?di9UMWNhQWxQWjJvanRST2VxWmlVSjJBaXl4TTV1OGZqdnNmaVo4UVlPVStI?=
 =?utf-8?B?TUR4aU1USUtrS2RXU2hSMjNrMmhlV1dPQkl4eWVwb05YK2tHelZkRlVIODl4?=
 =?utf-8?B?SURqb2pOOHd3R2NhS1o5QmRQWFdSTEhFZ2hlTXlabDNRalNvQm12VFFIbWJ1?=
 =?utf-8?B?Kzh2aXpNOUJOd04vNmhTWko1clMxWmtQbHhiamphOTZ2OStibk1tZHo2ZU9o?=
 =?utf-8?B?OTVQYkIwYUhiSEVFTTF3TXNjRWxTY2FzaGFNMkphVVphT084TE1VL0k2NHJm?=
 =?utf-8?B?bnFheStjWGI1TjFFMnRraHBrRmtmRllDakZ1N1k4R2plUUYvS3lYY1FNMXdj?=
 =?utf-8?B?dUlNTk93VlR0NzlJYVNncFJIdEFwbkxuNnRyamRUTWMxQVF0Skx1U1ZoZlFZ?=
 =?utf-8?B?ZWY2RGtSZk5UM3N3N05ZRGJXZVJLZTh5VFE0c0FYY3ZoWGV5YmtLQm5MWWJu?=
 =?utf-8?B?YkVoZ3FqdnhIN0JLV3M1NnlFdmVZWEpJTEFyemFOZU8va21ZaGUyQVdZOW1K?=
 =?utf-8?B?Y0o4YThQbGJFWTdVY0xtVGVNMXJIRnBCdlRySVlDblp6bmRQRVN6eXJvYUFU?=
 =?utf-8?B?SHVtdFhwODh6VE5jWVFNMTJ5L212U0wvNW1GOHJSK1doZTZ4WThSWGZJeXdV?=
 =?utf-8?B?VzZXeTdmNmhEMDhDSGdOS3g1b1BKZ1JyTVZNcElkZ3p0eStFVlcwYTJCUjF4?=
 =?utf-8?B?RG9xNExQMGNLcFdKcDJyRWtBV1pLVm5vdGJrT1hiRmw5UFJZbjhKSW1rT1hI?=
 =?utf-8?B?ejBqSDhpblZBMmRWcldILzNQZXRNM3FZSUowbW5wNGtyemYxSnRiRzMvRTdM?=
 =?utf-8?B?WGc1WUEyQlFuUEpZNUVuYUptRTM2MENwS3dsQXlXZ09CUTQwNVllRzBEbnZN?=
 =?utf-8?B?Tm5lV25zMVJ1R2FBdUVjck01Umh0VkZMdEdNYnZCSXluK0VsSnVmaUQrZGEz?=
 =?utf-8?B?S2tXdk15ZE5heit1ZzdNSXdOeE5aVnFJRVFaV0Z5ZzlSRFlRTHBjd3FOVkd2?=
 =?utf-8?B?c1MyS1dhWCswUWFndGxNajJwMzQ0Y3h1R3VTdXpTbEpDMzl1Znhqemdsc0tF?=
 =?utf-8?Q?Qi43p8KCaPCTBXPfIFLo5npVxrNUP54W?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z0x6ZUQwNG9ySUMvbGJobEc4NW95czlCZitiZ0FwSWR3RFdEV1VxamY4UXpG?=
 =?utf-8?B?MW9jOTd6Sng1MFlrYVdzckxFKzdoM2ZpZUgzendHcVJPSWV5UFpzZDAzdlhC?=
 =?utf-8?B?NzQxQU9qRlBLWEVNd003YWJETkVjQXZMOUpXT2dyU2trWXZRVUpzdG1jdWxW?=
 =?utf-8?B?bmRvejNwRGxVOGFXNXlBWXFOTWxDRCtQdVdTdm1IN3FHWkV2d3FKZjE5YXNT?=
 =?utf-8?B?dm5VbDY4TXBWbTJFdG1iN0UxaFRCQWp4ZDlqYjNmRkxFTFVZaDdrZnRtSktR?=
 =?utf-8?B?V21UMGk0SGhqRFdETC9pY1gxVWVET2cyemE4UW5na3BiQjRBbG5Za0dCQkUx?=
 =?utf-8?B?V0ZlSkJVUTNVRUhiTjN3dWZNZFpMS212cDhDVWRRdkdwZGRtYytwRUFjZ3lp?=
 =?utf-8?B?OTJ5cU9FTjFxT2N6cWh1Qko2TXJ1bkh0NzFvTkxkTXJtczhpdjFJNThMRisr?=
 =?utf-8?B?K0grZ25XbHJKL0hqWE02QTdXZUhTV0JHUFVuMndwL3RSZWxjODM5cUtoOUtj?=
 =?utf-8?B?RXRKd2NIOFAxZVBpZTFBNU5pMmVlTVAweGJSYVdEcW9YVDlJVnVsZ0txeUJh?=
 =?utf-8?B?YWs5RTlmSzVrSS9CUk11SEtFU3M1NVBYMVFsdyt4YUZSNVROZ3pwK0RvSmRy?=
 =?utf-8?B?MWtvMnczUGo4bFMzOFNQcTk2RGRZNmUrSWFWZjJ3cFZBN0Z6YUVCV25vY3ZM?=
 =?utf-8?B?WmlFYXBKcFVISHhjU1grRk0zOVdQU05VOC9IZkF1bjFMQ2tXS3Q3djJrOGRC?=
 =?utf-8?B?dkFVVTd3Rkg0cDFEZUkzRXVUYkxYeVRjQzBENHBWejIyRXF3Z21CTWNnbk93?=
 =?utf-8?B?YXlXckpKVTlvVzlPZmt4cWluUGExbm8yMTR3Y2NKYi9rTlRBOU11Zll1a1RS?=
 =?utf-8?B?eWoyYlVucFRJR0hXM2NLZlhyR1FWS1hydnAzZVh3MnlFWEhWeUtNaW0yaXVW?=
 =?utf-8?B?OUM2c29LaXNFMzgrbWhJOEhjVGtYcVlUZkxRSXkyTEhwUUZpMWYrY1ZUSytV?=
 =?utf-8?B?MXgvVzdqVWcremw1TnJYTnVQMzM5YkQ1TWZOWURyVWdreUNwMUFNQ2lQUEVw?=
 =?utf-8?B?dzFialJPTzJIREVzQXJCRDRnbERjclk0SVRGOERLeU5sd3lPZzRTMzJJSGJL?=
 =?utf-8?B?eGhNbHEyRU13OXU2ZTBsK284N0dRWmt3OURUelVGbExPY1NvZGQwbHRiWmtN?=
 =?utf-8?B?Uk51QkVjc25Kcm1PRGFlRmNONU5xeGlVMEU1emwvNC9RVkdpU3BlZlZHNCts?=
 =?utf-8?B?VzhWY1k0RUZROE5pdkFtWU9IdHV1V0NoRTJLbDJ6elNtTmpNVUlJdlNNcGZo?=
 =?utf-8?B?WmdNdEZDWFM1eGNqN0NYd25CUXdac1ZzRzJMcTNnalQ1RDlvRExQTjJZbjZI?=
 =?utf-8?B?VDFvcTFOaWRlWnFNbHp0dXlwMmpxTytMMkN4UDFWVWNnMWtESlR4UTlmQ2tM?=
 =?utf-8?B?OVU1eXZiT0pBQVlWeEZOTUs5YXAxbEVxMGFPMlU2ejFwT3ZUNDlLKzl6NzJJ?=
 =?utf-8?B?MXFUNmdoSGN4Q2w2RVJEYjA4N1UzNnhybUFGUFdMalg3ZGdQdGlOSVJBRXRO?=
 =?utf-8?B?angwNlduaG11cXptTXk1OHN4dzk0T1hya3d5T0Z0K0tLRUM3MklyNlpzYWFi?=
 =?utf-8?B?NW91UUNyYktNQW5uaHBQM3hkOFJScm1lb2xrbUZBSXJhOXQ0U2tJYkUvVng3?=
 =?utf-8?B?UUxLVHZpWnZGMHNZN1o5dEQzL01CR29MbUlVTHJlT0I0TTgwMkcxaERvdnRm?=
 =?utf-8?B?aXJZSEFaNkVqeFMvZC9VWk5jRzhrd0FMM0JrMEtRMldxVFR4Y3Y1SG5qd0Er?=
 =?utf-8?B?NnRwekdZWG1mSGF4TjNvZ1c0THJ2SVZjWGFpL0lRUEk0WFp5b25QUEpYd2RR?=
 =?utf-8?B?Z25Hc0FMa09zbW9ZeGtNSURFeGlub1R0bGUxTjJvNDVyckRkWWVrelltMXNP?=
 =?utf-8?B?azMvdTJ3eUNBc3VTc2M3RGdTV3FWMkVMNDBKVUVFL01sNWVNblRRRFAza0Nr?=
 =?utf-8?B?MWhDbllyV3IwOWdiM3F5aStOSktOZXhSeVprSEVHdko5WWh6Nm0rWSticFQz?=
 =?utf-8?B?djUwekdjYmRKeFhmajhHUDZqL1dnVkN5cVZCa3NUVmkrZVhlb0hKanRNTmFT?=
 =?utf-8?Q?oU6u4jvtku5AasGmhAZmtnrCO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c0ca8c-3eb0-4059-07da-08de0c5fcae6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:57:50.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SU43JoBF/qf16tpbKGRPR+pKmym71GByepSKHA4CnrMwsHCKHWGz2xPubbAmpKjYe34OwcSrspBUWnxEMby7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

On 10/16/2025, Liu Ying wrote:
> BTW, i.MX8qxp/qm DCs haven't got any Dither unit.

Hmm, sorry, I have to correct this - i.MX8qxp/qm DCs do have got Dither units,
and it's documented.

-- 
Regards,
Liu Ying
