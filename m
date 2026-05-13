Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250202D6E66
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659311; cv=fail; b=tCFOG8qko8yRiU2r4hIvyJJ416+Q25hMJvBpLCLko/6ikTFPQX6mhgc7CPQ/vGPeaXlOzRNM3CFyZVDirIKXLFikgnsuMDf1iU7zwsuKIb6TggYor6AwPQVoNQO/bo+glLdN+80yvSC3Hq29b+F29FErvNK1HPxnbMmPR22onMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659311; c=relaxed/simple;
	bh=6f6c6zzCI7nrli89g3SFkxImoMbTuBn+2FpQq8hJ7Uw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BxKnd8NtQp0LoZTgy3dsK1jR/6BZgH6Qf9wOWJLtX9soY0KLUx8fFgKsQ5wphJRvMHLb7fSKl46RVMXz5AOq66XGXvDYaAWe4XZd/r/tKybDB5F1m1yOzbAlF5CYGPrvfVE/sHHeJG9yPVaQQq3C2s1bnuTRXFmwGCd1QuPTstw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OqTesnlc; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OqTesnlc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/t4/n2E4ZX3qzvzMdD0CElCzl/y/4sUtaRsDOo0Vn/80ecf3qrWCw7wbtj6ymwkLauRepZoy44HzoZMrJ/KpDaZzFRieGqssImwfr3kGzjKu5yKbWZR5Uh5WJquS82H45R1nM5vZ+pMpUzoKKnnafZSnOPMPf7CiFdQ3nWH4knU2rZCTOyhkx6t+/0cNydBhhKw0Mf21QlT8cOw+RTZut17oPXmAXWI1qn4eimpd/bsQHw/1LwYwfv0xy9Fx7GQJ1P70+DiKnt0gOI8QOxVqLY3Zd00JNU4ashxTotZUfJ25xb5UHKrolJvjXMtwn1DpWMlZn2D/CV3ZIhFIh9YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6BgwBFtLA5xUK0sDwuQ1+RH5pp1UQTQgiMUA0OMuKM=;
 b=MqP5hzrrao3c2aSS3hE+RzCNJBVw6VFamodxFwciUbyhhccAFXzUL/IotBF2AQIYdLkDJ/p+P6UPpJgH27S3RF9KIi/IcLJthd+6XO/q1xzIxyvfENZSl9tm2K7YNewp3q0VG/ve5V+Bi9cFjBjMbe5IwFojXjfPW4BCLznk6bUq+/1ULlXGIEnl1wIY42+CVgEQn++C+r4a11iazAvC+Lr9L2DU2md9O95cmwnqDH71xVc+SLeq2cqo0FIbUNR7liMIJ8rO/t0GiMqm3PYutlM6Ji5MVz7zHmuFz8FsaiczgpJIwhYUoNtIdvFjtOaQoVsrChmMFSEDD/s/PmN5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6BgwBFtLA5xUK0sDwuQ1+RH5pp1UQTQgiMUA0OMuKM=;
 b=OqTesnlcVshrGHjVEWeIVS3qsrG7RgGiRZCFzQ7tBtJgbq1geQSj4ddt2c8oCCn1APYU4yS44Ht+IQ++lK7t5Me6nooeg2kMk26pFwFpCepGhl4q68LY64HsvrUB8fDoPTSdESYhzU1OYWFWHn856ChBpfFPQPheZ3SXBMhERnF/UH01JdJssx6VEpl0uZoc+NAXWW0rUuAkub0K3QCok7KiXul671If4eOHSnFXVLC95QqtHdC6Gq7h/UTB2pAQAP8P2TtvLBH2QxhMWXHIJZhosq4kyZrOTqAeEvrii9bwz53QJ489iNm1WzSSN3vIHaERwuyjy0RnKRchDRrfbQ==
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by GVXPR04MB10234.eurprd04.prod.outlook.com (2603:10a6:150:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:01:45 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:01:45 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Topic: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Index: AQHc4e58tc5C9w/OBUW4877OM2GKnbYKf7WAgAEYs/A=
Date: Wed, 13 May 2026 08:01:45 +0000
Message-ID:
 <VI1PR04MB6861AA3907166EEDFD50311887062@VI1PR04MB6861.eurprd04.prod.outlook.com>
References: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
 <agNDbQsJn2jcnA9q@lizhi-Precision-Tower-5810>
In-Reply-To: <agNDbQsJn2jcnA9q@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB6861:EE_|GVXPR04MB10234:EE_
x-ms-office365-filtering-correlation-id: df7c2e98-394c-4be1-b1e1-08deb0c5e061
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021|56012099003|11063799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 g6Tcwwj+f9ad+ADr1auu29vGcnH6VNN9ED6ysJM5GJ/P3rWcq9eMoEUuEDqxev+N2Eux7vCEOwGZHC1G6ZzdltBM40bBS1aBmUFyMyGwSxk/FhwHAhrVNWeWnBMuDyR60HG7GlYxoRflSuFRdHCzKnFJjr/Krr3zjZnPJWuVfpodOel/OY8sd5e6aRJ27yCMhjh5Osl97ZsGRZdXA0gzX/uFMML46LmNkYiGw1pvEj/hAsX06GhOaNJwPUOTesr8wxiUdAH9dg+92flbizI+Z4cyIHwwS2qCHPQwx3XzAvsy9PQFPbXWiKhdrXQBpFjRMDXkg8j7OgtiWjQ/c2YL0EQVm4JeV3O1kqJuYlqyBE9+h9wyQzG0jB34Jji8ClxdeIrAk5/0l3DWYdjdhzbZFovfNq3WFiGc2hGhB7+f/b6+roMzsm590nRhYNTUIzNrLUn03vcFGJedfF3yRZkq0FQrqmY2Fzfcu4gG04ezFSMs9/AhNC94OwQCgd6eGDO+0Q3PxDuo+G96/Xo2pKn3fixtZ/MmI17Xl2ImeSjJy9RehyH8ALjR9RTc1VmkDouZfdJRTxApPi3AiWqbUCYsRWELtfIJ2Yi5wLkjNSC5HfSggPkRqvI1hLiLysDBJ1Ib4gqUO2FpyD/Aj+/iwqDBbX2ns5kMLNPBQVHn4VzixINPJuwVrTf9OhQzPOIX9LIL90Ruh8r31NXkrLgq8Rj6M11zdnO91BgCVE/HGZFHkwePyrfrZmOSYtPG4UVoQ12g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021)(56012099003)(11063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0sKSWa+45RIs3sBVgFfPzJSUo3YqxgNnX3Z0r2d581mHdGk4PR6qDvkPdjvt?=
 =?us-ascii?Q?353bQS3q79AMpe14rLZbqTuqrl8i94J5Aqr2cN6nY0yLZrS1fzKPQhAuExoR?=
 =?us-ascii?Q?+nxbjSLSZN7RhWo6grDg8wTbG96omMguAykrnjOpE+D/VsHXlKrD/SD28yxz?=
 =?us-ascii?Q?50uq4NNbxix2yXaAOIiTjf8rboH2SY0L+lK6NnbVPdi4s5mMTC2n6DFWfHf+?=
 =?us-ascii?Q?eoOPAa6otCs+zld9vxUjFsBSCsU5vU3KMWdocUIJp31ezZyzXZYv4Ov74aqL?=
 =?us-ascii?Q?sEGJTf/3tP7U6R9H5ogdWLyCNBqmYp40DUkP3xlQkQOkvnZD2sZstDIHba+e?=
 =?us-ascii?Q?Dug2xAPax+regc1d4fcv+TA7HvRJY8DxtTxxu+JDIBsJjlAZLlJgaRAvqfjA?=
 =?us-ascii?Q?mWuicOUD2N1Oj7vMKlMZK9ZzqmsLTp+odDb2/oMx/9nflKzIEkmvRuOU2xYq?=
 =?us-ascii?Q?D4VjM+nF/W965USTtfI5PrJlU1x/xm274JkZsXDrWXx1gKpDwxsacfXbeOlB?=
 =?us-ascii?Q?2t5wxc6DRIWm1mCFtnsQXFr4cXGmNKYYjKchmSH5PE4oS07ZbNc/RwutDvvH?=
 =?us-ascii?Q?yhOFwwJPp0kYveN2sipuSYSlkZsYK0BkHobjZiF8GYnhcG67cfqAkBy7dxxo?=
 =?us-ascii?Q?X6HsfQztyk3bCY0ocBsQye+AC/P77oWcDeXJz+EaCNgp8+LeP8fx8Cco+SAC?=
 =?us-ascii?Q?O0ZCgLUYZ+ZSxfmSwCcG3Uc3TPiaseB/V1Fzy37PzeRJq+dC3QeaV4kIhXow?=
 =?us-ascii?Q?vBRmafrmeOZUOmiEpqWlBr4XsGssGiwQgEdQpAi66LG2ZubF3cU0+n9HtUAa?=
 =?us-ascii?Q?HZAJGaG48iAk29hui/+3uRadFVu99BFCfmO5OVtDxKRs/3/PLWeBOLHpjTip?=
 =?us-ascii?Q?ZwczC96Ka+ZaMEE+fgJkiJ8ezp/cgUq55x3ymtBVREoZtQkfdWC5y0Aaz1C7?=
 =?us-ascii?Q?8BFKcTMR8djOsAGPc6HJLrUop6IuFHxsBLNEocZ/zcRRT7iuJ7QZVLr774HJ?=
 =?us-ascii?Q?SKcd5HP3QXWWOpRK4v9IxiVOm/3OVRvtZD88oEnHU4yAxGvK5ANf9N5YUxQt?=
 =?us-ascii?Q?8FfFC2YDnaLVn6C1cPM1OJOSnakKybigP2skV2QiO1cpAFz7g/MR+6LnqUzt?=
 =?us-ascii?Q?ruUN7dqc6wQWJjvb0LUWwk4lgcezKkOQqk4MJccBLeUzFubRdx9glfZP8jrK?=
 =?us-ascii?Q?CTiR1SrZzZ1BbTzLTcGbnQvV9faN6tQ0O7WrF7K31dT8qQUBpOg+CaDsOiG+?=
 =?us-ascii?Q?8zqAvC2dezMUUnCKFpZa/2YQjXkWfea05UUcZXXOcMjGKuMZQe7Dc8gRDZeb?=
 =?us-ascii?Q?Zfe27g+UM5F304txBO8i0kipqAQ+MNgxeLD1i0S2wAaHB38EsiAWTlMhd3df?=
 =?us-ascii?Q?rsDtRo6uCy8ZhOIzsBGnUb2uaIZLJrZlHVV2OO++/zMT04Wwzw/MZ9FsErFG?=
 =?us-ascii?Q?J3ONCTXdvNCo+7llriiToevEX90kGa3jz/1XODHD+LEJkiJ2wKZRGhFyXqJP?=
 =?us-ascii?Q?Nd7vXKZPSQi/K3UIqiNPwtlY6tp/uE+XK8UFWAhGoXq8MSJzx9xhifjQwR5a?=
 =?us-ascii?Q?Ize5BBycXSdJ4wVYxqAlcK70O1UTcUDkytM56CR6mvCVW6vjpVIeJcpvPRNF?=
 =?us-ascii?Q?AKGzJq5qLRtt6ouNHPbl60VgUc+VwASAwOlyT5yrxCBjcFN/QTXChj5YOl2F?=
 =?us-ascii?Q?h2+ZDqYlZEM9WiTSWqZ+F7K+o7FG/UPR3NH3wFtgTaVwF9t9?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: df7c2e98-394c-4be1-b1e1-08deb0c5e061
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 08:01:45.2192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKvttvY7WZGzvbTo2eYKngt0qKZp5iB+3AOsv/P3xhH6bEQlOHCocOpkPqNKx66qSyd/Y9a0E09gX19qGB2/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10234

> Subject: Re: [PATCH] clk: imx: Add audio PLL debugfs for K-divider contro=
l
>=20
> On Tue, May 12, 2026 at 05:08:10PM +0800, Jacky Bai wrote:
> > Add debugfs support for runtime tuning of the audio PLL K divider,
> > which enables fine-grained frequency adjustments for audio PLL.
> > This is used for:
> >   - Audio clock calibration and testing
> >   - Debugging audio synchronization issues
> >
> > Two debug interfaces are exported to userspace:
> >   - delta_k: It is used to adjust the K divider in PLL based on small
> >     steps
> >   - pll_parameter: It is used for get PLL's current M-divider,
> >     P-divider, S-divider & K-divider setting in PLL register
> >
> > examples for the usage of the two interfaces:
> >    1): Get the current PLL setting of dividers
> >      cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
> >
> >    2): if want to adjust the K-divider by a delta_k '1', then
> >      echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
> >
> >    3): if want to adjust the K-divider by a delta_k '-1', then
> >      echo -1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
>=20
> Nit: needn't example, it is basic usage mode for debugfs.
>=20

will drop it.

> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx8mm.c  |  6 ++++
> > drivers/clk/imx/clk-pll14xx.c | 79
> +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/clk/imx/clk.h         |  1 +
> >  3 files changed, 86 insertions(+)

[...]

> > + *   3): if want to adjust the K-divider by a delta_k '-1', then
> > + *     echo -1 >
> /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
> > + */
>=20
> 2) and 3) keep one is enough, you better descript validate range for delt=
a_k
> here, which is more valuable information.
>=20

Ok, will refine the comment in next version.

> > +#ifdef CONFIG_DEBUG_FS
> > +static int pll_delta_k_set(void *data, u64 val) {
> > +	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> > +	s16 delta_k =3D (s16)val;
> > +	u32 div_ctl1;
> > +	s16 kdiv;
> > +
> > +	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> > +	kdiv =3D FIELD_GET(KDIV_MASK, div_ctl1) + delta_k;
> > +	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
> > +
> > +	return 0;
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, NULL,
> pll_delta_k_set,
> > +"%lld\n");
>=20
> generally, better also provide read for delta_k
>=20
> cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k because user
> want to check value by read it back naturally.
>=20

Thx, will add it.

BR
> Frank
> > +
> > +static int pll_setting_show(struct seq_file *s, void *data) {
> > +	struct clk_pll14xx *pll =3D to_clk_pll14xx(s->private);
> > +	u32 div_ctl0, div_ctl1;
> > +	u32 mdiv, pdiv, sdiv, kdiv;
> > +
> > +	div_ctl0 =3D readl_relaxed(pll->base + DIV_CTL0);
> > +	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> > +
> > +	mdiv =3D FIELD_GET(MDIV_MASK, div_ctl0);
> > +	pdiv =3D FIELD_GET(PDIV_MASK, div_ctl0);
> > +	sdiv =3D FIELD_GET(SDIV_MASK, div_ctl0);
> > +	kdiv =3D FIELD_GET(KDIV_MASK, div_ctl1);
> > +
> > +	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
> > +	mdiv, pdiv, sdiv, kdiv);
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(pll_setting);
> > +
> > +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> > +num_plls) {
> > +	struct dentry *rootdir, *audio_pll_dir;
> > +	const char *pll_name;
> > +	int i;
> > +
> > +	rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> > +
> > +	for (i =3D 0; i < num_plls; i++) {
> > +		pll_name =3D clk_hw_get_name(hws[i]);
> > +		audio_pll_dir =3D debugfs_create_dir(pll_name, rootdir);
> > +		debugfs_create_file_unsafe("delta_k", 0200, audio_pll_dir,
> > +				hws[i], &delta_k_fops);
> > +		debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> > +				hws[i], &pll_setting_fops);
> > +	}
> > +}
> > +#else /* !CONFIG_DEBUG_FS */
> > +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> > +num_plls) { } #endif /* CONFIG_DEBUG_FS */
> > +EXPORT_SYMBOL_GPL(audio_pll_debug_init);
> > diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h index
> >
> aa5202f284f3d1b7c1b4bf65e2329831832b43a5..9611ab127dad6f23770c18e
> 22e1a
> > cbe2fc22bd4e 100644
> > --- a/drivers/clk/imx/clk.h
> > +++ b/drivers/clk/imx/clk.h
> > @@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name,
> const char *compatible,
> >  			       u32 reg, const char **parent_names,
> >  			       u8 num_parents, const u32 *mux_table, u32 mask);
> >
> > +void audio_pll_debug_init(struct clk_hw **hws, unsigned int
> > +num_plls);
> >  #endif
> >
> > ---
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617
> >
> > Best regards,
> > --
> > Jacky Bai <ping.bai@nxp.com>
> >
