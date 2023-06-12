Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23F0C7EE25
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236919AbjFLKEP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbjFLKCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:02:23 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B2F19AA
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:46:22 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so7338353a12.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563181; x=1689155181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnqmA+7ejKEoumRQXbD2dFEOAECIRvpjBrpsIvzDcXE=;
        b=bOqMAWA6FUl3Hh/1bSBMJUcM9sm069+DjKDb1oLjnPvY5UgqDC1il+j0+f+xDL9AgZ
         Aa3KEkhRPwnAnoEZqbgeeE2NNX86t3CLIVE0CiRC9idETncR41HJTM4OuTE135G7Dowa
         X0h157eD9Xxt3VxABSxrtlWe8wvSsk7Aezp53lImnMpy0to9SRH0KxXKZ6YN1sOF6MvG
         ScopxONIbmAV4eynWU/TrIA/+nQLS4uDqMYHfOqgjHeml45Mw25Jc0EcgxPnCnU2TP5j
         8aCt3FKRV2E7LLUlhQDWwFVjUrOnOXTeHU3zeeWGbr56bMGPIGVJuLezWpjNwwWbZNbf
         KnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563181; x=1689155181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnqmA+7ejKEoumRQXbD2dFEOAECIRvpjBrpsIvzDcXE=;
        b=cZDoPs1ofpRxMNtiXB2n7JAL5O7Tgkr9BBTXVMjuOp6nLNRFvZsmfkKTMjCoE3BCqP
         XJJd2LR+cLcRMVKbhHqcKpdHIYj/YyNFcEl5XwDZ1eIGi18EGJnbjg6dPsdscbecbhj7
         1C88rJFCFJo4yMthiME7quo2MmJp34o7xKSQJ7f7mZhOwGOsbrU/+I0vGZ2rFRhecAIo
         LlW6KzdulgYtA5VzT5Fd0Jzd2GIaK48UhNHTWqTMC9YYJOh3ZiiTvLMBuAe1dWgFzhj2
         +KqA7wx38WGbrjUArwADQzYw0++zO3IHqYyVIIzsqJFy+1pbwbARkeVOmwY1++Q9LJcM
         N46w==
X-Gm-Message-State: AC+VfDwy7dEzqVJh3B/Rciyaa3/+TnTuKvZZcLhofU0+irMk8yzMtHv4
        ouBGAHFf+LZ2ELxIosisyngxmA==
X-Google-Smtp-Source: ACHHUZ7gljOgj8UwPzUL30K6OmKyd1MUnGAknF36UNkZCc2YhbA7YGfJVoCe5QV3YNo7/U5O9ILjNg==
X-Received: by 2002:a17:907:9349:b0:977:eed1:4510 with SMTP id bv9-20020a170907934900b00977eed14510mr9264925ejc.21.1686563180852;
        Mon, 12 Jun 2023 02:46:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id kd14-20020a17090798ce00b00965a0f30fbfsm4968696ejc.186.2023.06.12.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:46:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: add CONFIG_OF dependency
Date:   Mon, 12 Jun 2023 11:46:17 +0200
Message-Id: <168656316761.117073.3267717876811541520.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609081559.915867-1-arnd@kernel.org>
References: <20230609081559.915867-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri, 09 Jun 2023 10:15:49 +0200, Arnd Bergmann wrote:
> When CONFIG_OF is disabled, build testing on x86 runs into a couple of
> objtool warnings from functions that unconditionally call panic() but
> have no __noreturn annotation:
> 
> vmlinux.o: warning: objtool: exynos3250_cmu_isp_probe+0x17: samsung_cmu_register_one() is missing a __noreturn annotation
> vmlinux.o: warning: objtool: exynos7885_cmu_probe+0x16: exynos_arm64_register_cmu() is missing a __noreturn annotation
> vmlinux.o: warning: objtool: exynos850_cmu_probe+0x16: exynos_arm64_register_cmu() is missing a __noreturn annotation
> vmlinux.o: warning: objtool: exynosautov9_cmu_probe+0x16: exynos_arm64_register_cmu() is missing a __noreturn annotation
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: add CONFIG_OF dependency
      https://git.kernel.org/krzk/linux/c/2aac2d8b95923203e683c60124877ab434133679

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
