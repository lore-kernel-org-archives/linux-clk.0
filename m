Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39F34D91C;
	Wed, 21 Jan 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018687; cv=fail; b=G3XKBf+a50DdPTJw+1DH3TH59If/p68dLJx+Eb1icjg3sPoFviHnAwaBWsDnWNRlte8RtIApfrsCceFS8aicd60bJY4Mxbk7r8ZlK7ztZmm/Gjb8Y1T8hpruUTOtYvvPXapVIK8XHJMgNKHvMJjk3C9DYN0AoXVdIYAFRwKeJJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018687; c=relaxed/simple;
	bh=1RxowkE5FTVK677T24G5xi3MPYZRIDfNJ7nf1gedgjA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UzrVoIR20EvyLwAyNGS6N70scn5Cnab5fJXAuxspmIa5OCwzggLFIY9Y7Tug5BktbyEgXGE3JvBkOnEC4sfwIqwjIpzZSlS4DVoax1d/y2+uSMs0Inm6WM4xPIF/F/h5kuZ/FmAus1IafXH4J3OOS355xLLt+PqWsN4+c6RRfBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ke/1ROE9; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ke/1ROE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA/W0hAQR4sLAhA0NbnAmceohoMnnMo0S6D8HZ/DAMHu3+bQDx/uNS3ohfcOK7iRdRZGqj8cf4esi0g68WaRxqPbniQ9jebSgvAjcSkwBCpqeclY6721Tw8ovPEcuseYL/DHFJ3xMUTjvmcanOLvy/nZhmNwqABggV5gxwQP470xCO0m0sXRxYd6/71dNIsbGK3/cayaF5In3BFwRowUjYGv91cJJpKlyzUDSPQNu1JyNrHzhzcTr2hAfl8jVzhHvtY2MY3AwoHe2jzkKcwsFUvUzpBx8o4WpcLJywSzaLvuGjlR9LEb9aibz7fR1za3V1SK7CSONU0x+ZQDXiAeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp2CsL1ns8pyZkSFyKHBK1MEQz8yQ0LJvn6uf4aZ9zI=;
 b=iQL84kdh2CExdX5dfrQVvsW9jaYUzJuEus7cTQ+I8sA+gUdHd5f+yCuaJrVNS+SBD2/GZbNMG9LobKZtQCU/6D9PGyxt75Q3+TID1ACP8aMg3EuIMab770Uk7zTEFSAwYj1bjuykZaA0vTwSupGlKtpozZh5IABPJ6WA11PZj9Y1eCFRuaIIJlEcqm2fnx35pPYyG0Vs4tvTWQdRw8QNc/1YOXDXsuQ2kgy2aglpXZ2khHnevD1nOI0Z74M6/aqDf4g4gm3LV8RwCeDfto7YofaVXDHhi+/gDKW27+KBgKC0rEYfmKba9gWLyFejqOR7xDMUSVNVaIbJtryO3NV1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp2CsL1ns8pyZkSFyKHBK1MEQz8yQ0LJvn6uf4aZ9zI=;
 b=ke/1ROE9rhflVBdGLmxj+MTX9b+oS84SgH8duaZJdxcJ8mNrLX6UmJVomtKvFI46j9AgxzhaKACEyze1SHz0cmXVtGtIUxzTLdUTykBnLzCGd8H9G1Ov9WCSqdvpv3TOaeDUP0P0P3q9RsCYKPuwx/+xjg5osGtWmbQsAkATlfb/XhLplUbGTOMtnFme6QawDTQePMJpkdoRFdieI6u8IKRqNjDskMFgOGM6PC5kYjdQvxQWf7klZxxNlpT6igXicXlDf59jvbBtd1HrFCYOk74ke17qdP86DMYJvLeJarT4kUYP8bf6Q/NKYNxyU9zUI6JuOODOO9ESyCId971hZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:04:37 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:04:37 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Jan 2026 13:04:16 -0500
Subject: [PATCH v3 2/3] ARM: dts: imx6qdl: add label for system clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-ccm_dts-v3-2-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769018664; l=1281;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1RxowkE5FTVK677T24G5xi3MPYZRIDfNJ7nf1gedgjA=;
 b=IQyFDQmdNQRV0h78cAl6cWD62Oh6DyQd8QmvjNAR+U82/XXZ14qmVN9wyE+Y3CJ0pIsUVfyMR
 6RHweOb04NWA0uaqfz/AdP9yI7hcqzsOF+NJ3v/bGFIXFI9qLB/9o30
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 837efdd8-dcb7-4f49-b5ee-08de59178a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnFsRHg3djJkTzErSi9lVG5vdktrUC9ZWHhFOU9JRGRHWWMwWGhaUytVa3Bn?=
 =?utf-8?B?Um9Ka250ekVOODZFdWFyb012RlBjZGk0NjFkMmpBREk5SzBNZVh0TXdkY0tS?=
 =?utf-8?B?NzY3UTFsN0tsdnVDamluYmc2cWd3M241dUdjRjIvUU1tSHpJV0JLdENEc1Aw?=
 =?utf-8?B?WVpkVk9hdGdkaXJyTTh6Q2hKNk5TbVl0MktEYWF5LzVPZ1g5czFySHd1V2hR?=
 =?utf-8?B?Z3JxWGNnQ2tLQXRXTTRzMmY5OVp0MFI1VVlQVXhvK2Z5WmpXNnFvUUx6dHhJ?=
 =?utf-8?B?bEFaTTNjVzAvOHJUanpWUVFUaUJLcHRBcGQyQ2doWVFjK25PRTdBdGg0UVpj?=
 =?utf-8?B?RU4yRlM1N3Nsa2RqTlVzcndURzZlVlF1N1R2QkkyT2tQYmxSMmVPK1dSZmpw?=
 =?utf-8?B?UEpTSFE3N0ttd1RKOVZmZVdOOFVtZXFKdzFXWGJKaFpnK3BvZXg4ZGhrMDly?=
 =?utf-8?B?MTZHdTVCZEYyOGRQZDJXKzZ2S1BFQnpaaWZyMnBxSkxjZlJPR2x3aXZxQS9G?=
 =?utf-8?B?enAyYmdybHRsRHhldnB1NDk3UEE0cTdWdTE5YU5LNVFuMFk3eDhKWjlYa1lL?=
 =?utf-8?B?NHVha1ZQUFByYUpuR3hNQUpNWHV3ZVlVRXlWbTNBdFdUTGl6RkNxTUh0WGNK?=
 =?utf-8?B?dlRFcjFIUUV1cHlqczh1WXlDS2dRZmV0ek0vbW1wT3lHSC8wdU84N2x2OTZS?=
 =?utf-8?B?RStJUnBwTFRFa1E5RjQxYjB6NDRVdzU2WUkvUFRvT25TNDBuNmJvRWhCd0p5?=
 =?utf-8?B?R2E3KzlxTldOSEZzRWgxL1ZESWVpcTd0S0o5SjBNNk41cmp0cE5rUHp3S0c4?=
 =?utf-8?B?OWZ6b1NZb3M1M3lxbFpGcWsrR05DVEhqNjI3NUlpc0JJZmJ4UDIrTkZBeXV5?=
 =?utf-8?B?ZnRjRWVXdDArQUhZQVlHbXE5TXhaeEdld255c3k5NTEzNmNNWkhXd0NrRTN6?=
 =?utf-8?B?bTQ3UHhEdml6NnZrZm9XSFdPeDVBMlA4aDN0OXI3WFpvc0xFaUorREV0K2NK?=
 =?utf-8?B?dTdodFowR25mU3ppUmludDNSajNwTjEvREJObTRmUVY1YVdKMkh5N2J4VmxB?=
 =?utf-8?B?WktXUTIxTStZMXppUURXT3JqcXl1dHRqRzNrRmZDT1lVY3ZsQXg1aUpiMFBN?=
 =?utf-8?B?cjFPT25mclFzeGkrOTR5S1pCNHZwU0szRG1nVlNsd1czeStsT1ZYRFZMMzRF?=
 =?utf-8?B?bUt5K2dKdEpaMGR3L0hqVk42TzJHMlZ6S2VseE9nL1lNZWpHelJWMXdtUEpn?=
 =?utf-8?B?cHhHOUZCRGY0alBhRnpYQjF0RHVvRkVxd1pBcldhTTBMN3lmVDlXMFhiTGhI?=
 =?utf-8?B?YmVoVUdSdjhGenJ3cXF5L1FweWZPeTBld2gxM0pkSU9GcFM4VTNlUXhQTjNh?=
 =?utf-8?B?THljdm45bHVzdk53S2ZYV0lUVUpFUFV3TmJNYk00K2huWW9kQjdiUVBENHQ4?=
 =?utf-8?B?YUl2UnVxYjlmNVRiVHM5YVEyb0ZSV1BabVp1ZitpSHNTanprcm9WRmM3WG1V?=
 =?utf-8?B?K0dIaHQ5ZEExWXNKTnF1NjFoUkEyUmY2aTVaNWF5cHBYelJGejFLUE92eHV0?=
 =?utf-8?B?R2Exa2dXVlZrM3ZLTmQ4RVlXd3h6bE5Ia0NSckJoUE9oMEVYMHU2WGV6RzRM?=
 =?utf-8?B?d1o2WjdkamduQ2lFOUdWMFh0OC9uNmYrM21DOThMV1dBQUJtWUgrNHNGaUhH?=
 =?utf-8?B?WXdiT1JPK2VxK2tVdURMaGpRMFNBWG9WdEhSd0hJTlVRRlRTK2g4bmpMbHZD?=
 =?utf-8?B?QlFhL3hEMEpJNUVRU2JwVXhmMkRQTzVuQzZWS2IvZHZMWDZiUSs2NnJoWlYr?=
 =?utf-8?B?bkxlWWp6bzlCRVQ1S0hWQkVPcThSMG80UU5Cdy8rUWo0eURoQXloU0s2endj?=
 =?utf-8?B?U0FVT2hoUXpKTXh0RVJvbnFqL3dadTRJV2xYZmRoYjlzSURISW5rN3VpSkd4?=
 =?utf-8?B?MTRnN3o1T2lZS2t6TGFuSWFGYzNiYmcvRGN2UmFmTjZodklnbTBVSnFBbUJJ?=
 =?utf-8?B?K0p1WnpzN1djVXg0U2gwMVlsQ0MzYmRNWTBnRmRRUkZRcXF6WHhYcUdmVXI0?=
 =?utf-8?B?Q2cvSmV6ZWZGdGhMYktrUnptWjBnVXJnWnNib2FDQWcwMlFQR21HRVFuUDNO?=
 =?utf-8?B?THZOQUdYWFl6SldrY0RnWEovODNpc1NJRUtNWVlJK2ZieHA1djBSYWpiaVVx?=
 =?utf-8?Q?9KhU27ZYmeDPgpROVFEFwRE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEh3ZFh6MWZkRWFYK2xFc3lmdURWRnd3TEdQV2o0MUVldmE3L29mZ0FIK25x?=
 =?utf-8?B?UEhkbFpWR1ZHVzlha0s5aWM0R0Y5UUxyazZsdW8vTEJ3bkd2RmM5VmtxMHhY?=
 =?utf-8?B?em4vem1haDdhNDFWaVhrL0IvNkxzc1llZnJsVU5nU0lKVzFSQ05DL0VKY3Jv?=
 =?utf-8?B?c3RIajNWOWpVM2l0TERYMk5nazJ2NDVSWVBHenRqaW5ibndoWkt3SjN1TTM5?=
 =?utf-8?B?bTZNYlpPMU41eXdOTU9tMXI0eHpoUGlNYnVVN0lFNGd1VkVqbU85QThiQ3FE?=
 =?utf-8?B?ejJQL2RnQnJyU3dhSERBL28xUnovWGRNOUIrUkVYS0hicm8rU2crVEtENHFB?=
 =?utf-8?B?YnUzL0Jib1lYZS9FU1RuNEJGaUhybnNJZFlRQmxITEpkeDlDb3B6Z0IxbXg4?=
 =?utf-8?B?WXFNcEVzRmF0OVRpalBzRHFyQkttMXFldUlIalUrVWJ4WkpiSytyVEVxdHUx?=
 =?utf-8?B?RFJOeUlpWXRBbmVvTVdOWlBpa3VlS3dTeklsbU8ramRucVZ2VDRwWkYydE1L?=
 =?utf-8?B?WVg3anpqSWFZTE1aN0RZSU1OeGhFQlE0cjcrVmttVXBtcUlSSkNyR0pSLytF?=
 =?utf-8?B?anJtK3ErZUlnWmh2L243UXEyMWpnTjRxQXNqbkZTVjVyY0p1a0F5Q1FVc0dQ?=
 =?utf-8?B?QkljQWlTY3hOdjAxVm1QR09pU0dnSjBLM3VVdVppQm1QS0NYdDdKQWZqOFQv?=
 =?utf-8?B?UnJiT2RMSzBSNXFmRWN1c1NROURTNGppSFNuSnNjaFRXSlN0Vm9NTHFsejJI?=
 =?utf-8?B?QU5PeWZxRndLdzhzNEhGelZtUlRGcHZLbVoxM1pRMnlCYzZvM2ExbzBsczRx?=
 =?utf-8?B?bzNMUEtMWk1QSk9hRDdxaTA5Q29Kc3ByTVJzS3ZxOSsySndmWDNZTGQrZGh6?=
 =?utf-8?B?LzRTN2NlUlFCeFBpeTZsRmF0RFk2N1kzZG9EY2V5UkFmUklLQlJjTklScits?=
 =?utf-8?B?dzZmYmpoU3d6blZmRlZFd3BobndNcjQxVnJNa0p0RVdPMEE1N0RzS3FGQlhI?=
 =?utf-8?B?UnV5cEVCK3kyVjdlTEoxeTNFd2lHeDJJTCtteDc1QWxvV0R0d1hSSFVBeUNw?=
 =?utf-8?B?V1E4UkZkU2ovWTlaNlFvMEs0bklFZlRZRVA0dWkvV0h6cXEvNXp4UzNiSUV4?=
 =?utf-8?B?dCsxMTU4ZDdOOWw3S2NiM3JpcWRRTG1hU0JmZ3BEN3JZejhtRi9zTHBLTTNU?=
 =?utf-8?B?MlU1eUNMK3hmemdsZHU0Tmk4TURMcTlCeG1NNVBzdGplK3lrL3BFNGNOdGNQ?=
 =?utf-8?B?WHFPZ3hPdkpRODJHeXVzbmZzYXExdHJpT2h6dkV3YWJRcFBzYUhLa0ttMEJM?=
 =?utf-8?B?aEdIcVNtM3hIR1FXVTZvekViU1IwVXF6Yk9lMnhtKytybTFBN1JnYWswc3dm?=
 =?utf-8?B?RzFXR2tYRWtZYkFmV3pIOUhObGg2aVkxM21lamdxS2haMHUrMkFwQjFiSHQz?=
 =?utf-8?B?ZXA2T0lzTE1qeloyOWxxbHc1d0tFU2VFQmxyVTNCelBkZmR0Z0FNMWdoeTVO?=
 =?utf-8?B?OExhTnRKdVVIakI5VTNNYXJoaFljeTdoTHk5V3luVVhTV2MwV01ORnlMVy8x?=
 =?utf-8?B?bERkSldPbHFFNHRUL0ZTb1ozc0RaT1R6N1htcmFFSWwweDBCcHNZdnR3SFVR?=
 =?utf-8?B?aEwrU0p5UEx2MVdOQVkvWS95eVhDb0NCamRKci9jVVNyVkZub3YyLzdHQVBI?=
 =?utf-8?B?L0Z2SEcxSGpPbC9kNzVRdFQ0MGh3bVNVb2V0LytuVTlOYk85amZ3VUZkQ1lp?=
 =?utf-8?B?ZjJGL0pkR2dxcU1xc09pMHJ5Y0pzZ3hhWmVMZFhkT3lZMjU0REE2bXZHWGtV?=
 =?utf-8?B?d091RzRCOTB0b0tnckx4OXk1aHNjQVdWQVA0bk1vbkczeFk2cjFrN2JvWEZt?=
 =?utf-8?B?dXE5T25UYVVqQXZVQ1BlWjdvUDhncUVraTJONjl0aTRGTjRLSkk5UXZHNkZ6?=
 =?utf-8?B?TWtXbXhhMDAxMmVsR0RET0Z2NDB5a0cvZEtUM0FOTE42MHAwWmRWVUt1Sjdw?=
 =?utf-8?B?MkFsUHBFWUFVN1BEaXRWZlRkMHpvTE5aSDA1RWhzTXNHSGN4T2VpR3pqUHhn?=
 =?utf-8?B?RGVVOFRDSElVY0MzOGw4VWhGTjJNT0VtbkRwMlF2cVJrU2xIbGZ0L01XNHZZ?=
 =?utf-8?B?S2xVNzBMbG1adUFXWm53aVpnNVZsVWkzbHVwTlljZWhOZElzMERkT2xlRWNt?=
 =?utf-8?B?SGc5b3BTUm1laktDdE5rVVN4NzF6dWc0SkhuamhLU3o3K0tMeEMrMVJXa1Bx?=
 =?utf-8?B?UFNEcE8wS3p2OWc4RTZrUytkSFl4cnp2WnpSYXQ5N0QyUmQxK2ZOaGpkdjc4?=
 =?utf-8?B?UTVVOFBvZVp2cmp3akozcTBhZ1lqYnB5SGN4bkJTMjVLS0RVSFUrZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837efdd8-dcb7-4f49-b5ee-08de59178a3b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:04:37.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QuL4EurF+fU5j2SuDkgDYgdVcKN14zPksBY6bQD6KFNAOYgMJTnuOr98IV5KLJ7dBWQfPxbIEoNEmBdGZ7h4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

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

