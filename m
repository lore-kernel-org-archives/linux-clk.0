Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F72D2383;
	Fri, 28 Nov 2025 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299695; cv=fail; b=qa5nK7dLpyi8YJqoH5Xkiz8F6gEmLO51FOPzwrYXPG0t/JyHm6lqvbQuS7u3KLxhM4MKvWqbEKmYdKSHtWgM78zoosTf/5bFu+fOgBV2gSYEkP+lKD0OpBfzRTaHuCPvQ/eqgOjDjm2vCaceQgheXw2Mb9yXqZNCXcX1rAW2Els=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299695; c=relaxed/simple;
	bh=/K2kmrZYy1LANNEXF5bEI+9e0tLfh7x26PC1e0K/k8o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pSsMOv7UzDbgFcUo4gIE79/QkbYZPLam1EC5kPizgVfzKv6ekI+x3qxhg/5LyFicJb0rvfi5AUTtwfBR2wN8pw9s6LACOybEoJD1g8sRtRMlPiTd6ZPtpq7vWeWeHi5Oglf9JDuJGwnCMif1n6sJVINl2L6dijmO/qzBY2xiTzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uvY2NkJV; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uvY2NkJV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0iaWNums58WsC6KYzHvgS1r+3sakmLBtz4lh5XN63gnl4FJeWkQFIHZEDCk8jxx0nRQyUWMgyQtu9gO2n4t+PynEt90d8GErVvKdtSqtMPSu4HEDKb3u8qQZo8OicTscQq4N/0gy2z22FPVz56XjKkS/CbyfrYXQ61oFKUUiVeQq62IkSuEccVnpldyWbvv9rf4VjVrc1Pl4ZLIYdtHM8qVfIz7zX8V5smz8tUwovvTFBXdmsiNisqT+XomkDouX2yPDzDhssJ3tX3UNuoZo7QcF/jkQ1Rdn2ShboD0x7y8UIJ+mruDhHWoyTU3C23ywOyKDS5a0Nr5vc7xJBENYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQZyyhQQelKMj9EWYnTr80NraBxCPj3LhCYVoeJVvuc=;
 b=NIfyd8Lmpx47tXSpBV74p7ZvakA96kHsmvSDNWNE9Roj08nILtfMZl3Z19v3bXLcFhKAQfTLhw1+Xp2NBgCioN23QL5+IEsuZq8PBlONxQDP5yCb7TlGfQ1oXfCOD9A8u8in2VMZqEtysQ8hsg/WNgv7+cis5uYFI51RmzdOdQ56rkG4iXUcFC3mwYb45iN4WwfpS7Zwdt18kFVui9FYcdvx2VRbfV4y9y27HyhrEAFD3TyyODYigLovkcgl9uRKfwpGvzZ5YTVWFfqaeApxXlcYz9T1Y2AwbaOuiKi0r54Ub0E2tGWhsVdWh5ECodOlx77EkJIcCEc1ynj2rYC7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQZyyhQQelKMj9EWYnTr80NraBxCPj3LhCYVoeJVvuc=;
 b=uvY2NkJV2RvjAPNU4pmZ50rPdY796MRto3Bl7IQQjXonYC9AtoIo4+vqoCwz27tMBDQ4G/NNFIdvZuug8bRZPp+xfrfXj2nA/Qa3MaQk/j/ja87aHc5kLidv94CJ/W9SKjs/jBa6CclmBcU2sN3Yr2jxynZzzISQ80/zvAAkhgwpNiJn6WxjW6uNWbUL/LkJDOfM9IAPnqPiJzAf2+0CnpengeXyBHNtiqkglGmncRjyMblvax0mSr5NlEnfLPbnG5MMSo8CzgvwpE93S9MRVnywDyLro0SK+6+RsHHDEtxUvT+cmzW5dp5hTwY2dY/qXJ284AiY4jSN9bO7SmNuXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:48 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:14 +0800
Subject: [PATCH v6 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-5-cfafdb5d6811@nxp.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee4250a-4b2f-46a0-d8e5-08de2e2c49f3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW5RZ2JhUW4vTWJBaEtic2YydWgyYVV1TVV1QjBWeE5IS3pPN0tIWHB1VHBU?=
 =?utf-8?B?bHFRZWhkZjIyM2lpNzlxWGY0bTJpZ2F1cVZwZkYvNi9PUmp2TSsxcEgzRytv?=
 =?utf-8?B?NkM3dDNydUVNaUZKRHRtWUlvbFVwbFVweVNzeVBIcFVFN0tKZG8wMGVmY2tn?=
 =?utf-8?B?cVQ3TVQza1NFTDRCdEtVLzA4OVFydVpxZlREaDRVVmxSRzY4aGU1TGhLbTk0?=
 =?utf-8?B?WHM4T1dPNDdZRGxMRXNzazdUSmV5VUdCaFhUUjl0K0QzSGhYaWNJeVdQQXdS?=
 =?utf-8?B?UW9NSjlEbEd5d0REUHQra1M2dWFuWUtsMkQyY05adUh2cXlzWm9zLzdkcWF3?=
 =?utf-8?B?V21KcTVtY1ZHWk1XSzQxc25ibFc3WGt1d3pIMWRkRklRQ2I0VER6UDN6YWNU?=
 =?utf-8?B?OGo3U1NrRENmN2ZPd0haMjRGdWJCZDY0R1VJK2RIa1M4UlZxTEM4T09TbDA2?=
 =?utf-8?B?ZEpnc3JRTis0aWhkVi9ZSUxGTWdnVEExYU9kQ2ZhK0RTNzNmNUxhaHVYdFlS?=
 =?utf-8?B?MGFyc1Y2MkhiWXZuUFMxTGtLSURuSG9FTGlXMlVDM29aSDY5eThnNTRnT3hX?=
 =?utf-8?B?cVpTMHJyTUxYeWZPQ3BmNWFzclB1WE4xZUZiS1Fvc08xeFV5aFpjMXlCWXJR?=
 =?utf-8?B?Qmc2Zk00cFUvZVoxSVBKdHhFOE1hMmlkeDZoR0ppMHp1aDE3cXBEeCs3KzAr?=
 =?utf-8?B?QjgwYnY2S21GY0dvVFgxOUpycWxRNXR1blZMb08vQnVWYkVRdjVSeWRmSS96?=
 =?utf-8?B?cExUWE0yb09iKzQ0aER5MXlvQkpZMUQxZm5PM3RsZ3F3TXZvV3ZPTzhRVVZK?=
 =?utf-8?B?N241NXFHWS9lcEFRcFBnREFFS1hEZXhnYXY5Vnh5blZYeVMydVh4eHN6WUVD?=
 =?utf-8?B?aTdOdjV0eVBrSzEzeVo3aGlUQVIzWUFZRmJRb0p4a3dET0Q4d1dKSmF6Z0li?=
 =?utf-8?B?K2JxZEVyczRodjBxNGsrOHJ0cGtuTjBQemsrM3pyQXZtS1R1Ky9oZDBEbGxM?=
 =?utf-8?B?UTVJN1Nsa2NtNGFHK0tJYmpsZ0FlOXJiN2VDSEpoUy9uTEd6TDVuTEt2aHlF?=
 =?utf-8?B?N21WRGliMWRUb2Y1dXptelVRZnRpT0VpS2xEVlh0SXIxNHJqS2FGQVZ5d09s?=
 =?utf-8?B?QTdqZ1VSU2pOMWozbjl2aWxlWTBXQThmTThuMFphM0hFN2FUK2dGeThGNzM5?=
 =?utf-8?B?SmxVcVVXaW9YUi9YRzk0VGN1UWFVSGVEeEZkN0x2OEw3OWsrKzdwUVpRNDdn?=
 =?utf-8?B?ZUNyQ3dKTEhxemVHZHJ0NTJmQk5Wb3ZwdkFXdktsYUVWd20za2k0WHNSRE1E?=
 =?utf-8?B?TWg5cGhrVldraGNCMWM3UkJhQUNMUStUWVRRcWNvbVNtR25tL3MyOU43aG9p?=
 =?utf-8?B?VkswSHY4dWFWMzFZUVN1QVBLQ3l1ZDZRdmdGOTBOSEJGanhHSUI2YXdwZGJy?=
 =?utf-8?B?UzMvWFY2NmdTYTFoVUt6TGg3d3VHY0k2ZVRNWU84czZ6Umo5Q1pHTFdhK2FC?=
 =?utf-8?B?VGROR2hvRTZLS3Ura3UxVmIvSXJWL1JjOGVOR1d3Y1pPNXN1Z1VnMTdsT21Z?=
 =?utf-8?B?UW80VytoZXJ3dzV3Mzd5YU5sWG5ydmh0UTV1Z2hXcC9YNjlMQVM0TUtvOE1O?=
 =?utf-8?B?SlVRa21KaWtEaHFvRWVUdmg4aUNmOXZEQko2dldGYzJCNjJTQU0yOHhjNmZk?=
 =?utf-8?B?aGtEMWk4akZxc3RMd0phcmFRMVRnc1BpOXc4VHFna3hrd3hGNG1WbDc1MXpM?=
 =?utf-8?B?eXpOWENJVFZYV3llUFUyQ2haOTlkcitSWk1UQmhUSUVGeVRXVkk0ZTBncHFn?=
 =?utf-8?B?c3paYjRnTWJPejRKTHdMN2dMNFhMd2hRSm5DSi9JQTdTcGo0eU5hWDM4Qkd6?=
 =?utf-8?B?UC91ZitnK0JYT0FlZHZEa3kzakJyYlBrRlFzc3Y3M0huZW94Y1hrMlIxVnN4?=
 =?utf-8?B?Rk9PdWQyM1ZuTTJuL2FlWG1vd0hFamF0WnZuY21OQ1EyTlpOWk1nQVlaajg1?=
 =?utf-8?B?TWFUYnBib2p0VzVYUWo0bVhHVVAvSHZNUmJSUHkrcHAvWjlHSG1naFc3NkpE?=
 =?utf-8?Q?VAu0P4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdmK21XeXpvV2NxNEZPRG5STS9XT0VibHFwVkxpSDdSOUlITTFhdFdpNzNz?=
 =?utf-8?B?TExRakQ3d1BEK0xTRnJtTWtCcmxDaENnMmRuYVVlWUZxU0pzNTduREtRcjNW?=
 =?utf-8?B?ZmtETGtsanpjaEV3bCs3d3BEV096b0MzODUvQkJENGd1MzNVQUMwM3ZhbmFn?=
 =?utf-8?B?S1pMRTdBR3ltY0NJTGVBc0xPNXJabVc0dXZmeCtiRDdEOXNIZHVoYVYwaFN6?=
 =?utf-8?B?ZmNXOE96d1dxckJHY3l6M0F4elNBR1ZVQTBJRTVUMFNwT1hhbWpPdXphaUpI?=
 =?utf-8?B?OER0ckJpNmVhQjdhMS81YU85WFpoWVkxc0FOQStRSU0yMEp3aWNNTEtvQ3VZ?=
 =?utf-8?B?VkdrWFNNdWFhbnJkS21jbFZ0ZjI1cEk3RmpuQXI4c2dwTk54UmxaUExIbjZh?=
 =?utf-8?B?Qm9IY3Fzbi9DWklMWDhOTzlwSGs1ay9VRXQzcUpsL0QwQVhpZWY2anRnWksx?=
 =?utf-8?B?ZlhzbHYwNkN2WTA4bGsyY3c4NFVBcktmdEswamNGajFBeGFTeTBQSklTVngr?=
 =?utf-8?B?YzhIYWlMcHRsYzhFRE4wV1BySnQwU3Y3K1haSDNpV3dZQXpIeFBpRVB6a242?=
 =?utf-8?B?R1NGMlV3TEU1ZWtwUUpoclZYamIxSTlmcjJ4R0dXbVVtRlhEdy9yaGxMTWxC?=
 =?utf-8?B?RGNYd0wxSW85WnplcWpaaVlQL0hDVFU1V0p4UCtpTWxqUDNyd09RZFFwTnpt?=
 =?utf-8?B?UjVuVGM4QWoycVNSVTVmVlNlVXFWem9KVDBBOGYxMnJLOWFVMEI5M2tFeVl6?=
 =?utf-8?B?TDZkK0Q3MitNdmZ0bXhJMW0xWm5qQ0lrQlZhK2d6bHY1YW1tdjl1cktsb2I2?=
 =?utf-8?B?a2huMFZZa1FYbXdmTk1TemNnZG80T3BFN0cybG16czJseDlxOUN4dXlpTzd6?=
 =?utf-8?B?eW9zS2hadG14bCtadUpIbzZsbW9FNVF6SFpvNVZDbXZWeUQwV2x3bXhjM0g1?=
 =?utf-8?B?Y3hQVStWSmxUMUNSR2VuQ2ZtcS9KZWsycHJoYVlSaXFxT29nMUZXS2ZYZFhJ?=
 =?utf-8?B?eDdOdjJrVXp4djB2ZVBUcllRVTZXRXoxYUwwTGpiMmtZekcxd1Qxb1NaalZI?=
 =?utf-8?B?ckVUdmI1S0lqMkVlODZkbjAzanJpL2FSenZkc01zWUVtV0dubHpDWEkyWWJG?=
 =?utf-8?B?c2FHR0NZU3J5aTJ5NjV1TEc1VHVSL3dHZmVQaWpEcTM1Y1NxSDl6ZVM2OGlU?=
 =?utf-8?B?bERPR3VxNVZKWjNVeDdHbytMVTh1SWNnaHN3Wkc0Y1dZM1FjKzRQNlhCQlJ3?=
 =?utf-8?B?SDNvOEFrLy8zOTNQVmRvYSt4QUdBVTcrenFOcjA3OVkwVDFvMVFadjFHUzEx?=
 =?utf-8?B?UHJVU1JGa2p0OXNzb2NpOWc2ZDBFRmZzZnJlQlJSempQaThsaVE4QXNvVGo4?=
 =?utf-8?B?R3lzQW8vZkZDc3BRcXhCRVJFRzhwazNxUCt0S0FQZWtndi9qdmR6VmhuUVRT?=
 =?utf-8?B?VU1taVhZYXZMY1hFdFhxcXRlTFRoR280WURBZmlETmtpRlRTRHlHM1A2RFZS?=
 =?utf-8?B?Q3JGSmpUUlRyZE5KTEJCNkZGREtVNmdDejNKMlFnTVF3ZDlPYzdBcU8rdFFO?=
 =?utf-8?B?aHNaL0xFSCttNUZySlkxOTJ1ajAwMXRmVWJGR0wxWmI4RElHOTR1bDZvOGQ4?=
 =?utf-8?B?SEcrZmFnWVRWOVloc3pJekJmYlMrWW56dVloMFBoVDFtaWJYZEF4Q0trcWY5?=
 =?utf-8?B?amZ0MlhmQjlsWW83MlROSkRuRHNHR09lUmpkay9YRVQyeU1zTldYRGMwZlJQ?=
 =?utf-8?B?dU0ySllPTjRRTVFob1c5bVNkdGxzNk1GUWJKQTZNR2kreE10Vy9WWkpRWDVa?=
 =?utf-8?B?MERpcHQ5Z0psZkZXZTNVYWxsalhVK1g4Tjl0QmxzTWtEOE9ibTB5MlBFeGs1?=
 =?utf-8?B?ZFQyWUwzMXZuUy9sUXlJSG1sT2hyYmx4ZS9Bd2JmcGF0ZGExY3B2bWc0dXFs?=
 =?utf-8?B?NVo4RW00SGhhM21JanlHclpTaGY2a0VBZWFWMnlRMTdsL1dwd0ZJSDZJRW5Q?=
 =?utf-8?B?Q2prRUpsTVRobmEvRnhIODJTMnV6Z2Q0VXF3R1RVLzFqTUpGT0lEL0NFSSs3?=
 =?utf-8?B?VWwxbEUxOWxDekhUMWI5dWNHdkxab1EvL0RnTDcydVhYblpEdHExVExLSHY5?=
 =?utf-8?Q?5Y3m5LPbTrYBOYMUtfT4rIgDR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee4250a-4b2f-46a0-d8e5-08de2e2c49f3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:48.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8bUlzfPBUEc3Fk/qZVf5mNnwcmtlyK7WDgW4WO+CPr5+wHmvFXGr6FeuubWA7ep/99wyhnozbjOL0MO/FXzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

From: Peng Fan <peng.fan@nxp.com>

Added a new header file 'clk-scmi.h' to define common structures and
interfaces for the SCMI clock driver. This header will also be used by
OEM-specific extensions to ensure consistency and reusability.

Moved relevant structure definitions from the driver implementation to
'clk-scmi.h' to facilitate shared usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c | 27 +--------------------------
 drivers/clk/clk-scmi.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f1218c802d0ebb782c75a19057581c20..bf85924d61985eb9e596419349eb883e3817de73 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,32 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
-#define NOT_ATOMIC	false
-#define ATOMIC		true
-
-enum scmi_clk_feats {
-	SCMI_CLK_ATOMIC_SUPPORTED,
-	SCMI_CLK_STATE_CTRL_SUPPORTED,
-	SCMI_CLK_RATE_CTRL_SUPPORTED,
-	SCMI_CLK_PARENT_CTRL_SUPPORTED,
-	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
-	SCMI_CLK_FEATS_COUNT
-};
-
-#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
-
-static const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
-
-struct scmi_clk {
-	u32 id;
-	struct device *dev;
-	struct clk_hw hw;
-	const struct scmi_clock_info *info;
-	const struct scmi_protocol_handle *ph;
-	struct clk_parent_data *parent_data;
-};
-
-#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef6adc77c836dc2d599ff852cdc941f217ee388
--- /dev/null
+++ b/drivers/clk/clk-scmi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright 2025 NXP
+ */
+
+#ifndef __SCMI_CLK_H
+#define __SCMI_CLK_H
+
+#include <linux/bits.h>
+#include <linux/scmi_protocol.h>
+#include <linux/types.h>
+
+#define NOT_ATOMIC	false
+#define ATOMIC		true
+
+enum scmi_clk_feats {
+	SCMI_CLK_ATOMIC_SUPPORTED,
+	SCMI_CLK_STATE_CTRL_SUPPORTED,
+	SCMI_CLK_RATE_CTRL_SUPPORTED,
+	SCMI_CLK_PARENT_CTRL_SUPPORTED,
+	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_FEATS_COUNT
+};
+
+#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
+
+struct scmi_clk {
+	u32 id;
+	struct device *dev;
+	struct clk_hw hw;
+	const struct scmi_clock_info *info;
+	const struct scmi_protocol_handle *ph;
+	struct clk_parent_data *parent_data;
+};
+
+#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+
+extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
+
+#endif

-- 
2.37.1

