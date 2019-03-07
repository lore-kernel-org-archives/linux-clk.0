Return-Path: <SRS0=2CmL=RK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0594C43381
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 19:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 994C720675
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551986284;
	bh=2FJTNTyw+rrDYE2jm7pO/XBu0uZ/S+FL3sVRuEpvk9Q=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=M1eYT2EydU/T5lmie848RI8qm2ebzfJuGUvBPTWjJRkUTB6qqLyK1Ggi6Oq+Xhb7X
	 Ok1waVeU+FEzNPkKEvh8BryPexJ3Un7cKfQw1i+VFg6eydy04kEhItRnelfO2o6QOU
	 4ffjo2qXv4JQ1Xe2Jg/OVNxAKAL6TwzuEJXg3pHA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfCGTSE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Mar 2019 14:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:39364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfCGTSE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Mar 2019 14:18:04 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E97020449;
        Thu,  7 Mar 2019 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551986283;
        bh=2FJTNTyw+rrDYE2jm7pO/XBu0uZ/S+FL3sVRuEpvk9Q=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=VjkxBeYLDUQ8Thj5JPK8tBmTCc3+AQZDIQk2f7kqtEqqAE0fBDb28VXEljroIC2Er
         Ix8BLE5XZpUQr9U2K+/lnvPyLn+/VjaEn7o+B3S3ZIscOFxgjXxkN5Nf0TIJBzUq9t
         KjqdmW1iaAiggt7WWMt+fCW7bAIjFXpqHs0AGc+I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87lg1rmtqi.wl-kuninori.morimoto.gx@renesas.com>
References: <877edcczwl.wl-kuninori.morimoto.gx@renesas.com> <87wolcbhy4.wl-kuninori.morimoto.gx@renesas.com> <155189284090.20095.14047212664009518639@swboyd.mtv.corp.google.com> <87lg1rmtqi.wl-kuninori.morimoto.gx@renesas.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: Question about devm_get_clk_from_child()
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>, linux-clk@vger.kernel.org
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <155198628270.20095.3432089262334429455@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 07 Mar 2019 11:18:02 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kuninori Morimoto (2019-03-06 16:20:40)
>=20
> Hi Stephen
>=20
> > > index 14cbf23..96053a9 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -4213,7 +4213,7 @@ struct clk *of_clk_get_by_name(struct device_no=
de *np, const char *name)
> > >         if (!np)
> > >                 return ERR_PTR(-ENOENT);
> > > =20
> > > -       return __of_clk_get(np, -1, np->full_name, name);
> > > +       return __of_clk_get(np, 0, np->full_name, name);
> > >  }
> >=20
> > Yes this is correct. Thanks for debugging and fixing my thinko here. I
> > was thinking that nobody would call of_clk_get_by_name() unless they
> > wanted to find some clk that had a matching name, but it seems that we
> > also allow NULL to be passed as the name to mean the typical "wildcard
> > match" thing that clkdev has done for years. I'll throw this patch on
> > top of the merge commit so the breakage window is small as I'd rather
> > not rewrite the series just for this. Thanks.
>=20
> Ahh, OK.
> So, how about this ? it is including both opinion :)
> I'm not sure which one should be applied, but both can solve my issue.
>=20

No worries. I applied your original patch.

