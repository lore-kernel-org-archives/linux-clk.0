Return-Path: <SRS0=WWrt=XG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6E9ECDE2B
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 22:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5399216F4
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 22:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfUFqn9G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfIKWSy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Sep 2019 18:18:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39510 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbfIKWSy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Sep 2019 18:18:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so12243730pgi.6
        for <linux-clk@vger.kernel.org>; Wed, 11 Sep 2019 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XMh9vqXFV71BBXfbQeqQ2AI4/VRHGP8NHDiJ3hd+W2c=;
        b=dfUFqn9GmQQfPInseKvxR8/MfpW8jptfI5OoFIgi0zvZOMbwaNSR10Eq+XBJSFsNYd
         vGjgVyaCttoTF0bidKsGXaXdbNpRpMIva11M19yysOu907+gXXYL+v/A4NnXoUMCxDuO
         rUorgIlhOWzW62Yag0jaeWo8A5lF25viT8ELc0+A/LeZzl8Y8c1xQ9g+REJ8UIGOgBuB
         mqYMZ5Arjb8bcZc2LIvu52wngHmg07ljwecDu6tXfwOvyi6sErhzDq6bZQo9X03SNDGb
         LZqK5p7G9e8iuZWNrfehZHgS7Yfjbe7yaJUCgBtFlus2nv2h13jIlVEzU25ZMgxHHe2+
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XMh9vqXFV71BBXfbQeqQ2AI4/VRHGP8NHDiJ3hd+W2c=;
        b=s+riN9GpQ0scAflb8DwdskabPCz64o7G7rZXsPcnGoJBAJULyg4PhDuwgYoRa6h1h6
         Tif9uOKdXkztzTkjEGbxIJg6qmz+Kn9FgBF1BtDXPCwLOTLeV7dms/IgORf+O7N3k3K7
         iP07Rz9jwJifK1aRofLHc/GZVqYel4HVkzSlQW9OQzH3f3AWztKTcSaUG8Vzx0DaTJIm
         PMddxPmEvQn2qYZRbAwGMZ2FvDDWYraorED+GXC5hbdPbIvqfartu9ctT6hPlCa1wv9n
         jAzvaycg5+/UrSc7O2y/s/ezrA6lUbdWrRipf0zSzADTKHOiaMLsdfkir3lNw52rIreZ
         FjWg==
X-Gm-Message-State: APjAAAXExEYi6f4VpsP3A0Je1nDob/fGz9Bny5I8bitfTQqH5rBJBXNM
        zz99gmArF3Xegp6M1s+X4DAbbg==
X-Google-Smtp-Source: APXvYqzABztHQChdM8v4krHqAsKVKJHoGyO3bgM5SrAaN0DScRsQ2Ub9RLeinBiXp7kc3wggdgVYNw==
X-Received: by 2002:a17:90a:266c:: with SMTP id l99mr8084116pje.93.1568240333366;
        Wed, 11 Sep 2019 15:18:53 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id d15sm22787418pfo.118.2019.09.11.15.18.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:18:52 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/4] Cleanup arm64 driver dependencies
Date:   Thu, 12 Sep 2019 03:48:44 +0530
Message-Id: <cover.1568239378.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I was using initcall_debugging on a QCOM platform and ran across a bunch of
driver initcalls that are enabled even if their SoC support is disabled.

Here are some fixups for a subset of them.

Amit Kucheria (4):
  arm64: Kconfig: Fix XGENE driver dependencies
  arm64: Kconfig: Fix BRCMSTB driver dependencies
  arm64: Kconfig: Fix VEXPRESS driver dependencies
  arm64: Kconfig: Fix EXYNOS driver dependencies

 arch/arm64/Kconfig.platforms   | 3 +++
 drivers/bus/Kconfig            | 3 ++-
 drivers/clk/Kconfig            | 3 ++-
 drivers/clk/versatile/Kconfig  | 4 ++--
 drivers/gpio/Kconfig           | 1 +
 drivers/pci/controller/Kconfig | 1 +
 drivers/phy/Kconfig            | 1 +
 drivers/power/reset/Kconfig    | 3 ++-
 drivers/regulator/Kconfig      | 1 +
 drivers/soc/bcm/Kconfig        | 1 +
 10 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.17.1

