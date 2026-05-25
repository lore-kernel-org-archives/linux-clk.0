Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1837269F
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693623; cv=fail; b=NI2gGq3+SMchxNqIHQQQilC7NCKc2JrpO2BXsgDVRm41FDP1Lx6vyMsMbtY5iUBZbIaiN6V7rdSlZ4lwFkwvOfyAOZmNobIj6wNbsDxRvwkGvNryF02+gBnOH5A8B/KXZrYbLs04BCG4Yn212bCjmDA9R6/Eq0hRmmj/2RiQTm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693623; c=relaxed/simple;
	bh=i2S4JIO98+N6j4ooMscbmjSjtV5477gAfb9SYXJB5+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PsE6Q93x5FXOgh3QeLo50qy1P+qQL+QmjL8I5l6RS4V3ddXC/3v4iKa5QeXsN9qxnzB5A3YdIX12Oe6bAgerrVefFX4fvKTe0aRvTczNK39nyKCCye6L8xnnQUk665DGiC4sPPMci4XT/CUfOZoRLaMCrvoJbKpS7Q35RyuRfiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WkV4Stiu; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WkV4Stiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7kH7H6BAdRtZLnVitVsLp5mKCfN2KYlwwQX+H7JyfFzXJmKMI2a/1m+EjUkEggs7VIUjKnHR0RCq2vUwzwHEnov+5B5uYwxjr+2CRWH5WNGvu1qTheQ/PgbNTMhCBr14oYJxanitc2vUXduT8KgacQV8KbqTuqZx9ZB2cecTiE/LX6iFGPhFxvmLurY1zviEpoMdn3reuxBJD9vnKZOhl7Qh0knx0XUkrTRkv8/VP2k8hat/p5Jf4KFTRICzb9HVUkVrPzXnwou81Y8Zf2cnJe3sFP8auCX2YOJ/S6HeGdfj9W6kQK/1Dj2OQHqfPbPLIYxegzHiQUgDIjMisadvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvz/3c0iqqfEba98/7Pb4bzqQZOCIZzo7DDGhFpNTFY=;
 b=hT1x7y1RrMtVNctKAeq4PgIodtxzlOMmOyyVNenIAW169dFQ5M0d8QyFkxHsweyYo0fjLrPNgrem9VE4NWexWzMcBDB6ZBrUr5sdAni+hThx1YuxV3J8e0zab7+xnElBlzXLi0P9X9fFTXgZ0/V/aYA7a5OOwxNvyQoH6+UFBIcP3agZKmcgtb/9bXSNEwHM1pPyJVq25PeGUXTRnibbVgOtMGDhmKinL6rs6dOgmyZn8Pw9XtQEZ5e8w5G/otD0Px8HfO6t1wihFd3MSXgxh9i3MRySxhBhqxgBbRkadVxifJ591I/3LWO+hHb2j0FN1AYOL6WbImZZJAs2aDmVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvz/3c0iqqfEba98/7Pb4bzqQZOCIZzo7DDGhFpNTFY=;
 b=WkV4StiuLlSZyFvuWoiQlgTikhQtCaX02qN6wWw3cjrtcryaG+izAcasJdau2S7I3Y7qDOQKpJS3aUMJQjGWiD8vE6Z+ZTTqd/ZeEkEE9QWGN/b8JZet+6r5cGU/WQAD0tE8hUd1wnGFK3rrX2ytdCekc8dkk6P53u6GvOZJI3MfQ3Z6omN8HcFsEZ1aF36w97AM7mP+7AoqZYy8eOSHf1iu3p5Ab44cs7zXdsjdNUx7EWJL0xrd7Rlykh3BeSMgW3kLGU6wWX0FcF6o7BJa29ZeXrewzta/Yz8pjq3EUGLqGlmtEAP6Aa8ZNHi9nvyd3vs+SR4AojkQdD4iuG0yRA==
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by GV1PR04MB10965.eurprd04.prod.outlook.com (2603:10a6:150:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 07:20:17 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 07:20:17 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Topic: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Index: AQHc53BBecI129rZHUiMAZsFreUNOLYeAS0AgAAJrpA=
Date: Mon, 25 May 2026 07:20:16 +0000
Message-ID:
 <VI1PR04MB6861629A3AD94F135B2CCFF1870A2@VI1PR04MB6861.eurprd04.prod.outlook.com>
References: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
 <ahOpfhw/UaXoILzE@shlinux89>
In-Reply-To: <ahOpfhw/UaXoILzE@shlinux89>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB6861:EE_|GV1PR04MB10965:EE_
x-ms-office365-filtering-correlation-id: 673e89da-4015-489b-3f6f-08deba2e1238
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|38070700021|4143699003|11063799006|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 68Xucj9UWUMfb11Ib40A/vg5371+jGIoWtKiF/9cUNAuof7Cc8Z6JLDqGBPVtNmPtY1oAyiMoRac7d5olWeX+hSa85MsVJgHbNGmUmKV0j16HwPG1twi2I+EoaPA/mOmh/qBP3FQuf++8w0gtbWWglLfiWphYFb70oMmLAZiH4WV4npzwFgKeVEXOM6lc7GgaNB1oIJYRmOSb6UC8FBthNiVgQ9T0lOah0xJCKMDgWnZvqqvaTVgRxRlsZtcFFCXQ01zuvNFhzPtf31t8W4m0iTwELvIvmZi1CYPb5ncO6DX1E7MzW6LlP9mb/1DhWe6c55atIFh6OXd9AN0OdXsG7LTWqStYIRpFc/Us08EIX49JgRkv2CAowm0l3O75SCd048dCzACTIXWyXTL9Lw+EZFiU47CfxjXCOFmaibQHivvdA4syty283Vl5NaILAnmHriRe4EfhZIEigTh5mDWP06kLnpXG+cVRj1+D/zOfSOp6nWdHiGlOE0EqV6evlcRJVwnZDIm7ZeL29dgmU6hd/4Arn4AcovgaptHazP30bbqHba43Bn5BSAGsuOzqxdN3cvIYiiS+q+vBP905zzfoIv3/AGGvbieIjl+dZ7YMc+lzb1bg3E2q0YsDUFAc0G2CA+udKZFxH5Te4Hy6dGi3oT0deRxHcDCs43OuHYKPdnzOaZe+mT5yg1R14Ye7uwYkyYTSGRBRHxA+5ZiRBT7qw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(38070700021)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EdKPNVmwcA9NTft1FIE8a8OwvCr3xKeGp1SnGpU7rHBUW6zM3kBLkNeGmkph?=
 =?us-ascii?Q?bJdov4+d/cizxYjfuD1DS3bgm39T0Qdilo+ksQJcOlOSPAvDcKpnWTb7jPdK?=
 =?us-ascii?Q?SKA3YVlKmkEt/pGQ8qnVK6dVHMXPVI++HYnOYgC4XanKcByzS62OlwebCWEV?=
 =?us-ascii?Q?cgztfdrOnL0Ezik8Rq05ErLIOrgC8W9ipGQTo7NTC8yCd/F37CpsPY1F/rKL?=
 =?us-ascii?Q?4zmBlqrzz+18ExfH5Yn2LIh5KvLQ0RI3WmiJ+jKe8Clf/Vj5JaGOgFBgZ+Gk?=
 =?us-ascii?Q?0xwUxQkSO0Rh94z7B3qhzPs6WaMQbO/HjKmuf9l2aJxaz+hrgQBwxyKfxu8h?=
 =?us-ascii?Q?TzhkbC8NW8FJuL9Kk8PYMIvLa2FWBwDy2meDNP5ei3KNAavKMoYo6WGkJCqI?=
 =?us-ascii?Q?+bIzpx+/KPkIFYOMP+OsPSe84OXhX44ovRzSqKliMlj53UCDhVIoYP/pI3mB?=
 =?us-ascii?Q?L/5yYxT859VF1GFShwpjolI4DnUI2hDX0g0qFBHPE4NZytVTtqt7GWnIBcYa?=
 =?us-ascii?Q?MoATMJ0HiJYdSkIFjvEbyemJK/ajlLDXh/ZOjHOxLA0a2ldXk0AGEmOlE55X?=
 =?us-ascii?Q?P+diXxJgSiDYpLTpyR0bZK2/PGXwvb+UZ0S7Ud9gV50UxWGfXfiAz8DyRX0s?=
 =?us-ascii?Q?l8q+yo+nBoVDCxucXlLHg7dKJS/9TExVfYeyez2qtbV1/WL0l8Tvf1+3jy3l?=
 =?us-ascii?Q?td7vSOVP9oQJo0RqRTc2BkZ7cIeq9Z18ZrNzcfOlj4PDNSwYuJWBit1niYOF?=
 =?us-ascii?Q?jJPW3D0W+G0jKn06hO2z+2Lmgn9JU6c7mI92CxCxf5Ge450MehgdulyKq86e?=
 =?us-ascii?Q?/TNnDUwRuEfxNp13TjAJOnQQVCampLO7oaSw7VFp15BbJmMAMN0Yl049X/mN?=
 =?us-ascii?Q?64jeOdoiAyhvbqWcltrrSXmEe9nKK3G02N6X757m/G3O6ACGR54lrqM930Sd?=
 =?us-ascii?Q?Z4Cpb3+eeKyNq7Z4ibuivIuzLWV3fa/pKNQQNioTd1St/E+7R8ELmGg5qCa5?=
 =?us-ascii?Q?56V73i2U31Vs2CzHGNt3qym9tw1EUBXcXROXZshU/yggaYjpmWQamYmhPJ92?=
 =?us-ascii?Q?efeDkbVSeK77g7S0UoHKmJ3ZSt/KOuATFkLgOwacfXzinzazfbaYSBWUOEFI?=
 =?us-ascii?Q?c0tZOMJBNcIEDjOJyXFOMQrh5qq6WkXf2HX09rV2u5Ce7F1s0RWKgRxnrBhk?=
 =?us-ascii?Q?l26OPMpy+qQYoYJczqtkxdaNm9pp005QtXNUT98UAJk+dsuX1aSaAFryoisB?=
 =?us-ascii?Q?NdL/BG6kqc57862PhwuvusrQmX7WEpiVxUkFU3H9rPJn5h2oWORWe/4JbDSB?=
 =?us-ascii?Q?N6ITBWJFXDnYj3BcMSE5YvqlmgrSRRSty/AD94cgobTZfsOu6sGW351FeZe3?=
 =?us-ascii?Q?EXwl8oHz4lA/AiAHVNaQ9OZTkB3C7i+1LJKiCHeTRtFSPl4jKyqHihmFzsq0?=
 =?us-ascii?Q?EjZDmHGFDHdXYKsy5nx2/WEeQKDGpojck9OBpkBmsWbS36OZpOXaIEX5FyxA?=
 =?us-ascii?Q?/czt6Rh/ttEub1+WPlGWoHthDRRxBVTnbOjojNDJUz5lG/de1vz8WocmIv+D?=
 =?us-ascii?Q?NTtK6TCrKJLT6ig5iyq9j9rU/u3W7VZhWjTiRg0VXipRx+nCbCmllPA3Yw88?=
 =?us-ascii?Q?ZG1EI3saAu3XuKLSsjLBqaAsD4jL5BUVsHK1W7pzAA8wXqGaBFxnC453KbAR?=
 =?us-ascii?Q?cHShnhck3LjkmAHrvDH5AI6VvpUdVhwX4v2J8eZr24ExyIPF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6861.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673e89da-4015-489b-3f6f-08deba2e1238
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 07:20:16.9895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zJqQ3sW3nXip7yFT/QslWcjaEp34Sp6dHiIwLx7XiM9oKBu3+H3sYH3LGNCcVaa1XfvWzTwZ0IsCdwzDqB/Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10965

> Subject: Re: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider con=
trol
>=20
[..]

> >@@ -374,9 +379,13 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw,
> unsigned long drate,
> > 		div_ctl0 |=3D FIELD_PREP(SDIV_MASK, rate.sdiv);
> > 		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> >
> >+		spin_lock_irqsave(&pll->lock, flags);
>=20
> Should this lock also protect the setting to DIV_CTL0?
>

I can add the DIV_CTL0 into the lock scope in next version.

The AI review agent's comment for the spinlock stuff is just let the code l=
ooks
like correct and useful, but useless in this audio pll debugfs real use cas=
e.

BR

> >+
> > 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
> > 			       pll->base + DIV_CTL1);
> >
> >+		spin_unlock_irqrestore(&pll->lock, flags);
> >+
> > 		return 0;
> > 	}
> >
> >@@ -394,8 +403,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw,
> unsigned long drate,
> > 		   FIELD_PREP(SDIV_MASK, rate.sdiv);
> > 	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> >
> >+	spin_lock_irqsave(&pll->lock, flags);
>=20
> Ditto.
>=20
> >+
> > 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base +
> > DIV_CTL1);
> >
> >+	spin_unlock_irqrestore(&pll->lock, flags);
> >+
> > 	/*
> > 	 * According to SPEC, t3 - t2 need to be greater than
> > 	 * 1us and 1/FREF, respectively.
> >@@ -508,6 +521,8 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct
> device *dev, const char *name,
> > 	if (!pll)
> > 		return ERR_PTR(-ENOMEM);
> >
> >+	spin_lock_init(&pll->lock);
> >+
> > 	init.name =3D name;
> > 	init.flags =3D pll_clk->flags;
> > 	init.parent_names =3D &parent_name;
> >@@ -551,3 +566,95 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct
> device *dev, const char *name,
> > 	return hw;
> > }
> > EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
> >+
> >+/*
> >+ * Debugfs interface for Audio PLL runtime monitoring and control
> >+ *
> >+ * This interface allows dynamic adjustment of the Audio PLL
> >+ * K-divider for precise frequency tuning, particularly useful
> >+ * for audio applications.
> >+ *
> >+ * examples for the usage of the two interfaces:
> >+ *   1): Get the current PLL setting of dividers
> >+ *     cat
> /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
> >+ *
> >+ *   2): Adjust the K-divider by a small delta_k
> >+ *     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
> >+ */
> >+#ifdef CONFIG_DEBUG_FS
> >+static int pll_delta_k_get(void *data, u64 *val) {
> >+	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> >+	*val =3D pll->delta_k;
> >+	return 0;
> >+}
> >+
> >+static int pll_delta_k_set(void *data, u64 val) {
> >+	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> >+	unsigned long flags;
> >+	u32 div_ctl1;
> >+	s16 kdiv, delta_k;
> >+
> >+	delta_k =3D (s16)clamp_t(long, val, KDIV_MIN, KDIV_MAX);
> >+	pll->delta_k =3D delta_k;
> >+
> >+	spin_lock_irqsave(&pll->lock, flags);
> >+
> >+	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> >+	kdiv =3D (s16)FIELD_GET(KDIV_MASK, div_ctl1);
> >+	kdiv =3D (s16)clamp_t(s32, (s32)kdiv + delta_k, KDIV_MIN, KDIV_MAX);
> >+	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
> >+
> >+	spin_unlock_irqrestore(&pll->lock, flags);
> >+
> >+	return 0;
> >+}
> >+DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, pll_delta_k_get,
> >+pll_delta_k_set, "%lld\n");
> >+
> >+static int pll_setting_show(struct seq_file *s, void *data) {
> >+	struct clk_pll14xx *pll =3D to_clk_pll14xx(s->private);
> >+	u32 div_ctl0, div_ctl1;
> >+	u32 mdiv, pdiv, sdiv, kdiv;
> >+
> >+	div_ctl0 =3D readl_relaxed(pll->base + DIV_CTL0);
> >+	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
>=20
> sashiko-bot brings a valid concern, you may need to protect the read
> operation.
>=20
> [1]https://lore.kernel.org/all/20260519095044.996B7C2BCB3@smtp.kernel.
> org/
>=20
>=20
> Regards
> Peng
>=20
> >+
> >+	mdiv =3D FIELD_GET(MDIV_MASK, div_ctl0);
> >+	pdiv =3D FIELD_GET(PDIV_MASK, div_ctl0);
> >+	sdiv =3D FIELD_GET(SDIV_MASK, div_ctl0);
> >+	kdiv =3D FIELD_GET(KDIV_MASK, div_ctl1);
> >+
> >+	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
> >+		   mdiv, pdiv, sdiv, kdiv);
> >+
> >+	return 0;
> >+}
> >+DEFINE_SHOW_ATTRIBUTE(pll_setting);
> >+
> >+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> >+num_plls) {
> >+	struct dentry *rootdir, *audio_pll_dir;
> >+	const char *pll_name;
> >+	int i;
> >+
> >+	rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> >+
> >+	for (i =3D 0; i < num_plls; i++) {
> >+		if (!IS_ERR_OR_NULL(hws[i])) {
> >+			pll_name =3D clk_hw_get_name(hws[i]);
> >+			audio_pll_dir =3D debugfs_create_dir(pll_name, rootdir);
> >+			debugfs_create_file_unsafe("delta_k", 0600, audio_pll_dir,
> >+					hws[i], &delta_k_fops);
> >+			debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> >+					hws[i], &pll_setting_fops);
> >+		}
> >+	}
> >+}
> >+#else /* !CONFIG_DEBUG_FS */
> >+void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> >+num_plls) { } #endif /* CONFIG_DEBUG_FS */
> >+EXPORT_SYMBOL_GPL(imx_audio_pll_debug_init);
> >diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h index
> >aa5202f284f3d1b7c1b4bf65e2329831832b43a5..16e0bafa0c9b99cb4eee37
> a216e0a
> >274d27f11fc 100644
> >--- a/drivers/clk/imx/clk.h
> >+++ b/drivers/clk/imx/clk.h
> >@@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name,
> const char *compatible,
> > 			       u32 reg, const char **parent_names,
> > 			       u8 num_parents, const u32 *mux_table, u32 mask);
> >
> >+void imx_audio_pll_debug_init(struct clk_hw **hws, unsigned int
> >+num_plls);
> > #endif
> >
> >---
> >base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> >change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617
> >
> >Best regards,
> >--
> >Jacky Bai <ping.bai@nxp.com>
> >
