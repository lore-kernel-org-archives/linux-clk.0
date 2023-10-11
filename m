Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A9DCDB46E
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 23:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbjJKXNm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 19:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbjJKXNk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 19:13:40 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDEFAF
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 16:13:38 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27d153c7f00so252275a91.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697066018; x=1697670818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=GPbQZJE9q9mKJ25cesAtcP7x0E7ZClY4Plh3b+GhSmZA7zRrisXrH87uAJLqONC/Pl
         8R/ogLAMAmQQb0aLK+Dgj0E3jt6NazJkBXJWYjX4DRakGTjWicTZM9T9KS8a59wm2QB7
         SCz6o5xcW8q5MrBUpo16ixjQhvth8Yu/B+wjbuIicHMP0PEKxYOtv7Tni0JILan+Nb73
         IOSmByv6t4z0YWz4/4YVYVwjL9TCfTEZy6ICsM5r9LpwZKpWLjMOezwhP5hPus1SgJlZ
         DmYAvJi7zSY9+qs/aDfZ8sL43XNhhRTS2B17760kfv28Vghy2u2Xexc3OBt/FE1mVeZs
         rcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066018; x=1697670818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=j/wHcD6Hy59rKbUzlIdIqRp6iTaj56ArYQsXiDA5vmMMwCzna2zUGhyfOXxGK3AcTJ
         XkjiZGrObtzQFEVXvM7BQQeRvevnZMB6MSgRs86UBBBwzX+EkpVvhnpO4EgDANCvBk7C
         GsHGk8iEIv7N8b7SvCbEQ1P3s53SmxPuy7w9IkUKush0eBfzIkZ+oOpL/wna3w9FEwos
         u0I2jR9OJqZCFTWrHN2t03z3t5RJoj8T6E9sYgulpS9F+ColxJLLtP6ewXkbN4HvtKvc
         HV2AugeeAzDvmOP+hyKGjhxlYppUFn4e4Tfc8gdUYhZx5GT+4Q4U2uxGps48JYpmZ1FC
         NZ9Q==
X-Gm-Message-State: AOJu0YykKPlT7U43OJ0nMraSa6FHHroodBLG4RPBOHueTPSXUBAjsH26
        M+nmR4or08cvUEe/oPV5UquG2tIFKfV6szm8R8h2iw==
X-Google-Smtp-Source: AGHT+IEld7S7h6gZ3fWO8KAIshEdLEI80q2ynQn1SW+nlZmhOV1fXDdbKEzZtX6rH7IBM+FnyFZOxN8YxMRhPqYZWog=
X-Received: by 2002:a17:90b:3891:b0:274:862f:3439 with SMTP id
 mu17-20020a17090b389100b00274862f3439mr19558004pjb.13.1697066018140; Wed, 11
 Oct 2023 16:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-9-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-9-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:13:27 -0500
Message-ID: <CAPLW+4nMKtgdGrjijWpXOCxaYWN5sBVVw9boYk9UMmHLnV3pAA@mail.gmail.com>
Subject: Re: [PATCH v3 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
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
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 8bd88d5cbb11..6e807b1b4d8c 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - apple,s5l-uart
>            - axis,artpec8-uart
> +          - google,gs101-uart
>            - samsung,s3c2410-uart
>            - samsung,s3c2412-uart
>            - samsung,s3c2440-uart
> --
> 2.42.0.655.g421f12c284-goog
>
