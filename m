Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE52C7EE25
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjFLJsK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233860AbjFLJr1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:47:27 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAE5A5D8
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:24 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so10453541a12.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562405; x=1689154405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtoVIAYvvaeJCmzX3NdwvnzpTltebMwdZEZnlmKhDLQ=;
        b=wdB5yrjrAs3jXnvkq4geD39hwuQE7x052nP4+T90RSSxrtqz8SvhypaMhV43pqDOU9
         4JjfufjNGjSBpG22gBTRdm9u8PRCBSLOBFgbiKvg8cIjYT8KKUMx0f1HzpSvkMBTeeNg
         +EEWF8QrVUIHz8MD8qmZa4v2YUhymK4IuJXiYSjsEEocta+bM5Kke8wX/9S5ETOYg5Rh
         FOYMNSH3koOTvSWW+bJMgDjmW+FdVYmxvyYsaQcbiZLon2ytryAy4DfBb5XRbO9ygIOS
         r3cDulPWDJxu/dvQFy9/KIGQDztK9AUHfjS5YKaXp0y7q+9LHX/KZuPnWAO/Ts28puZI
         O5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562405; x=1689154405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtoVIAYvvaeJCmzX3NdwvnzpTltebMwdZEZnlmKhDLQ=;
        b=mBfMJHvVCBZf05W+0fbzPFJVKKt8WFgcNNozobm7XLPDz9zABT+KNMeFIzPyM38JXf
         1Icomc6QQzAw5ZZ+D1NUxz1hgoHXPhikE2JiclbnbB/vibrjKSwWixWYAHAt15x7wTxI
         EMFmMc4+w5DxBRlB1tapcI2Fvo52LaUXhrVcvE++afNIomFie6H61NjUeYJFgIXyijcX
         gdH5K92+Zo1nhSxeu6wPqX3KF3+DOHvUcaxB2OCu0dJYqtSxqFMCxib47tXZYxeOIsZ7
         JWhWsgAh6eH7WYt3aVNvrhq3CvVOgdxcwemQaNCLtUIFChabb9fkNF4lsdYeaVy79d0E
         +HHA==
X-Gm-Message-State: AC+VfDwDFq+mnhrW+Hep3DGwp8edHEY/YnUPtSF9lFqdSGnIBoUuxaAh
        YsCb+V4BI9vBAvYIFB8z9Ck8Ng==
X-Google-Smtp-Source: ACHHUZ6lI2jsO4Sm/86nevBsOTQv1TSTrEMT4rYq4dBh62a/5xR7uH8uhY9mKOjHGynVFTFxfsAgKQ==
X-Received: by 2002:a17:907:969e:b0:968:892b:1902 with SMTP id hd30-20020a170907969e00b00968892b1902mr8936027ejc.6.1686562405173;
        Mon, 12 Jun 2023 02:33:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:24 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Yuxing Liu <lyx2022@hust.edu.cn>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
Date:   Mon, 12 Jun 2023 12:32:38 +0300
Message-Id: <168656228140.662397.3944524571382952191.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070607.2462-1-lyx2022@hust.edu.cn>
References: <20230503070607.2462-1-lyx2022@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 03 May 2023 07:06:07 +0000, Yuxing Liu wrote:
> Replace of_iomap() and kzalloc() with devm_of_iomap() and devm_kzalloc()
> which can automatically release the related memory when the device
> or driver is removed or unloaded to avoid potential memory leak.
> 
> In this case, iounmap(anatop_base) in line 427,433 are removed
> as manual release is not required.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
      commit: 878b02d5f3b56cb090dbe2c70c89273be144087f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
