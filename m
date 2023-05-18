Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3BBC77B7D
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 14:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjEROoc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 10:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjEROoc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 10:44:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9358DE
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:44:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-309438004a6so1263609f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684421069; x=1687013069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4ZpmaXHltYze/tda0999X9vCLU/m+/R6VVx4wy1BLQ=;
        b=niYRvEQd9ba3VJ75a8EW9xcwaGlc2xA9ZRZps5WdQx6HuR7UAP37BItNiQ+IfZ6vNt
         dNZ/fxM71IVxtvsiJmh1Py/bsAl1phIHJHToO9mz8FfTpQ15CWmB9H0sxPlR/1pGZkNg
         NIlfBqF9NhQTXdVr7ItJCi5+Ye0WUmcw0j+RbqkqmLWloJHsXrOiEccWvcIjqa7Ul11S
         qR8v3ZVLC0gXbd9WWht5gjc9mePoig8WFfOhqCj8lH2xrvTo7VojT7Al7mlBs+n8DrFk
         SHHq2zY2ycngAI6NsI0EZbeKjpSjIO5xAY8V0nVS6dpYGLgZ2BcmCZDsJSx487mEDR1W
         r64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684421069; x=1687013069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4ZpmaXHltYze/tda0999X9vCLU/m+/R6VVx4wy1BLQ=;
        b=joDMeEsOBePt88+cCLiU0b1MAfCBJ1HdMTQJCusccyg9RCr3dgnxc9gHaeB7nisUO+
         aB0CaJTTsb6V/FEm8Wyv55wesO1PqyJp5zkKpm8eInQ1usfTtlPES6duHG3iyd8afmJj
         BD12Ud1A1zpIW6DYUQxpC/CRBPFdO1d43+wqnamagLHO49viD1A9joT3ykOPzBxy7CKl
         iI7MKcQmF6zUJd18VfAySROs+dTkHzeD67kSf3l6Gbm3641QwVyteVpbW3pp9CDYOg4h
         WdvhTFjfBHpRo8iTGrzKuXuY4DQNVk+Nwxx+GaabCv0Qfl8aY0Crgbl3+9vaV7ptpurY
         D/dw==
X-Gm-Message-State: AC+VfDwytEiK8+7iyfIxMWCv91EqfmFIvGuKF3G32SyAFN8C3bVQVDkR
        eY0BRsJzY5gUoKkvUp88Tc5vOQ==
X-Google-Smtp-Source: ACHHUZ6X/HrDmzHif0p1Tigy5zsQlElGdzGKBGwaXz1EhaWbru41LcMCDcHji00NT4wS0Ax7RcE+8g==
X-Received: by 2002:adf:f0cc:0:b0:306:2e48:6ded with SMTP id x12-20020adff0cc000000b003062e486dedmr1791903wro.13.1684421069168;
        Thu, 18 May 2023 07:44:29 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id i14-20020adff30e000000b002fb60c7995esm2448600wro.8.2023.05.18.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 07:44:28 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] clk: imx: drop imx_unregister_clocks
Date:   Thu, 18 May 2023 17:44:14 +0300
Message-Id: <168442103976.3235434.11482255749033267131.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506090856.3599035-1-peng.fan@oss.nxp.com>
References: <20230506090856.3599035-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat, 06 May 2023 17:08:56 +0800, Peng Fan (OSS) wrote:
> There is no user using imx_unregister_clocks, so drop it.
> 
> 

Applied, thanks!

[1/1] clk: imx: drop imx_unregister_clocks
      commit: 6077af232cf58bfa4203c2364f99e0218aac7667

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
