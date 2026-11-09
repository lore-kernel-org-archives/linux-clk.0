Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794224852;
	b=ODr5L94ZZEDluWlh7EXvEKnw3yVStPX7o0mS97qMHTmVmiZWlwxVXIOpB5ini3R2LqCJ
	 v3m8Fmna7Ea1sHPxFIjRYbPYUtwh5NS/e8VxEEzfSWpiymDKawjgPB8E/gtC3IVqhfRGh
	 BV+9RTkkVY2iaIYTiAGr+07uJYrzjqfiwHrxU9jLS82XYY869KsWTDHBhAlnGan5G91h9
	 UO4+fCu7faK7u3Vacscjf0SFtivqKMLtmFwpmNcMry/Soad3Iqb9XY0Mw4JiHPpJzhYUX
	 1Tb2aRxKqUrii3oxSPTEwhM9TMT72s0iXVgI3vJxjeDYt9F7JXFz7QqdXr0ccHNgyoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224852;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zejYo6rXn8vnxxbA3sA+psxusFx7O/G2HRG4yVx5QZk=;
	b=VVGymmQ0VjBY1bXyIaCYSEer/gCard2BT7fsDlPF3p30cYbUmjC2LaBV2M6Bwasi6agf
	 TOTaKRTCsUSsrDmm9SbaevOK5jbhtGKT24IXX25KryFUZk5Yc8I+YpnlSevTjjp6Bc+Ok
	 xk6crndSWNrWVjMnG0GkyMvSGmGnBB7RWEe5JasLiIFo6flvCopgV4gMQeUD6QjDGrs+m
	 P4o6l+7rc3xyrpSoIycxr3dBSYL/dftjEo2gU0HsBSR3PMKFau8P5cctr14jpafyGZGdn
	 FI1C294b/2wb2/qsgE123hR7m4p6EMgbw2UhS2DzfirLalzsp/GDw6Ql5U1ixih0adA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aTQzoeXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.48
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017A606A323;
	Mon,  9 Nov 2026 11:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5017A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aTQzoeXN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBYb/XZS2mP7mEW2aiFmMBGvPx3QHi6rY4Du6lGsF3U6jk4wj3B7a41aCR3EfI+Iu0UXhJOLQ/X5SNh8FlFbDSaK10A15Bej//6AgM8QNEVHY36M2A++vVorgYWOpmhxUzX4utRFOZwzIPR1PAd9xWZEu1zBu6UQOrurD/TvD0+w5cuZUY/wGPk5LvMmovuvgUcaBcr7MNKRB+B2ovOZWmMEen+QRG9vvnCEogiRCDo15sHpcadYAaISEenky9qtDjb0GjEP5dmwCVRwzL1hU9xBaOF7S7GQtEUaunq8AWlXR30hfSLtGwDY8xtxQjlnrrfB8N7EncVLBwtrUv33nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zejYo6rXn8vnxxbA3sA+psxusFx7O/G2HRG4yVx5QZk=;
 b=ohiFjyjCsEZC345ezwSVAJY4HYFVGOrDFrEVVL3JVn7gTapuobW3f8dt/OSHO5XGOXZ6P1IWt4nm0DlprEWWDCtIRDmBOpx1WKSxifRDrrdR6/9ujlGfm7q8RPx4qxCmcKOF+Sz9C25xPO3TxohqYXAIZoXB+uYxUQYvmOwzFxvtGpGvru90njTkTW985SXeqLN0HPA7DoawJ9hF/zrsTePvL+iz+6DvSKtGLlXb9Ft5l9sL0UwxSlVNQEFAycz4VwWxKHbvPDs6sa6mJMTQAlmFhrDBOH/tog1P2GRM4J8dD4F51R/IBKBkkfWjRXJ5RTD5BPaSk8SnfKsNGi46gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zejYo6rXn8vnxxbA3sA+psxusFx7O/G2HRG4yVx5QZk=;
 b=aTQzoeXNmwv0e+uxKADNpF99R0uNLDRvSwcbnJciaEP7UamrXnzHqT94PLqhsRyeEzBjihWG6++SpUp0KKDO1iDnDbemvZKMjyEvv49O50r/sMG6QQaLiSLXYOXoH1Bb1mwC1/r90LmVMjEPZXoXSljAu2J4bGJeRyJRC3FRGDbwvcc2vY1o2J0mj7bdez1rv6aZufDVx5zr1GMJ2sKI2nEPEEd2TV3NmjvXQKl0H+sxS+BaFNDwH1wrGXokGiStki9INdTMR9GmkW1/Zz++f58RuNv0DQFpSzXhgbezkSObUHbcuJxLqW2bA22I4OI4tp3xcBu+3cSqG5FCVuXLHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI0PR04MB10880.eurprd04.prod.outlook.com (2603:10a6:800:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:47:23 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:47:23 +0000
Message-ID: <f3f7414d-fe2f-43af-851b-e6b57faf9833@oss.nxp.com>
Date: Mon, 9 Nov 2026 13:51:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: imx: pll14xx: Fix potential integer overflow
To: Stefan Ghetu <stefan.ghetu@nxp.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, sboyd@kernel.org
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Florin Pavelescu <florin.pavelescu@nxp.com>
References: <20261109113138.10845-1-stefan.ghetu@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261109113138.10845-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI0PR04MB10880:EE_
X-MS-Office365-Filtering-Correlation-Id: 351f8644-09fa-4512-34c3-08df3e57383c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261028144727099003|261026121527099003|261022105027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wR6VgtsvBkKroADyorbqNoY5MvArn3n+W96WQfsRuHeA8SQ+QWwmbdnQr0JrQEIQBBw4+1AQB7KzDdhTOVGDLm4MUqX/MYNz80K46/DnprcOUnDYNFr5AHc6Yba02s95iDViZled2jJ340eiHf1SWS6QW1MDd/h9h3PumGirUBz5sqxSDfe6PzFQQZacFVe6Gp2f9iqKRImwmFGVuNACQTYpYScp/VuIDVhfZ/kNMG6IFUZGHRW5GxtJxFeCtun07mazWai1sD18e24Eo4ChXGoctSyWhPoLfQcekubZ1DcL4jsLEzICn8HR2hTRNVMa+z8jXZcxDZu+e9rtTe32Wowm9Ar6o1Mn+DW5QLsVqKI/cebrP6sQ+8W7Ojukah+h5YikAdc8l0+Kps6vXl+U9oYjsN5yjMkxW2wAq0rrZursv52qBiPBgqGaVlbX8y1LvyjLFiU8iCpXUGroae1p24RzWY/xSfrL4RineYWpH/na9wvvKMT+NB49N7Nxci+NHxFC40lImZsmtIK3yzzmgF59Wfj9kwKkIdv7ZfnSoyaSV30kB+6oxTaFlkHCRJo0pCF6KOqFuX/bUFcj4clErfYk1Vj4k1AKyCXW8aWPc1FWzu/Y/mkhk5DbrbUtzNrnLxJf/zNthDX/bBUtnTz8kCoPJd2uON7foKm5gNvNzDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUFjd2VBT0NzOERqeUVrd0FET3RQc3JNeElxWjlOWU9tQVNPUEJWQlNmUlB4?=
 =?utf-8?B?WDdUaFo2S081SVVDNFVHU1RMNGFFWGFsS1hGaVRCYU90Smx3eTJ2cEROamVK?=
 =?utf-8?B?SmQ5dWNxcCtXVDk0ME0zK1RVSmtqUXVpSE1JcUx6YlJsR29vYTBmK05GOUNv?=
 =?utf-8?B?bWlPNHJmWE1ZcDJrbWh3STdIckZCc082RjQzODhLeUg3N0lWZ09VTjlUU051?=
 =?utf-8?B?dUFzcDBqWjdXWXlmTVk4MzJxOTVZc1BUYWZPNzFHb1poVzdiaHljOTUzeTdr?=
 =?utf-8?B?Zmx2R0FVRlR1K3V4UEVCSjMycU9IRHJvRm5yNlo3Z1pWNUFXU1FsblVURHVh?=
 =?utf-8?B?SDQrLzRBRU96M3JpTDRLdGNmYWtkV1RtOS84MFpzQnB4aDgwdEFMV1hSeGpU?=
 =?utf-8?B?elFyTVNCalpQNUxJVmJPZ3RBVkRweWZGOVY5YlUwMVJWMGJ2WUVQem9ldWl2?=
 =?utf-8?B?WEg5MzhjSFk4NmpQRjExZWthd2tKQzhab2YxWDM3OGY4L1FvWGQ4ME9zN2Qx?=
 =?utf-8?B?VlM3dk9jRHFpNXZmNy9EZ0RDd0t4SGp1bXdvVlVVNzJPeFVEVklqdXpPZGNl?=
 =?utf-8?B?NWMxRmVhS2JaeU1raG5hMjlHR09RMDRxNnBuYU5CU2o5VnlpTFVOWEpyS0o1?=
 =?utf-8?B?RkJ3US9SWFEzZG50TlFweHU1RjErSWpEbStrajFIcGpFQ3M5OGRralloTDBI?=
 =?utf-8?B?SzI0Y0IzOXNHOUUyRGFqcGJYcTlCZmltRDA3QUUzWmxHOFRuRmkrV2FpdXhs?=
 =?utf-8?B?WDFGVFhUM2l4bytqbUdkTy9MSFBhYkg4dmVTbVhJd1Z1bUhZK2JNNVdvT1kx?=
 =?utf-8?B?bXltZVpyYUZkN3BreVdyb1Rzc1Qwb0pkYUFYa3d2aUJFTGM5dzEyeXRyZVdF?=
 =?utf-8?B?ZjNXNWlhZFM2MWVuSDRjVFpteHZaajVIUWdHdlloMjVXUFR4T1A4REs0TjBv?=
 =?utf-8?B?cm9pWmJyREQrY3d6UUkyZVB2RUcrSjhvNlEyZ3l0My9WalB6Z2NVOUJXZmtT?=
 =?utf-8?B?MUlHQzlPcmdOMy9WZTNqdHNQQ2psVkh3T09VbTBXVnpDSTNqTGcyRjJxeUFM?=
 =?utf-8?B?M3hSeHNqRGJpSDhkaGNWS2ExVklESEpJNVUzUlFxYjhqbkFQUzcyN09STERD?=
 =?utf-8?B?d0tsQlM2dURGVWhyM25VN1JzNkg0N2ZNWE00SjYySkl1VFBRUTlCc0gwL3Av?=
 =?utf-8?B?ckFIUHFGZThrdkUvVlZCYnBQeEFvS2NNN0VXRTdveWhMdjFpaHM0V2RhRzRD?=
 =?utf-8?B?OSszdG81TjdXMmVXWkxyMkl5TkY1OHFqenpZU0s1VUtnNDZ6VDBEVXVRaXRr?=
 =?utf-8?B?SS85NzJhWkViYkMzQ3drcXBtaksvUDFSY3JkcnhTTDNMckNXU3hEbjZacHVK?=
 =?utf-8?B?cXM4aEtHWnArb0MzRmVQV1hhUEVzWDR3TEh5cHA0T3dIRk5wMDVMWmZyWDFv?=
 =?utf-8?B?SFQycjJGNDZmb0orQVdueDhYSXp5S093U2J4TVppZFRteDVBVUVOSS9nWHJI?=
 =?utf-8?B?MjM0RlpsR2lzU1AxYVkyNTJFN09IUWNpdmFudnQ5UzNKdGFOUGpacjFsUSs4?=
 =?utf-8?B?aVFPZ0F0c0RkVWg4cWcwakNuZlBrTHdLK3puOHN0NFczZWxoMGdXMGlxL0My?=
 =?utf-8?B?czBVa3RFMWhjMkxoMEVsVXp0TjlrT2N4QklkTGV2bzJGQnNBSFdJQVNJU2dn?=
 =?utf-8?B?WHhoc3hRdWZtaDdWcHFxaWs3UGdWRGZ6UzdKelZJNEtINm1lREFuNUV0RUx2?=
 =?utf-8?B?cm5uUEFMVjh1NEdOeGxzOFhwRGJLZGNDelo4ZW0ySFJKZ2V1dlBSNVJRYy90?=
 =?utf-8?B?L3hWNkl4WHg0Zm9BdGlQNENMaWNrOU9pNSs1elhMM3FwWXVQNE5qVWJBUy9q?=
 =?utf-8?B?b1hsUmttOW1OTWN4eEx5MDlvZ2x1NHZJcXlyVU1sbE9FZHZXa2p1YkxPRG9m?=
 =?utf-8?B?ZWl0VllRWVpLektkRTk3cHJ6bHFsZHJ4YkVDWCszNzJYNmxsa3B2RThySUJu?=
 =?utf-8?B?UXNGbnMzdzZ2bmRXTzd1OVJSQVIxMTJPTkZ2Ulh5aGdudHdBU3I2RlhtNU1l?=
 =?utf-8?B?Z0laRjdzalJXQkNNS0tNU290TnVrMkYzYk1vaE9TSTV2WHlucGtGTFhxZy8w?=
 =?utf-8?B?eXZOWGs1MkFrVDIrdjYzOGdadjNXeFV4RTJPaGdrRVdXRVZzRWtqdkZzM1hM?=
 =?utf-8?B?N1VVN1UvK2V4eGpGY3NkWjZTMnhnSlJETVhsVzRVL0RGNXVEN2sxOCswWEZw?=
 =?utf-8?B?MFFZZS9rV2E2T09rcGVLU3A0UXJneDZHd1d1Z2ZIY29sc2hoeHNUMzFJTlhG?=
 =?utf-8?B?ZVFxY1MwUEEwM1dTWUFEb01SSk5QSXpSbEVnSkdPR0p1STFCdFA5Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351f8644-09fa-4512-34c3-08df3e57383c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:47:23.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7GWQ/s/MMAyEM2uw7ZLQ55vnREE4BiWgFIUwi9v1wU+4A2+RE+baFtkJ4FYAfoGltaaAdmcGFHDxegYBodmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10880

On 11/9/26 13:31, Stefan Ghetu wrote:
> [You don't often get email from stefan.ghetu@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Florin Pavelescu <florin.pavelescu@nxp.com>
> 
> Cast to u64, so that multiplications and additions will be done
> in 64-bit arithmetic and the possibility of integer overflow is eliminated.
> 
> Fixes: 53990cf9d5b48 ("clk: imx: pll14xx: consolidate rate calculation")
> Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


