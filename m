Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8364AC04E69
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235988AbjHNKMB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbjHNKLj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:11:39 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF9010FA
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:55 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so29198325e9.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007854; x=1692612654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgN2oiVAhApfVm/31d/EjOaZdUELytGSbaFguIaDR9Q=;
        b=ZhdLzpdGuOhLUUVkGOy6ORKSCQCI+vZTdtqh331WBJAOVcqpOBt2bBPyt2NKia0+Jv
         9OoetT5cypoy2sVJGQzIgOwoh3zpoQQqwuMSahHL2XmXE4MPsOe7HLQSoFILGaO1oWq7
         cp/JS+EEz84vcoqEOi07jfSKqwLO6vpXMOrG34STIIeO2Vq7wqUlmhzrdS7xVxCJvXAj
         KbCtJP6+WMz1Vazfn/6wwH55YuxafB4i8GyTz+xd4V8n24UqY6S5vZYGhYZfozAKEtxa
         EDbot9am28PSjROBEl4igL7LrISfLpRXpBl7m/mxicK/3MbakFFBrkVAuowqa/l9qmgV
         E6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007854; x=1692612654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgN2oiVAhApfVm/31d/EjOaZdUELytGSbaFguIaDR9Q=;
        b=KWWsJfTtKqfoDFWTqqvC37xNJRj5WZQculoEXXtwt14+uBtBQJCv8mHI4XO38Ph2zV
         kux9STCX3Q3a7RZeAP+6FAiXFpomvp0u33dlVqiBJ4/I/2f9gS29zzh9HoTNuCcwXUto
         q3B7rCkSAhY+dj4sVIk1heCc+3NLYJtEd4cuL41t99ECq7B/RSAEk8PNu6eZ08siRR4H
         Ucde8L+ZK27lroidcLjqjhf0CPLfyopF9eX9U0Itmryhrhqx/SvaPgUw36dtGiIhBQMM
         i8HmQLcGXLqc6bOZNiBY9wvnHQ06eSPWoowAdA3xdmxHgWrIaKJbMsY81XW/ibZAzuY3
         tfbQ==
X-Gm-Message-State: AOJu0YzuRl2yDYcDxKVbJsZoDSGrcrhv91f+hnS84CPuu52wX8G2uF1q
        YsPUm25BPlVieR754W80BgWJoE3pPPwypZfWHnE=
X-Google-Smtp-Source: AGHT+IH+cZSHekOLwjMUJ152aJZabewgj2aJGaKl3OuqxxTBG+Z32qFTzMWt7ldEeXhpAH5Z/GiZZQ==
X-Received: by 2002:a05:600c:3b96:b0:3fe:10f8:8714 with SMTP id n22-20020a05600c3b9600b003fe10f88714mr9228555wms.7.1692007854435;
        Mon, 14 Aug 2023 03:10:54 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:10:53 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Kaiser <martin@kaiser.cx>
Cc:     Shawn Guo <shawnguo@kernel.org>, linux-imx@nxp.com,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] ARM: imx25: print silicon revision at startup
Date:   Mon, 14 Aug 2023 13:09:59 +0300
Message-Id: <169200755848.527063.7971182196567978147.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802184046.153394-1-martin@kaiser.cx>
References: <20230802184046.153394-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 02 Aug 2023 20:40:44 +0200, Martin Kaiser wrote:
> Resurrect the unused function to print the imx25 silicon revision at
> startup.
> 
> This patch set is blocking Arnd's work on enabling -Werror=missing-prototypes.
> 
> Arnd, could you pick up these patches in your tree as suggested by Stephen?
> 
> [...]

Applied, thanks!

[1/2] clk: imx25: print silicon revision during init
      commit: b8a06b125c245eb946d88847e052294a85b206c3
[2/2] clk: imx25: make __mx25_clocks_init return void
      commit: 5dc176079b7a8ba7ff89db10e0c9784856c79d7f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
