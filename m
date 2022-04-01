Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7363C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Apr 2022 15:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241859AbiDAP4C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Apr 2022 11:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349934AbiDAPQk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 11:16:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB09311C3E
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 07:58:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d7so4624128wrb.7
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=76a94LQu3rPoYffS/gDEHiTMZGGkCXPKcYRhl1KmpQU=;
        b=FZ/ZDpkCU0djVj4XyAI7m5UPpa4SlwCKTGlM1Rj9RUWz//rOC9j/LUQYzDk1Gjw4Q0
         AsbiLQA4Rdmj2qeJkpB70YhhXnTQByZqqayYpCmkxiFCeisjQVVps+92F9430mN7UlMh
         xtPfJJba20MTPN9enY664ka9wxQ7asaIFKkPUplOdGBGcaY7/TxvF1GPxKW2fTaarqAW
         +vsxCOnExuctwCF6g/FahFnG7PMBgdqiYknLTWy+HnDAQ6nKZp9UqbEfrJ2NNTxpzSzd
         DEfo7hOfxl+nOIaXdn3s2mK2aVS6rlfcn07LWUAToobReKpKTZ1xwC5BZ7Qkd2ugAeZs
         51Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=76a94LQu3rPoYffS/gDEHiTMZGGkCXPKcYRhl1KmpQU=;
        b=UYewPFkh/kKKF4rOR9S6ZDpd+Dv3rAmBY3sfuP3Q0pKtamK5g4f32OjCtAiQdhtZhs
         lUl4uVraHv4mbc0RwiHJU9MrngTIiYF/FLSfLrmqCkH1EHZdwIgj2PRZZbZRyFGPSJBx
         vPJaoCubrgFvwKaAciWBx9O5pWXCX2iQXvhljCz28z0cZwgiug3DQXq2ATT41BBZJv0D
         ZUzQwCjMlscy7Ttx62k3BjvmRNW/hGDYuJnojiHsMuZuLCckQL1wVVF/Uj6Y89jlwFC+
         IhugnqZkvePvHgpeQjzkmniQmHdQvCZWW7EuNA3LpkhzTgFhEN+p0zJo99Fr1teHJyLt
         KxBA==
X-Gm-Message-State: AOAM530zbttLQk/pPM4HOc1kMcSKzQjK3HU1puIdXFQTHfnFt5nLtstw
        gJpV8UAe5wTACS8dJhQO6167Ag==
X-Google-Smtp-Source: ABdhPJxi8Y6f6lrLshYHx+nvxgkTyKctJN8K3nHCREVNRv1HkEkJFWZspLSclpT12ofkeOYjbKJ8qQ==
X-Received: by 2002:adf:fb48:0:b0:203:f986:874a with SMTP id c8-20020adffb48000000b00203f986874amr8067141wrs.614.1648825105436;
        Fri, 01 Apr 2022 07:58:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c404800b0038cc9c7670bsm8530722wmm.3.2022.04.01.07.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:58:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 0/4] ufs: set power domain performance state when scaling gears
Date:   Fri,  1 Apr 2022 16:58:16 +0200
Message-Id: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This is a proof-of-concept/RFC for changing the performance state
of power rails when scaling gears.

So far I added it as a parallel method to scaling clocks, thus
freq-table-hz stays in DTS, however OPP table should be probably
replace freq-table-hz entirely.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: clock: qcom,gcc-sdm845: add parent power domain
  dt-bindings: ufs: common: allow OPP table
  arm64: dts: qcom: sdm845: control RPMHPD performance states with UFS
  ufs: set power domain performance state when scaling gears

 .../bindings/clock/qcom,gcc-sdm845.yaml       |  3 ++
 .../devicetree/bindings/ufs/ufs-common.yaml   |  4 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 17 +++++++-
 drivers/scsi/ufs/ufshcd-pltfrm.c              |  6 +++
 drivers/scsi/ufs/ufshcd.c                     | 42 +++++++++++++++----
 drivers/scsi/ufs/ufshcd.h                     |  3 ++
 6 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.32.0

