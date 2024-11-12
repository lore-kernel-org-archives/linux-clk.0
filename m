Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B37204023
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381969; cv=fail; b=UJEDE3EbyRXLczg+x+/Ybno4RW86DUbUnrybaqw/7O+MVcMnAGprU79C4kGwGn+fllFfAHm19Ccq2V8Q7qhYvykTUl1D/pSnxNIL22BNQUohQPetMkMZbqt2P1I4eDueqeFS0/d17E6icTDVTvPvgNLXLCdfTTcHYfk/KzFSIfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381969; c=relaxed/simple;
	bh=TzO0elaKMMpzEuqpHVrmOJSOOKZrwTl0+eCZjZgqtZU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MZqvxjNfFyvU3zAVNRBgdwOfrPcZb9USMOwhb5ngTAT+YukOpz2DuUGvbcbZDFwmpV85rK7KwUcIFioUhROZsVMt04JHoppwMdrHBFyyFOKPP3y3BgTiM2lYLgtTEbZ5xZZvJ8yRtVW1xNCN4QFdSxaAzlTgpHfSF2BfCSMJNeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eQn+ukQW; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eQn+ukQW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbNIqrOalVopQyVVdwMCXKD7ac44yoOC0OmsBBwMpb6qWtYBqLzpEsUTqvao0AbI+zDFQMEL647Pd/F6Ck6Yr43H2ZeVNMQn1mEjvZ3+/eYIXqAWa7OxWBxdAS3OGk9ZdujJwZdij2wbj9Qr3Orf3fUIt/3e/LSlmBU8vxDV8xZ6eR0LpjlMtI0hUljl9j5Qm0pjZL5QXSar1UD4GQl8U2oqrFPBkk6VWVCb5C85tdwccGxPJpFlwZP5BhW5O5gH6CPgnATdh7hZjGNbzzb6RS1bcSl0DpW4wfXwIiCDki5ibVw6fQtLaDHdCHL7Fl6vHhTO2l1xVYkJu9ZQYdSJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4W0jP5dQolIPPuOQZyOV39VzAcPeb6kbwpg21L2zzA=;
 b=qgy3W1GY/z3Hn2weXHvX/BA+h5z2mChF+OmTn22i3/1lZSaK4FTlp30qsjlU2CVUmkpzoVSC6qOTNbYQnmgoITWRrwyKkMW2LMlKyGClPiXnNqhTBcqD+/5xAIb2NCkuNkWv+7yi/hmSUW0qI5FsaPVW6q8Lnw16P5TBooZ5iEu0qLF5PIipT1jMe9WdGirZ0WmYFy1+eaYgBq2oQRl0/SEr9Lu09lCNI069Rjo4NKK0C74+akw1b6mTidkZ33nP2GD/b2+f+RuTfs+9JTZ60XpGJdX0UZ0vi6+cU93D62jbbmq9wKpEcyOx2i0MF15ZGJ1vHrQvsOBz6IcMPJMaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4W0jP5dQolIPPuOQZyOV39VzAcPeb6kbwpg21L2zzA=;
 b=eQn+ukQWksUnyK5nB+DZ9B8a/l1kYPLkbYnguIjgmsgC23FxobtNQwtnIT8qs8iyl86AScHcBX8iRQhXvkU9Lt4LQnL34jP+5/pY3ET+0IZJS41dmk+piEyiLB99vQ6nvUH8Q8DsbogMc0i8ZjGtBFeDLEHFqKa6AVrn/tWEZCwV0JIvaTbrGwhvOx+RiVkDUGVWvCyOGlbW5wMkGgZ/CqaYKJMrjRnnEyH0qxW8EZ/CIG+jmTBtIkM15o0Uod+uH/IgqtnBynVepBfg+orO3+ZEyYrcboSJMeSs9nDSAbC8QW4B8ycuHRBb9QN1XdYK+SSzbDgln7OMgKHMk2H22w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 03:26:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 03:26:04 +0000
Message-ID: <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
Date: Tue, 12 Nov 2024 11:26:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241111214516.208820-1-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241111214516.208820-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b1f245-8ff1-4ae7-2405-08dd02c9bd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2xoV3dwRTZhcWRDWUZCQ213eFFRRWxTaDQrZjk4aXQxN1lMMFBlZkZ0SldT?=
 =?utf-8?B?OXE1UnR2THVXWnFKeDZFRU1WR2t5NjNpYVJhYW5wSlpVYTdza1h5OG04dVcx?=
 =?utf-8?B?cjRqRyszUDQrQUUwdU56ZG1vTkZ3Qzg4UzF1VlRMcmZMSDhmQVhjUWpHc3Ez?=
 =?utf-8?B?QnRMTDZHODhwY1hoU2gwT3U4cGV4WjlGVlZHazZ6S0hteEV0akVZdmNIMm5v?=
 =?utf-8?B?TXZTenM2ZkNqV1g1Z2dWTnBLSUJKUnhJK2J6L3BCTUpwVnljWjV1Wm1FY2ZO?=
 =?utf-8?B?Nm56Mmw4KzYramZVUElDNHdsZ1IxaHF4dGIrWDdQQmdjT0hXaDg1YWJqcmJ5?=
 =?utf-8?B?UmJjUm92VnJhUFZoMXZucC9iT0duK2tjRFBqcGwrRXFNbjYyOGJ2Y2k3SXBu?=
 =?utf-8?B?KzkrK3Vqd2tPOHBJNkZDb3lCc3BDRitZdHJHTm5UK2xoempUL1dXaUhjNHVD?=
 =?utf-8?B?ZURINk05b282SEVCK2p2N2thaDlLZ2xBN0p2Ry9iYmI2Z2dpTlp4d2RKYVJt?=
 =?utf-8?B?SW5nMTZJVnpwaXY5Y3I4MnNlTWxXcnFBUU9tTGNYZWoyQjQwUlJnODNVNlY1?=
 =?utf-8?B?cDVsSXp4YVlqUW45N3dsaStxRlpZNzFpQVhlbmdmaHAyR3Vkay93M2tNRXFW?=
 =?utf-8?B?SllocGFtRnJGQ2x2cHZOVzFrNDNvaDNGOFVuMkxLNXROdyswdFJod0Y4NjJt?=
 =?utf-8?B?WXJhYVBCZUoxUHpKcFBtZGgvZzd3emttTVZqWk1iMTYvSzdHQ2k3VzBaWmhh?=
 =?utf-8?B?bmwzajdWTmFtTlVJejY0SlYrVEh2Rkc1czg1RGN5dExGTFpGU2xRWDd1cW8y?=
 =?utf-8?B?Q1A1YWo3aXFxOWlPY3F6SC9VRTJKRDRiYk51MytibFJCNVJveWZYU0ZJcjhI?=
 =?utf-8?B?c3M3Y0ltcHBMNEhtbC9aS2sxUFVzdFdrcldIWHg0bVBMc3hRbnM4VUFZbmtE?=
 =?utf-8?B?R3ZRMFNtc2V1NlFvVEpXclMyTlNXQjljUHVZNzRQblZ3bTZreFIveU9ySGUr?=
 =?utf-8?B?WmpsQVZlRWIrYXNZb0lleEQvMWwvOXorUFpqNmVYV0h0UDJ4T2NmYitCeFpB?=
 =?utf-8?B?ZTJsamE2SmFzUUVRTDd3UnMvR08xdmhGWSs2bjJTNHU3WVg2ZXJWbVlzbWZh?=
 =?utf-8?B?UzJQK3gzdUIrczU4RkFoTjBjaVRpQnp5Z1J1NStnS2xoUDUySSs1Vm90R01H?=
 =?utf-8?B?SXJ0TmRiZ0x3WEpRWjdIN1FURDBQSFlUK0loczdFS1BjR2dUVEdjYTBmeG94?=
 =?utf-8?B?RTVJSUNkS1Vkamd6OFJlckVXUEhPUHM3Z3MxbGdaTlFLeTVrUmJUbEgzYUdV?=
 =?utf-8?B?YjNvREdoM041SFlGZWdLVXg1U25mY2R6Q3BqZ2hCZm9xVVZWNEw0eHNKbXBp?=
 =?utf-8?B?L3lNdmc3WkNHUG1STnc2TlA4cnA2M2VDUC8vMnNyVGNCOHE4R0VFeEtLcjFX?=
 =?utf-8?B?TFJROE1xMmtETElzOUo1UWIvVFllSDlURmFic2hnSnd2RlZ3TlhHNFBmNzZJ?=
 =?utf-8?B?RTR0NU12OVdOOWdiTklYMlBiazdvUDZPakdDdko0WWVWNUdXMzc2M0ZhbjJu?=
 =?utf-8?B?SlFOV2pjRTFnYXhsU1NqL0NIVXdvNWtpVFNDalBQODVrbUxKYit4QjhQbU5J?=
 =?utf-8?B?VTQzOXFwRFV5V1dIRUFwWElxU09BdVpiT3EwZGJIT1Jaeml4Vmo5ZERpUTA1?=
 =?utf-8?B?akFOdVJYV1NBWjArSEwyL05Bb3NVL2pYUEc3TU9OenBNMXhZVFprdXZGWGtK?=
 =?utf-8?Q?bxObV6yHvwjfdSuoV5xogyNGtxYbKejA4dafe08?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERBVVVGRDlLRy9TZHMxOGhQUzJrZEdnZU51QzFaUE0vV0QvUFhnY3ZSYVBO?=
 =?utf-8?B?Rzh5d2FESDNzOFR5TVZDOUVzcElhdVNBeUtURzV5VEhVVXpROTBWa2h4MUt6?=
 =?utf-8?B?cUppQjN0SW9Dd2UxYm9zYkZjdzNEWDBaZ3dFY01qY2pWZE1oMVF5YnU4ekhh?=
 =?utf-8?B?WmRMYmkwSTBtaUtGRzZ0dm1hckNQdFVTeWFDbG54K1RSeXRSeXkxY0VJbDNP?=
 =?utf-8?B?SDAzOFlHQVU0UlBGZnp0NGNFUEk1UUtmOXdZZFNiTVFpRVUyNmhUcnJSVng5?=
 =?utf-8?B?cGp3WGpSMnFwaFQvMHUrRFB5Z0I0M0hZZ3RyQkZkd0ZYK3pYRDFGbmFpU3Zl?=
 =?utf-8?B?UEYyZkZOZlBOUEpiY0FpRC9jNmFISURkTE9uUlo4MndOTmNTSW5VMldiWUs0?=
 =?utf-8?B?MjJYcVZ5UDI0dWxnVk1QSFIzZGZSRmpFUzNCZkRPb0thQTk3ejNaMzE5endS?=
 =?utf-8?B?WXdXMHNwNFpnVGN1R2dSQ09kSFhIYzNoelBDSEcrenRUS2YzOFVPM0NudTVq?=
 =?utf-8?B?VWZhNzJ4Z0tVcG52WGlGUjBLcXVOTHQyT0sxWUx5d0ZBSDlEcDhXUUp3LzAx?=
 =?utf-8?B?bk9oSVhoV1dab25rU0UyNnNQMEpxcWNUSGNiNXJ5WmhXVnJqYlRDSTZKWFhT?=
 =?utf-8?B?Vm8wOXcrNlBRbnBUMno5TmJXUVRNN0MxUEJTeVFXdlNtdTZVYkRBclNzeUtC?=
 =?utf-8?B?K2JBUWxZOHFQajRvYm9NZ2ttMWRqNnpGbWNOM2UzcXplV2tNeFRBakNNWnhv?=
 =?utf-8?B?cjBaR1NWcTN2NnZnR3Y1RXE0SWRqb3pkZllveHhXaXNnZ3lXUlloanh6MkZp?=
 =?utf-8?B?ZDRoMGx6T1I3cG9nZU1DakQ5Zko0Um9HMG1HY1dVOWpHeTAvRWt1a1FhaXBT?=
 =?utf-8?B?UGhFU2pWdzBHMUVvdkdtdDhJL0MwWkV4OTNhZTlTMEFoVVVMY3BkeDVQREZ5?=
 =?utf-8?B?RS9DMXFIZU9OUEhXY1NMUzkxSC9TV1pmbnVkRlFxUkNqU3BPNW9TcGVheUxY?=
 =?utf-8?B?eCtSekY3aU9aZE9objlOaUl3am1Vd2ZhOWY4anM4bXA1aFNNY2VzSVowWlky?=
 =?utf-8?B?SDd5V3kraldPdXZFNFZVeHlrMHhZRnZtVnBjOUtBUm0wZ3dNU2tvc1JwLzBt?=
 =?utf-8?B?K0l0eEY0eUI0TzV1WTdGeTErSGh4d3VCN1RSR3c0S0cvSWRhbThMOUs1Snd0?=
 =?utf-8?B?QS93TlJmV3doQkU5NndJSnFJK2Q0ZHBkZWYyczBSQmM3NjNFUU00a2pKWnpH?=
 =?utf-8?B?ajBMRG91Zk5Zdk5Cb2pyOElqSm54bWh4K093eDZCRzdSZ0JTTnQ3VTlhN1Vo?=
 =?utf-8?B?K1FHMDlQcko1Ylg2VEZWRFpReFRjM01Uc3I3TDZCelZJSEJLR3ZMaUJxTWVU?=
 =?utf-8?B?UDVTckRhajNCMnM0c2FGa0Jac3hpOG9RU0NhWFVBaThNeURsNWtza2Y0ZzRF?=
 =?utf-8?B?MlZwODZPd0pib0luMjFJL3JyejhXT2JBcHA4MkpaK0xUakU1bUEzeFF6UjYz?=
 =?utf-8?B?UXhHenZiaDBldEh5cXpMdytlRVlsdTRhemVLdlhmOElLYWlUVnVlOFd2UlF1?=
 =?utf-8?B?TzBLNFpUNE5tU2l6V2VxdStqNldXUDNYYlB6YXZMSTBIRXZ2Nm9tWWVsZVpE?=
 =?utf-8?B?M1Iwb0Vnbi9aUkNZdGo4UU9rV3h4ZndSSFVqcFlKbTZMUVkzZi9nRWZyc25q?=
 =?utf-8?B?ZTJuYmlTdUVzWEc0R3h3ZE1BbFEySVhpOE9hdmpuNVlXSVlpZWVDd2dpRS8r?=
 =?utf-8?B?Mng5K3hEa0VzSzBnbnIzenlRT1l0cnUxem9XRnNIMXk3VjNiRUtyR2ZiMHJQ?=
 =?utf-8?B?Q0VlK0hYMm43WnhSK2RYdE5UbE02MERpb0UxZ0V4SUJmandOREduRGV6S0hN?=
 =?utf-8?B?WTZzNHJLWFhvMTVPVGJnUE9SUlNidE11Q25TNXhNd2VOdkhPQmRVQ050OXVs?=
 =?utf-8?B?TXFyNG5LK0l0cVUwbVNjL2ZpUmdWcElORDVpYmI4WjE2R3JzS1l2UjdMWk1o?=
 =?utf-8?B?TFFhdmdFZE9NTUhaRnBoSHkwM2t0UzJTY2ZqZmVIcURNNlZFNit5QlkxaGJm?=
 =?utf-8?B?bC8yc2twRWxtNDVlSkcwV2lVWWxMT2RLSlI1c1dMMjFQRHI5R2dMM09oaXI0?=
 =?utf-8?Q?9PjqAgg0cTCyzko//gReWtUa1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b1f245-8ff1-4ae7-2405-08dd02c9bd06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 03:26:04.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOw9DifkEZ+KcYIDBApgX8SJGmtgeC4pVHWYAgnDW7kvjWDPmEAEBncqpooaXQHfGjaqpd5Ssiu+0WAbAmWF4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

On 11/12/2024, Marek Vasut wrote:
> The pll1416x PLL so far only supports rates from a rate table passed
> during initialization. Calculating PLL settings dynamically helps in
> case e.g. multiple video outputs are used and they each need their own
> separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
> PLL1416x PLL3 can be used as another Video PLL for another output.

Just want to point out that i.MX8MP audio AXI clock is supposed to be
derived from PLL3 to run at 600MHz in nominal mode(i.MX8MP data sheet
specifies that rate).  So, if a particular i.MX8MP system doesn't use
audio, PLL3 can be a free clock source to be used by an i.MX8MP display
pipeline, otherwise, video_pll1_out is supposed to be shared by i.MX8MP
MIPI DSI and LVDS display pipelines.

Currently, IMX8MP_CLK_AUDIO_AXI_SRC's parent is assigned to
IMX8MP_SYS_PLL1_800M in imx8mp.dtsi.  Although it's rate is assigned
to 600MHz, the actual rate is 400MHz according to clk_summary because
the divider cannot find a ratio to reach 600MHz from the clock source
running at 800MHz.  Looking at imx8mp_audio_axi_sels[], sys_pll3_out
is the only free/appropriate clock source that can derive 600MHz audio
AXI clock from.  Maybe, someone will change IMX8MP_CLK_AUDIO_AXI_SRC's
parent to IMX8MP_SYS_PLL3_OUT ?

pgc_audio: power-domain@5 {                                                      
        #power-domain-cells = <0>;                                               
        reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;                                    
        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,                                   
                 <&clk IMX8MP_CLK_AUDIO_AXI>;                                    
        assigned-clocks = <&clk IMX8MP_CLK_AUDIO_AHB>,                           
                          <&clk IMX8MP_CLK_AUDIO_AXI_SRC>;                       
        assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,                    
                                 <&clk IMX8MP_SYS_PLL1_800M>;                    
        assigned-clock-rates = <400000000>,                                      
                               <600000000>;                                      
};

      sys_pll1_ref_sel                 1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id         
       sys_pll1                      1       1        0        800000000   0          0     50000      Y         deviceless                      no_connection_id         
          sys_pll1_bypass            1       1        0        800000000   0          0     50000      Y            deviceless                      no_connection_id         
             sys_pll1_out            4       4        0        800000000   0          0     50000      Y               deviceless                      no_connection_id         
                sys_pll1_800m        6       6        0        800000000   0          0     50000      Y                  deviceless                      no_connection_id          

                ...

                   audio_axi         1       1        0        400000000   0          0     50000      Y                     power-domain@5                  no_connection_id         
                                                                                                                             deviceless                      no_connection_id         
                      audio_axi_root 0       0        0        400000000   0          0     50000      Y                        deviceless                      no_connection_id     

-- 
Regards,
Liu Ying

