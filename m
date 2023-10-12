Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AE0CDB482
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 06:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377237AbjJLGQF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 02:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376631AbjJLGQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 02:16:05 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34323A9
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 23:16:03 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5809d5fe7f7so453940a12.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091362; x=1697696162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=EVQ4AJbqgyOp6EuXe/x8YNXAVfHhR/SuDiGt5v/XDOn8SnUSWZtVRLhw2PjYcfLRzq
         vqw9bs5muSn5usSNIPnBXK+fZJm2Y83sc/SwkhPvv8RomE1kuvgSzCx6AGEiWJt0H2/+
         zcJFao1WbZV8DYqHDlWS0JQxDfdSTyvnWTd6QtMeADnq9WQrfZpx+La4NiLUE6Uq97Xb
         8KSggRFbdqq84OR4jx5INxap15k7RpbgpNLB2WwGkeerF3UGjja6Bl8skrz4nXyZXA6V
         ttUrYXqK+nY8cHUSAO8o+Pf0/zGLl/QhzYzVk6PSHRfKqUDRrqHx+tJbxuhy6KJesqmI
         7JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091362; x=1697696162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=L2mr3c20E+bziVtvaEgHs1P/eVEDZATQgidrjEDZBz8gqWHjPZJTlRr+mbHQ0j86IQ
         FZbpu4l3zX/LfDojk5+VtWRwKRpH1M78M6TwMpEue5ITeB+NkdT4N4k35bPqYshKP9WR
         zA3OOrjV74FeAFEdbFtAxydlr47QsMZuW6XwXqG3rB4rDS/f3nb5xzwwV0n5J39EM0vG
         U7uHsZF9hf4ggTHe0rVEluhYRrqRXBw+hqmbBmmk8CXIJLL9F7spw3S95un9Gl74lOrV
         5Ux3PMfVWuDcwKGflzmX2UAJHsTUy8Bl2ACzWC5DDquZYprYZ1DB1LgL3NrCaI16ejVw
         gNAA==
X-Gm-Message-State: AOJu0YyHx5c3VFNJ0Jf6LfVazVXXl9oAV4zMDKK56UzXZnR8l1uAPP2b
        nAreI8HPrFF2sErR6zr0oJJsTVMYwJvEb5YuOpTx8g==
X-Google-Smtp-Source: AGHT+IFVQ9Wikpi2B+8rv5uas0wyJQjBlEO1BbvS/6y/xJD4K3tybOua8AIGJVAe27mvKcnQC5VVeozSwZ6aMTqh9LI=
X-Received: by 2002:a17:90a:488e:b0:27d:233e:b4f6 with SMTP id
 b14-20020a17090a488e00b0027d233eb4f6mr345442pjh.45.1697091362667; Wed, 11 Oct
 2023 23:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-20-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 01:15:51 -0500
Message-ID: <CAPLW+4mAeRQBZp1HKWDKLHV1cYafksjijzQJMGhMsz+e0cxhOg@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
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
> Add the Google Tensor SoC to the arm64 defconfig
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=3Dy
>  CONFIG_ARCH_BRCMSTB=3Dy
>  CONFIG_ARCH_BERLIN=3Dy
>  CONFIG_ARCH_EXYNOS=3Dy
> +CONFIG_ARCH_GOOGLE_TENSOR=3Dy
>  CONFIG_ARCH_SPARX5=3Dy
>  CONFIG_ARCH_K3=3Dy
>  CONFIG_ARCH_LG1K=3Dy
> --
> 2.42.0.655.g421f12c284-goog
>
