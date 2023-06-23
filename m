Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0544EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jun 2023 06:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjFWGMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 02:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjFWGMm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 02:12:42 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECED91BC1
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 23:12:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9bdb01ec0so3837195e9.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 23:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687500757; x=1690092757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cH76kt6UTmIx3qjb+jJaF/n8MOD0hF4u7nMAFs65XK0=;
        b=ablaUhmcEHIJieh3y2uEPumflActhxF3w2uUefbopG41DHD/4IguWMQM6LmV/eJhJt
         kpI7kJ5qu5GvsxvZSFC1bv08urkcOCWNjpGXKhMXgLLBQbjpZIHbnnDaNjtTfu7HrHqm
         D+CZvJKvv5wH8Yp01G63XjLTf7zlnBPerepHcijNPVszvDde1LQhbzMrLXjCJpo/RmXF
         fM0SVswubH6P8O9+WABzmAsRwQmO5592fKrXGcw1DKmZrnUtoslz7swOR3UT0Cg3Z6J0
         33bOaM6NV7AWp2EcM9SmM8h+gd5GPjLp3Ze0ZXCWJTo2EEnlJILk5ILZMoZbCi8Tgda8
         PsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687500757; x=1690092757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cH76kt6UTmIx3qjb+jJaF/n8MOD0hF4u7nMAFs65XK0=;
        b=DO03dFLqVx/zzyfSvtZvtv0u3OStKjxOzW6BRCgdT0V+m5EoNbqPZWjWiTgl7Xh5QD
         eD6xgq9uwaMMWg5esChddvHJDWXHqAlYgRJC+l5b/BP9/D6qozBJ+NXXpq4GC14ZcGXh
         aC/EdA7AwQJVj7cWYLVB9uc+2NCfV3sJf7SUwgRUmQj90gGKbrGsY+ANOAKMoNVZhrV+
         kIrRF4V4YifC98rgpC/+ZXPF7mJynDqRZcutvbokKZzuVtChASPcM+cIk4Ceiph9vrR3
         ebR1NNYmCEB1nmv9v9Nc2PX7Amw7gl6rqz/SUy+CdNGjAv5Z0lodtbFCqregCnRl59xN
         fM0w==
X-Gm-Message-State: AC+VfDwhLVDLmjDByx3Gqo0BJq1GluXw/NfEon4QV7mAfe+tJwkFUU6v
        DuouKVQpjx+ZvfVTC6F/6vHE3w==
X-Google-Smtp-Source: ACHHUZ49+GAafnSTu35IsubJ8ajqMPMD2FfaOa0PM7wZ1CfvRVc4avU2TwVtAfElopHYu6azWxfjgA==
X-Received: by 2002:adf:ffce:0:b0:30a:ec3b:58d8 with SMTP id x14-20020adfffce000000b0030aec3b58d8mr16321353wrs.3.1687500757261;
        Thu, 22 Jun 2023 23:12:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020adfce87000000b0030af54c5f33sm8635028wrn.113.2023.06.22.23.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 23:12:35 -0700 (PDT)
Date:   Fri, 23 Jun 2023 09:12:30 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>, tsbogend@alpha.franken.de,
        sergio.paracuellos@gmail.com, sboyd@kernel.org, trix@redhat.com,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] clk: ralink: mtmips: Fix uninitialized use of ret in
 mtmips_register_{fixed,factor}_clocks()
Message-ID: <27507a23-c1f4-40b2-a999-d6ebd10269f0@moroto.mountain>
References: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
 <CAKwvOd=jaaf7jpjFYe=J0uBiOkGbY3hQ1JsSThp+171cyOsP7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=jaaf7jpjFYe=J0uBiOkGbY3hQ1JsSThp+171cyOsP7Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 22, 2023 at 09:36:53AM -0700, Nick Desaulniers wrote:
> On Thu, Jun 22, 2023 at 8:56 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Clang warns:
> >
> >   drivers/clk/ralink/clk-mtmips.c:309:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> >     309 |         return ret;
> >         |                ^~~
> >   drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable 'ret' to silence this warning
> >     285 |         int ret, i;
> >         |                ^
> >         |                 = 0
> >   drivers/clk/ralink/clk-mtmips.c:359:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> >     359 |         return ret;
> >         |                ^~~
> >   drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable 'ret' to silence this warning
> >     335 |         int ret, i;
> >         |                ^
> >         |                 = 0
> >   2 errors generated.
> >
> > Set ret to the return value of clk_hw_register_fixed_rate() using the
> > PTR_ERR() macro, which ensures ret is not used uninitialized, clearing
> > up the warning.
> >
> > Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1879
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch!
> PTR_ERR returns a long; assigning to an int risks truncation of the
> error.  The use of PTR_ERR on L1079 has a similar risk...]
> 

If PTR_ERR() ever returns anything outside of the (-4095)-(0) range then
we are already screwed.

I'm 90% sure there is a reason why PTR_ERR() returns long but I can't
think off the top of my head why that is...  It's been that way since
before the git era.  I could imagine type promotion bugs involving
u32 and int if we changed it.

	ssize_t ret_val = PTR_ERR(x) ?: u32_something;

Or maybe Linus just felt casting a pointer to int was ugly.

regards,
dan carpenter

