Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA95AC4320A
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 09:46:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A274A61374
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 09:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhHXJr1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 05:47:27 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:41951 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbhHXJr0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 05:47:26 -0400
Received: by mail-ua1-f42.google.com with SMTP id 75so10614100uav.8;
        Tue, 24 Aug 2021 02:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqodygYobBXq0/TAU8O8Kl7uUmBwz/UAGwIO0XgGL9A=;
        b=T7zMyTP/Tkanl6Ry1jVE3DLPhSp/vNuOzVK71GOxXN1FGaDAWXWYjl6+YyeQ0ZrO0a
         b2groy7IH/XcmHiv9j8qwnWKOI/vkn2tm5BHBocZWrTJWpIezgrLGSnU+c2RzQP3DcOh
         ojeCOdpWOsyV0+1HslJQOBI6EcMtB/GfTI8Z94wi07rwIsgx2hFXGvjQFzeyzmYFq2ue
         gTCmx1b+7falYdA/22pSbvU5NQH6I2dAztKgyHHxyYJEuaTJMjmVcxUN6dSn7lMvGXGE
         PNNoAx/QM23FVngQG0UNWbkJHK9uiRBIxGKbGSkdpKJqN+pL37mq1IEoqR4SzUW/Nks0
         qIxw==
X-Gm-Message-State: AOAM5314yp+wOAhZEKBo90jfkTL97Q3u1nbP56KetgHvYS5VapBYuuoi
        NE2xqUq0HJe8w0mSo233K9pDhh20fyTkfjzt7XU=
X-Google-Smtp-Source: ABdhPJxF9bS7xsIdWxYKR9Z16K3aHj84ioBBfAZ0EqCe9leLs2pXXK2tKIEpYyjsaEpMxUikJVPvo2ozDdR5PhBlyDE=
X-Received: by 2002:a05:6102:3e92:: with SMTP id m18mr27022666vsv.53.1629798402452;
 Tue, 24 Aug 2021 02:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 11:46:31 +0200
Message-ID: <CAMuHMdVvy+cHJB4XQ8HKLrQWvOpUUZyqVaGA69mdy_yqU8rZPA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] clk: clocking-wizard: Driver updates
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>, git@xilinx.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, shubhrajyoti.datta@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

On Tue, Aug 10, 2021 at 10:37 AM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
> The patch does the following
> Update the versions of the clocking wizard ip.
> Move from staging to clk directory.
> Update the bindings.

Thanks for your series!

> v12:
> No change.
> Rebased

There is a change: you lost the move from staging to clk.

>
> Shubhrajyoti Datta (5):
>   dt-bindings: add documentation of xilinx clocking wizard
>   clk: clocking-wizard: Add the clockwizard to clk directory
>   clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
>   clk: clocking-wizard: Fix the reconfig for 5.2
>   clk: clocking-wizard: Update the compatible
>
>  .../bindings/clock/xlnx,clocking-wizard.yaml  |  77 +++
>  drivers/clk/Kconfig                           |   9 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-xlnx-clock-wizard.c           | 643 ++++++++++++++++++
>  4 files changed, 730 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>  create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
