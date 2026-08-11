Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AC426438;
	Tue, 11 Aug 2026 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786447870; cv=fail; b=NE6uYb+/CWI0U1WT9BlmKBDmTfpW7jWAZqOIa5kfMZjdnSzNU1Dwnq18BiMSiFiuGqZHnXzssVrDwX+c02z3+0M1HCJzae5fef4SnLdrXyxvBFwdqmQXUIEMPVjxLc7CQC1oWXn4/vR40waBxuYh4UWrHKIFG9zV8bUted+LzyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786447870; c=relaxed/simple;
	bh=7DcvowcfNDe9GrXgb4pVuPCMSgCXJTTSkNxyZumTfrM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c7IFeFSn8Z87Ddk9uCJBH833PO6re8J6k6OFcPg/IjQexewMjip+9k9iMRQejzqXsZv620KO5WLtcJPH53pn7/iWUoWTPLbp2Dw91Axvuc1YnYgySuGEtKSgIjzLzKfmXfhKk66kT2Cfo+xS363lIbq5CkPyg+xQ9bMRL0IbZr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbVH9lNGBMZ32v+ftwDcvgnoxXjL9pdK8RS/tZMhz42FZ8H2eihVnx3hkpY+wp620WhGPZkVOUxiJhMpW0bTK/aVKzKc8kULhfZNWOWdJw6CIzzY9u0mvyWfPW6UYX20lRwTXnXq32rlvYrhtNfgZlDV4GLzWZpp5BnnEovYdMB07kqm559saQMpkW2pwxlaKQm6EdWZ0FZXpYyqZg7dxeI+9asxrLn8bV+g0casp4nQOTCfHlYhHZmejgSiJqvGoy6rzX0AbNXgznyiwcD2P2laKiuo65X7HzxgAKzaLzdnue5phrL99jxrXGnb6Bp3LazOg1ywxSZkkq6W4Sun3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DcvowcfNDe9GrXgb4pVuPCMSgCXJTTSkNxyZumTfrM=;
 b=QY4rXpHgV/0uors3ESX6+cvVCLw8nrq86Qm+oTy3cXZTrnfCrUB0QiN03XQpj6AeTkIAph3bwRDa2K6KhLs7kxCb2ThPPMtRX9+WfeUZiWmVdQEwx5/21OU/hff5XWOfHMqe6/n/wEkNs+Dv2S4//dfhtijUsL63n6dbBonqR0vVP80ucbJV5avWQ/nsPaw1+BYMPPiK3KWR+3BYX1+HI+xFAoOxIBK5pg/O6q8BbNRFWi2X9o+73HIa04aP6xRK9uhOJs/ohH0iSbiufmzOBY4VrLFnECjfoMYV1/3vms/zszL2jlkhlLnOBFMbbMkLcBgDzxLLMg6/4IYQalnijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:15:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Tue, 11 Aug 2026 11:15:57 +0000
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
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHdJ6GLvS5NNuAYikeWCGx3U49v07aXebyAgAE8kDA=
Date: Tue, 11 Aug 2026 11:15:57 +0000
Message-ID:
 <ZQ4PR01MB1202021D10801575B515F9A6F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
 <20260810-dislocate-neurology-f40943216b3e@spud>
In-Reply-To: <20260810-dislocate-neurology-f40943216b3e@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
x-ms-office365-filtering-correlation-id: d811eb8f-df7f-4182-3e62-08def799eae9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 x1ej1dw1NPJIii8QnHtil/kp9ORGs5bmtwcoLZwghsfuJMeajeNkqzmuSlfITuWYK9xdead7uZWiHrwiPWspoBhPVyp/2OI/KCnhe1lghhVeeRkWts017BpvaDbq1+dLORND4uxZPbVZMfS3b1IoKfObmdK90G6WjjEIxWfNh4LK4uwBpK3hPiRkDSa7D5kh5Uw8o/qgEvJwDanezERDqa6HKvEqC1J/oPxR/awke+mW+L1REx9PmmBPw1ZPpz2QIiz3j2PBOp/OTs10VePbgRVt0aDA6K0zw+XmUE/mKmD0yh7aXyV1yyycf0/3qV0v2IJpXKa/vfEiUzWCuwJ+xNic7BEp3Zr1cm70rpg+3BJcUN5OWO+yO6PmAwr1ueIToJg01+XED8P24c0Uxercz3D3Vb+iJtOTdnoMD3Y24DN2oxcvjqm54cfxoSqdrFyx3jGdt2LxjnjSk+cBoni1li5zq+BPwXehjnIieDVoC+Hej0K5wFnV60U4StnEqEeegsigkXaXVJjg9Fpj7jA132JjGo0QSY1P7YchAivjkvSC+Baodgfvgstfa0A/euHZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eQGPbIeWKXcrx/57QPbgVag1M9GWKICp0x/2vugIJX3u72aUR6aiiPgQMK4w?=
 =?us-ascii?Q?7hgOhflk+rukGo157OIS9mf7BLIfIEqKzkochcPb/LNybJfMTjnPJPT5NbK8?=
 =?us-ascii?Q?3vKIz191u1b597H7jcMDGOXC6JNDbJa8NrJV2KvbMlGRTq3ko1OBECXM1Emr?=
 =?us-ascii?Q?ocirmDwHNlq8YTe7TEKUnA7ec2g2E5ylGCoMTJkpkbDbKepFDhNR2Fq+RsE/?=
 =?us-ascii?Q?Tl4Wjnf/1W7uFoiRLLarTHqktgQciOPu6Sti7q1d7gnrXNLnLPMkyfGJCTEV?=
 =?us-ascii?Q?I4hswMe/e3wtVKNwEsO8AZ6po1XlAd5VoehO44Fzp1WCvOMbox+Aut05xnZr?=
 =?us-ascii?Q?5MoNXfdQKdccIZEeXNTZ5/gOBB5aL5tm8hHpE7ZewwYfSxG4GG2wFrZsHKhj?=
 =?us-ascii?Q?y/xKfac6fCbKd8OpXJ7AtO//779cFEWELTBc4ShtgWe9shXoWnFRDLKouCW1?=
 =?us-ascii?Q?5CnE2g1jz1Y8cyNoWik2BcIWLXBQ0H/aGE3hC5Gm9dQ4wvoWC/LJbkNAPDoH?=
 =?us-ascii?Q?w1LAvpmU42hJdZmia64Ww8bdKhQmXRUpNtZ/aOtW/YHfcCJF8iSgM9+xy/Ai?=
 =?us-ascii?Q?oz+n9VNovlJ2X3dM0GJdAp/ITNwxiAzHQwTTbslv/NurKYY/Uta9lPbvGAOo?=
 =?us-ascii?Q?7iYoTGPDbtUTqCsMyUaVFcPIvEzQl0UTJveE2VI/wcp++WFvkWueUZWS4V0K?=
 =?us-ascii?Q?PL/0HeWLxcbvHtKirZcWO+dz89TzFwT1+ajRrgIpunYLbhbuXNHzxNhMlBG5?=
 =?us-ascii?Q?LX3xlJXYOqFR29BWKjFCQvdN4OL/vHW2WqS0Wfz4MolZKf7MV+HInysJdV9T?=
 =?us-ascii?Q?/dleZjuH+FNCTS7g/JgkCFuXxB1k05P/7Mp6JfNP/m4MoyYiU5fsjW3E0uhy?=
 =?us-ascii?Q?3L2ZEcPVMPgF2IUjCFrTJeLB2jzZk4dXKBEuebUODfS+rrtbMJOJM4WjUOPh?=
 =?us-ascii?Q?jQSX6G5bcigsLTgjrpwCKonlEFTpfd1oGyhv2jvGgGgsoDJoxfoUNFUzCWhV?=
 =?us-ascii?Q?yEevaElcvn1XwQ630CHO/thkncphsH8IEwdkZyqJp6BIptdX9lSgKv8Lx8sd?=
 =?us-ascii?Q?WaZYPcVoj3I6AaeFJRk7VJhNk461LTCBsdMkNdqzlTKiuuV/WB2p9jxBiCuO?=
 =?us-ascii?Q?BNB90kgmnSIbFEu46/FS+4iZY18s/bu2mhk+4t2FhUJAGjOMj5ZmJ3MOMxaL?=
 =?us-ascii?Q?XmoMqRY4SfVioIPnkPxJZtmmvKQnFH0dX1/fyv8h/IFUSU6mSEvxMiAkI8gL?=
 =?us-ascii?Q?DBY5+KDrO+XFRo/bXn7sKB7gRvA9xMXTg8k3MP42FxjMEJv6drrlVVHtIPP3?=
 =?us-ascii?Q?p8O3lWcHiR0zXHTUA7vbG0vDXBIPWz87WXkFD9k8gubYIxECTmJ2XRxuYkpt?=
 =?us-ascii?Q?CLgD3kuSZfEr8mucin7f13t7a1ooe4bxPH8eXhlXFtZJAzCjjJ3XGSaXXOQ1?=
 =?us-ascii?Q?P/r1n6GdwtVBdZc/fiUO5L/mB1r9L2gsfbzr7eiznuVKM4NePHf30HiaXqHs?=
 =?us-ascii?Q?ds2sJupAFYsiOQoaw35ckMeyOGntC5E2YKPsQHfsUcQff8aUd6xRZThN3KUM?=
 =?us-ascii?Q?9YP35t2XEnK8a9CbVT2y9cslP0UHqbJxXRwibc2Vb3sgVcAxnfjE9u/gOCJC?=
 =?us-ascii?Q?mRwpHefyeefJ79Kj+icq/zGpdWdVb7brr2o2FlOQWMBcDRU0eBnNu1Z6XDYX?=
 =?us-ascii?Q?HFENO4CXY6ACN0UgV3e1yE1yNj4iCVU+f745+gtpoR/GHburOs3En9WPHhDv?=
 =?us-ascii?Q?wuJPq5PlC6OsvqEBQOq7BLZCHke3tFo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d811eb8f-df7f-4182-3e62-08def799eae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 11:15:57.6351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xnd96Qn09JTUKkk402ls05tUiCehopNN7NVo3hGfVb63Zeb4ezPmabLyC1ATIYsOo3C0WltH/39T9nfm435mFdQcT1EzcKy7IbCgWClnG1qUQ9cMPwqH5ifzI/WN1fu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Hi, Conor

> On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>=20
> Could you please get either Hal or someone like Xingyu Wu to review the
> clock driver changes?
>=20

Okay, I will ask them to help with the review.=20

Best Regards,
Changhuang
