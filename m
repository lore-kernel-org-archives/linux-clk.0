Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0488C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93BC3214C6
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:48:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSo7/HSs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbeLRJsu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:48:50 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:42094 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbeLRJsu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:48:50 -0500
Received: by mail-oi1-f177.google.com with SMTP id w13so1438314oiw.9;
        Tue, 18 Dec 2018 01:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/S7/FqDmA+7g8YYk57whu1nnBdedagnVtqBFsNKTs4=;
        b=hSo7/HSsPCtWSYNoWH7ZhQiOAlfd3QgDckGMrWRAq9BKcARCTXk68DwzgHcgJrZYOZ
         xX2HclMDi+sO/KYYYnyymOEI0UWwT9ZXTGZY6zYsQeTqIfAX22Cosdu8iWPHpHSXbdYe
         Ilky7pGZSvjHHF/EqFo4OaQYiYgPncA3hIxfDznJ6hh4DuqZxRmHMydjGwn9jAqj3R9o
         pz5EmPSO4AkDDPGa3/21HmuaZe9ew8Hxbi7KYqKYQlgrShO0GzEfwT50bRImo5hDmjFO
         gY+K13PLPN/Q1Ce7e6h41LKdCDcBntGJ7tKGg26LjO4y3m0liFOM5JbK7i93+XXAWPXG
         c2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/S7/FqDmA+7g8YYk57whu1nnBdedagnVtqBFsNKTs4=;
        b=rdSSnt6cheFHFkB8Z444MvmaUUXWIpIrAQGD7xZIVwh3uVPslZQ78b/5n7Gs4p8mOv
         KFU1eWAhypQjzEYAAcpLGm4JxLx6yVixgBr+I9i1+QqwetEgyqjhvJxH/1Wk4PwLep9P
         7JuWeQp5B910Ad9x4CmwLvQzFsyP2KVpeUUiLtPpOMFie3ooxE90omPfjltskvgXwdY3
         N0eyVmlAykpbv8s+WcAeEkcr/NesmL3gQ6+AKa/QUbuCE9gpoQbhWxdDBBeNIjmNX/5q
         l1DPky6WQSwNU2/NzGH4YQ9oik3u9rWfgSlEKVaSGUAzzejECqD5V51Wi79egVrml1M5
         NCIw==
X-Gm-Message-State: AA+aEWabscfY50puEQc9zdSecJp4Gmy+6RcoSpczqSJmNrzqzYFL5jSd
        MCjmAGa58sw2ZJxmHl/Sn/SBtndNB7hqVYv499c=
X-Google-Smtp-Source: AFSGD/W05Z5iPtTs0/4NSp24/Jvk6y4O8qD2dKpa7L02+a4WJxXHSnfjFd7X8vpQE/OfhzkZl/j7rRotkwMxo4Q85vE=
X-Received: by 2002:aca:3092:: with SMTP id w140mr7683815oiw.237.1545126529293;
 Tue, 18 Dec 2018 01:48:49 -0800 (PST)
MIME-Version: 1.0
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 18 Dec 2018 07:48:43 -0200
Message-ID: <CAOMZO5C1+bxWtapaBrdzf0o3Q30BkBNHLg9=4K5ZsxBk6s2DWw@mail.gmail.com>
Subject: Re: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        kernel-janitors@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Wei,

On Tue, Dec 18, 2018 at 4:36 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
>         base = devm_ioremap(dev, res->start, resource_size(res));

Wouldn't it be better to use devm_ioremap_resource(), which does the NULL check?
