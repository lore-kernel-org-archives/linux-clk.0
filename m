Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36823C001B0
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjHNKMA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236285AbjHNKLk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:11:40 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DB91702
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:58 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so42024295e9.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007856; x=1692612656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PkSuaJcofiI9G+5AA+ECuy1yzmqGQuzV0rqPXyqDRo=;
        b=Y9pr/Ko6BEHxnBj8O5m1Pr+LzsAqldRyj46fhT1O3SnHbGoM/oUmjdK7yHthXGV01A
         i4AkJPR1ZXcieM59FAWv+K9HuAEoV3uJnX6u6z1d8A94urkTUGhGYi2yKbkZKRSR0DyJ
         8h2C7FLNc0wX01XbXk9PejUwNJjSd4foZb8smVLyQ/Vot2Qkq3DWvuwXhcoldq8AQf82
         ZgddVCqxqjfr9I4jj1LKfuix9FALfzer6wxsP/kh1qrOO1HKX77v7Zgy3mVDYxFQ30k8
         OhWjuyq5Rc4Ud1K7T0/c1fxg9+wu5z5ISkjTsSwhf9hVkNW6LJAaJjLd91RomF1TOGeh
         dzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007856; x=1692612656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PkSuaJcofiI9G+5AA+ECuy1yzmqGQuzV0rqPXyqDRo=;
        b=HkJO2i1GYvZc9qtdZk8lc3mW399B7Ak1r+Vw7XXAJLNNvSSY5NtIZoL2B24/KC1AdD
         UGH2JoPmOh3zzsDC7zf34coHPo3zj5sYmsPmtlcWYbT6x8Qys+ztQ20LZyaqPtahSgEP
         gyzGieY/4YuI4Dit9xblsSXxprpC3T0unT2UgEwQtw4kc0henJvvwbUsIpo9UeYHQWK9
         4TvqshO6PUhmLYyk+AB5JP+Ewtg9v2EaLDbLkZNwX2r8qGdWuq548scb72zgp4URcR/S
         G6kdDzo0vfVhNaoqaJefW2/E71weN9evEQDkeRJZxadgRCwV7FIz2w94pLFCQofVUCUU
         +8LA==
X-Gm-Message-State: AOJu0YzJkIvdFrtByCZPf7dHJnl3iLD3ucz7ggAn++kN5+xkNO8l9pyJ
        AAg6yiBc5plFXsabzKQgc0iK7w==
X-Google-Smtp-Source: AGHT+IElv12nLwlky/8esQKQ6IwPt8dHUEyTOR5pVoRQQK+3XTAvqV3TNBhFeEaf7ts5VlOS8Vyl5Q==
X-Received: by 2002:a1c:6a14:0:b0:3fe:687a:abb8 with SMTP id f20-20020a1c6a14000000b003fe687aabb8mr7393093wmc.7.1692007856781;
        Mon, 14 Aug 2023 03:10:56 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:10:56 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Anson.Huang@nxp.com,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] clk: imx8mp: fix sai4 clock
Date:   Mon, 14 Aug 2023 13:10:00 +0300
Message-Id: <169200755847.527063.14634557419278126907.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731142150.3186650-1-m.felsch@pengutronix.de>
References: <20230731142150.3186650-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 31 Jul 2023 16:21:49 +0200, Marco Felsch wrote:
> The reference manual don't mention a SAI4 hardware block. This would be
> clock slice 78 which is skipped (TRM, page 237). Remove any reference to
> this clock to align the driver with the reality.
> 
> 

Applied, thanks!

[1/2] clk: imx8mp: fix sai4 clock
      commit: c30f600f1f41dcf5ef0fb02e9a201f9b2e8f31bd
[2/2] dt-bindings: clocks: imx8mp: make sai4 a dummy clock
      commit: 35ec2abb54726e1a72c570f6465811e049d81cbc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
