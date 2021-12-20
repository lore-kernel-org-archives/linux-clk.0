Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9AFC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhLTJh2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:37:28 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55468
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229725AbhLTJh1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:37:27 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB16B4005A
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993046;
        bh=EtKf6IRMM8iueW0p5q6XbiNdaopaG6efPQ7iJfoChDU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=cvmPgRzdlzqvN4dpcfu/Iicq9PoE21x/LF52FkzuXVroVCR/TD0n6/0Sh7ImiCdTI
         Hpc/q3qpK2TpSGPffW4hBc40z3qeBNTX5mAEosAEz5mzUhgeHfgJaQzFd4y2Hvc87+
         VaboRXKyBgYfx4keZ8AuN5GV0piEdlmXEv2o6UTL4NwDA+TwcHeHqeygdNBfMumxOo
         yNrIRcW8VZSzxGABQ/hy7E0fr+G9XWC3ZuAE4UsnF668Fkb/fE33WBWLLa4O+oyLif
         ag5nVIsxGSGMZbdaOcUByxL7pc9ScTVGdReb3OlmI2MOkVmnVEKhWaMQQfe01eyD/q
         J7WhYqMA2pjXQ==
Received: by mail-lf1-f69.google.com with SMTP id m5-20020a05651202e500b00425baf04eacso1570905lfq.9
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtKf6IRMM8iueW0p5q6XbiNdaopaG6efPQ7iJfoChDU=;
        b=lUuEZGHUAz4uQNjUQcrqV/X4gDGTdp2V6XFIEQubgOhwIob14fpdkAmjCAgNThu/q2
         HQqNZBQwV+zxFcQsKpsHSn8Es8qwZC8YZETEiTM+dA2nMc93cHXG/QuD3F+jqr18tMX8
         D2JsxWmB6EWPq6vYi0odCQOvxanJvXmJELao3KzjekiQeUjwDtWBxQeGaZ0+puNkINOB
         sSQ/2ZZ+DO8m7iLl3fiIeS7LpfzpO5asZsgXrww4C8CWCQWwAJA2uTUzQdnpjE/5qUah
         sAPQHYKeeYXd/3pK4vp9ENeiN0ICMGyjB2QklsEFtaotA35DyI08qTpyIjhoH/57BotA
         YCHQ==
X-Gm-Message-State: AOAM533/Biuf6JgprCogGO16doMS/yfaMduc/EStC0TNx3uSb2Xcekgn
        +nMS2YJx0qx2xwjLXanJ+WX6MYGTXRfJpLccsoVGUYbQHH23ZFOV9vFm9K7A1aydxY38w9l4mft
        BMH9AV7+dFZgL5leSuQnkDYO2Yz8RBgDsaMgIOQ==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr14016806ljf.497.1639993046243;
        Mon, 20 Dec 2021 01:37:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIkwvFqU3wYWHIgpVZw9Z5JT9qVuDKhFv5H8dQQSdjuibUG61Vez4uKkxqPYFYPyzR9oHMVA==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr14016791ljf.497.1639993046094;
        Mon, 20 Dec 2021 01:37:26 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h15sm93443lfu.103.2021.12.20.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 01:37:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: (subset) [PATCH v4 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Mon, 20 Dec 2021 10:37:20 +0100
Message-Id: <163999303689.14127.13377459150089115698.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217161549.24836-6-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org> <20211217161549.24836-6-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Dec 2021 18:15:47 +0200, Sam Protsenko wrote:
> All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
> except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
> block correspondingly.
> 
> 

Applied, thanks!

[5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
      commit: 51b1a5729469cef57a3c97aa014aa6e1d2b8d864

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
