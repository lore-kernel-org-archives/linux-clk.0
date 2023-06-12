Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5400BC7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjFLJtT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbjFLJsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:48:14 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B71AD05
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so7426058a12.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562396; x=1689154396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw2vt//oAwfRUDirKEfuFTfUTv7LIcANL47GaMhJ2HY=;
        b=tvljEK9M9gicBQPrr2CvNMR0e2D10EWl3TIXpZe8jfDI9UB/j1pUJcHMOgNNVrLmnB
         CroIaJhnNHy9vKCpoAFHXsQrGEf9K2Lx4N0Nfvmlvig51euRaPlEj2yr1FgyXDM0I65P
         xmBJ0QtcIyx+yxX+Pk0uaDHuQUk2P2u/nwCPJqydxAwRgTzWP8gYMvwEvOZxWnLtJKw+
         7EEnsDkLGlaRB7lssdiIVnPVXxI30A99q6MhZS9zkovz9EJ9DuE7N6lUfsMwVLjgxH6Q
         fEX08uTQjGMpURhdBUovE0+AUEYg1i2+70WYWT6RRt0Z9FwkM5o5JX64JstJ82f6Pe1N
         XGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562396; x=1689154396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw2vt//oAwfRUDirKEfuFTfUTv7LIcANL47GaMhJ2HY=;
        b=Ol27cSG8gcyl4iTEq6NUp1A+2A2BTb3idjijN0UvrzEvD2hXtKXSeNVmQaA7gfj2/0
         S44EkQpgZU/UDInri6dZYV0SyYpW4aj8JLFGvPiKncdj4tWMdHALcWsVlElccHNLtQco
         9U5PZVv8advsxJ3a6y55qpqFVR/flgTP9sbjG+56p94cZ5EkacSqDltBo2NVsbzwLvTn
         sPYs9SMJFpBVCGzX+ika/jbqCLx6t5tRlodkmEPb8Cs5hsjp/S8hHlclwooSC7dDESsC
         9jmuFHRiUByKAdUS8oVuS0B7DSmlBZMW2tbmyiv5JeMcfm8StJ2UOl4rYM7UFNACHqYF
         Ye1Q==
X-Gm-Message-State: AC+VfDwzygcg8U52yiPyb0azKV0jkVOjAPWiXti0PzqO7RYZUHh2JbVo
        qhjwaofvWa0mJlTQwSX+PZ/DWQ==
X-Google-Smtp-Source: ACHHUZ4VY3Aoz4gm30K5nUpn2AqyMQacV3tqPC7J4zZGUar4ttwHkuiDYKSoqdModohkXNgm4rVyxg==
X-Received: by 2002:a17:907:16ab:b0:94f:1a23:2f1c with SMTP id hc43-20020a17090716ab00b0094f1a232f1cmr11100570ejc.50.1686562395859;
        Mon, 12 Jun 2023 02:33:15 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:15 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx8m: Add missing interrupt property
Date:   Mon, 12 Jun 2023 12:32:36 +0300
Message-Id: <168656228138.662397.5023054171384904344.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
References: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 10 May 2023 08:56:41 +0200, Alexander Stein wrote:
> All i.MX8M SoC have 2 CCM interrupts, called:
> * Interrupt Request 1
> * Interrupt Request 2
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: imx8m: Add missing interrupt property
      commit: 6e6bb1639136f36c82efda147b63e2a2197fa3f8

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
