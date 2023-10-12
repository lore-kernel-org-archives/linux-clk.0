Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F906CDB484
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 06:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjJLGCR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 02:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbjJLGCQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 02:02:16 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272A4C4
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 23:02:14 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-27d113508bfso472976a91.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697090533; x=1697695333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=N4KcRbJs8l6nyaLL8yi+0IJfZPXFOXcBvjQ2+aKm1qddpB1mubaj54GvVuJ3vcnFYg
         AbLjPHPdnKgR1qyhxjNc61FVwMz6OeLlrl2Tlk1cylBMIlJMm+XkKXvr+UN2V9e1JGXL
         0BAbE1ISJGw6Cggd3YhocH7905ITOsap0M+zJZ4lRQQMroE9rLlrv3m1GGhApUTe4gVR
         3nyMyH51zI3dxBJyWi9EQoRko1pp/hVxYUs5b4+EEGmghRaW6u7g4mKLCwTKfXtlUZlc
         oXXzkogwJr4wINohAPw5ovpvUHk40USjhJI8XmGbmU7dTU7/GFCrCURc+VJmrg1T4qff
         4juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090533; x=1697695333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=G3g3ehJ2UbYl0baxs/VgdaBnPSaegyMkYxABp7xlGTXveYt8dR7wF8k3TcaNR8Sptb
         zC8pzYVgu6tVx2abZ3x3um0/8JlW05OcrN9RWfZ2kDdqRfXd3D4Cz0RpTdYybD4OTVR4
         A0K3zYNeoWopbBC4mLwOj1MLXAyrylXhrx8qDGwm601eu/zNZd7AQq5wZhdn8sFh9fMF
         hE8tqzqgFvGHlW7Z2P0HzJTU5Z2UddUrD+Dz9wmRvVd+21gV6+TFw+1lPWT7UYl1PhJO
         IJYtAsmwTuipX5WwckTLq7yeMLbDQveQPsZLjQkrV5zbS3ZcrMuqPsJ+ys265uA6YHPJ
         DyDA==
X-Gm-Message-State: AOJu0YwpwgOzQBikpSs7UMEsKcSUO7vNdcqXlNp4S72mb8up2IWoPR4t
        0JHrepx+ygVFhCsl+W0EElNLH13TIZ7u3+L8CWSK5A==
X-Google-Smtp-Source: AGHT+IFdFgVv/LOVxR9G3F6/MvkmcUviTbxuwDLT13rcSWpGFB1soPlPNHvMCUGDirrBkuMLzVO+GFyrHni85w0FE0g=
X-Received: by 2002:a17:90a:9106:b0:261:685:95b6 with SMTP id
 k6-20020a17090a910600b00261068595b6mr22023938pjo.13.1697090533614; Wed, 11
 Oct 2023 23:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-21-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-21-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 01:02:02 -0500
Message-ID: <CAPLW+4n-n7POjbi0Fvtdp9kM8tiyuRb5vdmu6Z9Y4fNhtLL4Dg@mail.gmail.com>
Subject: Re: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add maintainers entry for the Google tensor SoC based
> platforms.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..149a0c364309 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8836,6 +8836,16 @@ S:       Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
>  F:     drivers/firmware/google/
>
> +GOOGLE TENSOR SoC SUPPORT
> +M:     Peter Griffin <peter.griffin@linaro.org>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +F:     arch/arm64/boot/dts/google/
> +F:     drivers/clk/samsung/clk-gs101.c
> +F:     include/dt-bindings/clock/google,clk-gs101.h
> +
>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.42.0.655.g421f12c284-goog
>
