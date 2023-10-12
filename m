Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157CECDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 16:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbjJLQVf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 12:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbjJLQVc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 12:21:32 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BB0F2
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 09:21:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-694ed847889so980958b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697127689; x=1697732489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNWVejFTVcyzLtYuIOHAfjVjETmGqKuawTBPQ3WoJZ8=;
        b=XLNQFC9UBO3HfdR3oXalLULMpw9+BsoxH1aiFtdfAI6w0Q+80xrIAwFjEnrKfpDvZr
         bfXnL2ejKZB7ZA/yi7S9xI0FYni/5L8R+VTaeMuxqldpFW6MvgVruqZc52hKgIggmwni
         x5HcEGpWOnPAU6YnYs9EY8WDroOpKwZm9TQ4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127689; x=1697732489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNWVejFTVcyzLtYuIOHAfjVjETmGqKuawTBPQ3WoJZ8=;
        b=fx9mWLnYyE6WiG7KBvW1+v0m3PjrvcbF134fodhpPBsHHvvZcSQlQGAF7tzChFXt9J
         eJJ4nUnXXQGCKhb/vRoTmqRVLiC6u15+pCk+sr06S3XvlplHR9KKJS+zK9GAMZPwvofB
         rP67DcxjbnEdpFEWog7S+iSkHd89S4MlI0VtrVWTAEaniV01kwoQsYTu4kG8Z+yX+4Uo
         sjgiK2JUYVw1+3Ya5wO8FVZ8skNeVE4MTi/Rv5rUroEWvhVkrBuPpnPCCiBqdCvFZyb3
         KOr1DjIU7dRVKfU5JU5XT40IboD/WlAwuF91/RkJr/nv5GnLxZGyqmh/Vl6l+g3tb8Nm
         5LVg==
X-Gm-Message-State: AOJu0YycdTlsonOyWRttQpMwshw85K7I29DlczXrbzsYERBUrxmwnHBH
        Q2o4Buw6ZXaZAqaEqoUcgpIBsw==
X-Google-Smtp-Source: AGHT+IFeOYmmrH1RYpChLn+mja+VTaPqsmPBs6JvFB7bcaiNtAxd4zJhq+olfYBAqqyB17X/qvWusw==
X-Received: by 2002:a05:6a20:7291:b0:157:b453:dbb9 with SMTP id o17-20020a056a20729100b00157b453dbb9mr26465216pzk.6.1697127689467;
        Thu, 12 Oct 2023 09:21:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s5-20020a637705000000b00578b40a4903sm1929961pgc.22.2023.10.12.09.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:21:29 -0700 (PDT)
Date:   Thu, 12 Oct 2023 09:21:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2][next] clk: visconti: Fix undefined behavior bug in
 struct visconti_pll_provider
Message-ID: <202310120921.08062349C7@keescook>
References: <cover.1697076650.git.gustavoars@kernel.org>
 <0a59a721d54b557076cc94eabeb694d463773204.1697076650.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a59a721d54b557076cc94eabeb694d463773204.1697076650.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 11, 2023 at 08:17:36PM -0600, Gustavo A. R. Silva wrote:
> `struct clk_hw_onecell_data` is a flexible structure, which means that
> it contains flexible-array member at the bottom, in this case array
> `hws`:
> 
> include/linux/clk-provider.h:
> 1380 struct clk_hw_onecell_data {
> 1381         unsigned int num;
> 1382         struct clk_hw *hws[] __counted_by(num);
> 1383 };
> 
> This could potentially lead to an overwrite of the objects following
> `clk_data` in `struct visconti_pll_provider`, in this case
> `struct device_node *node;`, at run-time:
> 
> drivers/clk/visconti/pll.h:
>  16 struct visconti_pll_provider {
>  17         void __iomem *reg_base;
>  18         struct clk_hw_onecell_data clk_data;
>  19         struct device_node *node;
>  20 };
> 
> Notice that a total of 56 bytes are allocated for flexible-array `hws`
> at line 328. See below:
> 
> include/dt-bindings/clock/toshiba,tmpv770x.h:
>  14 #define TMPV770X_NR_PLL		7
> 
> drivers/clk/visconti/pll-tmpv770x.c:
>  69 ctx = visconti_init_pll(np, reg_base, TMPV770X_NR_PLL);
> 
> drivers/clk/visconti/pll.c:
> 321 struct visconti_pll_provider * __init visconti_init_pll(struct device_node *np,
> 322                                                         void __iomem *base,
> 323                                                         unsigned long nr_plls)
> 324 {
> 325         struct visconti_pll_provider *ctx;
> ...
> 328         ctx = kzalloc(struct_size(ctx, clk_data.hws, nr_plls), GFP_KERNEL);
> 
> `struct_size(ctx, clk_data.hws, nr_plls)` above translates to
> sizeof(struct visconti_pll_provider) + sizeof(struct clk_hw *) * 7 ==
> 24 + 8 * 7 == 24 + 56
> 		  ^^^^
> 		   |
> 	allocated bytes for flex array `hws`
> 
> $ pahole -C visconti_pll_provider drivers/clk/visconti/pll.o
> struct visconti_pll_provider {
> 	void *                     reg_base;             /*     0     8 */
> 	struct clk_hw_onecell_data clk_data;             /*     8     8 */
> 	struct device_node *       node;                 /*    16     8 */
> 
> 	/* size: 24, cachelines: 1, members: 3 */
> 	/* last cacheline: 24 bytes */
> };
> 
> And then, after the allocation, some data is written into all members
> of `struct visconti_pll_provider`:
> 
> 332         for (i = 0; i < nr_plls; ++i)
> 333                 ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
> 334
> 335         ctx->node = np;
> 336         ctx->reg_base = base;
> 337         ctx->clk_data.num = nr_plls;
> 
> Fix all these by placing the declaration of object `clk_data` at the
> end of `struct visconti_pll_provider`. Also, add a comment to make it
> clear that this object must always be last in the structure, and
> prevent this bug from being introduced again in the future.
> 
> Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Another good catch. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
