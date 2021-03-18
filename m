Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D04C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 05:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2A4C64F38
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 05:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhCRFmk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Mar 2021 01:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhCRFmJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Mar 2021 01:42:09 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64996C06174A;
        Wed, 17 Mar 2021 22:42:09 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso4134780otq.3;
        Wed, 17 Mar 2021 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e5E4cv+qzO6RqNYov3uCSW6dw7gV2q0enyiUMpZ0Cjg=;
        b=LyAApYYT3TQfh+yLVjVHE9ILKZZh3xAndVkUTbEakNpMFn9lKsw5w9XmVMhGg/1XBU
         l0SZqx+mpRqgQia+R0sTQAiMn9Fzu+Y44k6u2WRsGjJtmbmRfqNmSXI7Cg3IeqXa7Iep
         k9xcmerxp+WXJDzUQ8CfrtfJH7333tZXfx0mmEQKdBxL0lG5Lz1qy3PNY335ceNrsf5U
         YIjpsqqJCH/FwpsH0conEXCANsFNO/HtbAfpUMUc2KmjvJgrNG9aG+9m8/sTHuFn4RFP
         /7ZiqAP/rSuYYuLnN5tMrIp3Jv4OHZJw6v+TMMtgYaJpTuEyVcjiMrj2B1dxSFMNbh3X
         uQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e5E4cv+qzO6RqNYov3uCSW6dw7gV2q0enyiUMpZ0Cjg=;
        b=lvQSkx9H/hbK3D064K/U1zzTzZZu/f97e9dmGlgGD3XkhoYE0L5eXaULwiHuAUQNoB
         q4BNZp3oP8ZJWupRs6FZ2fRCkgZtUeO7RreZRv3EKSyq7t++kcUyu8wxwkyIxc3OQ6Dm
         cOpfybc9dsWpUzjFp3cqhw0+D9sqLLZZH7VZAzAiViXAVuTcPVFrh6PZzSpYsOFWZv7n
         d7d6aANFq8bV4Di0xK9c3RureAhlWbTKmlA7fqLkrfs4sSPX0EReI/6vgv7/t+Zc58qn
         euS5GOYgb8aAoDUZ5SnvvDWtTffUdfR/8Xc4WlvZJXmGbczYlrt0zeDBbNtzYuyEtXEA
         zcSA==
X-Gm-Message-State: AOAM532PUMLJ9/7FE99/2xILDLFKHl1fWEev0T6PD4+BwqhdKgP9DqmC
        fnXH3pt6/RPxOkj+lVq44eUdk7Y7TxUVqmwCArA=
X-Google-Smtp-Source: ABdhPJy2GkYXi/bDDIvaBgNq+ChA9bCJlBqUGUMTmp+/pVXcMOoHj/tpoSVgbNFMMT5RUvJ8GYHRr2F0cRWbhh8qNIA=
X-Received: by 2002:a05:6830:408a:: with SMTP id x10mr6147308ott.248.1616046128852;
 Wed, 17 Mar 2021 22:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <CACY_kjSRbgSWsfo+JTyQdqorQ+wcy8OqAtKSbJt6tL4t-AUciw@mail.gmail.com>
In-Reply-To: <CACY_kjSRbgSWsfo+JTyQdqorQ+wcy8OqAtKSbJt6tL4t-AUciw@mail.gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 18 Mar 2021 11:11:57 +0530
Message-ID: <CAKfKVtF+9XyOXq2aLoEyMFr9ZsvHOsqPaAPu79ziUtF-VeMnWw@mail.gmail.com>
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
The phase setting is a separate feature will address in a separate series.

>
