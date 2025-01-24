Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66F35962;
	Fri, 24 Jan 2025 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724752; cv=fail; b=FtdWcPOWpoUXD0XrEt4jVDA4/25V90bBVZ8UowGlMHeNPE3S8AEjS8sVFS1/JdV2WHXr5tz3IlWO7u9WBR/6cRBHczU1awAprbI0vPn9ET3zaS/oqd5Ly44ko8oTILaZAcVMfY3UVvrD3045IXrbokY/CMsKhs2/ECPd2GfqiCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724752; c=relaxed/simple;
	bh=c7vS15j68xK5P/4f4pfL73jV1V+RPuiJsZGgSbDHu38=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tw9UUPL6Z5aia+J/+FzbD57gwVuTQxYK8YOGgfATyzpbbi9scpHoc5zvoWy4yAayD/Y/u7yFyvYFEC2VGR2ADLZojSRGNJh4c1JVazpDXBLbnzdT+f/NgvWoByJILGWnc7d5/sK3h87sx58KVGCulxghsKi2q+HowVfcRthphMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y5SIqJ8J; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y5SIqJ8J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIs3oS/0sm/YHgmqfyS/i7Tq9WronnHimngWbbbe3371nfMWWy12L5OuE4cfpNfafJlqFOxILc2+xb8+qLlX/Qat/u7NoztzTV7bme6b1LzbKn4UzngcAFdV/2lcMmNrhSIAxdjgHVHWZVFQPen7irn6SMtpRJG0VPTt4dNdlf/E+Q+85dgu1wu8Up9UxaO0y6VaaiZuCHJWAZqafLPrx4rfMvp/EBfny/dQhVOacjVixo+VLWg3PoDlBhJFRS7fEGJHX2oxoFEHw9PpcmFQFkhwd5ij64KT+FVTBjob8LNOZIFKxQ480OXOK4tqcVO0ikiY+bcGOj3BHOMJ1nKZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye8sSfk9ofc/Dbnv+JnFLi9NmOa59ddc2EFp+ux2Uc0=;
 b=f6ueN7t6xEvV6MUbm2iTTmZoISy6B9+eFYGAKGV2BNjyE5wIEAdXPWf5gbrIgHqWkoZMJpPudP1XgfBq8+sVf36WdeoO6hWIMwWQvEpPROAKvoBqMxbPkMMNLUbC0p6OEByyww2Q/j9YUmwCkNR8GlIC1ht0sajYIfVsnXiT0s1Z6nakR5BNXsxGJXLWrRelmidaIFQT+znreaAQETS3ZgbwPuuXLhAQv2YS9Vw5W414/E2MromHLbSt8/FKAnOQd68sfyZhGC8Q9P1b+6LiaDA1jkTOwt/BqGr0C03uikKFLWW02G+sV5y+ZgSIWNagPK3elGHH1Sw/3KpB+4j4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye8sSfk9ofc/Dbnv+JnFLi9NmOa59ddc2EFp+ux2Uc0=;
 b=Y5SIqJ8JvzhVzWDFhwrGahLwQlPNVoMfRcWoBh+n4XjyKY194zGZwko/2D9mG8mSRwECbr0Q/9p1+0YXXFkD9taMEJZtEa4dM0kPgZJF7euKWRJK7jWjxokdQI1WyPs430WoLBi2pbnQwOzpGZYCobD3JvqUWO2xqQZFe2GreFX0+qKuUOxZEdyUWTZqaiUCMiRkOcr9ok0btg5M6GMI0ZKe4r8PpZ6IDSrZkqzG4nXsvJJDWNTBjL4B5P/bkGDiKsST/xMfG3OPFbaKSMqI3apC+U4ETv7rYlKEZiptHj7bpkSeqnV7UW7o21WsQ3uS9HAC7N0GlOpgLtYsjs4F9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 13:19:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:19:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jan 2025 22:25:17 +0800
Subject: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3523efe9-91db-4dff-b357-08dd3c79aed0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bE0yU1dWMnhzSGl4SElqMVBaWk90Y2RYZmJTTEN2b1YvQjNYdnpqZTJybWZy?=
 =?utf-8?B?bUo5WlY4OUJWL3NocjM5bU5vQWpwMncxSy9aN2RPcEZVenhnMzhVQjY1cFly?=
 =?utf-8?B?QjIzMnVXZHdtdElvbjQ1VHM3K1RPNzQ1aVBZbDI0Y2d4Q0lpb1ljM3I4cDZn?=
 =?utf-8?B?VnBIR2YzYXY5SEFOUnJ2MlI4dGdMNEVzRnI5NWVveFd6OXZidmo3Wm4wK2Nz?=
 =?utf-8?B?aGJMNnJHZ3JnTnNMb2VaT0hJVGJHUmpDckZrRXZJQzloeWJ2ZU96djhNVkN1?=
 =?utf-8?B?dW0zemhCcnQ1V0liRktTMDdDK0ZFRyt3YVZBTTF4cHBUOEd0bEhrVVVVRG1M?=
 =?utf-8?B?a3ZKL0R6ZDJhcEpKZ2lWcUJTZmY5dmgzcVQ1WlhKV2lXNW1FbVZYYnZhSStC?=
 =?utf-8?B?UmY4ZklKaVVWMDRrMXN3dkdvRjZXN0VJVFRZdTVvaEMxR2t5UzYwcG1xT0py?=
 =?utf-8?B?akl2c3QwcEI4MkhpVDBzbEQxZ2FvbnkySXpxK0dYM1orazhHcFNZNHR2MFJM?=
 =?utf-8?B?NWNBV0p0L0JJQ2NXMDV1L2JTV1RSQ0Jwa0V4Rnovb1RNVXVldWNYdUE5Ri9Z?=
 =?utf-8?B?NFI5QVN0MFBHWVNWaEdEekgrTUErblpQcC9BSittdk9IS0xUMi9iRW9LZVli?=
 =?utf-8?B?aTJIWjc4bDJpTFI3OWNPclBodjVudUtUUTVJS2dma3haLzA5NUVTOW1HZDM5?=
 =?utf-8?B?SnNTY2s1R3pjc0tZdnVRL2JuWlZXczZlOTFKZ3pTK1dqcFlhU0RVbkFYaDVh?=
 =?utf-8?B?TWJEZXV2RnRoZHRTWTh6d0hua1BlOW9OcjdHTDdSeEorSW9qSWw4cU5pT0FO?=
 =?utf-8?B?RStxTGRIc3BtajJTY3NaQmNpQTZuQ2ViMXZMdVhGUHdrZElmblhGajZzQ1JY?=
 =?utf-8?B?WDJpcXBISnQ3U212ZDhmb2srbEYzSmwzbUhsRTQ0Sk9jaDNHZUQ4OERQOWIr?=
 =?utf-8?B?ZXV1S3FjVjgvekQvaktxTlZsUElCN1B0LzFIbUtjWHZLendVOSt0WWlKc3Az?=
 =?utf-8?B?Zk8rUStPME5FK0FFOU1aZXlSRUV0WDROZ0xEWk5zbEdadWdUeEFDQ1FvaXRX?=
 =?utf-8?B?WlRMSnY0RDVPRGFxZGtFSDhnV1F5QUJRbDZMcXFINkdlRm9aZDRjZjgvS3ll?=
 =?utf-8?B?Z2ZjdUFMK1BuNUtJcGNkMk9mQ1dTWWk4S0R4RURzblFLZ3E1UjdLS3VpMVZt?=
 =?utf-8?B?amRZRkF3S2Nra1pPdnREOWhvZnR6RTVjWSt3WmtlL1BXODlIeXhPVFhwZDF3?=
 =?utf-8?B?MVFDdUhxQTRyKzZCMEg4N0wyN1ZqaHlEMkZkeWZxM0NsdzFmZm9OY0JKYUc2?=
 =?utf-8?B?TldsSzBMek5kbFBrVE9INUREdmJoWjFYTVgvdUZ3VDdQbjRTbUdJbVpaajVU?=
 =?utf-8?B?eHc4SUMyaS9VVkRoU2xscjYzcHhvUEc4d0JhS0FKOC9uTElaTE05Q2pJc3pS?=
 =?utf-8?B?aW1JNXkwR3Z1cjdwUDExeitBd3pDSkdrUWVYR3l2dFQydG5iTHBTNG5iNkRq?=
 =?utf-8?B?UGM4N3loY3Y5VTVGamhtY1RyOXp0dTJWU2p6L1JwckNTdTNFdmsyNXl4aTFl?=
 =?utf-8?B?ejE3LzNSS09LQ2Y2Tm5GUFBNR2YwbkNUbVpEUWJyOVl2ZGJNdXM1aXEyOVNs?=
 =?utf-8?B?a1kweDk1dEFocGIvMW03T3A5UWN0WVFFdzZmM00vMlQ4RmI1QTZSQmpzcHNC?=
 =?utf-8?B?Um5qTjg2Qkc5RjVJTDZ1bnlOd3NCTnhKNTVUSDgzclBndzhGM2k2TFYzL242?=
 =?utf-8?B?enhtVHR1NEJ5SndBWFM2QVZkamxWWTdOY1B5UEluR1RDemd4cFdZbGwyME1k?=
 =?utf-8?B?MDhRQWx1RG50WkswWjJpbnZGdktUOGJPWUgwbVByeklLaFlrYWUxaExnK0V4?=
 =?utf-8?B?VUFoc01XbFo4OVRJdGl3NFl1Y25HQTgvS05MdG1oY0EwcU9ZTGlERjBsVnRQ?=
 =?utf-8?Q?euuEz41VACaBCMGHfb3Lxn1Xnbf3Lkp2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVdFTXhzUERCTUZoOURTaFdadUdpUGR3OWFDdEFYT3p4YkVrN3RnVkpzbm9m?=
 =?utf-8?B?bFFMWFpjanNLTVVHNjNKTHpwVVpySFdjdVh4Q2k4N0YvR3htbWlLWXQ5czE0?=
 =?utf-8?B?SDE1Q04ySkx1OFdUUHRhdVQ5OHo2RWt1dVVTSFkyMjJrUjUzZHBTV2hZOTdv?=
 =?utf-8?B?U0I2UzlRcW1tVzhLcWJaRHVtTGpUWW1CM1hyQmNhT1g5OXdhODlnbXVQdGp0?=
 =?utf-8?B?T0F0cHE1T2d6OFlVQk9IdWZud1NUQVRxUmIwZCtHUFFzQ211Mmwwcjg0d3lZ?=
 =?utf-8?B?dFEybk5LOVR3bVpLWG5pL1pXMjZldmtadFJpSkdFRFM3Z1NjWjBuc0hsRW5j?=
 =?utf-8?B?Y0tVMXBpa2ZGNDBTYjE4Sm5HSnhJcEt5ZHREcWNZUGFycGFNWjlvaFNSQnFR?=
 =?utf-8?B?dGJtMFZJSnpkZERHYThqdGJUWmkxTkxCdlRnaFVicXRpWEtBUngrZXg1WFI3?=
 =?utf-8?B?QVgrdmFVbGltR1ZjbWxuOHhwdjJ4VmJkQjU2NSthZ2o2Rlo3VmJmeGx1TFkv?=
 =?utf-8?B?MWw0aWU4dkVPOVJMcUl6VzgwMWxSLzg0czNHRUNGVFhQeUtKTDMvcWxZZHY1?=
 =?utf-8?B?eXZCQmdjZHd6d1h6b1JxRklZd0lwWEJqVE5ZeXRNb0xkaUltWW9rVjltajcr?=
 =?utf-8?B?TmlSNFdkcnZWRVozUmtDV2FjN0toTXVOVjFaQmcza01BR2pTMkt0bk9kbmlX?=
 =?utf-8?B?TWFxTU5EbTh1QWI4VWZ5TVZUTzFtMmJtRjBaZEM4YWlmSWhNTlphUGI2cXQ2?=
 =?utf-8?B?MSsrL2VxT0JQMExiZkZET3I1S0dDNlhlYUh2SHorZjBicC9zdlNBdkVlNkhN?=
 =?utf-8?B?Lzk0Nk01UVlXNmhmZWxOUEkzSy9rZWFSZTBuMHBuSng2TFlwRmZBZE9uL2ll?=
 =?utf-8?B?d3YrRWJQU0VlSjhXaEt0WGdGTktKNUJzWG9sdzhQK2dIT015S3FKZXZKNzE0?=
 =?utf-8?B?TW51NHRYd3QzcGVjdVZMQWM0c0VWWllXd2k4OExwWE1MSFVxZTR6bUVoMjBr?=
 =?utf-8?B?TEhaQzNPVkVKZHVaMUJkcmpQUEp0VURNRWsvcGwrNHFvSmptNk9xV090SG5r?=
 =?utf-8?B?TmhOTEhiRzRPVkx4TTIxd2wwSDU4eFlvTTd6NkFPTHdGczYveDBoNlgyY2hU?=
 =?utf-8?B?U3RQeGZ6UUVmQlV2dEJXTk9TRngvQ1owM1NaNFJLMHJSSXNKemEwMnJrU293?=
 =?utf-8?B?QW9Ebm93ZlQ5cXd5Y1ZQay9VZnl2MXdWK2VkblFYVFhzenF0ZjlDR2d4VmVr?=
 =?utf-8?B?QmxoVjFIV1lROFFFYjl0cjNib0FTTVd2VnZ3T2VrRzBKaGJMdWxkVVlrbElJ?=
 =?utf-8?B?blFMejBETVpFKzFSUmlBdGdtZ1RLUkRrdFdlcVBFZWdDczdSSjFnc2V3R3hM?=
 =?utf-8?B?WmJKdEs5ajlwb1VTbG4zVDR0TElzN1MyN0VVaUxhWHkxaTNUd2g0TEdqb1pL?=
 =?utf-8?B?amd2WDY1YjVZRGFhZVozUzlQV3pUWlNsZVZvVWZBVVBkNXJXL2Y2cTkramxt?=
 =?utf-8?B?TjAwcHA5RTNscWVrbS9iZDB4SjZ3QlNrQlVsNnZacGtIVTAyRnE2eDBtdDI0?=
 =?utf-8?B?dktldmNidHNHc0ZVR1RUVitxbnZaWGNqQkZsNlpGOEVNR2prc3JYS1BEeGc2?=
 =?utf-8?B?REl6aStTUS9YSWpEaDdXdHZQN0FTM3QwYkZENTE2Zld6SUNtSTNWaUNqcUE0?=
 =?utf-8?B?K0FQOEd4WkVLcXhKem40Q3NucGpyQjQ3bjdJakN4eGYwbGRDbVpaQkNNdGN2?=
 =?utf-8?B?Y0dsUXIvekY1U3l0d3lSWEJmcWhheEhmd0ZvRkkrRTNlaHdDMElaUEhPazkx?=
 =?utf-8?B?VFNieWJrWDJZdW5RVE1EZlhXWHhydWFrSWhTK2E3YnhIaGxxTTRPZGd3Q3kz?=
 =?utf-8?B?LytZWWJJeXdSK0RZN21SZFRKQ09zZUZZWXM4Si9kVm5SempYa0VyeE00ckt6?=
 =?utf-8?B?Sm1oaWdWb29zZ1krTjdnMmY0azFrWGlOaHZUQ0xiUzlpWktLMGFuR0VrNDJB?=
 =?utf-8?B?UHdlVC9hcUhlMmNxWWhaRE90SVRpTGZjNGdTa3B0ZHlXUmlxK2Ixbjl3Nisx?=
 =?utf-8?B?OVNENSt3RithemtZOUVnRU11cmJwbkJYY29xOW1tYlBpamZNeG82SXN0c1hZ?=
 =?utf-8?Q?VxkPZgn9hn+Mv9GGNlesZOmjl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3523efe9-91db-4dff-b357-08dd3c79aed0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 13:19:07.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnjVm+OdhyY67Mdqs1R3UOB0aRZuGt4R8qBNjmXiZvi0iPKZyy22vFfMOyvl8pd/4hQz5x+0p4XBy5mMTk2BrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007

From: Peng Fan <peng.fan@nxp.com>

Add clk_set_spread_spectrum to configure a clock to enable spread spectrum
feature. set_spread_spectrum ops is added for clk drivers to have their
own hardware specific implementation.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h | 22 ++++++++++++++++++++++
 include/linux/clk.h          | 22 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
+			    unsigned int spreadpercent, unsigned int method,
+			    bool enable)
+{
+	struct clk_spread_spectrum clk_ss;
+	struct clk_core *core;
+	int ret = 0;
+
+	if (!clk || !clk->core)
+		return 0;
+
+	clk_ss.modfreq = modfreq;
+	clk_ss.spreadpercent = spreadpercent;
+	clk_ss.method = method;
+	clk_ss.enable = enable;
+
+	clk_prepare_lock();
+
+	core = clk->core;
+
+	if (core->prepare_count) {
+		ret = -EBUSY;
+		goto fail;
+	}
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
+
+	clk_pm_runtime_put(core);
+	clk_prepare_unlock();
+fail:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..478005f4d53ed0698ea17331730c755e08ea7984 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -84,6 +84,21 @@ struct clk_duty {
 	unsigned int den;
 };
 
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq:		Modulation frequency
+ * @spreadpercent:	Modulation percent
+ * @method:		Modulation method
+ * @enable:		enable or disable modulation
+ */
+struct clk_spread_spectrum {
+	unsigned int modfreq;
+	unsigned int spreadpercent;
+	unsigned int method;
+	bool enable;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -178,6 +193,11 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Configure the modulation frequency, modulation percentage
+ *		and method. This callback is optional for clocks that does not
+ *		support spread spectrum feature or no need to enable this feature.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -255,6 +275,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       struct clk_spread_spectrum *clk_ss);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_set_spread_spectrum - set the spread spectrum for a clock
+ * @clk: clock source
+ * @modfreq: modulation freq
+ * @spreadpercent: modulation percentage
+ * @method: down spread, up spread, center spread or else
+ * @enable: enable or disable
+ *
+ * Configure the spread spectrum parameters for a clock.
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
+			    unsigned int spreadpercent, unsigned int method,
+			    bool enable);
 /**
  * clk_has_parent - check if a clock is a possible parent for another
  * @clk: clock source
@@ -1088,6 +1103,13 @@ static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
+					  unsigned int spreadpercent,
+					  unsigned int method, bool enable)
+{
+	return 0;
+}
+
 static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;

-- 
2.35.3

