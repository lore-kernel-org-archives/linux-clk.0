Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A975C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26DD420836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550783425;
	bh=4/wBKIrAjXYWFrYaS/gZt2IYII13yKOy67ryd3L2+D8=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=UraDSBjU3PD8my35lQxylZV3CU/J2NNwYM4g3FqseB0nXQ43NQ5719FxwG5Q30Mx0
	 n60IXlbi0wmOjWoTp1au0R5ae3Je7PI1FBh0HDuNMoJPcXbPMczcarXII9X8z1d+8S
	 9SMhUNCfqL71FNrpaAUbEcXG4PozlmewaBULPhUs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfBUVKY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 16:10:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:35208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbfBUVKY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 16:10:24 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB1E82080F;
        Thu, 21 Feb 2019 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550783424;
        bh=4/wBKIrAjXYWFrYaS/gZt2IYII13yKOy67ryd3L2+D8=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=AeKZ6+RWOveZ8XeDLaeOTv+aqT0JS+m9Mk4y+DFVVMp5aTI48OWUebdpRRTclRPvF
         wdspA/InDX1lNdITjlqWnnvr8Tf7WT1RlXcDP/woK6wskqzQPkbsBclw3C5Eg3MZjN
         DiWemwrHhSfgOZONFz+lpeI8g2kBlV6OYE/h29kE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Message-ID: <155078342316.77512.8478244735968237818@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com> <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Date:   Thu, 21 Feb 2019 13:10:23 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-02-21 10:33:42)
> On Wed, Feb 20, 2019 at 5:09 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Enum LAST_DT_CORE_CLK needs updating as R8A774C0_CLK_CANFD
> > was recently added and it's the core clock with the highest
> > index.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>=20
> Nice catch!
> You only notice this kind of bug when you start referencing the clock
> from DT, right? At registration time, the clock number space is shared wi=
th
> internal core clocks, so no error is detected.
> Can we improve that?
>=20
> Fixes: 2a6efbc6da5d248c ("clk: renesas: r8a774c0: Add missing CANFD clock=
")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Mike/Stephen: can you please take this one directly, as it is a fix for
> clk-next?
>=20

Yep. Applied to clk-renesas and merged up.

