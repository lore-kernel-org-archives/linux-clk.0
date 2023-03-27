Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC15C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 18:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbjC0SwE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 14:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjC0SwD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 14:52:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FA11722;
        Mon, 27 Mar 2023 11:52:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F197B818BD;
        Mon, 27 Mar 2023 18:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E167BC433EF;
        Mon, 27 Mar 2023 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679943120;
        bh=yR3kBWWj+U4PCxXjD6CdcYK2bWLqQYhs47tXIHYqMvw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NC9QQ16qy9f3He7b9VpqRElXD2n+2W9PC/SN5tohM5BqvqtqPcUmRktUsu96CewxP
         d4Hce0GMDAsjd+fgSsBLryg7Nrhff1CF0HpA+m0qrBwf6hMR9fUs7VOIOnzTs9pvGn
         jCVIW/V77Jw6CBV4TqagW4g4gkpkXeJSmY6phLGwo6afeNQ0jS8JAzmCuTdpdN9y5g
         0pIa0SyISjKxCTweAde4md1bxjfxXgyukpISyJvZ+g5ITPytSs2feqf0n7aU16owj8
         BresQCt9n5+XRwAA72/I6flnPVsuxt91wtg9SpI/V8mXSEPv+0Q1zDRBW8e1I16f7X
         /i8k/7mUwZ8Tw==
Message-ID: <53f2bd239c74bab3079be3185abc4909.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230320103750.60295-14-hal.feng@starfivetech.com>
References: <20230320103750.60295-1-hal.feng@starfivetech.com> <20230320103750.60295-14-hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 13/21] clk: starfive: Add StarFive JH7110 system clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org
To:     Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Date:   Mon, 27 Mar 2023 11:51:57 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Hal Feng (2023-03-20 03:37:42)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk=
/starfive/clk-starfive-jh7110-sys.c
> new file mode 100644
> index 000000000000..f98a508969c3
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 System Clock Driver
> + *
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>

Please drop this include.

> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
