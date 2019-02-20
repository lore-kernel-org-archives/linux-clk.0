Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CF1C10F07
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26EA42146E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nZj0RhzV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfBTUjV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 15:39:21 -0500
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:52601
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbfBTUjV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 15:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPeBHS8Ras+FqAFIDr0BUnI3SVNeSz5tH76xAXzFZ7k=;
 b=nZj0RhzVH6ECbReGG/NSj/5okqD8kTDSKaY50qwgrNTCVbDgE74HfRh7mS+XkrMSA290Qgput42hmXtxpzOFWJtXCoWu83yC8Rbpk6ShbR7qznJAoO0npfTqHKsgF/sdiYWQtpLsueheLZbUbBrqRvCzoBGuvC7OmtEfMI86Siw=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB2589.jpnprd01.prod.outlook.com (20.177.102.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 20 Feb 2019 20:39:16 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5%5]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 20:39:16 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyTaruNmrMMPHCEKccudxxky1oaXpJf9Q
Date:   Wed, 20 Feb 2019 20:39:16 +0000
Message-ID: <TYAPR01MB22854937F3B2CB0CC51EBA18B77D0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [90.255.186.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2577da0b-d67e-460a-cd4f-08d697737b4a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB2589;
x-ms-traffictypediagnostic: TYAPR01MB2589:
x-microsoft-exchange-diagnostics: 1;TYAPR01MB2589;20:7eBqJpSZNZh/yiUx+DdN1QeUFztsj5uebkx1333Iwi8KVLKHYKCsV5/NwKL0wfOsC8PycTsyjfQB3rOgSgkdp1hDgpV2jIxY7sSYHfIcxFok0XxHw3/3vO5KJnDTL7QwuoAgrbDfGBjooP2CKdyDs0ZgR5bPtAqA56hEFZtdpBg=
x-microsoft-antispam-prvs: <TYAPR01MB2589837D1C2ED07FB151B5AFB77D0@TYAPR01MB2589.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39850400004)(199004)(189003)(55016002)(102836004)(446003)(71200400001)(11346002)(9686003)(186003)(14444005)(6246003)(66066001)(6506007)(256004)(99286004)(7736002)(305945005)(33656002)(53546011)(76176011)(97736004)(26005)(5660300002)(486006)(6116002)(3846002)(71190400001)(7696005)(6436002)(53936002)(229853002)(476003)(107886003)(110136005)(478600001)(316002)(54906003)(72206003)(86362001)(68736007)(4326008)(14454004)(105586002)(25786009)(74316002)(81166006)(106356001)(8936002)(8676002)(2906002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2589;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NYY/71clui2mjyPncWZNm/yZEDqWRzGRbtwpb19rpscN/C3KWz379B10vmzhK+8rCsJ5Zguik22kaCvWHy8W6xXHJAP/V8u0jPLym3GWv/F6Wse2zS1s1O31yEvg7EGue2F/1sOoZL2rBVSPljXFjctbSnme5dr7tPggGgEr28Id/bQRrVSm/0a1DGDqLzGdmgaYmAwGfIuJbw3SJOGSbzSXlxAF/JNwHsPp5es+DfRBsUwGzORZMyv4flurdsTtTS2LUYqzObbZISlVwi2i//yZZ0RV5D/k7MxiHE8KKZqNz98hlEWJ0MQhG+vmOEfTsaxt3A0jxI4QP2xtgQmYM/HiujxxWPWdRT0zWfpOR3euzJL2B/nYkwjf+/rUjsxz1Ju7B+OT4NAvesewEc/WbUfJJHjHQv8f5b/wHx7JCjs=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2577da0b-d67e-460a-cd4f-08d697737b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:39:16.4326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2589
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 20 February 2019 16:09
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; linux-
> renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; Simon Horman
> <horms@verge.net.au>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Biju Das <biju.das@bp.renesas.com>
> Subject: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
>=20
> Enum LAST_DT_CORE_CLK needs updating as R8A774C0_CLK_CANFD
> was recently added and it's the core clock with the highest
> index.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> ---
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index 4f3111b..48a578a 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -22,7 +22,7 @@
>=20
>  enum clk_ids {
>  	/* Core Clock Outputs exported to DT */
> -	LAST_DT_CORE_CLK =3D R8A774C0_CLK_CPEX,
> +	LAST_DT_CORE_CLK =3D R8A774C0_CLK_CANFD,
>=20
>  	/* External Input Clocks */
>  	CLK_EXTAL,
> --
> 2.7.4

