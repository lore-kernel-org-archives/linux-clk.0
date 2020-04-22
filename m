Return-Path: <SRS0=SEET=6G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2394C55186
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 10:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FE0620857
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 10:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UooOANnk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731546AbgDVKjk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbgDVKji (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Apr 2020 06:39:38 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F83EC03C1A8
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 03:39:37 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id a10so1074597uad.7
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHT7Mk3BzDO0gyW1iwYfsy8IG0PJGK/2+QKrpnZX3QU=;
        b=UooOANnkncazrjwT6A5IIVWXx3TaevD8levmFwktxmkLRtC+jYIawEY8VaMp9I4ome
         MhywIVZGwaoUBGPY2nmynUgZLZD81R8ok0ftRCcAW+neSqf3vEfUeVAeyA/GUeeumg7P
         L6ILsJb2XCIn45d8r+UvPw1okUg71V8TyiPjv4fC1fW0VKrExn9ARhgnMb3ZdG/83MDd
         xQgdiafbDTuwRkn0Yl97Ukuzw1I+VXvJUUiTW496N/uhyINL2t2sW9sYMaDS7sCPrRMH
         4yOPaYEUMVQ2YQKIRv18eAvijqXFHMfBZ2hCpbxedUO7XU1eeiY/wb5Dk6mFCxElL9lw
         JlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHT7Mk3BzDO0gyW1iwYfsy8IG0PJGK/2+QKrpnZX3QU=;
        b=rQSqKHKnIl+fNXGSY4tpjA0IHBOwNPh/tx8IiLX+ApyvlGqcnmc4y9zPEz5Oxbito6
         hZmpBqlyHtqdl6DlTo7mHtRujEgRQTd2aGtGZUU/jaJJrBF4q3MQWB+d4Pt0IxPsBPht
         D0IQmVOHFxyu3s7IV0MZlzrViqWmrBesyf/Xsuagk2BtrbFwdOh/c6l4s40e2Nt0mFql
         w+tO9yVmB5L6QTv8iNWmwJOucuwsyl1XXsQFP++tVGzhWP74Je25Wj0Y6MDDM6zmAjS6
         Chn/NL38RMC7qZnP60NgrXOHj6CZZk+mnoeC1pXU8T0ToF6wYw1krcrHo4eYpoRKdfUU
         mAwg==
X-Gm-Message-State: AGi0PuZjEevbgYNaR/euUtH0+QQymSulfR2YFTX2JgDWEcIwKkMkpI02
        Q7zADtZYsFqy2Rb6A5OezOj7HnzT9QmFFDSKvANUUQ==
X-Google-Smtp-Source: APiQypKbq2XGjzlmevXUc1yOHOUstc2Fw4sHPY9uc/yPKfLYTlRgn/XYeQqIlHCt8Ee7WqRUnRo8oGo4FnJUwdd8B7E=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr8244570vsd.35.1587551976321;
 Wed, 22 Apr 2020 03:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200409064416.83340-1-sboyd@kernel.org> <20200409064416.83340-7-sboyd@kernel.org>
 <CAPDyKFqpS=wke5Y=rTeq3+8bQyacVHcbWnBwG5pxsJ4hPys+9g@mail.gmail.com> <158755046077.159702.10648240040343779828@swboyd.mtv.corp.google.com>
In-Reply-To: <158755046077.159702.10648240040343779828@swboyd.mtv.corp.google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 22 Apr 2020 12:39:00 +0200
Message-ID: <CAPDyKFoSe4fOiHAfyX=hW9arx1LVvjouoPeSFOZ=hKg5d_qrSA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: meson-mx-sdio: Depend on OF_ADDRESS and not
 just OF
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Apr 2020 at 12:14, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Ulf Hansson (2020-04-21 07:04:54)
> > On Thu, 9 Apr 2020 at 08:44, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Making COMMON_CLK a visible option causes the sparc allyesconfig to fail
> > > to build like so:
> > >
> > >    sparc64-linux-ld: drivers/mmc/host/meson-mx-sdio.o: in function `meson_mx_mmc_remove':
> > >    meson-mx-sdio.c:(.text+0x70): undefined reference to `of_platform_device_destroy'
> > >    sparc64-linux-ld: drivers/mmc/host/meson-mx-sdio.o: in function `meson_mx_mmc_probe':
> > >    meson-mx-sdio.c:(.text+0x9e4): undefined reference to `of_platform_device_create'
> > >    sparc64-linux-ld: meson-mx-sdio.c:(.text+0xdd4): undefined reference to `of_platform_device_destroy'
> > >
> > > This is because the implementation of of_platform_device_destroy() is
> > > inside an #ifdef CONFIG_OF_ADDRESS section of drivers/of/platform.c.
> > > This driver already depends on OF being enabled, so let's tighten that
> > > constrain a little more so that it depends on OF_ADDRESS instead. This
> > > way we won't try to build this driver on platforms that don't have this
> > > function.
> > >
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> >
> > I don't have the complete picture here, can I just apply this a fix to
> > my mmc tree?
> >
>
> If this patch stays in the series then I can avoid a bisection hole. And
> it also doesn't matter until COMMON_CLK config becomes selectable. Maybe
> just ack and let it go through clk tree? Unless there's something
> changing here in the mmc tree?

This file is likely to change in my mmc-tree. However, let's deal with
the conflict, if/when that happens. So, please pick it through your
clock tree.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
