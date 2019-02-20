Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B77DC43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B6E62146E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 20:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550696187;
	bh=i19Yd9t0tE1oyBSiiT8riqBloLBi5GvIMO+tNvl7dh0=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=vpip3JIBj+/BtJQ80aTrTCKydMToFDcPmy9Xdus03UK+Kfh9Q6ehJBZyQOxSSYPFf
	 yzWFwwzjkTg5d4lV/d4aM+4AcMOStEtMpt+z4U8UPyNMeO0/QwXO88wD6ySYjQWDmZ
	 AJErHP4WN3YJD77kkXAglkpHk0DqmCLA4ZV+57k8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfBTU41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 15:56:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbfBTU40 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 15:56:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65F1F2089F;
        Wed, 20 Feb 2019 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550696185;
        bh=i19Yd9t0tE1oyBSiiT8riqBloLBi5GvIMO+tNvl7dh0=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=LKBRAHo7onXu9aIkZmqrDVtw/bnpLf+T7Dorop5sTL2CIUqROn40D5i08vN0PNUba
         AqVwXXENsLoS0IIoA9sep3P0NP4/SyFNFLb2ymfhmadeGqs4yvfQ2zdS5lVBD5E543
         8h0tOHLzMVNQr7/XP6tLs04ZkH2LXtoM7haxcglY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V3 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Message-ID: <155069618457.77512.12216138806698646030@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com> <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com> <20190213221818.GA13126@bogus> <AM6PR04MB4215A70B99715434A3770532807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM6PR04MB4215A70B99715434A3770532807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Wed, 20 Feb 2019 12:56:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2019-02-19 23:07:46)
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Thursday, February 14, 2019 6:18 AM
> > On Thu, Jan 24, 2019 at 01:22:45PM +0000, Aisheng Dong wrote:
> > > Add a53 and a72 clock id, as there's still no users, we update
> > > IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock id to
> > > be continued with a35 clk.
> > >
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > v1->v2:
> > >  * change cpu clock to cpu cluster clock per Rob's suggestion
> > > ---
> > >  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/dt-bindings/clock/imx8-clock.h
> > > b/include/dt-bindings/clock/imx8-clock.h
> > > index b149e63..dcce744 100644
> > > --- a/include/dt-bindings/clock/imx8-clock.h
> > > +++ b/include/dt-bindings/clock/imx8-clock.h
> > > @@ -14,10 +14,12 @@
> > >  /* CPU */
> > >  #define IMX_A35_CLK                                        1
> > >  #define IMX_CPU_CLUSTER_A35_CLK                            1
> > > +#define IMX_CPU_CLUSTER_A53_CLK                            2
> > > +#define IMX_CPU_CLUSTER_A72_CLK                            3
> >=20
> > I still don't get this. How many clock outputs does the clock controlle=
r have for
> > CPUs? If 3, then this is correct. If it's the same clock controller bit=
s across
> > different SoCs, then just name it something like IMX_CPU_CLUSTER_CLK and
> > reuse the same ID.
> >=20
>=20
> For SCU firmware based platforms like mx8qxp/qm, the clocks are provided
> by SCU firmware via SCU firmware call with unique IDs. So it's safe to us=
e a common
> Clock IDs file.
>=20
> But please ignore patch 3 and 4 first because we still met a few limitati=
ons with
> current approach due to the device availability may vary a bit across CPU=
s and
> Subsystems.
>=20
> We formerly planned to add all new IDs for each SS and dynamically check =
availability
> in driver. That can be done but that may involve a lot effort and may res=
ult in more
> changes In driver. Also hard to upstream device tree code due to dependen=
cy on Clock IDs.
>=20
> To relief this situation, we want to move the clock definition into devic=
e tree which
> can fully decouple the dependency of Clock ID definition from device tree.
> And no frequent changes required in clock driver.
>=20
> I will send a patch set to do it later.
>=20

Ok. I'll take this as a signal to drop these from the clk review queue.
Thanks.
