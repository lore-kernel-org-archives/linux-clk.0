Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06B7C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 08:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiJDIn1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 04:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiJDInZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 04:43:25 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F021B27CC4
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 01:43:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kg6so11984380ejc.9
        for <linux-clk@vger.kernel.org>; Tue, 04 Oct 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9y6mckp6QwqVlkCMwSWHyLCrVK+e0UEzLE8ZnwJRiY8=;
        b=ktTkCfG+LGxaPC1FxhwkFYJUP/uVyiOL59RxCdYRtkujLdjXw8gvt2wUv+3x36ZqEK
         gr+uKk6uEhNT17sQPZ+KjFSX97a/KZpXepfHXgmhrDb/3eL9AHcIu+haa3EHsmJlJnzs
         R+SN9ofuPDXQjzLSQb4X72bpgfANjBE8P6Ib46jOf8xbgd6EArUjlzdayYBgqbKSLnRb
         yA9oWfoFVPykqzj7yWWyR9cV4XJmxmMBtiBzim10xNw0tIseI7tW35fyhQC0NGXVzhMy
         VlAoApKSJ0FnZlTgOKRnAPpO6m++30KnTUXBS3hDU/FaSdixESMfE5c4EeyFBh4KwinZ
         wxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9y6mckp6QwqVlkCMwSWHyLCrVK+e0UEzLE8ZnwJRiY8=;
        b=K4mQmyRPZEDrvHSRT8DixeUf4zTPX0n2ohNZwMfxz4zHO1VwP7uWZ/XA0WJxN4ylC3
         EsBkJtEmpBD4fH1q+85mrpS92psWNhHRbsem3XMyMogrUYCuqBVAQuhvVgwLmbPhpjtl
         rSCSr+LxXpoJYLmzH0mg+o7LnIpNmEUpIk16otwNF9HxV+oXOUjcA7MAgr6FVsHtVWwF
         FQ3fEesOnnkpnjax8SamTaHyxIszem4EAGdruK5TdaC2tQZ32jn7JWMrcw+wKKsvkbpr
         dQ2G+8YikD+beqhBFAAEmCmDKDlj/+sGYz049qzAWX4eY/Ao/YNhqXb+qSW6NAZjJIcG
         M2yQ==
X-Gm-Message-State: ACrzQf3hHw0+JJRowg7UNlBkUqDLT95Jeag0oL4rWk3SM70+02kOl7xB
        ELm8qeGCkScBqVd01770YOz+u0rdyC9qI7IomuoGLg==
X-Google-Smtp-Source: AMsMyM7smwSso6PfOzdvyNfHYtM5xmnUQGdDRlyqmuW7idFRUM5gJbnvbj0OLrfrEFIn9hTirM/sNLEnKZ34nmjZXfM=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr18624979ejc.500.1664873002520; Tue, 04
 Oct 2022 01:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220930060819.5320-1-hal.feng@linux.starfivetech.com>
In-Reply-To: <20220930060819.5320-1-hal.feng@linux.starfivetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 10:43:11 +0200
Message-ID: <CACRpkdb-7YxfJB5YpYf4t1rT+u=mctLyVbCwm4+TtEHm1k2ANA@mail.gmail.com>
Subject: Re: [PATCH v1 22/30] pinctrl: Create subdirectory for StarFive drivers
To:     Hal Feng <hal.feng@linux.starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 30, 2022 at 8:08 AM Hal Feng
<hal.feng@linux.starfivetech.com> wrote:

> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>
> Move the StarFive JH7100 pinctrl driver to a new subdirectory
> in preparation for adding more StarFive pinctrl drivers. No
> functional change.
>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>

I applied this patch for v6.1 so you don't have to reiterate it, it's clearly
just infrastructure that you'll need going forward.

Yours,
Linus Walleij
