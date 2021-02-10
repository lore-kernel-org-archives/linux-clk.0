Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28534C433E9
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 19:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DA264EED
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 19:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbhBJTOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 14:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbhBJTOg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2021 14:14:36 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEAAC061756
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 11:13:56 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id d184so3145870ybf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tOqcLFPGtBJA35TM92FKNxWnaOl6vWWHEx3bmxeU4c=;
        b=XFODFH/7aQvtIfr1O4SP9Wqe5MlKRy2+5dSSHkXHfVH+R+9OU/TOZ09pDYnsl2vv6f
         7cEH0Z6UoELRKGzsUtNvmrtDQBC7r/G6Qbtc6/JSVfpXccP4PLau8NMeL9A/OubRwHB1
         VcQgYnA99MaEy+19EMwjObrtrLHqOsWNZCG7glqOH4z70X5XE+yqXhvDlsdiAQ/u3YSN
         Knm1TcpqnE53hNrSXGIaZ1BOedUnzxDSf5jrLpOiLeIOK5pwSMexOYyGY2xjXBi3ngV8
         8z+ArJgCyMQcwrbbGYQ++ExEvF/KSID9fcTT6i+zsJoDK7PfrUfv724oQwAHLyzfxRpH
         jSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9tOqcLFPGtBJA35TM92FKNxWnaOl6vWWHEx3bmxeU4c=;
        b=VHflDVLK55oaFaDP7XfbgPWe65KZt/ZZTHbCAP9HgIXkEuRGrqrAgOtaepFazvw3wF
         qKFIeQ/Nu7TC0c9gcYKWRWMSH/P+QcbZ/6/x2SoPgymDhB5iSN1A4DO3WmTT5sHToOBP
         5Ndz86Etu8td+l1nAdaP6ttq8hXbu+n9Huq4qlbnK/xUJk7qWFGMVgr/yv+2uF5BC8xD
         McztXgn/vdBRQCMll7tOgzFtqCoGzdqMir0Naft3sEFOIg797xw+MWFVPle0wdGVH8mb
         Y8Ac5Cfy3Bi9Gkf4dsW5I7iL25JXuNHh+0Oh1nJ56dbjDy0wjr6/RuHWb9BPRVG/z1B9
         ehWw==
X-Gm-Message-State: AOAM530Cvre6fOkmXzFfaN6ignYufJ47QEQOWIfBunyYsgrN/rz96M+k
        hjUT2GA2x7RGuHWL39URtyY9qBBmbnVQPBkzFOXD+g==
X-Google-Smtp-Source: ABdhPJyWPzmY+tyazkCwj4t0k4KGhEheNTDTa4+Z3XmMbe8kh4uk1AUlS/mwh8JLpJB4vJDlgZWe56Y+dIqi6GwmOz8=
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr6466442ybt.96.1612984436001;
 Wed, 10 Feb 2021 11:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20210205222644.2357303-9-saravanak@google.com> <20210210114435.122242-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210210114435.122242-1-tudor.ambarus@microchip.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 11:13:19 -0800
Message-ID: <CAGETcx-aztut-RkZTjyGfzBGYLBQQDnaVFRQMMVTMPMA7Xs3Hg@mail.gmail.com>
Subject: Re: [PATCH] clk: Mark fwnodes when their clock provider is added
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Brown, Len" <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 10, 2021 at 3:44 AM Tudor Ambarus
<tudor.ambarus@microchip.com> wrote:
>
> This is a follow-up for:
> commit 3c9ea42802a1 ("clk: Mark fwnodes when their clock provider is added/removed")
>
> The above commit updated the deprecated of_clk_add_provider(),
> but missed to update the preferred of_clk_add_hw_provider().
> Update it now.

Thanks Tudor! Good catch!

I checked to make sure the deregistration path undoes this one. So, it
looks good to me.

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/clk/clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 27ff90eacb1f..9370e4dfecae 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4594,6 +4594,8 @@ int of_clk_add_hw_provider(struct device_node *np,
>         if (ret < 0)
>                 of_clk_del_provider(np);
>
> +       fwnode_dev_initialized(&np->fwnode, true);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
> --
> 2.25.1
>
