Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF568C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D1C521D7F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602636062;
	bh=/4ZgDBjyWkwXe5H6gd45wxdgnyed3DAL9NsKS6WheFs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Q7zVcwwqLSCuoQXTJ3oPrsLRNuOjbSn30mtg/ihT9jU2csQyY/zcqq+AdyNkyO8I4
	 uIfqTSfqrfB2iDew9m9tpSQ48d1wLpiq53BvTIExGvTcyBBNDmWHvH58BqNZnhZOuI
	 N0m2l5kreD/1EkuMVcbwXwEQ3z07ZRTBpkOsTKE0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgJNAlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 20:41:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:54560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgJNAlB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 20:41:01 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 912FA21D40;
        Wed, 14 Oct 2020 00:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602636061;
        bh=/4ZgDBjyWkwXe5H6gd45wxdgnyed3DAL9NsKS6WheFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vSBz+pKV6eVHp1z3GHcZo8iM/8CRYLE+Sp/R+VG4fCNK7HczOjDwDkptZzz2UM/aQ
         Rt1kNWHRntNhDrRDa4X+Lggb1es6lXLdD5axBPzaqFpl4q9hlQhI5SZKjJDABrUc0g
         uv5sTO0YsCPetympM3H3lKLueSdiCuEpZtXjKN5E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA+hA=S_eO1orWerMPVCujgybFAcG0TCur8LumF5WtZF=zHg3w@mail.gmail.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com> <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com> <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com> <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com> <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com> <160253089964.310579.15879711282194567508@swboyd.mtv.corp.google.com> <CAA+hA=S_eO1orWerMPVCujgybFAcG0TCur8LumF5WtZF=zHg3w@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        ARM/FREESCALE IMX / MXC ARM ARCHITECTURE 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
To:     Dong Aisheng <dongas86@gmail.com>
Date:   Tue, 13 Oct 2020 17:41:00 -0700
Message-ID: <160263606049.310579.2039950012647453863@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-10-13 02:27:37)
> On Tue, Oct 13, 2020 at 3:28 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Aisheng Dong (2020-09-26 21:13:44)
> > > Gently ping again...
> > >
> > > @Stephen Boyd
> > > Could you kindly provide some feedback how we can proceed this?
> > >
> >
> > Hmm I thought Shawn was going to apply this a while ago. Did that not
> > happen? I guess I'll have to pile it in now.
>=20
> Now there's still one patch that does not have your R-b tags.
> I guess Shawn is waiting for this.
> Once you give the R-b tags, this series could go to Shawn's tree
> as another DT patch set also depends on this.
>=20
> Would you help check this left one?
> [PATCH v7 03/11] clk: imx: scu: add two cells binding support
> All other patches already get yours R-b tags.

Ok I see. Sent the tag now.
