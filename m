Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178C2C77B7A
	for <linux-clk@archiver.kernel.org>; Mon, 29 May 2023 13:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjE2NO3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 May 2023 09:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjE2NO2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2023 09:14:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA309B
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 06:14:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af1a7d2f6aso35068171fa.1
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685366065; x=1687958065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI47SJKAmBdp/XyFbI1qkN5JuIitULutvqrTPDi5OOc=;
        b=StyOwK4j+8Ewb1qcNqHTB2+vZF92BeMmzpcndklgtsIIeeiwOOD2r2JWOSHSB17oc2
         JwfytK7the+sxr8XNr438nNtsr3sYj756bJdLJ87OKP0yDPgCqIga2sNIIYFfBs89TEI
         DCdgF8eUvHf9A8ojIs2ooQuWHaCqT6f71X0ld0zk0ro3fg+lQwZWleEhM3nMnEBC9EBy
         PefIw4+8nNqRsecedFWKWpF3jRFf8Vy0tiTCclOiEZLxom8KFnerJK0cn4/uZ9tbkCgS
         7Gbs+GfvANU/LFTwZHGM9Qb6E2iOUijSwuHjOLmx53AROz9BSM1utE14Cvu+CSS2DrCu
         qRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685366065; x=1687958065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pI47SJKAmBdp/XyFbI1qkN5JuIitULutvqrTPDi5OOc=;
        b=ZuCyvXp2EkrHvfR7mgA91BvJZrqiFoI11aiC1sinrZ2Kw9S/Akb/mFYAxZiSo96EQd
         S6C1Oh+DBZWoo3oPNn8dn4+wf4uV3sAjD7dMktJ1v3E//CwCZeyON9h1Ft6SEs41Lvdb
         +ZM2rnM4Rye5V3S0DKLaoGQpdzzIqNbXCSAvi2d7DTzqVmhmXoa/KCOmM714eWT3Gcif
         gqE9vD6vcCsNEyBi5GhaMTdXHsRzDY2kExRLcO2/12m/qHJylS/7OGALD0g6IAm8CAbD
         tmCeFrK5wlZz5Aa/kuLkmgsvj6Xe7nF+TfTINONHZc9rbER9ssBik1Gl5EtvBUGUC3S7
         1YTQ==
X-Gm-Message-State: AC+VfDzc5HBZB5eAZqkxF0Z+sfoR8yRNCQML+QMHZkPQ9l0WXBxMG7TB
        w9YPQTpGRi8RSys/5kntgV24Vw==
X-Google-Smtp-Source: ACHHUZ65Slrl6WIt/Oko8TfXtgc4aHDRSFooOnYTf1cwlRbhdTK/wcV5M5PldBOgz0mVbNLOS/61hg==
X-Received: by 2002:ac2:554b:0:b0:4ea:e688:a048 with SMTP id l11-20020ac2554b000000b004eae688a048mr3518297lfk.69.1685366065295;
        Mon, 29 May 2023 06:14:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id b30-20020ac25e9e000000b004eff4f67f1csm1966375lfq.304.2023.05.29.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:14:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Add VDD_GX to SM6375 GPUCC
Date:   Mon, 29 May 2023 15:14:22 +0200
Message-Id: <20230529-topic-sm6375gpuccpd-v1-0-8d57c41a6066@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC6ldGQC/x2NywqDQAwAf0Vy7oKur7a/UnrIxqgBuy6bWgTx3
 w09zsAwByhnYYVncUDmn6is0aC6FUAzxomdDMbgS1+XrX+475qEnH66um+ntBGlwRH2TYVdE3C
 8g5UBlV3IGGm2Nm7LYjJlHmX/r17v87wAHeVfGHoAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685366063; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HCX2t2IpEJi3Ewotxu4yw477Xe5XBmpX0dNgEJX7HRE=;
 b=nu3AraB4RuAKTz/bmTDjL+iPvuPh+vQEXzapurFyk7mkgB0ZA/6feFwBbXFFTGFUZ5xL7YMaA
 +WgPuuESRNoCu6cN3u5vkMonudeJ6V369hYUPU20WxXzmvlMTQaftHx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPUCC block on SM6375 is powered by VDD_CX and VDD_GX. If the latter
rail is not online, GX_GDSC will never turn on. Take care of this.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: clock: sm6375-gpucc: Add VDD_GX
      clk: qcom: gpucc-sm6375: Enable runtime pm

 .../devicetree/bindings/clock/qcom,sm6375-gpucc.yaml  | 15 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c                       | 19 +++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
change-id: 20230529-topic-sm6375gpuccpd-ca741a64baf8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

