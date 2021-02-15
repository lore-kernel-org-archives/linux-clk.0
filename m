Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0EAC433E6
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50A8164E73
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBOLDg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhBOLDf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Feb 2021 06:03:35 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC92C061574
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:02:54 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id y10so2948854qvo.6
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDr1BuifwzyoWRoQ5nTu2V5InpMPwBH2+c3dV1Auu2Y=;
        b=mzvkliDYbed4+nr/rjo8zg7Gmfo0Loo0KQ7bdyau7Mjqdg3DvYoiS7DLuoJ+Ri1eeM
         d7ARkBgG+yK4SurA/oGmmhBnRlrWEwcWD3L0/7jOL0L2frn+h3kdnIebuLG9QSUBgEay
         qU/OIurKpGeneRALDa98hQR1H8KBc5FJfDtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDr1BuifwzyoWRoQ5nTu2V5InpMPwBH2+c3dV1Auu2Y=;
        b=QG2GP47IZTfA8U2lWBqm6ZnhhVo4dxDz6ZyFR/kNLivoTWH1OTRa3MKI/9POgjWLxv
         dl1GSiTDDFeuqnkPW6EsqJCKvHXpqUntVX9cDIzscyHsRQCXrOpWXp8Qa1RF1UstLrnP
         q6DHeYFUF6LUZ5K52L471MAdVhDE+fKqtvQR4WN19hD5fBVEPjNiZ4i1FACrH1XO5/Zn
         u8m5GxTUKjhXpjzFrv26R2cJvNUcxfWhxwC52dU84D0/aQJx9z3FksPsVJnv5lTv5R06
         D0AodXBsdMVVZXeDoFam6l/t+6xPFKgpgZjZeuI+ELw+nl3Th/CRyyxAqUsCletcWdoz
         iONg==
X-Gm-Message-State: AOAM531cnmYgAL01tR6pxVkEv5iqYaepR+8QS//FvvRxnECIyB7ju05H
        nb8VyuTj1Eh4y+sLJSFN2EAVVzPnDvrApkgUHpVqYw==
X-Google-Smtp-Source: ABdhPJx9+wmhXo0mXHnYKLqCbR8F1hlaIryUeMf/Uz2k++l/gnfo6Z/UBu4p2PLLEaPnDfkI1CP2aZ5JiRRPprUUMyY=
X-Received: by 2002:a0c:fc44:: with SMTP id w4mr12910155qvp.55.1613386973823;
 Mon, 15 Feb 2021 03:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20210211052206.2955988-1-daniel@0x0f.com> <20210211052206.2955988-5-daniel@0x0f.com>
 <161333570036.1254594.12678747655338761485@swboyd.mtv.corp.google.com>
In-Reply-To: <161333570036.1254594.12678747655338761485@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 15 Feb 2021 20:04:00 +0900
Message-ID: <CAFr9PXkEz-pOck7M5Q2a9FqXxN7vO0D_E7B=OYLCaqWiKijhBw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: mstar: MStar/SigmaStar MPLL driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Mon, 15 Feb 2021 at 05:48, Stephen Boyd <sboyd@kernel.org> wrote:
> BTW, it would be nice to expose this driver to compile testing instead
> of putting it behind ARCH_MSTARTV7. Can we have this patch?

I like that idea. I'll send a patch.

Thanks,

Daniel
