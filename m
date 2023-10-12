Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9170CDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 16:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347163AbjJLQVy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 12:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347317AbjJLQVx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 12:21:53 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7FAC0
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 09:21:52 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-79fa2dbd793so48033739f.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697127711; x=1697732511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnUFxt3XAIfdwYUO6iyQ755NzkFZ938qAzLabRmEMTQ=;
        b=d+3GRbglvabl4y+TsD+IcaJJU519pJzthI44hy4yhPvi1kbuCYST1O1fhX9q8318Zp
         Cxzc9QiDe+Uvhvu13I0SQqTJRKE9lewB2YqnhCujV0c0/Oqzp+E5tA8S3J+Eriaj4KFJ
         /MJKPnVlQx0XjThtngEQ3CaWqhbKURERvrco8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127711; x=1697732511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnUFxt3XAIfdwYUO6iyQ755NzkFZ938qAzLabRmEMTQ=;
        b=boULyhpWSKExGo+y4IH4dYuroAjDeFLaGYBvfrj/lQ6e/OxpfjS7H2PTU/am5gXztU
         hbXD11ZAHSZpJcvxsPKd2uWMrUD4Woa0FFYen5oPzW4qFTgCTBn/mzUrSKYCWnj73wNU
         dr7OrhN7mVS0SKc++NC2RrTjVUQIZvRUOS6LIwco+/J2tBe2BSTa5mtFxLLF651OVmLI
         c6ZgTk7+b45BDwgxLidAEhqMrjIcljiifBIdA7H6RBeTXyk9nJv4c2WZGWkV4yL4/kDR
         ZblG3W7UjoUMEq/QuoS/yvFtM2OIZfRToEfMohcPRQzUetR5u6DGJgnGsTKQap+gPfXF
         aNKw==
X-Gm-Message-State: AOJu0YzsLQXiecbgxaCc7y9zsTSmU4/l1NehT+gR6emDbB3nHs13yMHg
        0II7IUi0NF0mQT5yVUOB0dVG/g==
X-Google-Smtp-Source: AGHT+IEWGQ9eUG3d0le5HxUu8fZk/NWTi2Ecg9QtVgd0vbLPSzFyiDtZh8Vq3M+46SAhJg6gaiMmZg==
X-Received: by 2002:a05:6e02:b22:b0:34f:f6f0:d4eb with SMTP id e2-20020a056e020b2200b0034ff6f0d4ebmr30650521ilu.21.1697127711489;
        Thu, 12 Oct 2023 09:21:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n7-20020a62e507000000b00693411c6c3csm11927054pff.39.2023.10.12.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:21:51 -0700 (PDT)
Date:   Thu, 12 Oct 2023 09:21:50 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2][next] clk: visconti: Add bounds-checking coverage
 for struct visconti_pll_provider
Message-ID: <202310120921.3F24CB2E@keescook>
References: <cover.1697076650.git.gustavoars@kernel.org>
 <675633f7ae9893371d35b238f06fd02a3acffebb.1697076650.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675633f7ae9893371d35b238f06fd02a3acffebb.1697076650.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 11, 2023 at 08:18:45PM -0600, Gustavo A. R. Silva wrote:
> In order to gain the bounds-checking coverage that __counted_by provides
> to flexible-array members at run-time via CONFIG_UBSAN_BOUNDS (for array
> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions),
> we must make sure that the counter member, in this particular case `num`,
> is updated before the first access to the flex-array member, in this
> particular case array `hws`. See below:
> 
> commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") introduced `__counted_by` for `struct clk_hw_onecell_data`
> together with changes to relocate some of assignments of counter `num`
> before `hws` is accessed:
> 
> include/linux/clk-provider.h:
> 1380 struct clk_hw_onecell_data {
> 1381         unsigned int num;
> 1382         struct clk_hw *hws[] __counted_by(num);
> 1383 };
> 
> However, this structure is used as a member in other structs, in this
> case in `struct visconti_pll_provider`:
> 
> drivers/clk/visconti/pll.h:
>  16 struct visconti_pll_provider {
>  17         void __iomem *reg_base;
>  18         struct device_node *node;
>  19 
>  20         /* Must be last */
>  21         struct clk_hw_onecell_data clk_data;
>  22 };
> 
> Hence, we need to move the assignments to `ctx->clk_data.num` after
> allocation for `struct visconti_pll_provider` and before accessing the
> flexible array `ctx->clk_data.hws`. And, as assignments for all members
> in `struct visconti_pll_provider` are originally adjacent to each other,
> relocate all assignments together, so we don't split up
> `ctx->clk_data.hws = nr_plls` from the rest. :)
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks good; thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
