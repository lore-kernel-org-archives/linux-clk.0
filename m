Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE7FC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 08:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 640A123976
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 08:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbhAUIcZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 03:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbhAUIcV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 03:32:21 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7339C061757
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 00:31:36 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x23so1517058lji.7
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wkUzS22l3yT4wvob1mqKHkY+gLej+PQS8WtEPboZD/g=;
        b=Uq0P5RZInuXnRMF1iS9apD3S7TtaJGz8oezi/WVpjyYghj5/6LGpc4q+b/a5i08bAe
         HOQyg19CRzKSpqItjZhM2lu+2/8d2y4QAyO8Ua9gqZIBeAerTXNmO89cHM7KHB9bQ3vy
         V5oa8w8zyxM+czY/gT8zef1IP0sV1bY82tUi/sYU1if+dtshG46fuFW0evdQDno74LSz
         AWZ4sPuzrZEl56+eIJzA+YWN9R1XudeSRr9r+L7G2zMZq2dc1DEiYqb6IEjwn7Vh/stw
         KTNiV0gMMTtsqZ5PqHkI1Rahz8lICSizTh+b7yexnUkfwQ4Vyse+Dg9Xnqium3VEE5C5
         3w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkUzS22l3yT4wvob1mqKHkY+gLej+PQS8WtEPboZD/g=;
        b=BQC4V1SjWQuSbkHiFdmgFUV6zREcxyRDxnzQz1dFM6Tu8KtjKh0riDPvlCbk/+lKYE
         GtcsZ8BjFRrD7A7q/uBz71CdHkObLrrSsV3UaABUO4U7ubc0HXbkBMvW5+JAEZee9anH
         PDcTFvPoFWou5nmOcK0kXPbmBehKLqgfVrbL8g1K64g/8kgeIG1VHsko662IEWJFIdZ9
         +rTOW4SlNl/qYeFl7dR9Lasc5XVp89AJU+st3YqhITdupfi9lzRixqHfgUbu4b5a1oDu
         xSXGyt5RTo628/eXtQpiRrVSUNZqXe10r8wydBmNeQPqnYAea8xVqMetimOvCwwfdl22
         StQQ==
X-Gm-Message-State: AOAM5311ZE40Wp2Zib4rARs3zvLYFLUbavEuJhUHVcwDm13FVoWzlCTG
        9sXdcW/TvJ4jPzguDtXvP92R+Vc4/I8IzjQA1grMKw==
X-Google-Smtp-Source: ABdhPJyfv+B8zbe3ES1yKRt6eO2ubbuNq2b3jKpVOgLF7fkljnuiReGloInJLZ7v+86/vskCjlMHQvE9I9e/x4JPg0Y=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr6079256ljl.467.1611217895269;
 Thu, 21 Jan 2021 00:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-20-lee.jones@linaro.org>
In-Reply-To: <20210120093040.1719407-20-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 09:31:24 +0100
Message-ID: <CACRpkda-wp1Ja9QCJv-k=zxKd471ac_tp1GGepmO0jdPa9do_Q@mail.gmail.com>
Subject: Re: [PATCH 19/20] clk: versatile: clk-icst: Fix worthy struct
 documentation block
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 20, 2021 at 10:31 AM Lee Jones <lee.jones@linaro.org> wrote:

> Also demote non-worthy header to standard comment block.
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'map' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'vcoreg_off' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or member 'lockreg_off' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:435: warning: cannot understand function prototype: 'const struct icst_params icst525_apcp_cm_params = '
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
