Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013030.outbound.protection.outlook.com [52.101.83.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64B3C9ED4;
	Wed, 11 Mar 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240310; cv=fail; b=HlY3kPUi+vb1bNWwvJgQns2SgWDWKbNEpOqNIUCm4sm1HUF/v3l5mcFkLYLw2/2mWZh2KrCey0Gkb+nrNGfEqKoHUnNAOCMh9ouDufgslrnLjHfTnclzRg4K2M6yKQ9Mm9/+Meb96gbsn7TucTj/7umil97LPo/1jYsQobq0jyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240310; c=relaxed/simple;
	bh=ZjVBL5nIN7UdXXBaPxxyuIV8cLgpZVt0fJB03difWM8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UKNXsXvAocEx8XvhQ2hNFBuH4AKH+Wt1r1iwxb0wVnHjTLfChh3e4aD/+EeSL+Y26ujoC9VtEas6aQrB6sqlx6to7+ScC3u+goF8Ui/P6ldRD/YRlNRGORiktAcRly0KE3QZ/gPkAdQU5EFSmcp0A9fDqLeQDIBAIFCy7uPjQS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sEjENxJK; arc=fail smtp.client-ip=52.101.83.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sEjENxJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHv65D2pIYUFeYaKSBVdUelpC603bDouTPP6BdbF6oo/QId8xq1RpVC4cRyZsfdlYPRu/O5jNFhff0ay/T67rNBp39DovP0aCkzQMayU0ybmXkp80cFBDYihCVbx2kcKpPdvEruBataex58v8MJpHv+00uMNawypYkez7aoVq6fAfrvyk5+Nh+O2aUWGJ/INxHcI6yFgEQfH1M8N1g1oo1qJkak+NZm5L9avhRzCELibaEG1AaFHc6mibM6PXIJ51hUajGf7YqmhCMgUoPO+nBrxV24IkvOF0YKgJFKv1X/gCcByD5sIIV5xeiVpIpi+MgQH4VK1v9kM11u5fxXRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G5Y6rDKOuxF2tIQs56Clpl9B0ggAhnuqMINHbABTXI=;
 b=ewYGnbbKuJGVFjxBb6zJUoOBVgc923gmAqVyZ+BW0x0yQ3tJveMKJLEIdRAwH2gRziE+S+goWRkvtSeIcGPJinoD2HVrnrrIaNHOrg7mFj2QF5U7FHfHAXylCZfItsWYkVibfcEIkD5pWyqvvUoO0TivWhAFZMLnayryDzMFmPSESjKhNhfLbHYIGVF2Od59vUky1PcL1NVCzNt7b4MQ2Mq4h72PQ+eExnebqkADQn2CLYZSWo/ddFaRzZoIap7xRnm8N3XzX+MGYehhvIMSnNdBS8Y3L/vfZXikzcm8pGXeXmEzKql3pX/FV1NhFilcojEPRJvYkYMROgerl9EBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/G5Y6rDKOuxF2tIQs56Clpl9B0ggAhnuqMINHbABTXI=;
 b=sEjENxJKtNLuHm6jDPJjSiSbgbnBR4eXhO1jYH8PLvuPsA8g62tTFwkLTlbDxgAXONGoRvNTxMiYc7Bfm26iUhYigNFSVMEf/CtD05Be9LwG+nl+r8iagYt9aDOmDQpm/zXu4pLjTlEtKHBQLaVLkmVR9LvvkC81PE4AHIHoBmZY1wLFSbQkBxszdkmkhG/bVipbgHhf/cyaVDJ0IjnXG7oZz0uoFBMhaQk7I8fQcmAwmMjIX1D6rzTF3Y77Lqe6okTYLk3CSpCxUF6neaqlQsfgidoF1YQAPHQjvd2s+UZgZ294b5f/7iMvWTuqe1zwzLiEHOCCGeio0orD1Dit8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 14:45:02 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:45:02 +0000
Message-ID: <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
Date: Wed, 11 Mar 2026 16:48:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS
 display overlay
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: daf8a958-9748-4db6-7ef2-08de7f7cc69b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	b6fjf4QmOx3weXBa7ss3JrAIPpqNXb3plVcaPhiSedAnc9k/KZplvB2rPGzMSFP82CCMOQ4ldrbOXvc4kMiSGPfIu196/6n2yuq7ouOJos2LqWEqeGUrbL6jFKzjzWuvVRdu3rxTbR1FSyY1yXU+dAnyWWVnfw+6W10Q2guW/eHKDcZlfoCxWTBsgWTeOZ3peCtdNapqQUJUkWdX2kWKH5batfNzPD/CB8stGpfhFFVOyNvoUSo5Ap+9Eq3bcUk3HOeSlFnaARQvCP2n7g3OQiG8T0q4HRl6ghIrVoWOYxKH9YQqJLaIMUhzTDSaMmBA9iuT48UywBZFBst9h6GyrH+RMUe22GtumbbYwL4c2+dk2LzbsFzA8kWz8foYugZW0QiBRyC4pHkPFC3nBKkuJC9cuExSuGO/ahX9eE/JibvqTl94K4j4ZhJENs9b6j6gTMDvI+Bqr1QUqgSSxweL3VdX3418BtTm+bjL3HtMcIda3FhSsJzqmDyQ3bgb2kUYMbiYKLu7W5cSgJchZC8uICOSYrW1ZMCwquiylIm7jA1daE3T/77KeRB4AnNc6po28Pc+GofYlRFVoW2U/fOq/+JJov1HEeQ+KFF5/3Lp6LCmICKdEfsweWqls+nTzCwAKA78Ur5Z9AT+GUuP6FCEVBLQwaiswZvoQaAc4z5X+2ZZTF2NY1CwUkI4pKTteJBM0YuyNtmXGWu9iks5+iyHxFIDsLsG5zoYluiKVOz6i68ub8tQJcK/VPI81XK4f0cPmN2aewRcfCZ1h1ArcvLD6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXNkWDJhM0g0Y3NhbUdTczhMNUxSeUZGbUhsSUdEeG5lVDhKR1dTM0dZOTcx?=
 =?utf-8?B?czk3TVZEYTlTbGJJZUNjd3Y3aXNzRXo4aGlkVWxHQ0JpbUdFLzdSdytxdzJY?=
 =?utf-8?B?WGNtQ0FHVDIvYS9JL2lZUWxEK2p4V0dWSlh5Lytza29XQnVoeHk2dU9VWUNv?=
 =?utf-8?B?YmE4dExDUmdWSEU5YTJSYXJva1FsWSs1L2srT01BQzRUTEsvSDhkMm42YktZ?=
 =?utf-8?B?bFRIZjE5bFJlQURSbHNZd0w2TFBFTWh3cnRUTnB4dEdzS2VqaGlCb2NPcm9i?=
 =?utf-8?B?YktvRzdiSnJzaDZQSyszeFA4cCtDK0c4M0xaWTJVRVRaM2R1anNSTktCUmtG?=
 =?utf-8?B?VEtsNk5xcHlYd3ArU1VQYi9GaEZ2aTNteW4xZG5wL0toYlVLZXJFUDMyRmFV?=
 =?utf-8?B?ZlNSeU9jcTlVNXNDM3dFVS9MVU40djlPTktWY2t1a1ZyTG9LNTZZZE9uUlJP?=
 =?utf-8?B?MWozQ2I2cDZYN1FiMXhnMS9kTFcweEFDSWtUQTQ3ZkVYMGM3QWFuKy9obEVZ?=
 =?utf-8?B?Wkx0dkRzU0kxaWpCTjh0d2RyeXdvYmFZMUtIdUtXalA2ZFVIYW5LcVdVMTQz?=
 =?utf-8?B?MU9aWjkrMG9kTUlsdW14RHJvL2s4RGNHQy8vcER0d2hOdjlIalE3TWZGVStB?=
 =?utf-8?B?UDFXYTJHL2tURDh4cnJUYkUvT1RTZXVmTWhRY3V4bjFOREVBTzg0MHIrUTZL?=
 =?utf-8?B?QlZzWDA3RUVNeXg5dFJwdG9LT2RUTTlWcWt3TXgwZ2RCNGtDVFc4aERydkxI?=
 =?utf-8?B?MC91NDI4U1UxVHpUUGt2UjdCRkd4bDVNMmFpNitZempaTi9zSmZJQUFoQnRj?=
 =?utf-8?B?UGRJTG03RDgrV2J5amZZZHE0NE04emQ3a1VQTlIwRUhyT1pKdFVBUjBDNnlu?=
 =?utf-8?B?TkkyZzdKamJPcDlJajg0WFRhQWEzVzJwdlh3SkNJVlVDVGUwMVBIK1lpQVNx?=
 =?utf-8?B?ejZQNVVVcjhUMm9qVDllNndESGNud0dFTG1kS2FQU3F3UkVxWTRjY041U1l5?=
 =?utf-8?B?MDFENS9RUWNrWlBLVGFSUCtuU3JvRnNlT2EwZEl3TzlTVXRVZVNaRDgrMkYw?=
 =?utf-8?B?MllGZ2FKMGhKQTJjTkpiVnh4TURhOFVwUDZHMGhVenVudHYwOVJTVHplb2o5?=
 =?utf-8?B?RWV1NjVjeVBwRXBRYTFnZklLb1AyaTFqYVpHUTVXeEpwVFhzdW5BTEVEL0pH?=
 =?utf-8?B?bkpmbm1PSEUwdTUwcE9PZUVTS2xQOUNNQ0JxQUxJZ2RlNnpGRnlmZmc3VDU0?=
 =?utf-8?B?NndyUmIva0lIZCs0ZVVDUmhIbnJsa3NrVERnYzYyNkZCWVZZZ3p6STZGTXVU?=
 =?utf-8?B?Ny9PTWZ6Ri9uUStQR1JYUEZJWXlOMEo3OTcwNUdhS3BRRHVhelVBbnowUTRK?=
 =?utf-8?B?VW5keUd1L2NZVlBtREd3UWx4bXlOZmVlQ2FXVVhyK2lPdy9nV3VXTlg0bmM2?=
 =?utf-8?B?K2hsWm5sRGQ5c2dpUkhFU2FiUlkxWUw4SVFLLzNpK3ZCZEVpQ0kvTkxsbGh2?=
 =?utf-8?B?K2djc3NlNWp6aHAzbXpNSStkMEM1eUNUY3BmK3YyV3FTSE5kYm1YanlIQW45?=
 =?utf-8?B?cis5RmNnUlo0N0ZNSDhlWXZhT2lSY3hkRGtOOGg3ckNNa0N6d1pOOG11NzNy?=
 =?utf-8?B?NXF5SEl1cnZBQWFwMzdqUzBXNFovRjlCNHQwTGFJQUY2WG5GangyaE4rVHJZ?=
 =?utf-8?B?SDZyaFYxMGVwSGFwcStYRExEUkJVSkVKNUxBUVRJSUZpTzZwSHB5SWJKOTNo?=
 =?utf-8?B?anVEL0Q3bjk5Ny9aQi9YNkpmZURrMUdrNTduRy9BMDZzd1IwZUczdExqdkhh?=
 =?utf-8?B?WGhaREZNdXdDb29VOSt6WlNCY29SS0VKeTVPNlcvTWFidE4vL1VSc01MSUs5?=
 =?utf-8?B?ZmFZcEZEUXRrSTJjalU5R3NsNHNPT2xNeDlTL2NJai9kZWRvdHhCU0IxSDNJ?=
 =?utf-8?B?Y21NcHhRV0gzTlFLekozeHdOQWpVQUFCSDNqdWRlaUNWY05ZVWxLUjIyYi80?=
 =?utf-8?B?V2wwZ2x1ZzJwL3RLSTlweWpoeVJPd2NBSUQ5ZzZQRlJHWFQxV09ZMG9rWVl4?=
 =?utf-8?B?ZkZBcG9Zd0ZVUGNKZGNwa01XVUZxQkhkRld6Y2lmWmFKYTNwclJXTkJTM3BE?=
 =?utf-8?B?MnFibjZPZktTbGFJYko5WnZVYVNwdjBRcFY3Qkoyb0s0NW1sUmpqTC9nY2Z4?=
 =?utf-8?B?Rk5hT1AwbmlNMTQwdFdVa2J5aGdmUFZKeFNuMjhaYUl1SlRaQnVKMllFWjU4?=
 =?utf-8?B?aE1NY3VqYjB2aE5icEcrQ3VrSjVza3NON0J3Y0hOOTQ5dUZJWTFIaGxHZ2ZN?=
 =?utf-8?B?WkRaOExWSUlyV3JuU0xxK29ML2RqZTBzcm94aCtSV20zK2FkTjBWQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf8a958-9748-4db6-7ef2-08de7f7cc69b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:45:01.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRP3R1TUnfH3o+QJUvUBT4WjJGiIweG00VQbrUhhTvoukJ+RzZpi1LEXfWT4TTS2yNLeJjj/Mn4cBhBCBO57Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432

On 3/11/26 16:32, Alexander Stein wrote:
> +
> +&panel_in {
> +	remote-endpoint = <&lvds_encoder_output>;
> +};
> +
> +&dpi_bridge {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgbdisp>;
> +	status = "okay";
> +};
> -- 

Hi Alexander,

Any reason for dpi_bridge breaking the alphabetical order?


