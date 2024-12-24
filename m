Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2115.outbound.protection.partner.outlook.cn [139.219.146.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E63EBE;
	Tue, 24 Dec 2024 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735012448; cv=fail; b=sPiHmRNGAWQMVJn8hM82FE8DNpuCELLkPSGMdYVy3NxPp/FGd9pef6+GQYqCizpRrKsMSAabI0ZQG0IifK4wsxWy0yJ2t7nc9G561YQxdijWGOpIaxVDzkm+B2EOURP84bZnO8fBrpHcmKoOLgdSxxNLui/nTSEPgDca1CugERQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735012448; c=relaxed/simple;
	bh=imH2I3ep4uoZ6/2CX7NZXKWP6o5mx1ennnWmfewUk8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OBsGQ6d6PDhwAZLBCr2DC4lO/lLsKvG3dKQejQS9nXCJAdHYo1ML0++QonLJwqER/j0x1ec5xly0MCekT9UVC0/khSPoLX7y7kCLZWp54zek3RMsbyKLu1+NBowd0OikbUo46EoIPLXXoEZxid0mV7tfcN8T2QPf0NFLQNNqDvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5w32TtgN2Hy4CTNQ20d8fzJB1wIgq+K0IG5cFlERat50TvKBSegt7BRlR4U5C1higuvMQ0c33aY/NjseR22G6zACl+UiRBm6JaYCWAnVXs3Ouvm+3OfULAwhOuFnS8tLX2coCqOW7vE09w8MdQxtwmpyVKpRQzS1xizTLSev1qslHHAbf1oeWVWTNlVj7wfs3uj7LAoFW1AiNNPK5Tj8Fp7tLCisV8QPH0+ItEODIEutFexYT6+ffB7jrs1HOzs2cgvBtd+v+EBt6ekLsHB9UofvNiHaZOmL1+oGPZurkSW7u+zuRagy8h8d21VSy1xHz7N+tsfp3DJBs6CpwqQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zagZKcqp7nTGuVoGmUBjn1bsQZX6d3s3a3itSjZDyvY=;
 b=PdyM9hreIEuSwcXnldUQ8/Aru8DMWk16jhiIxnEh1BV8aM+vkI4lZ6dAwK0DQtg4fYQe9xaf8kvYTMPp9HkCemTCEMiTC8MvwAjMHikZtGUq5Ed0SgiPwu6u09QnGTRKXAFiD0VwLX34SiN9rBqD0gXj8X5xqOGXjRAmJG/v3nYgVsb9LNxAJxKJ8+WT0lSIzNhzZdWxJ2ff7Yf9ejaSxKjzt8ppnT4WI+DBfGBAacqvLMkbg+yqP+fAeDm1wkPUgaQnU4ca8K1sFpiN6xgdyej4tNV81PhvMZ02vs6q1vc8ZJh4dKRdnoQrff44o+zs7DPYMLkrtxc+s5CTfDBLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.31; Tue, 24 Dec
 2024 02:19:57 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%6])
 with mapi id 15.20.8137.030; Tue, 24 Dec 2024 02:19:57 +0000
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Sunil V L <sunilvl@ventanamicro.com>, Rahul
 Pathak <rpathak@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Thread-Topic: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Thread-Index: AQHbT5dkWIpoJhPBDEKPr7Y+jsZN27L0tOFQ
Date: Tue, 24 Dec 2024 02:19:57 +0000
Message-ID:
 <ZQZPR01MB097924AF0A246677CCA17CDF8A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-3-apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-3-apatel@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQZPR01MB0979:EE_
x-ms-office365-filtering-correlation-id: 3d257174-2724-4dfa-60d6-08dd23c17600
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info:
 EbD9BKdE5lE6dbkzozUaPSA7+2cW2f5KwuTCem1tDdzg70SAGXiNLSokW38XsVhSF4tYuf7WYLK2V+6d1XoQu57msr87qa5LZ5iNY5xDuI8NGh9ZiaL6YLmjc3l1Q1qsbDQH+RpJBveF8XH/gyUux96GQsArwaUNb2CQmed8/M881NCCUkT6NZ6JIYhlfH9gqti2dOKL6bJwneE48f75sbxCyEZQvINnNaBgslGTcxTHFWOmZL/tWT9Q2JN31nUBfleCDvySXhOxXXcAEDESeW5CJ+bPN8+tlAibm7hBkWODsKZqgRQdf0/tSY2QGcHpDlacFLHqwT5f5XsrrcS1sYigX1a6iQndVMFJvjR+HjAXe+DGVFmknSGcCZfSSa+R7c1Euvt5weyE40/VvfO79hd/pwpmH40FkLp0xIrLYubB9VhDfGv747g9D3JM+cLCuCNhtaCJHFi/kF4253Y9bvVUEtQhmR/ovUy261JGo0huaAUJe0PQeAcU+TZTvj5e0in6I0lxS+oLt2nurOizWf1tFkls0RzY77frWtpPJsEwTtN+jl1pF0jpOF5ZB57rg3oG1q1WkjHiQywvt6IjRcJSy14hHZTYC3ron/KidCU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vjUCWluIGhq6mdk+swoW9jGDyciLVNBTF0d5YIUkLFiPaIQG7AY/jpf4ZoxY?=
 =?us-ascii?Q?HZqhM4NkvnXPSKElyFrcKDBg33QFB5ARBFCEasuNv+aCurDPbL3Zut4hGvm+?=
 =?us-ascii?Q?OJdnnHfDTWcQamJuAWy000Bm42ycqqSgsFGD8YRbWgJgJhj4IMnHdBTRfkT9?=
 =?us-ascii?Q?ARKE1s51feN2dct2QXn2zkV6QwMg74/Ifxj6qWpNg1uCHxW+V76/WElhPzxG?=
 =?us-ascii?Q?LGcR44WFCsrOxWEZSz/xi1YtR8tpRywCJmgYsZwewOSRnsDySKHV5mhsQ6D8?=
 =?us-ascii?Q?KEAPeBCtOlc1oA2I5rfoEODJGndqmv9ZsTmJOFn9I1ubpm1ekC46yXY+tl4O?=
 =?us-ascii?Q?Vsa940fC0jBrQ/gn4TUgXgRBBr63ZNEp1lXZT+aKH896kfgL3nsY7yp56iHz?=
 =?us-ascii?Q?cFh5zDnf8IghccU97e+gUPYeBeXaAiXYRWviIRgz/YgU02ldVoYgZS/nlfEn?=
 =?us-ascii?Q?F8g64IFteuR5euLEUjKOjpNpNoAo61vjULljrup5ihDMZk/ZhBFP5+2f44La?=
 =?us-ascii?Q?NJl2MB2VNRSdDHncdaiQHQCatRtku/zaEVYmutwDEwR52FqyEn2gJ3a70dic?=
 =?us-ascii?Q?3vj/rKSI43awT2b3mWFvnVSPz8Bz7cPZXg710rWpWPUGUmJRsNM8juFFSzSt?=
 =?us-ascii?Q?gbAScYpu9lo0152Gdk/KBzzpTJM3Stlui20xWHa2MbZd8pIbx8jYqCcGoGal?=
 =?us-ascii?Q?LEVKnH6XSyvqpO2wvjvS3N56bESUXO27gFlNlURgF8+5x0CnHv1UNcMdm7rW?=
 =?us-ascii?Q?gqn3SkMgHeZL/gakfNmp0+HieGaNvQtcz+uxU41x0UMhYFtcrwcpjiROrYUr?=
 =?us-ascii?Q?JvndzvXnxKaL82S8otq80tWeslPAyi4BcISl29NmlmxB+Uqh7mY2S7A2TSgT?=
 =?us-ascii?Q?eer/5g58JfjVqDSm7/6zk1rT+sU6P1jzPs5VF1BOQvujBUP/bXCf+8Yqrn3/?=
 =?us-ascii?Q?i2YtessxwI9oisz8f7ewUHzSV0BEBzFhxQxHrnJe5OxEt0iIiSUVoCQLn9FS?=
 =?us-ascii?Q?BjHikgGMrxdAhJ5jf9zwLTkwOrKzhwzn+X06d7ZDLt16aSP3kORNEfOMCoy8?=
 =?us-ascii?Q?OtVZ2tbauRK+P0eRGIBycn7I+YfqCa5xZYl8ji/h/Gk0X0BfkdvNjs/kGs/C?=
 =?us-ascii?Q?eJiTfNwQNoKvcti47qWu3sisQUorqoRq+shxBK3ilReOZA+bJtMbqwx/RUJK?=
 =?us-ascii?Q?Rk4I5iiOLQ3Nxp5X4+6RvNs4XMzWrscvBRICgfKNCTsSeuj3JeeQepAGVowa?=
 =?us-ascii?Q?vNFsy7CU/f1wMR8th5Q+wPXFDxxkJP8LpfrdGHGtOoRyVfzAdQjl+BuqI2/r?=
 =?us-ascii?Q?oRUMhbu9Kz5isKvBlufTUsaxCV6MBSNR1CwrxxVYRE49gqnpOZTY2DvWUr7p?=
 =?us-ascii?Q?yL0ROMATDwaVwJ7bh1KR2stAiTi1AvvTKbWmGPfiAS0pBpak49jqcjMrXG8b?=
 =?us-ascii?Q?ptFi4Hl8Q297TqCls0G/o/7qyHjpegIQG6wSJwPx+aexKfUkQ/PZuMKT9gIF?=
 =?us-ascii?Q?HTbHB5sPL68756EydAzLRDX5XzVV1HvKi2SUu8gaAJRB1+BiF5Kx9qvIK71B?=
 =?us-ascii?Q?vY/J3Kibp3KYJd/YhCLkNJoq/plG2UJWUxdJej+xUpY/26IXAoOtwy70HGZG?=
 =?us-ascii?Q?XA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d257174-2724-4dfa-60d6-08dd23c17600
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 02:19:57.1369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRNX2Tx5CSAxpWxyFhTYjsGHvHhBwOJ92tlANWeASxiZRZLcbHd0N501sqfYKE0YjIXKi43Tn3mgBk+fAn1L2HN2Wnrniku3gtJz1RElp70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0979



> -----Original Message-----
> From: Anup Patel <apatel@ventanamicro.com>
> Sent: Monday, December 16, 2024 4:48 PM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jassi Brar
> <jassisinghbrar@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>; Paul Walmsley
> <paul.walmsley@sifive.com>; Sunil V L <sunilvl@ventanamicro.com>; Rahul
> Pathak <rpathak@ventanamicro.com>; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; Atish Patra <atishp@atishpatra.org>;
> Andrew Jones <ajones@ventanamicro.com>; Anup Patel
> <anup@brainfault.org>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Anup Patel <apatel@ventanamicro.com>
> Subject: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI shar=
ed
> memory transport
>=20
[...]

> +
> +examples:
> +  - |
> +    // Example 1 (RPMI shared memory with only 2 queues):
> +    mailbox@10080000 {
> +        compatible =3D "riscv,rpmi-shmem-mbox";
> +        reg =3D <0x00 0x10080000 0x00 0x10000>,
> +              <0x00 0x10090000 0x00 0x10000>,
> +              <0x00 0x100a0000 0x00 0x4>;
> +        reg-names =3D "a2p-req", "p2a-ack", "db-reg";
> +        msi-parent =3D <&imsic_mlevel>;
> +        riscv,slot-size =3D <64>;
> +        #mbox-cells =3D <1>;
> +    };
> +  - |
> +    // Example 2 (RPMI shared memory with only 4 queues):
> +    mailbox@10001000 {
> +        compatible =3D "riscv,rpmi-shmem-mbox";
> +        reg =3D <0x00 0x10001000 0x00 0x800>,
> +              <0x00 0x10001800 0x00 0x800>,
> +              <0x00 0x10002000 0x00 0x800>,
> +              <0x00 0x10002800 0x00 0x800>,
> +              <0x00 0x10003000 0x00 0x4>;
> +        reg-names =3D "a2p-req", "p2a-ack", "db-reg";

reg has 5 entries, missing 2 reg-names?

> +        msi-parent =3D <&imsic_mlevel>;
> +        riscv,slot-size =3D <64>;
> +        riscv,db-mask =3D <0x00008000>;
> +        riscv,db-value =3D <0x00008000>;
> +        #mbox-cells =3D <1>;
> +    };
> --
> 2.43.0

Regards
Ley Foon
