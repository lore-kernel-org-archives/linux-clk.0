Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D37296BD6;
	Mon, 19 Jan 2026 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850603; cv=fail; b=rDwMPbng0NgrhMol45pne2QffSOyDT6bCK7lY4SsZ8vpygMK7iJtLceqkGGdkDaadIhyK06dUDOcql2T0eBzNRNoUxEH5NVoJjplRJc1YdGypEUxTr6f0jQEGB3an3rjwQoQj6N/7Y2gmattMStMapnnMcUKXa2BNpkqqksHdxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850603; c=relaxed/simple;
	bh=1RxowkE5FTVK677T24G5xi3MPYZRIDfNJ7nf1gedgjA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LGmebpvq/MhiLX827BRscLbGfri4QrsQMm2W7WktGyQ5F5g3gGYukJLxULU5OXjUsQ4KGnubhn8VWesqsVRWHcIU/7v5mDFzZ5aAGYDqBbxNWtc/ubdw7IXVkbYdKM/pltUxX5HM+230DA69LLVuDcbLZ+fViSZPXwzqrbPSM1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MqQF7gph; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MqQF7gph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duZhzguBpP3peYFr+pcjgycz5yGf2AcFvHZlsDA6ryq8Uh5/EtpP+pCnsk7/qA8RBpr7coHZJYaiMhY3q0gbarVvebgy/f15pp+FdlFwCAG2WYqUIkx+Io9VchC6l/VdxByEQJw5p/PYVDeS1uBVXTaQH5FC0HcCGHcNq8e/K15KlNMUymKPaMHdJqU5cqfZSOfzQTn1e1H8nIRD9Q9GjpIISkbmAWXT5CkmymtkHYkotT73508pcR3Hhv3iPZAQ7PD+Nr5kKMfP8y7Cw32SxCqN/LXCmQTGX61VXm1KechAArgg7U86Dmomz09SF2/f+MgvIzpQwN6P1aPfYUQYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp2CsL1ns8pyZkSFyKHBK1MEQz8yQ0LJvn6uf4aZ9zI=;
 b=J9lcGJgfGhw5VhxF9ITW7wALQPpQmZ8m6vDtt2eAgi9kZiwFTc3wKa0NfQFSNgn8lbTcrWonP1sOfHo+R43BvCeHW0q9rALVI5KOu5JvVUs1RXQXUQ4n1MelYl5OUmCDhf+mrxkbAn8baaoqV7jG/8QNJXqsC/sizqg8O0UN7itijBgl00bM/B1/kwkmTfvzwjx6h8KSZ0wPo2+uXlGyIeOHz2VeAFZfUoBJ5ZBpYfYArzz+gjqEkOud7Rjq3YVhQHQUbvXzVjQXkzaa0ukwsbPKPIcH9P7SV4ijaUWZa6Gp3dR9J4THRhlEQWdoNPjrF0iP3FkfRmT2LioNguDapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp2CsL1ns8pyZkSFyKHBK1MEQz8yQ0LJvn6uf4aZ9zI=;
 b=MqQF7gph9CtuC9NJu9H+8xFXPpdHL8j/aHX1KHChUTYOqwRkI0TiQ7BmtOlO1SW5kypkmqYK3VbYVEvL7V3T6cAg9odeO+P6vMjWiV+vISURzDUzg9oI1Od7iB0P9qLsp5Dv/KhavtZUibrb47iW+bPNBcvRDw0Ud2l1GyMx+Ka+/IDvZD/XHFS6InXiJhpi+9h+ZKMCknAvC5rxxbCENwu/wGkUeNuaAGIsur36Ys1YkwZ3yWk2siIaFVB4fM1Vu3f1Snt3ZWDXeqkUxpzBcLi5iF0G4tt7mnxHWKzRkTKQWyoQe31WWDxg4QbgcfBclzR3BbMpV+g3vcNC0VSEDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:23:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 19:23:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 19 Jan 2026 14:22:57 -0500
Subject: [PATCH RESEND v2 2/3] ARM: dts: imx6qdl: add label for system
 clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-ccm_dts-v2-2-efcf9155941a@nxp.com>
References: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
In-Reply-To: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768850586; l=1281;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1RxowkE5FTVK677T24G5xi3MPYZRIDfNJ7nf1gedgjA=;
 b=WV5M68ktPEbIniVwcgBk4Ax7kpgmySM5aayF7XI3Hl3rzWcY/ULCBHNpV/lloWkBqcn9weTx1
 Em+9WC/jRUbAupnVlR/8+7UAQboTf/3uLhyzuDpcGPgMBLL+lC/spQ5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: f440c8d2-a29b-447c-90bf-08de579033d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3VTcVVwdFE3clBUcHZreVZ3ZFZLdzFPdTVPQmdnUE1yZ3M0OERmSzRlL2dv?=
 =?utf-8?B?R2RaWGhvcCtQZUt4cWx4SUZrZnVoeTBMYmRwanJaaHIyNlNoWjcxYk15QXdl?=
 =?utf-8?B?a3pyTnZzbG1jbThUNEJpbGlHUHFCZ1ZNeW1zbFYramE4TjVSdnBGMXdjWG45?=
 =?utf-8?B?UGlrZ1l6K3NaSWlEb29UTmVjZVpMQ0dHbEF5bUlIQUorZjlDU3BDLy9NcGlQ?=
 =?utf-8?B?N3VBaHNGR1lRYk5ZdjRnUnVzTWtQbkR1VGFUSW9wQVhwMWdvck01bjdiMDJu?=
 =?utf-8?B?bmJuV2hERndmKzNHeEhNUDlGNkF5SHlFSFZpT2JtRU1SK2d5bmNPZDQ4Uzdp?=
 =?utf-8?B?UVZUUnhWWEJaM1FqdHFaYnFxQkF0UVE4VCtRSHpqM3Z6WXFPYW9RaCtuSXla?=
 =?utf-8?B?TFZEOW9Rc2J3OXR0ZGxWdmFLWlBhZzlWQ2VrSXdwb0U3eXBidXN3TXM2Snl2?=
 =?utf-8?B?azhjTm9oaW5xb1FPL0lrYitKT0t0bVY3VnlzQ0F5OTFCdW5GdiswNVdZQnVs?=
 =?utf-8?B?WmJUb0dlUVNycmlVcWhCUkRETGVlOUJBWVE5Z1ppb3EvaEh1WEx5QkpjNVZF?=
 =?utf-8?B?ci9pbUJHKzFPb0VlUnlTL2F2Q0g5bXBVZ0tuMnlRUmdZbHNmUzVDZGlCYldR?=
 =?utf-8?B?ZSthNzZHeFFjSVFOcHNpdFdJeTl6RTZHMzN4Q1gzMVlkeFpTNk1OZDJIc1BB?=
 =?utf-8?B?alp4cG1oMlFVeXJjVlJoR1p2a3o0d05EUHE2bThqWGxHQlJLUzBNQnYzTEtQ?=
 =?utf-8?B?ZTJyVnYvcjJZeTVZY0I2OEVOVEhUTzdaNkhHNCtST0tmcktSSTRHVUVKb0d5?=
 =?utf-8?B?b3lkZUJYanRMSE9iQk1Wc21ScTNTcENwTW0xMHptWXFmM2FkZ3hRRlBpSldk?=
 =?utf-8?B?dmpiczI4b29CWUdFTERhai9UN2pLbTMxRDJBSDhVdU9Qc0NwQW55RnZJNng5?=
 =?utf-8?B?MkkrNnNFQzEyU21WWEdFYUdQK3dtblJpSWN3UUhPdnZUTHNIMWhsSFNZWFlO?=
 =?utf-8?B?c1ZtZnJ5dFJ4UXRWeEJ3SEJnakJObTkyWU1qU3NSVGpwVHhWYkN5dHAzSVZX?=
 =?utf-8?B?TXNwTm80TnJjQnhzSTRUcFYvZDNrYVN4MnJvQVVGbFpCc2o0WmJnWFhlSjdG?=
 =?utf-8?B?ZkcwZHYwcWpMeFUwZFBXd1FqZjZlalBPbHJFekVyMFhUUk5zeFBCaTl4U25M?=
 =?utf-8?B?U2o3WktIcFhSQUFKaVdpbmdDY2xiZmVmMU0xSWtGK25POHlXVUVuS0thUGkz?=
 =?utf-8?B?aEFmNE1kWlc0dzZ0T1hWc1RnK21UYnhhUzlDV1dNYUhuMkJ5QS9ocEZjSlVn?=
 =?utf-8?B?UFB1OUhqSXcwWGhqbzRDZEhjdkZUb0Q4Sm5yLzVSTHhSc2JlblRyY2JCZ3VK?=
 =?utf-8?B?L3ZyOG1rZzhraE1lS1BIRHNYZklsdXZBMFRhQzdVN3gzOHphM01HclpuOEkw?=
 =?utf-8?B?N2dVN2hlNEw1VDJ3MjZUdGpWeTFwOWgzNHlEams1UHQyWmk2VDlSUzN3U0V2?=
 =?utf-8?B?bkhCV1dUempMNGZnMlI2VVpBWTNicWtFWG50QVUvWnNNck9RRUNDUGlEWi92?=
 =?utf-8?B?UzkxNG5yY1M1dnBTOGFJdHd5eEltc1crNzhXbFB2ZTBvZThmbGVNcWVHZCsv?=
 =?utf-8?B?SWtsUEEwcFNDb0hsK0tWbnpoUFNJNEErYXgwanZIdTNmMSsxWUwzVlgvQ2Ji?=
 =?utf-8?B?ZFZBT0RlcFc1QjlpWnVIWTNyQ3VQVURPZUlrNlFocTVuMEZZUFM2SXBTSitF?=
 =?utf-8?B?RkViSWVkYkhITWtNL2xsckp5VFIwelYrKzlaTU1Fcm1xbm4rVHNpOTYwMzkx?=
 =?utf-8?B?LzErbHFteWMzeHpkcTR2U2FyWTVNWVhPRVBtUVVJMDlHa0dsbzZQMFA1Sk85?=
 =?utf-8?B?Ty9GRkVnN05oclVxN0FQWDl5c3VPU2UwY1QxZ0FsRWlOWEhVZUZZRGhvbEQ4?=
 =?utf-8?B?eTdBeHJZYnR0eHB1RUhhUGU2bEIrOWJmRmhqUGUzZlpVbFpnQXZCeWpLRnBK?=
 =?utf-8?B?NkE1WUpZWVpLaExIMGhSajJ2SDlzQlZOem9BS3Q2TWlJdS9rMHNncmlwMndM?=
 =?utf-8?B?MXovQUt1bEdReGVQOFhHaGpwbFRLYnRKSkQ4b1k4U3NtZUtSZ1V1VHJBK3hz?=
 =?utf-8?B?eXV3dkRJUkVHcDdydk1ReVJhQlEwU2I4b0ZCc0tSNTVZUzhRVlY0UkpJU0xR?=
 =?utf-8?Q?16XeIH3hi4cIio/X2ojIfkI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU5PRkYxYitDRTh3M2hodWphT2s1UUptbk83NHlMSktnSEc5YVNhbSswRzNK?=
 =?utf-8?B?Y283T3NhbzQwS25HUHZ4MnRBc1dyVHlabWpNTmg3YjRqWFFvV0FMSUVtS3ZY?=
 =?utf-8?B?NmFTd1hVYnNMalRjSDJjVnc2N1pKOHlFWk5NYklZRnIxT0lsVTlwWEVPMHVK?=
 =?utf-8?B?SzVFUWRnbXZWR01iZ2UvQmhTaVhSYU5hYUNsN0dCMENUOXhMZ05OaFRQWElz?=
 =?utf-8?B?S0ZFT0tROEw4a0NVa2Y0Rm9pYnZjMXo0MmI1UDhCN1hESTI0VkI5d1VTR09L?=
 =?utf-8?B?N3lvcDNPL1YrcEREM2FWcEkrODVjU2MyK0JBRkphNk9rWE9sdDhWQ2E5M1ZL?=
 =?utf-8?B?Mjg3NHMyYXhIdzQvUktsZkJPRTljNTNwek9FRDJlaTB3WGVzUWkrZE1rbUlu?=
 =?utf-8?B?Q1pXSVhFQWhLRVlYaTlRVkFEOWt2YUFVa0dJenFGc1BQT3UzK0xFckxhbXMw?=
 =?utf-8?B?OG1QSlNlUmhQOFR5SFVUWkNCK3JxR2Q4OXZqbFFDNFBvTHBuWHZQZG5SMnl0?=
 =?utf-8?B?RkxzS2trckRTMWhyKy9LcVdGbCtYRjdRcG4vRmVPWmJKdVdkR00rMi9yVjVa?=
 =?utf-8?B?YjIzeXBhUm4xb09ONnM0UWt0eUV4eU1SUlNxd3doRGFGZXpVa3cySDBkVC81?=
 =?utf-8?B?Mk0xSUxVNitnWEpjTG5vanJ4U1lINmlJQW9YZ0J2S01zaGVTcGtIWW5mSkN5?=
 =?utf-8?B?NzljRWFVenZzQXRQMi82eElENVR3UmtiMVBob0NidEJManMxS2VKOHNJM05u?=
 =?utf-8?B?Yy9NSGhNMk1CSXVlanBNYzI4Sk9XVmVZOW1HeDFqSWUrRnp5dU1LWFByanl1?=
 =?utf-8?B?NXQwcEpwaThGZ1Vaa3c2c2JpR3FETHIwWGxiZ0RVVUxCck5TK1VMYkxlSEpk?=
 =?utf-8?B?QzRUY0NKSnVCd0o2anNuRU1FdVNsbUNob3JpRm1FWkFRNFRlUFBwOEdTMUNZ?=
 =?utf-8?B?Ny81eHJVdlY4ZU9ka0lmTi9iUVZuNFR2czZnWW92aE1BajA0YlEwaWxXVlhN?=
 =?utf-8?B?UitxUktjUE5yTEcwZ3B5bGFTN0ZBQlZrY0Z4NVA5bElmMG14QVYreW9xZkND?=
 =?utf-8?B?eXZRYndXSkhUUTZYMUVoWGcyWTRxYlBNTU1pSDdXNWdvTmhiQkx0ajZKRkRa?=
 =?utf-8?B?T3ZkTVE1R1RpSExXTXZ6Y0o4cU4vZ3dyaklLYnBmMnRkbXVFTDh1L2p5S1U2?=
 =?utf-8?B?RUNSQi9tMy9tZFNjcGdSazF0c0JMMHhDeVB6MXN6SG1JRDd0bnhHRHJTWGVG?=
 =?utf-8?B?bHpFTGpQWUNUT2ozWU1aamNIdm1sOVpGc2kvYlMxMmYyU3RiNzhaV0ZmaVZz?=
 =?utf-8?B?RmY4c1dlSHM2a3ZRRnF0WENsbmJVYXFVQmw5b3hLMU1ZU3J2OUswZ1JpMjZy?=
 =?utf-8?B?M2xmbG5ZdDBTckdBM3JYWlhxRU04NXFmaTBlUy9nYjBaaWt0czQyRG9zTHEx?=
 =?utf-8?B?NGVaMFdkeFVCSnBnWk5KUzJxU2lpL3J1d3kzekFPTU42NStTS1h2ZmF0QTE0?=
 =?utf-8?B?cXBvSnZlZzlXQlRMUXZGQnQzd0d6MGY2YmNZV2tOTTEreS9GZWxkMVhMMERi?=
 =?utf-8?B?SGRpK3RxWDE4Q2FHYzhTQStBMjFDeXZhcGI3VEFEclpxcXplNXBUOFhuQTA3?=
 =?utf-8?B?bFhRL3RTMEUzM1dubk8vSm55RFVaUDlBcVJ5NTFwU3pIakZxTTN2UDdIbEtV?=
 =?utf-8?B?OHBhSlZGY045N28rRVptc013UEVNNXExem1EZlRRZFNNdGxxVy80bTM2YmtN?=
 =?utf-8?B?TFM2a0xBUzVFdFN4UGJGOGNQeDcyOW1VSjA1RTNZeFZzcDR3d25DdExDYVZW?=
 =?utf-8?B?M09RaXZhczBNNlBvVGZlQzlhZXFrQmdSYlVaS0Q3ZTE3b2U5VmZxTUQ1N2RN?=
 =?utf-8?B?cUVURytkcWZUUEpmMjdVbzFMQ1poMVN3QlRURGZwaElDTTU1aFhTYk92SFdZ?=
 =?utf-8?B?SnVhWjNNZFpJNFQ1a1ZJL01TZU01aEI4WXpxSjFLc1FTL1NLbWVBdXRSU3gy?=
 =?utf-8?B?RFNBek9TanhwTFJTYi93Z2dlZjJGVXc3d3IxenorMC9xd1o2S1N3UkhVa0E1?=
 =?utf-8?B?QStCcWNWK1lQdkVabkc0ai9FS1lpOWFmNVhUYTFvbmtRRFdXS1FBcGFueVJ4?=
 =?utf-8?B?V3hXUTZTUnJaTFNhNVR4NUVxeG5SUmVLTTlXdXJHcFh6SkZEQnplejI2ZVhF?=
 =?utf-8?B?SW1zZGFmc1N3a2xJbTZlVXlFdkE2bHhqR3BUSHZkeWcrWmhzMktDR3BLQWlD?=
 =?utf-8?B?STYxdFdGMFNhUUJaVXVkOUphM0NsdmhKNUE5aGM2VHJJVTNHam9DRm5rUHZx?=
 =?utf-8?Q?KJMOXFw/8xBLadXNMX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f440c8d2-a29b-447c-90bf-08de579033d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:23:19.2754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLG/gtWroLp1iu5pPGse9T0p4F4mqo69xJJTC9sbFQLCVI+U/3+rRpFbG9NhGIcI09KgrvwB8NtqkKMUdFATDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

Add label for system clocks and add two missing clocks anaclk[1,2]. Prepare
for fixing ccm related CHECK_DTB warnings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index a361886144ee1de5a183f405a58d7020d75cba9b..6887e7f8d40470eb149ac1fb86876e544b8e22a7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -54,23 +54,35 @@ aliases {
 	};
 
 	clocks {
-		ckil {
+		ckil: ckil {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
 		};
 
-		ckih1 {
+		ckih1: ckih1 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
 
-		osc {
+		osc: osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
 		};
+
+		anaclk1: anaclk1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
+		anaclk2: anaclk2 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
 	};
 
 	ldb: ldb {

-- 
2.34.1

