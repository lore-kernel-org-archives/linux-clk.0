Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2960AC7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjFLJtQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbjFLJr7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:47:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78902A5F5
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977cf86aae5so625004766b.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562402; x=1689154402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNA3pQAUnl5SwQH9eSGE6UJxUpnHbr8UA8zS8MrGEdo=;
        b=S9ulLI6aWH4YWOkhKy47/q5SnI1L9ABRfn9txvV/Rsl022Krs+53C3JV7sEWiYQuEj
         akU7FdTk4tPqBllOX7IAHz+cIfLrZVbm+bP19ATMoSJhrSVqvsQ7IhS0prPCXfrcOH+N
         cj/XVwC94HuYfCB8ipUqNXkTUoNn0mEldWY7CKroL8ISzKQLn1BDUnV8yxbn1RRfD2xt
         O12oxCShyKkaPF9KAvflSvkKeXkJhfN84RWZSqzpDjD8QUoz8B+iufd5hBu9n75udRgF
         A+gGTT7/SSP19Ie9y4GiFCaO1c95Cd1P5uFDjryYCx5oc0PQyLjVCJVUGcm+gNRNz3JH
         s/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562402; x=1689154402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNA3pQAUnl5SwQH9eSGE6UJxUpnHbr8UA8zS8MrGEdo=;
        b=VQ/4YW6k0IEdBGI2MoxCsmGiv2Pz1BTsfxnTdMGORi/eJtqAsVntuz2ILRHPIxFjP9
         EPohbJr/CNPco/Myi05+/gNbMcRsAAY1wYos/+OG+MpWBDH0ZNjJYA1kkoyDAugIta+b
         C/ax9DanqLDFQS1K2sKbJpv3Fnx8+9zcAGaUwkVodKKOMbnZQbnXPnSmmzLH7yRuo8cK
         Rr4hXkdS9fHfBGXRasfAdIbQIKmY4IlINZiERXGghkCpKXS0nagaH1/Hp7GP7Lhm+AUk
         yTLk/ZqFaOHdWca5BoMLBxKVJaBMb3V9HBJcn6hFtTVqcGQwS15Z01izBZ5sfEV6fawc
         elfA==
X-Gm-Message-State: AC+VfDzqI4myWDFgkEgkczvRxLUtBfMIs8IAougisWNsgrdsc1wTJ5Qx
        UNigW39TtlQiYlo9z8pADYEPcg==
X-Google-Smtp-Source: ACHHUZ5xY/K6uqeggb7LAo0ieXQqhWmKB1pYCpBBY4cTeTnzfHALpqhjWDsCUnEiJkEnwfUYbNdMXw==
X-Received: by 2002:a17:907:7da9:b0:973:946d:96ba with SMTP id oz41-20020a1709077da900b00973946d96bamr8620449ejc.69.1686562402724;
        Mon, 12 Jun 2023 02:33:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:22 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Kai Ma <kaima@hust.edu.cn>
Cc:     hust-os-kernel-patches@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: clk-imxrt1050: fix memory leak in imxrt1050_clocks_probe
Date:   Mon, 12 Jun 2023 12:32:37 +0300
Message-Id: <168656228136.662397.997641301782961079.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418113451.151312-1-kaima@hust.edu.cn>
References: <20230418113451.151312-1-kaima@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 18 Apr 2023 11:34:51 +0000, Kai Ma wrote:
> Use devm_of_iomap() instead of of_iomap() to automatically
> handle the unused ioremap region. If any error occurs, regions allocated by
> kzalloc() will leak, but using devm_kzalloc() instead will automatically
> free the memory using devm_kfree().
> 
> Also, fix error handling of hws by adding unregister_hws label, which
> unregisters remaining hws when iomap failed.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: clk-imxrt1050: fix memory leak in imxrt1050_clocks_probe
      commit: 1b280598ab3bd8a2dc8b96a12530d5b1ee7a8f4a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
