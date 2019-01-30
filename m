Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C805CC282D9
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B540218A3
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="NLvzhma8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbfA3Jqj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:46:39 -0500
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:59568
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726406AbfA3Jqj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jan 2019 04:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bTsf6Q0CIizB3p/KDWSgSMJuxcHI912ooQP2vIyJR8=;
 b=NLvzhma8arMdXC8nU1jW39WRVMXUvGHIU+9BYW6BGTtKWSvinx95Udt4n7eFIHpifeEMn4B3bfFRa6Uw6v9mblO2pngRZMRa4qTLPS6F7tuFtRkiPrHYI8ZZxC705MWhePXUQotd+HIzgEm+SvxoHVmkgafMyO2cvlDnDhqO5bc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB2502.jpnprd01.prod.outlook.com (52.134.252.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.19; Wed, 30 Jan 2019 09:46:36 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.025; Wed, 30 Jan 2019
 09:46:35 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a
 variable clock
Thread-Topic: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a
 variable clock
Thread-Index: AQHUuH/mhfvOl4MpNUeJeCWQkpdmXqXHjtig
Date:   Wed, 30 Jan 2019 09:46:35 +0000
Message-ID: <OSBPR01MB2103B656FF9DCBCC2F48E9A3B8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
 <20190130094029.9604-7-horms+renesas@verge.net.au>
In-Reply-To: <20190130094029.9604-7-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2502;20:na5XpJe3FV26Uitw2je2ECVS2Z4XQNjfJeJwLt1Tu2i2JurAl11yVn34SfdBRKVbMdKmFGDLKp4Seq5PLO5PH70urhvF7ejrjP+FaoNxJECmvIDV9UBymUfIQMj3hpDWirxRhOB5zctwSWPbg/um5zbUKSxxomz9Z4mHyTPINM4=
x-ms-office365-filtering-correlation-id: 3beb35d3-dd9f-4cb2-8cea-08d68697d31f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2502;
x-ms-traffictypediagnostic: OSBPR01MB2502:
x-microsoft-antispam-prvs: <OSBPR01MB25029C56CED254EDD7DD7B47B8900@OSBPR01MB2502.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(366004)(376002)(136003)(39860400002)(51914003)(199004)(189003)(81156014)(9686003)(76176011)(66066001)(26005)(25786009)(102836004)(446003)(86362001)(71200400001)(11346002)(6506007)(71190400001)(478600001)(4326008)(107886003)(6246003)(53936002)(99286004)(7696005)(39060400002)(33656002)(14454004)(476003)(74316002)(106356001)(105586002)(305945005)(7736002)(54906003)(316002)(44832011)(2906002)(110136005)(486006)(97736004)(8936002)(229853002)(256004)(14444005)(55016002)(6116002)(3846002)(68736007)(81166006)(8676002)(6436002)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2502;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x14tEul6yDtTGG3STQyfuVZvyTLymNRRKVGlXoSCbHl8Y6XUT0C5HI/jKb//VV4cy2LGgnG4BB3NBC14T3hF08JUNgVKBerDBmCyHorptebshA5gZ/7ot20nrOKm/nWGZlg1aAGTeE5V2sZV032NiwNTug3e6Lw9GszyLWpAOaWf7QYYiO3aSW0NpvY05+kpTqAEK1g1HC2AbEpnN8L468AxDEONoOmBsDJVMMjHYtUXXiMC/7NRUvcXipJqUo8aqe7INlP8IipOt1Ra1vFtc6CrQLzbymdw/RLifuJbl5EIxCNJiusQ8hrmCJLOqyztasDtMHLr5LiUCspygMVxKvFifd3nR8PQjI9qZ6ORmXJMQ20w0pF4BYfObrlSsQrYqBlkh7UX+PJ+E6a2M9x9Vjrz/bQ7CeAFj0ymvGTATcM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3beb35d3-dd9f-4cb2-8cea-08d68697d31f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2019 09:46:35.7716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2502
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

Thanks for the patch

> Subject: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a vari=
able
> clock
>
> On the RZ/G2E (r8a7745) SoC the Z2 clock is not a fixed clock.
> Rather it is a clock with:

RZ/G2E SoC id is r8a774c0.


> * A parent of CLK_PLL0 running at 4.8GHz
> * A fixed divider of 4
> * A variable divider controlled by the Z2FC bits of the RFQCRC register
>
> This can be described using the DEF_GEN3_Z with a clock type of
> CLK_TYPE_GEN3_Z2.
>
> This change is made with reference to the User's Manual v0.61.
>
> Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/clk/renesas/r8a7745-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c
> b/drivers/clk/renesas/r8a7745-cpg-mssr.c
> index 493874e5ebee..f2ea72d9d663 100644
> --- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
> @@ -53,7 +53,7 @@ static const struct cpg_core_clk r8a7745_core_clks[]
> __initconst =3D {
>  DEF_BASE("qspi", R8A7745_CLK_QSPI, CLK_TYPE_GEN2_QSPI,
> CLK_PLL1_DIV2),
>  DEF_BASE("rcan", R8A7745_CLK_RCAN, CLK_TYPE_GEN2_RCAN,
> CLK_USB_EXTAL),
>
> -DEF_FIXED("z2",    R8A7745_CLK_Z2,CLK_PLL0,    1, 1),
> +DEF_GEN3_Z("z2",   R8A77990_CLK_Z2,     CLK_TYPE_GEN3_Z2,
> CLK_PLL0, 4),

Looks like wrong file name.  it is supposed to be r8a774c0-cpg-mssr.c

>  DEF_FIXED("zg",    R8A7745_CLK_ZG,CLK_PLL1,    6, 1),
>  DEF_FIXED("zx",    R8A7745_CLK_ZX,CLK_PLL1,    3, 1),
>  DEF_FIXED("zs",    R8A7745_CLK_ZS,CLK_PLL1,    6, 1),
> --
> 2.11.0




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
