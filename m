Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65980C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C79A613A7
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245064AbhI2OCa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:02:30 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57266
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244902AbhI2OC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 10:02:29 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B074C40279
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924047;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=VM6ehVu/rPc0zGAlc1wjgAWgHIamgnXi5ZPzXzDaTvyPW/WxwKO4EK71NHEEaPynJ
         n/RBrObaFQQAzqd9zQM8cLw4wS9feeKezzky6/4JElEzqMPmsmirVofqTZXknnB8Lz
         9b3WpgryyoiWIeAvtvu73XNt3GPLogacbGX1VP6AYinKXBHKdIV1OiV0ex9sp/D9Dx
         vAcMdN3QZkSV++bFrP0pWIpXArYT5GPVHmujut68g1G6RdoDcM8FK8fYf6pM8zqiHQ
         RR08e29FNlyqCfqjJ7tiSiZfJhQHbMcbidWPn6goWgGMUwF8L/4qeTQmvgDFT+q03a
         V2VpghW1M9tbg==
Received: by mail-lf1-f70.google.com with SMTP id c24-20020ac25318000000b003f257832dfdso2426756lfh.20
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 07:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        b=j7LaRHbFJPp2Xn/Nb9SFaaV4maFue5lCPQdAoNxwYcwENqg9SHSov8KcyZY+8W5G6O
         ls5ckFplZecujslHzuxtJQUGIPhzlKKMYUGOppximcD+4sKWuMVKn+ya9eZYWd0mtMWn
         +52RmbwbQ54zZ/6UYW0aV38Hzxxjarc/hM4qO4nnobQTN4oLuQHq0HQ9aQdIKANA4b7Y
         ttftRtmyD0xnnl4SiE2zWFBGDlV6e8AHbUYuiw7QqU6CMUm06yqCjhIaF2PnRgCGYcsb
         L2NTuvbnWH0NuyuL/BfRNX2KDNHhpuezsvcTDBxjKWhh0Vjet8dPhhOZx9dkaR4xYpVP
         KtPA==
X-Gm-Message-State: AOAM532iUUnr9Qeqh9/ER73EOdV0Nttt0JvKsxWIray1NEBJ7gpORPNP
        VKHeFHg9fWZDGSBfdQa9g+ZOXpD9FprvcIAOShf77IcXG5WZ0e6f78ZeiRwqX8Af0W3u3sChDSZ
        ql+jk+Ap0pT8DOO+XxwU2UX9ksjs/hGA665i3ZA==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61881ljm.474.1632924036578;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKt5l2t81qxHBKi3o/CZN3L1oKUtNTtom/CYUokyE0JkQifqqKnv7EtIY4e4dm53UQ6EHscA==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61835ljm.474.1632924036320;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id t135sm252900lff.203.2021.09.29.07.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:00:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
Date:   Wed, 29 Sep 2021 15:58:49 +0200
Message-Id: <163292392314.29281.7860159491587813094.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Sep 2021 23:56:18 +0000, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> 

Applied, thanks!

[01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
        commit: 6ad4185220e6e3b7ebac7c7a5f55197aedd000da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
