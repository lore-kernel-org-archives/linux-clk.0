Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA89FC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 22:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BC5620693
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624966;
	bh=+0Nr/HOGTbNqhlFRt1oxy7PmywbnSlMHyUEv7TqLpDk=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=IPPMV4WE2ZO/+nL4cvzyDyt4q/7kz2Ht00Z+p3XTzefFebdQx8r+QhQHOIcMmoGEs
	 /rNo14gqP5Hh7acMXT72ROurzMmoGzzUh5W+CQEeTRX1d5/umi9VajT5f9kT5T4Gk6
	 nhBiRviOefM+GlsLLPhvrZOiq+RJcJUIUGP0kKPk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbfDRWCq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 18:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfDRWCq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 18:02:46 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E84C205ED;
        Thu, 18 Apr 2019 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624965;
        bh=+0Nr/HOGTbNqhlFRt1oxy7PmywbnSlMHyUEv7TqLpDk=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=ZP9+Y1debAHOFxYUh/Tq6JHKFdYnigJDx0gX2+3XESup+4drJad67wFouNkD7Cj6i
         zjc+/XR10hUPy6k3olOggUNIcLv6caK/uy3Thvogir/30U5p2M6vafr5Y8XE1YvPR5
         OenIyV8pdHjW8e5mTUBGVZopJ5pmsjpJshiEMZsI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BYAPR02MB59923C6ACA66F86DD73C4774B8260@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190412095220.22855-1-m.tretter@pengutronix.de> <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com> <155561994675.15276.10692297233973568559@swboyd.mtv.corp.google.com> <BYAPR02MB59923C6ACA66F86DD73C4774B8260@BYAPR02MB5992.namprd02.prod.outlook.com>
Cc:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michals@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Jolly Shah <JOLLYS@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Message-ID: <155562496450.15276.10143943261358384363@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 15:02:44 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jolly Shah (2019-04-18 14:15:24)
> Hi Stephan,
>=20
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Sent: Thursday, April 18, 2019 1:39 PM
> > To: linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org; Jo=
lly Shah
> > <JOLLYS@xilinx.com>; Michael Tretter <m.tretter@pengutronix.de>
> > Cc: kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> > Michal Simek <michals@xilinx.com>
> > Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
> >=20
> > Quoting Jolly Shah (2019-04-18 13:01:32)
> > > Hi,
> > >
> > > > -----Original Message-----
> > > > From: Michael Tretter <m.tretter@pengutronix.de>
> > > > Sent: Friday, April 12, 2019 2:52 AM
> > > > To: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > > Cc: kernel@pengutronix.de; Michael Turquette
> > <mturquette@baylibre.com>;
> > > > Stephen Boyd <sboyd@kernel.org>; Michal Simek <michals@xilinx.com>;
> > Jolly
> > > > Shah <JOLLYS@xilinx.com>; Michael Tretter <m.tretter@pengutronix.de>
> > > > Subject: [PATCH v3] clk: zynqmp: use structs for clk query responses
> > > >
> > > > The driver retrieves the clock try by querying the ATF for the clock
> > >
> > > *tree
> > >
> > > Thanks,
> > > Jolly Shah
> >=20
> > Is that a Reviewed-by?
>=20
> Commit message has a typo, "try" instead of "tree". Rest looks good.
>=20

Ok. Same question. With typo fixed can you provide your reviewed-by tag?

