Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3435976;
	Fri, 24 Jan 2025 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724761; cv=fail; b=GC9MCoCInWZuy0poI5DsYuOIl1eZOLr2sOKl6W2Vziuw+7hjrJUCvthUslgWKEVHekB0BYYkWeUucSS3Dp+Weuufu7rwO+i7C5brNFtV6Gxap0pkOPX7y7ScuKE5MgExWHnXRe3hGs/0ayYzmb4/FCXLcN6HpU/qchfhOeaJtwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724761; c=relaxed/simple;
	bh=FJPUydQGVuqsraTh4jP0BAF2LuPWVhcfrXT13552p2g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BxVWbBBUNbN3G65TpKi9dMLx6D7Hz8V4uzJHm9rh/7ddQGUYpy15KhYvbturMHWDuKrKKYSNjH7Ofcem/6XT5RG/pcU630fDoqKSVp3gUE18GR6yfSb7GDmDfj4auOjot/6ntsBrr8PJ+FpIA90coJQ+Ik0AP6QjJEDr7AZAY7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qk9+kpvM; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qk9+kpvM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNRgKmrmYlGR8QGKa9EMdUciYWOIOcaEGw3xh+WkKRHtKkes3oH2VmlyU/yjneaodWhBU1EZ997hc6BfSxqB0hAqJBnPBfTf65JRHQTY26robFFDRs9i6lgzBnlV1wIWZh0txCkA5ALyS3qfeqJQgtZG3H5zawLpGX8da3TMsnovPI/5ECYnBod0EKBup+qTer9/BNvwCsaVCKjVPHyyNGhJxi88mZ5T+jlEjlzaGmNwYNdb2HwCnvF6HAKwc2ABmJsFTdmKdmXijVTIb3ODF1D/hVduJOv5XbVggL1GicF1rjsI9L8W2vfxZPPzykP2JeqNF3g9+qdgL0g+tfM15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ePnyDdKyIs8yCcON+kQ6iffv5+zA00+HvqYWQRtRm0=;
 b=OsfMaURFSLJstSWbg9enHS5gMzGCc80nKNNpVKjFbMPK2a1b7XGsfn4olgrrv6vk3Svttflha9k8RRJfi7/7Z58jUu0PgMfX/M0aBI0J3EQq8Zh6Wcm6ZLSscJN6igyIzomoCfLO7uedeCvbp+blEkaej6WtfZVAqMppgggYkQn0K+/7jmiuaUWWVSr5xAOhFqHbxiQkqy8SsJmIO6NUQKz7Afb7el/H3zQT5DKn1UCXi8/OIXt3qDWmxeO/pBBTTjhkqfYTQu1x1BZchVXiVHmpywQI2raBqI0VIO3Y+8gU9Mv7mGAXHIE7qxgB0tJk7RMlsYaLzTRWEOuRIwaLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ePnyDdKyIs8yCcON+kQ6iffv5+zA00+HvqYWQRtRm0=;
 b=Qk9+kpvMsGQEL57+357I8Eh0JFKf4GA/gVPDNF3nJhzRlWZKWd00xlbd8jXAAtj8i+Y37i82/A7nmFFiD30HKsyEH2P8vrO87ZS+uO4c+13sTuYnhSYE4FlfVmXz3wzxyYbEuV7E3rtpWPoiJZ3deDS+bM33HFYiceZ5/n924SdeY1OQYcnA4nEpxg8E8WUWVfR/Vw2h2wFluvxyLSBeXPZblJ3zAPSENZj+MK3pspQ9EEmR+51/wNEolpH5BHPSY+O4uSxpNPJxbbYdHd+ohQWxQyyQpxZM1240grg8pFLfeXC1teIvOy/CE8PsTypqIcyaI/xdxwaSy4EmgLPmhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 13:19:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:19:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jan 2025 22:25:18 +0800
Subject: [PATCH 2/3] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-clk-ssc-v1-2-2d39f6baf2af@nxp.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
In-Reply-To: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB10007:EE_
X-MS-Office365-Filtering-Correlation-Id: 31680041-489c-41b5-7699-08dd3c79b240
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3pVRCtUeFRNRWhvRVNvWVVLZ3BOTS9mN3ZqNjhBZU9ER3ZEek9OQXZsRDQ3?=
 =?utf-8?B?aWNkWDNIYnFVSnJDM1h1TzVWMHoxUVhrYi9BcDNKajNXQXh0SG5DYkJ1NEJs?=
 =?utf-8?B?a0FHYVpqdFBPU0lZRjE2OUo2Nm9QNWVpWU9KWFJjQWNCaUFSRW9QNHpJbG9M?=
 =?utf-8?B?R0lySDE4R0pMTlh5WVEzVVZPZVVqL2RZYWZYa2h6UGxzSk1QbG9kRzdoMmFm?=
 =?utf-8?B?QXd0SlYrUmRPdE1KSXhqYXJQdmorMllPdk5FbTdBeGo1UXY5U044Ym05SWZy?=
 =?utf-8?B?a0VXUWtBa1pmTy8xRUNJSXlwS1pQdGRXR1pHMVdOU2lEcm4zOUZPcTdBMXg1?=
 =?utf-8?B?YmpWWUR4VE9ETXA3cy9QRzZSbFBlV0V5bURHTDN0WVJRdkYzZlpVSXVTZmNQ?=
 =?utf-8?B?WDBvS2xhM1NNQXlndGxUNS8zRUR3aENyMzNoc0dLSmlKNEt4WEIxcFNMRGp4?=
 =?utf-8?B?d0FqSXVUcXV5TDRnc3cyV2RWMnU4RlR1THR0UTZGWGVJZ2hsbmNTZ0VkMGo4?=
 =?utf-8?B?Y2JNeVl4ZUdNeXRmTnA0YTZVYkxWVkZDejBqaGpRSWR0anc2aDRzR1JWQk5m?=
 =?utf-8?B?UDFIVWlPbjdSR1pDK3FXM05HM0YxMmw2bGhWaEw3MGJiV3NKUTNnTlNnc0Fy?=
 =?utf-8?B?TVRJSHV2NlNidFBjYldVamtxa2oxb3NDT2lycHF1MkNBYWVoZnE1UUp6Mm1j?=
 =?utf-8?B?eGl1Ri9GMWl5L2ROR0txUitzV2duKzVWdzZvOUFyaFJwMTkxK09MM3N5SDZk?=
 =?utf-8?B?SzJxWEV6SlY3Zjc1MzJVcVNZVkRDSnF0SXFPaWFmbnpPZ3lJWDN6WWRiZmV2?=
 =?utf-8?B?RUZVak1TMittMS9KNzRDa3dWQ0dsVHlXM3NWY1lzNmtKVWdzMVl4UE8wajUz?=
 =?utf-8?B?NUpXVDh6RnZKTnllWW1tbzN4UEx0cXB3WHJYaFhwSlhQNkt6cVdMeG10RDEw?=
 =?utf-8?B?LzJvWXFCSVBmaXpBWllJNDdPNlo1TjdKK1pzVFpVNjZ2ZHZKaW5iL05FcmV4?=
 =?utf-8?B?Z3YvTlZpRWx1T0lBMWVoVnU2RURicW5SZHc3TmFneENUUU9SOG9YSHB1N0RS?=
 =?utf-8?B?N3NVVFdLeDZneXRzeU92eThlRFZZUzEzRjJ3N3FnbjE0ajVBNUorOFJubzdY?=
 =?utf-8?B?dnhYZkwrMUJ1aktEN1BpaUpoMkxsTEIvb1JWM0hnMjFOZ1ZkS2ZhRFlkNml2?=
 =?utf-8?B?M1ZQSmFseTBwanBUUXIzV3JyeldzTW1OaWpNRVErMFpXYUtGVTBPenczb2xB?=
 =?utf-8?B?VHYxWXNURS94ZnRRbHBybS9zWmE2WVhKQTdra3o0WG5KNUhIVytGeW9PL3Zt?=
 =?utf-8?B?dmNOWjNUOWh0QnJYT0N2SWZhWFd6a2d4dEdFYldSbWJhZTBjK0Q0R3ovVHJZ?=
 =?utf-8?B?cWM4VkJrRTM5UGdoZmordndoSmNzNGpRWm14cytVVDZQakhWbng5dmNkelVL?=
 =?utf-8?B?dC92a1FuMlZNOWxKNTQvZGJ1Tm1EdHFLeEtDRHJReTljeGJDMWY1b2syczIr?=
 =?utf-8?B?Y2FiYmN2d1NaTnFvQWMyQ0NiUTBIWHpGZ0NCN0t6RHp3R0g1T1IveVJpcitF?=
 =?utf-8?B?emxPQzFJWlNZTFd1dUlNa2U5clhpZmlPTGYveHRLR3F3bVJXdkJITjJxQ0FO?=
 =?utf-8?B?aEpQdXJzVjFFR1U1YVhHNElvaFBpNnc2ZXJuVmRhUkhHK2lqVEVHVHFKSHRi?=
 =?utf-8?B?dGJMamozVmhoRWQyQ3kzWUowTDJpUVBzbG14RmozSlBGUTlzOE95VmNTd0gx?=
 =?utf-8?B?czBSNkFwdWdrZHU4ckEySUorVGMzWXEvRlliL3B4bVR6eklCT2hWMDlGbFY1?=
 =?utf-8?B?aFU5ZU5QWDdHRVR0RFJ3NE94SEdlZGNSRkJ3QlZ1TzNuOFlpZTNnK3UvRy9p?=
 =?utf-8?B?a1p3M0huVkcrYU92dWNZQmQreU0xU3Fxb0FDQ0tSK1piS2U3WUtrWHA5cnZJ?=
 =?utf-8?Q?OLtkxLa9ERsrydEG8oDTULORL0iYfFf2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2pZWDdQQWJIY0VJa1c0MTZCWnJJQnUzRnlyci9PZ1VPMkRZMEhZWmpiTE1i?=
 =?utf-8?B?RG9jWG1OdXJZOHNPNlRQbkc2dWR1bmJSLzQ4bTFXVnRLdEx4MVRvaFhrTklz?=
 =?utf-8?B?WFpBelk1b25tRTczajNrQkJIemtsb050SkdIcGd6bHpGemIwTWZlVmxTQTNY?=
 =?utf-8?B?UnFiZ0k1V1praFVpSjZlU1F3MFZZdVdSR1pxQUtJU0E1bndyZFJTWC85T1lF?=
 =?utf-8?B?Z1FNaEtoUFRsOSt6L2JaS2J0bkdKc1dOenFxY0pPeENjcFlROVBWV2lUZDJE?=
 =?utf-8?B?N3NZOVREL3h3WFFSTVNLT0s5dGhJYUEzNjRxMngyTFB0WitOQzkyQlEyb2Rw?=
 =?utf-8?B?cDg0a2RFell3RGp6NEkySnEzc1hyMnh4WXRjb0ZoTXhnajV4bXhWeW5lNVBI?=
 =?utf-8?B?a2FwN0MxVmI3Y25WYWJTZ3YvTkZVUzYzYVE0RlNBdFRlR0M0dDRyR2RiWkF6?=
 =?utf-8?B?MG1LRi9JOEo2RXFteHdTa3RwSkpJYjhZQ0l1aFdmRUtMRnhPVGxEandJUWRK?=
 =?utf-8?B?MXBLYzFOaldHdHplQTltOGIzVlN5aDlFK01Kd0lLQ012SnlkZEFKL2tQeFQr?=
 =?utf-8?B?bUd4RTk0Vk9Gc1czanJnTFFiL0xZZHljR2hMZHRUaEdsT2Y2K0F1M214bE1O?=
 =?utf-8?B?SUozc01nWVphQzNRTlBWQm96aWtFVzdnLzJ0SVI3aTdZRG9vZlpUTGhaVEpC?=
 =?utf-8?B?ZFNqUEduc2hMMXk1V2c3ajJueWh5b1JDQmlFS1dvL2RTb0Nxb3c0NHozVlcv?=
 =?utf-8?B?WkR3V3g1dU91d2FmMUxOTEhNdDA2Y2t6czRLbGxWYmlOQ1NpZndLcVZSWDF0?=
 =?utf-8?B?R2pFcTNMWmliYmFINHhocDcwdnFWYjVEek1CVTVnVm5MclJ6bXFHVXZ5b29D?=
 =?utf-8?B?OHYvRzh2eWFxRTlwT2dML3cvWHl4Q0sxdUJQS2ZzWFJYcnRmU1RRMTNHY2JO?=
 =?utf-8?B?WEl2Q0Q2bHExWjZIb2F2d3QreDVKaUoxWWJLNmRSUkNnRUJENnVXbWxMb0VN?=
 =?utf-8?B?cHByK0Fmc0NXS05Qei84dzhZUUF4V0p1ajh4dlJTUjFveDdIVkd0KzJJTG9U?=
 =?utf-8?B?VU1GMjF1d3I2TzNYQUY5SG9JOE1RWjNRRHRzV2llbVJPNG5QZGtoc2puUTQz?=
 =?utf-8?B?R3FnR2hPcjA2azZnTzNqNzJQQ0F6Q1B3RHBtUHRuUWN5ZEpwdGhBcld6TE5N?=
 =?utf-8?B?aVhPUExVTVhsWURybTRZaTVDRnorV052V0puZEs3b0ZZcWdZWnp2dm9LR2Vj?=
 =?utf-8?B?SDducVQ1VitTN05iT2lIVUFwdlNmalBUT0tLcWorRGlWTnFCTDFIbUlWb2VW?=
 =?utf-8?B?SDhYdERDNThHY00wTXNMYmE4YjVKaGhXYkw0b1F6N2JQMGdRVFkyUStURStK?=
 =?utf-8?B?MVIyS1NJMDRENGxyWjh1TlhzNVRVbFB2Nm9odTlPM2d3TGZSY0Z6MnBYYUhm?=
 =?utf-8?B?dEZxRVhRdzJKSmJXb2M4NmREZXJiajF4WkluR1pIYVBnaFJBeFQ2WkpLcCtj?=
 =?utf-8?B?U1EvTVZnd0E3bU8xUDBFNFc3anlkQ1I2YzdFa01yYWJheVpNYk1wejRvSzdz?=
 =?utf-8?B?OUJkN3VhR2Z6cHljYmZGbFEvcmV6NmZZeWZjelY2cVhYU2ZOZkI1M1hxdTha?=
 =?utf-8?B?UEF4Z1FqUzd5R01OYm9sUTZHdG9FNGtTYVRuenF1bTNrdWpEcUFDN2t1czFz?=
 =?utf-8?B?TFAvSFFBN0lyM3JGMjlOOXJPRTJsQ3FLV1dXVFlyakhxZEpFNWhCRWdLZ3J4?=
 =?utf-8?B?aUIyRjRtZFQxNWg3Rzl1SXJ0eFRSNTZCS2VKbGcremt4eDlxZDBhQ2d3ZzhO?=
 =?utf-8?B?U1V4MjAzWndIcjl3Z0F3T0JnN1pzeG1VdW96VXg0SkQ2Nk84RGtYNWtLRElC?=
 =?utf-8?B?UHRuWjBBK3pIUlB0MTdBZ21RZEx5TE1xRzVRdnoxVFNiRE51WSttcGlBckRB?=
 =?utf-8?B?V2dEc0FOWnMyaFRuTkdtL2pGNndBVEM3ZnNzcUlNd1JmdWdyd210QzV2amRH?=
 =?utf-8?B?WnJJZ3F5Wk9JTTd6blVzRTArdDVUeTZOLzhnbE0xWEJrT0szVURoTjRrcFVU?=
 =?utf-8?B?Z0lVb2FVQUlXK0I5OWpjY3lVbU5kbGtOMVpnYjR0Q2ExR0tnVDYzdk9halkx?=
 =?utf-8?Q?Pw/EyOCNKWbNWR9ckTi/DuGC5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31680041-489c-41b5-7699-08dd3c79b240
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 13:19:13.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE3GiPDH7+/OQJWbpvJ2dvW5KPlZP2m78Mk83T82QbQXbwEaFRnOmHHyHae8luvDBI1GzEqP0rDrzVG1szU1Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreadpercent
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..1ca4222caa829223d65dd37c7a776d43dc421944 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,70 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	u32 *sscs __free(kfree) = NULL;
+	u32 elem_size = sizeof(u32) * 3;
+	struct of_phandle_args clkspec;
+	int rc, count, index;
+	struct clk *clk;
+
+	/* modfreq, spreadPercent, modmethod */
+	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
+	if (count > 0) {
+		sscs = kcalloc(count, elem_size, GFP_KERNEL);
+		if (!sscs)
+			return -ENOMEM;
+		rc = of_property_read_u32_array(node,
+						"assigned-clock-sscs",
+						sscs, count * 3);
+	} else {
+		return 0;
+	}
+
+	if (rc)
+		return rc;
+
+	for (index = 0; index < count; index++) {
+		u32 modfreq = sscs[index * 3], spreadpercent = sscs[index * 3 + 1];
+		u32 method = sscs[index * 3 + 2];
+
+		if (modfreq || spreadpercent || method) {
+			rc = of_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells",	index, &clkspec);
+			if (rc < 0) {
+				/* skip empty (null) phandles */
+				if (rc == -ENOENT)
+					continue;
+				else
+					return rc;
+			}
+
+			if (clkspec.np == node && !clk_supplier) {
+				of_node_put(clkspec.np);
+				return 0;
+			}
+
+			clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(clk)) {
+				if (PTR_ERR(clk) != -EPROBE_DEFER)
+					pr_warn("clk: couldn't get clock %d for %pOF\n",
+						index, node);
+				return PTR_ERR(clk);
+			}
+
+			rc = clk_set_spread_spectrum(clk, modfreq, spreadpercent, method, true);
+			if (rc < 0)
+				pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+				       __clk_get_name(clk), modfreq, spreadpercent, method, rc);
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +238,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
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
2.35.3

