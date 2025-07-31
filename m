Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DB1876
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753942034; cv=fail; b=AloyFWoFdAwm2u/e1qIvlBQrnGJFHKVbZOoi4eimqCo4Tq5uF3Xr3s04s26+KYYbX0BOI3nm0a3qa++kiWj/nk2w/gHM3pGbjELWU81VfRaoM5798+ooV5wWJzLjfMdeJNIQiead5y4aQDzukg8wc35KVoAE5U+2r13VrKBOyg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753942034; c=relaxed/simple;
	bh=BGcB6Gt0NGDE5h1GXomTI/g1fTzz0T4drl4KlwpG6Eo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JGfso8/dU2Ng2bQTZlEW6oRhvEmjyePdbou6ymqZhkwtjZbPqd/C7g9+vy3R8G6IyIaMAopc5zQR5DjPmtPcpWAiQoeg9wpXpeGnLww/2Fpxdi2VVS6iFsQFZGm4/MqDO8fKMaxyO2Wihelf3HPavI97x9kOLu55vch8pWJd3+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PvDj6hRg; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PvDj6hRg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2zBU8FkhD0KWoRmx+9IaAjjPXWg8O848idOfRD3n155W5pjQFaYynmTerIxdov1wplmGYcTO8D/mwVrHAzmdY/vfn5wN/tOsRScJjrhFbN2jvFxxwUbOu55tpWE+CUXCCIB32mhFBLII7nwgveK2I+j5HgFpDcF3P11E8L/qSWur0i9S61IfeOKsvf0u7yyKWz24CetcjsUAXP6c39JIBr1slHcJNq9v9vWpxLhQ805RTzDcWMZ6llxeuowF2qa2SNBfaH+sXBE621vqJzol5QFamzl23LvSIBSJSD03+bjyBFGLt2WrrSwW+hMhoVTkB5SIIvg/eFrJ1rjTKV7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGcB6Gt0NGDE5h1GXomTI/g1fTzz0T4drl4KlwpG6Eo=;
 b=q21NXheBb0HJdnIeq4cu030FCZTyIylLxu0SOJz9V26I8U5clmDIObb1jnfSrf/0NvT0ORw7YRaNxjZ1P+g5r28yR8nuEB0SYAPUlS9wF8nodW2Fkr2AoYg5KMxMy3cO2NBbGjXoWuTqGIMWV5g2LYEURVSM5MwwbV6a7FL+vuhL+7Aaqd/QbuCfUeFfspRv7wx8VCu4262m8T9ffbLOMleCeBWsbL/B14fQDmERADM191BuMkYvgOdXpOEcua6keDrIzAZNdYuAEANa/fPnb6whpiWH6MsvzpEk0Z3N2/bf8n8mjhx+OpM0mrCOEkHM56CxZp5M26xqhn2MiuoG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGcB6Gt0NGDE5h1GXomTI/g1fTzz0T4drl4KlwpG6Eo=;
 b=PvDj6hRgiSFLRhCL4BKwuOtNq3rtcYWvd2VRCSFN4zTxASP2vnptzMJRDkzxOfeOZNfrmoqtjvPGb9nKqR6wNiwh7zPAML8+GcXCnVYgTkzUq5J9S+1jnZYDf5WVawqmAzOVd2BAr/LWKGN6FLkjLFdKs3gLgS+ecKNF6kyANu/EKvkQN4GuMEHh42N0vuK+OR9l7iriIc9KKM8GbxhdhSBlkVuE5MET0Q9HlSyx/zy8anF2vSzjHw+hIZwd3BJeNqycm2uDEU50F7BYTgzidwbDDa2AQTTgJDcLsB7KLldT1nWm/wTq/2ok8ADQLx6+J3Te0API1p6Wgmz87cKb8Q==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 06:07:08 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 06:07:07 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Frank Li <frank.li@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] clk: imx: Add some delay before deassert the reset
Thread-Topic: [PATCH] clk: imx: Add some delay before deassert the reset
Thread-Index: AQHcADnUHQkTf3lg20mKQ4z3QHRN/7RLIxCAgAA6NJCAAF32AIAABrZw
Date: Thu, 31 Jul 2025 06:07:07 +0000
Message-ID:
 <AS8PR04MB8642C953C0F1A13B4A0980D68727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250729033817.1239646-1-ping.bai@nxp.com>
 <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
 <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <CAEnQRZCVB0+wQVqQYwcvwDW-F-_e6moH+T4pePGsDrbWyVY0yw@mail.gmail.com>
In-Reply-To:
 <CAEnQRZCVB0+wQVqQYwcvwDW-F-_e6moH+T4pePGsDrbWyVY0yw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAXPR04MB8991:EE_
x-ms-office365-filtering-correlation-id: 28d4f659-ec6a-432c-9057-08ddcff87af8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTMvZWdmSDJtMUJwZjhHQmkxTllvayt1eVUvcmxFd1ZHeDNQb3plUGIyVjVr?=
 =?utf-8?B?UUUxeHEvVE9iWmEwaWZMRW1tWmZJRkhjd3VoR3p3eGFFSE81ZmFSdWR1bUdH?=
 =?utf-8?B?WVRZUkFPTU5Xd2o5L0tmWXV5M2puL2FrZDlwcmYwclBUbDAwMG5rYVUwTGl6?=
 =?utf-8?B?QUNjc3UxYWJWcEN3a3VqVUw1QVFKbWJGcGo5aE1HeFpWbTlVRmc2WXllZXRi?=
 =?utf-8?B?Qll0RXhhM2JKdkpyOTEzT2RUajJnQnlrNkxYVDM2MjBKTktsL1JsWUYvRWVv?=
 =?utf-8?B?UUNXKzNkY283MW9nZC81SDJ3ZEdBSlNqcE5SL0ZJWnlOQWZQMW1DT2RDZlds?=
 =?utf-8?B?bnMyNlhlY054UCsvRG8zZitVdXNTOURoaTFEdWlWMjl2MWVrY3JQeE01aERz?=
 =?utf-8?B?Q2J2UGJ2c3h2STVDN09jMGIwdEFRbVJTamU0bjZPMUZEd3R3ODNIT1FiaWNK?=
 =?utf-8?B?aVhHMVFiR3Ezak9BcnBaQ2I2bUltaGdiMkZhOVRqYW1PQ1R6elhCKzZoQXFV?=
 =?utf-8?B?VDM0dURSeUE2K1lEaDBRWm5aekZ6Zml5QVVnSzQra0FUV1JqWkoxTERXdmlO?=
 =?utf-8?B?Sm9HVkh4b3BiNjhaQnlxTGhEcEZuMUtTdzBvckRXNGJsTFFxOURPdGRHdXFW?=
 =?utf-8?B?NUpSRlZwek1ETjQ3VzdyREtHSkdRVUhLQWgzUWNRWDhzV0x3a3NvWG94SWM1?=
 =?utf-8?B?aWtqQmt0dXBOY2lPNVVFbi8xb3MrVSs5MTFuWHUrZ3hkZUN4OFloN0lsV1I3?=
 =?utf-8?B?ejJTbGFYL2YxUVY0cFRXekxHUFZtQU55UGZSUkJZTTI0ZVZXcnBIeFBVSFRI?=
 =?utf-8?B?LzQ3bzlKcHNMTC92NzNyWFFqaE1zVEkyVFdRUWhXZnlRS2FtL3NTRTNSditr?=
 =?utf-8?B?VTdtZXZVSktRRm5lMkROMUN0UFhYQ0pkZW03MHRLS0tCbkNxMFFJVFRHMWt2?=
 =?utf-8?B?ZnlxUmNLOWhSaUp0T0tsck5saUdxZ0QxTlFXUzBDSnlRSTIxOCtvallxbDBG?=
 =?utf-8?B?b3B1OU4xN1ExRFZhN3M1azRqUlNnUVduTHU3ZWppTzRia2NLaTVXRnRMeXNG?=
 =?utf-8?B?VmpHR1hoZFFZNVpMeXBaMkdnVEFySlgrMHRBay9qVGNzYUdtWUt1WDUvNkU4?=
 =?utf-8?B?K1JpaE4zNk9FRStxU2J5WncwMVNuRTcwOTE1a3VIM0d1NWVuWmFEMm9YVFJo?=
 =?utf-8?B?U1NraVBYaXVWRE5nWWJ2TDRBeVdWUGh0cTVXdFlNVXJXa0I4Wi9MV2VNQTg1?=
 =?utf-8?B?bE9pOUIwS1c5ODJCMjd3ay9OOW5DQmtVT3FOUlFuRm1lc3kzNkdyUGwwd2xx?=
 =?utf-8?B?ZndNdm5GS1NEaEd0ZTVRUEo3S3p1VXh0U0JEaHJwOEVJNnIwZU9qU2RPcCtC?=
 =?utf-8?B?SThTdzNtRkFoQllaOVZvMU9jNmhOb1g2czc0Y3F4cUx0RXhCU0pmZmx5czBj?=
 =?utf-8?B?MkE0R2dKNE50cm5tTzRReUlSUTFKSUVEV3VvR0Q5bCtFNXcxMTczWEJ3N3Vl?=
 =?utf-8?B?M3pMTDk5cm1Uc0pQamxqTnNyZnRRdHhzL0FxVWdEdUpNRTNNZHdrSWUrcG1D?=
 =?utf-8?B?MmFCZW5lQmthYkU1b2VDWFdVSzA3VUVDSlNrcGhFL1M2dTNrYVNvS3VKOVYr?=
 =?utf-8?B?UlFlK3M5cjJCTGsrWmNycEtQenlrcFgySlNZTnFWZ2RydkRvMlRjYmtoQnhm?=
 =?utf-8?B?VXJuUFI3TUdOSmgvMTRtL1JzVndUM1BjZ29GWHVERkdWeEpYZmhuNmhtaCtz?=
 =?utf-8?B?YUhLajM5TEU0bEdKL0RDQWkxYTlEVTFkNCs4ay9NRlBVMkdaZ3FGWC81ZG1x?=
 =?utf-8?B?eXhTT2RlNXBYYS9VN3dxamt6eXFvL040a2F5ZjRJa3dpYUtsWU02QnBBbDkr?=
 =?utf-8?B?TEdhUGlDNG9XOWR4S0dXcnhESXlBNGRNQ2RuKzE1ekdHclVKSndpWFhYRVFR?=
 =?utf-8?B?UWcxMG1UeFZrTFFqQXFSR1lreUFJbmg2WU9pbDFXREY2bzBLaWNlSTlhZmJ2?=
 =?utf-8?B?TWNOdnZvcGhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDNvdzlZdlYvM2R6aVNLN1hMK2hhNm9BNDI3OURqdUxpamJMeXh3V052WkUz?=
 =?utf-8?B?ZXJSd29JRTVidHdLMEVzK0ZZUkRPVjI3RHA2a0NmTitTODZZbjh0NGNISXU4?=
 =?utf-8?B?Nmw2NEpLU3JqS21FbEh3ZlFHM0Fsbnljd3RVRzVpcXpybWZDYVNaNSsvZkll?=
 =?utf-8?B?V0Z3cno4NFFaZUdUcjNma2FjTm45aldKcDBFa2F2Nnpud3VKMVdEYktRTWxI?=
 =?utf-8?B?b2s4TzROSmQwNWgvcC90bFhRQ3dicnVnbEdQanJXTDRqUHQ1Z1ZRaStwNXgr?=
 =?utf-8?B?REU1SGYzOG5ibjJ4ZUgwcjZvcDhOTW5jR2FwMWNHbFd5WS9PYzk2SGZBOTZh?=
 =?utf-8?B?YXNwcmtSM0FnTHhTZElCeko4VkxaWElFSy80QVJ5Z1pESERnR0U2OEFBcFFE?=
 =?utf-8?B?eUFYVFB2amYvSmRIeVQxNng3SlpYQUhnb1hnTTZyN2ovNWtBK2xKRHltRGc1?=
 =?utf-8?B?Sm13R1Q4SUQ3WE1uQURhMlFDcVZqUzJZYURGcXFEaXYxK1Nnazk3K3pZQUp1?=
 =?utf-8?B?aEgxQjl3OHVlNEhZaGFvcFlUaW9vYWJaUjQ3OWV6V2dpVkRJTFdhaC9NWm5Z?=
 =?utf-8?B?T1dLZmJmTVI1YUdySUhDOWl4cEtqL2pRMUxIeFZpRmpoMlQxTmY3Vjd1cWhI?=
 =?utf-8?B?VWhudEVxQnNOWXdOMmJFNStOcUhYTlZQZGszOWtZbTlsWkpiZytub2tEV0hG?=
 =?utf-8?B?TWtad0dLODlmbXczU1JmZVd1OGFiYkpOeHZ0OER5a2NxYWRaVUo1M0ppUDY2?=
 =?utf-8?B?ckM4S0FJK2MyUERHSVdzdmprbkRyWHFaelpQem1QU3RFZVMyaExLR1ZpeC9Y?=
 =?utf-8?B?aDZFZVJnS0dFZUJHeHpXWjJsc2trZWdJZFhMNXFDTThacmx3eW9FeDR6MU56?=
 =?utf-8?B?RVNJU2NVcTJTalh6Y0kyVWpyMjdZUE5SamhvaGtJU3piVTMxTFdFblY5clRv?=
 =?utf-8?B?cDJ4a2xVU0JjNmZIZXB2WWxSbnhJdUI0cHdhSTVmUjVhK0xwZStnVWRwblpn?=
 =?utf-8?B?TER6RUVYdHB2MHBsVllXb1dKMytFZ21lVkI4V2loZ2NFZ1Rxc1Izd1YwTTJi?=
 =?utf-8?B?L1dmekR2b2hmTGR4TWNsVy9EWVlpNzg2OW9tblZZeHdaMnVyZFVDdzZXdTB2?=
 =?utf-8?B?dUFlanU2MmpQMFBCNWFyMFF0V0kwbmVMUXBYdEF2akJ3S0gwUHI5TTBmcDVO?=
 =?utf-8?B?UzY5WGl3L2JuM1JoZERUdGJzNUVLZkVNZnlhWWdKZnRaTmZBMTZnZ2c2MXht?=
 =?utf-8?B?NUdvcnFCZ2RhclV3S0pLcXRJSTJNVWVoYzhybjF3UFMwdStvZTRtT1NFQVpM?=
 =?utf-8?B?aThmK1FMK0Mwd0RUKzgzRGRBWVM3ZG9mUHpzcjBsUkxqTGxXT3EzbVRYdi9i?=
 =?utf-8?B?U1hFOEhUMkMzbFRmc3hIZDBOMFc5b1o0SkxZS0dJVmlnTGdjamFaUWxmN3Rm?=
 =?utf-8?B?S05nNkVYbTNidlltWTRuNExCbzVUSGdTaTFNZlAwR3h0TFJFdXcvQ0ZiVUY4?=
 =?utf-8?B?Y2VLcEU4di9ZYlpWU2xTQXFmTWhNNG8wVGk1NzFDajVPVndlczVZWHdETlQ5?=
 =?utf-8?B?SWxiWXQyS1ZMeWhoS0lpSEJ1blFsZTBqVTJlNFRXNE5RRnBEU2xoVllnbld0?=
 =?utf-8?B?NjJsL3dEcVdTeFgzdFlCd0krS2JYQ3p1M0o5Q0JvMDRTQkREQkdHaThsdlRo?=
 =?utf-8?B?bExyZmxScitwTzVxVjR5SCsxMDNqR2l3MFVxZVNMTU5pOTA3K0dWOUhJRldp?=
 =?utf-8?B?WXhjSitQeFgxYitYeVo0RUQ3aElIQjFtajl3Y0N4aCtndE9nSUhDUzRwUVdn?=
 =?utf-8?B?NFR0MjlmNzNKVjIyaGF6QjhDb3I5RzJ2cTFUdVVoYXh2Vk5BcitZdm1BUjdn?=
 =?utf-8?B?RlpMWElLN0RZYjg3SEpKaVNIcHI2dFdKRnhPSXFFSDVQQTh0RG5teFpUTkFR?=
 =?utf-8?B?SEN2MjRYZlZvbWxLaXdGSjh3dzFLbFU0bnJ0V0dWOHc4cHMxUEdzMFJnelJk?=
 =?utf-8?B?WnhaZGNSblowVEtGZ0lPK0J1NXJCbmZRMTRscEQwWjZLd05FK2tuUTJiWi9a?=
 =?utf-8?B?Yk5YUDNlVm9CQ1piWVo4bmkvVHRBK2hXb3krS1FJMmZEa201STFoWmNTNE5W?=
 =?utf-8?Q?oPf0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d4f659-ec6a-432c-9057-08ddcff87af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 06:07:07.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VAg7qf/xyC7Lrn9QuqJbdjlPupMkkY7IV4VVZKLnJcM1FhyeixuQPHRhLy1UggnVcGMK5cfSMuEnzGmP/pY+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IGlteDogQWRkIHNvbWUgZGVsYXkgYmVmb3JlIGRl
YXNzZXJ0IHRoZSByZXNldA0KPiANCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBk
YW5pZWwuYmFsdXRhQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMNCj4gaW1wb3J0YW50IGF0
IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBP
biBUaHUsIEp1bCAzMSwgMjAyNSBhdCAzOjM54oCvQU0gSmFja3kgQmFpIDxwaW5nLmJhaUBueHAu
Y29tPiB3cm90ZToNCj4gPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiBpbXg6IEFk
ZCBzb21lIGRlbGF5IGJlZm9yZSBkZWFzc2VydCB0aGUNCj4gPiA+IHJlc2V0DQo+ID4gPg0KPiA+
ID4gT24gVHVlLCBKdWwgMjksIDIwMjUgYXQgMTE6Mzg6MTdBTSArMDgwMCwgSmFja3kgQmFpIHdy
b3RlOg0KPiA+ID4gPiBTb21lIG9mIHRoZSBQQ0NzIG9uIGkuTVg4VUxQIGhhdmUgYSBzd19yc3Qg
Yml0IHRvIGNvbnRyb2wgdGhlDQo+ID4gPiA+IHBlcmlwaGVyYWwgcmVzZXQgdGhyb3VnaCBTVyBt
ZXRob2QuIEZvciBwZXJpcGhlcmFscyBsaWtlIEdQVSB0aGF0DQo+ID4gPiA+IG5lZWQgc3luYyBy
ZXNldCwgc29tZSBkZWxheSBpcyBuZWNlc3NhcnkgYmVmZXJlICYgYWZ0ZXIgcmVsZWFzZQ0KPiA+
ID4gPiB0aGUgcmVzZXQgdG8gbWFrZSBzdXJlIHRoZSBIVyBpcyByZXNldCBpbnRvIGEga25vd24g
c3RhdHVzLiBTbyBhZGQNCj4gPiA+ID4gc29tZSBkZWxheSBiZWZvcmUgJiBhZnRlciByZWxlYXNl
IHJlc2V0Lg0KPiA+ID4NCj4gPiA+IE5pdDogd3JhcCBhdCA3NSBjaGFyLg0KPiA+DQo+ID4gVGh4
Lg0KPiA+DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkg
PHBpbmcuYmFpQG54cC5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWNv
bXBvc2l0ZS03dWxwLmMgfCA3ICsrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lt
eC9jbGstY29tcG9zaXRlLTd1bHAuYw0KPiA+ID4gPiBiL2RyaXZlcnMvY2xrL2lteC9jbGstY29t
cG9zaXRlLTd1bHAuYw0KPiA+ID4gPiBpbmRleCA4ZWQyZTBhZDI3NjkuLjcxMGZlNGY4NDQ2NSAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvaW14L2Nsay1jb21wb3NpdGUtN3VscC5j
DQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstY29tcG9zaXRlLTd1bHAuYw0KPiA+
ID4gPiBAQCAtNyw2ICs3LDcgQEANCj4gPiA+ID4NCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9i
aXRzLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9lcnIu
aD4NCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4NCj4gPiA+ID4gQEAgLTM2LDYgKzM3LDkgQEAgc3RhdGljIGludCBwY2NfZ2F0
ZV9lbmFibGUoc3RydWN0IGNsa19odyAqaHcpDQo+ID4gPiA+ICAgICBpZiAocmV0KQ0KPiA+ID4g
PiAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gPg0KPiA+ID4gPiArICAgLyogd2FpdCBi
ZWZvcmUgcmVsZWFzZSByZXNldCAqLw0KPiA+ID4gPiArICAgdWRlbGF5KDEpOw0KPiA+ID4gPiAr
DQo+ID4gPg0KPiA+ID4gSXQgaXMgcXVpdGUgc21hbGwgdmFsdWUuIHVkZWxheSgpJ3MgaW1wbGVt
ZW50IGlzIG5vdCBuZWNlc3NhcnkgdG8NCj4gPiA+IGFjY2VzcyBNTUlPIHJlZ2lzdGVyIHNwYWNl
LiAoYXJtNjQgdXNlIGNwMTUpDQo+ID4gPg0KPiA+DQo+ID4gMXVzIHNob3VsZCBiZSBlbm91Z2gg
YXMgdGhlIEdQVSBJUCByZXNldCBwcm9wYWdhdGlvbiBvbmx5IG5lZWQgMTI4DQo+ID4gY3ljbGUg
b2YgaXRzIG93biBjbG9jayg+IDIwME1IeikuIHRoZSBmaXJzdCB1ZGVsYXkgaXMgdG8gYWRkIHNv
bWUNCj4gPiBtYXJnaW4gdG8gbWFrZSBzdXJlIHRoZSBHUFUgY2xvY2sgaXMgc3RhYmxlLg0KPiA+
DQo+ID4gPiB3cml0ZWwodmFsLCBnYXRlLT5yZWcpOw0KPiA+ID4gdWRlbGF5KDEpOyAvLyBpdCBt
YXkgbGVzcyB0aGFuIDF1cyBhcyB3aGF0IHlvdSBleHBlY3QsIGJlY2F1c2UNCj4gPiA+IHByZXZp
b3VzIHdyaXRlIGhhdmUgbm90IHJlYWNoIHRhcmdldCBwbGFjZSB5ZXQuDQo+ID4gPg0KPiA+ID4g
SXQgbmVlZHMgYSByZWFkbCgpIGJlZm9yZSB1ZGVsYXkoMSkgdG8gbWFrZSBzdXJlIHZhbHVlIGFj
dHVhbGx5DQo+ID4gPiByZWFjaCB0byB0YXJnZXQgcGxhY2UuDQo+IA0KPiBJIHRoaW5rIHdlIHNo
b3VsZCBjYXB0dXJlIHRoaXMgZXhwbGFuYXRpb24gaW4gYSBjb21tZW50IGFib3ZlIHRoZSB1ZGVs
YXkuDQo+IA0KPiAvKiB3YWl0IGJlZm9yZSByZWxlYXNlIHJlc2V0ICovIGRvZXNuJ3QgcmVhbGx5
IHRlbGwgbXVjaC4gV2Ugc2hvdWxkIGV4cGxhaW4NCj4gKndoeSogYSBjb2RlIGNoYW5nZSBpcyBu
ZWVkZWQuIFRoZSAqd2hhdCogaXMgb2J2aW91cyBmcm9tIHRoZSBjb2RlLg0KPiANCg0KVGh4LCB3
aWxsIGFkZCBzb21lIG1vcmUgY29tbWVudHMgZm9yIHRoZSBkZXRhaWxzLg0KDQpCUiAgDQo+IHRo
YW5rcywNCj4gRGFuaWVsLg0K
