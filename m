Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D75BC282CF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 14:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C99EA20844
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 14:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="QeQgcO6G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfA1Ot1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 09:49:27 -0500
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:28600
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726647AbfA1Ot0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jan 2019 09:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1DhiLDHd5YZyISTmvvkip7jiWe358gAQWWMlkJmZhg=;
 b=QeQgcO6GUS5/DBQoF2uvEpv6i2V/+jC7nciy4W6EJVWnBJCatRr+5NPlVGKke4L5VQZnqY0DnQjgpLWVAyvxH2+6Yj65sMRmUNBxqXTMajXzSAGud56MG3vQgdyb3CdZpMBfOtty7iXy5iPtX+SRshh55+EKfbmeiaTpLXNBysE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1708.jpnprd01.prod.outlook.com (52.133.160.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Mon, 28 Jan 2019 14:49:21 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1558.023; Mon, 28 Jan 2019
 14:49:21 +0000
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
Thread-Index: AQHUrnSRbgSqJocxwEKqLlOaQWLbRqW08aSAgAez2ICAAB3YAIAABKtQgAADo4CAAAIKsIABbPCAgAGrzkCABM/DAIAAHYOw
Date:   Mon, 28 Jan 2019 14:49:21 +0000
Message-ID: <TY1PR01MB177071330C7BD433A701F728C0960@TY1PR01MB1770.jpnprd01.prod.outlook.com>
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
In-Reply-To: <20190128130111.t54jbcyx35fiymq6@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1708;20:kE/ansnPv6w1Feuz7dLMTvOfjl/EtE7l86FY/nEZVXGlvCkWNATuU38bbVgD6ywe8PDVMXhRVhSOS9oTVdDDKnvYbU7ANq2uwOUXnp5Q5s0FwGPoVQqP9Ii0zw8D8u5vOQ4QGfiJedU1DyQiXi/rnuoSsHb859yBdgi1ge3JlWg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 828850a5-d3e6-4375-cff3-08d6852fc99a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1708;
x-ms-traffictypediagnostic: TY1PR01MB1708:
x-microsoft-antispam-prvs: <TY1PR01MB17084767B7425F0CC89C2031C0960@TY1PR01MB1708.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(189003)(6116002)(486006)(3846002)(99286004)(4326008)(39060400002)(6246003)(74316002)(305945005)(55016002)(7736002)(66066001)(44832011)(11346002)(25786009)(102836004)(26005)(86362001)(6506007)(53546011)(7416002)(186003)(53936002)(93886005)(6916009)(446003)(76176011)(476003)(7696005)(478600001)(6436002)(71190400001)(71200400001)(256004)(14444005)(2906002)(33656002)(68736007)(106356001)(345774005)(97736004)(316002)(9686003)(54906003)(229853002)(14454004)(81166006)(8936002)(8676002)(81156014)(105586002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1708;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: owgauPf5V7U6ksp5FREODy8uZH5BQs84KO1D8YLmQF55GAZIgPNVttQ5kY0JWSbf4+sNRwUYy96KS0r+FnIbVdaneXr4QIsKhX738MMHKbFLq01FDZlptuRUa+Nnhm+ge2uVJf/DHR/4g9ASURQsbdN7r2+BYanOj6v+iUbUfvlCewS5BDzlqp46a5pliSCRwcXqafEHJ5QJfcKGt2hnjR9MQYOea0/jSF7lUjgQBnotZVYW7LCY3itFxJHDmL9RUp4reDEQgCDdBkDr5aFKM3Acaj7Af03zi9sscirTr9Tlsjg/0sM/H79MZxefWvqZiABSkKjEv+VjJ5sMmnCnGM0zsXw4FxifwXesdodMUTGIRLHrK4fWLG3At3Z97iCVbmP/kTzSopALbiXCXvZ0mfsa1T3Y6HSvzoplC7tKcDg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828850a5-d3e6-4375-cff3-08d6852fc99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 14:49:21.1045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1708
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> From: Simon Horman <horms@verge.net.au>
> Sent: 28 January 2019 13:01
> Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock t=
o CAN nodes
>
> On Fri, Jan 25, 2019 at 11:33:41AM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> >
> > Thank you for your feedback!
> >
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 24 January 2019 10:01
> > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clo=
ck to CAN nodes
> > >
> > > On Wed, Jan 23, 2019 at 12:18:45PM +0000, Fabrizio Castro wrote:
> > > > Hello Geert,
> > > >
> > > > Thank you for your feedback!
> > > >
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > Sent: 23 January 2019 12:08
> > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2=
 clock to CAN nodes
> > > > >
> > > > > Hi Fabrizio,
> > > > >
> > > > > On Wed, Jan 23, 2019 at 1:01 PM Fabrizio Castro
> > > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > > > From: Simon Horman <horms@verge.net.au>
> > > > > > > Sent: 23 January 2019 11:38
> > > > > > > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add c=
lkp2 clock to CAN nodes
> > > > > > >
> > > > > > > On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> > > > > > > > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrot=
e:
> > > > > > > > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro=
 wrote:
> > > > > > > > > > According to the latest information, clkp2 is available=
 on RZ/G2.
> > > > > > > > > > Modify CAN0 and CAN1 nodes accordingly.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.rene=
sas.com>
> > > > > > > > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.co=
m>
> > > > >
> > > > > > > > Thanks again, applied for v5.1.
> > > > > > >
> > > > > > > Sorry, I was a little hasty there.
> > > > > > >
> > > > > > > This patch depends on the presence of R8A774A1_CLK_CANFD whic=
h
> > > > > > > (rightly) is added in a different patch in this series which =
is to
> > > > > > > go upstream via a different tree.
> > > > > > >
> > > > > > > I have dropped this patch for now. I think there are two solu=
tion to this
> > > > > > > problem.
> > > > > > >
> > > > > > > 1. Provide a version of this patch which uses a numeric index=
 instead of
> > > > > > >    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is p=
resent in an
> > > > > > >    RC release provide a patch to switch to using R8A774A1_CLK=
_CANFD.
> > > > > > >
> > > > > > > 2. Defer this patch until R8A774A1_CLK_CANFD is present in an=
 RC release.
> > > > > >
> > > > > > Yeah, my personal preference is solution 2.
> > > > >
> > > > > Note that solution 2 will probably defer the DT patch to v5.2.
> > > >
> > > > Yeah, my understanding is that even if we chose solution 1 we would=
 still
> > > > need to be waiting for v5.2 for the patch to switch to using
> > > > R8A774A1_CLK_CANFD to appear in a rc, therefore I think solution 2 =
is
> > > > fine.
> > >
> > > Your understanding is the same as mine.
> > >
> > > I do seem some slight value in option 1 in terms of getting the chang=
e,
> > > less the minor issue of using an index rather than a symbol, upstream
> > > earlier. But I do not feel strongly about this.
> > >
> > > I am marking this patch as deferred. Please repost or otherwise ping =
me
> > > when you would like to revisit this topic.
> >
> > Thank you. Will do.
>
> Thanks.
>
> I believe "[10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN =
nodes"
> falls into the same category. I have marked it as deferred accordingly.

Ok, thank you Simon

Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
