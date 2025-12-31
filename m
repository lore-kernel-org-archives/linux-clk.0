Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AF5319877;
	Wed, 31 Dec 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176001; cv=fail; b=E7KpG1650j2qDOP8EiI6/C0Gj37W5CoNQL3FLHR3iemiSIVtxkvRsuVeZc8gxdrUD+a+u9o92St9/9yF9HI7WskBBM4XzOD/q8I6chyIl2Bzgi6Dg3YAbNtwIrFvjYEG/t22kj6MFd5Pz1MwNYo5qQhaF+NzMX+2MUxDzglxoz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176001; c=relaxed/simple;
	bh=lgaR21B2sfsCE6+WhqwWwYa6G4rUIWIRXKfZ4XloOqs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fRPYV2Pydy5uZ+xNzNDdO0oPsPOeLvEcaXbc923d3WTUp+/cFcNr096TVL0jXVPh6mp1v7QzQohrL1lqnASpMN89tTcSyIRon78M6n/qYv2Gs159W4tZtiYyZyNBpFnTnSrOXv30kt1mYY+mAKmn7dQYAaVyH19rEvCAH+D4zhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rKxruTlr; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rKxruTlr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyAdhbolXQ0PRhJda7iuVB8A+sVtSCOfFoDGCp78zddf5bq0cXHM5N8kFea9qUPJVwrpLXum1mpvW9RUGf+N0/wPpnS/tKdwxn1Ax7XKZSnc+cWoyjC7Z7P/0QVSA/3XaK95IboXeO8OtJupWAELBrsYWGsUHMM+cPlzd/Q5fN1typTBFxGWyPiNbKG6PtpQX6X6pnAMDgmkJJ27qs9jngLU2CJkBby5YVJ5OcnJJqhS+yFt5Qf1ZG9MCNJ4hP4BdnjotCP8Q3Zc5t9fi9M7EAoeDLF8VswlEePOjYJaRk+Fmv/9/eXje/hd+Rf/+RWUGrlyAdgkUB1AcE9K3KQLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLXwjhT1buC4cRAEMZseqnpoy0m5N6bcOJQ49doNP+I=;
 b=ONtezDt4LI94r9v3ps4TBW7t6NZv9QG6yb1QnMDsYoGMJsmvYMlaVWOoWozakcF3Cjryys9h9sYbSUoCTA9fMKkGD9Eg8WSvBXkmBcYoZCFLGi/hqFgHGyWySf7qCc6LN/wus9R3/ghawTh2Dg3Ajn1kqubHdSq0uWFVeEgiDA+RHLN0EDTfgcy9B+L1+Q1x1NocJ39YbjbnwkY7lL0OCdnl7z0HzJ1saadiFRueSLJQi3kCrjgZ/LHgqnS0XZblFiC3+wicryYmpMU3tixm8HtzahEnII9f7RUpP/UXrIUPnfZB5YS0E1RVauVQgfh4i6IVoxgrGKeuY8xTOVCtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLXwjhT1buC4cRAEMZseqnpoy0m5N6bcOJQ49doNP+I=;
 b=rKxruTlryOLOrIHHOwqsyh8E9uyRwPxooJaqvI++WspsjqKfhg0gPnxTM5L06d7p91upV8ZyYHn2kTMZ8kkRA6M5lvqMCc+iNcNWnyy6UGcKj9PVifaZYImH6X0ji6v3nGABJKe/zgZTWuwALBCwNbbpJ7Clcijoi399kIIK3z4T6N5832znOv9+DGEbPoD032KbtuF43s4A34hnN30QUOEJQtTOPpEEk85gRa3JJ7VlaVCQ9KevCKyneKDiOGU8mKxWI/LNMdvRhyEXTmjLr0a6krICJjSlypwoP/k55bNLvvSGSl+DvAgPlmnJMLTFZt4dHR3XRtTRYVlFs4jmzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:49 +0800
Subject: [PATCH v7 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-2-380e8b58f9e3@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0aa093d1-24f4-4198-14c2-08de48553787
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akIzVDg1RUd3VitOZS9lQVZvMWtZZ0xMUFBiK1FkMnM1a3RjdXdTMDBQR0kz?=
 =?utf-8?B?UEE0Q2FROXJwN09vQ2dsNjdJU2hQcWNGMEZDM2hRQ2RDRGN0SDBsY0l3WWM3?=
 =?utf-8?B?SGRBOVg0dnAyT29RdHk4a1VMdk1lRXRwcWExYWkwYUVVK1NFeDg4M1lEckZo?=
 =?utf-8?B?TmtNOVdWSk5MKzZoYy90RmgxR3NxV3NOWjdHR2w0NEdrVllMeXpaVlIyYVNR?=
 =?utf-8?B?Ty9vRTkvZE94enN4MUFremg2UE10dmtuNEZkMEgrT0Q5U2NZSEtoYzNPNkxN?=
 =?utf-8?B?RGRrRnkxTWdsa254NTlrQzRFUXZmOExOTE9vN2NZaHR6WmljKzR1RjRheEtP?=
 =?utf-8?B?dHF2eXk1eHloQk84elg3c3lmaEhWb1lFTjZLZUhDOEZKSUlTSzN4SkRsTXYr?=
 =?utf-8?B?VUpVU05wb202M0xIMlVyeTNFc0NXZmloWWpuQVdrSnRZQkgrdCtRd3EzSWhG?=
 =?utf-8?B?UzJMbXVYYVEwRHFaUHYrcGtYb1hMSGFDRjZ2bGd0N0hMcjhRcHZRMjJtbHky?=
 =?utf-8?B?VkpxdG9aaGlnZk1QaTNTWjdFQ25XdEMxd0xwY3ZvWkxnUXMrL01pTWRqY1BX?=
 =?utf-8?B?UjJUU3dMM2loZVJ5WFRqcHBCVmNwVEtManE3NVg5NHhvN2l0ZTZqZ3d3aXBS?=
 =?utf-8?B?b3gra0JWNE50N1IzNms2WEZVS2JyZUE0emMvU0Y3YU9ZRTg4OGQwNXNQcEcw?=
 =?utf-8?B?VXlzbENaSVZmcFIrWkFvekJ1a2IwdkdGOWh3a0U4bjM3Ui9GKzFuYzJGSlVr?=
 =?utf-8?B?ODRzemcyZmZXMnNxeGVyTWZtM1FSUGlwTm9pVkFRL0tIWS91UDNBZjROWXNo?=
 =?utf-8?B?Z2dVQzdJeTVRMTJFdk4yT1VaeThKVk9iRFF2SnpUbVVDTjMwaG1rMTFtNVVX?=
 =?utf-8?B?d2FocDU4Z3c1LzU1YmVBdGpNRjQ0Q0o5SzU3c2U3S2MxTE5EeFg2ditkUHU4?=
 =?utf-8?B?U1BWcnE4M3AyM3NUNzRCS2dWdlFGNEpaRHVEU0w2YkZBTWh3ZkYyUDVTRm9a?=
 =?utf-8?B?Snl3RjZrSVNhZGhqbW5GNEl6aHhzSmdUbmo0em51YzhOV203MWhiT1NDYnNh?=
 =?utf-8?B?U2hsRUxCQnBzeFF4VUY4dXFoRVQvdmZvT0w1dEhKMFBrUytKcyswNDhTZUc1?=
 =?utf-8?B?azFUOHp2c2hPYys2dC9qbWlnc1BWWUxUMHdYd21tVkt0Yld4d3dkZHcxakM3?=
 =?utf-8?B?dERCTXBmRTBLYmhpMlNvUHcrN0NNT2F3eHRSM1F6K2pSaGFDVjdVZy8vZkph?=
 =?utf-8?B?c3ZhcExBM1JPRmtPT2NYMTc4Y1Y1MVFKSUlvTVJISHE3ZzFvTndJa3c1RDQx?=
 =?utf-8?B?WXlnbU9EdmZydkh5aHBwRmp5YU13Qnlja2ZCRlEyZ2N5M2JmZjZrYlNyYWRz?=
 =?utf-8?B?cE9ybmk0NFBveXdkcC9PT0wvbEIvR1F3bmtVT0NDTFpGR1dLYWJQeGRJbERT?=
 =?utf-8?B?TXFwSEk0MUk1elkwSjhXRGp4MDhsZ2YzNERrT0dBblJlOThzeEJMdThCYlFk?=
 =?utf-8?B?N0Rtam1Ucm56TVJZaXBHQVBaNjZ4R2J3WDlQN1B2S0UvcGxtNFJNaUdnZWxS?=
 =?utf-8?B?WS82b2o5OFVIY04zcVd1V3VjSjlja3Axa1ZYK2pHa25EY2VOeGtVNnJsMlVt?=
 =?utf-8?B?clBvcHpoY0xQQ0hsQ0k0NWFtNDdjaUpCM2lSMGt6OGtlc25tR0hHemE1MkdN?=
 =?utf-8?B?SFBjUmtwKzUxbWNZL2F3K3FvYTRhak83eDVVVWFOWDNzMkdxUXNBL3BMb2R3?=
 =?utf-8?B?a1Bsb0srcjFCaDE1NW5rQVJvM2ZYTGVrcHZiQndjUXZWRE9GcGNBOWJnYXRw?=
 =?utf-8?B?b0FLRHh5NDhaQkRBTW52V1dLd1hLaGl5L29DWjhFcDBrZFQ3QTd2QnZOMWhU?=
 =?utf-8?B?blVybkNKeDBGQ3JRNTFBakd2SGdFKytUNnRIdVBEcExSN1htb0tuOWhkNWQx?=
 =?utf-8?B?c0srQnp6N2UzNzJma3hVNzBQcXdsVThJeUdCNytiTnBucnN5bG1sUW9JUTAw?=
 =?utf-8?B?V3ROU2txam5OYWtoeVZ3TFIyMGlwRDRCSE5vWVFpejNhQWg1Qi8rNXBKVnpB?=
 =?utf-8?Q?4i28Uk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWFMNXhUdmdVZ05pRmM4c0E4Z1hCYlZQS09VY3lINCszcEpnUTZhOXJMc2lC?=
 =?utf-8?B?TGJxNWNOa3gxMElwbXhWcUgxZzFnR3ZxY1RoM0hzNCtubDhVelRDbTAxd3k4?=
 =?utf-8?B?NHpCeFowUzY5a3lJWXlQUzNPaHYzS0V0UXpNdHlncDNqbEZZRkxBMm1DYW9l?=
 =?utf-8?B?WFhiWi82NXRXTUhTTnVxb2ZrTlNoU2tiZnJGVWgrUGJyd2Zyay9jRDJpWkpS?=
 =?utf-8?B?b0pFQ25LaDVnMW8vZXFZZGk0Yi91TDh2Z0R5ek03OUFENEsycnBxb2tTbzhY?=
 =?utf-8?B?WVp4V0VqNGNUMnlLSEVnanNidXpHcGNCTS9zOCtxMU5GbkpZVW1zUkx6V3Rq?=
 =?utf-8?B?N2NrTnN0UC9MRFpzMEcwZDFZajZCL05oZTFGT3hFeGtRTWFTY1k0NjZ0eFgy?=
 =?utf-8?B?Tk5yUVZuWmNpazJueGFPOUk0Y25lVmNZNkxSWkZUallNejkzMkowNlJUYlNk?=
 =?utf-8?B?NXZhKzdpNTRQcHhLa3pNd0kxeUlvMVhYOERISEpRVlhVT1czUUpvcTFMWUx4?=
 =?utf-8?B?b0lzOTRhNGR0WWJUNTMxbVVFbUFZYUhtK2FMK1k5Zlo0eDlFdjVBQmZ2ZDdk?=
 =?utf-8?B?Z0N3Yk9hNFFDVGtpK043WEpObFNQM1NDWk5lWUVtRC91RDhpdXFnK05hSTFU?=
 =?utf-8?B?UlB1VndMZ3FIZUR5WkRYOThnQU5uV0NXQTdQd1hwOUMzcmk5a1kycEw5emJW?=
 =?utf-8?B?dTZqOFYwY1BKY1F5T0JvNTU3V0JpM3gxbXBTcTJSVm5uVnRkQVUvQkd5ekhN?=
 =?utf-8?B?TkdqMjF2TmJrQTczWThuR1cwVWFhNE9iN29ORkdEMHNXbHVFRnF6VDJGSjZ6?=
 =?utf-8?B?U3MybDJYMlhKc2kvWllSaTlXU3dySGgwM1huQTZNMnVZMnJJSDIvdmMzcjhW?=
 =?utf-8?B?TklReU5raG0zNVRTQk13T1FLUUJwcjNaNWdnMXIxMUtYUzNadC9tNUNvOG9h?=
 =?utf-8?B?b01wYWtCeTg2NmFiVDdWLy9NQmdoTXZQR0MrdHNwcEVDMEpFVVdGWFgrSHlu?=
 =?utf-8?B?KzJRTExiaWtxT3YvajFXRjdZandxekljc0tTKytxdHEvSW5QQ0FsUEVSbVI3?=
 =?utf-8?B?bkZ2MXFFRHpManNkSkFuSERCeFFNZ2VRdXNoajBRbVlNaDVCT1dwTmpURTFw?=
 =?utf-8?B?b0pMZlRVeC93ZE9lVUNvM000T2czRXVWbnVqSXZkcXB5cVRGWFd2WEUvZ21U?=
 =?utf-8?B?Y0gySHdkQUhCRkhPU3VOeFpHMC83QUJEUUYxMjhkblIwYnVRRzQrRHkrb2RR?=
 =?utf-8?B?Z3pkY0lXRWswa3ZOcTdkYks3VS9yeHNqRWIrSkRsUmdwN2JBdXpTWGVnWUM0?=
 =?utf-8?B?a3oyMXU5Q0VGNTExeUZrU1JJTkVnWEplQjd4WE1MTXBXS2pSc3JFSlVpSjN6?=
 =?utf-8?B?VkhNQ0lxYzRuejNKMnBVZFhPUEFud0UvNlhOamMrVzV6OXNPQk1FdDJMUHNB?=
 =?utf-8?B?TkRUWFVHZmpNMlEzT3MrRmFxWTZlN0NNYlJUOWVtOWFYNi9FWW83ZU1vTU9y?=
 =?utf-8?B?TU9TU3I3WUNIKzJRKzZqa0JUS0RBb01YR3ZtUEFyZGNBVGs3S3JVeUpCZ1NU?=
 =?utf-8?B?a1oxL1VUeGtCM3Z0M0pCT0lBckdpOGxnSmtrMlZUK0VhZEl6bEl1U3cxSkQw?=
 =?utf-8?B?c2pDY1BNQTFMdis3eU1PeW5wOUtyMm1HeXRQVG1vZWh4dThsakZoS1JHVERr?=
 =?utf-8?B?eDZIMG5ISjc1aCtpWHVGUU94dXlwQzkrVnp4VUxXdFppc0ZPRDRtRzdORml6?=
 =?utf-8?B?aUZOWSs5ZDBNUHpGSGM1Wi9od2ZmK2E1QUpsUHBtUlIxb3R4TmMweURweDdJ?=
 =?utf-8?B?MDZld3g1UFF2MUFVMEtYSitCeU4xRE9UQXZ4alphRXZpc0x1UlFVY3BsWEVY?=
 =?utf-8?B?SEh1N0JXeW4zYUhTOG1qOUVSR2hPbzRnbUJJWDh1Mk9kNUI4cFRWcmNjZnRn?=
 =?utf-8?B?Um1RR3AwWjgzck5WTk9CWEYrdlpDUlNvR0t4OGlndWpkc3lMMnJQRWtBME5R?=
 =?utf-8?B?U21Tc2lRVVNBT01QVU1yYmxHVnF0Z2RwV1dwT3FMNDdZa3VyOXFpVlNUN0ox?=
 =?utf-8?B?a3VpeEdHZU9LZlUzUFNOSFhKUFJUVVhsZytJWEE5M2V3c1lPUnJScWlOS2w3?=
 =?utf-8?B?c3dibFcrc1VVeGo5WHVtQVVPSVFwZzJ1OWpPeTlHSHU3ODZvUU1SQW1yUGdr?=
 =?utf-8?B?cmF2a0sxTEhEVE9uaEFWa1Z3S0p0YWxYTEd4b25GL3d0TkR5ZHlJc1J2dWho?=
 =?utf-8?B?d3BIaDhrR0RrVkNHMWhQK2lWSTl0Q3AxM2hEcTV5NVVKd3RtbWZvZW9LT1RS?=
 =?utf-8?B?K05RV1RWR2tYczcyNHZPeWE5NHdrck5URE9ZZkZVaCtBOUpIYXhpZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa093d1-24f4-4198-14c2-08de48553787
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:17.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoLV0uF8sqy3xSKx7XRtfvcG3axnHvMk32aWOHZN0A79jLKQP0D1GaollXdQN3JVAGqaGyij7e15TTqU7e6Y5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089

From: Peng Fan <peng.fan@nxp.com>

Add clk_hw_set_spread_spectrum to configure a clock to enable spread
spectrum feature. set_spread_spectrum ops is added for clk drivers to
have their own hardware specific implementation.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 27 +++++++++++++++++++++++++++
 include/linux/clk-provider.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..6cd941a729590b501d66101e352b99e51ca18464 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2784,6 +2784,33 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_core *core;
+	int ret;
+
+	if (!hw)
+		return 0;
+
+	core = hw->core;
+
+	clk_prepare_lock();
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(hw, ss_conf);
+
+	clk_pm_runtime_put(core);
+
+fail:
+	clk_prepare_unlock();
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..9ec25bbccd613eafd77aca080dd7f51b1bfdadc1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -84,6 +85,26 @@ struct clk_duty {
 	unsigned int den;
 };
 
+enum clk_ssc_method {
+	CLK_SPREAD_NO		= CLK_SSC_NO_SPREAD,
+	CLK_SPREAD_CENTER	= CLK_SSC_CENTER_SPREAD,
+	CLK_SPREAD_UP		= CLK_SSC_UP_SPREAD,
+	CLK_SPREAD_DOWN		= CLK_SSC_DOWN_SPREAD,
+};
+
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq_hz:		Modulation frequency
+ * @spread_bp:		Modulation percent in permyriad
+ * @method:		Modulation method
+ */
+struct clk_spread_spectrum {
+	u32 modfreq_hz;
+	u32 spread_bp;
+	enum clk_ssc_method method;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -178,6 +199,12 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Optional callback used to configure the spread
+ *		spectrum modulation frequency, percentage, and method
+ *		to reduce EMI by spreading the clock frequency over a
+ *		wider range.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -255,6 +282,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       const struct clk_spread_spectrum *ss_conf);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1430,6 +1459,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.37.1

