Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407674E06D3;
	Mon, 19 Oct 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413430; cv=fail; b=hcZMAJ5nc8TBTQ/OrE71g7J8+KA5Q3AzGgwpn3v/YTzZy+dCMsn6K7qUPK8AwGGmUxchf6MIJgGZcmU7gAt+ePy6LggkejilIamqESCN7Jr5YgTN4KbyTW6mYmJ06cUuym+kQP5uDkoej4Yhoz4Y6rjmyUYQ8ezZV+rg3qtu8yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413430; c=relaxed/simple;
	bh=YRNPii7OSPBtR5vebyM+ao0I8vgSkAdGeIMfR9X/Dfk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JQihnjQEQiS1teX5S9pLYlOONpEwweZwQx75JkigAtaXF6+xKJaY37L0iCRS9tWyQ3IASHu8D7phSIZBK+i381nTXFYu5jkaQY8mmiG7CkATvB7sM8OAoBbZipBWuQ+vzpW3VgMbTEeX3ieyDAJPkPcaWJgNlAs3e7tyrIBQtU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WLCZOtNM; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WLCZOtNM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usFPOou9ie3Fue0W9bhmyQ6YO9iJ9iZuZG6vJR2cYc/dvOD1IvM6vG/CMI9FuNLNwgzY43keSK5mGmxUttrpnt7oEz6RtzBGt/9UIsA0EU/iGkkwGeBrpOSoIHcy7fdPK/H0MwbNrWvdZzQ2fl3Bdr9K6N6MwfZMkUFlrvg1B1xMfd0/Rv/29zuOgX3uBuKMhiwc0xrJ5YhEjH70Z+vZ+3NS9qXzYfINC+p0Pb7t0n5R89FrqLUTknt00oTDn6+Wl3bHi2h7tj/2jBEUpbLOHJhw+BuXoXiboOjgPqbLIIPAFg+2YKp1EFrZCIJostXfPQ/skc1kQrGh+vcy7oIssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vOepaGLFJ8B/+jRPCsM4VJ4Ug4xOq626UlrpPz1Gec=;
 b=SKgasEhqAwR93jP3S51SVuWjjqK9yjzR4ZcqXYf8e/39d9MHtWc/kl3tx7SB1DbcGfmZs2R7rfq6RLoCnBSPymhdxaaKW8phSoOgFj7eriIt5WB6KedbLfLQ/ewDK8cJwGwFFYLfGTjyhNdDBmvlkxKrjzsLJU+pIqmG2914TPa3cYGLiVgKjUuqIk/xhb8lZtuD9OmYxZRh5qHR4HEuKK0KRnmBQsTizbtWGoEq+5+G1uwrfLZV1dEnIC2Pzcj+DM8aqdqrvMZit4ld7pIRnnhYOuRxZRKJUr8owZCLv3Xmd1uOVkrEOlyrQGzIOe+x6hwRUtq7oCTW1nqCIWutGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vOepaGLFJ8B/+jRPCsM4VJ4Ug4xOq626UlrpPz1Gec=;
 b=WLCZOtNMfFGc7Fzp+tk80hCBBBqLYoLzGHcK/tX12x3uUle4mW7hXDlXvOmB2yvr8NCGt9u7FtlwGr8YyZ4vmtUT6tGl7TJNERILiEhaQiF7hLHy8xkgaH8iy38ChXfgO9VJV3SFXPB0w4UmydRS17Ev728sSYg/4QdShGv5N1Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB549649.jpnprd01.prod.outlook.com (2603:1096:604:50e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:36:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0496.021; Mon, 19 Oct 2026
 12:36:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>
CC: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Topic: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Index: AQHdX8Vug6f5sfX+VEyy26VSVdBrhbcEzKNA
Date: Mon, 19 Oct 2026 12:36:52 +0000
Message-ID:
 <TY3PR01MB1134614C56D70F75D2C3214D986982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
In-Reply-To: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB549649:EE_
x-ms-office365-filtering-correlation-id: 623b40a9-353e-46e6-0b76-08df2ddda770
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|260925021911599003|38070700021|56012099006|260925021311599003|260925022911599003|11063799006|261009223027099003|261009221227099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 gr2zD3xbDkJ6GGqmDTVNJW0yzf9qV/NGQixjqX7STsdhAlCy6VTzn+2xXqK4zHFOSMgc/3S3eNw9260w7K+Vf3fu8rT6AP1NkfE2ZALSM87Hro5pi1RK3V/D1e7HxKqzHG5/tqXsKpcPXSOIdolyCiSOeX3VUfcFUwjR+K64E/acEIPEOohwAmFeVBYPFZ0kTTlUILcw2Nsc3v0k/VnkcXVP1Lt6VGKxDtIVda4eWt7pbLnacahBbcMQEvtev/IHeMJLKJndVSdisigOZkBPJCiH53DktwoHqwfL6o+lrMi7zNSOWzJXnQsRNx/BvG/GCLSS5kSjfhDRScjT9YFRTUkMwgZDccJ1EshaZP8NqUDpMlPvC66hFODO/0w2JcRkQCjitzoji5o7ZXhNYR5i93wI8V9VWrP0hjZzcwVyXwiVPx+ZRkGot+tvApFQpYoMk4S8XVfPGykqZeuI3zYdlZmiPaQOVLB/peUEN0Cl9QMv/36TWx3Lj06m+YbcitVhRn/LMkEsrh8s0ILqpVNG00SmioeEiunGNVq0UKGaibkKiQL4eNygCnMS7UvrFS9ABzF6WtnPf3cgCXKbvYk/8kX287AJeriqK2LREVtAfuTN+8lxHs90ZxZjIAbKL1900IJCoSODrTNWp0ttdoXjsfWS3JWRvRrarzXULS9JKqmEPN1v1jrdMmvJTcIkoztmY+hVEuwUREUX0Pl7DkwWja/7Jd6N5TKM4lWTEcbnvbA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(260925021911599003)(38070700021)(56012099006)(260925021311599003)(260925022911599003)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/KGQD/BU90/2x7dLiJJCJAJobN9D4LbkMaz5T9X2VsCmTAkoMaQPCVqic6N2?=
 =?us-ascii?Q?xeNUrmniHEW8V3QPfxeTQtTOGXl5uf9gGSCI43UIE0OHUfLS5NPN5LHuChkG?=
 =?us-ascii?Q?BSK2Y5W5Go04g1P7s17+bqv8Z1Z+Wda8xWrSPePT5Wgu8lqFOrO/78XCdCV/?=
 =?us-ascii?Q?vwQjafMeVUHB6WHgkLjEIC6N4uKmMlZqEU9r75K58Jp4hw1zVXZNJvAZATMt?=
 =?us-ascii?Q?iXVEwmlbIDqiwu2t68wNpF01n5GtXCZcsTRFbuVlseCP57sH3RYD590OSJMR?=
 =?us-ascii?Q?BlXWqyT9Z0BtxiL7RVDPKQ62TOsPyM9OvYJRgEdSGDdFYgj0ki8zuaRiG+D4?=
 =?us-ascii?Q?EkXs4dq7leqROPLfyZRg9Bzv5EjbEuJOT8tQmyPMYStCRI+xe6S/Qv8RJiOC?=
 =?us-ascii?Q?Je6su0pT9brkTh7Vm9WCBbjhk5iABhiBykgjZCFE/9cMUZ/zTweTblGEYVKJ?=
 =?us-ascii?Q?liqFjdKnH3V29OVu61MIslrdiM/yI7ZsOMvLQUVQPH7wW/PDcIPqSjmoLZmL?=
 =?us-ascii?Q?V/wGs3ECDmPdPAw5Uk3rzQScrhZv+nHk9txHenHHKw/IESsKdHQxelbct5Gd?=
 =?us-ascii?Q?aAR6wCk590o4XrMnoZ2DirwPfHaW3733clRq+negZbmGmEFghjUDuIHLxFS8?=
 =?us-ascii?Q?1c4IL69BVNGFy5/gdmEHv1g/QJHmkSU8KDSOR/trmgt9jsQZnQKwrYj7HqQC?=
 =?us-ascii?Q?AMg6K76OMjQtI366Kjx3DA5Vk6xAjN3NxyRBeXFXk/uJ2VZHqYHbHAQblml4?=
 =?us-ascii?Q?r59kjgtAJHyoO+xWetgHDDMV+krykT0NiBSdtIigWd0JNo1tekYfv/TBJjTb?=
 =?us-ascii?Q?eaub8O038g17LIMyCnqn9AXY15WDcIad01egywFlbFkzz66wiKyQNPLfB53W?=
 =?us-ascii?Q?fO6W1zgxqOIyBecp0DLnD9IVonTXUn5lY8cmd0pNeS0TNGiXr1J9tPHDeONb?=
 =?us-ascii?Q?l34PbXw8L6/kiSdaU5gD7b8hiDcZvVmOynJS+UWr0N4e2ybUtCPW7xGh4sBs?=
 =?us-ascii?Q?6+I6ibX4MpnJZf2akHmZSpB3SpKCceb+RZ4UV8op+xUT5oAH0Tf8YpmFiCdM?=
 =?us-ascii?Q?AUJjoidIkHuKnC5EFiFDUP12ont3y0Z91nbQ1q9IMxxBmZwyv+2rMpvdNeP4?=
 =?us-ascii?Q?t6qLklCchdFxJW34gxcqurHeFpwFQFHi6x+9YTkQtPDycPLQMISPrh7oZSrF?=
 =?us-ascii?Q?yQNT5ReHN81gbUNjkINdga9tTulq73tYVeB37uEvUQkDvEAGFUpXt0QpzoyD?=
 =?us-ascii?Q?0pQm6YfvKVZtse1sKJWWBmJGwX3bU3IUE2aggIiLKEIDCCMsMdMH5UYcZuIp?=
 =?us-ascii?Q?pxyNzxOoqW9yA3Ux1R4wJt+wq+PPohsawANcVmUWNvx545nmYOZE5Kc1cpCf?=
 =?us-ascii?Q?xN7OMZz+q9sCtKiPCsoKVcCEADvsblr3ew/EwdOHA5v4JA+p+KbqEx2Ocf8T?=
 =?us-ascii?Q?bZ2bfVMrF0gB7emBTxfu/XH7PyjUszyaxHsl8xmmglnc7T8Wq/QqXRYMM+U5?=
 =?us-ascii?Q?vwTrAgnG3vK0fcytPkyYGy2do59qrDfwte+RP/3EeY6SC70GjS1BDYz2Mf8+?=
 =?us-ascii?Q?my2j3WaR0BlMOyRj1dishygSeIQkaaj8gndF3qRckkARW9ULIfgpOykqhlVU?=
 =?us-ascii?Q?w8fDLwXur/mHiZKkhyzW9KU5WJlIZQFtBaHRAI8FIEdSa9W7Z8fYLzbKC3K/?=
 =?us-ascii?Q?5UGI9z2vwmW4nF5QdOtAC7Bj6+7Obl6bccYAiAITpvl4mx9o9cl6y2RMHef8?=
 =?us-ascii?Q?QaxcA3ZGVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623b40a9-353e-46e6-0b76-08df2ddda770
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 12:36:52.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tcimEQ/ezfqWITdaS2M5paHpjIKUnJ5wGThdHfMiu20k0yZDECJTudKLc0wcaNsKxOcNv8CNCW/h9yH4L/a0yue3Mkw+V+k6Ixv5ImIWZ5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB549649

Hi Claudiu,

> -----Original Message-----
> From: Claudiu Beznea <claudiu.beznea@kernel.org>
> Sent: 19 October 2026 13:25
> Subject: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and=
 critical resets for s2idle
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> When the system suspends to s2idle, any of the IP blocks may be in the wa=
keup path. For a device in the
> wakeup path, the generic PM domain (genpd) does not disable/enable its cl=
ocks across suspend/resume. Re-
> initializing the MSTOP bits for such a device leads to synchronous aborts=
 when its registers are accessed
> for the first time after resume.
>=20
> In a suspend mode that is not controlled by firmware, power to the SoC is=
 not lost, so the MSTOP and
> critical reset state is retained and does not need re-initialization in t=
he first place. Skip it when
> pm_suspend_via_firmware() reports such a mode.
>=20
> Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock=
 enable/disable API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c index
> f6293c968bcf..3d2281456036 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -31,6 +31,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> +#include <linux/suspend.h>
>  #include <linux/units.h>
>=20
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
> @@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
>  	struct rzg2l_cpg_priv *priv =3D dev_get_drvdata(dev);
>  	int ret;
>=20
> +	if (!pm_suspend_via_firmware())
> +		return 0;
> +

Please move this after deassert, otherwise it will lead to SCIF not getting=
 console
prompt during s2idle as reset is asserted during suspend?

Cheers,
Biju

>  	ret =3D rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
>  	if (ret)
>  		return ret;


