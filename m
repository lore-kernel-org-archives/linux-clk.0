Return-Path: <SRS0=MLis=5Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DFCC2BB85
	for <linux-clk@archiver.kernel.org>; Thu,  9 Apr 2020 20:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E11E12082D
	for <linux-clk@archiver.kernel.org>; Thu,  9 Apr 2020 20:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fkHqygU9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgDIUJS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Apr 2020 16:09:18 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39877 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgDIUJR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Apr 2020 16:09:17 -0400
Received: by mail-pj1-f67.google.com with SMTP id z3so1719522pjr.4
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2020 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a1daMIhv4uqEVb81P2fZfmrwO8IvT0bj51umJh4Ge7g=;
        b=fkHqygU9p7zHQsdIY/ETF5DTFcNpaBolIiyzeRD/jxiQMkEJT0/C+h5L6sWJGrXJUe
         g1lt3qYKJ0baEi9Zc1mNK2cFruD8MZj0dpXIxuxB4d7lx7QVwy1NItxhAonucCbkCg77
         lHtws3N1KnBftLlL6WC6j0OTZjNqM1NsEZgDaUkRbvt6C1FJL/MCVoFHknmq9Xag0DzQ
         emSiORHBHpe0/1V2H/Kj2Sk2rp+9yTgA6yDKLjlLCLTCYCuGgt2E8i+aKiT+eYTxEBfC
         uGTNQGlJOE5mrzKgJ0tEMVbNAbSuXEjKDQKQEwlx6BR0vmLUZkUwFlae6b0dJR6CnHSO
         pLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a1daMIhv4uqEVb81P2fZfmrwO8IvT0bj51umJh4Ge7g=;
        b=sISO8GwJDll8ByXFCPcAmkKxpnUC28xSu2gEjR44ftHLSpBKkdxIKwyOqDh9ZIa1vP
         DGisrG4Y2+3PQmIJ6Ugpip3C9lJHvJJkJ/CnduC8pg19AQHRdkXz1OuVnOApuEI/MXT/
         Xevbhd5RG2Vc6W2hPxYvN5LHn74aeOEnlu5G/j7vzTPAC1XDlEK1idOYZ4zXkkppchRe
         BG9zKuoC6YIa8vD0aY3I7sTev8P7qxqZdmI9aDIuXIUeMiLJF2gelQDX3mpaSAIlK2aY
         nd51+LypkJX4RXtuWaVSSm6oLp59LZs6ahV4Ir5PIo2bOxUNa/R0HZc3jp6dkLM8Gj65
         8eTw==
X-Gm-Message-State: AGi0Pubr07+yXd3xtnXKP/meq15QHF1Ho8kbuHM0+s7KEJvAux1vDnpc
        OpL6DuQkB80F07JzvZNg2Q5G4CwtbtspKGEQMTM2rQ==
X-Google-Smtp-Source: APiQypLNG4ObXWr7cLXobsJFxj3djQDaQjXOhO//8mG9VxUalyyeHPxNCTQTJXMhS/ZvnrKwrDDqlsAx7Cy/ZhHTOpg=
X-Received: by 2002:a17:90a:65c5:: with SMTP id i5mr1353085pjs.18.1586462954986;
 Thu, 09 Apr 2020 13:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200408035637.110858-1-sboyd@kernel.org>
In-Reply-To: <20200408035637.110858-1-sboyd@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 9 Apr 2020 13:09:03 -0700
Message-ID: <CAFd5g46JHKmrEbYeL_Yu8djPHr-6QwidumLKtdYoYOwC_ALpaQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] clk: gate: Add some kunit test suites
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 7, 2020 at 8:56 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Test various parts of the clk gate implementation with the kunit testing
> framework.
>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: <kunit-dev@googlegroups.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

One very minor nit below, other than that this looks great! I couldn't
have done a better job myself.

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

> ---
>
> This patch is on top of this series[1] that allows the clk
> framework to be selected by Kconfig language.
>
> [1] https://lore.kernel.org/r/20200405025123.154688-1-sboyd@kernel.org
>
>  drivers/clk/Kconfig         |   8 +
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk-gate-test.c | 481 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/clk/clk-gate-test.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6ea0631e3956..66193673bcdf 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -377,4 +377,12 @@ source "drivers/clk/ti/Kconfig"
>  source "drivers/clk/uniphier/Kconfig"
>  source "drivers/clk/zynqmp/Kconfig"
>
> +# Kunit test cases

Minor nit: Elsewhere you use KUnit.

I wasn't going to say anything because so many people go with the
"Kunit" capitalization (and actually I kind of prefer it), but you
should at least be consistent within your patch.

> +config CLK_GATE_TEST
> +       tristate "Basic gate type Kunit test"
> +       depends on KUNIT
> +       default KUNIT
> +       help
> +         Kunit test for the basic clk gate type.
> +
>  endif
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f4169cc2fd31..0785092880fd 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_COMMON_CLK)        += clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-fixed-rate.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-gate.o
> +obj-$(CONFIG_CLK_GATE_TEST)    += clk-gate-test.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-multiplier.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-mux.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-composite.o
> diff --git a/drivers/clk/clk-gate-test.c b/drivers/clk/clk-gate-test.c
> new file mode 100644
> index 000000000000..b1d6c21e9698
> --- /dev/null
> +++ b/drivers/clk/clk-gate-test.c
> @@ -0,0 +1,481 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for clk gate basic type

Here is the other capitalization.

> + */
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include <kunit/test.h>

[...]

Cheers!
