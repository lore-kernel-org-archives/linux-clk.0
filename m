Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8FEE7B604
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242462AbjJDMuk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242354AbjJDMuj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:50:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8319FA9
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:50:33 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so3445854a12.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696423832; x=1697028632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8103+2DoeKFEqiX+fTMq3nBm5GXXZ0NmtyT1CO5doI=;
        b=meEhAth+VwC6qwtzJ90LzxWJ8pG76D7UE3Q64qp9vif3DSSWIIRuquEig5QVx7EXZs
         QUG8+dtXh+VyLXQwExnRdcEbG27e+kzrJVH1jfXRYGRs5o/0jwJRTW/EbURnkLCW8YNZ
         UEnhCiVQczs+QmR4K2Ws8F4slNRfXl/ddyNNs1T0SLASZSGe+glvDY8iZ/X9hVvdkd/l
         mRlK3RSxfNW4njJdPs/V7kFkfl9Zl/mjear1Sy8VlErB7TBQWYUIZ5ges+WMBShSAJ0e
         gUjjk1gLGCRrtrWuyjEbEDiXFGl79eAOYSxalPYKIhih8k0XAyB/xGBSCEItNcDG+RGW
         K77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423832; x=1697028632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8103+2DoeKFEqiX+fTMq3nBm5GXXZ0NmtyT1CO5doI=;
        b=Fd0cSLK17R6le2ZicgR9JOtEP282OTTgeSjgCMsiA6L/ckXd1Yq9U7eTNf71E1PsXO
         565H99BDSpZbzKy6LAQYdOFgFt+n36nwOvEvl9DoP8Svklyalvv7HEX+FPSLHgdFhqcp
         9TvmSaqgRuymU66YQJEgoRhRYH9HV8FIo104IkDAQiVgc3WlmttmVWKPSTFZwxzasoBj
         FBCsacOWUL+iOfFUtg94CG4YCs7Gs+uZsXIBKKREDLN6OrvOW1moERFDXQXUV5+lD1ES
         SEFvBMYU0Sz4FOsGbFzkIAWw8Frv+s7c+0kD41GYjOr9YnCzQ1U4QCQvh0oq5vih6RqV
         943g==
X-Gm-Message-State: AOJu0Yx17nnQPAndDyp89AExWmTt+6YFVhM5ZViLJ2x1TorPijVTuUL1
        /PMyorOK0+8lKCsvVA7IR501LA==
X-Google-Smtp-Source: AGHT+IHBvFKSR1pr+MiEPqf3ArkWFdSnA/IbeXZ32rRS6n2xDUcqWsCH7R5q0f4o2DCdkDZm+j9DBg==
X-Received: by 2002:a17:906:51d6:b0:9b8:a6aa:a1ba with SMTP id v22-20020a17090651d600b009b8a6aaa1bamr1459153ejk.39.1696423831906;
        Wed, 04 Oct 2023 05:50:31 -0700 (PDT)
Received: from hackbox.lan ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id pk13-20020a170906d7ad00b0099bc08862b6sm2806580ejb.171.2023.10.04.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:50:31 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Viorel Suman <viorel.suman@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH 0/7] clk: imx: misc update/fix for i.MX8
Date:   Wed,  4 Oct 2023 15:50:10 +0300
Message-Id: <169642357601.745453.7013282402695515733.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912-imx8-clk-v1-v1-0-69a34bcfcae1@nxp.com>
References: <20230912-imx8-clk-v1-v1-0-69a34bcfcae1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 12 Sep 2023 17:18:58 +0800, Peng Fan (OSS) wrote:
> The patchset is to upstream NXP downstream i.MX8 clk misc patches which
> has been stayed in NXP LTS release for quite some time.
> 
> There are a few fixes, but should be fine to put in next tree.
> 

Applied, thanks!

[1/7] clk: imx: imx8dxl-rsrc: keep sorted in the ascending order
      commit: ab2c30f6bbe34dbf13ff2cc0cf7bc237de2df013
[2/7] clk: imx: imx8qxp: Fix elcdif_pll clock
      commit: 15cee75dacb82ade710d61bfd536011933ef9bf2
[3/7] clk: imx: imx8qxp: correct the enet clocks for i.MX8DXL
      commit: 8568b3c499268456b76cdc2e9e1b9d86d8b08837
[4/7] clk: imx: imx8qm-rsrc: drop VPU_UART/VPUCORE
      commit: 4fcb51fb0e3084ee81edaf8aea98ac01e456a871
[5/7] clk: imx8: remove MLB support
      commit: a699148b8704aa11600321b9f6b6b21f09418c42
[6/7] clk: imx: scu: ignore clks not owned by Cortex-A partition
      commit: eaefd1cf36a6507ff7dd2d30f68201de259eec63
[7/7] clk: imx: imx8qm/qxp: add more resources to whitelist
      commit: 2838820800dcaa60f32bef715c7e2e87e049aebc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
