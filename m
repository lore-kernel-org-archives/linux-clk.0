Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2098.outbound.protection.partner.outlook.cn [139.219.17.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716DA212550;
	Wed,  9 Sep 2026 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916031; cv=fail; b=PX0M6Q86bpcR8oNikXC+TAnp+u1wHrTWvIW7rUkgdCvPJZKt8kPO7QEPGrPVZQFvW4uc2Wk35rcHuGjpiITWuHRhGTb6hazJw7/scYGiMK4b/fi8Q7wC8V4HCU3zCqf93XjNEqBXqVYxXga/chPrIH5LZA5kbtGCXCQv9YGTeBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916031; c=relaxed/simple;
	bh=N669kPGW0D6a45FuH2f9KlS3i17cKUKpV0k6ooE6Llw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Il7KsSbsbYLdXP3qrUPtScMTEq/DSIWNLhFJKSM3dP3mUwe5FB2Vb8W1WV4l4jH/7lKGmYWFsaoiTQXS6CEIRGu6sEzPdXx/DI1J1ST1uqtdm+2PeQ4KGML8Qh6QrRLPA5DWqk4Mgt2Pjkd9uczlBh7SY4ZuGoPDW5HSut8LVEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvBryjVFbn5bK+2qJXJX6IIzM7dvoMCeZzrF2wi5TDGPtR/IhBO9gOEepkL4T9BxyyOzJ3BnegH76Flv6SlIt5kXyiNUfJLXvpGJuiZZXA8EJqgJfhgMViZCPa4YIR1FU9Mk2EbuuyH4ZO2iDYgJuoVONJLlRHsg9mfqwpCf81qeLHWnYSUMRWVjX5CCqCupQSJVaD445kZyW/dDsezH8oXwX76yKFjVdeChCewDesXDqduVkzG5ipDYSUN7tMnZeEb+CUtmpFv6b6mgKo2dqz7YG7CJZKytp3vIsd3HJw9D/rzexLGsMeXf9VXzP3t8DbPLOhEBnY+2eBot/prIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCbHmxkW1SkgQR5Fs/stp2NffvJmdAb7fG+fRQ9hhRE=;
 b=TavUL4sQkr67DaJ3akwnHMDK0Zttr6LFZXqSOi1Q9VuYQqndrUeMtMX14EoFMZkUU1nIYphnhg8q8gko0C2Jfks+wwA0/evSShGfReOWY/IZc2TKsYNWq0YpAfKHV5WM7UVpXNOOrsF5K2WvYaCs45bkS+ovG+srY9u04BdT7OdrYDL0j38tVme94aQpV+Dwv1Yv2mlLWs5qmRHvjO/WAjhV1OlYW0WPTdyHxOJrVbEhrKPeYhKnKPIDE37DZSD4YGiUQzOaYV0qz6AD/QdUSLPAOwNaVaM+1F1E9jLKih9FsZ5Q3QeBirHVpKtlF1cqfZP2jbTP7GyyA14T+TxgBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 01:06:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 01:06:53 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 0/8] Add StarFive JHB100 syscon modules
Thread-Topic: [PATCH v5 0/8] Add StarFive JHB100 syscon modules
Thread-Index: AQHdNtN5aILj5WmC4kSsj3qvjZqSHbbFLWIAgABT9pA=
Date: Wed, 9 Sep 2026 01:06:53 +0000
Message-ID:
 <ZQ4PR01MB120221899CFCBDE5FD430206F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260908-plaything-clutter-a72865edd110@spud>
In-Reply-To: <20260908-plaything-clutter-a72865edd110@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
x-ms-office365-filtering-correlation-id: 247cb8b6-74dc-4a8f-45cb-08df0e0ea307
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|38070700021|4143699003|10067099003|56012099006|22082099003|3023799007|18002099003;
x-microsoft-antispam-message-info:
 4/EA8beZWXeW8m2OSDTxJU2+3DWd597YTfKpKpXzrIqJB7SEsW3qGZlB4z6iKqhOzr7lnv45zVxOIX1HT4YC0q1Tz1DKItj7a6+hVPQfb10bYnvByq+mNyGZjgwN8ZVmopagyBzSbOWIoVUxXndKFGd4F3PRirvUbWBsclrJcdXkMnOaM7C6orrBZmTaouTrnEcXqKi83COZbfjM43IGWJ6Bwz/PKHxRb1d7ICBXp2xrALu97La2tHc6WY7cpz2hrGMaoVpuZN41IH7b1R4ifNe/LGHzcHOlN5tncxG9UdDP9fEAsg+JJMsBHTuHDH+yJxUgsUqhLlwRVv5FfakDwX8+D3qLZ8IDIeO3MxnNdFo5ZvA6/9Qpa9OcgypBmJQx/2fYIBZ/9HUjlRaKVnBcGxi0KXuUFvVDOUvat1zf1y5+HLLQrzAs4/SEyRvGZS6RqtjPVwAOizHF9YJN3S1xLlnlZs2cf24JNhs6/DJp9g7psVIvLM2tFB8STMU1fn6IffLBDzLi0J7hqmkWTHOhMYWx9chmmRXrEaC9xjxCsG6bx9N/jr5WDFdq3LN7sX5a
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(38070700021)(4143699003)(10067099003)(56012099006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ew+AKBHiCHgckAqK6WgjtMlY0NRR+nJ1t3zctuQpgBTpuJhk6aXGY8qePlUn?=
 =?us-ascii?Q?il3WQEsfxwJBfT1ajNL6MzIOrSAOAVnHeGCv3QUGzPeAjqAsQTJLk8O7ZT4s?=
 =?us-ascii?Q?ndkxgYyYWdElTwGFjCLQV6Rt8JkvVP8R42iyUB8zpwfMwX01Qt2JDKJBqORf?=
 =?us-ascii?Q?sxONRKsqpqrGYZxE+x7gYDCz/qvDFsOSWSPSP6axPldIkDi8AnSsXmFZdAFN?=
 =?us-ascii?Q?MMlrs929LShWGv0u3LcAiUYZ+Zw5+0Lcfv11WDIhEziXmzxKspw/OE8Q73ev?=
 =?us-ascii?Q?E3jkQtv2o3Sgly1/fXuAwcxvSuthDwOArItMFR94N4xQR/Ap28bbOhx1PnmV?=
 =?us-ascii?Q?ECssA2zGWrCNCeF7u1lkujazzim3OGw7vToe/I4iZnewF4UbCIbyV7+3vxi0?=
 =?us-ascii?Q?jeajmiFsuCfCxhridVFS/9LMJLU6Hqx13rTTwYJwJkW8sOPaHqqFIxSIQJ/3?=
 =?us-ascii?Q?4YKOyFgzHgrhemWyhJOfwAhYH9DBKi90AvgxnebTfzaJRDZaAxYzHr19tWXq?=
 =?us-ascii?Q?K5yU6gaR0T3UuB1wNz83W/XJQ5cK6qGKANCyFU8mfaaGBjX0j7nhHXH1+PEB?=
 =?us-ascii?Q?bfsBFQGJtX6R0CcxsmM2UUJFTR3iTfZ49bXz/Npf7TWXe6OMPBzH8svFhkn5?=
 =?us-ascii?Q?WDU4boEbfYP82RGyzFWUlojWKCucXMXmV40cjAzOvI6Tw8qWVcmpipTLmU1+?=
 =?us-ascii?Q?GKEq0e+VY9gA7uM46RB0Grt60YIFFtIkLojDUnQyTHZ5r7b3tDAejgR8YSks?=
 =?us-ascii?Q?WV0tJdp+Reu8gV+6c2xI2p4SPWCXd6kevjfhYz4JmqRGB6xuZ+4y2JZpMp/M?=
 =?us-ascii?Q?fdIsSfxw4MRoMA8yZWDo2+vafxeOzNNaS1e4TlSzx2s8O+4l8TTrGmNYZAPp?=
 =?us-ascii?Q?xLOv6WFMRQVGmXSi+CdXljeAiBBRu7jJhvyqDAPeB3psGKk9s0mJ9P9Ta2N0?=
 =?us-ascii?Q?+4n5CJSkVcEBT9Gwo04IH6L3ls3hWVSEXvMk2fCaPUxv/Mt0jAEIE8MxA30B?=
 =?us-ascii?Q?naYsMWEgf0SfeKvkse6tri6XnV/6pDhG1e/5cuznOTzuyAeLRLEENKAajco/?=
 =?us-ascii?Q?i2I5XD5cLDSSDpe1FXsQN/P+fw3UvWLlg2FTF5JqV2Exnifc7WOTafFjFKs2?=
 =?us-ascii?Q?liz4PczM67wDgA5XQdGXHG6CenN8kbW/Cjx6T47Rc3YMZfSxe9PNsUj1qJyM?=
 =?us-ascii?Q?nbr5CEglRIZUkfCptpchxW0WRhOYa8ZMeWK0Ye3Ph+3Fvz9ayFR8RWr3Q9vo?=
 =?us-ascii?Q?0BAPOfPWJrJSJ5nEss4u87/KAk6G32v5A95U84+//twDoJtlM20SzzPHzGum?=
 =?us-ascii?Q?sNVdoM2vn2e5g3Vbrtj0df7AnK+NrGcmWXHU9cN+5mIQQY1+AW3jVObfLtWB?=
 =?us-ascii?Q?9F6CKy9Fjt2jZgM9sjjZX/UMiP4+qNMGWOqm/zb5n6uTAlKSufwTTlyOlyuT?=
 =?us-ascii?Q?BRgHgOttEaSpir5dUZogOd9FM8Zemjx6yy4XKQw2cHETxeKjta0LkIubh1+m?=
 =?us-ascii?Q?7jzqUi85qn9hYkNnko4kKG1eASPB3j5jxLN3+aO/RZslHADhDF4C5uEPB/6t?=
 =?us-ascii?Q?forQItuwCW3pLipjBBEVBRsfRWQ2BScCN1lLIDYkw9HjoBtD5Ye5nXRdlpV9?=
 =?us-ascii?Q?n0ZdTL1ybgKIm80EHZzmt9yoxtdGkAMBdd+pLJv8cyLwdOobzL+e0x8UUp+h?=
 =?us-ascii?Q?Ii+1LxaO2daiuzlrHLxbeu3hJOWu9gSWV0rpBncOGpWBND84Uyunoovcdxgc?=
 =?us-ascii?Q?S41WKXv3ZMj1knyTOIl9cv8QFDvBnAw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 247cb8b6-74dc-4a8f-45cb-08df0e0ea307
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 01:06:53.6789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVXWOnd32MF8ElOZTW63YxyvUwUV+zDiHKk/zBO5+HsP+xcXCuF9gmSCTSJthiRrfAzrr1MFOztTGR2sEb/h7/GMs7hx5uuVEeDgJY+s9DMwjq5Dcwlia7xzAYT+dvkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Hi, Conor

Thanks for the review.

> On Fri, Aug 28, 2026 at 02:56:00AM -0700, Changhuang Liang wrote:
> > StarFive JHB100 has many syscon modules, as listed below:
> > - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> > - pcieep1_ecsr_syscon
> > - host0_syscon		(Host0 syscon)
> > - host1_syscon
> > - husb0_syscon		(Host USB 0 syscon)
> > - husb1_syscon
> > - husbd0_syscon		(Host USB device 0 syscon)
> > - husbd1_syscon
> > - husbcmn_syscon	(Host USB common syscon)
> > - gpu0_syscon		(GPU0 syscon)
> > - gpu1_syscon
> > - b2h_syscon		(BMC to Host syscon)
> > - h2b_syscon		(Host to BMC syscon)
> > - vout_syscon		(Video output syscon)
> > - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> > - pcierp_syscon		(PCIe root port syscon)
> > - usb_syscon
> > - npu_syscon
> > - per0_syscon		(Peripheral 0 syscon)
> > - per1_syscon
> > - per2_syscon
> > - per3_syscon
> > - sys0_syscon		(System 0 syscon)
> > - sys1_syscon
> > - sys2_syscon
> > - strap_syscon
> > - sfc0_filter_syscon	(SFC0 filter syscon)
> > - sfc1_filter_syscon
> > - sfc2_filter_syscon
> >
> > Some syscon modules contain PLL, reset, and socinfo nodes
> >
> > This series depends on the series:
> > https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@s
> > tarfivetech.com/
>=20
> I tried to apply the soc patches, but they depend on this so I can't.
> Can you get someone from Starfive, ideally one of the listed clock mainta=
iners,
> to review that series?

Okay, I've already pinged Hal to help review that series.

>=20
> If you look here, about half the patches are missing a review:
> https://patchwork.kernel.org/project/lei-conor/list/?series=3D1142160
>=20
> If you do that, I'll try to sort out getting a PR sent to the clock folks=
 for it and
> figuring out how these bits can go on top.
>=20
> Thanks,
> Conor.

Best Regards,
Changhuang
