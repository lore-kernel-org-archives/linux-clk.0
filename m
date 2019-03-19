Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE69FC10F0D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:22:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 756C920828
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 11:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="W03Iiu+j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfCSLWm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:22:42 -0400
Received: from mail-eopbgr1400101.outbound.protection.outlook.com ([40.107.140.101]:63659
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726573AbfCSLWl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Mar 2019 07:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoV+mVpuvxcKn8urzRDx8IXliyjcOKpjnqFuPOyNV58=;
 b=W03Iiu+j3H+UjTmlu4dRaH48hyS7dXBkjFlW+NjWCIbK/VV5ZVS+QvolG+RKlsPN/O7h5lGArSBA2q1m2cbBp47T1MFzu6AUMZDmtSGP0e7qoz9EE+w+xehD8Fp+IZz2+jk9rY7dSpy6ufjiaW097Tw12fMdK/iIgoErvgFIDD8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1545.jpnprd01.prod.outlook.com (52.133.162.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 11:22:36 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 11:22:36 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>
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
Thread-Index: AQHUrnSRbgSqJocxwEKqLlOaQWLbRqW08aSAgAez2ICAAB3YAIAABKtQgAADo4CAAAIKsIABbPCAgAGrzkCABM/DAIAAHYOwgE5bR4A=
Date:   Tue, 19 Mar 2019 11:22:35 +0000
Message-ID: <TY1PR01MB1770A2ACD8287D3675270A0AC0400@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
 <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <CAMuHMdVkFJ7Cy-+tNHsOcYaxDj82WjMynuFuPRXa4k=DH2fGCQ@mail.gmail.com>
 <TYXPR01MB1775B75CED683E38B9171EA8C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190124100123.a2gvucnnwrxibulf@verge.net.au>
 <TY1PR01MB177085C4C1DF3D9827EB769BC09B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190128130111.t54jbcyx35fiymq6@verge.net.au>
 <TY1PR01MB177071330C7BD433A701F728C0960@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177071330C7BD433A701F728C0960@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bda78b25-88b7-4002-c1b6-08d6ac5d304d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1545;
x-ms-traffictypediagnostic: TY1PR01MB1545:
x-microsoft-antispam-prvs: <TY1PR01MB1545F07B6BBBD15092CC8BA5C0400@TY1PR01MB1545.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(39860400002)(396003)(136003)(376002)(199004)(189003)(9686003)(5660300002)(106356001)(105586002)(4326008)(53936002)(55016002)(6436002)(7736002)(14444005)(33656002)(99286004)(256004)(2906002)(97736004)(6116002)(7696005)(14454004)(74316002)(305945005)(76176011)(446003)(476003)(11346002)(478600001)(44832011)(102836004)(486006)(26005)(8676002)(53546011)(7416002)(6506007)(316002)(71200400001)(110136005)(54906003)(186003)(81166006)(6246003)(52536014)(3846002)(229853002)(86362001)(93886005)(71190400001)(25786009)(81156014)(68736007)(66066001)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1545;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PATTFpiTKzoEeU7xKlbBByAQcphdqCpQyPTkknyPj5X7/mVwi5fkz+2TNkh3G9Nc3I0mtXTeHJ2eoF64YEIem+Q3d3eJ8Yvk7WDswRm1K8HnwmnidUoXl66xEZtmYMOqgwh+oLzRQQVNgCm0JbfUYPbMtrV1CxwIIyDILJ3xjz1O5H68BJfDD1X4FbPmo73X2pbYbQhaN9caxC3Q2Sj4tatf++mVpMCY1lEcBAv0BbQ18dRBAT0u89fijP5v9pr63W9oH1uV7a0Al7Vjz7iFh/wSWUZB5TXUjTaR6suCMRM+MoBFJZ7jLdoppMEfmZPFUEg7ViyJal+Qwv3nC/NSE/H9FAkFWJB14a+XO5i9iRToyIB/bVwCdp14KwTK1MT77g2uy9BknCjUWvCQCgQU/7g6DHpxBctzfE/JZBUlyXk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda78b25-88b7-4002-c1b6-08d6ac5d304d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 11:22:35.9700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1545
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

> From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org>=
 On Behalf Of Fabrizio Castro
> Sent: 28 January 2019 14:49
> Subject: RE: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock t=
o CAN nodes
>=20
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 28 January 2019 13:01
> > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock=
 to CAN nodes
> >
> > On Fri, Jan 25, 2019 at 11:33:41AM +0000, Fabrizio Castro wrote:
> > > Hello Simon,
> > >
> > > Thank you for your feedback!
> > >
> > > > From: Simon Horman <horms@verge.net.au>
> > > > Sent: 24 January 2019 10:01
> > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 c=
lock to CAN nodes
> > > >
> > > > On Wed, Jan 23, 2019 at 12:18:45PM +0000, Fabrizio Castro wrote:
> > > > > Hello Geert,
> > > > >
> > > > > Thank you for your feedback!
> > > > >
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > Sent: 23 January 2019 12:08
> > > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clk=
p2 clock to CAN nodes
> > > > > >
> > > > > > Hi Fabrizio,
> > > > > >
> > > > > > On Wed, Jan 23, 2019 at 1:01 PM Fabrizio Castro
> > > > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > > > > From: Simon Horman <horms@verge.net.au>
> > > > > > > > Sent: 23 January 2019 11:38
> > > > > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add=
 clkp2 clock to CAN nodes
> > > > > > > >
> > > > > > > > On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrot=
e:
> > > > > > > > > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wr=
ote:
> > > > > > > > > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Cast=
ro wrote:
> > > > > > > > > > > According to the latest information, clkp2 is availab=
le on RZ/G2.
> > > > > > > > > > > Modify CAN0 and CAN1 nodes accordingly.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.re=
nesas.com>
> > > > > > > > > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.=
com>
> > > > > >
> > > > > > > > > Thanks again, applied for v5.1.
> > > > > > > >
> > > > > > > > Sorry, I was a little hasty there.
> > > > > > > >
> > > > > > > > This patch depends on the presence of R8A774A1_CLK_CANFD wh=
ich
> > > > > > > > (rightly) is added in a different patch in this series whic=
h is to
> > > > > > > > go upstream via a different tree.
> > > > > > > >
> > > > > > > > I have dropped this patch for now. I think there are two so=
lution to this
> > > > > > > > problem.
> > > > > > > >
> > > > > > > > 1. Provide a version of this patch which uses a numeric ind=
ex instead of
> > > > > > > >    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is=
 present in an
> > > > > > > >    RC release provide a patch to switch to using R8A774A1_C=
LK_CANFD.
> > > > > > > >
> > > > > > > > 2. Defer this patch until R8A774A1_CLK_CANFD is present in =
an RC release.
> > > > > > >
> > > > > > > Yeah, my personal preference is solution 2.
> > > > > >
> > > > > > Note that solution 2 will probably defer the DT patch to v5.2.
> > > > >
> > > > > Yeah, my understanding is that even if we chose solution 1 we wou=
ld still
> > > > > need to be waiting for v5.2 for the patch to switch to using
> > > > > R8A774A1_CLK_CANFD to appear in a rc, therefore I think solution =
2 is
> > > > > fine.
> > > >
> > > > Your understanding is the same as mine.
> > > >
> > > > I do seem some slight value in option 1 in terms of getting the cha=
nge,
> > > > less the minor issue of using an index rather than a symbol, upstre=
am
> > > > earlier. But I do not feel strongly about this.
> > > >
> > > > I am marking this patch as deferred. Please repost or otherwise pin=
g me
> > > > when you would like to revisit this topic.
> > >
> > > Thank you. Will do.
> >
> > Thanks.
> >
> > I believe "[10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to CA=
N nodes"
> > falls into the same category. I have marked it as deferred accordingly.
>=20
> Ok, thank you Simon

My understanding is that this patch can now be taken, and it still applies =
neatly.

Thanks,
Fab

>=20
> Fab
>=20
>=20
>=20
>=20
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End,=
 Buckinghamshire, SL8 5FH, UK. Registered in England &
> Wales under Registered No. 04586709.
