Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010175;
	b=OXSoh2S9uqsTrhh9VijdkH4nswCBPHEYzb2ega24Fq3LvqeHi28agnVzBskgF+SVjqpU
	 pZS/viYBiM7lmGpwiZyi2j/2J4PXUo2EpqUisM62d77vcFPgfXVOc/j3bwtrt+RcG/a5y
	 cNUDZ8kE7kVuffi7OMidQNdLuAxhMKkyPMKj7cJiKW1A/9VbTQ5Z7WBuj1Ukx+7y39dCS
	 eqpJN3FAn40oRuZMNfZ72oCKl75bVgx10LySCd3zDcVORmg+zvrGDGZ0eckbhw5AKkPrA
	 WnS8hPRbghC5OalZ1qcLpzYjUtmCOMPFEcmpICIVywQEYS3LOM63a8ED1xOj3q0ETWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010175;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0/D7F7i3lKrbiElo1kmWcrd+5bcvU1sMv/5A4wPIeM0=;
	b=BczI7vb9SY98KCeDvyHuNajaXSTsy7izfy/3fnsfbBDJ+ThjNzgiuy/Uw4lXqlAu4byd
	 /wW5MZD/+uklJj785f7YvclujU76NtuwV2ZE2c9ZxiLKeRQunHiGh/+fU32GqdMcuB9mF
	 Ba8ishtAVT+8KefMuPhPwua3pBUu5RCDWbrifu4n+AHE+ekufy3iVif19L2C4UsDnjpgK
	 HTVgw5vLd8dP/7tx744YRJQMaEr8+rdRdVT5Hx2nI62fKityj1GlrL2s6+M6ve1IEx552
	 z3IxBYtjIsfJCPYIQY5G5sUmxdN6QGQE0ORGRG8YL/+hdfGZq0jwh99PfR1wfO6ogiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="Eo/vszHb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.11
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C9606A31B;
	Mon, 26 Oct 2026 10:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Eo/vszHb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBrYAawDEWtq/LPD66JeJr8d1BRqvybGSuO35sSW+HuTgelAaiyZdz/QlXLcFt12eOgsUHE5jnGfFHotHx8WdSBD7PPPV38IPjZpwTa0n0qvzJ72I/j3zAelr0g8l4m7KNl0bM5kdafLNXQSx9POvUomTknpcDK/a/aaMduN+WcaV+KgjFrHmNAxMVxqhiXFfVvmP7YnzLiGn2Uy+MellU+cDzgTB/NxK9+m5Q7RrDH0Xyy/SyT9RZ9FGdVwweDXxa4Swg1Pj+sTiwZnihcBVmyG2lyF5oRPXFx0KLihYEFNGHUdESTq2gpZm6mtZQNl9YIop3pQ0M1bvf/ZFWWwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/D7F7i3lKrbiElo1kmWcrd+5bcvU1sMv/5A4wPIeM0=;
 b=NttMn3w9BgG4PTyBGK3s7lGfz1BI6D2zEbtLxW1HlEiP1KA9/f6IBplaealwNNXNN2GmajPQwDvMZpv8yhbGxqnAEWnJg9UO8ZQcGBSPtOLVPH9OwhgZVvQ1lyUbeQzqwGs/3gKWTfZyddHSKLDvf22o+w/AyN7VWXfIvjcl6zdkNp8L/qXfJex592RbevhubYqT1gcAxk8a/Qj1Ew3x/GaUnTbiKxtIFzHCJOVwlV9KLv20uz0L1mOCxlmB5Vc86HrrEJqSbWUANwXtVyRHoRXPc5VwBPhXo+1EN+jgnOO835PH7kh3s44czirjWLDqIerfa7W+yxroyeiDUBJdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/D7F7i3lKrbiElo1kmWcrd+5bcvU1sMv/5A4wPIeM0=;
 b=Eo/vszHb47BcVjIVumA7U8auvLRYBUJHqeKn7Kqj8mbXHPapuy8Lh91Cbvgvq2onUpORPQWfJFzrv0GA9vKTxoBVyrWIK/7NlQtKGd+9kAYJl3Xk7SmIpVhpq0Uc7tMdrJNAZhFdB4duDUbS5Q7kcKqfEri7N2bEtCSTvMwZ8cI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13283.jpnprd01.prod.outlook.com (2603:1096:405:161::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:22:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:22:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin
	<sashal@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: RE: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX
 mux clocks
Thread-Topic: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX
 mux clocks
Thread-Index: AQHdRGk32SuXOVG/QkexR9pPwY5zh7cP1vog
Date: Mon, 26 Oct 2026 10:22:38 +0000
Message-ID:
 <TY3PR01MB113460768CDD4F8EA8D4928E486612@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13283:EE_
x-ms-office365-filtering-correlation-id: d020768c-4e52-47e9-0a32-08df334b0f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|261021121427099003|10067099003|261009221227099003|261009223027099003|261022105027099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 4ff47fBmTVgnSUTnNjBFMtijU7DqlUun+OuJYZq9lr/fwtctEvUHC6XoPIbp4X1zYf7nMtGYu1mCzfsyySGkQiBeL18g+UpW20xrp+o7086Y26dSG8HvGVHYwJTymOBsrtRGF8R32D0NjB0+CnK94B/ZKjTJokkAjp89g2oYToaVHN7w/DCsWSgJfZAIGirYPsYudT/qAmwcEchKcMSxYJLRFZdnbpvKZVCVB3zQqOae+97lAuQTMRrySPqkOFtDnMPHHUL3XJGgFT0qtApyt9bARvGEo9LAAblZFUrl3P5+5u7tBRHnuTlpvAyAduhGbLWvYDBrAgCeG/QNbwovex7H5A2v1gIBmNA1R7M6iMdGA5GYP0KjlqnqgychRhqa8Jiz8GIRUwOyPjBDKuwqfQPCrKo1tUwNz9N47LG4aYsJmi+pbkaZf5O5xYP6ptDQDeLBQ7e6DgU68FhzcQepf9+RIZtqyVbbZ1WJF6iujy8fKZdYNBzxTk3KkGHOrQf7yrZlgFGlCXJT7lcnZArEuU+tY0wDcJvjopEboEm47QQKPS8QqKooYuxRr/C/uDV/8rwS8TaNGFikxKWp8V8FURQlvSXwDUojR85EXib0tjo8SMC++OQGhP78oIFlWF31TwofyckJgvUgN7UgdOA8NWDbvCbsrrIeYYmmlFwJ0WeEN8Cf2UcYtuXpC4+RioGg3uxP6rSMCmj1kL5wCwyi+ZTQ+xNB1qKoRIXkjY4qTpY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261009221227099003)(261009223027099003)(261022105027099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qd3DeeZF4t5wtUy8vCdJuFEl9lD+H53lzJbbuFXKDrESxV8ptweNq9crq3tn?=
 =?us-ascii?Q?UH3sxVv5aSkx8ktgo2biDDD1+SUDpCKWAgrtrNKoaAcVxpqlf59IAfDWVVgy?=
 =?us-ascii?Q?M0u7BkmhVF0wHdiNb8tu/fqJQmAjetI18fVFonF00bTqQMAr//E0ZV4CPaII?=
 =?us-ascii?Q?GTN0157Ns9VcZP6p7+kdVQgisgvF42gKc+qJ0QY+Hc6mIzHWIlxvD8G8uVkY?=
 =?us-ascii?Q?VMyMQg4yhXXLV0Bgi5GlVV/Kb1ZRGBjG2tgL8WqFkvTIdV+hZlixW3bxOP0V?=
 =?us-ascii?Q?SKtt5/Bxge63t1UBi6ZU6nG2DjrB4zaGoagktK/oMZXZlt1XG9Of1HamLWoP?=
 =?us-ascii?Q?ZufTZh5wjSboH9nDhywol6eQCop/lo2fO9Av8Qh1sb9DOVXaAwT3kce1cc6A?=
 =?us-ascii?Q?j27Hj2imKSLPq6oaGQGcdMeJIEETUwUQ6NV+KkGSDRtY5j1H4XijZmy/vi/9?=
 =?us-ascii?Q?Z8jVyF0jeIkc1/1dsu9bnPJZrc0ZIDRNLHnxfugkKxro7zvwMfjZhresSN8a?=
 =?us-ascii?Q?8E8wKYu/QwJWDRd4huOpMb8ii0lU6m7iqTwh4mHD3DryowIjx+cq7ElpzQas?=
 =?us-ascii?Q?fxrhrOIxoLRAcDK0gGeTkFE4eT4h7Ytg+Pv9rHuQRLIKCMV4ZgihlVSFIn23?=
 =?us-ascii?Q?SIwFwJLDkb9/ysoZ5WjzBt/8ninytSm3CBgxVX8j6VL0kssH7bVx376ksJtN?=
 =?us-ascii?Q?OM453N2nl3uX4UMPzFrwr+g+8lMcSMVdfT7PDvBqTktjAH7bW+buT4D3XemN?=
 =?us-ascii?Q?3YtX4VdOvHQrO1fprriToDvhnBMA3HbFHWPTnHA4geGQ5XE5Jy6UBVaKO2oA?=
 =?us-ascii?Q?DYkk4xubn7FJBiyvajDsXj903pAoKL2Ll62bfcqw7X6w5GNLXYzRjXAg5owO?=
 =?us-ascii?Q?uXL8tDpaHwdAStf00ktOwho9lsiRTdCtUn5YGJ09IuCsHrUySEltYOEbYC3b?=
 =?us-ascii?Q?iApWrBLnWcwyBcMlpaLnzSuMh8j6VCimpx/5Cq9YaqSWaFujkqFxjJ4SntyC?=
 =?us-ascii?Q?efp2/+a9sm9Ccut65trbwsVfdKWw4jqVV8Gkf6Q2Gy6HX7ShdWRxZ6FAlhNo?=
 =?us-ascii?Q?0eTfHSC4Yy0Ov02p+Qd7DhyevrLZYd2NOubAJ79ERbywoEdia0mPikclfrhZ?=
 =?us-ascii?Q?ETmjFvCgxv0N1EsRIj/zVHp4zvDz51G5Md5ymF7dYnckiRceGF2NtbuwTQZI?=
 =?us-ascii?Q?VkGwUaiMlo+tIFRAksOX87C7otY24Yl9LzKFbhApSextnUs1gjOzmLkwKvRv?=
 =?us-ascii?Q?aNlr0lsRr6VX7Q3nEl9GbUaCv5JvTYHlJvAvuRCVwU5ofsuLlaoEyoBnQiEL?=
 =?us-ascii?Q?V4QYv0DPdKxwGst5tv2AJQ3KvRMvkYwy1pjaBfuLxMILWiZZuwMPQ3y3Od9u?=
 =?us-ascii?Q?bmahJ1bj9DGQFj/toEQ+0Sd0bRkVdC2GjO0sWRaCLDOprigeeMAqvSWKCah4?=
 =?us-ascii?Q?ndqjkSJPwd36vUX/2sHSaXRkT9CYYqOpRY2nE4AWOK1Dh8rdavRE9UQXSPmv?=
 =?us-ascii?Q?284h8/Y4DGPmsnsY0TnnKJ81VPLjvooHSnI75g2iK0+2UEabTSGc4wYb7MVy?=
 =?us-ascii?Q?eLN1+4UMcp7E3gk+rehtryv/DYRDcQN7BwRboRyIvD/L/RNCRtGLfVswQOSn?=
 =?us-ascii?Q?iUqbj6dWPPLT92bxdWru0Vk5FDBMueQHjgqMtv/tI3CrsFMDxKa3sgNIHpKL?=
 =?us-ascii?Q?WxJfysDec3IU+F89O6fsBXScHlMsAjEtWOdRbYu3JS4VMZU7bZdiDS9dflOM?=
 =?us-ascii?Q?GauSll7eQw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d020768c-4e52-47e9-0a32-08df334b0f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 10:22:38.5255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhhjBezuhLYu5PSyzy1cbjcBiA4EC2Vug4zWIJO7baQMUpyQHnM3f/d06W50I6h/Xi3VvdXUnzriL5PnScF9ee//kgzGzZc/g/3NWrhiLew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13283


Hi Greg/Sasha,

Sorry, I missed adding Cc: <stable@vger.kernel.org> for the below Fixes com=
mit

Commit e018c27e6052 "clk: renesas: r9a08g046: Propagate clk rate for ETH TX=
 mux clocks"
in Linux-next.

So, can it be backported to 7.3 and stable kernels?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 14 September 2026 17:50
> Subject: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX m=
ux clocks
>=20
> Add CLK_SET_RATE_PARENT flag to the sel_eth0_tx and sel_eth1_tx mux clock=
s so that rate-setting requests
> on these clocks propagate up to their parent clocks. Without this flag, a=
 clk_set_rate() call on the
> downstream GBETH clocks has no effect on the actual PLL/divider chain fee=
ding the TX clock, leaving the
> requested rate unapplied.
>=20
> Fixes: d55a0dfec40b ("clk: renesas: r9a08g046: Add GBETH clocks and reset=
s")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9=
a08g046-cpg.c
> index 2c5ca5ab5f57..92c76c4a1e89 100644
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -307,10 +307,12 @@ static const struct cpg_core_clk r9a08g046_core_clk=
s[] __initconst =3D {
>  	DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rsci_rspi),
>  	DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rsci_rspi),
>  	DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rsci_rspi),
> -	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
> +	DEF_MUX_FLAGS(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth=
0_tx,
> +		      CLK_SET_RATE_PARENT),
>  	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
>  	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
> -	DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
> +	DEF_MUX_FLAGS(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth=
1_tx,
> +		      CLK_SET_RATE_PARENT),
>  	DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
>  	DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
>  	DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4=
_200),
> --
> 2.43.0

