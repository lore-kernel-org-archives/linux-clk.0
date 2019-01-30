Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD0C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 887752086C
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Nelf2ceP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbfA3SnV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 13:43:21 -0500
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:39680
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733112AbfA3SnU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jan 2019 13:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkQiz10pKDUeTUXNGwAgOQay3ixvhsYxQ31HaMUqNaM=;
 b=Nelf2cePm4DrfgiWlqNXKiXVq0XslTgWHIQmnrfPIBXrENpJciqpfY0dJ0qGkiRfVo47A7ToGoPj1mRQwP1JvY0xzoeLqyS+43AJpEWHDiDhawpPRvboVGGSRDhDbdp1s6Oj1tEZHg5WDf3xwxFzk47VQjRG4C73FobOUAlvfAA=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1801.jpnprd01.prod.outlook.com (52.133.164.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Wed, 30 Jan 2019 18:43:15 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1580.017; Wed, 30 Jan 2019
 18:43:15 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a
 variable clock
Thread-Topic: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a
 variable clock
Thread-Index: AQHUuH/mcSaS8mC4AEaiF994lYJ6IaXIFuwA
Date:   Wed, 30 Jan 2019 18:43:14 +0000
Message-ID: <TY1PR01MB1770105DAFC2EC56731AD25EC0900@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-7-horms+renesas@verge.net.au>
In-Reply-To: <20190130094029.9604-7-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1801;20:Nb+CLu+6YnfjlxfMQ2lKNd812R+kS1zSFs3nqRo7novodIdkbOteeF6lL/1gq2haF00xj7Pr7haIPPyEnkHBV85qBlEmFKG5DtOKHHIkXMc4bmUgdgCug0IME065ceR5il6zRLlpRNDL75mBUxH1as+X8hx3ZIRThIm/Mn3ztUo=
x-ms-office365-filtering-correlation-id: ba8c1e5e-b669-4c14-974f-08d686e2cb5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1801;
x-ms-traffictypediagnostic: TY1PR01MB1801:
x-microsoft-antispam-prvs: <TY1PR01MB180156B72C4A711AD3E39588C0900@TY1PR01MB1801.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(44832011)(55016002)(2906002)(81156014)(81166006)(99286004)(8676002)(54906003)(6436002)(86362001)(446003)(476003)(9686003)(11346002)(14444005)(256004)(68736007)(71190400001)(486006)(71200400001)(186003)(107886003)(345774005)(53936002)(66066001)(14454004)(7736002)(6116002)(97736004)(6246003)(3846002)(478600001)(6506007)(8936002)(4326008)(25786009)(74316002)(110136005)(39060400002)(316002)(105586002)(76176011)(106356001)(33656002)(53546011)(305945005)(7696005)(229853002)(102836004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1801;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xYVkiEB/qhTQHIXRox4phoPthNFsigHO3sAFRR+AjjH79GqLGCPZvLaAqymg7cAzvqJAUyRD6NbxPe+acZt4kqQvUAimG/eA8XJ+MvgHax8UtU7VHoKNGQQlkG0qGobuDwaL9G5XBp044vz8Xs2p6yuFpFsvjf1dLnLbVKXQErwh9gIVu1Y6XJlWaoZq9u0UF99KX+3ds0gghacxpxSLS7dtIr5JZDCYHxjQydFChtoZeImJ7iFQRbfYPrtfPfxdK3GqkZKFjPMDLtSUCC3J/YTIb7Nxxw66NpG0AuQ3Py1VM+iWSw8unFx/ThyTVtCOt2Hihrx7VnuClpxgRwDBMiXD+/r5qSyp4tS2KEQvEyKcIDEnlFyJDxs6h/V9JmlYq8OuaFVKGv7w1aIVYHDroUYO+K9yyYNRQBI74z4DNY4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8c1e5e-b669-4c14-974f-08d686e2cb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 18:43:14.9796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1801
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

Thank you for your patch!

> From: Simon Horman <horms+renesas@verge.net.au>
> Sent: 30 January 2019 09:40
> Subject: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a vari=
able clock
>
> On the RZ/G2E (r8a7745) SoC the Z2 clock is not a fixed clock.

Did you mean RZ/G1E here?

> Rather it is a clock with:
>
> * A parent of CLK_PLL0 running at 4.8GHz
> * A fixed divider of 4
> * A variable divider controlled by the Z2FC bits of the RFQCRC register

My understanding is that those statements don't apply to the RZ/G1E, but th=
ey do apply to the RZ/G2E

>
> This can be described using the DEF_GEN3_Z with a clock type of
> CLK_TYPE_GEN3_Z2.
>
> This change is made with reference to the User's Manual v0.61.

That's the version of the User's Manual for the RZ/G2E, but this patch is f=
or the RZ/G1E

>
> Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/clk/renesas/r8a7745-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas=
/r8a7745-cpg-mssr.c
> index 493874e5ebee..f2ea72d9d663 100644
> --- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
> @@ -53,7 +53,7 @@ static const struct cpg_core_clk r8a7745_core_clks[] __=
initconst =3D {
>  DEF_BASE("qspi", R8A7745_CLK_QSPI, CLK_TYPE_GEN2_QSPI,CLK_PLL1_DIV2),
>  DEF_BASE("rcan", R8A7745_CLK_RCAN, CLK_TYPE_GEN2_RCAN,CLK_USB_EXTAL),
>
> -DEF_FIXED("z2",    R8A7745_CLK_Z2,CLK_PLL0,    1, 1),
> +DEF_GEN3_Z("z2",   R8A77990_CLK_Z2,     CLK_TYPE_GEN3_Z2, CLK_PLL0, 4),

Perhaps this change was made to the wrong file?

Thanks,
Fab

>  DEF_FIXED("zg",    R8A7745_CLK_ZG,CLK_PLL1,    6, 1),
>  DEF_FIXED("zx",    R8A7745_CLK_ZX,CLK_PLL1,    3, 1),
>  DEF_FIXED("zs",    R8A7745_CLK_ZS,CLK_PLL1,    6, 1),
> --
> 2.11.0




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
