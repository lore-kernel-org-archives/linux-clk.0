Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A83C77B7D
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 10:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjERK21 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 06:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjERK2P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 06:28:15 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4887E1BD2
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:28:14 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510d9218506so2034396a12.1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684405693; x=1686997693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiXiegdggLu/PT+d6XklO6wTTE+KccH+53chOvJaVbo=;
        b=cmaitgxZhUX0xD5u3Bxfszq39fOCWChWuWHfPLKaWVW32xEtF7HFWhIMidXD/zk57w
         FOTQIgiPXmuCTj4amk94bIATZvpub2xk4BZ7bQmVvoLTmb8/PhUb5T7nuct9Utvmv1ai
         8M85ExPZP4OI0vToPlszrk6kMzovY456QMZzlRqG20wqppSvOc+LMIINY2H9vdMhyfKR
         za8fu/gFdLAZLRTOObclDXIZRsMnU/hXbNAHR7UmqMiPMgB5GQAlQZFJW5ywk/HP2R7v
         6o991yzRoIEoYSeAMVBp50dQ/kfnsTCFmrAaJcWo48nMplc0eMYgTWalLvBqG3Okyq1N
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684405693; x=1686997693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiXiegdggLu/PT+d6XklO6wTTE+KccH+53chOvJaVbo=;
        b=IGaEOoX+K1rIHhLfKA26g/daNMd/6fLwwoQv5XwZNrxO/zjsVIzJSa33Yh2lw4P8R9
         UEv/AGPc2DcgO7QCqZIPXzfyblacZ+GdInZlLYWsqFhpqDDfdI7Vj+nKxkz3dSzd1eQj
         iGW7w6UKNfBw1s3s9wbTkP8hkVp4FMfLWJo8ZdVoIfPrGD8jcMos8SppEtNcT+YGfdVn
         WMMeobCzjm/OA6eDQSO/Aco9IL9Zvjl77qMBo26f1yh56ZTRR1aeBKaSf7Tz3DVXzQaB
         EScyeeBByKg7Ec/g1DRfitIfMn+aiR1DDe3lEl8aKE22ANkYKQnF/yT1rbfg4SdX4aMk
         Oeqg==
X-Gm-Message-State: AC+VfDwu7mcRF7CGORKr+zJ5GItn768Dqcwn/I5SuQXBIpfWF2jdCn50
        p4dh8GEsj47n5RE9A8b1H993jg==
X-Google-Smtp-Source: ACHHUZ69SrGVd74iqUJ3ZXauhudQVSiJNuaDqGfwltLwqrlNuAChWRytyEzB98aVDLoX6HCfbwnzGw==
X-Received: by 2002:a05:6402:1355:b0:50b:c013:f933 with SMTP id y21-20020a056402135500b0050bc013f933mr5368444edw.6.1684405692773;
        Thu, 18 May 2023 03:28:12 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id bl24-20020a170906c25800b00969f13d886fsm780592ejb.71.2023.05.18.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:28:12 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the LDB clocks
Date:   Thu, 18 May 2023 13:28:02 +0300
Message-Id: <168440555099.2524465.18044940718129209216.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416150004.16834-1-festevam@gmail.com>
References: <20230416150004.16834-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun, 16 Apr 2023 12:00:04 -0300, Fabio Estevam wrote:
> On the i.MX6SX, it is common to use the LDB and LCDIF with the same
> parent clock, such as the IMX6SX_CLK_PLL5_VIDEO_DIV, for example.
> 
> Due to the CLK_SET_RATE_PARENT flag, the LDB clock would try to set the
> clock parent rate, which can mess with the required clock rate calculated
> from the eLCDIF driver.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the LDB clocks
      commit: 370da75066e32bef008ca17290f4aa644500100c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
