Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023105.outbound.protection.outlook.com [52.101.127.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0D3A9D99;
	Sat, 30 May 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142658; cv=fail; b=OyqTHqJwDNgD6YLVmz9grhO/lU6B0ZYUUIYJvrhMwmy+HvCYX8FRY80wyvQxNzNdfywlWqz35lu7fBLE03U+6DYxj2Lfc7hKmlgWi4h6J0wz8jXfFk/xBewxgXum+UuC0PijOyPT5mTWmnlLBjbv3dDeRezUlpfJahCGHEm/YnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142658; c=relaxed/simple;
	bh=Vx+nHBH3XEoxQFNYSstwyP+oSYZQA4L8WY+Xi3Q/3u4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KXcptaNZu6AsyQuUWvedFbESgX/GdyQR5Es7T/MMBZTZeAdW9wmPguFALuHcTaFB92A0mteaXD9gIqIuSKdGw+J89L3vKWbShkOi+k80e+BsXA7S5Or5Q5SHAVnKoE8aQZIk+6NPz0RLSp61YQl9xp79q8IOwhiiprnH2GMSZ2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=derdc7E5fjYea6uophdNTQ7Z5cnYqwKBZNepqlGGW0MaETQwq8F/1VrD/4TR9OWB2526hezzolFMayHngrk+Ay7duiT4wxgiywvAS1HwZIfTm0amWOG2+GfDr8KyaTPod+MffSIR7YLzBgg2ksj4TeEMPbqcrA8ypxISEii/37gVtCzWyT5jL6+XoVz9QrYka8AWBwSiO9nYAjM+7jlRVob6p70JTqf3gHasF5HlRhBIgjVgF/CK9xq3QqZSKq0VjibCE2sd1HbZVgpYvA5zUeBBKkP0cBxyKkCq+pDTcSKS3yfjWfHETAUuDGrECqONqrmBzUcfXEvalF8Fq9kTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8twPjZPd8A+NWe2dpBKPDAsajVozrKnaYUDfbjp6gVU=;
 b=N+MilLIaS5tNpPYEXRwWxsB6NWYUe+kAvYIQ9Ny53yewE2e8pPo3lvetqFvsLu5gN9vyFVBI9yOdlJJRVIefkXFKstmPgG3GRB9e0fqt5FAumQJvlCDnU01OBpya89g90VrJlrG8URofmEkttV+ZHzw8ALtmHjNW1su9dm6c5DR1sN/CwWNL//m1fDtRAWxPm9KWatBRWWKlXorOJp5WBZP2+n+j5MCSeoE5faa4cpdxjwC8rNxZZsql8OKQ2PS+kj4IA/LZgHJFOF5yLsxIf04Ey1U66+TGhywURDSO6OBYxZLkIJYaCuwNwCXGoHn+zSRakwchmWpR5RTPRvubdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by TYUPR06MB6193.apcprd06.prod.outlook.com (2603:1096:400:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sat, 30 May
 2026 12:04:14 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 12:04:14 +0000
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
Subject: RE: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add
 aduss reset controller
Thread-Topic: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add
 aduss reset controller
Thread-Index: AQHc79pg3e8btjBSt0qe7LG9PgjwBbYmSNcAgAAu4SA=
Date: Sat, 30 May 2026 12:04:14 +0000
Message-ID:
 <KL1PR06MB6236ED153961B695117A0B9A82172@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-5-joakim.zhang@cixtech.com>
 <dba033ec-1939-40b8-8aa0-26750b9bd591@kernel.org>
In-Reply-To: <dba033ec-1939-40b8-8aa0-26750b9bd591@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|TYUPR06MB6193:EE_
x-ms-office365-filtering-correlation-id: ce125586-5c47-43f0-d040-08debe439172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|18002099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 M5uSd9MHlLnSnTUagRZ64JGnlTyF6GOQOI917O4dNKzPiT8vlYGGgJ2bw27Aoovuhy3b+SAMVLZw2cLUkjoPpbl101wBjWbJb8HrmaGLyzG9dJXgv5snaqa6daiw9mGIWNZSi7uqajxy+dYPD+kiAz1oWm0BnoOYMrXMq0+uhqdRFbsazYhiBYOmMviuuq2kiK0NDwutE080nmQOhosnlV/AtxK5nYWlBYEbxP4gx7665VuBXKqm8PrXvDNSU5cnFOw8Gn97IdPN7DOW0YKsnXgAFELP5udOInx14EvVoJCcGJHZIUvWurMc/qZ+INMfjHXicld4owXGOplCR0RnPBSzgwe9M+9mTuAMTu+q8Q+czN2t7ZmZmMhhlthMU4CwPBUZSYHLsUK1DuICDXOFwghPUJkPoV3zqZ/tM/ykR0L1FpU7IIWPlTN89LAhZR19Ug024xlQ/YNhEsD6fghdymdl9AsBkmcWLc1WbKv7GMJTb6SUrt2oMHA85IRQrPcbx5OkfbksfX0if55v102mzKE0l6G4lIGApTVctlfZ9sjSfY9NavYZYakQ9hLt8ItwhIDfGifhE3NJfMXr/J0rXHWzEsxYmcTIQ7qPO+64NcJxKL78Kmkp2/OaFjPHeX8uSrpO3OgDDd/bKg4e2ha2iLVED3RKgxfigqCurXHrsFCsUmgZaMCRsvtnMJCnPjomBlpkHnH1fo7X9Gxae8/N5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uCgS7KRqaHdcZU87zD1VpvyB+YwiNs0RzvBKnC4SFzYUfGqB7JHit9Cw43eY?=
 =?us-ascii?Q?7LdIEO2bj/LQlWxNmEZtuGzfJN3fzfE/TIebnxf8OyfFbVazdbFKu8yuhkgv?=
 =?us-ascii?Q?RRfhK5P6Blzzdp1zeW0Eo00dCGpagF778GVlrqxOZbcHsTKMKUYcs9/b7hhW?=
 =?us-ascii?Q?/rpSw5+dMrxUOGoOh5GVuJ0NJ/0VBqgjiPXQHSVfcq7fIlnuVxgxFS9Al+nk?=
 =?us-ascii?Q?Iy2MwGs6a/Vr1p0PfyA9TXZ93udnTePV55c3GNI/aHyvPiTk6NzQqFmX4Pri?=
 =?us-ascii?Q?5MQXQlutS6CMYxn7JNaRr8uA4WyNVZ0xtdY81xRN/NHdLRmFY16olkCz7PnN?=
 =?us-ascii?Q?gwTd5g0bQkhtKdtl2HC/CqzgFgTlZZMKodgTAF17a+bwHVCPnwZ+o2F0Zbgd?=
 =?us-ascii?Q?9VTZK8ewrTNKGThFUVjTNdS9YeMDxrtO8cfejlRTvyP9jFwoVlVGlVuDursU?=
 =?us-ascii?Q?owLQwsvLmQAKxFeicrAMwirJgsKAzs4vceVSqiy2L9siDvFW6bbvljfa/XjL?=
 =?us-ascii?Q?9+avvvV7XpcoGhlPkw+E3XkOEgLDgwRUcjYduJ3Pa+Wbm+AIjcg26R0fvpCm?=
 =?us-ascii?Q?HNhKO3zaiE6qF6erloBMmEdkZh8roKW0rByHKficnPgaGXrLQyolwSg9meYj?=
 =?us-ascii?Q?/dSLG2QDZxA6f5rkdbFLOX8GTvSxa8dxprbhcN8at/W7PhSBtEjlGc1vtUHG?=
 =?us-ascii?Q?dMc4Evg7R8pqMFAdbZITT0SmH8uygDcyhxtt08P+4Ul+czLOWORv8fo2cFy1?=
 =?us-ascii?Q?OwQCNMrd++/sDsb0/+RdWkfMWNN8OivZlHWnZYp0HeHyZdniLOR/ywmqIzwE?=
 =?us-ascii?Q?+lj/lX/+INvdr+kbL1zwPBOCNKWsK+zGJibQVFQJr4qweQPycK1klccIxYmu?=
 =?us-ascii?Q?s0/avrgmmTjXocl878wAU660EOZs8PktML5De2wtvfxbaJsO5nodpaolQI93?=
 =?us-ascii?Q?F+0aVmaYLhLoWIk4V3b7Q16jZFOrkcSWupVikv7nm3zZjcBVN1I/Jcg1MAh5?=
 =?us-ascii?Q?JlmiyCXaazM3q2Li16hLaQnKTlOz5b+uiGEYDu7pYI4O4ivQnto0zbKoCIR/?=
 =?us-ascii?Q?kcH3piOuhPWyaGIWUfxEORE3tsag8rZ50u0x6gPn4NwH212qtuE0zivZRPKs?=
 =?us-ascii?Q?ZqQ6SNScWFMxFrUnt3oqaKgIfgFT3WDQZBLMNrjPWGzNYwtiGe9FzTaveF2Q?=
 =?us-ascii?Q?PWkmo+718AG0+ZMqAy5LdCxIb7SQ19moPh7pwXjSC+8lB0sVqcrmaDD9RXh3?=
 =?us-ascii?Q?/TxhuVfOBqQrM+dJFCwxFwdin7s9p3fxNj+7/j6Iouh35xbsDOuSXBjrhJUE?=
 =?us-ascii?Q?6laxdZP7i2/c1DMiKKTE5XmJ7PXlp2uXldhfCNtyqenfahcAe9Z7z1AznyQQ?=
 =?us-ascii?Q?Pbv0geu7bJUtWWQPYm9Vzm+Ij0ESCJ9ONa2VjcaQQO0yjy0g9K2thGUW8D2q?=
 =?us-ascii?Q?BzY51uHnOkf3/EmMfHw2rauxLxBrHzYdIPsorUckVyHu8DQ0Y3sjTGsKs4T4?=
 =?us-ascii?Q?/X3lEcB4hYeWs1jAvYd5rUN899hvNEnQRUCPVWux2Q71nZb1W+TmBHpfSa3G?=
 =?us-ascii?Q?kequTyHiqqremlpdSj8B62eino6lAEOy5eCS/uWN3xGk28ZdEWVZJCFeU7yY?=
 =?us-ascii?Q?ARdUk1HRrh1io9yfM/h5UmZg8S1t019p/O8k3CWs/xHkvEasZOPGKmkfaCS1?=
 =?us-ascii?Q?8zuGwDZ5HfMgtLogUMwCdh7bzjm4vK+V/zl38Wxe+0LKbAh30rWqLgpHQooL?=
 =?us-ascii?Q?Lul7qwhmIg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ce125586-5c47-43f0-d040-08debe439172
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 12:04:14.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdrUqs6IfGyQEBSG98g+zrf2gGpjb2JV6OckxSOorboxYVX21s2nMrSBTb2iAinIE5yFsig3gLRVsMx6OSj+IaFDy48Gm79kbi2R6+oCkV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6193



Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, May 30, 2026 5:11 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; p.zabel@pengutronix.de; lgirdwood@gmail.com;
> broonie@kernel.org
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; linux-sound@vger.kernel.org
> Subject: Re: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add=
 aduss
> reset controller
>=20
> EXTERNAL EMAIL
>=20
> On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add schema and reset IDs for the Cix Sky1 audio subsystem (AUDSS)
> > reset controller.
> >
> > The compatible string is cix,sky1-audss-reset. Reset indices are
> > defined in include/dt-bindings/reset/sky1-reset-audss.h.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  .../bindings/reset/cix,sky1-audss-reset.yaml  | 50
> > +++++++++++++++++++  include/dt-bindings/reset/sky1-reset-audss.h  |
> > 29 +++++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
> >  create mode 100644 include/dt-bindings/reset/sky1-reset-audss.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
> > b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
> > new file mode 100644
> > index 000000000000..8e02ddd2517d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yam
> > +++ l
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/cix,sky1-audss-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cix Sky1 audio subsystem reset controller
> > +
> > +maintainers:
> > +  - Joakim Zhang <joakim.zhang@cixtech.com>
> > +
> > +description: |
> > +  Reset provider for the Cix Sky1 audio subsystem (AUDSS).
> > +
> > +  This node is a child of a cix,sky1-audss-cru MFD/syscon node (see
> > + cix,sky1-audss-cru.yaml). It does not have a reg property; software
> > + reset  bits are accessed through the parent CRU regmap.
> > +
> > +  Each #reset-cells index maps to a software reset line for an AUDSS
> > + block  (I2S, HDA, DMA, mailbox, watchdog, timer, etc.). Indices are
> > + defined in  sky1-reset-audss.h.
> > +
> > +properties:
> > +  compatible:
> > +    const: cix,sky1-audss-reset
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +    description:
> > +      Reset indices are defined in include/dt-bindings/reset/sky1-rese=
t-
> audss.h.
> > +
>=20
>=20
> I am not really reviewing this, since you never tested it and did not fol=
low the
> process, but to spare you one review cycle - no resources here, so this i=
s NOT a
> separate node. Please read writing bindings or
> DTS101 slides.

Sorry, that's the meaning of " so this is NOT a separate node ",  could you=
 please explain it more, so I can update later.

Thanks,
Joakim
