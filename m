Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB753804;
	Mon, 23 Dec 2024 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734940770; cv=fail; b=gjjNxlbxKSRGqdnaJAmBHlpF1m2h65eSsBn+rI2zQcyMO1bLHcBetvIegNp8fCaFxESgRQBOJnlihNgbB1Y7jZxmbF/aVAzOCJjLuvJaRJ9KbWqFhzenOQPBOxk4t3DlKuN//CwttyM+Crxx2GsaYxqpnKCsq1cel5aoolhza2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734940770; c=relaxed/simple;
	bh=6OYiohfV9aGsLJeXqYWUYVycSrVQBEN1RYU7Q39m/P4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=or0kPwBXhep62GLkxGUnI43SbheMs3dPBTHsn0kwvyKObjQz0BCSQ4OJkhYI8cOxJTDOCwuI+E1rRueQavrXRxSKAzdkbxIqeOARwqjNFCNgOzI092PSZUOp6/9eRHYTm/ElK8TB43cKHvx4O/utCg2BeWGf63LJxlZsCyopv1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=c7/JZKBv; arc=fail smtp.client-ip=40.107.255.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="c7/JZKBv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZibOs7rMgO4hRA+HqtnSrroTZqmIhDLLk+yBqiu5MrtenU3WnR9pYpgQKzZCZSc4pBn3qRONriB+EUCM8xXyGy/5rma+49Vjq3T7GTMtl5yaNvZn2R3IxGOAgHNleiGccYRxfZjkDH3zmFU4h4rT0kqbX7cUU+If1e6tskzEaFkvREK7K52bAwYCo84L02kv6QMFN4JpmS7mcfRl9PRSpfXGl9+8BtJ8Q+zvLByNRGHo9FXRzC6+CJ2pZQZ1z3amvvls3n7HHts/cuEMvCf8yYhFPy3Z6FYK3OzFINAyDG2MHfv1/xQfTq1pS8kEzeUKYiZ25AVUU9keFZ0Tovb5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZXwcuUBQ3bh1pv4AVYZNLlD5eZdY6S+sUjguPgR7/Q=;
 b=RyjSOSkiliGaFXPCtVcLeifc13jNhtcACms2X5yK87+JklmR+vyqkt43t5b3ZZZwCrhV0Xl2aBkh+tz461ZYgtmYHyqFblSlMkpi5DrtpJiur1Kwy9J7L83s824E1DspZTFCUETp0v2SzEcmsFdP5MOn/DELFep0Gv5Cl3imUHVCp1EephA2QMvHqgZjHbh4lgox6Dd6mFzYWdXthygbuYfsYlpFgTqflbVoFKkMc+wk0AWe5x5DNOZmDP8yzb4Ly/Gg+yOq2XOubTaSJzHez3Z4VOKrsTzR5m7Pto4+XN2wLr5YEHj7hwKZpShJQu4wEZULCKzNp5zRVRIN85BgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZXwcuUBQ3bh1pv4AVYZNLlD5eZdY6S+sUjguPgR7/Q=;
 b=c7/JZKBvYIMaDnE+qYCMC0OlZAMf4NDDJftu8lPajYksePLoWWQoqZU54xpZIfsR52lr1bSt1+9USxq7NNVxOGX7Pf2EbELXTtdH7Lm/Daa1mkvHTGm1+9/4BfOglj7C1YBC74fGzmPqRi4KXv7GehnhITfU8YIz6jRPbjTqhRYUexKSnnM3dKNoeQRYI4kMZhMDL4Ja/7p9H5FZh4+7OFuR34XxF83xzhhMRW1rtr1Fa9wAf3BUm7kK73FSOu0BXf0pHk+xdeM7/gFiAVb83UBrwgRNYyynN3JXb8z3WfKi0n7zkUwVkx1C5SCZYUZpm7ZKXKhmjNYA2QubJByKkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYSPR03MB7330.apcprd03.prod.outlook.com (2603:1096:400:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 07:59:16 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 07:59:15 +0000
Message-ID: <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
Date: Mon, 23 Dec 2024 15:59:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: amlogic: s4: remove unused data
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
 <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYSPR03MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab1b156-10b7-4fe3-9e92-08dd2327b1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXRoRFVlbU9FSW5YNVNpMGhCVHdMa3drWFlGTGhzb3lYbldaRHB2bkZnTXVB?=
 =?utf-8?B?RGszZWwra1Q2dXlYbWc4dlloeFJFRlY1SDR5a1cxUVBZTkdJdlByblo5U3VH?=
 =?utf-8?B?SFFYMktTblNDdVFMczlPZGxGcnpobEp0NXYrVVhwMkZUS3g4eCt3MmdiN3Qx?=
 =?utf-8?B?cCt0WVhGanBBZHM5RWFLY004Q1p5d25DekZvbEhXT2ROL0xpYTI4dCtqelFE?=
 =?utf-8?B?NEN2U1NlZEhjUDVKc1RQcGk4eGYyNDdYeHppcExONm0yTDN4YThEc0g0TGIw?=
 =?utf-8?B?KzVZK1NReEpBYzF4N3ZRNGU3ZFo3T0VHL1hxRU1TQU1vVWhvUWFqKzFBb2xE?=
 =?utf-8?B?V2FLcVVZc25haTJLT1d6cm9PMDV1WjBWM2NvVG9mSkN1V3NxM3dFaU9XN2tY?=
 =?utf-8?B?ZTRMVWZ4L0NIQll6eGxYSlRMRzFBNWZ5b1N1Rjhwc3E1QVdWeDN4TXVFWE1u?=
 =?utf-8?B?TnMwUWpaNmRZNDdhTmlHRWk5TXE1UENJTjhrdStBaFJUb3ZFUmZGNERkUENT?=
 =?utf-8?B?VmdXU3hVS2VHeGkyVkQ3UldRd2JzYTVvNmtqZG5YNDBZeTFVZWpsU3pIVEhu?=
 =?utf-8?B?cGhMTzRMQ2ZBczlrYUs3MEp1OTVOTDhVb09qZHc2b042V0NsWGpIS1VlWU5h?=
 =?utf-8?B?eGxOZ1NNWVBwR2JFM0UxekZTam5VLzRlY3gydkRORVJnWVFEbEgySXdHN0ly?=
 =?utf-8?B?cW82VHhSOUF0SE9TeWpzc2VISjhhUTg2VXdjakRNSERLRjlDWkp1dkhDZUlN?=
 =?utf-8?B?QXdoaVd5QVBOM1NJcXNIZUNXOUdOdlZHenIybG92dEJWdXFaZGVNQkpabys5?=
 =?utf-8?B?bGhaNnc3Q3hCQTZHeGxtUm1ycHB4eklhNVFDRmdRN1luVU90eUR4M1YrblB3?=
 =?utf-8?B?OGNNelBNNnBxZThoU2xxUzExTDJyMWZWZUo1RGFrVlEweXA4Vy80aURlNXhh?=
 =?utf-8?B?d3A1Rm5NWXBWSFhCK2RPNGV3cFJaemZsNE1TQWp3YlM5aFhjTjJ3VFVpZTJJ?=
 =?utf-8?B?WUZOYlFtcHNoMWRiT0d0dWcyMWxaaW1PVDBDN1hJc3NWUGozZWo5YWY3ZGpV?=
 =?utf-8?B?S280MXBVWncrRW9SSngvUUZxYXBwTzhnQXBDSnFoRFVwZDJDT2JNY3lwR3Z1?=
 =?utf-8?B?V0Vpa2ZhY3B2bTByeEI2VzNZaTg4SWJQQjdWU3BFWHloQy9wUW9meWFvK2tK?=
 =?utf-8?B?RjM0NDFnSDkxNzdOVFgyYkpScFlnMi9FTHhCU3lHTHNNeGc5YldXUmpqVzkz?=
 =?utf-8?B?b0crMVh0UlF5SkZSTWJ5V1VwTmpuVmZ3SzZPRmUwZkY5VUFEOThXbCtCUURE?=
 =?utf-8?B?LzRXSitYUGRvMExaUFQ4L01yakcxdENucHZwVGRwZlgvZmE5YnZRLzZyYzlZ?=
 =?utf-8?B?N0tXTytyZ0Vjc2xZZnFvdzZYbk5pcjlUSkNOcUhHblM2WVR2YjYzTHlxWjZh?=
 =?utf-8?B?OFl3b2t4eEkyT05sQWZtaFNubjl2RE5HWEVKVmMyVEhpTmxkdjZTRG5uTTlP?=
 =?utf-8?B?QlU1ZU9hTUVqQjEvKzd5Q3M2b3B0ODhLVWRvbWxpKzBYM2FqMmpLWTh1Njcz?=
 =?utf-8?B?RTFVSVNnOEJsUk0ybG9MNHJKQnU2aVdqMXk0ZjZ5ZFVFVU8vS3k2bS9SZUZy?=
 =?utf-8?B?eWo0VUt1bU5kMFJSNDZPMEtOc3MzcGtERXRDZEF1MGVkdlB3RXQrQy9kVTRY?=
 =?utf-8?B?TWdqVnQ5WUhMdW5wZEYveG9BazRXWUZyMkxqcDNoakszOE54Rmk4UkdiejRh?=
 =?utf-8?B?S2dyOFhuY1puYjA5Wm9ZQ0xBSGVITEhWTzhyY3RKMDVROGNBNlE0RTRFbzFQ?=
 =?utf-8?B?clIyMGxvVmd3QXVQVnRPN05rUEdyR1VFZUZZaERaZ3BudXVvMlFBZTNQVU9U?=
 =?utf-8?Q?ntSSgZOHidebL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFM2VUtHTXZKWHM1MzUrUUM5MW5yN2FaZGFkZjVmd1prTkxmR2tESFZSTVlM?=
 =?utf-8?B?bmN6bURtc1RPRjV3MTEzMlNEVFB4R3p4NGwxVG9tMVBUcDN5dEk1RytxRlcy?=
 =?utf-8?B?VC81Z2pWZGcydUdNaDNIRVoxK1pGTlN2OTNIMldSSCtram8zMEd5cFdnVW5M?=
 =?utf-8?B?SFBHeGF0Y3lYZ3F1UExkWW0ySURGeWRWUEtqRDlHZTBFL1JybjIwUlZwQk5V?=
 =?utf-8?B?MDVRSkZjVnR4dFJGL1JkenBqNlMzMDlwZnh4TnhHZi9NbDJ5UE14REw1WG9j?=
 =?utf-8?B?aVErWWZucEEyYUVRdUhIYmk4OXBuemNBVVdnNWlRd09MVEFUOEgrSHA0MlNB?=
 =?utf-8?B?bWx2M05hZHJmRjhhbzV3ZWxLSjZORUdMVkt2Z29KWTlaRTI0dzVsc2RkSGFB?=
 =?utf-8?B?VnQ3RjhueXZhQXZ1by9xU1lJZTNrM3llNGZ5MUo2bloxMFlFTkN2dm5jWnlD?=
 =?utf-8?B?LzhJM0RRUHVRL2NtOXlvYU1KeU8wMXNNSytuTDgzamxyRGsxYnVNVGM5OXhj?=
 =?utf-8?B?NUJDZWR1QytFVFRyM2wvb3pTUlJkVHNzVkoyTU9yQVlyZ3VWcHVXUkhTT2Z1?=
 =?utf-8?B?dTd0K1BWdVRhbjBzNWVSbStOVWFxYkRFSTdYYXNtSEFMUTY2QVEvT2ZweVAr?=
 =?utf-8?B?Uk81MDU1bUVmcENhWksrZ1BIQlg0bis1YnNpZmJXWDRzbVR2WVlEUGVSMmpX?=
 =?utf-8?B?b0JuNytPaCt4Nktxc3o2Vkp5WHhiTEdJY1FHbTNrWFhsalJzVG1tK3dwWmJG?=
 =?utf-8?B?ZDZ2dk1HdVdCN1RIbnZUQUFPZSs1RFZTdHBWM08wZ3FENGVpRjJuNEdDN0s5?=
 =?utf-8?B?Qmg1cGUyZnVCeXZlL2ZGSDdReXpPVDIyQjZST0VRZnRwWUZuTGw1Vk5BeEda?=
 =?utf-8?B?REN5ZFlHd1NTNXBrbCs1VWJQTUVKeVVNdXlGZmYrNUplWkN5dENVZllFdldy?=
 =?utf-8?B?U3RzVzJjK3NKY0o2VVBoZ2JrY01CV1FDTVVxRUh5ckY0K2pOcWFSU3lRWkk5?=
 =?utf-8?B?S1VraXF2YXpYTjQ3K3pUVlhPcWRnUHBKTEYrOFhWVHJXelB0dVlGNzFCbTBT?=
 =?utf-8?B?ZVBIbGthb2hHaUxrR2dEanF4bi9QaUgrdjRhdDc1RHpiVkZyVU5VYTNSU0Za?=
 =?utf-8?B?ZGJHNVVXRWRNUHorWWpkNHVLR2QwZDJxMFZ3MFVrcHh5Z00zdUFCbktvOWJq?=
 =?utf-8?B?dGs1VzBDZFNQc0RHM3ZuM0k0Y2hJZHVIbXlYaGV2N293QkF3czk5aEhuaXlo?=
 =?utf-8?B?Rm5lT2t3dVRRdkdKSytZbUlyS0h0ckI2R01VOTBXeXJlT1YvUmJiYUk1UE51?=
 =?utf-8?B?d3FXVkV5d3E4VHMyc2ZLeDRoRkZ1VTlwN2VaNGJCUnZQRmFybjc2K2Zza2dN?=
 =?utf-8?B?aWxWYk9ncWtuNC8rT3psekRtSGpFUndSYmxjQjBQbStodkszVUhlRjQwOWhS?=
 =?utf-8?B?ekJKdFhIcEpyRXFpYThmZFNnVTJCSTJFZDlWY2p4UWdXTWZlblpwN0s2VVg1?=
 =?utf-8?B?Vkw3VVZlVDZGdFVaYXB4c2gvWGdEN1Fpb1YwRno1eTdvb2ZQbHE4dlNDY3pm?=
 =?utf-8?B?Um5nZGRUZ2lKVkZwREtIUkFSSENhNDhOcncwYnc0QWNVZ09NcHRqRW4xemNV?=
 =?utf-8?B?UG5KbjFuQ0JiOW1naVFGTkliVWZwMWw1M1pmZUduK29LZzNVenBlWnc3RTV4?=
 =?utf-8?B?QUV6OHJGNjFlMlI0ZURNK2dQMGlwbjlOOWxHOTZVeXJnOVhMdi8xNS9mV2hl?=
 =?utf-8?B?bUpZTVRmbFNZN05DQXpvZ3A3L3lldmVUK05ENFliU1VmWGlVV0M4WHhDU2dW?=
 =?utf-8?B?MkRoV3RzWnhBVkFOMTEwRDdSZGp1c1czMkQxUmZQdG1FM28yd0N1WDE5ZUJa?=
 =?utf-8?B?ZUI5REdiWHBmTjlKMm1HY3UxOEprZUExRm1LSzFDUEFidHZ5aWZ6OW9MQUIr?=
 =?utf-8?B?dENKYjFtOFFONXo4eWtQbm85NGVQaXRKdXJtdHRoTndLTm05MHRBYm1jdHlC?=
 =?utf-8?B?WjNUbHE1QjhpaVlXTFA1M1ZtYlhZUm9ZcldqY0syUXZpS1gyRFZJa3RleUQz?=
 =?utf-8?B?WEgyZjMzaDNBSzZlZHFvNElpWENZUzVDVEUxZDk4Q1JVMkhJdVE3MUdmdm5a?=
 =?utf-8?Q?JU6rKuBq1o59m823gbPY/RjFO?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab1b156-10b7-4fe3-9e92-08dd2327b1fd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 07:59:15.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYJbwGU21NWcGEuIjQJpQ9u5Z0Tcym2p9y5PpMadi5K7XIN7A0Zi44MTYyxewsY5fbdbzR+7pFS3GzkzQI5YKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7330

Hi Jerome:

Thank you for pointing out.


On 12/21/2024 1:17 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Following the removal of the big clk_regmap clock table from the
> s4-peripherals clock controller driver, it appears some clocks are unused,
> which means these are not exported or even registered.


I have confirmed here that these clocks are used for the demodulator
of DTV (Digital Television). The DTV-related driver will use these
clocks.


>
> In all likelihood, these clocks have not been tested. Remove the unused
> clocks for now. These can added back later when they have been properly
> tested.


I will complete these clocks later after testing.


> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
>   1 file changed, 112 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 91c7b10c2b68c626dd1d6164ea855370aae71485..72b990fc0de8e4e2c83d0fc3b4c6e3fc1fc96367 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
>          },
>   };
>
> -static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
> -       { .fw_name = "xtal", },
> -       { .fw_name = "fclk_div4", },
> -       { .fw_name = "fclk_div3", },
> -       { .fw_name = "fclk_div5", },
> -       { .fw_name = "fclk_div7", },
> -       { .fw_name = "mpll2", },
> -       { .fw_name = "gp0_pll", },
> -       { .fw_name = "hifi_pll", },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_mux = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .mask = 0x7,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in_mux",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_adc_extclk_in_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .shift = 16,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_adc_extclk_in_mux.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_gate = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_adc_extclk_in_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_mux = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk_mux",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = (const struct clk_parent_data []) {
> -                       { .fw_name = "xtal", },
> -                       { .fw_name = "fclk_div7", },
> -                       { .fw_name = "fclk_div4", },
> -                       { .hw = &s4_adc_extclk_in_gate.hw }
> -               },
> -               .num_parents = 4,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .shift = 0,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_demod_core_clk_mux.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_gate = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_demod_core_clk_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
>   #define MESON_GATE(_name, _reg, _bit) \
>          MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
>
>
> --
> 2.45.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
