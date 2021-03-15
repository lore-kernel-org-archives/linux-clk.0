Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A18CC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 08:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C10AB64EB3
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 08:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhCOIc2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 04:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhCOIcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 04:32:20 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE90C061574;
        Mon, 15 Mar 2021 01:32:20 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id d16so24410781oic.0;
        Mon, 15 Mar 2021 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Xc8iWp49pRCqQGzsIqMb2DIrVOIt3ZqYfU4w0wGIrU=;
        b=GDWKOh+B5y5t4/3l3yPKFwEhAjqYs/TZjHkCVXlV0O5nKu59tfqDo5xBB2Mo9JOPvK
         okH4VBOpblr2ZfjC7Eso7fMslf1YJ9yDz2q5FN0XMGtnyNtNTQN98ZygQST/4X/1HHFD
         OEgrswE70/6NSHVAMIl/YxeAc/+ZRQOtSowZcC6wS16B+RSclD5BMLIHA8NZ0bsKcTPt
         dt1VWC8o+b6y1h58MrVXiLrtF5tL9j1sMJNUjgFdLgcLA6k8gK43tiWPD3FM1fgKvMaa
         AEfBLtL1/WT2GFVnKhZ6zKp1olK/EkpKBTD8DlScG4PrX56mPJ2+uye3tJAZVmBpkrUX
         2aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Xc8iWp49pRCqQGzsIqMb2DIrVOIt3ZqYfU4w0wGIrU=;
        b=fAjOWaXrBQJVHztMkUFO5Q2cUzW+zU1jkFN2daKLY10DhP8/hHFRtxchh3wHxsCDY+
         K1SXCsI2rtjDPY53xqdkkxnykKOCvm08GZZ962ZdZpfQ2Iz5aOsftd1iALejyXuQ+i7y
         nziiveVzdNqyXBGEGiUmhPQ+S1q/6Fit+R7yh0YRQCv8bbc5v8c4OZokchxIr30FUyUm
         p/EetNFKe6I+jCoFutOkWW5sMe776RKePjGxIybgSSK+saOY6K3VMfYWWdYVTCBDta5d
         Y9OgU2r3xhp00SunPwn5mZMcfjkBf0XnZ4oIMTcGluCYUd6qJxlYrqeuycZGkphqfQxd
         PfwA==
X-Gm-Message-State: AOAM533HoJ5mxFPNNODeVQtHCQIcnCLJmOgmVozwKV/Y+8uOfa8t2d+q
        hudJ2DuNsbd3nazIw7HwG3KmUqplwT6nF9f0PGxJNBKk
X-Google-Smtp-Source: ABdhPJyO+mOa+gxnocPi6HIzMptZHuWk+C0MkPWlu4+aCtCTlfpX0o6wYkmE2HSEcPfKNw6Y7EU2AW5e0P/FnPczdFU=
X-Received: by 2002:aca:4188:: with SMTP id o130mr14815413oia.53.1615797139844;
 Mon, 15 Mar 2021 01:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <CACY_kjSRbgSWsfo+JTyQdqorQ+wcy8OqAtKSbJt6tL4t-AUciw@mail.gmail.com>
In-Reply-To: <CACY_kjSRbgSWsfo+JTyQdqorQ+wcy8OqAtKSbJt6tL4t-AUciw@mail.gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 15 Mar 2021 14:02:08 +0530
Message-ID: <CAKfKVtHu69b+boMXPOOca5xmA2D4fbQ+3WxDhYnD93SamB70xA@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] staging: clocking-wizard: Add support for dynamic reconfiguration
To:     Zhengxun Li <zhengxunli.mxic@gmail.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        devel@driverdev.osuosl.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git@xilinx.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, zhengxunli@mxic.com.tw,
        Julien Su <juliensu@mxic.com.tw>, slwu@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Zhengxun,
Thanks for the review.

On Mon, Mar 15, 2021 at 12:37 PM Zhengxun Li <zhengxunli.mxic@gmail.com> wr=
ote:
>
> Hi Shubhrajyoti,
>
> My name is Zhengxun and I am the engineer from Macronix. We are
> using the platform PicoZed 7015/7030 SOM (System On Module),
> which is based on Xilinx Zynq=C2=AE-7000 All Programmable (AP) SoC to
> verify our Flash driver. Of course, we are also using your clock
> wizard, our version seems to be v5.2, but something went wrong.
>
> +static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long ra=
te,
> + unsigned long parent_rate)
> +{
> + int err;
> + u32 value;
> + unsigned long flags =3D 0;
> + struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
> + void __iomem *div_addr =3D divider->base + divider->offset;
> +
> + if (divider->lock)
> + spin_lock_irqsave(divider->lock, flags);
> + else
> + __acquire(divider->lock);
> +
> + value =3D DIV_ROUND_CLOSEST(parent_rate, rate);
> +
> + /* Cap the value to max */
> + min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +
> + /* Set divisor and clear phase offset */
> + writel(value, div_addr);
> + writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
>
> Why phase always set to zero? We want to support DTR operation in
> Flash driver. Can you add a set_phase function to adjust the phase?
>
> + /* Check status register */
> + err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> + value, value & WZRD_DR_LOCK_BIT_MASK,
> + WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
> + if (err)
> + goto err_reconfig;
> +
> + /* Initiate reconfiguration */
> + writel(WZRD_DR_BEGIN_DYNA_RECONF,
> + divider->base + WZRD_DR_INIT_REG_OFFSET);
> +
> + /* Check status register */
> + err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
> + value, value & WZRD_DR_LOCK_BIT_MASK,
> + WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
>
> According to pg015-clk-wiz.pdf, Clocking Wizard v5.2 and later, need to w=
rite
> 0x00000007 followed by 0x00000002 into Clock Configuration Register 23, t=
o
> consolidate the redundant bits that the IP has upgraded, right?
>
> Can you compatible to v5.2?

Will fix in the next version.

>
> Thanks,
> Zhengxun
