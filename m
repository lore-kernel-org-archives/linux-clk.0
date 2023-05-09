Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C8FC7EE23
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 18:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbjEISKb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 14:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbjEISKC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 14:10:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A48F4EEC
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 11:09:54 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso12040002a12.3
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655793; x=1686247793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykc+NJpWYwnllZDoX+4ReA3Lc/adaxGurWdFgmTtwT0=;
        b=B6Yv33IStPyelhF8OdQygmYARdIpTY5gvloVmpFKVFLdmY36IHBVaIqGzzC5awUkeN
         /IkIB9KZxwsd3X5wqYzNtkm/8WuidZ39KahyAroxdgonmgJprWHZLx06lUeOSWhvTLFX
         2nEPns/1AE9vYOfufWTnTHwL+KDXRF2nWToaeiaBH0YaCCBXcmTHk1ia03YOuMN+qh4g
         nQfU874wLJOcTPMvwggyb2PLML1Z8y+KxRvxqvm//kJzsW37Ry7j4oBBmdDVjjbTrUKc
         OrzU7aKP6lTL7mwQgjZajKzB4caL1HBVIphp38ZfnuM9BngPb6E/t82gJV6hu0H2NKef
         S7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655793; x=1686247793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ykc+NJpWYwnllZDoX+4ReA3Lc/adaxGurWdFgmTtwT0=;
        b=C5meiySUDdtvQ1DWgwk0GTC8QXd1uF4qBHR0utEYsvt+96z7Fufz99UkBC+GMHjNTS
         +wk+Tv1Mz7J0T8FSRWHsoiSMY1nCDAPrKM6ztj6lhE3LxchMUMiv6Be2p7IR0E3SSrg4
         cxnQLX5RgO9Z3K7r3+cX3SbmSFg2F1JdPzV6cVmd4/oP9SDli2GmzUDfyLtLPT5FG1CF
         tAn+AnxLo8Tm677tMQMC7WQxkTBT+iEAOmX1mY5hc7yMDzzcVdPxNI1qY+2SqxGySIcn
         7ALl6rrCfjAZOj703yXQZdOIvl5ToKtODZYuijV9rI3SK5fwMUsSF1fT7OD61mUcJ2Xg
         HsIA==
X-Gm-Message-State: AC+VfDzTZqNn6tru+Y0mJ2oEQjAzwKXGiV5eGNqhBNvTw3qFmFjoJ8Es
        W+bbSZHk9Et6ZdV5SbyBnJdVBg==
X-Google-Smtp-Source: ACHHUZ4K/EPxDUp5cN5i+MrYJtRHUxzNOUDZ9RANSIgFtgZnmxcaiqDZslD35IsjyHMjpIBOsiCHEQ==
X-Received: by 2002:aa7:cb87:0:b0:50b:c8b1:574b with SMTP id r7-20020aa7cb87000000b0050bc8b1574bmr10792916edt.3.1683655792838;
        Tue, 09 May 2023 11:09:52 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 10/13] ARM: dts: Re-introduce Exynos4212 DTSI
Date:   Tue,  9 May 2023 20:09:35 +0200
Message-Id: <168365575566.242810.2057690967168679631.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-11-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-11-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 01 May 2023 21:55:22 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit bca9085e0ae93253bc93ce218c85ac7d7e7f1831.
> 
> 
> [...]

Applied, thanks!

[10/13] ARM: dts: Re-introduce Exynos4212 DTSI
        https://git.kernel.org/krzk/linux/c/41bf1a9f9fbdec5dd1ba69fe26157f42e44dcee4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
