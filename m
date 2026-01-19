Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675222BEC20;
	Mon, 19 Jan 2026 19:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850608; cv=fail; b=r7HTmy7QFxXei9xnm1UHXHa10FxN2Cm43Cc+AECOx3bZczyo9nlZ6KtS+L3ugEpXjnIyTnTu9MlbrwZv6FxJQWphKc2rwhn4VG+3Ei+zF9gCBD1mpb6ebkOaILcQwJa9+jZmhjU7GITRVS+C8CgnXv4cfq4uC36H75xdVeiMf3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850608; c=relaxed/simple;
	bh=lhT2vXtUAbuVxSdVz4i2QyO+V8jXLBnb3vIumD0rNXo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HMWXchC+M7dn3C+ZAibFTBCyfAVanNgcequ6hA7KDUCw4Kr7nqH4g/iJKMYVlS/0f7Sh6htVpARwMZNUO77p1iNhVFjWz0colPHlnRliwviP/KbXyAGinOxWmWMV9CaSRS8LvKp+xnvFRb439h7rDURBwc9gcLA9LG3ImzflbTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dp/YPkRE; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dp/YPkRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueywAsMNxWZbQDkeh0sSYjpAyQ6+3opOQ4nZil998TwBig9vq/e9JDUrkI/2quprAaFZaZYq8anyUQUQzTNMIeA4qi8t4QoP/6Js7ZPFMxIk+Wd2ajgJANOeepOwVkOqAigj9XHuFf5EMFDKByBCGoAA1ZGQDm5zk/v8QlEMzL8n+Gpu+FG/rKA6OOz5y1Id9GjylcMzCQp8G0Os2DMrtqwB7jDjohpVQeQ6l0PcXvSHttPxeYg8Jdiz1iRgwEy4yHlAKhfQkD/UCTaSq2bmCDHU0d3Wlh4Ps7AkFAjytvpYNF6GSbanlCCU2vVVdgGwmjxstURj2kRSoSAIUyWNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKeNxEDgcn69qsIh/uHBhQolHnILVbREU+zLwKOtvL8=;
 b=Sonc7qLXykJtdWAdF/6MnXenjZUQM3KTKvYvJveBxeyyKv/7uH1a0YGEqL1Wt3FfHSVwBAUq0G/ZSd4yseb/gyL+9pTsJ/ZqK14Rz8tz2oT/Y+wkOqeFv3WOBv6CPcTngimtL73zjzNhPKny5dGwp1JGEip7mL1BprGg3mq4WFK3b+mHgtqszz+hMbY3duejhUCM+/6/wav5hJfJvi1uFZvlYIsMRFHWfUza/VF3yreW7d/lYZxgjj4D5loU2V/g7IgVzCho51nEwOxfVQ43YpUVI41ERALVo3tbQPJo5V2IViMD4x8n+66V4K+FqQ4XMwaeuuacW89yyCLk93OsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKeNxEDgcn69qsIh/uHBhQolHnILVbREU+zLwKOtvL8=;
 b=Dp/YPkREsOk4VOfjrlLxg7nLiOhYDJ0Zo3kip+s57KBeMZ68yIPB5na98YZ7XgukHr9N3AWW70q/4mfITZtKU8YDMoesUbDCWEwJMA6l3usgaUWlzbuleX2QG0lUM3JwnAXUpavSgZjjzROXtxzlyV0hEiorLO2g3BkGE8UKMt20iFCSLb9lXaxIijVpsDiAjRtKPzYzWmeEyrLMT4brI8xif2CPG3n0cIcyuxjms3yI6KYzVkLM8AieoM+qU09MdV+oNNyZMvVWRxDzPTmXHZq0jW5I0FM4EziHOSdywi/2Gvk9DHKGQXZZDw2N/K298aPodYf/ztbdqI+j4hOAYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:23:23 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 19:23:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 19 Jan 2026 14:22:58 -0500
Subject: [PATCH RESEND v2 3/3] ARM: dts: imx: add required clocks and
 clock-names for ccm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-ccm_dts-v2-3-efcf9155941a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768850586; l=8065;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lhT2vXtUAbuVxSdVz4i2QyO+V8jXLBnb3vIumD0rNXo=;
 b=2pNa/mxzATwcmWo7FJsC11NYH66bHrEANALC+zPobDGvkX27R2h2ygxCGWLE6aN7/EpUHVPRt
 BPGWb5LWDe+DCIjYe53VG89wMG9xEnewNGqJvYTMkj4+u40aaqd9m1l
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
X-MS-Office365-Filtering-Correlation-Id: 20bd24b3-2818-4700-e2c1-08de5790365e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFBHV0xYaFArdHEyQXBHVlROaEJDUW84M0pRd2s3Y1YrNWlCTGFaNUJYNmNQ?=
 =?utf-8?B?ZzZqdEVVK1poaUV3QS9NeFhPRHF3QmlaMENMZDN2STFSWDNoS2JLUVlMcThG?=
 =?utf-8?B?czd6L280NjZzZWg2WEhjOUlMd3VQQVo3Mm9LL0VvQkpVWE56Um13Wk9OMVhQ?=
 =?utf-8?B?elZHQ3Z5V2hweGcyQ0xvSzVLWlgrQmRHTi9sL3BJQlVpTjZFTjVkUVppQlJj?=
 =?utf-8?B?cFBtM3BFMmJnakJwZGZLcTFVYkdaQndOdUtlTEJpN21XSTJyMHhxNFo5dE5G?=
 =?utf-8?B?dTRrb2xFOUg0L2lPdnY1WVdzNkdlN3B4aDE3alBQMmdNTkFqMEVOOXNmVzBr?=
 =?utf-8?B?OUE3V1hRUFdZVnFybndpRkZ1aDRTNzhJQk10Z0VvTjRrUEhPV2VEcS9CV2FZ?=
 =?utf-8?B?MmZTWGZFbzJMUFFKV3Z4ZXd4ZWNQMDMvcktjYmF6UEhRWlBtSVAvWUt1U1RB?=
 =?utf-8?B?U3ZGUC9hT2ZuSW1RazRJQ3QxZTdWa3ZjSjdEWFVlNjZ3UnljWk9lcWYyKzVR?=
 =?utf-8?B?bG1SZ1JqL3V0UUw1azYxZmpzKy90alFvRktveGhXa0tWdTZqS1hPeG9pT1ZH?=
 =?utf-8?B?ZjRub3NFZ2RTTGYxM3JReVNHUnpySjVSdkJmeG9TUFlOZmhSUHNSd0NCT2Vz?=
 =?utf-8?B?VzRnQW13UW45Ly90aWgxOEFWNEV5SG0vTXdtZmNjRmxKRlA5aVQrdG9oV3Jv?=
 =?utf-8?B?dlNQeWhTTnhJbEs3MGRETjRuNUg3aXNrQ0xCdko0VEVzOVhBQXRqY2tOdjlW?=
 =?utf-8?B?NDJNbWFLSTVSZEU4dktUOVJrbXp0bnZOQmFFUG9VVTdCNlpjR08wSnBCTzBV?=
 =?utf-8?B?eTFnSGpPMUs5VkljNXlVRFpFc3VkSmdKdTZZNHc5OFNrNk01L2o4T2hFb01a?=
 =?utf-8?B?MnZGU0RDeThUbDFQRHJ6V3p0NnJSQmJsb0JQdHpVb3NkdHZaUERFL0NMV1Zy?=
 =?utf-8?B?bVBXNWZ3YVE1VDBldEFHSWlQN0dRTzAzVTZlWm5pbzhFK2V2QXdCWnpGMm1X?=
 =?utf-8?B?OHdwdXRacXE0OHFVVTc5NmloVTNXdUtjdTZ5TlM5ZFpoSHpkYkJ1ajY3dU11?=
 =?utf-8?B?MGh5OEZuNlh0RVQvamNOUWpYdkJDV1R5aDYyeXVNV3Y2VGNyZjlLQTdzYUZx?=
 =?utf-8?B?a2psYXlybmVWcnlTRkt5MXY5R1JraVlCb2lYa1U4SnJEaEhaSGt6Q1VHK2FP?=
 =?utf-8?B?eThvR2xZWkhLeTBRdnlydFVyOXRBV0Q0UE1BRmpBWHhiQ0hUcXJjK0dLWk9L?=
 =?utf-8?B?cDhTVDA4eFN1aHNyQ2M4YnNuVnI0aThCNENHMnpkaGZXdUVXL1Y5MThtWjEy?=
 =?utf-8?B?WUZyR1pMZGdrZlZJeHprQmdLY282WlNOL2pJTWViUHBjZzQwK2swUmNPN2dV?=
 =?utf-8?B?Z2xzR0NsT3hOQlZBem1JSU44eElmNWY1QW1SL1lBMTg1K3pRaEx5YXVuUVJW?=
 =?utf-8?B?Q0wwcTdZcEd6K3hYK0d3ZGU1anRRV2JOMjhCb0FGZmx5WC9CNWFCVnd2TG1n?=
 =?utf-8?B?eUZhVE0zSUlQb3dsL2FjTG1UNWVObGN2b1l4V2hSbnl1UjNIMVEwMlk1T1p2?=
 =?utf-8?B?L2R1OGF0eFdjMUZGbi83bnJ3RW5Bc25YbDQybURJQnc0ZmU5MFFLMzBvYVly?=
 =?utf-8?B?c3YzclBtY3B4Q055a3Y3b3UxVmpuRVlJWEpsbXIvcjhhS1pRMi9IeWE1ai9l?=
 =?utf-8?B?TDVlUzRwUlZTWk5RNzQ1aTJlcHo0T0V0NmhSV0syVGpJcER1dksralN0UWNE?=
 =?utf-8?B?aXdTVzQvSHJraitVcVVhNndaTXcwNGdpcENNc25PU25wb1IvSVg1UzkyNHR4?=
 =?utf-8?B?d1h0dU1JTDAxQUdsamRuMk15cXFFUnVRdytRR3d0ZGRXMWpoSzRCWCtqeS96?=
 =?utf-8?B?aWNPNW1mZW4yUjRweURySlduTm5kd1NxRW1vVFZiOFdoR2J4WW93NDh2eHlO?=
 =?utf-8?B?d3BjU2EzV3M0eXIxU3luLzdGVEdqZ3VBOWVXUitoZE5tL0NHeTl4SlFXUzho?=
 =?utf-8?B?TE5xN2oxa0dJZU5MWi9uY1Y5SmtlaGFXZHhGYytnVmlvOVFESk5oSmI2Nmlp?=
 =?utf-8?B?RVFpQkdZNGdhT2pNTHdjMXJrMzRLY1VUMEdNQ0RDbWwyN2pDU3VGTU1lN3Rk?=
 =?utf-8?Q?VPo6nWeE4PxaEZ/njDR4wLiWx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxMRHpsYVROeWxyb1Buams1YnRvS3JQTC9rLzhGU0ttamZmSGNIdkhTSzQy?=
 =?utf-8?B?RENpNHM3Ny9UQWcxYkdoaU9FWVZQeVoyd2p5cU8zQTFXUktabTVQWTJ2eVNX?=
 =?utf-8?B?VGFNYWJ0VklIL0xkSmJoTS9qMDhZYXdOWDVxc3Q2Ry9lY0RrZmtDM1FSYnFI?=
 =?utf-8?B?b2F2cThxbjhvaTAxNDlucDNXY2pPL1c1WC9uNUVZQkJHZnNLbmlWM2x1WGVP?=
 =?utf-8?B?ckoydXZ1Z2hmOFR4ZlpJY3pCOEY3VERvSjlEQWJFTk1NazdJR0E3d2lzcnA0?=
 =?utf-8?B?WXlMOVhIMHUrZkNGeE9vcStmYWhMazBHQ0F5bW5iM3g2dXRYTVVIMndEMDBi?=
 =?utf-8?B?b2tyVkNjVkZhTkZzbDVxZDQ4V1lrYzhkajBEV01zcnEwZDhBT3BSWm1UVjZs?=
 =?utf-8?B?MU5wY1FiQUZ5c2luTWd0RmJOZVhYUWpVcGFDNWdJTVFKckQ3UmZwKzNDajJ6?=
 =?utf-8?B?aFF1Rm1JVFFuZWxzZHV5bmJGV0l2Z0hUazB1c2c4NDF1cG1FTmp3Z0hwWjFW?=
 =?utf-8?B?cjlvaUdBOVgzcDZRMm5qeC9SaG14SDNteExXVkF6RWhmR3hNNnhEMkRRNFpL?=
 =?utf-8?B?UTJUcXh0bHlHS01UVEt1NERSZlFBOWNtY2tvTEI4aEg5VzEzY21UZWNFOXJm?=
 =?utf-8?B?WmhBeHpnRkdubkNHcnRnTHNXZGYxSGhOQTd2ZldjdVdGUVVPZWFyb0pGTTlr?=
 =?utf-8?B?Y0ZKQ2R6WThXckFhdjQ1Q2RGUnc2aER6bkpkR1RHYkNlMUdUUDZTemFGMUh6?=
 =?utf-8?B?ZFVlWG5oTzdhV1gra0s1ejV1d0N1dUZ0cHczRHJGK2RUZDB1blpCWDBPVW1x?=
 =?utf-8?B?dmVReU5RTlgxRmJrYnRzMXpUVGtNZlJRUzFLNG51aFpvaWt3RTNuVkZWK2dK?=
 =?utf-8?B?bk5vR1hBdTd0SjFFQnFpOUFzQWhmWURud21FYUJybGExbWJSaWZpL1hhcnh4?=
 =?utf-8?B?R3FmTCthRVQxVm5Qb2c1U1o3SjV2R1l1VlpiSVJBR0U3TmNtZ29OWkppVWhT?=
 =?utf-8?B?czQrM0syTEJGZ1A5Y2tid3cyV29VT0ZiZ2pjSjdCQlZFY09UQ3FlRG8rQ0pM?=
 =?utf-8?B?UjFROHFXWnNsYXFiMlhPdzE3Rnc0akZhZ0JsWUNMajBrMVNUN3FIWG9JRG0w?=
 =?utf-8?B?RjJaOWx6emZORXBMYU5wV0ZYRjQzM2o5S005RjVDT0VQNXRUUkt6bzI1ZGNv?=
 =?utf-8?B?TVlYUmJUMWxRb1ZoaFBVZXgwZWNtcVhlTG5jUWd1OHBrdHhWM280YjFEang2?=
 =?utf-8?B?d3Vlbm82UUtFZFk4ekpjSWtsK3Vua0RVaUZZdDhjUFJ6cE5JaUR0SEVtQVZG?=
 =?utf-8?B?cHp3RC9KYlN2ZFIzWHY3T3dPUGRldVdGUXJ0WCtCUXJ6Rkt3WG85REUzMVFh?=
 =?utf-8?B?bys3T2dFb1BOUFJhL2pGTW45YjBEQWRBcGkwbEpLNElhQlZlenBtUTRyWHI2?=
 =?utf-8?B?RVpKYm5tNUxUQ25mS2I5RXNNQ2JCbG9qbWxjcVp2WEdLVklBQjBRd2JLOXhC?=
 =?utf-8?B?TktOT0V6Qit3RDFUT0hHWmZVRFhLWExDREx5M1gxWDQ4VTNkbmlUT2drTTBZ?=
 =?utf-8?B?QzNCK0oybkNzektZcENHSkZ2QzVXaWZhUXVjRThlMEhBR0dyQlNLMmI1ODQr?=
 =?utf-8?B?eXNaYmhmckhNc1NGSUJCVnlVei8yMER0aHJRUFFTQmNIZGxyeGVFaFkzS2tp?=
 =?utf-8?B?dkRQSXB6SzVUcWFvLzI2YW9rS1hJcWtISGpwYS92NkNFWG8waGpBN09sMUVs?=
 =?utf-8?B?WlViZGZlK3N5S1RhNEJCN0dTa2tQejkvK0hDOFIybVJ6NUNROXYxb1plZG0w?=
 =?utf-8?B?Y2MwY3FWTURkSElsbEpuc2NhcDZVenlYeElTS3p5NXZ0cUVHSTVSVTJHL3NP?=
 =?utf-8?B?SzNSNmZ3MkwzaEtQVWNJSlhHa3lqZjIyOGlnNCtZb3lqV1FobjBtcjNQTU5D?=
 =?utf-8?B?WmNTeUNFUUsyVFFwbHY0dmVHRkhqcDZaUGJudW9TdUVObUIvWUM0VXhGeTZr?=
 =?utf-8?B?WDBEbDM2UjNjLzJ6RkhkQitVVXVYa3dRblZDSzRjb3VWNzZiT3F6UDYvb3Bv?=
 =?utf-8?B?OThkY2pNSkZVWFJxdjJidktwenZDUGNwRy9BMWJGM2lZam45cGQ4VTBEcjBO?=
 =?utf-8?B?NDU2ZEtCc0draE5OcXArYTIweW9KSUZjWkdaSDFVSU01b0JsTFFTSWVjT2Zj?=
 =?utf-8?B?YXpGRXlVcVIxdkpMYVdvekJ0bGdkZHg0WGZWWFRvckpKeitBRm5LNkhmeXpX?=
 =?utf-8?B?SU9hQWhld3NHT0NVdERmU2NwTUVVSmVRaktQYzMrenZQMjNPTWEwdDJYY2RX?=
 =?utf-8?Q?UrD0BtXbstovyJlTNf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bd24b3-2818-4700-e2c1-08de5790365e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:23:23.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/tDgm4mdleRRx2LqSIT/tPTq+CCX7ZlYyKIK7vrfzrarnCXJZVlHx1PKc9QD9qt5Z9TNHmdM80KCV8+cS6ODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

Add required clocks and clock-names for ccm to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
        from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- use enet_ref_pad instead of enet1_ref_pad (only use at 6ul).
---
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 5 +++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts            | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi       | 4 ++--
 10 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
index 9bb36db131c21956a33f0a5a013c5bb4cffe1890..aed4fb7843e2f2a5bc57499aafd3431b582437dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
@@ -193,8 +193,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clock_ksz8081>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clock_ksz8081>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clock_ksz8081>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398f24a69245dbf88f5c93ee0d347d8..5f61eeb9fad0c590e778d82d42d201fc2b0a7c3f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -66,8 +66,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&rmii_clk>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&rmii_clk>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&rmii_clk>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
index 47a6d63c8e04cf28795310aafcdd3b2b05740830..9bde6546255825ed871aaee592347e23da4d4141 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
@@ -119,8 +119,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clock_ksz8081>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clock_ksz8081>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clock_ksz8081>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
index 84f34da06267ebd477fbe71b465a44ffe5b4c098..69e790ba56624ee8ee8611ddac5ae3c9585a5c2b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
@@ -101,8 +101,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index 0ef24a07dedf986efdf4ce8ad4032814752e7271..fbff77944ce327f390abcabde638f4162d45eadf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -199,8 +199,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index 2160b71778355623a9f124975e2cd4dfba4be900..dcd5a4099c602d03704c35860f4d6f0beed1862d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -294,8 +294,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>, <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>, <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a7824c05ca64c36a1839efff0bd7f71..fb674ac2c2485a818ae593c63388bcec548a100e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -71,8 +71,9 @@ IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT1_SSI0)
 };
 
 &clks {
-	clocks = <&rtc_sqw>;
-	clock-names = "ckil";
+	clocks = <&osc>, <&rtc_sqw>, <&ckih1>, <&anaclk1>, <&anaclk2>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2";
+
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
 			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL2_PFD0_352M>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index 76b0007d20ad22eee738ab40ed126435a8fd17fd..18019a6bb3af07c43730ef60f884fefd810553bd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -160,8 +160,8 @@ vdiv_hitch_pos: voltage-divider-hitch-pos {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
index 0e02e448db1085e7f508e55cd55d4441d2f51a54..5ef1ce80869914f8866cf71e79dc1b3d54d56f5f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
@@ -57,8 +57,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 131a3428ddb86796ed843b46cbae12f5d095b2f4..894e5c28b2ac036cc29a2d23d4c6451f0da9dff4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -238,8 +238,8 @@ adc: adc@0 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };

-- 
2.34.1

