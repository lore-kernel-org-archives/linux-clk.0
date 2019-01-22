Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5A9C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3648520870
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548184010;
	bh=9pRc+Fg5KfwT3VHobTyrcTqCOOG+bhhAqeMWDWKgWD8=;
	h=To:In-Reply-To:References:Subject:From:Cc:Date:List-ID:From;
	b=biPfOBhQadA8tdIQ99KFbG63CGtk7E1GETbx6srwlZDjqx4q9tZo63XqsA1FkWanC
	 G6PxNAndZ9YouxN1XjPc/jHHJYYlOHp2SN4kDpJR3MhSQsLO44jnDpqXJ16hmZQaAh
	 FRY5Szs4EYbyBpTomc7S1GTWCNpXwus6qixR1rDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfAVTGu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:06:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:44748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfAVTGt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 14:06:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 335D220856;
        Tue, 22 Jan 2019 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548184009;
        bh=9pRc+Fg5KfwT3VHobTyrcTqCOOG+bhhAqeMWDWKgWD8=;
        h=To:In-Reply-To:References:Subject:From:Cc:Date:From;
        b=dlKttpPHA+QlSDUA1Gcu084bnKBl5qnNXbqVkQpD6rgLznjVF7GAanEc55cmBP9Q/
         f1BFD5So3oJOKXu74z2iDAHkBgxb2D9JdhkDfSf5GcGEnzpbvUt6Stfuy0kVDpH7By
         q5JsnqIXmY38LS36HFwj40Asqt7+jRk0Detv6SQM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <20190116110216.GN15808@dragon>
User-Agent: alot/0.8
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com> <AM0PR04MB42115D3E98B8B319936AC60E80820@AM0PR04MB4211.eurprd04.prod.outlook.com> <20190116110216.GN15808@dragon>
Subject: Re: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock support
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154818400852.20280.9414688242016617890@swboyd.mtv.corp.google.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Tue, 22 Jan 2019 11:06:48 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-01-16 03:02:17)
> On Wed, Jan 16, 2019 at 05:40:01AM +0000, Aisheng Dong wrote:
> > Ping...
> >=20
> > BTW, as the first two patches change the same firmware binding doc fs.s=
cu.txt.
> > I'm not sure whether it should go to Shawn's tree for the binding part,=
 or Stephen's clock tree.
> >=20
> > Shawn & Stephen,
> > What's your suggestion?
>=20
> I can apply the first two to my tree as long as Rob and Stephen ack on
> them.
>=20

The first two are documentation updates? I don't care really either way,
so I gave my ack in case you want to pick them up before I get around to
the rest of the series.

