Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7491C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 18:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D74261051
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 18:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243856AbhIHSKk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 14:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240905AbhIHSKk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 14:10:40 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E046C061757
        for <linux-clk@vger.kernel.org>; Wed,  8 Sep 2021 11:09:32 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso4066667ott.13
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHTh1HO906gMjGsq/6c8x/AFAmsBhynFAoihw7tpJW4=;
        b=MlZxyo+1q1YTDCfKyB+mJppyYe+4VNRTPxxVr4MozOrje+oXFksFm6Q5vI0DvrHgmH
         lOgCE+iwZ640bunqIRN5j9A2mTl9AmFDjnQAtRHfma976UHd787FrR8RXpjWndw/RNUi
         zXK9niUZmv+A4Rxrv5pzbbTBVlCvolUMm7DKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHTh1HO906gMjGsq/6c8x/AFAmsBhynFAoihw7tpJW4=;
        b=L1wHeBsQSph669oxhnz7oaDET9UuFKT5LQthitCVUT0KN0dM2DrIdTaWkIQbGCja7w
         nLXLoe4lZgnXCVtJeNgNf6ewBMANT7XxvKr0jbrHWqzsLvB08ENCK4PnsiCRKZU7Ikfy
         C0eyUGn0mTesrbZXuMm0pi2ksPqk0zS31daweujl6B7rrhqz4gHVG3egiMNr2Tpvocz7
         IR0acW9wZXUnkk52P44oISN4yVuninAPl57KRr8UYWLhusuM7hGXo+6sYf2epsGDhcxk
         PEFQ8Jr/BGUa97olUZNePwiLqo6euEXF/5rqM+5ddzKdaDO1h2KzAXIUXRujqGjS5/Yb
         d7kg==
X-Gm-Message-State: AOAM532hqVQk8u4iQ9HSaZP2XocpIr8GDmYsSFSPaI5UfmtfbsUx1tkc
        92prbP9fT8A4UdOhYVdxMAvQbg0ZrDyOjg==
X-Google-Smtp-Source: ABdhPJyyaFTVIjhNmKKE6D43L5OGruNYsjhSvHcblRH/XbuFneN7bOqtItAbXw4/rfJvxVDtIKs32w==
X-Received: by 2002:a9d:410:: with SMTP id 16mr4266813otc.83.1631124570649;
        Wed, 08 Sep 2021 11:09:30 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id j8sm567805ooc.21.2021.09.08.11.09.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 11:09:29 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id y128so4198679oie.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Sep 2021 11:09:29 -0700 (PDT)
X-Received: by 2002:aca:4557:: with SMTP id s84mr3270975oia.77.1631124568911;
 Wed, 08 Sep 2021 11:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210907094628.RESEND.1.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
 <20210907094628.RESEND.2.Ibc87b4785709543c998cc852c1edaeb7a08edf5c@changeid> <CAD=FV=Uo7oK6a8X69KGneP8CvXE127ZxU7U59Rrz+_Dv6D5t3g@mail.gmail.com>
In-Reply-To: <CAD=FV=Uo7oK6a8X69KGneP8CvXE127ZxU7U59Rrz+_Dv6D5t3g@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 8 Sep 2021 11:09:17 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPLrpfnm70RLDD+c8Df8X3-q5FaOjCDWFSbzNwim1MisA@mail.gmail.com>
Message-ID: <CA+ASDXPLrpfnm70RLDD+c8Df8X3-q5FaOjCDWFSbzNwim1MisA@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] arm64: dts: rockchip: add Coresight debug
 range for RK3399
To:     Doug Anderson <dianders@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 8, 2021 at 8:10 AM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, Sep 7, 2021 at 9:46 AM Brian Norris <briannorris@chromium.org> wrote:
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > @@ -433,6 +433,54 @@ usbdrd_dwc3_1: usb@fe900000 {
> >                 };
> >         };
> >
> > +       debug@fe430000 {
>
> I think your sort order is wrong? 0xfe430000 comes before 0xfe900000?

Yep... In attempt to explain my own brain: perhaps I assumed the
USB-related nodes must be uninterrupted, which caused my sorting eyes
to skip over.

v2 is coming.

Thanks,
Brian
