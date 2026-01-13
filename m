Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA02FD7A0;
	Tue, 13 Jan 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336365; cv=fail; b=VG0eTHlYXmqkbCI5n+jVBp+lN5MbCS9YF/Dqg+I+qK1kGzGj5DCnN3ljqxUDdVYXkJ+lvCnP8+tu9sF7Uy0CMt9p3yGTqCovxlGAoJyYn6TSeEvsuIiqhPP/6xZu8mCNO+VbTb/XV9E3168Qe8nZyQJwRlS3s3++8jCTr+Z5dGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336365; c=relaxed/simple;
	bh=7EccuYev/0kbMEmaSKE+KHYBrqApeoUhBpPhZ3Yoke0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=be0UEsoAEpKfQ3Xxe5JTex2YtumI5/ED+82crAqGFm3WoCi+bsVHnSUorJcmBBjwyubEgcwRegt4zZ7Urc7rm4dhj5KuC4loDgPI0N8XthwsVfxogI0x8FkP5Ssi32TB/ZHvZwzqkCsF1C+Vfo4zm3uq3AoTcxCFN70F03Y4k0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SL5kQ2+V; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SL5kQ2+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSPbONUPRZQTzYzCGATKqN4mOe0p4TVr2oy9Q4COfiG8wbD7/J+LQbaxWWrCVS+MpkVEtIdTFQB8NUZzDsE57dFqJWx7yKhhQiJoRM43sZQJreTIv3xZiTVbqG3QZaQkLa6dx8fZNSNqKbuSas4Rlk076D39lWaLGR097+cjy/Exxl3zaEXukate1Z678RqNc2ZcPWEHu6UZ5k/xf0FFjUlZ11p433S/2n3yjaa4LJvB42wQmhe+bSS0PAHr0oVVxKtzhUhtaRtLMC9ec0b/i4Re7/+p38vTt/2WeKd5i8+E5ySQZCZ3i2rD8qkJp/rMd6IiIuSmHS9E8v7DVY75Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EccuYev/0kbMEmaSKE+KHYBrqApeoUhBpPhZ3Yoke0=;
 b=XpqSZGBR3bmG8P/gGb6fvjdsJKjPu7lH2hOCkrAVpPaKoQYzYv3ctL+ZY5/iB2lcmupBXC1i/doFfr0ywoNpRNYjRBfNgj79h9SW3PQmO+b8ultuDmLpsxlYF2UbVwUu1CWp+hyJzbCWg9Bs47BmdRiSGR4L5XcMCaUE7CR6wmKLiDzoK9i+CwLE5Z81UAN8sOS8OpBNhEnH4pvqy3bg9aQv+taR96p6Xk9raCcqmuxmuLOzVi8YHvy+dgXu9bsWQDIp/SL1xxq2vzXxLWKfF+eKqOYKzKFpSm8ubEx5Arl8TPfKHE67sHrPed1POkdC/igQF60HAe0wDNSHdfKR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EccuYev/0kbMEmaSKE+KHYBrqApeoUhBpPhZ3Yoke0=;
 b=SL5kQ2+VCa1SMhAl8nT7ZTI7+TCh9rFeMzDwRek7jwte+yCI2T0FrHXYKEvjgtqEb1nX8sMqLV7iM8WkapS5/3EaDzCEG5j7ZpovtQ+Oo0LFyk6rHb62MAuuiYQgdkRxkJAA8TEDDD9dGKGGRH51+SpGPYikYnmv2TKKEIYf1s8Ke8sRfKp1J+QhivlZ5hcYRADnGkIwPe3HY0sCRC4G1hZMbhvTJTK4VuTgNjTbVCq9M1HGkQ6QPp6z0E88IG325iNgK4LPSN5pkJQZ7k1tRyLlxJrp75ua47r9zYGjGRhQopMzC+rPxux6SdQPydRlMVfnExP6R1i/PdotiSQNaw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8292.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:32:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 20:32:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Thread-Topic: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Thread-Index: AQHchJxOLOCqip8yyUWEhIn1U52wzLVQji8g
Date: Tue, 13 Jan 2026 20:32:36 +0000
Message-ID:
 <PAXPR04MB845935829DD27756D7F1013F888EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
In-Reply-To:
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8292:EE_
x-ms-office365-filtering-correlation-id: 188e24cb-aa4f-458e-d1cd-08de52e2e3b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGYwY3RFeXdyRllJUWtiVWFZZlhHeW1SSUR5OGthVkhkNnlYMGMxMWlIWmZT?=
 =?utf-8?B?bnZYNlA2Vjl4aFlaSm5kcVlaU2dkQTV5Q0diUmhyU0crcWdTbkwrSDdDZFN3?=
 =?utf-8?B?d21sY1lpYmppOW5iMS9MQWdUcWZwYmRsbS92dmd4YjBIMm5uR0Y5QXVBVWcx?=
 =?utf-8?B?cWt4Z1F6NkxWcElXZ0NCenJUOTUwYmgwSWdjblVhajBmR1Z1b3ZRYUFHSjls?=
 =?utf-8?B?VWhNQ0xCeDRZOHhnUE1VRUFEYUJQZG45TVdOblVnOWptaEpKeVJnb2Z2Vnp3?=
 =?utf-8?B?TytRVEllMHhPaHprR3Jsa3VKNjFJNEZIK2VZZjFDNDhtaXRrVk5ISFFCaHpz?=
 =?utf-8?B?WlArVS9Pa1Uxd2lqbytrT2VZUWVYeWt0T1Z5R2V0Mkp3bGozTmpVdFVxVy82?=
 =?utf-8?B?OHJEaGN2bU5NZXBvaXZKakRXMFhNNHJ0MHZIZGZtK2tpWWlVd3h6bDVNTHdl?=
 =?utf-8?B?a2ZZUUFITFlvSk13dzUxZnlaNlplK3NrUERxMTVENEY0c2xVOXFNSVU4d056?=
 =?utf-8?B?b2llY3NxOU9ENUJJUnE3ZUpOODNTUk9jZDh3aHBEMmlxaW9HUHdDZzNWTHZJ?=
 =?utf-8?B?VkRRYnlBUUNCNE1aZmQwSUVVSXcyUzJKM1JuWnMybmk3dGFMUjBzc2ZHMkpp?=
 =?utf-8?B?NjhyZW5ZTlJPeVdHMXVUTkxlQ3VjeU9GbDVmV3RJZkFrUEVJdlZSK3lZQTh3?=
 =?utf-8?B?V2ZhUm9HZUdCSHc5bk1kVm4rc1hmVmdPa2pyMkIvQjNlSXVqaitwTnZWS2lZ?=
 =?utf-8?B?TXZjenMvMjhOdW9iQ2hEaThJWDhwNXJwWCtVODM3MnZuZmdrYStHaEpTc01u?=
 =?utf-8?B?cjdDR2pyaEF2WGFXMGZRaEs0bjUwWXZEZVNRN0lWYWUwSkVOZ1MvY1c1Ni93?=
 =?utf-8?B?Y0c3YjhlUFo5dno4MHI4U1o2Mkd0NDlLaXd5TW5xSXFjSTVnczNnSTZaVVNL?=
 =?utf-8?B?ajkyeTZ2L2R2L0IyNExONDlNY2Z5RFVVcWlRdFJkWis4cDEzS0JQUVJ1aG9V?=
 =?utf-8?B?b1BEM2NyaHZZdlNsN3I3RWtUdVR4bkt4WGtNOTRwRVlrTDZwTzFIdzVtUlJq?=
 =?utf-8?B?RlJ2eUcvTXdvOG5kVDlSY0s3UkYzUnFYb2Erd0J3QVFuQ2VoTENvaXk3aGJ6?=
 =?utf-8?B?Q1hIUG5US05BVmpJZFNzMjF3UFZySDAxWXdSVk9CdFA2SWsxaENOZU81NEJP?=
 =?utf-8?B?VS80ay9jMmVib1NjaTk4UFloSmQ3Vmh5YUFuUUtBdy9ndk4rN05IS0NwN0JK?=
 =?utf-8?B?c01pL210MnFPUVpGUHNJOG5GbEM2SjhUVTFhWEZlVzJSQ3FLMDhQMXF2QnZN?=
 =?utf-8?B?S3A4R1pTTU80Z1ZBOFlCVTd6b21SVWhmZmRhZmYxUVh5L2dyTXgwbVg3NEw2?=
 =?utf-8?B?U1lvaC9sbGpFRkljL0s0RmthcGdoZFB1V1VrYml0eGxSZGpZM1VnV2M1M0xE?=
 =?utf-8?B?K0M1RjZ0R0lzZGFoOFpaZGw3R1B4VXFLeG1OTWRpdWFKTXlCaC9CQmpFT2ls?=
 =?utf-8?B?aXB1MUZJQXR6YlJSQmRaVDlnOFM0VGtRcHRBbFFQUDVBU0ZwZWVGQ2xKN3dP?=
 =?utf-8?B?QWZHSXVYRkg1RzVtTkp1dFhXNkhjZkpxZWtGMkE2M3dIVmIzVndYMTV6RUNa?=
 =?utf-8?B?akZLWDg2RVRkZHJpa3E2OU9CcHR5SDZaVWhLV2cxZ0FBazZMU2VvdlUwSlZM?=
 =?utf-8?B?bXVEVjloQW0wUkVSNEhiUE5mL2VTZWs5WjhiWFJ4MFlPcG1OK3FVOWVHMHpi?=
 =?utf-8?B?TWwySStqQ0hQY1l6d1NxUTg2dEl0OWUvMXhZQzFUbDBMeFczVkIwcHJMOCtw?=
 =?utf-8?B?SjNuRmc5VFlVLy82Y3U5b0VhL3VBQXJ6M0FVanA2ODZwWVEvYzM3cU0zSDFF?=
 =?utf-8?B?aXdrbHRCSkRsRk9rR2VyQ25nY3dFMkxVaXAvYnpVVnZ0dXUxKzVLbVpOMGE3?=
 =?utf-8?B?YWdxeXdWdVdaT3RZRUFOZ3Rzb2xpcGlCTkloSVFnRDBJTkIrKzAzaG9zV2l6?=
 =?utf-8?B?ejFWcmtRV3NZb1lsK3BoUTVWdlMvb0ErT2IzY0R3cUF0RkpUZDJqT1NnVC83?=
 =?utf-8?Q?fbmSW/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWNIMDJ0eU1ub3ZhVlU2MEU2b1dSdkNPbk9OV1V3QndDT3lpcTVuSWx2bWN2?=
 =?utf-8?B?d3ovRURBVGRqN2Z2bXAzTW9MUGlpNE9PV2xKTjFjdkd2MlRJTEhjVVZqNjYx?=
 =?utf-8?B?cmZaVDc0cWkvcUZMY0ZvNHZxblNxNmQwOE1DZG4wOUdLay9CUE1ZS0NpZ2F0?=
 =?utf-8?B?bU15YmZGZFhWMkJlT0Q3NTA3VUxMVW4vNlQ5MExxTUNrVXlPYmJpcXVCU2JD?=
 =?utf-8?B?amQydlVsVTcweFVDeFFLZjd0ZUczU1UxYlFmVFVweEtuOGwxKzNWd1hwUUgv?=
 =?utf-8?B?a1o3V0lxamZpOHc4MjF5MnJTN255UENaS1FTeUFROCsvM2drYUhGQ1UrWTI0?=
 =?utf-8?B?YjBUOU4wb0ZoWjNvSkoxU0toZ0xxR1NpL25xQlh2aEsyNkJuOUZuSEcreWgw?=
 =?utf-8?B?SHlkenRqNDg4ZGZBS2h6VU1Bcm9NVFRUZzUzZ0szNXg2bjhXOU85VytVUmMr?=
 =?utf-8?B?ejR5RlJjUHQ4bkovazQ1TjlEU2RVelVaQlpOQlZYSlpTV3R4WW5PSmtiUi9m?=
 =?utf-8?B?ZmdvZkN0ejNIckRZeUNVUkVadno3aGhkR1AxUEVPK0ZmcklZR2xwQkVZbmdh?=
 =?utf-8?B?TU5GUkRENVZvczErdXpGeXZxSDFUVzdYbnRSYmU1dWZmWlZWT2N2YTA0K0Ja?=
 =?utf-8?B?aWpuWEF3dWo1b3ZrMU5QU0J4MXhCMDJnajVPekpjTjJvWVcrYWhGVU9mRVZQ?=
 =?utf-8?B?ZHJ1azJXU1pON3UxUEk2dHRkS1UvRVN1V0xEQi9tY0htMmV0emNJbnZVa2ht?=
 =?utf-8?B?b2VZSWg0VllRbndSNElrdHltQWJuV1dYM0dQOWlYbVhVSFQzaDhKZmU0bEd2?=
 =?utf-8?B?U1RXSEVCcWI2VHJWMmVUREJESzJQZ0dKZmhSOE9lVVZMRlB0Z1psTDRpQUFC?=
 =?utf-8?B?NVl3cG5vNms0azNYeDEwemlRRjZpbHRKeEFBRThqdVFnOTVLbjU0TGhjTGhT?=
 =?utf-8?B?VWJsRzJ1Qi9NSmRxYU9SUHpQU21NQzJTSmE2ZkpnUU1kcTZBblRPUjlQOXZ2?=
 =?utf-8?B?c0R3alFSalZkbzZ6Szh3bEZXM1dmc0IvcDJVay9SUFZxWU5hOVl4TkpSVzNW?=
 =?utf-8?B?dDFDNlRKNVhxSDFtNmtrT1dDT1lzdnRTWTFaREpIVXdTMENkYzlYNGpwRXd3?=
 =?utf-8?B?U083SURhVXU0OUlXS1VsTTI5SlJIN0tmUytxbzRod0thQWRuVVFtSzQ3OGN1?=
 =?utf-8?B?VEdUd1pSV3pUZFpFM0lEVjAxNXN4M1lTTEVKUFhOWFpXZDFsNU9XU0xvTUY1?=
 =?utf-8?B?R0k4V1pONFplb3FMUm54algyY0NkRVpSbHVWcHEzaWlaVkdLa2tvd0xCZTQx?=
 =?utf-8?B?RFFRL24ybmltQlVaaVJJRkNUVVVKNk5KdXl4YWtTRGYwWFNtbjJMNFRsdkd5?=
 =?utf-8?B?QlpjVnJIdXdKd09OS2VkaHdpMEFtNDBxaUs0ZDgvekRVbE10RkJaU0pXS0g1?=
 =?utf-8?B?dnR4aUJCbVNQd0VKYTRxUnpnVXAyUkZuY2xhQWluZncwRm5BbGZuTWJXTElE?=
 =?utf-8?B?KzAwc0pLZWlhYUNsSTZlMTZUa1JtQzhvS1Brei93U0Z0ZEcwOXdFdjJqcjRw?=
 =?utf-8?B?NFk5VzVWek9JcHBWSVE3akR6bUtUbGtYMEhNVUhTWTVWM2JFeXZiMVZQcThM?=
 =?utf-8?B?QzZaYTVRK0tDbTFvOUttUjBwdTBZcFNNcm1NUmJaenlObVlzSGdCelpmNXZT?=
 =?utf-8?B?YWk2bmpadU1VSlBnbUl2WkdNYmU2SjJNR3lwSXZLbmx0RWdjcDFQQ1dqdDh4?=
 =?utf-8?B?cnAvQTFRUG5rMDJncVF4YWhlbWZoMHZxZ2VqKzlIRmwveVBpRllsNjM4R1Rm?=
 =?utf-8?B?Q1ZGbGFoTHRKM1pkNEpKNlBWYmhPL3M1OUdJN1JaSlZSSTJpQnBUelJhKzEz?=
 =?utf-8?B?ZHRxMG9VY1B3QTc4ei9kdjRFMGtNQ1ZHU0xycmxNUGFySFZWaW5QVFFlYUpo?=
 =?utf-8?B?Q1hKSEhYbDY4ZGIrTUorOGZ1VWdleHMyMVRPcmpZYmM2SDRQY1RMZnoxc3Vy?=
 =?utf-8?B?S2tuTFZkSlRiWnVjQmR5ZFJnMGlBTHZOcnk2MXpaOUt4UHI0ZkJscjBtdUdX?=
 =?utf-8?B?OFlLUE5kY0MwcXJtNlVqTldmalVUem9iQ3JaY1VxdHJycTZ1V2UweDZMQS9Z?=
 =?utf-8?B?OGRTU3g4bVlkTTNNVDZXL0tUalRzRzJhT25EQy9SMlQ0cVJ5TlFuTEJVOGhL?=
 =?utf-8?B?UlFsdUlINWlESDlEYVljeWpKa2R6eTk4SnhuN2ZjMzduMFZ4elFlY2VwSTZv?=
 =?utf-8?B?bkJCSmdTVlcvVlk2WDA4S1FRYjBhUm9lWm4rZnBXRkpYOFBEaXhKbjRnbmsv?=
 =?utf-8?Q?U43ynbGp+L+Mh2qw40?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188e24cb-aa4f-458e-d1cd-08de52e2e3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 20:32:36.9123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EM+v8PW42k2Mr3AtDfSxrYaedbHLRyMn7+db3d2fB0NnWSgtjQaVFf+ETcqMemjVpBKtRwBrWWKZIQ6VbanQyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8292

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi8yXSBjbGs6IGlteDogZnJhY24tZ3BwbGw6IEFkZCAyNDEu
OTAgTUh6IFN1cHBvcnQNCj4gDQo+IFNvbWUgcGFyYWxsZWwgcGFuZWxzIGhhdmUgYSBwaXhlbGNs
ayBvZiAyNC4xOSBNSHouIEFkZCBzdXBwb3J0IGZvcg0KPiAyNDEuOTAgTUh6IHNvIGEgYnkgMTAg
ZGl2aWRlciBjYW4gYmUgdXNlZCB0byBkZXJpdmUgdGhlIGV4YWN0IHBpeGVsY2xrLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4NCg0K
UmV2aWV3ZWQtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0K
