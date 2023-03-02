Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD38FC678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 04:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCBEiC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 23:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjCBEiB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 23:38:01 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCC7BDEE;
        Wed,  1 Mar 2023 20:38:00 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s26so62581211edw.11;
        Wed, 01 Mar 2023 20:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cH5QCWPvK5yIWKHOjLm1DJOS8y866l+SddIKwDhm72I=;
        b=MY4cskbmwusawU8T7AnxkNnsEDLOkB2G+nL/682DS0Lt0IdiB2NXWH9CEjaDt7I8RM
         +zHXbQEqJgSkUjRF6yo7yUz8jw7uSCrxoJgLg0PlpYWcBQknIdK6AgJWjQYJC8rWNGNw
         KBojVr2FyzuO2q+q3XJNlq0UEys1fmRhEP+og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cH5QCWPvK5yIWKHOjLm1DJOS8y866l+SddIKwDhm72I=;
        b=4jvy0ztoMfVNpy9N3pEV2fFK2tY7iJHzFkqIwj1AcJe5mHHjc2pEacrTYEoFqo3dm3
         AdLx0P3zLgkIOnTqRex/nljXmDT03AIK2hgnA7qU12TklTg2HUmtegQJ0yVkxwrU6rq8
         jNg9YliU6ZcKCfMDml8mcQw/RzeiBTG/b0eA/IoFT4UmDLKsV/TdfgTqWavu3Q7aneUp
         8Kc14rQ4k6z7b8z43MAMadBv00jUe0JpYfWte4s5A8oKZeOZTL8fqECQX5AZqMjlSKZN
         o5kmvuLMQE+L9RwLRe/uOYE2BVOQPu+rzFY1QF45t6G/EsbF1vlQZQyoDhMUNb/YjZkN
         OOGg==
X-Gm-Message-State: AO0yUKXkcLL9IHWh7PILeNLnjrrbv83+C3jAaojxQJexG9n9dVysplk9
        yJoRlziE0xexfOFNnbfSqQBFd6qgKPPHIgbqzTQ=
X-Google-Smtp-Source: AK7set8sNmWm/8ILzJnLjhfsBQegrCZWioL4601vbmBfjTc1luoGfB69rsH3LmqFUTACR4tMATlZqEyS7SZf3G3sR5w=
X-Received: by 2002:a17:906:1751:b0:8e3:da0f:f9b7 with SMTP id
 d17-20020a170906175100b008e3da0ff9b7mr4614883eje.4.1677731878401; Wed, 01 Mar
 2023 20:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 2 Mar 2023 04:37:35 +0000
Message-ID: <CACPK8XdDL1Wm4juJhANwmkacAfmYTJTdQAFVd9t8wPPLUfBxaA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add definitions for AST2600 i3c clocks
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> This series adds some base configuration for the i3c controllers on
> ast2600 hardware. We'll use the reset and clock definitions in the
> proposed dt binding example, hence sending these first.

Cool, looks good:

 clkin                                6        6        0    25000000
        0     0  50000         Y
    apll                              1        1        0   800000000
        0     0  50000         Y
       i3cclk                         2        2        0   100000000
        0     0  50000         Y
          i3c5clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c4clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c3clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c2clk-gate                0        0        0   100000000
        0     0  50000         N
          i3c1clk-gate                1        1        0   100000000
        0     0  50000         Y
          i3c0clk-gate                1        1        0   100000000
        0     0  50000         Y

Tested-by: Joel Stanley <joel@jms.id.au>

Thanks for the cleanups and documentation.

Cheers,

Joel

>
> v5:
>  - use regmap_update_bits rather than FIELD_PREP
>  - drop reset defines; resets should be handled by clock control
>  - add comments for the above
>  - add comment for NUM_CLKS semantics
> v4:
>  - ensure we have enough space in ASPEED_G6_NUM_CLKS
> v3:
>  - split dt-bindings from clk changes
>  - unify subject prefixes
> v2:
>  - based on feedback from Joel Stanley: avoid adding RESERVED clock
>    definitions, allowing empty entries in aspeed_g6_gates instead.
>
> Jeremy Kerr (6):
>   clk: ast2600: allow empty entries in aspeed_g6_gates
>   dt-bindings: clock: ast2600: Add top-level I3C clock
>   clk: ast2600: Add full configs for I3C clocks
>   dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
>   clk: ast2600: Add comment about combined clock + reset handling
>   dt-bindings: clock: ast2600: Expand comment on reset definitions
>
>  drivers/clk/clk-ast2600.c                 | 67 ++++++++++++++++++++---
>  include/dt-bindings/clock/ast2600-clock.h |  5 +-
>  2 files changed, 60 insertions(+), 12 deletions(-)
>
> --
> 2.39.1
>
