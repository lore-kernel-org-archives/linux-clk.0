Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E762EE8FDD1
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 08:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241627AbjJDIYz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 04:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241105AbjJDIYz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 04:24:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D334F83
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 01:24:51 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5045cb9c091so2197816e87.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696407890; x=1697012690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBzBZLupXX9UvXePvIFpTAv9OlD36MZ7fOKKYNoR2SQ=;
        b=kjygUUFE5GnEOOvdYosUeFeICI76kEgoGnj/TRNED9n0JexH/dxJ6y81d3JNTakjdc
         uCYHMlsV9DuFFxGXecViAF/ydLHvuPoSyZ8kb4Qnq4lyJJ1ZCMTFFzVeL6rqxP9aqmTQ
         VvZDOAsFCmwpagFT36ojPB484vEbdRMCEJwgH0nsIn3oWFdjL+CD1cW9CY9r6EDe1lSZ
         bmulkisSvYpF78hUgcZk6Ddb4afE9aR03hz6vZVC9vEylcDyx2pr1HVeMrDg+6RYr9L5
         UO8UAuTW9hkzfylSXtdGa22WI/AIhFxmF06L2hZ+bk+JiMSW+M3DGjn03QO47DMrMvoN
         15Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696407890; x=1697012690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBzBZLupXX9UvXePvIFpTAv9OlD36MZ7fOKKYNoR2SQ=;
        b=q4rCUC7q8uNu6uQJIXp7cnU5vt5uuuFSyRRSiEG70sFI1QeoNSEhUd5h14gOrTUsSv
         pL/nGcyeLpEbcKORhIZRRiPrmfPInxWj83YrUPLjviNDk0fxaXC48txPo3fleMspx8vc
         Hy0tWhvMWXhZ5+PUiPfIKZRBIR04q0duDTfAD4RAWHeAD9CA6V5BclEpSIhhesS/NMxm
         NdNyjQ3cPprvOGlrLQMuwl7l5psvhthffbVGxhuRCLDIhzPn88JfL+C9u3+WRPXL3C8U
         M83Lwd3Pg/msl4fYS4FTkYQVGlInmtmQ01GKTyqEAtPEqjfl7USIJUzPRSovGAGRTIwf
         6gDA==
X-Gm-Message-State: AOJu0YxU5ZOY8/jsJmHfcfvctY6XUXrr+MTblVbUFNVgf7b96GrogIYb
        RLe5nFB52/bi+uBqjQKmlBrkAA==
X-Google-Smtp-Source: AGHT+IEvoV7teqz1BwPrURsFy2E9i2CruD+t5R/jxpizo3Sc5L4ZFkFV6uWGLb5w+yGTlNScGzRgiA==
X-Received: by 2002:a19:e05b:0:b0:503:56e:ae4 with SMTP id g27-20020a19e05b000000b00503056e0ae4mr1277421lfj.38.1696407890054;
        Wed, 04 Oct 2023 01:24:50 -0700 (PDT)
Received: from hackbox.lan ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id bo18-20020a0564020b3200b00533f111b61dsm2021467edb.68.2023.10.04.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:24:49 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@nxp.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 0/5] clk: imx: imx8: Fix some error handling paths
Date:   Wed,  4 Oct 2023 11:24:41 +0300
Message-Id: <169640782687.164802.380569938820374861.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694722339.git.christophe.jaillet@wanadoo.fr>
References: <cover.1694722339.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu, 14 Sep 2023 22:31:01 +0200, Christophe JAILLET wrote:
> This serie fix some error handling paths. It is split in different patches to
> ease review because the issues are unrelated and the proposed fixes are maybe
> wrong (I don't have the hardware to test anything)
> 
> Some of v1 patches had been incorrectly hand modified. There was a extra ')' in
> patch 3 and 4 that prevented the merge.
> 
> [...]

Applied, thanks!

[1/5] clk: imx: imx8: Fix an error handling path in clk_imx_acm_attach_pm_domains()
      commit: 156624e2cf815ce98fad5a24f04370f4459ae6f4
[2/5] clk: imx: imx8: Fix an error handling path if devm_clk_hw_register_mux_parent_data_table() fails
      commit: 9a0108acdb1b6189dcc8f9318edfc6b7e0281df4
[3/5] clk: imx: imx8: Fix an error handling path in imx8_acm_clk_probe()
      commit: e9a164e367f039629fd5466a79b9f495646e1261
[4/5] clk: imx: imx8: Add a message in case of devm_clk_hw_register_mux_parent_data_table() error
      commit: ef23d44b7fcbd19773dcedcb50ca2f625107604f
[5/5] clk: imx: imx8: Simplify clk_imx_acm_detach_pm_domains()
      commit: 3af29a89de2c6e49737a1201b7d6fd5ad3f635a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
