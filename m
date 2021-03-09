Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE98C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 16:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D019165237
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 16:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhCIQsh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhCIQsY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 11:48:24 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6B9C06175F
        for <linux-clk@vger.kernel.org>; Tue,  9 Mar 2021 08:48:23 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d3so28094365lfg.10
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 08:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XIkXiuoMtH0VHY/uWqZzm5YuXbRjUX2AxHcHaxJxdbs=;
        b=ADz2IeF1ahFNku/QWYF4ripdkTUclC3prcnOb44FHILPVHnxvnZ9ZSiAjpizBqrEkJ
         eY7TnAzHzTGinwgRQeApYdhT6byYezuAA3h1k5ZQtNgzJP7wA7um+vl37SYNzX9Unbtv
         1jpa5i6FWIVOhrhLwISUJR9O7pq3GPPeeX/Ald16xwY/z1qLuZdf/0YPoL9c6QXhPuPL
         Xyn6XdoLlI8YZEZPjIpz+z5IxrrVebgC9TL9XzfQCJrD9VgINftst55HTm/NWGhUHlfY
         PU18jnTtT5GD6CSZO3iF7cA6l1UKWGl8scUD3v69/F/8bKdicS/pjSoXQ7Xc0q9mTEkP
         SZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XIkXiuoMtH0VHY/uWqZzm5YuXbRjUX2AxHcHaxJxdbs=;
        b=Ksim4aIp1tV3Pns3HGf6z0B7mR8pGBCfsZGhVJxXlT7lw9gdOLZ62gXozrO+dU8T4c
         I/R2mlt/cq0WW/WSYAwb8bxXU5BZjOIIPPUEj7oWiwtE8LPTBLmW6zUJumlHoiQyDwJx
         DGhveQ3dc5JRrSl8etrE5tEYCDTj2ux4nHcc3tF0IChpBQ6kyq3WAGXl5sbnJ7UbduTR
         w098AW8De65MLphdyO2uLw3KjW2LBydDmpbH2rCvDxuK8MGOWVDpjMlg8z67q50Rf9mi
         LDxbmPvBBXY+VTmSQDuguuBM8bucJ7SW69lAL1l2l96g1yEAh+ef6C+asmv21OXcJbNU
         Aikw==
X-Gm-Message-State: AOAM532c0Ye3SJPMRcEPlqBG1lc1kxlXuBQC0oU5e5IRQCb2R7aLgwNp
        dfrL+BPTfJRDZ5GmQ9mjvW3OYw==
X-Google-Smtp-Source: ABdhPJzNKGHrvN/k5Wi+pSCIIhGqIX4Uued3pqafQJDK/nTXFztrddCN4vrjHKTlsjCXJoQKFXZ4/Q==
X-Received: by 2002:a05:6512:1026:: with SMTP id r6mr11037003lfr.598.1615308502316;
        Tue, 09 Mar 2021 08:48:22 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c14sm2192115ljd.81.2021.03.09.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:48:21 -0800 (PST)
Date:   Tue, 9 Mar 2021 17:48:21 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] clk: renesas: r8a779a0: Add CL16M clock
Message-ID: <YEem1ZjoHF1X2Upw@oden.dyn.berto.se>
References: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
 <20210309161415.2592105-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW6dqEejq0BiedT4hsDV7U5jPkDk4jJr4-u_20NKjWPPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW6dqEejq0BiedT4hsDV7U5jPkDk4jJr4-u_20NKjWPPA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2021-03-09 17:31:09 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Mar 9, 2021 at 5:14 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Implement support for the CL16M clock on V3U.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> > @@ -147,6 +147,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
> >
> >         DEF_SD("sd0",           R8A779A0_CLK_SD0,       CLK_SDSRC,      0x870),
> >
> > +       DEF_FIXED("cl16m",      R8A779A0_CLK_CL16M,     CLK_PLL1_DIV2,  64, 1),
> 
> Is this any different from the "cl16mck" added by Wolfram, and
> already present in renesas-clk?

No they are the same and as I see Wolfram's "cl16mck" name is now in 
your tree I will switch to it. Will post a v3 of 2/2 which uses it and 
drop this patch.

> 
> > +
> >         DEF_DIV6P1("mso",       R8A779A0_CLK_MSO,       CLK_PLL5_DIV4,  0x87c),
> >         DEF_DIV6P1("canfd",     R8A779A0_CLK_CANFD,     CLK_PLL5_DIV4,  0x878),
> >         DEF_DIV6P1("csi0",      R8A779A0_CLK_CSI0,      CLK_PLL5_DIV4,  0x880),
> > diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> > index f1d737ca7ca1a7ca..2974dc6035f7b936 100644
> > --- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> > +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> > @@ -51,5 +51,6 @@
> >  #define R8A779A0_CLK_CBFUSA            40
> >  #define R8A779A0_CLK_R                 41
> >  #define R8A779A0_CLK_OSC               42
> > +#define R8A779A0_CLK_CL16M             43
> 
> We already have R8A779A0_CLK_CL16MCK?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
