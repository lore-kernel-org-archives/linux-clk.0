Return-Path: <SRS0=Vu82=QB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48BBC282C6
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 11:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8212920870
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 11:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="TCQ8wMr3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfAYLdu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jan 2019 06:33:50 -0500
Received: from mail-eopbgr1400090.outbound.protection.outlook.com ([40.107.140.90]:15424
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbfAYLdu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Jan 2019 06:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIlPBJFILhJVMdGo7cKF2SytEgkfWV7OvZtdwjvZRDc=;
 b=TCQ8wMr3xPZQm76HyvtcGL7KIiliybUEaxKK1XRaNQUD776ykdUyo/BJgKqRNtie8drVYm10yh7pkslbIWf/pz/bX33kqvamGHtVrSepnN2R+WRI1xkl7BLj0YylZNOTffH/vs7uhWRqYAwclEyuEBx9Jr0qFvlCBkQ77xBNpzA=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1627.jpnprd01.prod.outlook.com (52.133.162.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Fri, 25 Jan 2019 11:33:43 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1558.021; Fri, 25 Jan 2019
 11:33:42 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN
 nodes
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock to
 CAN nodes
Thread-Index: AQHUrnSRbgSqJocxwEKqLlOaQWLbRqW08aSAgAez2ICAAB3YAIAABKtQgAADo4CAAAIKsIABbPCAgAGrzkA=
Date:   Fri, 25 Jan 2019 11:33:41 +0000
Message-ID: <TY1PR01MB177085C4C1DF3D9827EB769BC09B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
 <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
 <TYXPR01MB1775B75CED683E38B9171EA8C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190124100123.a2gvucnnwrxibulf@verge.net.au>
In-Reply-To: <20190124100123.a2gvucnnwrxibulf@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1627;20:F+rWfv+IQChO88t+rhU1ts4hjEPkO6AxyPeWrHBniWybfnF5ZyTMEq4cDINEYCByd4TAqYxmE3tfbHqLGvGZd9StEdCXwn+LuHciRDjuHDbS6YtF51PEcXna3tbtR1Y5Fc9rD+fEQjHK4rDumlepAmZsmMSCr6qLam4TrYYHIf0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: d5dfee32-00f9-4748-0a0c-08d682b8f545
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1627;
x-ms-traffictypediagnostic: TY1PR01MB1627:
x-microsoft-antispam-prvs: <TY1PR01MB16277AC13426186345E05641C09B0@TY1PR01MB1627.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(199004)(189003)(229853002)(93886005)(55016002)(9686003)(86362001)(97736004)(74316002)(316002)(54906003)(66066001)(44832011)(486006)(476003)(11346002)(446003)(71190400001)(71200400001)(26005)(53546011)(6506007)(6436002)(186003)(102836004)(3846002)(14454004)(4326008)(7416002)(25786009)(6116002)(2906002)(99286004)(6246003)(7696005)(53936002)(76176011)(7736002)(305945005)(106356001)(33656002)(105586002)(8936002)(14444005)(8676002)(81156014)(6916009)(478600001)(39060400002)(81166006)(68736007)(345774005)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1627;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q+cLC9kU+0MYAJxEBqWqSpOUtp7zy4XjXvOBDDefluY+cjUWAblVlFgt7Y6CUirS4vKg5azOFYaleD+X1TshXY0wIkcZ20ifz23SShHxwSIxp4DVFxQbY7XQjad5PpyAi2pYE/k4tRg7zlsbu/pGTt8zRAL3CqDWj6nNjaMloCghqLp/JEvV3G0+HoB9e+UFC6chw+ekhoN5LWj69V+8t93vT+tReGTPTgRdsb/Dw+sKR5wsKHnfjhpxIznvD6MySbBnI33ER9Uni9C7+G6iiNgFyKaV8e4FvOhCTtcUf/GLKoU0SyBYQ+zjzaF0nJHn9MT8HGa9ytdLEan8zVeXbyzqVpSwzAX9ajeCr5TiFHG6AyAKuSMcWKn4E7aL82bsmY8av5C21C+hFW6I541aZ+8/RDOIvj53wMolZdY5jJY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dfee32-00f9-4748-0a0c-08d682b8f545
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 11:33:41.7852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1627
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 24 January 2019 10:01
> Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock t=
o CAN nodes
>
> On Wed, Jan 23, 2019 at 12:18:45PM +0000, Fabrizio Castro wrote:
> > Hello Geert,
> >
> > Thank you for your feedback!
> >
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 23 January 2019 12:08
> > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clo=
ck to CAN nodes
> > >
> > > Hi Fabrizio,
> > >
> > > On Wed, Jan 23, 2019 at 1:01 PM Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > From: Simon Horman <horms@verge.net.au>
> > > > > Sent: 23 January 2019 11:38
> > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2=
 clock to CAN nodes
> > > > >
> > > > > On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> > > > > > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrote:
> > > > > > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro wro=
te:
> > > > > > > > According to the latest information, clkp2 is available on =
RZ/G2.
> > > > > > > > Modify CAN0 and CAN1 nodes accordingly.
> > > > > > > >
> > > > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.=
com>
> > > > > > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > > > > Thanks again, applied for v5.1.
> > > > >
> > > > > Sorry, I was a little hasty there.
> > > > >
> > > > > This patch depends on the presence of R8A774A1_CLK_CANFD which
> > > > > (rightly) is added in a different patch in this series which is t=
o
> > > > > go upstream via a different tree.
> > > > >
> > > > > I have dropped this patch for now. I think there are two solution=
 to this
> > > > > problem.
> > > > >
> > > > > 1. Provide a version of this patch which uses a numeric index ins=
tead of
> > > > >    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is prese=
nt in an
> > > > >    RC release provide a patch to switch to using R8A774A1_CLK_CAN=
FD.
> > > > >
> > > > > 2. Defer this patch until R8A774A1_CLK_CANFD is present in an RC =
release.
> > > >
> > > > Yeah, my personal preference is solution 2.
> > >
> > > Note that solution 2 will probably defer the DT patch to v5.2.
> >
> > Yeah, my understanding is that even if we chose solution 1 we would sti=
ll
> > need to be waiting for v5.2 for the patch to switch to using
> > R8A774A1_CLK_CANFD to appear in a rc, therefore I think solution 2 is
> > fine.
>
> Your understanding is the same as mine.
>
> I do seem some slight value in option 1 in terms of getting the change,
> less the minor issue of using an index rather than a symbol, upstream
> earlier. But I do not feel strongly about this.
>
> I am marking this patch as deferred. Please repost or otherwise ping me
> when you would like to revisit this topic.

Thank you. Will do.

Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
