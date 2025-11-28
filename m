Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1212D876C;
	Fri, 28 Nov 2025 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299684; cv=fail; b=j8D8MhGmbpi6VOivpulTi5UB8ijgj4hUE07TOFIlod8jDUtDyHGqNShmDnDJ/CsAaIDx2P8dHwb/bNkS3+ElgvVjJ6ti7tBCsxfaT6pGu5FhDddWtCKw6WHpEPgXhxPApP7jBOk5NZH9xe0UQk/RtistLlJbdDtmQZkntzDLid4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299684; c=relaxed/simple;
	bh=8XJX8n/ShWYtbZxTSR/mmLpl5ImygHkucIcV2JXwwe0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XGZEzX6W52xDAk5jGur0YFIx9KraZVk0iR7c3PFW5QBajbDcGzVQ0sg4dNqMEDUglZyvN3uqM0bqRHdlQAvnyzX7GutwAoRE/UXAWVzeUIYBm2E3uvioK6e3wG/OWkspvPWyZxQU3J4dyW09nqyKoqE3P48TUFwD0XndTO8uj4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s3aAib6x; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s3aAib6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olqSUVuVU/CSjpx0eGIN+rsn/BIW3xY9kSwPnKBMOcVjxF7Dqfgngrj8MXcXiK/LTM6rpf++km3SkLc1kmBL8gjsl8ltDPXvGv4wu+G/9xA5bmL0wdibSYQKGFk11aHxfHqKsgq4OfCG7/gmB5So+hJtTHh+hh8PqYw6nx24GYaEnVoUby4Daz7vTBof/LKPEKdhZiRz6sYD/zftz5sQ35E0gJuTag6ALyg6nM4FCxgo8EOIKOPdIvr9VEWjYldZOVFLIvCacqXj+LRP4h2dJ5mdi/sClvvLWe/ABZ4wYiZYCXL+ba6cza4W57t27tWBD9L4Bp6d3U9LCtowtjImKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AepLDexqaPlW0iL07yAh5yjTzdO/q203e43HencWD4U=;
 b=gOnCY5HI8pSTT2SOZtHsodBG/C09WbcK3eFzCcB8OmmI9V1lGYj0K96yTg6lsvMgEBWP2bWTJU/J5VQ/bLg075lTKZGkcK4Ddnf4H3DFsynUw8zeytnqYzJG/l1wbilzaGcQNoIkE32x9vyDE8obYmZZR2mzRXSym0hmsvtnBdiC/DgqhnSsmEN5jnhJYr5/1UQzMyKyt5XHf5SFiKQwgdKDR5bqRrqtyZDO8pqKEuBLe0bVgt/pJsE5KQVZb06aGPoHyEq5bskXiwVqmK8if84ozmQ/GEy5s3XUfDf0+/2/pswsyDA9YxoSUQfR1PecQ36YGhsSm1rpNTiWxFay1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AepLDexqaPlW0iL07yAh5yjTzdO/q203e43HencWD4U=;
 b=s3aAib6xwCu7aNpMjJffky4RhVBpSFaPqf1mSIHAiBOqW6nV93twkkaxhdRzSstwL9OSLaJbRBsszajtfGgDp1+Ffzm0d/FjyYiPW/aSGw6FNXcoa3iyVLOncGFyHRK9juFOOZ2B46+DgXQ5fBG3mI85gvkXZrjOTHaOKc8pejf4/Hlwnhz3B+G8hFc2iKHJ17kYPCgxhtJhOLoC6GbEFT2A0elc0DWiK54xyLnCYihWFMQJwTNdRIq3iCbl0pTGfe+g6kAJWSGDUf0k1A8pA7l/fPGiCbG7Ial7HnIXbG+V3rPrZ1zSLkgagb1YICcg8YHbgkv4gxOMXS+/Pyu7ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:39 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:12 +0800
Subject: [PATCH v6 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-3-cfafdb5d6811@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 207a5811-c4bd-4945-3907-08de2e2c448a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU5vamVmalY5Zk43WW5UaHdLaVdxeHZVYU5zVHhaVWFlOWUzSDlQWUZMYTlP?=
 =?utf-8?B?eUxqQlczYnhHR2VqQjdSQ2J0enk1eHJuaVFIeDdtZFZETWJVSlZwMWNlWWRY?=
 =?utf-8?B?ZHYxS3pLQngzcTJjcE9GeURqMEpiOUNCSlF2c09PWlFSUHAvM01HMnRleGJz?=
 =?utf-8?B?bUtjRm1PaEtrdThqSVllMnVXaWlXL0Y3WXNzd0ZZOVgwbnNSeTdMVjlwbDBa?=
 =?utf-8?B?MXc1VWpmT2djTEVZU0hPRlhqL24zVno4SUU5b2NXd21hbXprL3l3N1FRUCtB?=
 =?utf-8?B?eUNEOTYwSjdWVnVrMGN2Sng0R2xyNGVDdjlOWVZmdDQzdUhCL012b0hVeHpa?=
 =?utf-8?B?L2pISlluWXR6Ryt1aFVSbkkyeFBnWXhHdnJrcmJlNGxFbFZ4emVWYUdsS3VN?=
 =?utf-8?B?QmhNVjlNNHJBMlZzNUs0RW9BS0c0eFhWazJ1QUhacWtoZFJzcTlTbEhWRDcx?=
 =?utf-8?B?ZXdDa3N6RlVGOTJjcUh6WHRieG1TVVI3MU5vb0QreENCbWZubTVzd2JTWDR4?=
 =?utf-8?B?MTBWRVI2ZHZuYWoxR2R4UjcvQmgwY0dwZE4wK3hTRDhzZURGakhCemR1ckJn?=
 =?utf-8?B?bjBUdXNUdEVndEFZcGJ3ZkRKZ3dhek1LWGV5WXdDZDU5ZzZ1MmdIbHVuQ2U3?=
 =?utf-8?B?T3BOR3FEalEyRTFWMHVsMEh2SlF1cGxuYjR1SkVsdld5WmdHcEVyNzN2OXRh?=
 =?utf-8?B?VXE5UmdpZGNma0g5YUJLSU40UkkrbkFVQ1dIOW1abEdCRG53b2Q3ZWoxMHdv?=
 =?utf-8?B?cXRnakJHODhnVFRiRC92Y2FJWVgyQ2xqbUlJM3lwdUMxcHI2ZXAxUVZ2YlNW?=
 =?utf-8?B?djByK1dObi9idFFGYWVaR1Z5ZTFmUmZacmVldkdTRU1UNmM5L2l5b2dIbFZt?=
 =?utf-8?B?ZWovWHJsaWhEM0pja1hpaCtXeUJVTnBodHcwdXRYWFVoL2dzZVhIWVJ5SEpt?=
 =?utf-8?B?TWQxTlp3YzJVYmZ3OXRwZkJHSHdEdk42Ym13M1BnUElFVkdJQjNHeXlSeE1G?=
 =?utf-8?B?S2J3WWVLNVVPdTc4azlYaXZJR3VzUTNETjdwMERMUEErZjQ3ZFhJMGYxYVJH?=
 =?utf-8?B?aWpXK21FUTRWSmNJQTQxNEV4amgvZWlCUExFV3V2NnlDVzlhUlR2dmFzTkQ0?=
 =?utf-8?B?R0RKdFUwNXZ0VGJvNHhHRUo4SmppM1VkZDkzc3JYY3A1cWRQdm5DcmovZVlS?=
 =?utf-8?B?Q3l3TzFKanMxQzNybS9TWDZwcXlSSzl0SFJtOFk2TEVnS0MvV2ZIUkJZeWJH?=
 =?utf-8?B?RjFNdWEyYTJLL3Q3d0VuT0JDWW45NEIvSE5rWWJ3S3Nib08rVmdmK0VUZ1pu?=
 =?utf-8?B?MktzbUZBNlF3NVlxWG9sZ3dlRm5WR0ZQbS9hM0twbDFBQW0raitGa1dTQU9O?=
 =?utf-8?B?YWlpQml1eHFSbzJKZlNzU3FNYzZmdER0MEtlWGdJeFhraDJzY2MwTlorQ0No?=
 =?utf-8?B?UWxmVzZoSGIrOUJVMWtxU1pzZWdITTlwSlRZTUlUdzlWbll4TXJmdG9uL0lE?=
 =?utf-8?B?WHdLaWFmU3RaRm82ZHk2akFMcVhLMnRLZ0xvb3JGa3NYRjdiRWRUbVkyRUFY?=
 =?utf-8?B?WVJ3NXY5eU9Ha3dGdElOTmJhc01WMkx2ZXpta2Vkam9NeUEzNS9lSnllWVV1?=
 =?utf-8?B?UGRNZDc3U1BHSmVTRnlkK0lFZzVRdTUyQW05aU5mUjc4T2tzSUN6VGFXcEpU?=
 =?utf-8?B?S25iWFJiUG5rbXEvc3E5emtYVUlKaktJK2FUU2JLYXptQk1Lb3M0NTNVSmto?=
 =?utf-8?B?VDluM0E3N3FiL3hWdVNZMEZ1Qy9MQmhpeWFWSnArNjVCcEZ4MHVET0hhbXVj?=
 =?utf-8?B?TDh5TE44QmxyVnNlTGpabWY3UWJhNy8zOVo5MUJXa0pwdXhlSy95U2VuSGZm?=
 =?utf-8?B?SGVJdzZ6QkpIQkVVMkUzNkwvYldKRGRRYkFod1MxZjY2a25GczA0ZnAxaFdO?=
 =?utf-8?B?VEcvOU5JTHlTV0dwTStVb3JSZmVObEc4UnB6WDQ0N25HeVd4bG1POHpiODhQ?=
 =?utf-8?B?dVBpeXpGcEVsK3JHNDZmQmVoWVUxRjVXcWQwL1hkMk5nTmF4QksxSkFkRU9U?=
 =?utf-8?Q?fPqs/S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emVMTWM3WlhOVmxTcFRBUlNKT0hzTjU1SWhVT3NmbXNxS0RZVzQwcW92cGE5?=
 =?utf-8?B?THBEUW14ZWxsN0Z4MHlneUxiU0Z4SnZXOFBuUlV1dDhUYzhtQkFzMnVOckZu?=
 =?utf-8?B?TldXWlRpYkVObzY1UGpWSHh2bHpyRHppcjNEY05lN2hBZmZCZUJMeWkyWG5m?=
 =?utf-8?B?TEVxUDl1emJWS2NwQjdmZW5iQUpSWVlKdnlmd3ZYdXdCUHhjSUwyd3FDT1cr?=
 =?utf-8?B?NmRnUEV0Yjl2M0RlTGx2bUJma0NxWHBrdjVNT3pWSmcxTisvdjVWbGpUVHB2?=
 =?utf-8?B?MjZ0cXVUdmh2TG1QQ1FyUUZhOW0vSnhNWStqU0xXRWpBbU1hUWw4S094aXRW?=
 =?utf-8?B?RmRVUG56SDlSSWxtK01qaXpJS1IrNzA3dkg4ZE8xUWk3ZVBRc3RyZWxTejVJ?=
 =?utf-8?B?bmFNdmw1K05JYmMrWFJxT0MvZTNwaTF0Z0c4TFhuNDBEcGt2UWgzUHlQeWlB?=
 =?utf-8?B?UU50K2NmTURMMWhPNUNLZnhJZk8rR3lIREF4K3NYdGhJQllUMW5JSjViLyt6?=
 =?utf-8?B?c3ZZT1daRzh4WkJSSlM2ZkJlZDhMckQwYWI1WVhtTS9Md0hxUHBPRk1RdWk3?=
 =?utf-8?B?RDJta2p4S25aakpUbFNPZEs3UURYYi94Smg5V2VhTTFlOEMyNytCNkw1V09F?=
 =?utf-8?B?cG9YclJHZmh4RXRyVFhQR3NYYWg3MExuZnJGLzFOSWlibEpSS2pLZGtGQnVh?=
 =?utf-8?B?NnJoSkFGUWlxQzJRMU1sTmNuU1I1WWwwN08wRmM5SWVtWFd2U1BrVEpHRjlZ?=
 =?utf-8?B?VHY0OGg5MWtmVDR5aWRaM1VzbkR3c0VwY2Qwci9Xc0RrVE1TYmZKVU50KzFR?=
 =?utf-8?B?MTJGVXllajU0MURGUGIwRVptVDFWZkphcWppSXRZYUpkeVFIdFBNeTloOGJv?=
 =?utf-8?B?YkFPWUpGZEJadXpGcHp3eDdxYzQ4MTlqUU4yNk5JcUp4empxWDYxVld0ZEdU?=
 =?utf-8?B?d25ERkFYaTA1UHBCZ1hoUjZNVnZ6bWFvQ2hSeVZjYjM1elVDaGpZWHlYYWdo?=
 =?utf-8?B?MXJTanVJcEcxT0dTOHhxNUZDdDdVY1R2Q2tlNGs2eW0xZ3FCMUYxdnkzRFZP?=
 =?utf-8?B?cXZGaytic3FQZy9Pa2cyeGtCZUZlY3A4THc0V0xaK2g5Q2ZDNkpPTWVTRS82?=
 =?utf-8?B?WlM0Q1V2bnp4cDRGOU1WWG9FY2NZTjFGalBLaG1qYXkxcHRoYW9vOTVQMnJJ?=
 =?utf-8?B?aU1mSEZIUHAzVnd1eElZdzFEc21HWFNQUXcySjNodlJlMVBCaE1aRHF5Z0cv?=
 =?utf-8?B?RmFtMVFhSDRPUFdrVkc1VHp1T3VzR3ZUMzVvbzBvNHlLMlhoVDhlaXVTV3NJ?=
 =?utf-8?B?Z2ptN0xHMkdlVHpJZXlTL1BOa1VaL215SHlkRURNeDdxRFA1SnFwLzBQcDVz?=
 =?utf-8?B?alVwVnY3bHFuaUtPL2FNVjBRYTZGWWNSV3FRZ0wrRVBiUTNxVnA5YmlRSks2?=
 =?utf-8?B?VlgwS0F1eHNnWnR1blFGaEFoZndQSjUvdUsrc0NPdi9ReHdxeU9VcGRScWRl?=
 =?utf-8?B?bDNBUnJ3Zks3VGNHUjhkSDE2cFFXTVVkMU5SQkJRdEJGaEh1ci9EaHFVVjdq?=
 =?utf-8?B?cEhRdFJCK3ZrcW0zdkJ1TWk2UDZlM1dhcFV6RUNVdGtoSTVJZ0pIWSs5QkpP?=
 =?utf-8?B?Z1laVjh6TDJnbTJCd3RHWmluM1BUU0xyUlAwelZOaHJUb3grMTZQaE5LYWg3?=
 =?utf-8?B?TmtOZ2ZWUWIrZjg3OFcrRlppNDlJTmhYbFZFTW5yNUViME5xMG44MDVsUExO?=
 =?utf-8?B?eUxscldGcTYxSkJFMytXcm1BdkF6aGl1ZVFOZmJNYW9QNlRRSDFGMDR3TzM3?=
 =?utf-8?B?WU1xL200V0plckI4SFd6OTBpb3RiTCs0UUwrZllwaDVYMzB3Rm1SUVZzT3JH?=
 =?utf-8?B?TGNiMEg3bjU3LzFnY3hGY2o3Yjc5MlFIdFZ5ZUpjRnNlcmRoMUVEU1liZkhD?=
 =?utf-8?B?ZGswNUZhTVZ5OGZrT1VwSHY0MmYvZmJpMFVLbW5xejcya1dtdFVTSno3Vzhq?=
 =?utf-8?B?QU96c1B5SzRGY1hZNEQ1YSt6VmFXdUlFY2JPdnJmejNBZmc0czNCL253VUgy?=
 =?utf-8?B?emdDWnZ6RDBQQlFmbVVML09nL3l6Vm9STE1hM2xIUW1Mcm1SSlZlZ3Y4ZWQ5?=
 =?utf-8?Q?nl+8GEVM//VCR5ufdsFaCrJ3U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a5811-c4bd-4945-3907-08de2e2c448a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:39.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZXymHkuU4zSxF2kFl0lvxAKK3Ug3Q0C+7+s6FekZR+wrFw8kEC96QZFJvDEgXgfrG7876P6BWtWpumEEKV1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreaddepth
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..dd6083597db3f8f27d86abf5640dfc3fb39a9b88 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,71 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	struct clk_spread_spectrum *sscs __free(kfree) = NULL;
+	u32 elem_size = sizeof(struct clk_spread_spectrum);
+	struct of_phandle_args clkspec;
+	int rc, count, index;
+	struct clk *clk;
+
+	/* modfreq, spreadPercent, modmethod */
+	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
+	if (count <= 0)
+		return 0;
+
+	sscs = kcalloc(count, elem_size, GFP_KERNEL);
+	if (!sscs)
+		return -ENOMEM;
+
+	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
+					count * 3);
+	if (rc)
+		return rc;
+
+	for (index = 0; index < count; index++) {
+		struct clk_spread_spectrum *conf = &sscs[index];
+		struct clk_hw *hw;
+
+		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
+			continue;
+
+		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
+						index, &clkspec);
+		if (rc < 0) {
+			/* skip empty (null) phandles */
+			if (rc == -ENOENT)
+				continue;
+			else
+				return rc;
+		}
+
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			return 0;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get clock %d for %pOF\n",
+					index, node);
+			return PTR_ERR(clk);
+		}
+
+		hw = __clk_get_hw(clk);
+		rc = clk_hw_set_spread_spectrum(hw, conf);
+		if (rc < 0)
+			pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+			       __clk_get_name(clk), conf->modfreq_hz, conf->spread_bp,
+			       conf->method, rc);
+		clk_put(clk);
+	}
+
+	return 0;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +239,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
 	if (!node)
 		return 0;
 
+	rc = __set_clk_spread_spectrum(node, clk_supplier);
+	if (rc < 0)
+		return rc;
+
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
 		return rc;

-- 
2.37.1

