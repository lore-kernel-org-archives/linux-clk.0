Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECC6C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEELaa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjEELa3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:30:29 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234DBC9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:30:28 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-559de1d36a9so23316427b3.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 04:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683286227; x=1685878227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ACUxaYVJKcQREY7wFJGhOWfayaLLaVfA3/FmEYpJGs=;
        b=RxfqYp7yHKS9GWv3vDrdpW6Pd3sZ/w6GQV4t9VOcHxKG3VNv9edkN5H3opANddGyGB
         m/dMras5DXNOKFsKAlEDZ1Uqo+OkKNYnDiyMJtYg/ld3+iCnLnjHmxvBzkZonT+Qklcj
         LyvuMl+RbgT7LGtkGdVSPzUHvZbXFTaijgLJQeuCCp0W1QJAXDqgD76veCY9vmkLxYPZ
         IM/M+3yXtUf6bXu0gpX1jAhqbX1f1pAgG26/28OR0UqMDpVhMwhsax+PnPblX/4rZ1Zl
         oRFn1/xcedMEX4esdT3tdSeylh2FsHab+7UwCXvq3IRSQOX+2LaFlP/m9L/nZps3XWOT
         0eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683286227; x=1685878227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ACUxaYVJKcQREY7wFJGhOWfayaLLaVfA3/FmEYpJGs=;
        b=gQdZti+olQvuwZWNn/TCycYFKhsuwbS6GBP7FT4DQiWoFYvjzgv/IyUH4lDx+bDV9u
         foUoOP9H1otituNlS8OurtJP2sIa1O6Yq+GgVMGSQ/Y8bE1STTzFiFkijOM+BCSe8kCg
         4fulwL8tpp9CaLxsvIzttZon9pbDPbBVlqVXDAaH0NQD5sB6wyUJ5JxvuicuKzWAPJcu
         LylhFieZMEhhkQO7aJddGhWVf8ccJ7sl98THo+csvKQLLMZsFBFerwquC0aSHpYiFKhV
         tF1aQXHvi4IltbhFFN2w8Lly1KRxnhvZ++9lUASO2qVA0sLxktyW9BSzVY9zEqD1yx4B
         8zig==
X-Gm-Message-State: AC+VfDyc22TZ7E1JvUtFmpLa++7Z2sp1y1CvCv/enci9J/Q5VmqxxyEP
        v4fo8YJEwnO0Ac4hHGfL7tLbGLZbWkprSZ9E0rreYg==
X-Google-Smtp-Source: ACHHUZ5ybfZH6/VMf13Mv27JzaWIeq3+NNAmeG8yJOVmJagSObJdajsDI2DJJRxJbP/aaYdkgqEYPVAP8zR8PIj4EfE=
X-Received: by 2002:a81:dd0c:0:b0:55a:ad24:6d01 with SMTP id
 e12-20020a81dd0c000000b0055aad246d01mr1323979ywn.41.1683286227381; Fri, 05
 May 2023 04:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-39-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-39-971d5077e7d2@cerno.tech>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:30:16 +0200
Message-ID: <CACRpkdY-n6NO7AFmAaoJgO0WfqAd52mMcDj0q+WdGY-UwzmuKA@mail.gmail.com>
Subject: Re: [PATCH v4 39/68] clk: versatile: sp810: Add a determine_rate hook
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Pawel Moll <pawel.moll@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 5, 2023 at 1:27=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:

> The Versatile sp810 "timerclken" clock implements a mux with a
> set_parent hook, but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidates to
> trigger that parent change are either the assigned-clock-parents device
> tree property or a call to clk_set_rate(), with determine_rate()
> figuring out which parent is the best suited for a given rate.
>
> This mismatch is probably due to the fact that the driver introduction
> predates the determine_rate introduction, and it was never revised since
> then.
>
> The default, implicit, behaviour that has been in use so far has thus
> been to simply keep using the current parent in all cases. This is also
> the behaviour of the new clk_hw_determine_rate_no_reparent() helper, so
> we can simply use it to make our expectation explicit.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I think Pawel's reply reads as an ACK as well?

Yours,
Linus Walleij
