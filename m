Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863F31A07F;
	Wed, 31 Dec 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176007; cv=fail; b=QUVYqBak6c1ih0bwyc/a36WS48twFdQ3ZaLoy14yjgvHHS2WlCwiv8gFE7MjBeUb1TRc7hB94JzzxKgUs3XwmY/BUQ4X8Q3KYD4HvUv2Xx+pjoPFcudgOLWkBkIqn+yZlGyL+U0rIqC+5savrxd4Y71zLAwjZXLQo6y7j3vKIx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176007; c=relaxed/simple;
	bh=3HptXKt/4iO51FKUPRBtm6nMsR3DFpWhRUYjRtXyTEI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ca62mTXqeuxrClc1BlU/Igu04ZuWkeXbdjirg7qqQv4Gv5gaeZP5bbJ1AR9KCVWalgeyvMH7eq57X9EB+fY72azRSQ/pfpmftDXnRGdefol3tYviQ1i0vL9RxGvqwquJggknWzEl5jI9BwqQ+gGvNuU85B5evD3US4zaauPq7/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nkpoLI96; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nkpoLI96"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/htmFUSwwEtdaJdelnflJYjYV8/AYmZtnuMoJwpXBM4d+EZyPJfA10gi8if/6UD+6hvBXx1n0E8W9vqJhbzoWFyh1u/ZmFYDa1dx8pPdmQiqe6EEkwlmvZUnyZ7534NKk5yuZnB6pecWW3OYsg38zTz26CjnSL279HmIW+0mb/hIjkS0HjkG0XiYQut1FydEAzpC33ovGjcvKUMexGetr0OHR6iGATndyvJFFQ+q/FnShOlK1KZrC1o+nOzNng9F0+MT6n+Am+1CBwCiVwLB/SQ2rIczcCd0whysiujEMvh/D7fDxfd4ZGmMmQfi4qCwyeBF+4Z8VzxIWMSnyOgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvv0Pno5RyrKuhLVC0zF7WPwKyD7sDK3n9uPkiWdWuQ=;
 b=bzfxlD59bsLXyRUkb4Rdfbnr3kpHInQ0QhUk6nU9oimbJhLzSuLGcUHnSk76J5HqS/rMxsA5TPgYIU7s2a6bcBWBG8Xz40Aop4hEoPpROzimbsoN56W5FVp5rQejtFQr4ydVibds8X3IgYdOfjopFQzMqdS87wDvnu6Lre/wNJhYLI9laH1pfuIM+6oSfNTMDIFKgPf5b3JXLZDdUbF2uqHQVAF4YgtwRzOge3EnGGOwBTZM0SeRorqnC4RW6qOX3zH6kM7q8OZpkcn+3vC+LEOd0no53GeXVR2fyXlvNnjyoprE3mZ6aBqAn5yn66u/1dxrGRguqPGBA2A1usXEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvv0Pno5RyrKuhLVC0zF7WPwKyD7sDK3n9uPkiWdWuQ=;
 b=nkpoLI96BWKIfpBYuHkVxVCVdMK2+M6eA3H3C8UtPDvWOyxso8q5FtjYG9ahgubx1FFZsgerum4TVKdBSKmwmkG+TIfztnQGBdfI8If58JoedIMr8Eh0TpI8EuZbCirci/2OQV5vQwhW1n1cVpNlUv+IBAVe0oEkamscxUrzlHGSMgRS8Zo0Tj1gXsrf86V8FRUHZxA4a6IgQW243aZ2hJl2OzvvUHCW/ncvst7PkuZdQsa8d/A63uRdtl0xpCNaL1GrSOzkooq0QzwxAEhbaYgvQCiIphyAkznfs9KLaFzsqNzH4g17l78vjeAN61qDFhCy282KI72weZS8mId8IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:50 +0800
Subject: [PATCH v7 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-3-380e8b58f9e3@nxp.com>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
In-Reply-To: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d0d09f-874b-4edb-8662-08de48553a08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTNDYWF5RUNuOXBMQWJaMm1DWWVURGJCckFKSkNGVklKOHJpQmlCUzIrMlY0?=
 =?utf-8?B?YzJablZ1TFNVNFdHeGJRaFhZdEZPSk5Rb1FLNVRydHNMd0R1ZkdiUjNmQjdp?=
 =?utf-8?B?b2k5LzlHZ1NuanFCdEQzWG9HWTJTNXRMdGg2cm5oYkdZOVVkWmxQa0U4VHk2?=
 =?utf-8?B?TDlocmF4S1NESHAvMnM3TjZZMjY0eExROTVZUHloOXMwK2E4bldzYmRFc25P?=
 =?utf-8?B?cFZ0L2c0TEdjWmw1TVhVQTV6aGdBL0p3ODJMTml0VXdvMGQ5WFBGK2hiUGtF?=
 =?utf-8?B?VzBkVVloVDRJVm1yemY5MjlXUWlLL0l6YlRzKzdqWFd3ZVlqbG1CQUhaNjlp?=
 =?utf-8?B?UHJ2cGk1WXhxNnNoTklLUWNRRC9May9XdUZ3LzhMb0FGUFR1UzNRRi9hSHEw?=
 =?utf-8?B?SlVqanZ0NjN2aStvZUFPbXZibzd1UWkvVjVLUEFCQXhnai9lU3lpVllzb0Zl?=
 =?utf-8?B?SW1zVDNlUWxXbmIxUzMxYVZuM0h3VTVlVmNBeGhhN3pNL3lMQitxOHVSTWRw?=
 =?utf-8?B?K0pqWGNENXNyOVdGSWtNWXo3c3dzUXB5MldoRkZ6R0lqbE5UWnowSXBCN2NP?=
 =?utf-8?B?Qm1aeHl0SWRnYisrK1pmS3QwaWpVWGQ1WTE2K0JLRDBvNFE3VVVMRXdETjU4?=
 =?utf-8?B?OFgralQ3VFFmaDJ0eHZGY3RNZmlNTnhxZWR0ZnF5ODZTZkJ0MmsvSjhCNHZn?=
 =?utf-8?B?ek1RVkVqN01Mb0Z4aGlDY0VyZlJwUkJFOVRwN21LR2E4U3RqNjcvOXJvaU93?=
 =?utf-8?B?eWZFcnhJbW1RVXBIb3plOFpnaE5zZlI4dXY1Z2xRN2pmZW1ORlRmekU0MG5p?=
 =?utf-8?B?VVV6bjR2Nzgvd216Zjg3QXJ1WDVYS1R1NWkvU1B4NFdBbHhxL1J6U0J2K0ow?=
 =?utf-8?B?TjFwaEVqK2dhVnFqeHZ3ZzRBQ1E2cmkxbTZJZnFQOU04TW5mSm96YWZHd1h5?=
 =?utf-8?B?d1cwcnNWVWt1bU40c3hOSjBjMGN6aUczaGw2RDMreEEzUE53M3UwWWF3RzJ3?=
 =?utf-8?B?YlhHUTBZZlB4dXlNZU8rNkxWODZEZ0FSTzBaVXBoZ1Q3YXpJT28xS3R0VERz?=
 =?utf-8?B?eEh1aS8xMHdSdG0xQm5YWFRaZ3NzaDZ5NEpXVmQ2L0YyYzhqbTRQNk5yMU5r?=
 =?utf-8?B?dThPb2RubGQ4a25Vb1VTNHNmVmo4Y3pXRXVxOWk0ZU1PZEVCK290S2RqSVNX?=
 =?utf-8?B?QTJsam5mdzJmVjU5Mzd0ZU94TEdpMGgzTjE2aEwrZ2o0US9kekNvemVWbENw?=
 =?utf-8?B?WCs3S1BjWEJ3QUFxN0dlTHpKT09HQjVkY1RpYmRLd1AzSXNwZVk2b2c0Q1hj?=
 =?utf-8?B?ZE9rWkMxMGJuL1VUVnhLakwwM1Mrbk9pdWFEbmkvY0VKbXBiQmtyM3hiZVJ6?=
 =?utf-8?B?cldkMTZNRS90cUZTNlRUM1ZEajMrTm1NWTRRa3FWSk9UT3dackRSZmQrR2pT?=
 =?utf-8?B?SjdUK3llVHpNZDJtU2Q4YzJwKzRVeTQxZUI2MzlWOEVHVGdBWkZwazZkYW0y?=
 =?utf-8?B?Vm0zSUxhWG9RZUcrL1AvUkU2bVl2bmR4ZXJVZzIyelFoYnh0aTQ4WWxLQ3pJ?=
 =?utf-8?B?MHNmNjVuSUdUbzduSHRIRDE2MU9BdnJoYithaTQ5VTJrbG03ejJpMzI1WmNq?=
 =?utf-8?B?L1lYMmZ6Zm5Db0FXNXJQbnhwV3BPejY5NE1VWG1Bd2ZLZEtjVkdqVUF3VDg0?=
 =?utf-8?B?V2svQTQzZG1PS2M2dEV4aVZKbFhQNHJnYUxEZDZGUjQwckpLRW81OCtRSzNa?=
 =?utf-8?B?R1Qxb0ZGVnFobjFYYjZFNkVCcklmaFVMT1Z0Y0lRNE8rNGFVdzhjVUlHZjR1?=
 =?utf-8?B?eTk0NEx5eCswelk1c2p3Z0NUb3N6TEwyT3ludVVEQ0Y2emYrZEljV2xta0lG?=
 =?utf-8?B?RFJiY1dIN0NPcUZVRmZpdXYzZmtKMnRGczFNS1hoQTRsRmxubTFCcFVtWUZ1?=
 =?utf-8?B?SkQ1aENJTmNTL2NaL1M3L25jZnpMQmZ5ZStlOUxoTHlEU2UwNGhrVzJwcEEz?=
 =?utf-8?B?WGJ4WUNLTUJUdnFacHVlWGV5M3JiRWFuLzN0VmNCNzhyNFVKTFBraXhlMUpR?=
 =?utf-8?Q?FJKK0T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3owcHFEV25CMVROZ2dsaDJUK0NzMXFDQ3hSVURwUnJRVjB2UThkbEdIRGhI?=
 =?utf-8?B?TytLNzNnczFlV1o0MnNTZ05qSXRVcHBCcEwxR25HZ2NNWHNRSlZVd0taWEhH?=
 =?utf-8?B?SjQyaDNjcFBpd0JGQUpSVlBOUmVyOGMxQk9HSEk4eUZrVW85S2VkVHVtaFlQ?=
 =?utf-8?B?SlpITURtWWU0c0FTQ3BOeUQ0ODVKZklod3VTbTJsMU5zVjdCdG9zVXVSRk5D?=
 =?utf-8?B?Q3YxZEJnMWx2ei9rdE9RRXpZeVFvTUtwTy9QME5IMTN5czNCZmlSWkFTeFJ3?=
 =?utf-8?B?Yng5aHRMbDFMS05DbHNRZTRhZ0t2RGl3UDBRK2xqN1NUVlhDZEd4SFp3eUJn?=
 =?utf-8?B?clFhc2p2d0IzSzVvbWdlL2ZtU2xjN1d0bmxlUC9ob2x3R0VWelUyNzgwVEcy?=
 =?utf-8?B?MUN1N0pFSVpGSDA5SXlqYUlJb3BNK2N4bEhDdG04cUJVRXFlVEtUSDlHOVg0?=
 =?utf-8?B?L1ZlR29ILzVIaEQzODV5cVRKM2FVbVExY0dhcTVORXMvWEQwYS93TWM2aGpk?=
 =?utf-8?B?M0J5dmRjU0lkZXducXR0THdYNXU5SlZQZzJGeStjaFpsY0NncHd1RnU2dlF6?=
 =?utf-8?B?NURFQ3ExOFduRFlITTA1U2NJMXF5c3hpQnM2bzM5K2ZZOGVIMXo3NDUzOGJZ?=
 =?utf-8?B?UjkzKzdqK2RLYkVpZHEyQjUyaFhaR1FzS1dLOVZhMHRMTEIzTGdPVUN4dTJi?=
 =?utf-8?B?eTJZY1cxQXc3bDg3dUU4d3NxWEkzT0ZwM29ueTFnMjJuNjgwckZmZzl4a09V?=
 =?utf-8?B?WnRiTmdsQWIxc3ljRkNha0ZJeW5wTW9FRXJPS0J5R2ZGNStvVmRZYU95NDJT?=
 =?utf-8?B?RmpSdVo5K0NycmZKdjROcE93bDhCTXNsa2NhZ0hLMXVVSXFGT1VrNFV6VFhT?=
 =?utf-8?B?MmllaTZMVmJHMko2OWJZaEFuK1VvQVFwMFdXZ2JSajRreHZDdEhhZDEzeTZx?=
 =?utf-8?B?SWlxb2JMWDlhR1Rpa2Ntbzl5V2FJSVMxdWg4TkF5L05xQmNLV3YwSVorWHI4?=
 =?utf-8?B?VWtScENqVFdmUGxvUWdGdWVvWmI1dzJxUEtVRjNqZTB2bFV3Z09SZ1dLTEM2?=
 =?utf-8?B?TWNIeGdpTWZHdnBPWjl6ZmlkcHZpM3ZXaC9BM0hWblN0bzRLTmVabjIrSEls?=
 =?utf-8?B?cmFuV0pGVXRZOWVaVzBaMHJUa0gycXNmejFsT2lpSDg5SUtLNFA0UmNDbFdL?=
 =?utf-8?B?Z1RaVUVGcjFVUHVYN3ZRZmVTSTZvNG9nU0ZYeUNjS09lQS9icytJdm03Znhu?=
 =?utf-8?B?RnhDYVhFRWRVZ2dhRkgvMENBSUY2dHpmVEE4OU9VU2VzZ0JuWHdnMUN3SkQw?=
 =?utf-8?B?MVlUWWNVWFpoeXlGQ2dvc1ZhMnUyUmE2WmF5OHFqa1loT2o0K01vNXZyQWoz?=
 =?utf-8?B?SnkzR2VOWlZpTHpCZUVqTmVmM0toWHhOQTdmOHEyL0dZQmVsbWQ5S0JOc09Y?=
 =?utf-8?B?Nk9HekdrZjdZWWFOTE8vYUZLYkV5QUhwaTdzTytnckthWWlpeTdaRTFneXN1?=
 =?utf-8?B?UnFxeDFLa080M3IzVnFjQ2Vha3AyLzRSenZaZ0pvL3FVdWNyandYSldXK1JJ?=
 =?utf-8?B?RG4yeXVhZ3ducnlnMUZYcE9CZlRkQS9pMTFFSi8zVjhLSDhCTU5LUjkxU3Nn?=
 =?utf-8?B?ZFFIS0xNZzl4NkJsNU9zZHBaajl2dHhjcUZLODdLWU1aYXkwN3QyOFBxREZX?=
 =?utf-8?B?dnlyempqcGE1N0N3T2dSS0Rjc3A4NVRQMXhzblRSTXkvUXBZcHk0VXI4WDlq?=
 =?utf-8?B?K3FNNFlkZWhmd2NyTTk2YTJDUjdHaXN3ZU80Tk95RzI1S3REUjIvbmVZL1lL?=
 =?utf-8?B?dmU0aDlSbWZMdllScXUzMEZwS2MwM1lITlEvK1grWldXR2QyNUFKa2M0aUQx?=
 =?utf-8?B?Zkx4dmxnOE9abEc5NTN1V0lHZWZvUHF6YUQ1OGtBbTVmRHlRTVlYT1NFcnlx?=
 =?utf-8?B?dlJFWnBJUE5UekN1TzJ2aUxVSndqVDJ4WExYQ3d2L0NMSWZRMWw2R2x4dUlx?=
 =?utf-8?B?eW9ESFpjcVhROVFFNDNTYml3bTI1d1A4eitSbkxPa3E1U3BIL1Y3Uit2VFlD?=
 =?utf-8?B?RHB6Z05qeElnNWQyQWZ0UDcwVXlNUnUxUWUvSnd5dFIzS0xWZi81RkJKRHk2?=
 =?utf-8?B?aXFuZjF6dW4wNGxRZXZzczY0Vjc1bEtFR2V2MDREcG9wNFpKem9xZ2VSd0ZR?=
 =?utf-8?B?UkN0UUYvYnJtRktESzBvTnlmQzZ1OGxGNm5GU2tMMWw1MjRzRlY3OFBXRXdz?=
 =?utf-8?B?QlB0WTZQN3lsQWQvdjRWaVpRem5CUm8zd05iMlE5NkNXK25hNENGVCs1UTJK?=
 =?utf-8?B?WnV5WCtjK3RURVVyNTNIQVlMRGtKY1Zpbk5MM1BDNFhvUlZCT2xhdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d0d09f-874b-4edb-8662-08de48553a08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:21.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Grli1xopudC0cEn1t/X4NvW6jugZnkZsygg1PrWpK6n7iutivWNxEHq/OXjxMRhW0GeEY9q5iN+1VmuzWIKs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreaddepth
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..cdc7631f2e159bdaa6829ba5a3b5695dc1c31423 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,77 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	u32 elem_size = sizeof(struct clk_spread_spectrum);
+	struct clk_spread_spectrum *sscs;
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
+		goto free_sscs;
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
+				goto free_sscs;
+		}
+
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			goto free_sscs;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get clock %d for %pOF\n",
+					index, node);
+			rc = PTR_ERR(clk);
+			goto free_sscs;
+		}
+
+		hw = __clk_get_hw(clk);
+		rc = clk_hw_set_spread_spectrum(hw, conf);
+		if (rc < 0) {
+			pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+			       __clk_get_name(clk), conf->modfreq_hz, conf->spread_bp,
+			       conf->method, rc);
+			/* Do not fail */
+			rc = 0;
+		}
+		clk_put(clk);
+	}
+
+free_sscs:
+	kfree(sscs);
+	return rc;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +245,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
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

