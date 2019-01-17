Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BA9C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87258205C9
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="p/E1iPI3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfAQN17 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 08:27:59 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:14416
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725868AbfAQN17 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jan 2019 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz+11uVZL3cdjtaBV2s3f4jRS+KB1EUgGPZf60ABTAM=;
 b=p/E1iPI3Ox+xbQNmp+/l0XvcTIB2JZ0wBFj7RMSnj6GkxUJwxXZzYi5yS78ptqdb1uilvV+UZuuSTwTsu9JZi+ECplqGTi8AX2Q2UV6/QgYmVB+Apm7pVBSsydV8NriWkNp2RcHLbtPQ8ej5VnaKQWpl7xCBiDuWMsV56Rbtumw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1817.jpnprd01.prod.outlook.com (52.133.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Thu, 17 Jan 2019 13:27:51 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122%5]) with mapi id 15.20.1537.018; Thu, 17 Jan 2019
 13:27:51 +0000
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
Subject: RE: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet support
Thread-Topic: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet support
Thread-Index: AQHUrcq/cflr0dya/ES/qFuZF/A1U6WzXLEAgAAWRUA=
Date:   Thu, 17 Jan 2019 13:27:51 +0000
Message-ID: <TY1PR01MB1770241D7A553184ABB589DAC0830@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117115945.bmlaoeoqvsmdqqot@verge.net.au>
In-Reply-To: <20190117115945.bmlaoeoqvsmdqqot@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1817;20:lHosH0Ym6/thKXCmTnZRHlSwx8KFs7xA5/0PkgTe4FPZieUvUqYqbLyuW95WUHc0BzXG4w4NkJYBvnXX/dFDLE+dsksLrnJfcC0xu5hutVnS2MqM3G4jmkNGUJ1Zk0mVH5woY4gvgY3psu6N8zW43nMlToQDQqn2iYFJHd4iZjc=
x-ms-office365-filtering-correlation-id: efceaeb1-9fff-4fa1-7ba9-08d67c7f94ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1817;
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB1817C196ECD4A2228BDC444BC0830@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39850400004)(366004)(376002)(346002)(199004)(189003)(8936002)(86362001)(6116002)(105586002)(8676002)(25786009)(4326008)(6246003)(3846002)(106356001)(102836004)(6306002)(256004)(7696005)(26005)(76176011)(6506007)(53546011)(33656002)(53936002)(55016002)(81166006)(186003)(9686003)(6916009)(81156014)(476003)(966005)(345774005)(11346002)(44832011)(54906003)(316002)(66066001)(14454004)(486006)(6436002)(71200400001)(5660300001)(74316002)(68736007)(478600001)(7416002)(229853002)(97736004)(71190400001)(446003)(7736002)(2906002)(99286004)(39060400002)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1817;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OzyhOK0OrXEgvzFgvR9N1gQ1e0r3IQVy4j39vasBjXZFwh7nUc4sdLOzbNxqhKic+niHF8KANrMBk3rTGpuxwuLL8qAX4aY6hh81IwWb4MA2TPL9M05oxJlrbhdGEuWBeF6p2+o3AsNjHzlpW1BGUGp2HVl4IIF1egkSUwkTRMPygr/ihfawszwcZL+rVjIWakVCVQfEcBrUv3QvP9ZyrbRWOgYdh8cw4IAMPRvAHd+1+1PrZ7tWwlC0SDfjGh5GmD2U0QO346oxI50PtXQ/TN1pSlun2gCVW2ti4ASNK7Z0BEwzxHmbrS8jJWjHydI0NFLM/xozDJX5QVwHcWj3l097af3bRoJQx8w+NHMUu8bhu1RwTz6SOVuKH6IGrwp5c8aBPbnESmlOe6FOQ0EA2vJSZQvRjTKXSTZdPq1Jh20=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efceaeb1-9fff-4fa1-7ba9-08d67c7f94ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 13:27:51.2658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 January 2019 12:00
> Subject: Re: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet supp=
ort
>
> On Wed, Jan 16, 2019 at 06:37:50PM +0000, Fabrizio Castro wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > This patch adds ethernet support to the sub board.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/cat875.dtsi | 30 +++++++++++++++++++++++++=
+++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/=
dts/renesas/cat875.dtsi
> > index a41d0d8..805ffa7 100644
> > --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> > @@ -7,4 +7,34 @@
> >
> >  / {
> >  model =3D "Silicon Linux sub board for CAT874 (CAT875)";
> > +
> > +aliases {
> > +ethernet0 =3D &avb;
> > +};
> > +};
> > +
> > +&avb {
> > +pinctrl-0 =3D <&avb_pins>;
> > +pinctrl-names =3D "default";
> > +renesas,no-ether-link;
>
> Is the renesas,no-ether-link required?

The AVB_LINK pin from the SoC is connected to the PMEB (Power Management Ev=
ent, B stands for
active low) pin on the  PHY, which means it is not a link signal. The PMEB =
signal is active when a magic
packet or a wake up frame are detected. As a result, we need renesas,no-eth=
er-link and we can't
specify avb_link with avb_pin either.

Thanks,
Fab

>
> My understanding is that "the property should only be used when a
> board does not provide a proper AVB_LINK signal". And from my reading
> of the schematic it looks like that signal may be provided on this board.
>
> That said, I have an outstanding patch for this for E3/Ebisu which
> I have not applied because I am unsure of its correctness.
>
> [PATCH] arm64: dts: renesas: ebisu: Remove renesas, no-ether-link propert=
y
> https://patchwork.kernel.org/patch/10692755/
>
> Similar patches have been applied for other boards.
> f.e:
>
> [PATCH] arm64: dts: renesas: salvator-x: Remove renesas, no-ether-link pr=
operty
> https://git.kernel.org/torvalds/c/87c059e9c39d
>
> > +phy-handle =3D <&phy0>;
> > +phy-mode =3D "rgmii";
> > +status =3D "okay";
> > +
> > +phy0: ethernet-phy@0 {
> > +rxc-skew-ps =3D <1500>;
> > +reg =3D <0>;
> > +interrupt-parent =3D <&gpio2>;
> > +interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> > +reset-gpios =3D <&gpio1 20 GPIO_ACTIVE_LOW>;
> > +};
> > +};
> > +
> > +&pfc {
> > +avb_pins: avb {
> > +mux {
> > +groups =3D "avb_mii";
> > +function =3D "avb";
> > +};
> > +};
> >  };
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
