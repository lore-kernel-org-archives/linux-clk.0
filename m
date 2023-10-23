Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A022C25B41
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 10:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjJWKWz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 06:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjJWKWy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 06:22:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE75D65
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4079ed65471so25824175e9.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056569; x=1698661369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUnnGAdmDfMipB0/9liPZMIOUoXhP0zAlTuz0GroIGc=;
        b=jFNeP0L5vwS/zBrTIHKxpjJ3G6aUx5EonbyLaKnNV2zF3CVXCZKZhjmf5w4YyVn0H3
         XTb89EUSTzW55RP7OncMgXrgwI4R3cEQtnR/tA7c+98BX60W8kLhyVqSb5CN5XXyUoUv
         gxpn7kvcH+k4yOlC4mq+rAfmN50jDQ4YqD1oAS9x70aXKASqSPB3y3HpfgVAxTi3wc/l
         XdQkQ4O/JPias7dY4y5E4XwjzJDjZBSFZq5n82gNRbtJUM4ghpOoom+Wpu8VrGr+bs0p
         EVgBn2oAOho+dvU137wejGGlV0bGxCgqdo50iURrb/Du7WUc5gLM8x5S+P+Ucmsh2aUX
         oBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056569; x=1698661369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUnnGAdmDfMipB0/9liPZMIOUoXhP0zAlTuz0GroIGc=;
        b=V2GPLtMv2PQhhpAxdR1hXhWd94ZDFiTSVocYz657fHds3SHUg+r0Kz+A9Ar8LVD61g
         EKDIYNcSqmQ/1XotkXjTInlX27i7x24VhVCJI6pmTlyHWgJv1KA4zKiWUVVAC0351lvJ
         1N+oYik4VlfEOTMoWFSMi+XszkNopVDRhuAgUk2SMx3e92P1o5jgVcmH3oUN6rsy6YfV
         G/G1QmisD7KZe7QEoNoVSxbkvFl457v1U1YOxG8a968R8aDstt9T/YeFh85eLsyg1X1k
         7pGmLlzMX9tUcVDmjfpo9+6ZhZGvNblj5fMdZ5zTgqWs+Sst/ndtdfF8K/9PGDmgX+Hu
         MJtg==
X-Gm-Message-State: AOJu0YzCb5vWcj3ue6dDLfcxbILtUSVLq43NryGYPQaJPGRPHP8q0QIm
        DHIbSRz1bVKa6Y+3QhB7ntBMVA==
X-Google-Smtp-Source: AGHT+IFqYO5bI+Kdl0SkjyRuSYnohDay+J2f9QzfY0pKi3Y493KGEjzuhSot3Dc88fVZ0pL4mUkG7w==
X-Received: by 2002:a05:600c:3d87:b0:3fe:1232:93fa with SMTP id bi7-20020a05600c3d8700b003fe123293famr6882340wmb.22.1698056569060;
        Mon, 23 Oct 2023 03:22:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:48 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/7] irqchip/renesas-rzg2l: add support for RZ/G3S SoC
Date:   Mon, 23 Oct 2023 13:22:16 +0300
Message-Id: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds support for IA55 available on RZ/G3S SoC.
Patches are split as follows:
- 1/7 updates documentation
- 2/7 adds IA55 clock
- 3/7 minor cleanup on the way TITSR fields are populated
- 4/7 implement restriction described in HW manual for ISCR register
- 5/7 adds support for suspend to RAM
- 6/7 minor cleanup that replaces spaces with tabs on macro definition
- 7/7 adds IA55 device tree node

Thank you,
Claudiu Beznea

Claudiu Beznea (7):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: document RZ/G3S
  clk: renesas: r9a08g045: add IA55 pclk and its reset
  irqchip/renesas-rzg2l: add macros to retrieve TITSR index and
    associated selector
  irqchip/renesas-rzg2l: implement restriction when writing ISCR
    register
  irqchip/renesas-rzg2l: cache registers on suspend/resume
  irqchip/renesas-rzg2l: use tabs instead of spaces
  arm64: dts: renesas: r9108g045: add irqc

 .../renesas,rzg2l-irqc.yaml                   |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  68 +++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 111 ++++++++++++------
 4 files changed, 152 insertions(+), 35 deletions(-)

-- 
2.39.2

