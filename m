Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750902AbdAYIaf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Jan 2017 03:30:35 -0500
MIME-Version: 1.0
In-Reply-To: <1485293599-23581-1-git-send-email-martin@kaiser.cx>
References: <1485293599-23581-1-git-send-email-martin@kaiser.cx>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 25 Jan 2017 10:30:30 +0200
Message-ID: <CAJKOXPfwj3v2cVU_WieqFFcMBkawuRUr-v4mDNG-FMg0A8=OgA@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: mark s3c...._clk_sleep_init() as __init
To: Martin Kaiser <martin@kaiser.cx>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 24, 2017 at 11:33 PM, Martin Kaiser <martin@kaiser.cx> wrote:
> These functions are called only by other __init functions.
> Compiling for s3c2410 with CONFIG_DEBUG_SECTION_MISMATCH=y,
> I get warnings like
>
> WARNING: vmlinux.o(.text+0x198350):
> Section mismatch in reference from the function s3c2410_clk_sleep_init()
> to the (unknown reference) .init.data:(unknown)
>

The code looks okay but the description is not accurate. First, indeed
the functions are referenced only from other __init. However the real
problem is - pointed by section mismatch - that non-init functions are
referencing __initdata. Exactly this is mentioned in the error above.
Please, refactor the commit message to reflect the real problem.

Best regards,
Krzysztof

> Marking the s3c...._clk_sleep() functions as __init fixes this.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/clk/samsung/clk-s3c2410.c | 4 ++--
>  drivers/clk/samsung/clk-s3c2412.c | 4 ++--
>  drivers/clk/samsung/clk-s3c2443.c | 4 ++--
>  drivers/clk/samsung/clk-s3c64xx.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
