Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9254C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D25220870
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 12:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="XX2hYMjo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfAWMA7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 07:00:59 -0500
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:43072
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725991AbfAWMA7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 07:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6p+dt2UtV6lCXAFEMJLQNPs4DHBLbA7H3Z4snnavUTA=;
 b=XX2hYMjo7X8qYMcwp+EawEqGHRgyesIRPJOqWmjv8jdDFza10r2DgzUjYm8MdPAcLgTUNO771nFmIgUzQpkll61Ob59Oq2m46KAbI9sJBh14trsp+I0MjrlYPd4x7DnRo9+082mLAIDg2FyQ2c8eTe3JBNvENLnigddtBfgDUQI=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1774.jpnprd01.prod.outlook.com (52.133.168.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Wed, 23 Jan 2019 12:00:54 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::b5fe:6253:600a:4540]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::b5fe:6253:600a:4540%3]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 12:00:54 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Wolfgang Grandegger <wg@grandegger.com>,
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
Thread-Index: AQHUrnSRbgSqJocxwEKqLlOaQWLbRqW08aSAgAez2ICAAB3YAIAABKtQ
Date:   Wed, 23 Jan 2019 12:00:54 +0000
Message-ID: <TYXPR01MB1775ABDCFD939F91F1053534C0990@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190118121353.3mb44a7rmmp2ru5d@verge.net.au>
 <20190123095122.l3engeuwx6qr5lzc@verge.net.au>
 <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
In-Reply-To: <20190123113812.e3nojtxjxywmg4gn@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1774;20:wjffJdZ0Ft8jakZdIKO3zqtQ2HSZqDLrDVidYXw8OPjLsAhKzPy2ZXV0d8YloRILUfDI5+SwigISRUcSYsqYVG6TTs5wRH6lsyN/JT2rc7ua1AmLvf0eXp6RMtdqWzK0phemLzbTN6xW6F7pGwWucGDTcmHAUb5HK691wqzRjzo=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 91186f55-0a53-4ae8-f290-08d6812a6d62
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1774;
x-ms-traffictypediagnostic: TYXPR01MB1774:
x-microsoft-antispam-prvs: <TYXPR01MB1774603995E0833A1BDE284FC0990@TYXPR01MB1774.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(186003)(2906002)(33656002)(256004)(86362001)(9686003)(26005)(74316002)(476003)(25786009)(7696005)(53936002)(76176011)(68736007)(93886005)(71190400001)(71200400001)(99286004)(53546011)(6506007)(486006)(102836004)(4326008)(106356001)(105586002)(345774005)(44832011)(6246003)(39060400002)(446003)(8936002)(3846002)(81156014)(54906003)(81166006)(8676002)(229853002)(316002)(66066001)(6116002)(7416002)(7736002)(478600001)(11346002)(97736004)(55016002)(6916009)(305945005)(6436002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1774;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7HOMg+yDQW9tfMxhXc4NWBItKYlOWhfn5MjLxWTUnR/l649qbx9wvqA30oT6dRFR3iUYNwUePliSJ2b1VPH+xa0f+9SaQYHQYzWq/SbDIPGn/kIkQsQVoNyvYFKF+jalTNSSSheteV3stl2OI+2lrbRnfDQWkTILyOnci5cu7vbBzo+cHJ/c5AEORJ1dKhWkL+mdUt+KaJYJdjiX3IPURiWsk9vgCvtdncy9GUDpPdvS9JAXgoR3v+EueocFujqVbKsFeDvn1xCHduryOSAmWMX9HNNUs3Bw6ps0GzbmfvVJpSuk7ecXQS6GJ2g1X5VFNChC0nGvzj50nitq9bnLs28ZIEwaJPkLKKIR1WG4n9uKX5tV6dnanbDNZjraIdwNRENZ36dFVmUZDlrpAMW1TNuVSwGSUegQyyTPlYM4ONU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91186f55-0a53-4ae8-f290-08d6812a6d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 12:00:54.2689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1774
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 23 January 2019 11:38
> Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add clkp2 clock t=
o CAN nodes
>
> On Wed, Jan 23, 2019 at 10:51:23AM +0100, Simon Horman wrote:
> > On Fri, Jan 18, 2019 at 01:13:53PM +0100, Simon Horman wrote:
> > > On Thu, Jan 17, 2019 at 02:54:15PM +0000, Fabrizio Castro wrote:
> > > > According to the latest information, clkp2 is available on RZ/G2.
> > > > Modify CAN0 and CAN1 nodes accordingly.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > Thanks,
> > >
> > > This looks fine to me but I will wait to see if there are other revie=
ws
> > > before applying.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Thanks again, applied for v5.1.
>
> Sorry, I was a little hasty there.
>
> This patch depends on the presence of R8A774A1_CLK_CANFD which
> (rightly) is added in a different patch in this series which is to
> go upstream via a different tree.
>
> I have dropped this patch for now. I think there are two solution to this
> problem.
>
> 1. Provide a version of this patch which uses a numeric index instead of
>    R8A774A1_CLK_CANFD. And then, once R8A774A1_CLK_CANFD is present in an
>    RC release provide a patch to switch to using R8A774A1_CLK_CANFD.
>
> 2. Defer this patch until R8A774A1_CLK_CANFD is present in an RC release.
>

Yeah, my personal preference is solution 2.

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
