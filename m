Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2F6C4708F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 14:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A181961378
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 14:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhFAOwR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 10:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbhFAOwR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Jun 2021 10:52:17 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419ECC061574
        for <linux-clk@vger.kernel.org>; Tue,  1 Jun 2021 07:50:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n2so14709560wrm.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Jun 2021 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fiX9yiBNX+zZ1kE/XRKiD14Uy6lLFGjkKYDmuZqizOM=;
        b=n+OPwKb1kAJTjuQvvGIw9YDsHRKdYbDS5xSlDwqoYoirPYSA1nWXwyUauKcJflxAQg
         tKZvQw3CrIcjXjb8Cm/kTvQzCvpq6RPm3JZq2UU3p1CgfrtpvMAmlLk0hSRfPf00+u9C
         CP4Fs1I7n//dlZ5/0Oz8Le1vKn1Tkd/H6zocfxHTKGUYYRv1I2ujSJV66WbDX0mgVOkH
         bBNTJdcjcv2it4bdNRzn/v2ksxuT3XEnmOMxQ1gLrU0oEvy/KoSqtyDjx96GrizGKIb6
         WBVHkkinzAd9/3iMFTBtJbh401blDjk066yo6oc40eE3b2nCE1Z+amWfiXbiDLCa6Oel
         Snvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fiX9yiBNX+zZ1kE/XRKiD14Uy6lLFGjkKYDmuZqizOM=;
        b=l5GD4C2+Uq6xM056kna6KLWuZDTeO8CJJKBXjRHoGNSx1SWHl4ZrSNxUU3eXt+Gshb
         nm6Ulw38fF5qZa6se6OSDuUIiwJiJFIAjgxbFHZKvrA7MsyDNpAprRb22mVulLoEyIfX
         4kNxF7LFCjvO/+YhI20hk1/0KlmZI7J0h3OBnsgx1HVpyp9J24Cpmki3gInVu/jXG7Y8
         TtWrjwUH9DmXZTMd+E8TFyW3U55I7qa6wcA5LqxZ6t4IBAK+ihRX0PYCsQblP4qfobV2
         71M4F0GghEudO2pwepxxTOlSElm5DHwxzetIaok8ihMdm1T6E2MiXtr/cSZC53L7kSOZ
         AdbQ==
X-Gm-Message-State: AOAM531TEUSeD+pFeig96EWxtfdfi/UNHf+cEYa6Z/TFrF4Qmh9i+2Nx
        Ff0wZwHGEFYimLex7C4LuIpOyg==
X-Google-Smtp-Source: ABdhPJzfsLg/GOaS5q9dH68xf309SiGEIiSBWSqUJbsFz867TbDfwV361wLM3kGNCHrf73lHDtfYyQ==
X-Received: by 2002:a5d:4dd1:: with SMTP id f17mr27680158wru.160.1622559033925;
        Tue, 01 Jun 2021 07:50:33 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id f6sm4125726wru.72.2021.06.01.07.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:50:33 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:50:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: [RESEND 1/1] clk: versatile: remove dependency on ARCH_*
Message-ID: <20210601145031.GK543307@dell>
References: <20210520161702.3746174-1-lee.jones@linaro.org>
 <CACRpkdZgpFL4ALGr16hua-uSnM-5SrOZ1KGMkzTEDrZmwh_1=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZgpFL4ALGr16hua-uSnM-5SrOZ1KGMkzTEDrZmwh_1=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 21 May 2021, Linus Walleij wrote:

> On Thu, May 20, 2021 at 6:17 PM Lee Jones <lee.jones@linaro.org> wrote:
> 
> > From: Peter Collingbourne <pcc@google.com>
> >
> > It is now possible to build a modular kernel for vexpress by
> > not setting CONFIG_ARCH_VEXPRESS=y and instead setting =m on the
> > drivers that it normally implies. This is with the exception of
> > CLK_VEXPRESS_OSC which is currently hidden behind a dependency on
> > one of several ARCH_* variables. Remove that dependency so that
> > CLK_VEXPRESS_OSC may be enabled without it.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > Link: https://linux-review.googlesource.com/id/I435a21e2e5f6187db54f4ef2079b60028ab2ea69
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Still not in -next.

Who will take this please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
