Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022115.outbound.protection.outlook.com [52.101.126.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394792E7635;
	Sat, 30 May 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142645; cv=fail; b=I40Qyy8aAWsxiBhxBeFinUyz1/03yONDcXi85HEXJB7jSLOW5tAc7O9vnCuY06WnZOMvtMW856QIPVwY/ZDdhK3sYPmTEY8xXJCnH7yC2V1vGflO2bDN7QBSKLa72NDyr+bIsdfa3bL25taQTHCBi1HihmZnw2pkZm/tzeQXWhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142645; c=relaxed/simple;
	bh=pfuJpqnxVuRJ0trwZKAu5njhNgTRlC2v+7Cjvz3zn6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BkzfvYfz1Uym7DoF7R7wm0owYSRiPCzRtRdBTvqoSdCArBnNoejgdf/+VKtno4VwAszWjWo2avSBYHahHEhjDzYtgbAkRuWVH+bcpKmbOFhpgLtXaZTJqejB8MYmqiPq1VJemrClbO4f/9RBF83DgVVXjJ5Skc/61wG0+3NqJKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXnRjjNFhegXQ7vawNzaPbw4pyxSl7OQ+R/OkTVvj//h8He2+ZB7y9eur3cSLlrbY0nilF6PeT3D+iQY/LAIq8Gh2DpPse7pw7Hdr20mXNyUtGHSkN3Dq0mEwEESsVg3Bu/LnWZVjPQSWYjT7Ii6hymGmVC+Jl7sE8tR72r4kdcNnAvJBCfmtwAAQ/v0aWh+czzPZizzH6lre/0VgbZhC2DLunFDiJ0myvXlqpNdADe3i7np7md5nafTMbawloBQNsj6exeVIWEBGdLX0ljcjABeQLW8TgvVaSfadcXfSpHf25Soy79JIb/Sk0vjUXEkuemWoFBzqAHL0HD9YOaclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfuJpqnxVuRJ0trwZKAu5njhNgTRlC2v+7Cjvz3zn6k=;
 b=Gl6YZLo5OyQkxScxuYjG9F3mSIpwjJzklZ/JUfuSytsVo0BbV9F7kteuj/aT9J0jdB0J+FPTY3PKRO3BUknjlVgsrKRLJb8zUgl8omjTPCM17Sxu9d5WawhRlT2duOzaQAd8+X0tD0mPmF+KOLI/EA7LMqR8QZbdAXIT1uG4aQZXxuXf4fcQbrG3/UF0y6dp0KuBk26GASC9ePk0IuZhfsjg//e+nVPT65eRT+LGMF/xFSSGkYxZfQLRcRa9JteOHUkODimoUC5Ex7EYHemY85KLrXcP7nW5B9Mk9mqffbzFZqK04f7r2y4j/XvXFWkUomLMlpqnrTpEly1QVyOmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by TYUPR06MB6193.apcprd06.prod.outlook.com (2603:1096:400:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sat, 30 May
 2026 12:04:01 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 12:04:01 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v1 1/7] dt-bindings: soc: cix,sky1-audss-cru: add audss
 cru system controller
Thread-Topic: [PATCH v1 1/7] dt-bindings: soc: cix,sky1-audss-cru: add audss
 cru system controller
Thread-Index: AQHc79pgh2WhPE9Mr0yM1r0gwhMZf7YmR6MAgAATuhA=
Date: Sat, 30 May 2026 12:04:01 +0000
Message-ID:
 <KL1PR06MB6236C253721CE9E38458EC0782172@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-2-joakim.zhang@cixtech.com>
 <efb0b14d-9dbb-4e64-85f2-1a7f9da121c1@kernel.org>
In-Reply-To: <efb0b14d-9dbb-4e64-85f2-1a7f9da121c1@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|TYUPR06MB6193:EE_
x-ms-office365-filtering-correlation-id: 8075d223-3d4e-4ab5-5d1d-08debe4389ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|18002099003|22082099003|6133799003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 RtPgx6OwktwFCD/cL1BvsJDp2ZHElQWjVtrOTu7aCQGkMsR97yPxTLijgUyzlGzdx4ze7LVSyX4557oR2PwmOp0Pzc3u8i3JCLWwbyEzG5xgKFPlJfCEFNwafmdu90ePZuVTmU7knjauVYL6cR1fsTxWGlPNwYZu9i6FiHBLOTCKD0nZPWDgfvc8XG/qGFgoJAEZ8XlN3lYk4CBZbW7Zy6G4zgkPc9No33j+PAUy2dHyckp5t75rV/KmNeR9+UG4BANAtBFuf5DzBmflMusWiSgEHo1Hq9LmeTyVR5LxQaD5CjZ9NgH7iPvbUF7UHfnZyxN5pnGljBicKuawOjCRWmAciI6sT2+MYl6AXjyke3G4VnkLjqurPFKr8yN6NdQorrxjFdGreLlEVDDR1xP0gwuRwdp5Wg8cYJiND1POJ89dhNm5zSOOeIcLFeC9qAe8BI/WexNRQzgIJT7dtIsrAiInTYaltczf1bxAWFqWJW4W+4kyQiM4VGlKT1AlAO5ftoA5r5rBwyog5snxU4F7oykFQmYNaBsTFxNk2fhjVB1l8MoBsA6oxwI0X8Co4VmHgWCXlWwVe/QuT32Ys9sJq2O/8utYuWdAqk7ZshxvjTWMuAjVt1rUPoSRoGi4kjpj60OuRVEsmqSkWvDCAt4HFKjDRyFCOFqLB6u5Qxs+WHcWkYd7GvWyqFENeGw9gPdkkHww/+a5kWUlVe/QL8K0XCFSrziqmfpPonSoLE2qxnyTs7tk4235py2tBMvsViE+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3NKCubDzKuIL0guqi0eGMZiwfIx5tS928hxklHOxVJHxm9wyybQ2co41x29s?=
 =?us-ascii?Q?jTjs43M4KRDK/Ngo08LBqrX2zI3FZUnhQlq9UGOjvnpueXMkqe2cvLQMtQ7q?=
 =?us-ascii?Q?m9xs4rRrBKKhP9Q7hMDQjxvVLYVHX7vzU01PQHCAxfSA6Rmqpeewd1DCqfAE?=
 =?us-ascii?Q?b/JvMJ7nRpoy4XhG3LZL9Ngxw9OG771SL0FqgMNQyfrPLSfLLURPphllLovi?=
 =?us-ascii?Q?Mauy9naJE+kurKiFaj1vP6YSJfDdjjv4PiwsyWx8F0g2qQihTluZep31KciJ?=
 =?us-ascii?Q?EzYQDPVEBXcpl9hRlx7JogXFMfHnxF6jtcfLMJa4rIiIsSocvHEm4MGZi6eJ?=
 =?us-ascii?Q?LN/psoQ574HB4v0BtDkZIYkLdZNineYtxJGJ41Jj0eN0U0O076a7q9HUpqb7?=
 =?us-ascii?Q?o4XVpblBKgO3y8aQpxkXFlWxgxVkH2Zob6KW3fsB8eMCcSNguv74HLujibc2?=
 =?us-ascii?Q?w2oHo9L74TlalwA36qT2XNZzqe5nKm7/S8XtC/D1XAg0ick0C4GFU6vopNdu?=
 =?us-ascii?Q?FvrQmym61OCfSxyhyeu9EPTtjfOjK+4dLP02iZ+3aFcWTuzY3goez/Cf7eab?=
 =?us-ascii?Q?klho39J5JWCKsZZIjbNn6QsAHv58FWsi+xir+TOStBM3gn6iJn4bXzKSvga2?=
 =?us-ascii?Q?Z8PS7/RoaJLWlMBR0tmp2bms93x2X4tJn9DLfaJuy2TnCY3hWIIDfLidOngw?=
 =?us-ascii?Q?u7gu4KHW11Eh4gRLEvJAxebFp4ioCV/XtCrCc3covMKKdH6yLQ4ZSvGHNaPy?=
 =?us-ascii?Q?6etaIm2Wmd/f/PFpaq2Fbis3FuuBmfGsheNqFtRa3ddabFuuh4cqKdRJMp+p?=
 =?us-ascii?Q?CFzZBcTQZsxfJlpL3PDHoza2jpZeempiHTxN38NCDa6ob57Iq2efzMFNvCng?=
 =?us-ascii?Q?g5ZqNxO3NScBKYXaj4bKbL022Ki0h4/RbyRy7aPZLOxWnlFwOCbSZajmKI9p?=
 =?us-ascii?Q?CYIBesMFvpAH4Y8vfjp4Nr3upqPUWZ1m9RbOGoAabKgIny4M3r7sXlOJM+ul?=
 =?us-ascii?Q?vdtou6ft+RSsfnCLf7vUYvhISXJRFwpd52DaXJcNVFPu1SEW9MElwE5O7Fh8?=
 =?us-ascii?Q?Q3PGhHomLL65uY61J8BVi9DzG2LREZ+VI1Or4SxFDFtJRMdV75ZLDGMg/McC?=
 =?us-ascii?Q?9dqzRnAL6SWWZl4mtuHeAwwTggt7+d7gAX0LSo20Mbdp+GqU0bJPHd4pCUnT?=
 =?us-ascii?Q?ClhWZQ8PuoDkwjdm/tykS16wrmfD+ubzwYYaByYOERDnKtiOHl+5AZmBRceE?=
 =?us-ascii?Q?ln6wIHFciUv66rDg2rm+JnRs0kKL4MlU6lA8S4+rPmF0JQ8ehBTG7sz+4qbP?=
 =?us-ascii?Q?seNA0akGwLU6iaG+s9LHQZGknyQ9TGexAYF6wsDYFXgEN5/VVkkns36Z/9dj?=
 =?us-ascii?Q?znPsDqkeWD08m03U8nsB4y86YI7scoM8Myh+4/AN1MOBtJcf9OfcQuQRzOMP?=
 =?us-ascii?Q?R24OSSgKokht4VIMjdSfgNdGdJUmdU8nhkEdHENzERACWNEUNHzLTc/Gsxo9?=
 =?us-ascii?Q?gBQ65o/+ZbETsqzY6/I/0188dA3eHkiGyIruIDB7ll6Spybe7t+NgnAPaMkl?=
 =?us-ascii?Q?tHjCkEj1iT0I/vROIvjvE1juZO/G05L7GAsgyZvKJZB6RUK90BpHto7tSFyl?=
 =?us-ascii?Q?7TNnBaQfvOp+alg3+ulX1Nz6i3g+xUmcdwG4lr/R+RVPMT6RfAdNfL0o48cS?=
 =?us-ascii?Q?gKdyYqijM35YH+h0a7Bpv3oqKesSwGW4J4opVgzhn1OYwJeZ7SQsoNJ/lMLF?=
 =?us-ascii?Q?7NL/iY7cIQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8075d223-3d4e-4ab5-5d1d-08debe4389ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 12:04:01.4900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiS2lOVtQX8GXtFDNXJY2YvI0X3vE8rpW5XdE8N3AQW73EoIxNDBOQA6TSO/i+Lo7ukPeSnwHHBf4fCh2nTkfxFccK1vlNAuzkpOaBajVPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6193


Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, May 30, 2026 5:07 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; p.zabel@pengutronix.de; lgirdwood@gmail.com;
> broonie@kernel.org
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; linux-sound@vger.kernel.org
> Subject: Re: [PATCH v1 1/7] dt-bindings: soc: cix,sky1-audss-cru: add aud=
ss cru
> system controller
>=20
> EXTERNAL EMAIL
>=20
> On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add devicetree schema for the Cix Sky1 audio subsystem CRU syscon/MFD
> > parent. Child clock-controller and reset-controller nodes are
> > described via references to the AUDSS clock and reset bindings.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
>=20
> This wasn't ever tested and obviously fails (non-bisectable).
>=20
> Please use scripts/get_maintainers.pl to get a list of necessary people a=
nd lists
> to CC. It might happen, that command when run on an older kernel, gives y=
ou
> outdated entries. Therefore please be sure you base your patches on recen=
t
> Linux kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of peo=
ple, so
> fix your workflow. Tools might also fail if you work on some ancient tree=
 (don't,
> instead use mainline) or work on fork of kernel (don't, instead use mainl=
ine).
> Just use b4 and everything should be fine, although remember about `b4 pr=
ep -
> -auto-to-cc` if you added new patches to the patchset.
>=20
> You missed at least devicetree list (maybe more), so this won't be tested=
 by
> automated tooling. Performing review on untested code might be a waste of
> time.
>=20
> Please kindly resend and include all necessary To/Cc entries.

Sorry, will submit the patches in batches and To/Cc all entries.

Thanks,
Joakim
