Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EE9C00528
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 08:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjGYIXi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 04:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjGYIXg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 04:23:36 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F9CE66
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:23:35 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-316eabffaa6so3846128f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690273414; x=1690878214;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3YuZbvg+OCFvU708D8FTuMOoHLfL1FWWTkGies6dD4=;
        b=D5mUngfDo2XKTj+Uz9oI22nFW53r8sWy7Q+Neh3296NMM1y/QSgHNGBXEw9EbTG2TT
         113et3GlxvlHdwFC170J53xGnpBn8ObwmMnWcq1vXXHYwnu8Fur69qKowjlFTBDDw0cZ
         PywvuH1vfqW8PMhoiL5dUPMsQ0vWJgFyA8LmQOSvCIY1f8MA8BI7opkqHcj0MYISS7Ew
         7Y9pxOM3IhFNgWpcMxElMWYf6COTnIGCMiz78b5GSjGwFg+FM6ePE00o8yCH9gCqnP2w
         TFq4yc4vMv+JZR17EnKJv1gV25ZHtxkZpdTOwEpTOshUqwWhoKZU7+ndxXo3LOkQh5e6
         N06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690273414; x=1690878214;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3YuZbvg+OCFvU708D8FTuMOoHLfL1FWWTkGies6dD4=;
        b=UoSLFyrGLmMdQRUj6yEivz1fVcjYLflqdZG+hJNITr23DwYVk1A5EBpePgs/KVv8i8
         HU8qWOKcOqwq2mc0vbxz45JnevYKfPiih14x7z0VgytB4yCiC0xbh3kqXuDd4JC57RPd
         De8m631D5AP1VQ419lO2mq1QUZbFRuuxS4RrdDZVm3yP5ktE+Ue5neU/Ba39e2DaGPyI
         eG7I02OU4ri5RH1byzPHf4d12Fm+EAXiQkuZCj0CkmGlbKTD3/ZfSI8tT0hwY79L+nrC
         LLe8QUOeBKi/8Y+t/AkDvhY9X8ux1NNDtfaN2YUJYxrQHiJF8EfFljfHh69mpit1P+LR
         p0yA==
X-Gm-Message-State: ABy/qLYcLj4IZG0SkoIZxPhwiIxO9AkM9mN5hbZtZCQ15fR9Ffn8+nih
        HTJZahm2mc3qqiQUR6HM5WrwxA==
X-Google-Smtp-Source: APBJJlGzN2HplLtgv5Bdm/Cp2oTxtskZITNmsTRd7cf9Gf9BvTF2MGF8gF3zSDm4d3YkaRH1/OCCRA==
X-Received: by 2002:adf:eed1:0:b0:315:9021:6dc3 with SMTP id a17-20020adfeed1000000b0031590216dc3mr8448722wrp.27.1690273414237;
        Tue, 25 Jul 2023 01:23:34 -0700 (PDT)
Received: from [127.0.1.1] ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id q6-20020adff506000000b003141e629cb6sm15502308wro.101.2023.07.25.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 01:23:32 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <ac8bd50c41b84f244bb0ec94e8aed25c513c9037.1688760152.git.christophe.jaillet@wanadoo.fr>
References: <ac8bd50c41b84f244bb0ec94e8aed25c513c9037.1688760152.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: imx: clk-gpr-mux: Simplify .determine_rate()
Message-Id: <169027341205.2409621.151301055489452408.b4-ty@linaro.org>
Date:   Tue, 25 Jul 2023 11:23:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri, 07 Jul 2023 22:02:48 +0200, Christophe JAILLET wrote:
> imx_clk_gpr_mux_determine_rate() is the same as __clk_mux_determine_rate(),
> so use the latter to save some LoC.
> 
> 

Applied, thanks!

[1/1] clk: imx: clk-gpr-mux: Simplify .determine_rate()
      commit: 2deed4cda3b76bcb8be2533f5bd07803b1bfa452

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

