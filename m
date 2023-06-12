Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C69C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjFLJsj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjFLJrs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:47:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BB9A5ED
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:35 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-97668583210so611095066b.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562410; x=1689154410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn1KmoSk4w+76jXteo+X6vERxlyroWl5Pa1iBI+YhcU=;
        b=aKH7YgYs7NdNLNjRM9saAyjtg6C3B3PKNqk8EubOZ6PjsYpJobwp71ACl+zvOE1iZb
         9thz1H5IUgtL/SCUeJXGYRkmj5KgbZpHFsQDcZbwv/2q/YRrc+fPbfiSYYV9O/sw6+Rr
         L3y8KeFvzqgT+g6J29ILMtchcRVu9zG1HOLeELMUENtL5YmqiXb79aLY8GRTERxHEko8
         sbyoJuu7t5BHvloNCYKfQ0NwIPWoiZ4YwurXL6XjL2RNPfxGoaq57IOBZbKqyDFR4Vuk
         175cfzC//CjQ3tTQubUK9eP2vVSP+DgR1Dn2lbHf5v6MSaq8WkFSEnm0R6jW1Pl6st8z
         VClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562410; x=1689154410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sn1KmoSk4w+76jXteo+X6vERxlyroWl5Pa1iBI+YhcU=;
        b=Z5KgnvxlQaBgbC72EPurJirK8WB16rMsRf4/nBiPCW8m8OIBzmybJ/iH4cp3rbeZCE
         hvS4aCgl+zchf5Erb5WihE9n2F0ypXoPeM9BrJbP+uPMHDj26BdwUKLyOfie9plT4klk
         KVSIw18ERKL7MQq8bZL6BCyfL9HTQywq2hjALWyXVI3K9SrCm5khiZsTxvzBFZV7XddZ
         +IL/6c+uwoCgidYtSGGFhDa2vvAK/rsl842Ys5dfKprNlIQ3dIUV9mcRqyEsb312ImVO
         exk/26jKBh+dQ+ZrxqJF2ZQR0PD9E0WD2/qsaiYeTWmzsgLI6qpWPoEIYEISs/Zl4qw+
         62Xg==
X-Gm-Message-State: AC+VfDyVrIJ6bRP6Zg8dbjYUihIwE4M9Fjn6ZeHBnlkGG21gC5m3Y8Fr
        UCqxLfEIy1L0ayRMGCFpU3nosw==
X-Google-Smtp-Source: ACHHUZ4+8vTsEZaxwOtLPHygS9TYUr1UyDbsg0bBA37CkuzbfQ3tHT6uZY4O9wlvwavwYKWxUWhGsg==
X-Received: by 2002:a17:906:ef07:b0:96f:7b4a:2904 with SMTP id f7-20020a170906ef0700b0096f7b4a2904mr9276446ejs.3.1686562409808;
        Mon, 12 Jun 2023 02:33:29 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:29 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Zhanhao Hu <zero12113@hust.edu.cn>
Cc:     hust-os-kernel-patches@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
Date:   Mon, 12 Jun 2023 12:32:40 +0300
Message-Id: <168656228140.662397.4112940711975875013.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601033825.336558-1-zero12113@hust.edu.cn>
References: <20230601033825.336558-1-zero12113@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu, 01 Jun 2023 03:38:25 +0000, Zhanhao Hu wrote:
> In function probe(), it returns directly without unregistered hws
> when error occurs.
> 
> Fix this by adding 'goto unregister_hws;' on line 295 and
> line 310.
> 
> Use devm_kzalloc() instead of kzalloc() to automatically
> free the memory using devm_kfree() when error occurs.
> 
> [...]

Applied, thanks!

[1/1] clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
      commit: e02ba11b457647050cb16e7cad16cec3c252fade

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
