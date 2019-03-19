Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F20FC4360F
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E83C42146E
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="G8BKPSpP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfCSLMn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:12:43 -0400
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:18208
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfCSLMl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Mar 2019 07:12:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxfgqTwRGBQJvEEqjrwH1xFQMPldo3O5zs4JdWqcCGk=;
 b=G8BKPSpPgYWhvru3vpmdkXTZ5YpsmYsIXO2JaNi2U+qtMH+xlZQnlgcREVHoYXSnvFtB6doH+ua0fgsa8Kcm+HRp7r3WYAqpXAz8/gFXfji6pVtwmEZPuv6gEZi6OOa5K3Fkjt3xccrqsclTbwsYZ44tcmO97hdwGsEBiOq3htg=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1772.jpnprd01.prod.outlook.com (52.133.163.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Tue, 19 Mar 2019 11:12:33 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 11:12:33 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        =?iso-8859-2?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to
 CAN nodes
Thread-Topic: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to
 CAN nodes
Thread-Index: AQHUrcrLeVpbh2vPiUK4KkWaraNHMaWzXloAgBFZjQCATnVMkA==
Date:   Tue, 19 Mar 2019 11:12:33 +0000
Message-ID: <TY1PR01MB1770DDAB8A6FBC79DF91F600C0400@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-11-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117120541.slymsz47fjkzz3kg@verge.net.au>
 <20190128130238.gork4cep3qonghwz@verge.net.au>
In-Reply-To: <20190128130238.gork4cep3qonghwz@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23b00d4c-1ebd-402e-b1c3-08d6ac5bc92b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1772;
x-ms-traffictypediagnostic: TY1PR01MB1772:
x-microsoft-antispam-prvs: <TY1PR01MB1772542D11B5CAC37ADA0FF0C0400@TY1PR01MB1772.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(376002)(346002)(366004)(136003)(199004)(189003)(97736004)(229853002)(2906002)(81156014)(8936002)(8676002)(4326008)(6916009)(99286004)(33656002)(93886005)(81166006)(54906003)(316002)(478600001)(76176011)(7416002)(52536014)(53546011)(6506007)(53936002)(9686003)(186003)(66066001)(305945005)(256004)(5660300002)(71190400001)(71200400001)(25786009)(86362001)(44832011)(7736002)(102836004)(26005)(74316002)(14444005)(476003)(68736007)(446003)(55016002)(7696005)(6436002)(106356001)(11346002)(105586002)(6246003)(14454004)(486006)(3846002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1772;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gQhmgF1xXX9Hgzll+hQHbivZvmqPbyw5B03oMkW/Oh8A0k2XQudR/JSPYWIKXM00xxmko0w3lTyiPsq4vql3MXezp/Iu7IKs89of7gdzDtWeF6INfSRl0Yd13nlTNNIpohuxZUO8gVUAZsYy3h6l8dmyJsUPPTAV3eJsHneUFUmYLMgNCyWCuCCSV9tYavGTImZlwOrJ7ksMcIVL0RDY664YJ3yeXJ7YK5W+BXsWddA5eLtT41PfHO1INZmJxOHwEscr3o6bkqG6iNoNeI+6K7oqmreusTKZQJHeq4nXK2vJdbJb1c04N/OFt7yDoRYTZX+hWtchyA1sPr1ZirTBiA995i27rtoJoXN5kxlq/LRgFWvVEJoMZ39//dKyFITPaJyDsB9x2u/dViVq9rb5DI78kDNk03Rcad6jf2+5GB8=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b00d4c-1ebd-402e-b1c3-08d6ac5bc92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 11:12:33.2536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1772
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 28 January 2019 13:03
> Subject: Re: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock=
 to CAN nodes
>=20
> On Thu, Jan 17, 2019 at 01:05:42PM +0100, Simon Horman wrote:
> > On Wed, Jan 16, 2019 at 06:37:53PM +0000, Fabrizio Castro wrote:
> > > According to the latest information, clkp2 is available on RZ/G2.
> > > Modify CAN0 and CAN1 nodes accordingly.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >
> > Taking your word for the motivation for this change,
> > this patch seems fine to me but I would like to wait for review
> > from others.
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> I am marking this as deferred until R8A774C0_CLK_CANFD
> shows up in an rc release.
>=20
> Alternatively I'd be happy to take a version that uses
> numeric values, followed up by a patch to switching to R8A774C0_CLK_CANFD
> once it is available in an rc release.
>=20
> Please repost or otherwise ping me as appropriate.

It seems like this patch still applies without conflicts, do you mind takin=
g it now
as R8A774C0_CLK_CANFD is finally available?

Thanks,
Fab

>=20
> >
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/b=
oot/dts/renesas/r8a774c0.dtsi
> > > index 3970aaf..326ab3a 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -809,8 +809,10 @@
> > >  				     "renesas,rcar-gen3-can";
> > >  			reg =3D <0 0xe6c30000 0 0x1000>;
> > >  			interrupts =3D <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks =3D <&cpg CPG_MOD 916>, <&can_clk>;
> > > -			clock-names =3D "clkp1", "can_clk";
> > > +			clocks =3D <&cpg CPG_MOD 916>,
> > > +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> > > +				 <&can_clk>;
> > > +			clock-names =3D "clkp1", "clkp2", "can_clk";
> > >  			power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > >  			resets =3D <&cpg 916>;
> > >  			status =3D "disabled";
> > > @@ -821,8 +823,10 @@
> > >  				     "renesas,rcar-gen3-can";
> > >  			reg =3D <0 0xe6c38000 0 0x1000>;
> > >  			interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > > -			clocks =3D <&cpg CPG_MOD 915>, <&can_clk>;
> > > -			clock-names =3D "clkp1", "can_clk";
> > > +			clocks =3D <&cpg CPG_MOD 915>,
> > > +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> > > +				 <&can_clk>;
> > > +			clock-names =3D "clkp1", "clkp2", "can_clk";
> > >  			power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > >  			resets =3D <&cpg 915>;
> > >  			status =3D "disabled";
> > > --
> > > 2.7.4
> > >
> >
