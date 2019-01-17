Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5ABC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EDF420657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hTXLgf+Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfAQMcr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:32:47 -0500
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:25600
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbfAQMcr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jan 2019 07:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o6vmWoG6LL9rVPcvovGQVaK3Q+eoBav8Sg1qFztHJE=;
 b=hTXLgf+ZPjbnWgSlxYY1PphL4dwi07EG3MjmybWICHWoo77h2ygDnWHU3u4mstXTzM8nFhr7bwGN3OuHQ6ofmORJyURZi4MDXpEt1ralwqXOZBJvqfKovJquqyrfFrGKeRrBXH0aFRWMH1x+VKrrg2gRfaY+F0aVl3WgHWKoWDk=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB4269.jpnprd01.prod.outlook.com (20.178.138.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Thu, 17 Jan 2019 12:32:37 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::9163:fe8d:ceb8:8d88%6]) with mapi id 15.20.1537.018; Thu, 17 Jan 2019
 12:32:37 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 02/11] dt-bindings: arm: renesas: Add si-linux cat87[45]
 boards
Thread-Topic: [PATCH 02/11] dt-bindings: arm: renesas: Add si-linux cat87[45]
 boards
Thread-Index: AQHUrcqrlP+e8ViJmEeC72rqO/zXEaWzSYOAgAAa6JA=
Date:   Thu, 17 Jan 2019 12:32:37 +0000
Message-ID: <TYAPR01MB2285EAE232CCADD7FB95E712B7830@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117105107.dtuttem7x7ovaey2@verge.net.au>
In-Reply-To: <20190117105107.dtuttem7x7ovaey2@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYAPR01MB4269;20:OmHH1oZgr9y/Elx5MmuwaCPHvEGRGhNtiRFBkAjpBmMtd9E61B+0OfPZ+V9pwPFmCimZ0fysaUuHFOAEgj0e41uee1ySa6ROrXY9EoTJs9D7CoNR5qLiBkEdIETgVBRXnwTYqtTWD91UA/ToVW64WzH5wAwVSQIhqvi8V+VLmW4=
x-ms-office365-filtering-correlation-id: 383ddae1-9319-4ecb-369a-08d67c77dd72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB4269;
x-ms-traffictypediagnostic: TYAPR01MB4269:
x-microsoft-antispam-prvs: <TYAPR01MB42695062DC669A2A244E1364B7830@TYAPR01MB4269.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(396003)(39850400004)(136003)(199004)(189003)(478600001)(106356001)(72206003)(9686003)(7736002)(55016002)(54906003)(316002)(6436002)(305945005)(966005)(110136005)(486006)(229853002)(6306002)(14454004)(97736004)(105586002)(7696005)(7416002)(2906002)(5660300001)(74316002)(76176011)(8936002)(26005)(86362001)(6506007)(102836004)(3846002)(6116002)(33656002)(11346002)(68736007)(446003)(6246003)(66066001)(476003)(39060400002)(71190400001)(8676002)(186003)(14444005)(81156014)(256004)(71200400001)(81166006)(99286004)(25786009)(4326008)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4269;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RMJIWxM9BVxguNINitgJu/CrBFXQTx5vFcg12HaXIbJnvtRfRjQN2hRO0NgHPUFeY2Y5FL1i6z8OCBmfS/LIi0ZN9Lg7hAxzkS6gyZnfyzBoyPBW/F50uwJdfLOywgAofhOt0i14Lv/2PemiotzD5FhGgheW2mbaKML6uxOa7a+sRIKqBGvrIoaYCd1XxTfsNsLi22lj5zQnF758srF5RkzCMmmMtlQUUOoDsbsSRHztF3KXU1lV7Nip4NPx7HpiFdPizDzEyiOFOfZoxQ80JF0fjhyAu4G89D4beELY71GcQNAQOAunv/fTM/Xhsn1Nms4qJrVnF2lXBwSKY+aYT3USvjOqwHAMcFQ2kAYJlOzBo8c/IMmVicFZV6aOP/QPfXCuNKk6n3cQgJ81MJkHbXmOKxf/YKojZhjGgjCPiEU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383ddae1-9319-4ecb-369a-08d67c77dd72
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 12:32:37.4423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4269
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 January 2019 10:51
>=20
> On Wed, Jan 16, 2019 at 06:37:45PM +0000, Fabrizio Castro wrote:
> > This patch adds board cat874 (powered by the RZ/G2E) and board
> > cat875 (that sits on top of cat874). Both boards are made by
> > Silicon Linux.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml
> b/Documentation/devicetree/bindings/arm/renesas.yaml
> > index 5e9d486..9e1e07b 100644
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -108,6 +108,14 @@ properties:
> >
> >        - description: RZ/G2E (R8A774C0)
> >          items:
> > +          - enum:
> > +              - si-linux,cat874 # Silicon Linux RZ/G2E 96board platfor=
m (CAT874)
>=20
> Can I confirm that "96board platform" is correct for this board - I don't
> see it in the documentation I have, but that may not mean much.

The board follows the extended version of the Linaro 96board consumer editi=
on (CE) specification [1].

You can see a pretty picture of the board on the CIP Blog [2].

[1] https://www.96boards.org/specifications/
[2] https://www.cip-project.org/blog/2018/10/23/renesas-rz-g2m-96ce-board-a=
dopted-as-arm64-reference-board-for-the-next-cip-slts-kernel

Kind regards, Chris

>=20
>=20
> That aside, I'd like to wait for Rob to indicate if he will accept
> patch 1, which adds si-linux as a vendor, before I apply this patch.
>=20
> > +          - const: renesas,r8a774c0
> > +
> > +      - items:
> > +          - enum:
> > +              - si-linux,cat875 # Silicon Linux sub board for CAT874 (=
CAT875)
> > +          - const: si-linux,cat874
> >            - const: renesas,r8a774c0
> >
> >        - description: R-Car M1A (R8A77781)
> > --
> > 2.7.4
> >
