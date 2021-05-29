Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C94C47090
	for <linux-clk@archiver.kernel.org>; Sat, 29 May 2021 23:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A7E461090
	for <linux-clk@archiver.kernel.org>; Sat, 29 May 2021 23:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhE2XJx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 May 2021 19:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhE2XJx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 May 2021 19:09:53 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4FFC06174A
        for <linux-clk@vger.kernel.org>; Sat, 29 May 2021 16:08:14 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id f8so4568576pjh.0
        for <linux-clk@vger.kernel.org>; Sat, 29 May 2021 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Oz6WbJIayPIPGEgF0T14UBd14Ee4ocMxtgGqOTktA4o=;
        b=KkpWKZcffZcA6m9H+fXFRQbgNJ2xVyY2yM/oi8uvoLZ88Sm4F2PfTII7WcT0nRsKY+
         pOzth+EvBsbnkMU/7FsKJNeGnnE+MPHYX9zMwUxxbiFjmW15s6SIgaD2kSD5Sxlm98c+
         0Ut6A/hCrZP4XuKM7ScqwTc3HkcM3ySnB8RZqE/KekxvT2V2eQjQP4DoHNWQDFDW8Foi
         GAZUcxdVJE6eUDQy2xE8k1qI+OjpF+ghyL2C3ANtFfhNgAD+Q8/utbPrZo5wwloF+grQ
         5sYhwpAJmBhS9ooGbt8sX07/CRCmLceDwEz8YlbUa90Kcbm1oohKX2no0qNse8uivjqO
         MzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Oz6WbJIayPIPGEgF0T14UBd14Ee4ocMxtgGqOTktA4o=;
        b=nR7PaYO2i+pee0yDoG4AWhSfCIfFi6CqlkiRqr/AgumnyBi9tsONecE0ELHF+IIMxE
         K7RjkBnWzAmNjq/YFVv4rCfU05JV/PhoiKp6yWrCe6CJxCyJaDDrfsilO8MyFD4PrNbT
         2/c5CzVPJgawUZtizJBKfUvGy/oclfUl6StvrYQDawPrxsL27R+g2k4mFHlIWrr4eh0u
         uGmOpsAlANOXYb5Da6axHXAQX53pydhl/7XhlHgHo8aSiAktIk/xw9xiU6IzY2Fcraqn
         0zSyOUIJsl9cTB5fbDEe4gz8rRM1MjpR3XmpBmn+TQPXvfv27RBlYIRUkpnbLKA8buKx
         2kHA==
X-Gm-Message-State: AOAM532pJSk4tnk6Fqzv7PhbyrZgrDxz08lw1lejalFCQKI4yFTHxtOk
        zcoDAjxmn8gXwuS1Ntm713LPdw==
X-Google-Smtp-Source: ABdhPJxy8tTHJfiR+q/sQ1ZwCMi35M9UJBnTbnM2neGccG4Oq88chDZdi8Kkd+rmosgqHiIedpMQfg==
X-Received: by 2002:a17:902:9b83:b029:ef:4dd5:beab with SMTP id y3-20020a1709029b83b02900ef4dd5beabmr13846708plp.76.1622329694231;
        Sat, 29 May 2021 16:08:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v4sm2066778pfn.41.2021.05.29.16.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 16:08:13 -0700 (PDT)
Date:   Sat, 29 May 2021 16:08:13 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:51:03 PDT (-0700)
Subject:     Re: [PATCH] clk: sifive: Fix kernel-doc
In-Reply-To: <1621851730-32287-1-git-send-email-yang.lee@linux.alibaba.com>
CC:     mturquette@baylibre.com, sboyd@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, yang.lee@linux.alibaba.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     yang.lee@linux.alibaba.com
Message-ID: <mhng-5e882346-b7ef-44de-ae79-af3873f0ffb8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 May 2021 03:22:10 PDT (-0700), yang.lee@linux.alibaba.com wrote:
> Fix function name in sifive-prci.c kernel-doc comment
> to remove a warning.
>
> drivers/clk/sifive/sifive-prci.c:573: warning: expecting prototype for
> sifive_prci_init(). Prototype was for sifive_prci_probe() instead
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/clk/sifive/sifive-prci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 0d79ba3..80a288c 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -564,7 +564,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
>  }
>
>  /**
> - * sifive_prci_init() - initialize prci data and check parent count
> + * sifive_prci_probe() - initialize prci data and check parent count
>   * @pdev: platform device pointer for the prci
>   *
>   * Return: 0 upon success or a negative error code upon failure.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm assuming this is targeted for the clock tree, but LMK if you want me 
to take it.

Thanks!
