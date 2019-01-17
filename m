Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864FFC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B63120652
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="o92TyNpo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfAQNTP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 08:19:15 -0500
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:51456
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725878AbfAQNTP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jan 2019 08:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20HclApQEvnmAM4Z7vQSw8amFRkyd8RuVoYkOT+g39w=;
 b=o92TyNpo+4mRk9cITWkAqXSoTHv/FpVdDy2PCzyRf7cQcXwj9GLVsBlG9MreiMyDhbVIlzeb4Fedkz6NI7fIBtPRqvY58JT5mtIjoRK0/7FrDQgesp8SQ4XD/AVpKgeb7bLYiEQ95N53rbCjWCtWichn6TsybnYH/ULDEe5UNRQ=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1611.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Thu, 17 Jan 2019 13:19:06 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122%5]) with mapi id 15.20.1537.018; Thu, 17 Jan 2019
 13:19:06 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
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
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD
 support
Thread-Topic: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD
 support
Thread-Index: AQHUrcq7givnl9HhuUmuo4cX0fkgCqWzT0mAgAAjSLA=
Date:   Thu, 17 Jan 2019 13:19:06 +0000
Message-ID: <TY1PR01MB1770A5603DE648612A5CA15EC0830@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117111147.vb3lkdmgx24zusjx@verge.net.au>
In-Reply-To: <20190117111147.vb3lkdmgx24zusjx@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1611;20:uL4uzcugAAFquM9wVe6Sm+EkeS4TMFs/GeDhLjZISQEF9ZZrN3wjnMJ7Q+R+wGnmZe/3h2spme/0+Ufe7nKLT4gN38+gmwyCf4+Ywfj9Faau1BnScbt8KzgLsscOy+Eb/8kAZCNAL2JIBuXpaVqs6VJVvDHvydOteHhbAw73xtg=
x-ms-office365-filtering-correlation-id: 9de960e1-7111-4665-66f5-08d67c7e5bc5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1611;
x-ms-traffictypediagnostic: TY1PR01MB1611:
x-microsoft-antispam-prvs: <TY1PR01MB161186814CB34FD0B34FE7EFC0830@TY1PR01MB1611.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(376002)(366004)(136003)(39860400002)(199004)(189003)(53936002)(3846002)(6116002)(54906003)(44832011)(11346002)(81166006)(446003)(6916009)(4326008)(76176011)(8936002)(229853002)(7416002)(81156014)(68736007)(7696005)(9686003)(39060400002)(7736002)(305945005)(25786009)(316002)(486006)(476003)(14454004)(6246003)(2906002)(6436002)(86362001)(345774005)(106356001)(105586002)(478600001)(102836004)(55016002)(26005)(14444005)(256004)(33656002)(5660300001)(186003)(66066001)(99286004)(53546011)(6506007)(97736004)(71200400001)(71190400001)(74316002)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1611;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IanWBriBVeYxvVydtnAlFDwHtGqzN38LC0bTyP4Lre5errZNNgO4+nsND6uyP8/seleet/MfmhAIOeltCNfh/SGaQ0FcXwa8s6Or7/j1W0c8u/etHX+aC6HLCM8TpC8d2dOOAXHr8dkIqvcJx94HajZdFvOujmGVIXj3CByXgy7+9iWQ6GF2uECasXQGx3iiIlD17QFanM0cUzWGQfY4uSBBDER2CXS0QN1hKb3KkW/zaZ3YABU+w0LC+kp4XD8WT5rUzrZqxPRFtPt8H0I0Xdo4+DbcRkpkpCyl6iJTqMvA6BGTj6FXUacRkV0Ef6L99xv/h9tmToaMHZFErdwJExA8VAZltyyZxFLcMsYnD57knL4C5Rl4BPq3sdSifmDU2eMtGyl8/GNIJjNEJENy+4a4rQRIKNKo0c86UVPMcUw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de960e1-7111-4665-66f5-08d67c7e5bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 13:19:06.3558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1611
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 January 2019 11:12
> Subject: Re: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD =
support
>
> On Wed, Jan 16, 2019 at 06:37:49PM +0000, Fabrizio Castro wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > This patch adds uSD card support.
>
> Can I confirm that SDHI0 is wired up to a uSD slot?

Yes, it is wired up to a uSD slot

Thanks,
Fab

>
> I ask because if that is the case then this patch looks good to me.
> But if it is wired up to a full-size SD slot then I believe
> a wp-gpio (write protect) should be described.
>
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 50 +++++++++++++++++=
++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm=
64/boot/dts/renesas/r8a774c0-cat874.dts
> > index c545ce5..477a56b 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > @@ -7,6 +7,7 @@
> >
> >  /dts-v1/;
> >  #include "r8a774c0.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> >  model =3D "Silicon Linux RZ/G2E 96board platform (CAT874)";
> > @@ -26,6 +27,29 @@
> >  /* first 128MB is reserved for secure area. */
> >  reg =3D <0x0 0x48000000 0x0 0x78000000>;
> >  };
> > +
> > +vcc_sdhi0: regulator-vcc-sdhi0 {
> > +compatible =3D "regulator-fixed";
> > +
> > +regulator-name =3D "SDHI0 Vcc";
> > +regulator-min-microvolt =3D <3300000>;
> > +regulator-max-microvolt =3D <3300000>;
> > +regulator-always-on;
> > +regulator-boot-on;
> > +};
> > +
> > +vccq_sdhi0: regulator-vccq-sdhi0 {
> > +compatible =3D "regulator-gpio";
> > +
> > +regulator-name =3D "SDHI0 VccQ";
> > +regulator-min-microvolt =3D <1800000>;
> > +regulator-max-microvolt =3D <3300000>;
> > +
> > +gpios =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
> > +gpios-states =3D <1>;
> > +states =3D <3300000 1
> > +  1800000 0>;
> > +};
> >  };
> >
> >  &extal_clk {
> > @@ -37,6 +61,18 @@
> >  groups =3D "scif2_data_a";
> >  function =3D "scif2";
> >  };
> > +
> > +sdhi0_pins: sd0 {
> > +groups =3D "sdhi0_data4", "sdhi0_ctrl";
> > +function =3D "sdhi0";
> > +power-source =3D <3300>;
> > +};
> > +
> > +sdhi0_pins_uhs: sd0_uhs {
> > +groups =3D "sdhi0_data4", "sdhi0_ctrl";
> > +function =3D "sdhi0";
> > +power-source =3D <1800>;
> > +};
> >  };
> >
> >  &scif2 {
> > @@ -45,3 +81,17 @@
> >
> >  status =3D "okay";
> >  };
> > +
> > +&sdhi0 {
> > +pinctrl-0 =3D <&sdhi0_pins>;
> > +pinctrl-1 =3D <&sdhi0_pins_uhs>;
> > +pinctrl-names =3D "default", "state_uhs";
> > +
> > +vmmc-supply =3D <&vcc_sdhi0>;
> > +vqmmc-supply =3D <&vccq_sdhi0>;
> > +cd-gpios =3D <&gpio3 12 GPIO_ACTIVE_LOW>;
> > +bus-width =3D <4>;
> > +sd-uhs-sdr50;
> > +sd-uhs-sdr104;
> > +status =3D "okay";
> > +};
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
