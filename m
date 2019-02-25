Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E504BC4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B474C20989
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:44:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="si8kFh6V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfBYJo1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:44:27 -0500
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:38229
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbfBYJo1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 04:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XkG4t47M2JbvjznDCx4Q/dzo2x+LYUwgVvBDCXEzf0=;
 b=si8kFh6VnilO8wTxy+Tn8/I7fbo5WV6icngT4Fw1lZoKyxt/Ao1cDY7lbl155z5xq58ZIJN53YnnLq9DjxNf/kIfCZbDMZts2MjE6NIbMA5Qzhx0NO5Owibw+pIQd/lSZ1u1XdMQ3Oc3goD31fL2ccftTsJY4EUTFzb6Q6mY0EI=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1836.jpnprd01.prod.outlook.com (52.133.164.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Mon, 25 Feb 2019 09:44:22 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.019; Mon, 25 Feb 2019
 09:44:22 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyqYgtONDUUQKMUK/Mf0Ogtgn0qXrt1qAgASL6ACAAACqgA==
Date:   Mon, 25 Feb 2019 09:44:21 +0000
Message-ID: <TY1PR01MB177027370EE55C92347CC576C07A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20190225092708.cwormmuqdm3g4umy@verge.net.au>
In-Reply-To: <20190225092708.cwormmuqdm3g4umy@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d90dcaa9-11a3-491d-ce13-08d69b05d210
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1836;
x-ms-traffictypediagnostic: TY1PR01MB1836:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1836;20:xwTNRRp/dfS1okY5DuO+5MH6VwliVdoyEq7ZWMYQDLiPJw8lZ32l2ECtXSpI+lyFV8H1CeDg4VkWMM9sPZkzLdy6HVEa2QUSUrZbeFf078eEJQjTyda3odYf5+2ZBfhbrHJbSiRmn3L28Fz9SJa0IXymYuIXvTbMx/1Ph32ebyI=
x-microsoft-antispam-prvs: <TY1PR01MB1836B4654B80B81A8E44376EC07A0@TY1PR01MB1836.jpnprd01.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(366004)(346002)(136003)(199004)(189003)(71190400001)(71200400001)(5660300002)(66066001)(74316002)(186003)(7736002)(256004)(44832011)(105586002)(86362001)(486006)(106356001)(26005)(97736004)(229853002)(305945005)(476003)(446003)(8676002)(68736007)(11346002)(52536013)(6116002)(7696005)(53546011)(81156014)(81166006)(107886003)(102836004)(76176011)(478600001)(25786009)(6506007)(99286004)(4326008)(14454004)(3846002)(6436002)(14444005)(54906003)(110136005)(55016002)(6246003)(8936002)(2906002)(33656002)(316002)(9686003)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1836;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7HONYckm5TvIATjMIKHPQTCI0c853Nu9SnOOcqBSID+zRhrv9cWa7hcZSNsZWZ143zqMx9PQ3l/DFqmancR+dFc0sx5h0I61ZlHPh8tN0IphrMyjukAsyZ3wXGp4GoYN1TAY0nEbvMfAiP3b+hx4TcLfrOByU86wHren7JERfq+UW8ZqQwl8sWz+K7ZHC5qTVnd9lbx4zE5/j5CjItWWBcZbhawPXRaeEPi/q8zNSdLsyWtKZNUNahnwOXTrmNrfcErjQPfY/cjk4SpXEmCx/a/MAD4gCfHKhMaehjbjL1lALBWM3B+Ofr6wDKx4pwktpZEFQgz4DD2lIf3xHFGII96nc9lntj0F26cNCDKWM3CLUy/pjkB+pQ3YsSlec/6qAbzYLOy4TLbMpGb9IFkQ8+xK+6TCSpQP4dYTgjVtFh8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90dcaa9-11a3-491d-ce13-08d69b05d210
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 09:44:21.5378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1836
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon, Geert

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 25 February 2019 09:27
> Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
>=20
> On Fri, Feb 22, 2019 at 12:01:21PM +0000, Chris Paterson wrote:
> >
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Sent: 22 February 2019 12:00
> > >
> > > Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> > > was recently added and it's the core clock with the highest
> > > index.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
>=20
> I think this needs:
>=20
> Fixes: 9d034e151b40 ("clk: renesas: r8a774a1: Add missing CANFD clock")

I naively thought I could only refer to commits from Torvald's, which is cl=
early wrong,
therefore thank you for fixing.

Cheers,
Fab

>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> >
> > > ---
> > >  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > > b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > > index 5fcd6c5..8e7bb43 100644
> > > --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > > @@ -21,7 +21,7 @@
> > >
> > >  enum clk_ids {
> > >  	/* Core Clock Outputs exported to DT */
> > > -	LAST_DT_CORE_CLK =3D R8A774A1_CLK_OSC,
> > > +	LAST_DT_CORE_CLK =3D R8A774A1_CLK_CANFD,
> > >
> > >  	/* External Input Clocks */
> > >  	CLK_EXTAL,
> > > --
> > > 2.7.4
> >
