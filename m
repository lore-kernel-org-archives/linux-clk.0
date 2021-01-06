Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2F9C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3C132310E
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbhAFKxh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 05:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbhAFKxg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 05:53:36 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79541C06134D
        for <linux-clk@vger.kernel.org>; Wed,  6 Jan 2021 02:52:56 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id q22so1477208pfk.12
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdSuS4O3pgsSJDubp0Sdbb5PmZnWqekG9GBR9kGQ6Ms=;
        b=Kkk0SFcPdHzsvopRV3ywd32zskF+b41A2+GSBLD4vIOcmgLkZq+LhQnas7D7pNccPA
         /1e13dclIvT7koa2EYcOwCp3M+2hoQ/Ip+uJEvlMJVRGMZXDiR6BZk1aKoyVtqLb/TD9
         2TBQlUSZzI3D8atLNOZsK6C/cs0dXMUwF2pDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdSuS4O3pgsSJDubp0Sdbb5PmZnWqekG9GBR9kGQ6Ms=;
        b=g0gcEVUvc36AHVn+1kUNklWuS2sZIdmtDZ/xZCv0d1iDk/dKJGkeTiqdGY9K3+snTy
         MLUk9qN5GXr+l3UgR7pTOJr3RHpl0QwlfqAWRk+7MRtu+4jzyFPdL5TDKGcctJCw62Bt
         9mc/mtqhcXEnXtmxkXOM3ovsAUPorYw2UPH2i8cN1hHNdiImeo5b0TcjNd5Slpt7+DVi
         NyJTpl3c+we+pVnNkpHnuMgaF3FauDmb9iZ5QzhFXFvdNBkkS9xJ4fA95gy3kUE0vSmd
         6sm78dAxVvUD+gLMbS817XLeQRfTnDx+/uN3Gsh0B4DG++wKqKW15D26Ev+f7Hj9NXSn
         LcmQ==
X-Gm-Message-State: AOAM532aAHWlqjdU8oBRlJ8hLmHl2l6GiNIsXq7DcXnlNzk0EYxdoptA
        iAVWgaATBbkXTLY2ktUwq6OjKNTbc5nraVrNEjqQDQ==
X-Google-Smtp-Source: ABdhPJxV68VpE5c0N4JWMEzUiOtNfP5BS+xplG/O+2joyxL835C9qEqKNNOFQejs7OTi68aJybpnHBGk4DGiAN9ODWo=
X-Received: by 2002:a63:1a10:: with SMTP id a16mr3806685pga.317.1609930375833;
 Wed, 06 Jan 2021 02:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
 <CAATdQgC_BnZywDxaZgmF72VRoAZ-1vFGrPD9GL4uEBhsKQTxnQ@mail.gmail.com> <1609929721.7491.3.camel@mtksdaap41>
In-Reply-To: <1609929721.7491.3.camel@mtksdaap41>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 6 Jan 2021 18:52:45 +0800
Message-ID: <CAATdQgBJ7EVRJW7iJG63yW89fh5skpe9-UCd4pdZystV_JrvCg@mail.gmail.com>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 6, 2021 at 6:42 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On Wed, 2021-01-06 at 18:25 +0800, Ikjoon Jang wrote:
> > On Tue, Dec 22, 2020 at 9:14 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > Add MT8192 basic clock providers, include topckgen, apmixedsys,
> > > infracfg and pericfg.
> > >
> > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > ---
> > >  drivers/clk/mediatek/Kconfig      |    8 +
> > >  drivers/clk/mediatek/Makefile     |    1 +
> > >  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
> > >  drivers/clk/mediatek/clk-mux.h    |   15 +
> > >  4 files changed, 1350 insertions(+)
> > >  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> > >
> >
> > <snip>
> >
> > > diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> > > index f5625f4..afbc7df 100644
> > > --- a/drivers/clk/mediatek/clk-mux.h
> > > +++ b/drivers/clk/mediatek/clk-mux.h
> > > @@ -77,6 +77,21 @@ struct mtk_mux {
> > >                         _width, _gate, _upd_ofs, _upd,                  \
> > >                         CLK_SET_RATE_PARENT)
> > >
> > > +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,          \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       _upd_ofs, _upd, _flags)                         \
> > > +               GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,  \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       0, _upd_ofs, _upd, _flags,                      \
> > > +                       mtk_mux_clr_set_upd_ops)
> > > +
> > > +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,                        \
> > > +                       _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> > > +                       _upd_ofs, _upd)                                 \
> > > +               MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,             \
> > > +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,   \
> > > +                       _width, _upd_ofs, _upd, CLK_SET_RATE_PARENT)
> > > +
> >
> > conflicts, these macros are already existed in upstream.
>
> really? These two macros don't show up in 5.11-rc1 yet.

yep, maybe this one: a3ae549917f1 "clk: mediatek: Add new clkmux register API"

>
> > >  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> > >                                  struct regmap *regmap,
> > >                                  spinlock_t *lock);
> > > --
> > > 1.8.1.1.dirty
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
