Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6011AC61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 14:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjCFOth (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjCFOtg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:49:36 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4462E0D3
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 06:49:14 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o12so39559378edb.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 06:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW5ffN73HQ58YkV8cenV/bm5sEW0jetRsKJRWVR2v1Q=;
        b=Aqw8aQZAqw41YUibYM5B1DwJKZ2fLsdNk2HP7leWJ5ihp0jWXm90aYCWpLKVl74SMu
         kPRM4j7gvphfvx17GNQ4PfP7p9Q/ym7SJUYq9Eu/3UwtS+4DzVENLQT5pneg1oOKW0lq
         S9oacZ2zgBXN0502iLP+IRpC2ngF+ZmqHlNyH+URIfnklkrbyQ/4bo92nYEt9M0jyEEx
         gtENQqhvvIoVun84CxjQ4ZWxZQoU0eZdqiVb3rcgLLFCy3nuYqzUSVFQFCGaGRpcRM3y
         yyhT5cFW2BkrEYz28YSaC5T6iFS7CD0G+1auAesNJE4zurieVK7Of340Sp5lHnUShiZA
         1IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW5ffN73HQ58YkV8cenV/bm5sEW0jetRsKJRWVR2v1Q=;
        b=K0jyx60VA8WEIoap2JiGMEh6rrlyF1lSZGkaIqS9j9BHN/iE+bZkyOq39IfqGC1kwm
         xCKH2LaOBKPZXYT+1pMLQyRLM+vebQoQcRwZRUnC4FEXtc175U9aNNUOxoRJ+O0BRjB+
         vlZS0+9UQyOc29S5E7gV6Kt3IW5al99m7fMj7axsV6/+E5/JDCTZmU0s17Gf9TRNumm7
         Et5iFA3uYdxhU3j9sNBrw8gzZY5F3wIxmA4h0wUPzW2do/q4SjIzr7ZLQXyjV3UnEUVu
         yygfV9PX5xOTVsGvGhjOio7sDSOsd0cd3nSGs9BSlWAVyqbtKA1BCaWRzGfTePF0YmUk
         CGJg==
X-Gm-Message-State: AO0yUKXBMcGMoP4fBxdyBMC8TW54G5vKxrQRitbVHeO47KRRqYYTOS4O
        BVSJs6Yaobl/UgodrYel65mf8g==
X-Google-Smtp-Source: AK7set/NPFuNMfIiX4gyjSrNCiUCPDvK+FTM4lKQNt1KiqBTapHYd7b70utIEyWVvD1J0chS7nChwA==
X-Received: by 2002:a05:6402:205c:b0:4cf:350e:344c with SMTP id bc28-20020a056402205c00b004cf350e344cmr9265464edb.28.1678114152707;
        Mon, 06 Mar 2023 06:49:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id j22-20020a1709066dd600b008e6bd130b14sm4706760ejt.64.2023.03.06.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:49:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-clk@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/6] clk: samsung: Don't pass reg_base to samsung_clk_register_pll()
Date:   Mon,  6 Mar 2023 15:49:07 +0100
Message-Id: <167811414390.14916.7330787578413043996.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223041938.22732-2-semen.protsenko@linaro.org>
References: <20230223041938.22732-1-semen.protsenko@linaro.org> <20230223041938.22732-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Feb 2023 22:19:33 -0600, Sam Protsenko wrote:
> Base address can be derived from context structure. Remove `base'
> argument from samsung_clk_register_pll() and use `ctx->reg_base'
> instead, as it's done in other clock registering functions.
> 
> No functional change.
> 
> 
> [...]

Applied, thanks!

[1/6] clk: samsung: Don't pass reg_base to samsung_clk_register_pll()
      https://git.kernel.org/krzk/linux/c/dc079b9e568ba334a3f0b313a42852e45be4f4ec

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
