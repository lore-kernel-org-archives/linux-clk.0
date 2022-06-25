Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3ACC43334
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 23:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbiFYXGs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 19:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbiFYXGq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 19:06:46 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8248A14095
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 16:06:43 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3177f4ce3e2so54948297b3.5
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 16:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+pHW+8BgeYr33HXAIkqALey4HRl25+7F+mqKkIF73lI=;
        b=OyZJ8EhnQ3k/JzGhjvLf/pMPtpcd9SZRT3ncEi3wzhHrGQ1lSMjKRUpTbAiq5AvxLQ
         /VflYEpdayhpXR+MVutbT/z9jK9CmZu1myzj73D85E2WqmdoAYOu3iUxN2Z3XVmoIPWZ
         T7Pe7XhNljqA1UwOGbTo3OgRV9nm1DiGHtbCx95Q4kADDu6RfYLai/Fu/l+/skVEJKoO
         fuUfAWdBukc5hdhFe8pubZC6qTz1reuvHc5YbdbUgVP+dWavsAVSYzKsYOcecJLwx2Ah
         qDApmCg5bJS/05fUq3BDhHDps4j0b7lRoxVl1Q1j77vRGvFe/Qa2wlgurSo+7rJ69+Bn
         EajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+pHW+8BgeYr33HXAIkqALey4HRl25+7F+mqKkIF73lI=;
        b=arlwpdTTC+RIx4aihH7AvP+lc3Q4Wd0pRDGxP7UYHu7O5EHlhuE9JtpPEx6UwDPRGH
         o4B9m1OW+8cedCGO+U+61Hyu3kIWcPPPz/UNxKfesa9HEDb9B893jvhKQdPfP6/Yu1i1
         RIZ7HIdrbl2CjU6aWpLrM2E4L7uSXmx9Zc6H+S6hU1HESBRB5TeyDnHY5oUnefPXwsHN
         pLTZq/KgevI3SrrLqpDan+oVjsc/uIgp9nHdv6g9E4BcLgCCc4D8rMjyqwXNVRUwM7V/
         BFKsTZryrVSK7i+DPcRYas/96fRqA9h1FvKW1NFe7eB1XhaQY650PgDWC0WOeiaIDKwR
         BHdg==
X-Gm-Message-State: AJIora/Flhyu7PZCnRJ4sBI5w9GenFFLPMm2oz1TIMY146Jv4RBiJMNm
        ylbJmgoRxo1Y9D9BIykxWbUzofn4TSkLEbX9cBbPHA==
X-Google-Smtp-Source: AGRyM1sPLO6FrhlQmmjU07VEXOAI6hRlCO21a4yWfilP3YXKpw0ZTG2xPM+drXuU5w/0zlYyo3JtFUnBRs1lEQUzBS8=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr6883637ywe.448.1656198402820; Sat, 25
 Jun 2022 16:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220615082940.3960612-1-windhl@126.com>
In-Reply-To: <20220615082940.3960612-1-windhl@126.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 01:06:31 +0200
Message-ID: <CACRpkdaLPcVHUQL1d7e797vN_WRi0kbnLtfTa9Fnp1id3anjfw@mail.gmail.com>
Subject: Re: [PATCH] drivers: clk: Add missing of_node_put() in clk-nomadik.c
To:     heliang <windhl@126.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 15, 2022 at 10:30 AM heliang <windhl@126.com> wrote:

> In nomadik_src_init, of_find_matching_node() return a node pointer
> with refcount incremented. We should use of_node_put() in fail path
> or when it is not used anymore.
>
> Signed-off-by: heliang <windhl@126.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
