Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29B9C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  1 Feb 2022 08:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiBAIRO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Feb 2022 03:17:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56640
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230491AbiBAIRN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Feb 2022 03:17:13 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D1C8B3F1E9
        for <linux-clk@vger.kernel.org>; Tue,  1 Feb 2022 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643703432;
        bh=MItxx70iFew0YeZnNA7KR41aDD2ctvR1pwd1gDOLhyA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Tm1S1RX3m60vqmp22giAGAedklWaPt52ITGPg36DVgtAvr0wwbSslsdP05MimRfj8
         alVzG47Rpqy2kFnyAh624KkOnVaqH3wZ6gJ+zMRzFT3IFwsPxzthFJQZmJboSyD3a/
         DqO4MburIeBAshMEuJ1W1gpVxcQ83pNyCb+GXASAKxO4S5ze25PtpIFSznKRgSp1/L
         AAQjUzrpKKOCegaCRtuIjL3bflhViz+oEk5vNKrXYuZy7zJX97XfSQaZt11L/kajsw
         Pt5xCu/JSNaFuw5UBETGqMEogpa8F9rqWEWRHr+dIqAb/CSsAv9VTNei1yW52fl5Ey
         0kuahVoUdn4Dg==
Received: by mail-ed1-f69.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso8251957edt.20
        for <linux-clk@vger.kernel.org>; Tue, 01 Feb 2022 00:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MItxx70iFew0YeZnNA7KR41aDD2ctvR1pwd1gDOLhyA=;
        b=q+cVjPdIo5X3peCDOi9vd1TrUe21URg7DSRK1jtr1mkXr7zeOpvmlOTqUb+9ppmsaa
         wOf1Ps4iuQ1zmOSxK4bO1izdetK8d/bwP8E/b+8TGqh5ohDM657tW/lnO9lbE1Lr84Wo
         UeRAFR0IhcE3U41uFcBoGberPAj2nvbbaT/NstWy6bViaNLB3RHJkdtCay+fLm3ktqjo
         dl67GbFQ7/L3TFje7o4dnaO0gNpRx8wRd67pIoyZgfgHWgO2kLsNiTfP7CIZ1cVmubZI
         BDa6VM0B15YLXO2x1DesIbdZicqKruN3s0M60AOAoz53Y5k3JkLNjSwkkox/3TXv/OPZ
         Gseg==
X-Gm-Message-State: AOAM530R7I/GJv41k675kgc/nNm47qISbq0Z/piXeimXxskmWEkv9rVC
        LYZIZ1q6GegUCYiRjfKtTiFeDqcV1CYRHcy8VWXLO4VwKWfKhSXe9jtGFuir+JTAg4sqATS6dMc
        uhZW6q62X4+xmyKYwYVAkpCm6dfBb7GVa4DK/0g==
X-Received: by 2002:a17:907:7e82:: with SMTP id qb2mr19890308ejc.496.1643703432588;
        Tue, 01 Feb 2022 00:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhOxyC/yzDk+upGVDMqjGzeMIciEE57Rpod35Osx007NQEYEitTAQ3J3/YfgtY6KfuQqdjZA==
X-Received: by 2002:a17:907:7e82:: with SMTP id qb2mr19890296ejc.496.1643703432455;
        Tue, 01 Feb 2022 00:17:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v8sm14179485eju.57.2022.02.01.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:17:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: samsung: fix missing Tesla FSD dependency on Exynos
Date:   Tue,  1 Feb 2022 09:16:36 +0100
Message-Id: <164370330545.12265.2531636049712194501.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
References: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 29 Jan 2022 18:34:07 +0100, Krzysztof Kozlowski wrote:
> The Tesla FSD clock controller driver uses shared parts from Exynos
> ARM64 clock drivers, so add proper dependency to fix COMPILE_TEST build
> errors like:
> 
>   /usr/bin/aarch64-linux-gnu-ld: drivers/clk/samsung/clk-fsd.o: in function `fsd_cmu_probe':
>   clk-fsd.c:(.init.text+0x9c): undefined reference to `exynos_arm64_register_cmu'
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: fix missing Tesla FSD dependency on Exynos
      commit: 0b59bc00a6936e8670b58d4307a2cfba341d40d0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
