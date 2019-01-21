Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F97C2F3BE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45D9620861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nbS+OJB3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbfAUNrx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:47:53 -0500
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:48000
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729132AbfAUNrx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Jan 2019 08:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qsqeLBX/R/FT0a3cEb9oq9rFPh73y5ygJby4mjYt0o=;
 b=nbS+OJB3823BhKAFrLVPCHx53BJyErOTqzQvKqYGg3DF9QongthKAT3eQZgbEM7TXBSKq5i0PV5f6w8LQ9w1JKwiSOHoYRWopkTUe01sFyudzjD/xwYrqxYTC51tjBhmclzqKiObY1cNGqTU9m9jHILJ5yaj+ZlIlphCV3FXUeQ=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB5022.jpnprd01.prod.outlook.com (20.179.186.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.25; Mon, 21 Jan 2019 13:47:48 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88%6]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 13:47:47 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: r8a774c0: Correct parent clock of DU
Thread-Topic: [PATCH] clk: renesas: r8a774c0: Correct parent clock of DU
Thread-Index: AQHUsYs6kFUKFGT3ekWyYW2PSTS3EaW5vFjg
Date:   Mon, 21 Jan 2019 13:47:47 +0000
Message-ID: <TYAPR01MB228500861E96F811B3E03256B79F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <20190121131410.21137-1-geert+renesas@glider.be>
In-Reply-To: <20190121131410.21137-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYAPR01MB5022;20:05afzAMed3nTIod+MJqHulijBDYie0XvM1AF4rsGVCnWOJIufTHhn953d53MXeLYEiiwYbiyQOi2Mq2nNWGq8/uxBg8aGMdzKKJR659w3Ue70HdW/Vwxf591YjHB3gEDW9bABsG12QS7BR2hWYHKEtvBtmb+WGAv3nS15mgst18=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(136003)(346002)(39850400004)(396003)(376002)(366004)(189003)(199004)(8936002)(8676002)(97736004)(86362001)(446003)(68736007)(6436002)(478600001)(486006)(99286004)(14454004)(476003)(11346002)(105586002)(81166006)(81156014)(106356001)(256004)(26005)(66066001)(54906003)(186003)(6506007)(76176011)(7736002)(6116002)(102836004)(72206003)(7696005)(110136005)(4326008)(53936002)(3846002)(2906002)(9686003)(305945005)(33656002)(316002)(55016002)(71190400001)(71200400001)(74316002)(25786009)(6246003)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5022;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: 088de7be-e9d0-4af1-e310-08d67fa70714
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB5022;
x-ms-traffictypediagnostic: TYAPR01MB5022:
x-microsoft-antispam-prvs: <TYAPR01MB5022069F3D98438310E8B19BB79F0@TYAPR01MB5022.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tLaa5li0cAHFoo/wFNkIvrKy6ZJSTVQ31rGOgLcr0i0cxYLTS88szn5nb3h1xUU2WdDFulB20u+8tGBxCEkBpt80Q1iMk22MFS1RPbqHryjk7acCWKaDE78PDtk1kNane8n2wW//gFNNfU9kcnYmoWWK2u9mseroyHVIvuFJe/IFyhuEboo0iJuUOAEINxbJ0AGQDVl6Bxi8O9zELTWKrulfVmarr1VtevRewQsyKmrcfSiY6eWdfDWgWl+8AjaX0+fC70PoONTUaPiYtEaHJ8BRjeOkizfPYmcNSLaLy6tzZ4XWZAMLDICSgSeFWp5OyLXfKzAFThbC5rbadyMv92BkSa1UFRpCAdT2Ni9z//xIUKEpprW0r3bFYiKgeR1AR2CjGaORHGLXwRkd9Ptq5/A2G3IEqjd3CQ+PEv8/rGk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088de7be-e9d0-4af1-e310-08d67fa70714
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 13:47:47.2797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5022
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> Sent: 21 January 2019 13:14
>=20
> According to the RZ/G Series, 2nd Generation Hardware Manual Rev 0.61,
> the parent clock of the DU module clocks on RZ/G2 is S1D1.
>=20
> Fixes: 906e0a4a6d1ef2d3 ("clk: renesas: cpg-mssr: Add r8a774c0 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Thank you Geert!

Kind regards, Chris

> ---
> To be queued in clk-renesas-for-v5.1.
>=20
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index 28bcc8105d579611..4f3111b3113ecce8 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -175,8 +175,8 @@ static const struct mssr_mod_clk
> r8a774c0_mod_clks[] __initconst =3D {
>  	DEF_MOD("ehci0",		 703,	R8A774C0_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A774C0_CLK_S3D4),
>  	DEF_MOD("csi40",		 716,	R8A774C0_CLK_CSI0),
> -	DEF_MOD("du1",			 723,
> 	R8A774C0_CLK_S2D1),
> -	DEF_MOD("du0",			 724,
> 	R8A774C0_CLK_S2D1),
> +	DEF_MOD("du1",			 723,
> 	R8A774C0_CLK_S1D1),
> +	DEF_MOD("du0",			 724,
> 	R8A774C0_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,
> 	R8A774C0_CLK_S2D1),
>=20
>  	DEF_MOD("vin5",			 806,
> 	R8A774C0_CLK_S1D2),
> --
> 2.17.1

