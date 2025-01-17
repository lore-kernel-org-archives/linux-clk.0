Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020105.outbound.protection.outlook.com [52.101.128.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79751F76CA;
	Fri, 17 Jan 2025 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737100926; cv=fail; b=MacGUnidpITXBPXVt/2BgZlS7hlDZdV24kSVPfv3BAyhQ5qc18HGI1vgZFpYS4zZaBjS1QKBOSrlV+gjefZoQ5gJZ6wtRNth5pNY9GGSChgU75UXx9kvxfFFBXisQvUYo2bKnNZkbPtCATC0E2rYJt2YZ2WG+/Hp0LbiK82IQto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737100926; c=relaxed/simple;
	bh=kNjedtPbGqTFsKW/k9xNX3stZIYtFjxaMofdFvYMmxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qdz3JR52TR46t7tflMEOQJZwN419KdHLXH67Vr9K6rpS/4wUOnaTlq4YJnn+fd1NlIv3abCmW3ly4sb70dCFpOgdX6d5J1BgynHUYOBKoDj9zYzxbia63LiXieuZ4Wr5KPvkYnxjDWYA/4Oh3m9rakmO5VB4st7INdLVqpgIwLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=po+8/o5l; arc=fail smtp.client-ip=52.101.128.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="po+8/o5l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKprf6LLd24Nw4YhUajpct+Ok5wosl3Z2TOEHOaj5+fZt/d5dS6XoJuJ5YFVe4yNb1SfOesT7hy3hqVEsSst9iMU5/Ns+nDsXtdB/DjqSfT2VGPQBWfxfcGrJMhtHCu3sFuINPb0MoyWsr65v7jtG4hnXaEbUALtc44Euv/r3ZleR/T1ojpWfAIYqTbkYotPipw/6vGkmgVpMBAYaQpVB1zjFQdJih1r7CLsdGC1VlAwGl1hqxPBTIymg1/QUKReP7eO4pC0pLq/K8KDPT4QTajcGQRsiI9+OjecaSWFQIe5c7eZIFtkwn9T+oG3+xIyKcL546owb3y2xDlYuft4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0kaBaIXeDDQAzpvGPMg5ITUf/TulrUMuScRTosbNxY=;
 b=s4TKcbJLIrH8KeKetFaG7mme4j1BNCN8LeaMROxi/sfE+cgAzlTlZqPoGpMS2N0lA16QKqgTF+6X2cqFZyZ7Steql9sGpgUwlMYZy1NUxCk7xDdIDWY2GUJaIf9cOShk9vdqSGREyKPS96PSpQWgLut9xy6xIEmggzRGrIprDlIZMip+WnICdngiC+QasrnF2RFPX+/g6ldS15a4mf4qF33l2lXJgkhLGHnwn7zZBRtPJ7YIsqtznO3OVuPi7z5+LC4C92yX7YLF5jfPKKJTgLasCzb0yH5lLQyzRTr5xEfc8swrODkacDFTzf+eUT/+YDbUZtlVgOupX/o4ZuYZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0kaBaIXeDDQAzpvGPMg5ITUf/TulrUMuScRTosbNxY=;
 b=po+8/o5lAYpiZ42Fwxiv9TrXChLX4CXadq1adP+mHl8O7lO//+92EY9k/541x81WK5ow08F3CUOuGQqumh5cfJyCIkLbgzoSnFBcV9+I7mkeBt2+f/d5kxfildG46lyEqKTO1gnlB5b7CY+RoAOhlyAkx6LpgF7H97oG88jpdZGzVDPoWUnKaNh1fO4CitWwRhKhQv0VnF1e+SRQXXajejCCFKQc7dnjOyNXcWV3hUyvR3jOHF05hIfJKCTWxf28IIFxGs1Uj9iOvfWysgpcGsUGdT/dxeuADeeN7lBONPSzL/+yGwGxGxs7lrZFnjDdaYHZn3bzLXJpuq4X6ba1tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYSPR03MB7642.apcprd03.prod.outlook.com (2603:1096:400:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:01:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:01:58 +0000
Message-ID: <33d3ed1b-be77-4ea1-b0ac-ba150ee0490f@amlogic.com>
Date: Fri, 17 Jan 2025 16:01:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-2-jian.hu@amlogic.com>
 <20250110155404.GA2928945-robh@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20250110155404.GA2928945-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:3:17::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYSPR03MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: d382be02-ca57-4644-a85f-08dd36cd3745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0oxWTRQejNOVU1uQm5IMnZsZHlDeDBxL2owUVBzTlRuVUJFUDE5YzFzMjhh?=
 =?utf-8?B?SGFEN0FyWHVHblBmQWU0ZnM4TEhsblVZVHI0M1Iza2k5N3BoOEUyUUs0K1dB?=
 =?utf-8?B?c1lNZnhuTlVZZEQyMlRidzdZS1ZtVndDaElrU245RzZMVll2ZjdpZHlpNmJj?=
 =?utf-8?B?NlFzTU1NOVp1azcyTmNhaHNnWjRNaXhzaXBEcGxuYlU2aGYzVzFjWit2M0hM?=
 =?utf-8?B?THhvbGRTNmZ1Vnd3RTZsQ0sxOTRNL1FuMTltZDlVYnNWRmZTczVlTTR0ZVl5?=
 =?utf-8?B?NjRPSjJqblF4ak5kNnc5c09BdU5Hc0R3M0hsWTVqSjRmb3p2alFEc1ZWdzRX?=
 =?utf-8?B?SStGa3BISnNmWUdQZzllaTQzaGVlY054TkIya3VaRis0ak9kK01QSVlNaGdP?=
 =?utf-8?B?NVNUR0VOS3g2a1VvbWhwL1c4Rk13N3ZIUForMmw4c3VDSFZKMk5janFvMXRj?=
 =?utf-8?B?L2VDN1RhQVV6M3FrUWljYjA3TEswRHIxR2JSc3l5cHFxVmJ0SlF4ZGJMejBx?=
 =?utf-8?B?SU9hd1Q3R2ZFM0djSkZsQXNJRkVMeTAyWExvYVZnd0pvSGxJeSt4M1oyMjlT?=
 =?utf-8?B?TGltSnFZTzlqZmdPTnJyNVRjQjlnQTBSdUFpSVdDU2t1YVpJRjAyUHBWK0xq?=
 =?utf-8?B?VW5WOWdDdlAzaU9lRW5Ka0F4YktLcUYvSzlnOEd3dVNPRkxqMTlpdGRLT1M5?=
 =?utf-8?B?SXhkejJpaFZ4cG1PRFVtK1lhdzJOODkra3RKSGVtQVhvRWJsaytWY3lhWVp6?=
 =?utf-8?B?MTdUYnZ3QTNVVnpIWHg1RmM3Z2pvU3dqTDFCaVY3V1lQYkROOHVSZml1Wldl?=
 =?utf-8?B?cnBsc1hNcVBMV2wzK3FVZFovNExQOWNsaGhDWVMrMmQwYWNLNlBNYkVORnNj?=
 =?utf-8?B?VHRmTHNOaFJtWCsvM2Z6TTlreTJrZHlmY3crWkRxM3ZFSDhmS2ZzWGQ1d2s1?=
 =?utf-8?B?Ym8weTZTa0kxYmdnaHRFdTJMTlRUbnRab3Vid3RwZmpOTzRZSG5oRzhxUk1L?=
 =?utf-8?B?WTJzV2psbTZBWUNJQ3hmb2l6bjdpK3FLejRmVWhSTE1yZHBiN3U0RVRoMFNT?=
 =?utf-8?B?azFYd0cyNmhFUGF3U0NySVRTekhPQkhSd21ic05BYUJPUFBLNnRoOHFjTjBE?=
 =?utf-8?B?VlhWRFk2dGxJQWJzZHd2RktiU1JwRW1BRDRBYkg4Q3NrbHA3U1NLK0ozTkJZ?=
 =?utf-8?B?NzRlZlV6NkhsMUlKVzA2UEE0cG9JZm9mK0tOTVhMTEJGcnBFNnBKVVBHMTRC?=
 =?utf-8?B?T2pJY0U0VytFa0NYS2E2ck02VGhIRUNNampsaHRhc2dBWlBhSjdMcnVnZk95?=
 =?utf-8?B?US8wTUVMMk1KTDZjeEVrTDBMdWlndGFzTzM1M08xdDZXTkZ3ei9OQ3F4b01i?=
 =?utf-8?B?aDkrUGRDY0hxL1N0d2k2UFd6aVMraVRQanVzTnhOUzhLU1oyOVpMZjZYaFh4?=
 =?utf-8?B?Ynoydi9pU2xvOFJGTmZ2UWQ1amlWcHVZZTlFK3JWZmRxSXNubFlEU1BHbkht?=
 =?utf-8?B?ZlQ2anArU1NQYmxOSUhlRWs4bkN4WDdyYU5aRFM0Z0cxLzZFTFR5QXc2RStG?=
 =?utf-8?B?elpySjJ5NmVsTFZrUGFNdGVyckdRTVJCOTgxbUJaVk54L254emJnSmtmZ0hO?=
 =?utf-8?B?VjNDZmVIYy94ODZBYktxOFhyL3h5RXVTbHA2ZUJKNW1nU01lN3p5dVB6QlFE?=
 =?utf-8?B?WWtuNU5DSUZwaTdOZWtmQUJITWovdDR4TFJ6UngxZ0Q2dE1ObktDdzc3eDBM?=
 =?utf-8?B?bU05UExwZTlNblBZN2doSmRiWmlYb2dvbjEwOW5YQTJwOVdJNkF2NUswNjZY?=
 =?utf-8?B?bTFvRndFeDNNTzNQSEJDQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1c0b1FNeXlIMXJGZ2p1ZkF0ajdrbGl3OGVwMG5PSHFiTUF0M1EzTktRbFJI?=
 =?utf-8?B?ZVAzOTBZcEZNdTdpbHdBaDN3Y1E1UC9Edm1peXU2a00rbk93V3pNSjZPMXhr?=
 =?utf-8?B?YmJacHA2cDFKTFdYc2JVcDEvVytjS1kzeDFQV1pSd095TlA2cHNKVjBhdjdm?=
 =?utf-8?B?aURPaXhFSXp6YWlrWDQ0VFJoM0RNN1RqdWNpTlE4TUg1ak9XbCsyeUpBalJk?=
 =?utf-8?B?d1IyZlF0NzdzZVVhLyt3WFF5SWs4TlNBS0REcUdPclpTN2YxUk0yOUJ5NEcz?=
 =?utf-8?B?NmFNZWJLeTJOVFY1K09Ha0ZmV2dBZWtzZ1F1dFc3emhHeEh6akIwZ1M3VFhE?=
 =?utf-8?B?Mnc2Y21DYkppUEcveHY1ZVdmWTFrM3ptRDkzNFlBbU9NTlBJUXhZWXU0anVz?=
 =?utf-8?B?UzVseitJT1RYMHdEMVhjMS9pZ1Q3Qk5rRUYzSG5CVFBZNnNvNU1pYjlLSHdC?=
 =?utf-8?B?aDN4TzBBc1BXVEpLK2RVNkluSThCeG9HeSsyZzM0WERkY2V5UWVJcHJ0cHFI?=
 =?utf-8?B?ZlZqV1BXbi9xZWlIME9hNHowNURwUTJTdW5MQlpjUVBPbk1jbGF2TXY2QWV0?=
 =?utf-8?B?MXpmUlpKUzJjYmV5NG0vaVVBcnFyY0tBZkU0REhOeVUxUnVMNHhBUmhBV2x5?=
 =?utf-8?B?MmdzakJHV3BqTTdCZVJoZ0lSNjc2VVBFb0ZWSmFONnpISHd1UFFQNTBySVdV?=
 =?utf-8?B?REJKYWF5WGNNWEgxWERqak1lc0MvTTBPL2I5OWd4YmQ2YVU0Mi9KTEUvS0ZS?=
 =?utf-8?B?Zjg1TDhQTk9mbk44bThqZ2FRNy9SZ09tTTRKYVRIRHM5SVhPNHBLWXN2VnJX?=
 =?utf-8?B?UGlIWEl6WGJwMnlQUUFseldPMCtGak9QbjBZU1ZmQlBTdHM0cEN5N0xyTTlI?=
 =?utf-8?B?clFQN1RDUFcxRG11QTJCbW9MUkNXeVorS3I1NHlpeTZPMU1yTElEOHh3dHBV?=
 =?utf-8?B?RnZ1aDJMNW9ab0E2bzArN3BqT2lSYkczY29rK2pKTWRmYnltMURkTTkweGtC?=
 =?utf-8?B?cFpyQ05lSDY5aHpVRUhldjhHTWJuR2dYaXFWb3hEV0VpTWZDWDE3TlVXQUVN?=
 =?utf-8?B?Ym41ZHRWeEN4bXREZWRLK1JyRVJ3aEVwYVQ4c0xPcmE5L1BhSXFZcmFyWW9i?=
 =?utf-8?B?bWRmTzdlQWE3Q1BZOTlzQzFRY3ZvK1IyVnU3YnptbU5kRkdhMk9OSGVHOVQ1?=
 =?utf-8?B?WEtFbmZLY3c5V0xrcmt6Y3k2ZlFsZm1WT3RyVDQxc1Z5QUw5Y2VmNXlQQWFO?=
 =?utf-8?B?RkVET09hRml5QzRpMGQ2ZG9WVzFIa3J3MXFYQ3lVRlFBUVMvM0ZPbjNiZmpm?=
 =?utf-8?B?bWtESExqbjA5aXc1U1ZwNEZTdXlRRHR2TUFlNU1vZTh4RUlXNEJvQ25JNVJM?=
 =?utf-8?B?WWVkN0t5blJVZlpzZjllckd0NWo4N3NxUDZjdmJGbnZ2MkdhZFV6Z1BrOUtC?=
 =?utf-8?B?Uis0WDFpdmxwV1IvRFdUOXFidDBZKzF4SWNRWFZabUpieDFhMVJSUW1QYmJL?=
 =?utf-8?B?UmhBTWQzN2xGWDQ1WHZWZTY4SEhyY1hhWkRvWVo5U2p2UTVGazhtUEhJVTly?=
 =?utf-8?B?YjMzQkw1NjcydTQxT2JpaXNHRWYzYjZxL1E0UFZjQVR3bE1PT2NSSEJXdmxk?=
 =?utf-8?B?elgwZnlCS0VFNGJ0bUw3clpGRUhibitpaEkwWUdkZnFNK09mNFI1QmM1YUZs?=
 =?utf-8?B?UVJwdS9FS0o5MFV4OEFwU1RPZVBGSm00dUhsVVMyTFpDYWQrT0ZZSWtFdTdB?=
 =?utf-8?B?TFYySlpjY0s4MFFHOEJkUlVTdzd1dk5BZEdweFQ3aFBnT1lNbVpFRExKUWor?=
 =?utf-8?B?RTA5MU9QckhtZmthYjBrSjRZaWVGU0xHeWVRWDV4cm5tQzlEc0VCd1Qzc2FC?=
 =?utf-8?B?Z0Z2RDNwTzJUR3BWT2R5YXNlTkJUdjJndVhHZ2NXSS9FYkY5VnZKYjNMSWRq?=
 =?utf-8?B?VDE4cFk4NDRCU2lWTFdFV2JJWGpTeUNYOXdFbHNzM1BqZEhZN0k2c2I4L2lJ?=
 =?utf-8?B?dTlxalNaWXFmRFdLQTlubEZqbVJQdEhDUUM3WjFMczFyRnBVaGJjZEs5Z2Rn?=
 =?utf-8?B?ano0ZVBoTk1NVlpSQkRZRFFwQjFEZjJsb0VPRUdmSlV5MFR6LzVYdElyVm4v?=
 =?utf-8?Q?6o3GUD3SsvtHKkPusci8+wdGd?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d382be02-ca57-4644-a85f-08dd36cd3745
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:01:58.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7/1DjAZmAa5zAqirrV3YL4LC/BULXJagC7LoH7CTN7gYdQN3IcSBPuFBxh76pdMXSArVRLZpyVV0gMMwtkG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7642

Hi, Rob

Thanks for your review

On 2025/1/10 23:54, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
>
> On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
>> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>>   .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>>   2 files changed, 160 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..fd0323678d37
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic T7 PLL Clock Control Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +if:
> Move this after 'required' section.
>
> Generally we put 'if' under 'allOf' because we're likely to have another
> if/then schema on the next compatible added. If you don't think this
> binding will ever get used on another chip, then it is fine as-is.


OK,  I will move 'if' after 'required'.  and add two 'if' for them.

>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: amlogic,t7-pll-mclk
>> +
>> +then:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: mclk pll input oscillator gate
>> +        - description: 24M oscillator input clock source for mclk_sel_0
>> +        - description: fix 50Mhz input clock source for mclk_sel_0
>> +
>> +    clock-names:
>> +      items:
>> +        - const: input
>> +        - const: mclk_in0
>> +        - const: mclk_in1
> Move these to top-level and then both of these are just 'minItems: 3'.


Ok.

>> +
>> +else:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: pll input oscillator gate
>> +
>> +    clock-names:
>> +      items:
>> +        - const: input
> And 'maxItems: 1' here.


Ok.

>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,t7-pll-gp0
>> +      - amlogic,t7-pll-gp1
>> +      - amlogic,t7-pll-hifi
>> +      - amlogic,t7-pll-pcie
>> +      - amlogic,t7-mpll
>> +      - amlogic,t7-pll-hdmi
>> +      - amlogic,t7-pll-mclk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 3
> These are the 'top-level' definitions if that's not clear.


Ok, I will put it in the top.

>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@8080 {
>> +            compatible = "amlogic,t7-pll-gp0";
>> +            reg = <0 0x8080 0 0x20>;
>> +            clocks = <&scmi_clk 2>;
>> +            clock-names = "input";
>> +            #clock-cells = <1>;
>> +        };
>> +
>> +        clock-controller@8300 {
>> +            compatible = "amlogic,t7-pll-mclk";
>> +            reg = <0 0x8300 0 0x18>;
>> +            clocks = <&scmi_clk 2>,
>> +                     <&xtal>,
>> +                     <&scmi_clk 31>;
>> +            clock-names = "input", "mclk_in0", "mclk_in1";
>> +            #clock-cells = <1>;
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> new file mode 100644
>> index 000000000000..e88c342028db
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#ifndef __T7_PLL_CLKC_H
>> +#define __T7_PLL_CLKC_H
>> +
>> +/* GP0 */
>> +#define CLKID_GP0_PLL_DCO    0
>> +#define CLKID_GP0_PLL                1
>> +
>> +/* GP1 */
>> +#define CLKID_GP1_PLL_DCO    0
>> +#define CLKID_GP1_PLL                1
>> +
>> +/* HIFI */
>> +#define CLKID_HIFI_PLL_DCO   0
>> +#define CLKID_HIFI_PLL               1
>> +
>> +/* PCIE */
>> +#define CLKID_PCIE_PLL_DCO   0
>> +#define CLKID_PCIE_PLL_DCO_DIV2      1
>> +#define CLKID_PCIE_PLL_OD    2
>> +#define CLKID_PCIE_PLL               3
>> +
>> +/* MPLL */
>> +#define CLKID_MPLL_PREDIV    0
>> +#define CLKID_MPLL0_DIV              1
>> +#define CLKID_MPLL0          2
>> +#define CLKID_MPLL1_DIV              3
>> +#define CLKID_MPLL1          4
>> +#define CLKID_MPLL2_DIV              5
>> +#define CLKID_MPLL2          6
>> +#define CLKID_MPLL3_DIV              7
>> +#define CLKID_MPLL3          8
>> +
>> +/* HDMI */
>> +#define CLKID_HDMI_PLL_DCO   0
>> +#define CLKID_HDMI_PLL_OD    1
>> +#define CLKID_HDMI_PLL               2
>> +
>> +/* MCLK */
>> +#define CLKID_MCLK_PLL_DCO   0
>> +#define CLKID_MCLK_PRE               1
>> +#define CLKID_MCLK_PLL               2
>> +#define CLKID_MCLK_0_SEL     3
>> +#define CLKID_MCLK_0_DIV2    4
>> +#define CLKID_MCLK_0_PRE     5
>> +#define CLKID_MCLK_0         6
>> +#define CLKID_MCLK_1_SEL     7
>> +#define CLKID_MCLK_1_DIV2    8
>> +#define CLKID_MCLK_1_PRE     9
>> +#define CLKID_MCLK_1         10
>> +
>> +#endif /* __T7_PLL_CLKC_H */
>> --
>> 2.47.1
>>
