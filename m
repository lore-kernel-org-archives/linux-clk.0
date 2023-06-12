Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F272C7EE45
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjFLJtS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjFLJsH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:48:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DD55597
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977d02931d1so606202266b.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562407; x=1689154407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7/I1ayBoe2EChOWGV7usCqZR+8SIH1+fvVOuYaCd8o=;
        b=hQsfbC1hfvX/VkT1eqZm5DfS/WywUBfNcsJPDDu4FvXouSS4uGmSjMvie8Y7o22L8n
         4PeVe/c0F18vWgnIz3raM4AR0kPeDO2Qbzjnc1UYuuoSoPBynADm400FuJz48W8fVwd2
         tdA9yjlFwpO4H3g31t64F5OnsJCLzyI2ShbywFIZ6GW4XehMltmLEuPVXgXOEwikgqTz
         Yi4/9ru4IUNjZxeg/FnBRwIC0dPNc+DMHIcX94ibRBIilBcsF8bfng+S8BTlHWyzd3ld
         fNsS9lBggk3nKcLokp4hFOQ2JRXiMwhu8JCn4B7AkRJwMH2lmBf5Sex6BnCNmJ1H++Yp
         y3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562407; x=1689154407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7/I1ayBoe2EChOWGV7usCqZR+8SIH1+fvVOuYaCd8o=;
        b=XwmO4Iznyxyhk1ryRbcrYjFbvsF3kIZbAV5u7eN+fP91VtP74duEwVEDUk7SkJnXRn
         ewbwFbxVhuIZ+sGpra/lb7v+mBQE8bIX0NCVoQyqI4nsv8M3NKIkbHMzq+m8PVMTmEcw
         rFW88q//RzqWv00pHDTyPq8dksLUufo5tuC0OJkQnaAGHrRTuhis+NYuVTvVLWBKuaYC
         To4+TbzEsQqhekd9FS7waoKNgF0Vaevn/RajZpyv8KSgihczl3kH09VOmnDptH+E9jd5
         GE5L5ulRDrYnurlkgOscjFkbNKJ3wC7bBJBf2B2QDY540XFOhzFtZi/gvtVu5fTYmcxF
         W5+Q==
X-Gm-Message-State: AC+VfDx/lPo1paAbg9Z/DAmE3GgMaRY7asHsduOdC1WjFWpntbvBpCVC
        hjEyOzar3laXfwNDZqFnx3bMhw==
X-Google-Smtp-Source: ACHHUZ7FiFwL8BPjh91CWEs26xmFRAo3yhdyy99t1MUNpBm1Q2o8g2tcPkZuAmMS/QfaGcOjlVTsVw==
X-Received: by 2002:a17:907:2688:b0:967:a127:7e79 with SMTP id bn8-20020a170907268800b00967a1277e79mr8819298ejc.28.1686562407624;
        Mon, 12 Jun 2023 02:33:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:27 -0700 (PDT)
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
        Hao Luo <m202171776@hust.edu.cn>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
Date:   Mon, 12 Jun 2023 12:32:39 +0300
Message-Id: <168656228139.662397.489177987320185162.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411015107.2645-1-m202171776@hust.edu.cn>
References: <20230411015107.2645-1-m202171776@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 11 Apr 2023 09:51:07 +0800, Hao Luo wrote:
> Use devm_of_iomap() instead of of_iomap() to automatically handle
> the unused ioremap region.
> 
> If any error occurs, regions allocated by kzalloc() will leak,
> but using devm_kzalloc() instead will automatically free the memory
> using devm_kfree().
> 
> [...]

Applied, thanks!

[1/1] clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
      commit: 188d070de9132667956f5aadd98d2bd87d3eac89

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
