Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39C331A61;
	Mon,  5 Jan 2026 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635912; cv=fail; b=tPlQZ4tUeTr9GtVZLv1hytlMw06FjW6b/556ycgQ/yhZb7TMxtRkaLUt5hi1CkeCh2harYOYOW1HOcLgKJtBo1HMjglzWirVCZHyEX6tjhy2COkGZqmrgWls5aQH5j2/uRofpX/r8HVyNKCTK4lPKl/F0XB84w5VExqUAGoqf7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635912; c=relaxed/simple;
	bh=tAXmykJx8isf6bzh3bRPYGlqszb+fj0cF7fvGbxHF9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XikBnEMqJcEpXpKdt5CBcoFR4c5XvJ9N4s7eHXWAGXesjUK17SbvfsG+0F2FGhkov+BjAhuK9kGPGcoubMeY4pwnKShMa74REZmBvx2tgqkyvNgQx4Sj0C10fJBxR4nd7k5Xc0yv7h9j9MZ3rzJlfNlz6ti3XHaW8yYCAA3d/zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=O66Yj2ER; arc=fail smtp.client-ip=52.101.56.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="O66Yj2ER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGq/gYlqqA9S4COTQQF4CxVBrTfeDBQaU5Whd3EpzjVvJhJ0/vtvg+vyl3sw9WL0y6LhXnhiW3nieh90bP5wLIVWK5Qv2+8gqWA8uj8XRNQ47WhLPVUqo9wmjDZhJThR9Mpwh092ff+nrle1AkaUcMOO2VSSYP1jsOnHGA3aaMFsXwIam4iaWXk2vGj+wou2TdTMTNRlRqw6VdwDy3NSBAULQfZQ47JhALqCtaEur/bXsY1YM6sa2dioEoe7cKbcPlCmHk2ukq7O1O90uTDJJ8XRq5cE4CYs3XOQqKdM7Td7HR8r8CAMDWzu4JD1a6tEj1PmxbHtdmNJk4pxK+Z3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAXmykJx8isf6bzh3bRPYGlqszb+fj0cF7fvGbxHF9Y=;
 b=PhXBWxLb7WIUZSPkmkm1+8Z4SR33+obXXdkGqHFuvKBFlwlsh9f/AHl2davaSooYWoNrR7UEFbRKapiSQlgpbTuXx5lQVXfnmzmgyoizRPyAXBP760Yd+MRFEd3lqWuiWAW36XcVUESTJol5Ybi2JJts/jYaAUEcJHnuCnCnPP6s4ZVMfMCi3T5TEgX2zTkl2YW2QsM4Scfy6Zd4vcQ/DOOzh1zwsaJZ7QvYMO0pbmGp7mUrHnQ8Uf2inxcih9WvSax+ouf/SdJYew5vU51PVyjVhs4bODnsgw9eEQx0+UOBgfSh/be36BhKPedUOw3DqWDedYQrjYevBkrDZCvMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAXmykJx8isf6bzh3bRPYGlqszb+fj0cF7fvGbxHF9Y=;
 b=O66Yj2ERpuOAwVxvxdtqU+NdaYdAVmZ8GB7MSuW2IzZ3XxFBvAFtyC7F6Pj2gQBtEJVpA+SsHreQdAZrSVxbbRxTq3lA59v6QLUuuyLj28OiVxVg1EZA9aKsJLYhM1RJt5Hjv0hp4fzlxDODGINdSlJNXvjsTOMfpeD8H/XZOw1I87LsdBPQwojFkisc9zsRbmreaCwq1DZMNhhLBplNKxEYH1ymTvINsxVrihRQUiBU+YYk3Fp45IgCSp20YkSh7YScyxLeekA7G4eR2LU8otL8RaiJ71ym1ZbddHf6h9Ep4KDiozzTm4+euRaMKDeplKWmRTpNJrJ3d1A6usmLPQ==
Received: from DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f28) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:58:26 +0000
Received: from DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 ([fe80::2254:e323:e6c9:9d5f]) by DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 ([fe80::2254:e323:e6c9:9d5f%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:58:26 +0000
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Varshini.Rajendran@microchip.com>
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
Thread-Topic: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
Thread-Index: AQHcKOGs3+hBmjOHH0eMABKEphFd1bTLmo2AgFyI5QCAB7PggIAUsMKA
Date: Mon, 5 Jan 2026 17:58:26 +0000
Message-ID: <9b97b3b8-9e46-4482-8420-ebabe00254fe@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
 <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
In-Reply-To: <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF67FA1A8F8:EE_|PH3PPF7DB70F9CE:EE_
x-ms-office365-filtering-correlation-id: a3c4eec3-ff06-44a1-04c2-08de4c8406b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2RYWnNsRlNxbngrNGtBaTQ2ajNkanJvOFEwdzJUakx1WkFlS1RzTXVNTjNp?=
 =?utf-8?B?TXhkcXRxcFlKQ2lYTXJrQUt1NXFxV2xsUlZ5WmlwaloyVjBTMk1NbjNlWXZY?=
 =?utf-8?B?bnVxMEdhZmFnemRySXZMSGY4c0s4ZHB1a3NWZ3owVGdXNFYxRmYvOTFhOW1C?=
 =?utf-8?B?dWIwT3AxTEpMZVJCbkhoenFyc2dVV29QeHh4U2I1U1Q3ZzZsMTVEL1hObldL?=
 =?utf-8?B?dGFVTzA5MmFDQWFLckphcUhWMGRhbFZQWVR5MWZrOFBpU09YdFh2SUFlTk1r?=
 =?utf-8?B?Q2c4ZHFvUDlMOEZLbjVtMHhPVnk1cjhoV0FYaDZMQXJleXdJVXBZUTE2Qkxm?=
 =?utf-8?B?U0F6T3c1SVMxMXYzUmUzejBLa21Kb1ZZK0lxY1hlKzk0Q0lJSkt1aDNRV3po?=
 =?utf-8?B?YldTcGdiZ3JteVdqYzNUN0xCamVqeFNLWHdTM3l5MnA1eGtpOHJ2NDhuUGlE?=
 =?utf-8?B?NzF1b1dqSWlrQXJmQWlrNkV6RWVvVnRHTHNvN3V2SzQ5S2VNb3JtVzdiZlh0?=
 =?utf-8?B?MyswVk13c1dLTStoSUg4UERQaVZ4RzkyT1M2RytxbzJTMmVZV2szVjI5bWpm?=
 =?utf-8?B?ajUzVUE0YTc0ZkNqaXV1WktPckQydXdIV1ZFWkYrWjBRL1NLTGpSVFFrMkFS?=
 =?utf-8?B?TjFuVUxyOG03dkZkaEx0Mllod3JNNEowYnVSeXc0U3N4dWRTdEZlb1dQcnJu?=
 =?utf-8?B?M3FVMzhIdjJ1VlNra2ZwWTI1cXlGMnNicDg1dVNaRDBvbUI0Z1plckNkczhC?=
 =?utf-8?B?allVL1pIemFaTWFGb0swdUhRMmRKOVJBbWwwVlNVejcvSy94YTJPTWpQSGla?=
 =?utf-8?B?d1FKT3VKV2VIS1hISnNySVVyaTNiSmVmVE1wNTlENkIyNHNZcHFXbnRFMFRZ?=
 =?utf-8?B?SmJWY0FPMk9uanlnSkV3bGFGM0NvOWhhWEtjK1ZFb1ExUnNjeW1WVkpyNVpi?=
 =?utf-8?B?NFY1Q0pxV2YrTitEY3kwTFBrYWdLcEtlUHNjSEs1Qm1BSkxuWndweGxuM0VI?=
 =?utf-8?B?QWlFM0xITnNleGZmci9QaHFvNkJ0QmZNSkZWWVM3QW1YbE5FK25KQ2Z6T0pn?=
 =?utf-8?B?TWE0d1JxbnlQSHNxYjRiUjZrbytNVmxnSUg4alZvekpsaHBQU0tpTld4T3JW?=
 =?utf-8?B?cDByTFkzalo0S2w5dlFXZmhCbEt0Uzl2V2NIQ0MzaURwNE1xaDRXN0kxdjB0?=
 =?utf-8?B?bGlCZ0grb20vRFQ5NkVIeWJMT2tYNnorbjB2TEt2d1gyaDVTc2pLc0UvMmwx?=
 =?utf-8?B?UmdaRStlU2JFV0JJVEpWNFVkRnNzeEZ0V0QyNjBORHc2aUIwYm1FbFBuQTlT?=
 =?utf-8?B?cm9CZGJjaTZMRE9aWVBINjdlRnc1ajBDVUx0VFB5Y2lwUEJDODV5eldGN1RC?=
 =?utf-8?B?NFlxUi9JUGtWNGtUbzdIMkdML243WFF6V1VVdUR5alk3Z1h5WkttdEg0QkpG?=
 =?utf-8?B?eTNkRmIyQSs5Q2xDRzdJVlo1djEvK1hoeGJrcXZpdVI4bzdiMjh1U2dIanFX?=
 =?utf-8?B?aytTcW44aE40OGUzQjJhNEw1WnIwS3N4bUlDclNZWlVhSlF1K1ZwNTN3dU8x?=
 =?utf-8?B?dUdxNFRISmlVTzlveUdxRTFJMFUxK0p6a04yQkpjME5DaWtvQ0YzSnhNQndH?=
 =?utf-8?B?dzdNQnFrQi92Ujk3V0NhM1dwUTRyTFN5QzlUMS9pNmxXNmJiWmxhWnR5bC9X?=
 =?utf-8?B?VjBnNXdGZzBUY0dPZVNSMU5zN3grZTRUaHBvRmF1bTBRaGVrMVhPQktPZUo2?=
 =?utf-8?B?UGdCL2ZIYWxldlRQeTdtdkpXZmNQTkgvbEZvNnVrMG9nSGszVG9ib1UzZ3kz?=
 =?utf-8?B?aHQrQjArOXRnK3RjZVFzaFpWbXp4SXdpZEV0dXU0MTlRanpyRWRPUnpuRkEy?=
 =?utf-8?B?bE0zQ3ZyanpCK3VsckxxT3JBRndkOCtsWG9wWHgyVHEwMTNYOHc2VXlVK3gv?=
 =?utf-8?B?YlRZNTQ4cHl0R0JYbSs1TjRacUM1OWcrMVpyNkRHeUdPVmdKNldmRjl3MWlJ?=
 =?utf-8?B?YjZZK2VHUXFHY0twdi9zZlZ3QVhMSTBpNW5icXM0Y0pmZWk1Z3dPblluRUt2?=
 =?utf-8?Q?JFA7JD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF67FA1A8F8.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T01vYXhHSGVCcHh4TkF1b09QckVydktnOVpMbG1uSzI0NHlIcXFqVlVWU24y?=
 =?utf-8?B?ZjBRNDVqWFZKNG9VRGNWdG1ldzlYM0E5TElYdm8zcEI3QmpYK2lBcjZlK2U1?=
 =?utf-8?B?ZElLT3FBR1NyUDZSNDZzRjJMNktBTmplYmhxcWxVZkY0Y3hGOGhHUEd0SkVM?=
 =?utf-8?B?M29VQVpJQlhHYXFSY3ExeGZGZkQwWURBVUNST3JPZjJwOHB5Zkd1QVZ1d25S?=
 =?utf-8?B?YVNCWFFxWWRhS1ljajc2OWlORFFJdzB1eHRheElkaVhQNWRTQVZjKzFTYWFk?=
 =?utf-8?B?RkM0Zkc2SFIxV1Qwb1RZU2FDNk9zN0dsMTZ5QmlmVXlHNXh5Vk9aWXlPT0Y3?=
 =?utf-8?B?ek40TU0vTFN4cktGaXB0MWtZdVZhQ3cvSk01aHBrcmdoQ2FNVjE2RzNxSDN6?=
 =?utf-8?B?WnVndHZ3ck8rYVlkbk4rUDBzR3hyVUs4L3Y0TCsrc1E1YytzRC9xYnVmaUhl?=
 =?utf-8?B?WlM4VUFZWTEwNEcxNzdHRVJGWElxU1hmLy9hd2VJSWlOL3Z6N21JUnJrTmdO?=
 =?utf-8?B?NU9OWVdycmlZYWJwbjBBN2NGc0ltRkFzOGNZUUpxUnNuekZJTE9zcDZjQkRU?=
 =?utf-8?B?SUp0d1d1RUdvekdwSzVIc3ZkSXZRdHZZWm1RaDUxZVZjWWJoc0VVYnlodHhF?=
 =?utf-8?B?QmRIWDgwa2g3a0xNVDJGOXQva3dScTBpc2U0SmpreHZaR2wzbjVmcEZrQ1RJ?=
 =?utf-8?B?amtnaDRzZGxEbzM0OUs0K0dYYW9WR2crMk5uMFpGVmFYdHZFL3pVN3B6Q1po?=
 =?utf-8?B?bTVsa0RrNkFUS05RZ1FaVnJmTy9zS1cxZWlzSVZLNEFoQjJGRFJXemdWMG1Q?=
 =?utf-8?B?VXJkM05NSWtDNXZVSzlWYnk2dWF2ZmRTVFdydnBLb3NLYUJpazRScXh0WEx3?=
 =?utf-8?B?V3ppdVE0cGhtZHpyWWFmVHcvTmxudWhLZ2U0VmtkUkx0bTE0UnVNcjhrdGxu?=
 =?utf-8?B?MXZTR2hGeXE1a1k4UUZDNHhrVE9LZzlEU1Q3NC9JTUJpelFjM3BYcFN4REZM?=
 =?utf-8?B?M2xRWnNCVHNpOCtkL3NPRGFjUlR1WGhJMFZCRXQ1dVFLaVBzcld3ZjFQenZt?=
 =?utf-8?B?T1A3aGw3ejd5M3Azalo1Tm1tUFU0Ujlzdm45eVM1QVhtWktYZ0FmUkNkZlJ4?=
 =?utf-8?B?RTJick1pZ0FlZGZaQTFkL1hTWldRVjVBcktiWW0rOGNucWxYNndTQ0x2TTVi?=
 =?utf-8?B?UGw5cGZQclVlOEpOTnczai80UWptdk13K1d4YnAxUkZWS3d2SFpzNFNCYXVj?=
 =?utf-8?B?Z3MzSVVjQ2dnOGM4R3YyUm9zZnp5cmtuM0VGK3Era2Z1eERGVzV5ckhkL0Jr?=
 =?utf-8?B?Tmc0QTg5UFBOOEUxdU8wQWtVZHRyMTFNbjRxVHYzMFhoRHBhbk1vMXg2RnVE?=
 =?utf-8?B?di9YRzV2aGwwLzZHeEJUZlJvdFZNcUZTTHJhcEZtbWxUcjBmUk9wNTJmNGJW?=
 =?utf-8?B?bnU0TWZUSDljLzVybmZVZmFlbnJqckg4R2dvQUZUdW9WbUFmWUIyOXRMSVJz?=
 =?utf-8?B?VDI4OW45Z0dmVFFvbjdiaEFqSUNndWh4K1ZPakdDeTYvb1U3Y2VhWU9tZDB6?=
 =?utf-8?B?U3BPb0dzL1BLME9qWjIrSS9oZGFyV0xZMWlxUUtSU3A3R2Y4Z0xZdDZTaUNU?=
 =?utf-8?B?UFkyblNBLytNb05rcjhFZjQra1I4cElRclByMkVTcWlSTmpVNmxTUHVpWXFC?=
 =?utf-8?B?UEgyU2Y0cGZ1Y0tycUtqcE9LVm1zZmFUN3ZNdzhHOURLYjlPNzRnSkNLV1Jk?=
 =?utf-8?B?WG5idy9IYktQSzJrRnhua2NEN0JWUFJDNjFqd1B4dGJaVmQyQ0h2ZStqeGxX?=
 =?utf-8?B?VFhBQnFNMmpieXpRVXdsaGdvTWJNbEt5Q2JMUDg3Q1FyQzJSNWc4QUVVWXFi?=
 =?utf-8?B?N2tZcnZzbmpTanZ5RDVUWTVvcmRwWU1SNHBjZnppejdkczFvZGhHY095UjVt?=
 =?utf-8?B?V2wybVVrN1pwK0c4QUFyVnVWQTNsWUkwNlh6d0JaWDUxRnJ0MFlVSXRmMHps?=
 =?utf-8?B?WWxvbFQzV000ZUo1Q0E5RVBuMmwzOTdDb2doRFZmNzNWdEZqTDJTaXpQU0Zn?=
 =?utf-8?B?Mk14RnkrVzNqRTZSaXRmOWhEbXdma3dlanNWaC9Ham9aVVhhSVU2dXh0dVlS?=
 =?utf-8?B?eSttNi9LaHpoMkFtVk1wUDBlWlFRdno5QjhiTjQ3bjZabkorTGFLMVNVTVhC?=
 =?utf-8?B?cGI1eU1nMG41TU9VTVVFaXJLdWhvQjArZFR4K3BQNnpEYmNmSjlnRnBTOHVZ?=
 =?utf-8?B?dFZ0di9Eck5FVjJDMUw4cCtDcTRtVHJzVUlZUGgyaGVEVXVlT2w4djRnVS9o?=
 =?utf-8?B?MDdaZ1pvU1daVFp5RWZiWmV2M0hkMGkyUS91N0hjQ2tUVnpxVEp6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5B9028FD38998439DF0A3904FA3A908@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF67FA1A8F8.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c4eec3-ff06-44a1-04c2-08de4c8406b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 17:58:26.4280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBOJDtUivDZTYxT96PRL8Kff3ApmGIkNrD++Yug0SRoUQkd9aelJaFv7UAiiFJfWUzc43VLgtjpBkqxIh7jVtbTVGDe7Ei8eiXD0EXLr1DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7DB70F9CE

T24gMTIvMjMvMjUgMDc6MDAsIGNsYXVkaXUgYmV6bmVhIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
DQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDEyLzE4LzI1IDE4OjIzLCBSeWFuLldh
bm5lckBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMTAvMjAvMjUgMTI6MTcsIENsYXVkaXUg
QmV6bmVhIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+Pj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+Pj4NCj4+PiBIaSwgUnlhbiwNCj4+Pg0KPj4+IE9uIDkvMTkvMjUgMDA6MTUsIFJ5YW4uV2Fu
bmVyQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+Pj4+DQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBjbGtfcGFy
ZW50X2RhdGEgaW4gdXNiIGNsb2NrIGRyaXZlci4NCj4+Pj4NCj4+Pj4gQWxsIHRoZSBTb0MgYmFz
ZWQgZHJpdmVycyB0aGF0IHJlbHkgb24gY2xrLXVzYiB3ZXJlIGFkYXB0ZWQNCj4+Pj4gdG8gdGhl
IG5ldyBBUEkgY2hhbmdlLiBUaGUgc3dpdGNoIGl0c2VsZiBmb3IgU29DcyB3aWxsIGJlIGRvbmUN
Cj4+Pj4gaW4gc3Vic2VxdWVudCBwYXRjaGVzLg0KPj4+Pg0KPj4+PiBSZW1vdmUgdGhlIHVzZSBv
ZiBfX2Nsa19nZXRfaHcoKSBmb3IgdGhlIHNsb3cgY2xvY2tzLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPj4+PiBb
cnlhbi53YW5uZXJAbWljcm9jaGlwOiBBZGQgU0FNQTdENjUgYW5kIFNBTTlYNzUgU29DcyB0byB0
aGUgY2hhbmdlcy4NCj4+Pj4gQ2hhbmdlIGhvdyB0aGUgbWFpbl94dGFsIGFuZCBzbGNrcyBhcmUg
aW5pdGlhbGl6ZWQgc28gdGhleSBtYXRjaCB0aGUNCj4+Pj4gcGFyZW50X2RhdGEgQVBJXQ0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBSeWFuIFdhbm5lciA8Unlhbi5XYW5uZXJAbWljcm9jaGlwLmNvbT4N
Cj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZlcnMvY2xrL2F0OTEvYXQ5MXJtOTIwMC5jwqAgfMKgIDIg
Ky0NCj4+Pj4gwqAgZHJpdmVycy9jbGsvYXQ5MS9hdDkxc2FtOTI2MC5jIHzCoCAyICstDQo+Pj4+
IMKgIGRyaXZlcnMvY2xrL2F0OTEvYXQ5MXNhbTlnNDUuYyB8wqAgMiArLQ0KPj4+PiDCoCBkcml2
ZXJzL2Nsay9hdDkxL2F0OTFzYW05bjEyLmMgfMKgIDIgKy0NCj4+Pj4gwqAgZHJpdmVycy9jbGsv
YXQ5MS9hdDkxc2FtOXg1LmPCoCB8wqAgMiArLQ0KPj4+PiDCoCBkcml2ZXJzL2Nsay9hdDkxL2Ns
ay11c2IuY8KgwqDCoMKgIHwgNDEgKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICstLS0tLS0t
LS0tLS0NCj4+Pj4gwqAgZHJpdmVycy9jbGsvYXQ5MS9kdC1jb21wYXQuY8KgwqAgfMKgIDYgKyst
LS0NCj4+Pj4gwqAgZHJpdmVycy9jbGsvYXQ5MS9wbWMuaMKgwqDCoMKgwqDCoMKgwqAgfCAxMSAr
KysrKy0tLS0NCj4+Pj4gwqAgZHJpdmVycy9jbGsvYXQ5MS9zYW05eDYwLmPCoMKgwqDCoCB8wqAg
MiArLQ0KPj4+PiDCoCBkcml2ZXJzL2Nsay9hdDkxL3NhbTl4Ny5jwqDCoMKgwqDCoCB8IDIxICsr
KysrKysrKy0tLS0tLS0tDQo+Pj4+IMKgIGRyaXZlcnMvY2xrL2F0OTEvc2FtYTVkMi5jwqDCoMKg
wqAgfMKgIDIgKy0NCj4+Pj4gwqAgZHJpdmVycy9jbGsvYXQ5MS9zYW1hNWQzLmPCoMKgwqDCoCB8
wqAgMiArLQ0KPj4+PiDCoCBkcml2ZXJzL2Nsay9hdDkxL3NhbWE1ZDQuY8KgwqDCoMKgIHzCoCAy
ICstDQo+Pj4+IMKgIGRyaXZlcnMvY2xrL2F0OTEvc2FtYTdkNjUuY8KgwqDCoCB8IDI0ICsrKysr
KysrKysrLS0tLS0tLS0tDQo+Pj4+IMKgIDE0IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMo
KyksIDQ5IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+DQo+Pj4gWyAuLi4gXQ0KPj4+DQo+Pj4+IEBA
IC04ODIsMTAgKzg4NSwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2FtOXg3X3BtY19zZXR1cChz
dHJ1Y3QNCj4+Pj4gZGV2aWNlX25vZGUgKm5wKQ0KPj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqAgc2Ft
OXg3X3BtYy0+Y2h3c1tQTUNfTUNLXSA9IGh3Ow0KPj4+Pg0KPj4+PiAtwqDCoMKgwqAgcGFyZW50
X25hbWVzWzBdID0gInBsbGFfZGl2cG1jY2siOw0KPj4+PiAtwqDCoMKgwqAgcGFyZW50X25hbWVz
WzFdID0gInVwbGxfZGl2cG1jY2siOw0KPj4+PiAtwqDCoMKgwqAgcGFyZW50X25hbWVzWzJdID0g
Im1haW5fb3NjIjsNCj4+Pj4gLcKgwqDCoMKgIHVzYmNrX2h3ID0gc2FtOXg2MF9jbGtfcmVnaXN0
ZXJfdXNiKHJlZ21hcCwgInVzYmNrIiwNCj4+Pj4gcGFyZW50X25hbWVzLCAzKTsNCj4+Pj4gK8Kg
wqDCoMKgIHBhcmVudF9kYXRhWzBdID0gQVQ5MV9DTEtfUERfSFcoc2FtOXg3X3BsbHNbUExMX0lE
X1BMTEFdDQo+Pj4+IFtQTExfQ09NUElEX0RJVjBdLmh3KTsNCj4+Pj4gK8KgwqDCoMKgIHBhcmVu
dF9kYXRhWzFdID0gQVQ5MV9DTEtfUERfSFcoc2FtOXg3X3BsbHNbUExMX0lEX1VQTExdDQo+Pj4+
IFtQTExfQ09NUElEX0RJVjBdLmh3KTsNCj4+Pj4gK8KgwqDCoMKgIHBhcmVudF9kYXRhWzJdID0g
QVQ5MV9DTEtfUERfSFcobWFpbl9vc2NfaHcpOw0KPj4+PiArwqDCoMKgwqAgdXNiY2tfaHcgPSBz
YW05eDYwX2Nsa19yZWdpc3Rlcl91c2IocmVnbWFwLCAidXNiY2siLCBOVUxMLA0KPj4+PiBwYXJl
bnRfZGF0YSwgMyk7DQo+Pj4NCj4+PiBzYW05eDYwX2Nsa19yZWdpc3Rlcl91c2IoKSBjb3VsZCBi
ZSBjb252ZXJ0ZWQgdG8gdXNlIHBhcmVudF9od3MNCj4+PiBtZW1iZXIgb2YNCj4+PiBzdHJ1Y3Qg
Y2xrX2luaXRfZGF0YSBpbnN0ZWFkIG9mIHBhcmVudF9kYXRhLg0KPj4NCj4+IFNvIHRoaXMgd291
bGQgbWVhbiB0aGF0IEkgd291bGQgcGFzcyBpbiBhbiBhcnJheSBvZiB0aGUgcGxscyBhcw0KPj4g
cGFyZW50X2h3cywgYW5kIHVzZSB0aGF0IHRvIGxvYWQgdGhlIGNsa19pbml0X2RhdGEgc3RydWN0
IGluc3RlYWQgb2YNCj4+IGZpbGxpbmcgdGhlIGFycmF5IG9mIHBhcmVudF9kYXRhIGFzIGl0IGlz
IGNoYW5nZWQgdG8gaW4gdGhpcyBwYXRjaCBzZXQ/DQo+Pg0KPj4gQW5kIHRoaXMgd291bGQgYmUg
ZnVuY3Rpb25hbGx5IHRoZSBzYW1lIHNpbmNlIHBhcmVudF9kYXRhIHBvaW50cyB0bw0KPj4gY2xr
X2h3Pz4NCj4+DQo+IA0KPiBJdCBzaG91bGQgYmUgc29tZXRoaW5nIGxpa2U6DQoNCkkgc2VlLCBJ
IGd1ZXNzIG15IHF1ZXN0aW9uIGlzIHdoeSB0aGUgdXNiY2xrIHN5c3RlbSBvbmx5PyBJcyBpdCBq
dXN0IGR1ZQ0KdG8gaG93IGxpdHRsZSBwYXJlbnRzIHRoZXJlIGFyZSBmb3IgdGhlIHVzYmNsaz8g
T3IgaXMgaXQgYmVjYXVzZSB0aGlzIGlzDQp0aGUgb25seSBjbG9jayB0aGF0IG9ubHkgdXNlcyBj
bGtfaHcgZm9yIGFsbCBvZiBpdHMgcGFyZW50cz8NCg0KPiANCj4gwqDCoMKgwqDCoMKgIHVzYiA9
IGt6YWxsb2Moc2l6ZW9mKCp1c2IpLCBHRlBfS0VSTkVMKTsNCj4gQEAgLTIzNSw3ICsyMzUsMTAg
QEAgX2F0OTFzYW05eDVfY2xrX3JlZ2lzdGVyX3VzYihzdHJ1Y3QgcmVnbWFwICpyZWdtYXAsDQo+
IGNvbnN0DQo+IGNoYXIgKm5hbWUsIGNvbnN0IGNsa19odyAqKnBhcmVudF9od3MpDQo+IA0KPiDC
oMKgwqDCoMKgwqAgaW5pdC5uYW1lID0gbmFtZTsNCj4gwqDCoMKgwqDCoMKgIGluaXQub3BzID0g
JmF0OTFzYW05eDVfdXNiX29wczsNCj4gLcKgwqDCoMKgwqDCoCBpbml0LnBhcmVudF9uYW1lcyA9
IHBhcmVudF9uYW1lczsNCj4gK8KgwqDCoMKgwqDCoCBpZiAocGFyZW50X2h3cykNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5pdC5wYXJlbnRfaHdzID0gcGFyZW50X2h3czsNCj4g
K8KgwqDCoMKgwqDCoCBlbHNlDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluaXQu
cGFyZW50X25hbWVzID0gcGFyZW50X25hbWVzOw0KPiANCj4gVGhhbmsgeW91LA0KPiBDbGF1ZGl1
DQpUaGFuayB5b3UsDQpSeWFuDQo=
