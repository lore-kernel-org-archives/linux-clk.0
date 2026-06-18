Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFEB40D56F;
	Thu, 18 Jun 2026 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746698; cv=fail; b=puS/Nr/LEDDPvXNsBk5mlAemLo7twhjwPcpfwZblPEYmw0+Ah/dOl25MHjLZEyg8xh3+L/YegBlcHx+oUDpvkq1sXpGedBhOYFBjh20VGzxsx/Bpw+CMJVW5qegdEHseTk2R8hS1++H2zWEAOp/Fm05ioOsm2ZfGeRxO02oZ27w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746698; c=relaxed/simple;
	bh=ViObcmt+RPG4BrzXjm4K/k+rT84T3U4yeZsnAyDJs/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pb0Fy7lbFw6dWETgUfyMMJWMPMi3JK75oKGOpK0EoAH6M8vDtHnTzE/uTpTMFnnQQDqVRJe37QQOkCrLoHVEXsxXU0fGPiPj1CpR6YJE4wU/PNMB8isKwNyYN6MBCg/nfKL8Zwv9uguvbssdRM3heHYvQtCxf35OltbtpLq2gEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HY8phaMXQfSTGqopJIkM8mGOfBzOphFYHm6tI/XW1jh8eb/ktAF2igJOQ7w4TRDyv6BfNXDNVx+VQc9hWhjgnF7FRgq+QvxMW9dEnRv30RgaQeF4ZJ3sUQo/GaCfZbkr7jQ89NO0ObK45VJ2ACxq5tSdTOm4Gj/IE16tJ5E30WKEa7TG0+7sue3q196TysqrPXzl8JY5X1p93zKqsRamNiizIPaZXAkLRNJauVI9JgK9DwXY2rz4vQeVRU6FtbLUQGb29O/iZBbUxbOChnEXGcBkITu0ee+dGSjk1eo84hNXzitUnAqtxw1L/C4Kpi9nXL7tWMhAp2mj0l1Dy3x+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx+oCIYw7pnE6Oe6BL16tADR5lfdwp3y2dQGqPvIuzM=;
 b=mRdyDK4PnU30DVz0qbJdEvuXb/kXpAQ0XmK2xxPtPIbE8tBDzRLNPjzzaLDtm484K36kxTTw0oc0lWAHXTJKwnLCGoGdgvdXm2UfsZ3pX3O3MiHiS532jFTQ7+vjZORGSQb3Ze3amvLqV90pFuh3f5Ug2ZdW1svRZLrf7iMCqDKpJ/0IL8ICKC2JH08a/bzWULNVSEoMhWwdS4aME+QjQqjZaFEN3egkRCvof+PjukiYJqtnFXz11VGQkth1HKJowFhCu2CGb93xjMuhuvey+eqzb/zGMX9dw8mPGizyTeQSN0aeeHC4Chiz4oy3ZaNbvI7QfwrWy65GxZyuHHlGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEYPR06MB6081.apcprd06.prod.outlook.com (2603:1096:101:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 01:38:11 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 01:38:11 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Conor Dooley <conor@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Topic: [PATCH v4 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Index: AQHc/h82j1xzThlNZE2rRWrnghTKn7ZC5tYAgACjKGA=
Date: Thu, 18 Jun 2026 01:38:10 +0000
Message-ID:
 <SEYPR06MB622637A23217C46C11203F4E82E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-2-joakim.zhang@cixtech.com>
 <20260617-chummy-automatic-6c11e9958bbf@spud>
In-Reply-To: <20260617-chummy-automatic-6c11e9958bbf@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-Mentions: krzk+dt@kernel.org
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEYPR06MB6081:EE_
x-ms-office365-filtering-correlation-id: cfc0d70c-cc6d-4802-c0fd-08deccda41bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|18002099003|22082099003|4143699003|6133799003|56012099006;
x-microsoft-antispam-message-info:
 F62uhADcRgRodcpjFHXhBmeHIgw2Hjakx1HF/TA+IYlrpXEuMO5stMarg5fKMG/TTKwA8uPbKEOZ4W9RTt/CHVS6mdZkwAstHJ1KvuonCfmUvGf4esm4O5hIjrWWduB8tefC0Cr+v/Mu2ezUYlTil2xgW/BcsXcKwDKQTKHhx6pD0Z85BN4PVNcLvpcsschzRYk1ggXKKTi+LXbYuBCMVYxiMgGmmR3Z3kbj4pO/tTv3YBYInobjsVw8wIkML76NpPout4KjWHg4waH9ChwMZbhx4D/BcVFxJh16/GrWnDE1eRoAtPa3VIOpZfoLtB2aD5uKc0M9QHYhVod6wroyMOBhXJd5u86u67qKRWK8/bccU5WhWfweYxg8gZam+10wZ+uBek03Fch2J2qCTYgLqu7WPU0fCEgcNkzeGiWGKwRiAPmnL85ZK+rUd1mEJdli6EMiWPDAm3Yth18aY3lzJZdoAf9iSrd71uKMx3BGalDphh7SCX5CnjAaB/E2dbKc7iGaS7isjaBo6N/K4fj/FyWMWSAvsdzjOihCGG9DOpJKi32upfkirzLEac9SxbRGdvpYdwtm1Am1khH7QeFAFOga0dbK0gLJ1QizXMc47X3ZFf0gXyU/mB5V870yVtmGc2R+QU52+nc6nMo9uN+kuRt0DhNcPVKrNT/OZVYh8aeU2viaFriHylKW9wThzHXjdX2pKnuL+vTRhzVy+hSURKXCYz3JFGZY1XjR8r8x7Q+lvicelKG3zF4SNSb9TZ09
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SeKbu0InFijCNdUe1E/X/DFElNnu9h/iK0WJ1D71AQ37S+sYoUTbYayZyZ0k?=
 =?us-ascii?Q?CIS6oZARD+oZTEYAuKZIYhfHyE5Y0Mnvv2PMzFcMmwNhRuunmRSadTMceqtX?=
 =?us-ascii?Q?DvM8lCEw7NQqSOtg4b5Pfm3GY3n5EmWCYSq+oG5Z5LXW8rNM5Q/2m8bGbJPL?=
 =?us-ascii?Q?ve5OKxjP2JluG766+Tfy4RNvWYbmjfAbPYPWRqG0QSqZX6gjcEH/Dzsoffed?=
 =?us-ascii?Q?n/3n7dzPZ9gt5xkXfSiW6vFvEQk0HpaIDJSVvDkdJelIPwHbK1zmSW+HdAdZ?=
 =?us-ascii?Q?VIEb5PgX0Ljwdkbov8SH5KYCB04UABL/Qiwj6AwknmHWoJJKtlRuzZQ7e+M6?=
 =?us-ascii?Q?8KZGzu6klyxyr9uM0E26p2HpstYmiToYvEA1wg+ht6bPweOtCxKzTH1wfgcZ?=
 =?us-ascii?Q?vMMaw1sXj7jfSV6Y1L6fKQZ5FJNEg2acH0SO7G93bjXDC75Okjboddy095vg?=
 =?us-ascii?Q?5VxqWNGX1wF7cOf/gXka5GhrIRJwHuNhCty908WMiSIO4phqAL1sdXUDZANG?=
 =?us-ascii?Q?yLu9+BDQhZU2Wc4PAwW0zT6gqHaZKe6wDu7TYi6TRIbOK16HlwwvEl0X8Wjo?=
 =?us-ascii?Q?qDuUkg70qmyk3J71aw/D9oVO51Kb1tJRs96sR+U65zMowrKoUkm69SFTUum3?=
 =?us-ascii?Q?LnsR2deJsaEOI09mS9zbX4IWJzNyO7lixUm1L3yYLx4AZ1zNMeJyBK4hE3Tx?=
 =?us-ascii?Q?tbgCLcZx8HQ3ZUQb35ZmzJ0yVuMVtKuwT8Wzcf3tmEz579hGhb5QdqfHXEbW?=
 =?us-ascii?Q?YbfQSx/i6B6LwwAS9NRAAQg5Iy03Rgo9lVXzd9XKG6J8/StP0HdBbOC5l2Kx?=
 =?us-ascii?Q?MafQ7Tv/mCOu9Hb42nqQ1Pji+cRMlt4byC3oPEtvpNFzVdjgrR4rtwy0f1y2?=
 =?us-ascii?Q?ObGHcoNdTMSR6ZuaRqXZOmF2yaHX7AR6fwut5H6uJq6kqPvxDdqRsLmbnEtY?=
 =?us-ascii?Q?fk0bkE/B/ycWfIhAHZG/lrKnnBOB70sSAAXsgsQBj5FlcZPGwAa3U+5JsL37?=
 =?us-ascii?Q?gMB/YNSSIf/ubV+bh+f2G++5BF8LCfUiv5WLHe9OFJ6mIlwiSMwTM15Ph++g?=
 =?us-ascii?Q?kgEfTWVDjWRSypgjk9L1tVh53iCNq725dFaLh4KaR+/s0Ef+I6WVUE/KMdyP?=
 =?us-ascii?Q?Sd04qZli9sZwOXWJrv1ZRfC8CykjR2yDubpIWq4iLd53oA58v9/VpH32PwQO?=
 =?us-ascii?Q?luokt6etloLHQyViqoHFnqhpswJz0QIanPGyf4tJ99nUSfEJvRg+mHiRYF37?=
 =?us-ascii?Q?Rv6JlV2XU3LcEDj6I6Hh952eg3EKHOUp77L8rxJkTfFCb07Ra5GXirL95fhH?=
 =?us-ascii?Q?BAQNiLhx2wWsAu7fU9C+c3bmTT6kIWNN6Vi+KTuef2946uJScCQwIteDhMIj?=
 =?us-ascii?Q?wmk2dkfE1K1seWncf3WB8sfJHI5tZYi92BQmHPJPHReVyMO7PB4zGcgTp9Iy?=
 =?us-ascii?Q?NH3e4nw6ElnBH02iHyVxDKnKSMXqf+epq/JsI9Yqgv5CqiwderOoUhy5/aBP?=
 =?us-ascii?Q?qkvP9FkzYsONYBzweTU2wBSZ1QG8oFJp5NM3HRF3dXsmYvFzCQXk0Q+hkdW4?=
 =?us-ascii?Q?gTFAP/92hLaDX6cjLGNaNEmrC4wBvy3yYS9EOyZaTuHA9iluLz8Xm3jiv4bs?=
 =?us-ascii?Q?btmoXqCu96hkpPisTPyTaZncIIn2gBzfMnD11VAs+pDoZSoj0bmok+Au0gDx?=
 =?us-ascii?Q?YnGz6+glYxzJ7EcTsEAvxdygU3LXgMjkIOQoOsmhL4hyTObKM1eHC0rOQESp?=
 =?us-ascii?Q?Vn6eaZm6UQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc0d70c-cc6d-4802-c0fd-08deccda41bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 01:38:11.0314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5pJbvkhLDq8JJ1eRGXV1OS3A8r/2GYK4+8f4b2zTQttflhFSvOBh3rfjDEOde4NMiGuv/l0NaKeW+GOk0q+Lz0p6QsGsCkVm+xyYM4Hae4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6081


Hello,


> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, June 17, 2026 11:54 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>; cix-kernel-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v4 1/5] dt-bindings: soc: cix,sky1-system-control: ad=
d audss
> system control
>=20
> On Wed, Jun 17, 2026 at 02:04:33PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> > and control registers in a dedicated CRU block. Software reset lines
> > are exposed on the syscon parent via #reset-cells, following the same
> > model as the existing Sky1 FCH and S5 system control bindings.
> >
> > A clock-controller child node is required under the audss syscon. It
> > has no reg property of its own and accesses the parent register block
> > for mux, divider and gate fields.
> >
> > The AUDSS is also controlled by one power domain and reset part.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  .../soc/cix/cix,sky1-system-control.yaml      | 48 +++++++++++++++++++
> >  .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
> >  2 files changed, 73 insertions(+)
> >  create mode 100644
> > include/dt-bindings/reset/cix,sky1-audss-system-control.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml
> > b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml index a01a515222c6..5a1cd5c24ade 100644
> > ---
> > a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml
> > +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-contro
> > +++ l.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - enum:
> >            - cix,sky1-system-control
> >            - cix,sky1-s5-system-control
> > +          - cix,sky1-audss-system-control
> >        - const: syscon
>=20
> If the only thing these share are being a reset controller and having a s=
yscon
> fallback, I think it should be in a different file.
>=20

Thanks for the review. I'll split the AUDSS bindings into a separate YAML f=
ile.
One follow-up: should the AUDSS CRU driver be split out as well? I'm inclin=
ed to do that, so each binding maps to its own driver, but wanted to check =
whether you'd prefer a separate audss reset driver or keeping everything in=
 reset-sky1 before I rework the series.

Hello @krzk+dt@kernel.org, what's your opinion?

Thanks,
Joakim
