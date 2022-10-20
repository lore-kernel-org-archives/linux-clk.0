Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD6AC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 11:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiJTLoQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Oct 2022 07:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiJTLoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 07:44:15 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5671DDDC0
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 04:44:13 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id p4so8796890uao.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SgkVAHFYBzf7xeOTCAVuEnoDAv9oQxRnYlVtkTlACqw=;
        b=adkWWjuBVJKWz+k29lkHpJZgLvsE8Unbi89248gPAsGG+Q1WrPz8aHa7KSXTZB9Ybo
         XUBs+EDDpB1Yf54vr2axcGH5pvrRAPAMqRCtHtMYGfvmMEXNFpCYv0xoiYHO4p9bhIpI
         Pi1XwEvVAg/DzG3e2TFQZ+2f1x67lvNywKraCr7ctek3W6ta0lz7zaijz93ciR44sJzB
         e/fDnOZU5o5wK1IMW5aVsiKptKlhYl58AlztWcKDa5g3fRZeT2vYOvz0H3GJcSYismQR
         y2DPoimdeDBHQVsBXoYSIqbEmPqPLL7ndZvfLgjPUFSa6nf262WrpcrDCZ1DIEUxkROC
         E+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgkVAHFYBzf7xeOTCAVuEnoDAv9oQxRnYlVtkTlACqw=;
        b=JWAilyJkTLt/A+LN3fsEYBmhB5ETfHeDvynwtb/i1ROOoIeJu9KiBYih5UM5ys0WT0
         jQ9Qp9U55PQe6dAIaMJ88OkbDS9KjTyT5bN8/WyiH+52rGwf7er1QFtrdjt9L/DruV0T
         fJ5KUuApe56YtIWwMDUx/GPBGD8Z6nAoPGBS1YuUA3hRRYC0bPc/xW+fiX2ZQAWvT8+S
         gp/jg6D/8w/K14f4KwCJQmG3PxfO3+Rr6hA+R4ku8AmSjg+nIOxyDCToBOSRFehfMapE
         b6lLZP9/NvwyEoodvfO+wemOTaZz5kMuuBFPD8fdW8siEynn3D0+bikjw67VEt9XUetf
         q+OQ==
X-Gm-Message-State: ACrzQf17Qm8Bocy7HyAhmmGvzvF6TdmFcvHrgktKBcwy20CZb11w+nK7
        JQrIjL96D5K2GF13HzuXMoOR/sKOlpvITX0RxizmRw==
X-Google-Smtp-Source: AMsMyM5WbN+kP6upXD8BHZ2+7x8HSWM2dMtfPxkn6tsEadd4FVsVXgAbowFoG8e54aQRPlNENRIf1Asn7rsJtTUXMjA=
X-Received: by 2002:a67:ab46:0:b0:3a7:d2b6:121b with SMTP id
 k6-20020a67ab46000000b003a7d2b6121bmr6269919vsh.16.1666266252494; Thu, 20 Oct
 2022 04:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-5-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-5-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 13:44:01 +0200
Message-ID: <CAMRc=Mc4AjNiyaw2rQeb6_SrtHNZMXe=ipFyUUwyYvTcT+9zwA@mail.gmail.com>
Subject: Re: [PATCH 04/14] clk: remove davinci dm3xx drivers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 19, 2022 at 5:33 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The davinci dm3xx machines are all removed, so the clk driver
> is no longer needed. The da8xx platforms are now using DT
> exclusively, so those drivers remain untouched.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
