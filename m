Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC5BC4167B
	for <linux-clk@archiver.kernel.org>; Fri, 11 Dec 2020 02:11:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EEA323E55
	for <linux-clk@archiver.kernel.org>; Fri, 11 Dec 2020 02:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389898AbgLKCLI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Dec 2020 21:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389845AbgLKCKs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Dec 2020 21:10:48 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5CFC0617B0
        for <linux-clk@vger.kernel.org>; Thu, 10 Dec 2020 18:09:43 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id j1so3827401pld.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Dec 2020 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=YBlvYT4u5OxK5j8EJbV+g1HuI5bT3QSP3buVFiGA1os=;
        b=ojGKW+CeYR5epryGbpALej+OHjrnYYY4F5AcYsJXq2QKzqeCscsKaThjnyeJ9Ylfqy
         stNFexzvzSlxzo11CsCIrvXoot940KDLwNq6U8iyf6o2VVoJmXu5ZEkKzf0kZRN/XH4K
         c5tUCpzDOXA7Qwj7udYJ0zJBRHGi1iHmlFcXB3SSu5MmB6K6QYJHE60hVdtnnFFfjJou
         QdAUsr+MsXZjyQLPZzfO9RP8uOPeNbL+1RQZOuuOS0KF6mtZktlFReA0HtIO119vFWyv
         IW4vS44VNOYcmqhfaGNCUzVPPSQDEa88yoo+n6tMPqyqdkQSNuqX75EHsGQJQxDMLzvr
         UKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=YBlvYT4u5OxK5j8EJbV+g1HuI5bT3QSP3buVFiGA1os=;
        b=Y/LVJQO5wUbJXf1/y0g0G+u0gCFvZMYfPJCgouTxJLE7WeS+Fl4l9Ie7w4JXvqKe8N
         j1Ai7GoaEUFcO558S7AqIAJf7uMUsx180SsYAaNzTgzqHDCrreb8lCeoIrN944VqoNcM
         O3cC1/Iia+8yYjOdP/tFyk5k7vH98HCCpq7WqB7quThWpM4KlJMFm0wb1Bza/xi03wHP
         yfkb3cl8y1t5inDv2sXgJlZDwVVRxfpyroAm3fZrgcyDkN6qCDgKm0DripS05JnoQkRB
         o2rGhBRkx4JB7Noef3qqaTKtq745mXFE2JWoKZxzyxt17te/xsFVWUTg9w4E2dPuCWu1
         ewJw==
X-Gm-Message-State: AOAM533qh4JSQJ1L56C1bktIzqF5mjqsN7ukAu1tp9vEkgzixcTPtV00
        FOKWPNUMzNeMPtopOCm+lweJEA==
X-Google-Smtp-Source: ABdhPJzeGFWjq3hV8gFbllyK08YaWDVJZPTgEzBarNAGC/GyiCHgx9fKOPPu5k/w9L1BBKd6CjJLhw==
X-Received: by 2002:a17:902:bf0b:b029:d8:f677:30f2 with SMTP id bi11-20020a170902bf0bb02900d8f67730f2mr8951276plb.25.1607652582712;
        Thu, 10 Dec 2020 18:09:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f126sm8252120pfg.153.2020.12.10.18.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 18:09:42 -0800 (PST)
Date:   Thu, 10 Dec 2020 18:09:42 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 18:05:22 PST (-0800)
Subject:     Re: [PATCH v8 03/22] riscv: Enable interrupts during syscalls with M-Mode
In-Reply-To: <20201210140313.258739-4-damien.lemoal@wdc.com>
CC:     linux-riscv@lists.infradead.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-c9e2b17f-75ec-47d0-bfad-47b2ad1195dd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 10 Dec 2020 06:02:54 PST (-0800), Damien Le Moal wrote:
> When running is M-Mode (no MMU config), MPIE does not get set. This
> results in all syscalls being executed with interrupts disabled as
> handle_exception never sets SR_IE as it always sees SR_PIE being
> cleared. Fix this by always force enabling interrupts in
> handle_syscall when CONFIG_RISCV_M_MODE is enabled.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/kernel/entry.S | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 524d918f3601..080eb8d78589 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -155,6 +155,15 @@ skip_context_tracking:
>  	tail do_trap_unknown
>
>  handle_syscall:
> +#ifdef CONFIG_RISCV_M_MODE
> +	/*
> +	 * When running is M-Mode (no MMU config), MPIE does not get set.
> +	 * As a result, we need to force enable interrupts here because
> +	 * handle_exception did not do set SR_IE as it always sees SR_PIE
> +	 * being cleared.
> +	 */
> +	csrs CSR_STATUS, SR_IE
> +#endif
>  #if defined(CONFIG_TRACE_IRQFLAGS) || defined(CONFIG_CONTEXT_TRACKING)
>  	/* Recover a0 - a7 for system calls */
>  	REG_L a0, PT_A0(sp)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
