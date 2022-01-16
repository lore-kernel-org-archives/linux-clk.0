Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0639BC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 16 Jan 2022 12:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbiAPMGL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Jan 2022 07:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbiAPMGK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Jan 2022 07:06:10 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B2AC06161C
        for <linux-clk@vger.kernel.org>; Sun, 16 Jan 2022 04:06:10 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so16160206otc.13
        for <linux-clk@vger.kernel.org>; Sun, 16 Jan 2022 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JKr0VhVhkCrnxhwrKxEZLONnSfW5FQCdXEB+dx8FvY=;
        b=ndUhiroZpnTdKQO7j2D83aBoJKHUMDbe5XUno1L/grKwtiT0At6LN8nqxwzRtR4gXM
         YofEm1SkkjAENJbnKq+ZQKnA2Hmc4uJu8vXBc11m9CJpYhkqDuDSQYzrWHEPnGc2NcRu
         5awSzFrm5WgY3U3DdrRLr+sbrWPwUdPJ51bPZZTvmYfOqKZ1WdFq+/F6t8+uS+xpH2iu
         VzbW2TLFTo1Jw0ldbpQrkuDrIpxsgeqYPsGdymvWqRR8ODASjyUhHaOLos8M/Tr9VIsi
         2Rmw9H8HGOiG8z/GzjkJWaUVLW2WgniE08yzhKpHEP01hnQNgS13olQ/73KWsVVKaLCb
         ju/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JKr0VhVhkCrnxhwrKxEZLONnSfW5FQCdXEB+dx8FvY=;
        b=ThuQazJhYWGl8qNJY7qa9KmYA46BRFlgt0GQCXM4sKzSNA+eV3HtHfERZQxuwaEdA3
         5YIf87LUqKdv3ILQgLj8IA6g37w0GSVIDNUwapUeHAz0CmGH8hJRz9FGT6+mVW3/Dp2i
         Q6Apx5QdbVR7qMHNeTdyy7/5Srcw2hrPn/JD9/0bv7YTdjJlYsxrgV09fyoKmiHOwTMH
         HYSgiXN1vRiRfBRab0ANGT0IE6buatN/ZQZNrHjLNIZoapQJsI5IHECwj21VRYyGDAY0
         90Szm5Uje+Qg/2IzwGSEfYsluJVuEj9s9fFrSjD1q2/e48BzrVM8c1hfq3Umvhfjm+ys
         PZMg==
X-Gm-Message-State: AOAM530ywi9W5n4qJ+me1tXlN+Eiw4ZbTQ/stZV8AR7/OeEIYI9OEkxN
        VtP1LvUNNX72oQA7onmw2bk6vd7pl0V3l6UdqW9fvA==
X-Google-Smtp-Source: ABdhPJyZW2DY7OLm4V7AlnhiprfBMzKMRJwLFYA5jTMMRX+gM8CvfOrsMi4mM4UdWZfAdLOYxGGTFjyOrhpoeYpQKkg=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr13235569otg.179.1642334770136;
 Sun, 16 Jan 2022 04:06:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122400epcas5p34363ba8f477b4c273d601d0b64324afa@epcas5p3.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220113121143.22280-12-alim.akhtar@samsung.com>
In-Reply-To: <20220113121143.22280-12-alim.akhtar@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 13:05:57 +0100
Message-ID: <CACRpkdaRshgkwrAgF-zhpsDxjPPC9GTOYXvnXL927GyjDhbu=g@mail.gmail.com>
Subject: Re: [PATCH 11/23] pinctrl: samsung: add FSD SoC specific data
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        catalin.marinas@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Ajay Kumar <ajaykumar.rs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 13, 2022 at 1:24 PM Alim Akhtar <alim.akhtar@samsung.com> wrote:

> This patch adds Tesla FSD SoC specific data to enable pinctrl.
> FSD SoC has similar pinctrl controller as found in the most
> samsung/exynos SoCs.
>
> Cc: linux-fsd@tesla.com
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Looks good to me once Krysztof is happy with this I expect to get the
pin control portions from him by a pull request.
FWIW
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
