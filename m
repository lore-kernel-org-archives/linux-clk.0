Return-Path: <SRS0=jyYP=DT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56144C433E7
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C422074A
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602530720;
	bh=y3g8x/3+JKRo58a1wdc8i/Ntx2e2rzXhu+cc96YwHd0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FN+HU2Z1mKTiY/xCjtoTFhnULvO+m4Q20BB4McYXqsUgm3L8oVL6ZP47mJsfuaibv
	 /LD+8OpsbgJnk/MGMfzHg90a/iAz+elLtTeHy3vj0pvctSUgiT1B+p1fjN0nfQjLIK
	 o9V2hPRW7fHTyG5rVECHWYnEquDj1qMO5bvglm/0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgJLTZT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729890AbgJLTZT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Oct 2020 15:25:19 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 385BF2074A;
        Mon, 12 Oct 2020 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602530719;
        bh=y3g8x/3+JKRo58a1wdc8i/Ntx2e2rzXhu+cc96YwHd0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BPDNrBLSAu/1oKX6T4s2DIuWRgb0oeN2oSbYIe0uuFB0gtRB2YFPnsA5sP4DSnHgU
         AKPthNym550K0oufuPd3n0I5E8xZZKZMz44GyikxnigT7q8xiIA5BPD5Ir7UlkwKBR
         UmAlpaM5/GI8NepmwabZINkZ/Lkt4m/z6GmgzuPE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABymUCPS0BY7sroQ-yt5A-HPZeCwp5oMw98YT99SsSdMGT+Nsw@mail.gmail.com>
References: <20200928084744.32478-1-jun.nie@linaro.org> <160211480321.310579.14554922934041815553@swboyd.mtv.corp.google.com> <CABymUCPS0BY7sroQ-yt5A-HPZeCwp5oMw98YT99SsSdMGT+Nsw@mail.gmail.com>
Subject: Re: [PATCH] clk: emit warning if fail to get parent clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawn.guo@linaro.org>
To:     Jun Nie <jun.nie@linaro.org>
Date:   Mon, 12 Oct 2020 12:25:17 -0700
Message-ID: <160253071799.310579.1069618109180313451@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jun Nie (2020-10-08 20:08:13)
> Stephen Boyd <sboyd@kernel.org> =E4=BA=8E2020=E5=B9=B410=E6=9C=888=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=887:53=E5=86=99=E9=81=93=EF=BC=9A
> >
> > How do we know that this error isn't because the parent hasn't been
> > probed yet?
>=20
> Yes, this is chance that failure to probe parent also cause the error.
> But I had thought there may
> be unnecessary error message before the successful probing, though I
> did not see it. If you think
> it does not a matter, next version can emit warning on all error.
>=20

I suspect this warning can't be emitted here because we don't know if
the parent hasn't probed or if something else is wrong. It would be
better to fix OPP from what I can tell.
