Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05C1C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 22:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B424206BB
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 22:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Xr55jgAi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfAIWag (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 17:30:36 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44740 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfAIWag (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jan 2019 17:30:36 -0500
Received: by mail-ot1-f65.google.com with SMTP id f18so8163907otl.11
        for <linux-clk@vger.kernel.org>; Wed, 09 Jan 2019 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLWY6Pk/ualqBVtv+OfnoGEuQRZ9pIAPaVj1nvw9h/c=;
        b=Xr55jgAiVrMt/SKUOwSy3JhjfieyRHJqOlLNx2YsJNzJnSp2VhGrPYkgzAPVCIn5C0
         VQXiKH9ENIoNzIl6cJR79y3bAGIEfht2JNNjs34kFFt74W6DZNDlUcly/QvAQu0ePLph
         CdgAQWXOunKtbJJkKwK52Geifug7VMp5h/WcNloOxGNnvlYW8Rm4M++kd4bnsiLbD9Zh
         Vzk0PZRmjRul9bGQxXxHYP1lIdyDW/oFJ40u4b8P5mx0IkuUVZgXUDnmALz32WrOK0+f
         YKaEkqfPNwwBENbAsc0aTqTtMtJGuJ+oqWHkj+tVzAV+QDAy3rrvD0IXBLkXjXTTWVUb
         UqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLWY6Pk/ualqBVtv+OfnoGEuQRZ9pIAPaVj1nvw9h/c=;
        b=qBNAQ1TTi0JO708Vg3FcU/b0Kjq1s9ioTf8ujqdAUB9g1bqQyggn8jWg4FY4Am4GH7
         BDFF6p5t3prL+u6vuCpas/DLsVfaBhvKQgfGrBfU/0qL4BHT4BmEdEaQUmJxpcXYQCPw
         hlAT7gDGV/UdZ8M1VoxBgEkBJN37Ss5RZId/V3H7cHH3MXzGCevcybZt+EHWL44NB6hz
         80EFFG+xGF1FKn66wQoF7sxVXXwSlzhb7UIaM7dG/b1BvTB6PLnxarJrAgIXzoC+7ZmQ
         Gw1cNqsrdyVXYLGCdxQulJmX35PgPb+2CfPcz2sOPdrEArZxIIlfm6QoEC+lKgs77/Kc
         J6WA==
X-Gm-Message-State: AJcUukf2OyASHfRUNwiwUZhssv6QZJR210DNijPqS5+jNPO42mdrlfv/
        Nm7uk9YG+MQFafWkrGpwO4o3iCeVSZwMxkIS9ZA=
X-Google-Smtp-Source: ALg8bN4KMr5LYE/CvqC1gBMKCYEb9cuejjk3Bnd9kCO9zHMbKGdbgZRVUjLdyxZCqMkoSCdWBdOsdqY4NXAtnNmr458=
X-Received: by 2002:a9d:715d:: with SMTP id y29mr5331851otj.148.1547073035745;
 Wed, 09 Jan 2019 14:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20181223235836.12466-1-martin.blumenstingl@googlemail.com>
 <20181223235836.12466-2-martin.blumenstingl@googlemail.com> <154705938114.15366.1098954164811397084@swboyd.mtv.corp.google.com>
In-Reply-To: <154705938114.15366.1098954164811397084@swboyd.mtv.corp.google.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 9 Jan 2019 23:30:24 +0100
Message-ID: <CAFBinCAginPSuBObJE52puvbay-S698OjAj6aLEm5kfn0SdU0A@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: meson: meson8b: fix naming of the APB clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Hi Neil,

On Wed, Jan 9, 2019 at 7:43 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Martin Blumenstingl (2018-12-23 15:58:36)
> > Fix a typo in the APB clock names by renaming them from "abp" to "apb".
> > No functional changes.
> >
> > Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post dividers")
> > Fixes: a7d19b05ce817d ("clk: meson: meson8b: add the CPU clock post divider clocks")
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
>
> Can I apply this directly to fixes? Or it's not critical so we can punt
> until next merge window?
actually it's not critical:
I'm not aware of any IP block that I needs the APB clock as input (I'm
pretty sure there is some, but I'm not aware of it so it can wait).

Neil already applied another patch for -next which conflicts with this.
we can choose now:
1. Stephen takes this patch, Neil drops the (conflicting) GPU clock
patches from -next and I re-send the GPU clock patches
2. Stephen and Neil don't do anything, I re-send this patch on top of
the GPU clock patches

I'm fine either way, but #2 is less work for you guys.
if I don't hear back from you then I'll go with option #2


Regards
Martin
