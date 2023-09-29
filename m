Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C4AE7F154
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 21:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbjI2VvH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 17:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbjI2VvG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 17:51:06 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D0D1BF
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 14:51:03 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a229ac185aso23881057b3.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696024262; x=1696629062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hskw88hLeAFbdhf2MCWNUtrnHOIlmXUQ4ZL1O7T/y0E=;
        b=M2ygEO2xao9bi1LsQy8OB5+84c6hVswvmjJwxCoJHSHOM/pIbKXoenew8o0NL1JgGW
         kxRUK8At0IKdWg2TuKHOrVi9ymb9Eeckmr211X/KOAYMMyfc2BuOyCkWnBdDxVs/c60r
         m9FF3Q0Vz6Q8ZqFB+m5MxoSLqtg0PwzRA9arXKzXvO3KYW3enAZACmKI8MFDldD05HNl
         Qd0ZDPm4RbB2K8CtconqBtn0QE/xeC2UiSp5KDOFODfrbEXgRUs/GU1BCMqnMEguarnd
         4GZn0piAkt8redRma/jLzZza9yszARRsyaXGc/C03Phckc79/4p4X/pbUDWj+zqg6sPk
         RpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024262; x=1696629062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hskw88hLeAFbdhf2MCWNUtrnHOIlmXUQ4ZL1O7T/y0E=;
        b=W4bhJVR/779ftktYoO2Kbk+PhDdT/79RTSGXVdJIKJbq3WSRCV6Y+iwu4fpWkHOF1O
         DwZ4RdXq0KPiUDl6lDvwdd05A3P2tTlWFrjOA0wNv1Tzm0QHawKhBedCPTIr4IYrMqSH
         +y+v5EHp9pa15XW/KhVBpYcNEeI/xlbO7pghnCV0tmKzJ4cYoKETO45WHKg71E/bv8E2
         Ii+WJLpgQeaG3L3oK85XYrx6C4z82FQCn8kl5Buq9sf+wZoxxzV1JUw91KnpCyu01f43
         eoeerlAofGnSvViWyE1AYvH4PCLmIP/NzlzeeRJda3tgth7ugGo8L+7vnLmUazTMVf9y
         qDrQ==
X-Gm-Message-State: AOJu0Yx1VeFJGbL+k3GPKz3FPRtHmU5n4rLHDsLHsxTG5WciAgWu4wwo
        D7E+s7WZg9HWD1WucvxCTGf8qSBTdS246TjQI2oWYA==
X-Google-Smtp-Source: AGHT+IE63fBH+1dNUwDRNH6iqlkLqEfx/+NHRsl/1r9uDgfQ0bqotCuiv4a9l+YPI2jFuA031iE6BeH9RXt0OKpKTI8=
X-Received: by 2002:a0d:dd11:0:b0:59b:e97e:f7ce with SMTP id
 g17-20020a0ddd11000000b0059be97ef7cemr5210736ywe.22.1696024262418; Fri, 29
 Sep 2023 14:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-pxa1908-lkml-v5-0-5aa5a1109c5f@skole.hr> <20230929-pxa1908-lkml-v5-2-5aa5a1109c5f@skole.hr>
In-Reply-To: <20230929-pxa1908-lkml-v5-2-5aa5a1109c5f@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 23:50:51 +0200
Message-ID: <CACRpkdbgbu=1kD=+f83NUZwXZ80-yjGOdH2CR7Lbg4rhubaR0g@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 2/8] clk: mmp: Switch to use struct u32_fract
 instead of custom one
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de, balejk@matfyz.cz,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 29, 2023 at 5:42=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The struct mmp_clk_factor_tbl repeats the generic struct u32_fract.
> Kill the custom one and use the generic one instead.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
