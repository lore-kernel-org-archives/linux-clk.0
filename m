Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1D16F0EB
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 04:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731470404; cv=fail; b=iT20nYRVm9aINWiWYl0gjfaPlbiUQ5gyf+YQxvFs22LtyXXXsO/w71mMc4kiXlEmTo5ahUnvDIZeYT4trY+CMq6eepnaHY/tawvsGqdzkQCwqTB8YLaw/y8u9QN6ZEBEPTdlQZF+cm7K4FaHCrVys8bUqlkq3IPuvoY9CAAS/ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731470404; c=relaxed/simple;
	bh=wFLLMtefVVJlraQnZ66Rq3Wb0PAJgXWALpdA8DxxE8w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cPZouYv69htg/qiopQ0H2dzioPPjDNfH/J3t8VL72O8pY/fqOCHSV6jc8WFxDA1WfWuFHZl8AtpKzSc0YcBMiKO0FicD1d/H0wB2vYo2AbnYRrb5HTqF8KnQ3a7Sxf4oLxxGW1h0UT9LimW3miEjnz3e3n6Gc5Z066HmiKzwaOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jO/uH387; arc=fail smtp.client-ip=40.107.249.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jO/uH387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqkTQ1jceaNlGlXBXag3uk7185Hem70IYdwWTItN2tN+SfPPEfOn4cgKqFGQMnR8E4veFEXxkgaZhQAiLnf818oVE5mGkiIL1x62/h9xebkyvFrQQk8LvZPQ7KlEf1g3OmS87aLvp19hel9rwHDAYrn5eVFZDx72KNfARcrgXZC0rGBNmEWtiGJKvR3g+qq1jALcGmjl8mjKXH5TjwXtQksHsU/PpY2/lokXK3MepFomOl7CFcUqulEkWDrnYvazuyMfKXID29aaOqsOolEJViOo3bEVe1AtmDwNiZTyM3mGhOmHN47ulvuiZ3qeUF78OpvOOnNmGFgjvkxNEKlkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tvIdF3Ub0pRTxj0QUTOucTu8mWyCXiXYO7z/TZS6qg=;
 b=IIfASYZTFPttqkk/fZCsq3JrH5DU8WOmXoLny/wdnmTB9Bqlfh12E/f9aKgtPaJy7QLRJMCr9yxUR2xzuF3FjeX7E/8bfNI8Tu9WcSca3mCnXJCABow4LAT+dNXar5dsqKFXETjrrwxClqJaF8LRMzUk0mXYGtq6jFZzrVcf8nQ5JlLUp583daebIu202d0dgn2LnrUsVq3sG1rBtjFVnc/3SQvK+b488pFs0iqn9/Z8wHYtKb7NeH2DjK0gZSMX8eH3XlAoi/QRGizItOQ7DowmmhYlXprhKay8ckxOA0v7jyd9VUyVtP2UgrEBm9tgZ18DLlsn9ugsU+ETHajtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tvIdF3Ub0pRTxj0QUTOucTu8mWyCXiXYO7z/TZS6qg=;
 b=jO/uH387c50bhCulMNeB8BRde5+J+9kAIix7gdbpuMlzUonRZa6iy6g1kN3eoAkCgFxvs25H64zOa+hxlrTw5UJjErwHYJqHYMmaEUFysqbrFa3nFlR8cdCroYDB31HwJyY3/uPaHnWzHWhWsJ664ubkKNzSJBaJn5OA2V/i+9fZOs1CPhOxGxgD+yXNNBHqPkw/4M5TCnBGZMp7T1EL+vogFFaGVtTjlb6rOOD84glGcSDt2PDPwnAE8JJB2ovutW9AJK3lz5d/ahJvayFKHmyA5RUkjwiGNvGlr8QewpT3exjhSQ/kxlewQPZGWg36O4pdu4P4TkeoXd7FgWjPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10672.eurprd04.prod.outlook.com (2603:10a6:10:581::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 03:59:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 03:59:59 +0000
Message-ID: <83a67ab8-8f3e-4ab0-b68b-4da156817649@nxp.com>
Date: Wed, 13 Nov 2024 12:00:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org,
 shengjiu.wang@nxp.com
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241111214516.208820-1-marex@denx.de>
 <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
 <0a62d3b7-b435-40cf-9795-2fb4ea80a693@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <0a62d3b7-b435-40cf-9795-2fb4ea80a693@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: 74167243-fe11-4a42-c5a8-08dd0397a4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3RFM3VDdTd2V09KL0pTa3V5UEVnMWpsQW5tV0xyTGVCckx6eTZkWGJrcE5x?=
 =?utf-8?B?MmNtc3BvU0hvdFkwTUhrYW5NME5vdWtHc2owYi9IMUJQdEgyOXZaSnJKNXVp?=
 =?utf-8?B?Mnp1c2xFSVhEVmEzLzVGbUt1d1A3MUZqM0FqcTdyOTJqMnNaOElEeXpzU0Zp?=
 =?utf-8?B?ZzIrYjVGNG5DUVRNTUhaVElBaFRVTldXR2RJbzY2a0xUaW9pM1JGZVJZNC80?=
 =?utf-8?B?S2NKWkVHcU1zdStJVEtIZk9uYjdFQk8vUWtFbld5MW55NGRSUWRpVmZReWhu?=
 =?utf-8?B?S0NGT2dhTUFGeXhPRFhRR3M1YytKKzdFZnV2T1V6MVlNU1RTakFzUTk5Z25W?=
 =?utf-8?B?ajVMKzZjWWFhMjVHQVNJWHIyOC9oeXBiYzU1NE9HQXQ3R3BLZ25TQVhzWWVp?=
 =?utf-8?B?cjFpeW5YQ0dkNTRLaUFqMEtHSDA4WFBhTDhWWDg4VmhJN3NQMjNkcG13dmlJ?=
 =?utf-8?B?T2dwNnQra3ZubC9kRVNyQnNlb1VNeEQ0c2FkVGc0REVLNTVRYkFOdkg2MUdB?=
 =?utf-8?B?d1kyTXdSaTI2aHJsNmV5UWFlTzdWZ2tXaDZKcjNweDJrKytSc3ROVzMydlQz?=
 =?utf-8?B?NEtkL0xxTkVBL2tMZU12dHltMmkyS2ZSYkFUdmdyQ3NkV2R3VEhDZkhhNEhG?=
 =?utf-8?B?ZFptdGM0ajNzc0JwWjlDcDNxVVZYM3BMME8zMDFoL28xTmRucjFPT3RDaXBU?=
 =?utf-8?B?RmNEYklGTTd3UksyRG14K2JhYWptdWFpVUJONHRwc1oxYUFKMEdXeXpja1pL?=
 =?utf-8?B?QTBaajNoUnpENGdkMHNZTEZ0eG14Y2J0NEMzK0dzN2daRnl0ZGxKOEZXeXEv?=
 =?utf-8?B?VjNpQXNWdzJQZ3FEQS96dnBVZS9YS0dHaTdkOXVDcnBlVTUxNWZxMTZxUjMy?=
 =?utf-8?B?MDRDMXQ2dWVObFhBOTVnVWNGb1ZqYnVGMFhmYko2N0NvYmdxbW9oQzljSnVn?=
 =?utf-8?B?dkhEbnZNTkowakFkYXR4SGwzQ2ttS3FoSllISTl3VnVMRzdzNFZCSkxlWTQ2?=
 =?utf-8?B?RXA5Y3ZKT1VQTUdoZEZOdmVJREJvRkhycnZqTm1QNVMrR2Y2ejl6VElrZ256?=
 =?utf-8?B?NlVldXExNWJlTjBzTHRJYkJYbHFBVDYrS0kzZUFCbDJkeVgrNEZ2dS9kVGlj?=
 =?utf-8?B?UzFVNEZHdEVpMDAveU1VbStSOWppYW53OG1iY2xVbEZiYUY2RUdnSXBsWUNy?=
 =?utf-8?B?dG1WblJTNVl2OE9YZDlkdnloaWxRbUhCREY5NTk2RGkva2dzdGREVitKNkNa?=
 =?utf-8?B?Qmg2WWU2ZHIyemVIVFZtMTlaVXB4RmU1dnVtdHR1LzRaLzFwZUYraFNBR29q?=
 =?utf-8?B?QkFuOVE2MkVvaGtvMzhreWNLRzVseWRxNWZWVi9HRXZVQzdXZVVFb3lQOHVZ?=
 =?utf-8?B?Vlo5ZkI3eHVyYVE4N3A1R3JYZ0hzYSszQkE5ZlQrTEwvZGl3UXJUNTNwU2dm?=
 =?utf-8?B?c0RESStWUDdBcnpCOGhKd0NEbHMyNlQ0WE5zOXpiN0RrUDF4NTBhNVVKVXox?=
 =?utf-8?B?VU5VdjFsRm4wb2ZDbzhiK0hKRWJCazJ2cnVqOWxRdjMrUXg3UDFEajFWenFa?=
 =?utf-8?B?TWQ2c2UyeWs2dERuSkQ2WFEwZHI3b205TXhwTTJQR3ZxM05PU1FZYytsdU5I?=
 =?utf-8?B?YzAzUDdjeFFKTHRJS2toVGhlYTA4ZElac0lQV1IrT3ZMb3JxOWVHVU42S3M5?=
 =?utf-8?B?S0JKUE5VcDRLTytWakhRTTNBYnRJUXlNZVJjWVBKSnVpbzI0ZzluYjJEeCtJ?=
 =?utf-8?Q?i8wtls5TD9c26afmVybLAsnr+5nnQ6RDl21s3g0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnFrZGp5QVNOK295WGlKdzdJZ0VockUrRGtoc0krbHg4bnlpWFhPYkdHQWVI?=
 =?utf-8?B?UnhhbzE3UWYvTVlva3llY3N1TWxpaCszdk1VcWpPTkNMbGN3Kzh3WHRuU0tM?=
 =?utf-8?B?anZUV1BhQjBITE9OUlA2SklkNFpwY21obm1Rd3BRdEpvMStRZ0xUU0I3eEd4?=
 =?utf-8?B?RkhkV3ZJMWtZU0dnelUvaHFZZ1pjdit3SkZzNFhON1dLWGV6WWFONWpzUG5D?=
 =?utf-8?B?L2g3S3gzdWY3VE05SmZRMGFabFUvZHVwTmtXTzhJZVJjcWRqaWpZV0d0WHJY?=
 =?utf-8?B?TDJuM3hJWm9KOWg3clNCamZKMmNiTy9QVzFOTU41OTNyL2l0ZlpHRzYvb1A3?=
 =?utf-8?B?NkJBZ2drejduNU9DUHpQQXJ5UXVwNFZaZlBnNlZMSFFCSWU0SmNuRDVPN2FE?=
 =?utf-8?B?OEdoU3VrbFlDb2hBZVo1cXJSQUhZMDFSR3dlaEhKbnprY09Ha1d2RUYxd1FJ?=
 =?utf-8?B?cEQ5YnpOcUIwRjgxOXN3ek9aR21mLzhhT0FXQk1WVm4yN1JabmcyQ0UySWpU?=
 =?utf-8?B?NjdCRE1iR2VLSWt0ME5lNkp3WHhRVTA5WWRyN213Mlk2bWdCOGZVYjI2S1Ra?=
 =?utf-8?B?ZzVTb1ptOXZNY2gvTmlRV2RsVFd1aUl5SEZONU9HSElzTUt4KytMelFZOGZN?=
 =?utf-8?B?NExmbGFmWk5MbEozWFdPSmtxNlNTWFJWbUxybDBFWVNiOEI4QzVNZEdIOVoy?=
 =?utf-8?B?RkxuNmtTMU1OcjF3MzJ5N0J6cUVUMnlPVVJSMFZQdHpkK21oSlNQTVkzYmRr?=
 =?utf-8?B?eTNVM1VlbkNyNlhzUkFnd3BMK0I4SEVuVnBpZVZUMUM3MlFoNjNIaGp3OHpL?=
 =?utf-8?B?d2Z0S3BBVlFRNVFxbG41Z3c1NkZWVFZjNHhXUitZM1NjMGhBT1Z2a005L0Jl?=
 =?utf-8?B?cTdQVDV3ZGQwQVM5Ujd0WTBobGdXQnNKMUZSZG92c1JMS0NFVmV3MXpxTHBo?=
 =?utf-8?B?dUt6YnNNNUowY0JIa1pSeklPZHZ4TUJjZ1FaUHpXMEZzOVhXRUJZTy93ZHp5?=
 =?utf-8?B?QjNRVmdWUWpkZWlJODZ1VHlIWDNmM1kzU0NBUzcyaFE3OUN0SVNXVk5XTHNP?=
 =?utf-8?B?U3IrL2RJdzVWdi9QeGg4c1dzTG5oOHJpS2NkTGNOMXZDdkl0SGhobnhJR3E4?=
 =?utf-8?B?S2tnbFQ2eUhZSUxxaVN5b2VNWTY2Rkk3bGJYVmMrSkRpdFQwWG13TFptQllj?=
 =?utf-8?B?amQxODVEN3lWYU5lYmVPaTNXVVlLaWxXZDI2TXlPU09sRzhhL1pOUUhqRGQv?=
 =?utf-8?B?Z0VLejB2OHN3WWFOM1hwWkpYMDhGWCt3OWw2RjlrWEZDQ24rYzBGSEdHUjJG?=
 =?utf-8?B?cnlpZHI0L0wva2lhb0VzYThvZktiT2RrNjFsQ1l3WmxWTXJoeUlxUks1T3E2?=
 =?utf-8?B?M0g4TVlDaXk2OS90QTVJR2ZpYUVpa2FaemF3S20rRnhXanU0WnJoOEdXNlZH?=
 =?utf-8?B?SnBZM0dLWVZ4dGtxdnpueUhsSk1zQXZ4ajU4WWdic2E0NHJaQ1l5MENPWmpR?=
 =?utf-8?B?dmVCNTRwUEtaakcxa2NKeGRncjB3bjhPVkJjTlhJUWFITEFvSVF0YnRGblZQ?=
 =?utf-8?B?bGJrNHNsckFHSWhiUC9oVVlvYWlESUt5NUU3V0RuZUZvcmdWb3pENG5Uc0dQ?=
 =?utf-8?B?V0NVS0U5RWZDenBUVS9JSmwyL09GaEtTcEJaMDVnalJzUHE1OGVVUFFWU2tH?=
 =?utf-8?B?MGV0Zk9DUlFkMVNFcDlDRG5tL0E2WE9YWHF0WnZUci9OK2NVZHo5eGtMYlNX?=
 =?utf-8?B?MzI4aXd0L2FZTU5wenNseWVKY3VqdWVnZlFZVFlSVXVOUUtWekhmUzNSckg0?=
 =?utf-8?B?OWFSaEZuTlcvNHdlSmNSd3FaZXdoK1VKNzBCTi9JRk94TnkxWGM3aGtHU1FM?=
 =?utf-8?B?SzgxWjVtcEI4clQ0cjZGalFwK052L1d4Sis4M1lremhxRXhXejI5bEpMd3ow?=
 =?utf-8?B?alYwbHRCdldsUEV3WHR5UHc2RGRORURHdDRYOG1SZHMzMXp4Q2xXTnc0T0tU?=
 =?utf-8?B?UmxjOENxZHJFejRKYmJCMHhWYkY2aERlNkE2Nm1LNktBcU9Gb3JjZnZyOFlM?=
 =?utf-8?B?WUFMSTNXSFZ6UDRTUVNtYW1zTXBRRzQ2N2pYTlhzTVhFU2JKaisxdzkzemNY?=
 =?utf-8?Q?II82RnA7dvfm08pCP/5QOF+Jb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74167243-fe11-4a42-c5a8-08dd0397a4c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 03:59:59.7011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+1WV2Rtqtb5C1Ztm5sjM9/z/4lYF1JOmOPuEVQjVLtc2wwBj8NHNHzMh/8tcd2tS+AxCkgsrNiZmxr/w7Iikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10672

On 11/13/2024, Marek Vasut wrote:
> On 11/12/24 4:26 AM, Liu Ying wrote:
>> On 11/12/2024, Marek Vasut wrote:
>>> The pll1416x PLL so far only supports rates from a rate table passed
>>> during initialization. Calculating PLL settings dynamically helps in
>>> case e.g. multiple video outputs are used and they each need their own
>>> separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
>>> PLL1416x PLL3 can be used as another Video PLL for another output.
>>
>> Just want to point out that i.MX8MP audio AXI clock is supposed to be
>> derived from PLL3 to run at 600MHz in nominal mode(i.MX8MP data sheet
>> specifies that rate).  So, if a particular i.MX8MP system doesn't use
>> audio, PLL3 can be a free clock source to be used by an i.MX8MP display
>> pipeline, otherwise, video_pll1_out is supposed to be shared by i.MX8MP
>> MIPI DSI and LVDS display pipelines.
> 
> In the end, I started using Audio PLL and Video PLL PLL1443x for accurate pixel clock generation and PLL3 to feed CLKOUTn where the less accurate PLL3 PLL1416x is just fine.

If audio PLLs or PLL3 are free, I think you may use them for video output.

> 
> With the disparate display requirements, sharing one Video PLL for multiple outputs like DSI and LVDS is unrealistic. (maybe the next SoC should have some nice PLL per display output)

I think there are 2 cases where we may or have to share one video PLL
for DSI and LVDS.
1）It happens that the clock rate requirements of the 2 display pipelines
   can be met by one video PLL, e.g., an i.MX8MP platform uses both
   DSI to HDMI and LVDS to HDMI bridges - it's probably good enough to
   have users use typical display mode combinations, like 1920x1080p@60
   (DSI) + 1280x720p@60(LVDS).

   In this case, we share one video PLL deliberately.


2) If audio PLLs and PLL3 are used already(very likely by audio subsystem),
   then the 2 display pipelines have to share one video PLL.
   It's possible that the video PLL cannot meet the clock rate requirements
   for one or both of them unfortunately, but maybe that's something we
   have to accept.

> 
>> Currently, IMX8MP_CLK_AUDIO_AXI_SRC's parent is assigned to
>> IMX8MP_SYS_PLL1_800M in imx8mp.dtsi.  Although it's rate is assigned
>> to 600MHz, the actual rate is 400MHz according to clk_summary because
>> the divider cannot find a ratio to reach 600MHz from the clock source
>> running at 800MHz.  Looking at imx8mp_audio_axi_sels[], sys_pll3_out
>> is the only free/appropriate clock source that can derive 600MHz audio
>> AXI clock from.  Maybe, someone will change IMX8MP_CLK_AUDIO_AXI_SRC's
>> parent to IMX8MP_SYS_PLL3_OUT ?
> Is the 400 MHz sufficient for audio-axi or does it have some negative performance impact ? If the later, better send a patch to use PLL3 for audio-axi .

I'm adding Shengjiu to comment the audio part.

> 
> Thanks !

-- 
Regards,
Liu Ying

