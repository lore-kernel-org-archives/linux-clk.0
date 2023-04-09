Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB32C77B61
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDINyE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjDINyD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:54:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D06C3A9B
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:54:02 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ud9so6817432ejc.7
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681048440; x=1683640440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB9lCsnyj/fv7L0Qosd8AJfMlTik5ODV7VRxF/PVBcs=;
        b=ESoZyKZoFG2EPF5YMZ3oNkj5UzXFSYWo5FqHFQZSTdCZkRktB9PVXDheNY6P6HdnoE
         SdErYcJpzsx/DeRghx+9uPg7X+aPtxU7Zr1F7rzG9wVkdtureXIJQU378hX8ublD+OMe
         IFnQ/S/uYAvdPSe7wdRMMhvM0JompFL1KJjPt1kkvf2S7CdoqXr5I6cSpSqyL4sA6H2W
         fvtjUdDx2y5ZINxXD4GsteIxYv5P+604ylvARfWqawoIgVcS6Cdnlcm1nQH85FiLQ/Gs
         dFG31Pbg9hiwXApJBZWaT8RYlpGehssPn5wTcahQrGTvqlVof2joVMvp6yKWJqCugVyA
         JicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681048440; x=1683640440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB9lCsnyj/fv7L0Qosd8AJfMlTik5ODV7VRxF/PVBcs=;
        b=V1AWkF7xDhTecjZ8798626hNy9iY3Ocyq5watUBUQ71h+HDAryKAzIyoU2IObnxoE1
         JR7lpkLdgZrhjOdRDgoNb4ItVefjaM7pjmFQQd0uXsV2HsfSPbHvFrbQjXJp+jvsl6cR
         yu2tdRO87fKG2mpWyEaQnrC/z/zkaPZHsDQBBpU780dpPlmDS8++nVKf9NW1i197g8U1
         sfqekUaRd49RdfnrnUUFCMft+rG+Q42xJLBdXibdIFthiZV/ULuYY07j0fbSLl9J6f9y
         2Xpsy7tTeEEfh/U0tQhxGZN0jl+qKBcKvU0eL1PHGwumFng+0Zlbon+ZbU2mFI9OiVmA
         HH4Q==
X-Gm-Message-State: AAQBX9e4dF6OurSDP7TFxIbhD93UCD9tUss/5lEbQ273mMJdgC2iMFBe
        ya/Xx3EXwFGanFjVomiDLIttmQ==
X-Google-Smtp-Source: AKy350Y4hyaFvX1ykWjokdiYB6CAdry15+gdGSTQ2WkgaX3R6TpXHUC6cxCMCtmPmG9Q2xsjX8Comw==
X-Received: by 2002:a17:906:4dd9:b0:8e6:266c:d195 with SMTP id f25-20020a1709064dd900b008e6266cd195mr5492930ejw.38.1681048440695;
        Sun, 09 Apr 2023 06:54:00 -0700 (PDT)
Received: from localhost.localdomain ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009476efd5244sm4202643ejc.172.2023.04.09.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:54:00 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 0/7] clk: imx: imx93: fix and update
Date:   Sun,  9 Apr 2023 16:53:39 +0300
Message-Id: <168104831086.1290263.186281171098530599.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
References: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 03 Apr 2023 17:52:53 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V3:
>  Update dt-bindings patch subject to match subsystem
> 
> V2:
>  Separate the dt-binding clock header into patch 6
>  Address kernel test robot build warning in patch 3
>  Order the patches
> 
> [...]

Applied, thanks!

[1/7] clk: imx: fracn-gppll: fix the rate table
      commit: cf8dccfedce848f67eaa42e8839305d028319161
[2/7] clk: imx: fracn-gppll: disable hardware select control
      commit: 4435467b15b069e5a6f50ca9a9260e86b74dbc13
[3/7] clk: imx: fracn-gppll: support integer pll
      commit: 56b8d0bf3ea8b0db8543e04a6b97348a543405ab
[4/7] clk: imx: fracn-gppll: Add 300MHz freq support for imx9
      commit: e040897111a12b7647b8f758336b2f14991e9371
[5/7] clk: imx: imx93: add mcore_booted module paratemter
      commit: a740d7350ff77ce1ebbdc3b9c548dd3bcaf39b31
[6/7] dt-bindings: clock: imx93: add NIC, A55 and ARM PLL CLK
      commit: 5fd7b00ca2361c81f2026f82dff93e52afd97a0b
[7/7] clk: imx: imx93: Add nic and A55 clk
      commit: 6b60c3ae3e98d036945f2d5c11d35b4c178ea423

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
