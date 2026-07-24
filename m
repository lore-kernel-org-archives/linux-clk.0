Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023116.outbound.protection.outlook.com [52.101.127.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE17936492A;
	Fri, 24 Jul 2026 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873675; cv=fail; b=X4asrwj1rP3q6773WDHQN8DyXCWrgpR5Nnv76i1QCz057ofqOQV+3nKpJgzCH9QcGcmy7SnelgQGDD/AZUr+koB8KF0xDKwQBTQlLPIDOVV+sxAMzj8PxOAp/sh+x9jWysUaNNyGErdJXWtAbIYGrPv40QvCfRva25yOgFk4UFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873675; c=relaxed/simple;
	bh=EUthazb2vpD0jIQt9BMJOEqxWdAgwaJMZAsLKFBQqBY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MMpazIU4togIyVI/GWeS2DAOCLMBJFtO+X47g7gmme2zwxFk+FPPg8qcUxv22OJhnSehy8HgXcUAI04APwQSi9NH5umLGukMkjgAboTg1plBjI18z/FZiVDoHQ4GckKdpJc4QeeGBdJkQ7vDAuqGQ5xm7Uk0HwcwfwlW2cvnyFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7buxAfzmHL31P03sDeoagG+KEA+QcJr1vebNwpgVmq6FL2aKGrjagsN5uQx5u206L6glW0xIv7gqS2vpU1/cUowZmIVSDSihy7asW3RDDur5hXrErOsu5fmmYO/WXvnzHcYQndToKSwhZw983jjuaT72dlceyrPG77F57MVc35teA3qCB9STJivEzBT397+ZkQ0/HSWsaikDMuDfyGXyG4dEFdOMFO+msJPq1nSVSDqpwbYTlODgyqwOfnh71bVCgB1uAwuyH8wTpv9jKnqJ6kPZuiIgc53aVxf0xPr2nZIoVE33IJuYQ61+1fr2EkRKYr16bwlFMfXbQDEdIhomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpQp9Gol3M81LlrGz7jp+zVWNJ3mdWJ257XENRvvWM0=;
 b=Ku4hyfuQKhJKTFRKk/3v8mC9ABXQnnhGlE6pqYCu32n1ZFbCmgT4gN6My9YPmqrMObaet9wXKLlAQ1wnv7qsblc5CyWbQZv6OJ4+k8m006hfcRcqym/FqwcKHJBcTLh3tBrQXJKpcdj3q/NfmVrf/3oZO1QGvZP+Y8GlvkYr+hDlGn3KrGaXunkA7ASV+sxmoNe5PrBBvNRa0xWps7/2BR2MI0JWIdPGQwrALn7cU19EArP/FiUwo8L7TFqKkmRynjnTadQymLWMUjfzS0/y45nMxrDcFfGpOCeqofEWo6W5ZzHQ38ib3EmV6RUMotOunJ+1Q0ouNseR8sJPv5bbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEZPR06MB5831.apcprd06.prod.outlook.com (2603:1096:101:c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:14:29 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:14:29 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Thread-Topic: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Thread-Index: AQHdGoLMF0PonWj+y0ySnEIbcwYxK7Z7T5gAgADc8gA=
Date: Fri, 24 Jul 2026 06:14:29 +0000
Message-ID:
 <SEYPR06MB6226EA6519C74A0FF0AB677482CF2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
 <amJEjofx348vF4Vd@redhat.com>
In-Reply-To: <amJEjofx348vF4Vd@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEZPR06MB5831:EE_
x-ms-office365-filtering-correlation-id: e1229059-6038-4e5d-b425-08dee94ad1fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|38070700021|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 vIKJeY1Tmn8kXr9jLTWbwwPyTAQ8diaeWC6pTN2EVpvhd5mhY6FiApuToGR+qH43Dbn8IY51ZBdly59fB9tm3II1WFWVpVhdvt5aOyS+Mk+sv+trrXUHQKRWjs/+V1MD+YvGTWomup4etKk78DB3t53M+mIrhDFgthZrxnSXpW9MBBzu3CYPV1QmopliZS2RcBXUP6cTOLSV2o2cGubMISvdcZDkC/YsqtwgW9peVtaBwR36cqL7M7xoK23ycgJ88ds4jXzc6Z74xhSuLEaMlX1/HeMJ7Lc6xbZMpBzR7dv9O+XqtbpEBexQXLAgu6J8Nri15BVj7ekicdcjIwHn0oif8lsTYFgtEVwd5/CrqrsJLBdJiwMcx8aDYbg+czRdiDevuZCo9PFd27E+jSLzOSm4zqLazQ9Pxj2Wecb0m/9pAPZsvOVkzIr4IjYZjNUFfREmwqUY+nTy5zyO27SIE4CCLtw6hznXAzAivtC9hFKVHtx3vpCFAm9htWsPU/gOD5N/eGZEl+OOU3Qg4UT2c8yTEh1VZ4upLu3zl61m1c6LXURc9ORZZswuRwm1jE4qU9q6KnXf0WTKzP2CguWYdF0IwT4ZAMAedHHA7sphvOGSwCxj7vY0rR5Wi8zhDGi/TfY4aFOYJ5yN3Ss1yD8UuhNCZh/r5/NgqZojw45iKPYMuDg9djrepKSRuJEAlCZw7Q8qV8rz7dW6o1nxxFHyolExzuVGf32p4OcI44vcH0Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dFYe9Ptz+OAtPtncU3Fc5r9C68O3gq0+FH+qf8VoZBhNxhX5i+RX4IluA8vE?=
 =?us-ascii?Q?oS6SVCL+iQj0SE15FBfaOiX6GqnsJaEZBrgPKd0wZD1dAc/Z1P9Fxcx3SkzN?=
 =?us-ascii?Q?bai+NPCUEZW1Oco9FxC/Tp1NLXuvR58pu83rgPDmCe1KPZnpb3ZhAhqnOXTn?=
 =?us-ascii?Q?0t14t0DLy9N05XmMSI+kEHO6xAj3HZo8YaIpnBuKWpkq+4tV1Ri5AA2lxwqJ?=
 =?us-ascii?Q?BEQh9lSozYYiZ4KmXPn9M40HftHyEubiTOTvmEXTVh2Wx5bQayClFyN6S1P6?=
 =?us-ascii?Q?Can3TQ8QQNV8uXkGMEo3eeCVjV0OvXt0wQNdx2fwZPnm50V0b6PdjQiSvHeG?=
 =?us-ascii?Q?IhoMRbc91VNTXseIFkIq3nvDVrY5uepSWYGEbmYZr4w7weFlb0nhGucxWhs8?=
 =?us-ascii?Q?f9A4jMQpDm+CeVlwyPkHQqayw2j0qlgH3gsLpBKmyAZV7CD/M5JWTmO/Ksqz?=
 =?us-ascii?Q?Hvx/zWjpSPpbzskVTMAH9bSw0/7NcJGcuc+4nfskBm5ifFnwoSBuMC6SQ2g4?=
 =?us-ascii?Q?fpGBOBVKvLLvuubVEGsn8FmMwKOt0zTMIX3TDeLB/35235gLEohoncvLNsvo?=
 =?us-ascii?Q?oYMipVV7XBvR2MoubP5xEB+vU0uN/8OM5xLCLIc8jGcDRLdCqX7duMze5MGb?=
 =?us-ascii?Q?pfD5HYG0rcSzxw3PJCAcPD/WgYYBZIhFQ3Sl8RVxIRmhZAI2hmYhKoT2YejV?=
 =?us-ascii?Q?6bbbbPej7YvAiJ4Gpyr9LXSfpNNvCLCfPFTF/L7UkE5zhUQrAydnZYE/B3An?=
 =?us-ascii?Q?GxkoX4Q3amtyMgVwYgZLQxSWMM+vuSiX2bXOA/h5pCIKxt9rY7DU6zTFQJHk?=
 =?us-ascii?Q?RMl0uSgNIMJ+VrIwWljv4hOIjLcDu2yMGmLg4hjBZ2vRYc2M70Vy7V7QeCx2?=
 =?us-ascii?Q?qVZQ6REvSTsw5Ehb/81eAVi16bKh6IziANjTJYBkVU2Knj6PBzhJxX+R8yYV?=
 =?us-ascii?Q?LyS2F8Vzz/tX80MshuPTi2yHfHNx2SIX4ZwnKC4X6l/mIIeh1CpqCZD9eJyF?=
 =?us-ascii?Q?tOi/iT1R9NS+qF49vGUuu2Di8sOaUmKtTMyom3AlPOoTOBYWR4b/wMGI0o86?=
 =?us-ascii?Q?dBWnARPm41ektJyIqTGcNvpQtklWqTF4ZL1E5DT12VMiDnGfqJ7bTbZKsZOb?=
 =?us-ascii?Q?EXdPSC38dO4maMHhtFDwMCl36zINeWCZR5/v7XzQlc1PwQjKmBUN085bq/Wb?=
 =?us-ascii?Q?FSwEdvjEDX7VDpB6POq+k1iKrSHmSbNOJS4R4YLiXCnX0i93H8VnkdBK8xRw?=
 =?us-ascii?Q?TZxpO2MREDaUKhPYJxCmFylak1xbDgvgKnRS1HEFOng6uqTQhUpYaP/y9vdh?=
 =?us-ascii?Q?JBtAB8JhVmm72rJGoBMHlZjjexpi2BNEEE0sR/YbqMHd+fWl53rIO9QbXKev?=
 =?us-ascii?Q?GtyFhG8y7C42//3GiQxsluY0nVY6tMlzlAC4A9OI03lG8j0aHjblfXN/+GsM?=
 =?us-ascii?Q?cvQ0s9Biblro+/aVaR28b0WjCm62Opkx1/b+2FCzOb+iG+U9vdNZK/rnNEq8?=
 =?us-ascii?Q?aJuiLmSPQDLCgTeeulK2LugntIP/utfYHr7FO4K7y6DRAasw7cBDeu4hCrXp?=
 =?us-ascii?Q?kD6C/ppfsMvbfENt0EQfvNY6j75BRBVATBemp3EAxo4c8r+y2ow+AwtoRAhP?=
 =?us-ascii?Q?v0iaNvLbKAnmkMOigWfns/svkbO03QVAIL1QP6pekYQYvaXP4eCXIgh45C9Y?=
 =?us-ascii?Q?aXP9ZhZ7IGqqJvdwjrN8uEXxEVQXYrhdLH/xISXwFb4tEYl9UTph7lM2pC36?=
 =?us-ascii?Q?uI0tZBykNw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1229059-6038-4e5d-b425-08dee94ad1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 06:14:29.2694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lL0zzDEPNbTiioUHSsQ8DrfBOCR8t9bW4KW5KZXpjd3Q9U5rlQfr9OhiktjynQqnh+2jKf9wUN1ToOnJK54z1gGYM4D+UVH0hfuUI6J5V+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5831


Hi Brian,

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Friday, July 24, 2026 12:43 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kern=
el-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
>=20
> EXTERNAL EMAIL
>=20
> Hi Joakim,
>=20
> There's one question from Sashiko that I don't see where you answered tha=
t seems
> to be legit.
>=20
> On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps the
> > CRU registers and registers mux, divider and gate clocks for DSP,
> > SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> >
> > Four SoC-level audio reference clocks are enabled as inputs to the
> > internal clock tree. The driver releases the AUDSS NOC reset, enables
> > runtime PM and instantiates the auxiliary reset device.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> [snip]
>=20
> > +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device
> > +*dev) {
> > +     struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     unsigned long flags;
> > +     int i, ret;
> > +
> > +     ret =3D sky1_audss_clks_enable(priv);
>=20
> From Sashiko:
>=20
>     [Severity: High]
>     Could this result in a deadlock? When a consumer calls clk_prepare on=
 an
>     audss clock, CCF acquires the global prepare_lock mutex and may call
>     pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resum=
e,
>     which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable exec=
utes
>     clk_prepare_enable, it will attempt to acquire the non-recursive prep=
are_lock
>     again.

prepare_lock is re-entrant for the same task (see clk_prepare_lock(): if pr=
epare_owner =3D=3D current it just bumps prepare_refcnt). So calling clk_pr=
epare_enable() on the parent SCMI clocks from runtime_resume(), while alrea=
dy in clk_prepare() for an AUDSS clock, does not deadlock. This matches how=
 CCF recursively prepares parents under the same lock.

That safety assumes resume of the AUDSS CRU is driven from CCF while the sa=
me task already owns prepare_lock. If another device device-links to the AU=
DSS CRU (or otherwise runtime resumes it outside clk_prepare), a concurrent=
 clk_prepare() can deadlock:
  Thread A: holds prepare_lock, waits in pm_runtime for our resume
  Thread B: in our runtime_resume, clk_prepare_enable() waits for prepare_l=
ock

We do not have such a device-link usage today. Would you prefer we add a sh=
ort comment near sky1_audss_clk_runtime_resume() / sky1_audss_clks_enable()=
 documenting that consumers should use these clocks via CCF and should not =
PM-resume this device through a device link (or other non-CCF path) that ca=
n race with clk_prepare? Happy to add that in the next version if useful.

> I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your dr=
iver and it
> calls clk_prepare_enable() in probe.

Exynos AUDSS is only partially similar. It clk_prepare_enable()s EPLL in pr=
obe and keeps it enabled for the lifetime of the driver; its runtime PM cal=
lbacks only save/restore AUDSS registers and never disable that parent.

We cannot follow that pattern. Our parent clocks come from SCMI and also ga=
te the audio subsystem power domain. If we clk_prepare_enable() them in pro=
be and leave them enabled, their enable counts stay non-zero, so after syst=
em suspend (and on runtime idle) those SCMI clocks cannot be disabled and t=
he audio SS power domain stays on.

That is why we enable the parent SCMI clocks in runtime_resume() and disabl=
e them in runtime_suspend(), instead of keeping a permanent prepare/enable =
from probe like Exynos.

Thanks,
Joakim
