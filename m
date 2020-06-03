Return-Path: <SRS0=Wk/U=7Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA27C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 12:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 844F6207D0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 12:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qK7DsENy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgFCMJA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jun 2020 08:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgFCMI7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 08:08:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCA2C08C5C0
        for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2020 05:08:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y11so749527ljm.9
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2020 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbNWM2GicsmvTzy7/hoPH7ONBXbhEoJa3FcNIjZTUyY=;
        b=qK7DsENyK6UqQXGLuE1n2/G8Rk91mKOnFA8S1RefeJ7byx2qJmzW+/RMVvcy72zWDC
         JAuLlflMP0/QlUD0ahZV4IH8j3Vgg+8XlI1BghTduMEwtQaJE7Xn2vGs74iDNgocAwUr
         9+VlCzMsy2mIIYKE6wRHheZwMB3zL/VX8xFPgYZmVw9BF5YssuBMpuhaEElprIWCFZmn
         PCYRhJOWmG2h3ExpYBirXMjXPxZXTmQSjRPid6VFvmy3Zro74EsQerBLWrPyeB5+AGnQ
         P5IQL/TsF1QJ7swSoPi/AXCDGlOc77cqTALLiYF4qzmEWNwSuewaIlG4WZ/MFqtya7CF
         n5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbNWM2GicsmvTzy7/hoPH7ONBXbhEoJa3FcNIjZTUyY=;
        b=ia7MMwUcjG1V4BVDfXyrSB4du7dxbSnHg+Yt9Ptj7Z5lmkec5tB+CGgntdT8RRrNq6
         I4428vV9ehm5NxUdTEn1XcH3il/Qq62dH7Lg1qLOXHJTLvDlTfsX6PoNCRXUBRbGohA3
         +mB0jIG85w6OPOOsoJArBqfsfmtcXhYjNwwyX2XZuscr4XFlLJ77bi/rrFwuFZJxez07
         5pLGCQlx6uLlfXRs+1lysKnDE1Ys6XCoslo0Ib+/okdLOqBxR/uT4y8lL7sVIIPsBjIc
         Je+b0b9k4xzXtMN3xu5LEDltcrY8QFZ0+uEtH2VcTpfOmr3j8+zaF9l91lBGtO3tZNXg
         hdCA==
X-Gm-Message-State: AOAM530XmaKI0+KevAQqtYIuyw3Gtz8jjT4+1jEqrJHi+oAS8bG7ofln
        bYBKG54xGEXlqRWxh1Agx3YAi6wJHc5i4u5M+KpXcA==
X-Google-Smtp-Source: ABdhPJyxFttCntQ1H0DPVyaXkzNmNYhZ6gFQBX3TG8xG4JyArEos6My1BY/4oisPH656NYPmt3EXNDBzPIpjUmxy/GM=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr2023705ljc.100.1591186137986;
 Wed, 03 Jun 2020 05:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200328184958.16134-1-festevam@gmail.com>
In-Reply-To: <20200328184958.16134-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:08:47 +0200
Message-ID: <CACRpkdaWggOf1J-ueHKkY0eW1gndVXF0sZTZDS6WjyprOueGWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: dac: syscon-icst: Remove unneeded
 unit name
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Mar 28, 2020 at 7:50 PM Fabio Estevam <festevam@gmail.com> wrote:

> The following warnings are seen with 'make dt_binding_check':
>
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_vs_reg): /example-0/clock@00: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_format): /example-0/clock@00: unit name should not have leading 0s
>
> Fix them by removing the unneeded clock unit name.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
