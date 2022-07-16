Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DAACCA480
	for <linux-clk@archiver.kernel.org>; Sat, 16 Jul 2022 15:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiGPPTV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Jul 2022 11:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiGPPTT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Jul 2022 11:19:19 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DBE1CFD2
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso12821778fac.7
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcSYRznlrOD/DFURZxCB8EBFPEAfx808gDBYygMWkbw=;
        b=gZdF4ckcD4LKBVTLYXsBauBZx1rFKzVid4XN/n7TIiHkfJG5/TJQfMhnDuq5qxiIhk
         425mCE/GZxIDwEI01zqTKLP0EvjfsqIacQngyRNq5xV2z1KBHFrZ9yBcpb21nLndmyvt
         suitiaQbyAPvXcoH+CCNVpmiUOrQgtOZLOVxbcvM8aEw9STbXJ6f11RFENZ020kqNXhg
         /2W9np94EX47VvjoTvsqqceCVHBpG6Eb0zPdHHsO0KfLB5KIJ2adZy+WnM3HJ7ei73gH
         jwORMid2boO+75R/v0FMjuKWrMxsNmtykjv95q40Ck9rWEfKUK9JP+Wxg10N3nZSG5bi
         Xjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcSYRznlrOD/DFURZxCB8EBFPEAfx808gDBYygMWkbw=;
        b=t5EV86g7yHBAzWEmF9HvD9soW8/Q6JtTD6RRPUfFTXI4wmRVJEyfIrEEBm9lZzsywQ
         lQtTYsmLiWkSvoaioyYE7bMijyq9X1O8VFagDz1cCEE7Py1uT4SCiKdKp6lycP81DR4Y
         IKyyrGvIU8t2c+Pvx/gTUrMkzy/jp+xhbdZQm0u5MUiVw3E60GnGBEWo6b9BUuSB8Kya
         lG6qm7p5BDXAwf2UrejUHQMyiCFwgMkhUJi4tdb/KfIEyXFBleCOP/o39YNNcUY/Unmn
         /sGG2gc159AdeUIWMZuEGtGrN2efBoG2UaDqicnHfxo/a2oSBjz2uRY1NSG/qMXSGGlh
         AGUQ==
X-Gm-Message-State: AJIora/fOcnovJNTaiC0WIaUPGCi+cQ3D4gYNzMLblweNHSGsbZTLp5Z
        W2GzvQ6Bd05LSKRNPKkOWJysnw==
X-Google-Smtp-Source: AGRyM1vlOaikmmmBzvktDG7vbeToMJATn0OahqMwmGy44VSpuIjBFpAt+1Hf+OXoWfKd0G+4ZW6++A==
X-Received: by 2002:a05:6870:d68e:b0:e2:861:8b15 with SMTP id z14-20020a056870d68e00b000e208618b15mr13741361oap.156.1657984754421;
        Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 4/4] arm: dts: qcom-apq8064: create tsens device node
Date:   Sat, 16 Jul 2022 10:18:57 -0500
Message-Id: <165798474063.1679948.7784256926551377758.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org> <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 21 May 2022 18:14:37 +0300, Dmitry Baryshkov wrote:
> Create separate device node for thermal sensors on apq8064 platform.
> Move related properties to the newly created device tree node.
> This harmonizes apq8064 and ipq8064 device trees and allows gcc device
> to be probed earlier by removing dependency on QFPROM nodes.
> 
> 

Applied, thanks!

[4/4] arm: dts: qcom-apq8064: create tsens device node
      commit: 5142c3926f8fd358a62810cf09adcb128904694b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
