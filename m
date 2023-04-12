Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D06FC77B6E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 14:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjDLOxQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjDLOxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 10:53:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD963A3
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h12so10114749lfj.8
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681311193; x=1683903193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo0PVdHC7kP43WA73kPUfBUKoSLqf85EiM6RS5+7abY=;
        b=IO4AXact9XduaF0D+qwBwd49iBb3FQ/YCz4SFI8z2YIai6VApG1qyRZXQaSTX9Fp4B
         sKiHxQfUrdKE2/cqiuSMc0b3by1vRC07q50R1Y9z1KMowYEBNpgiwRpu6vZYmFaI/Vz/
         hgSspkbfkhc9XDzARqqeU1Co3txq5EVFTam6A9KH++L7z1UJD61VxNLGt2QvxhZYxBz3
         AThHeOHUEuUwJSbZlPBeE7Ce0fzMwppSvc0iv5ojVXg/FICpdIgqJsVeEyW0ahFgc0xx
         jZRa4T/p5EWzxRgAcp/t8KwNWUYX+RlNzox/iprORYwWkA6VPoFlk7N5GKgsU0uzDRm2
         L9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311193; x=1683903193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo0PVdHC7kP43WA73kPUfBUKoSLqf85EiM6RS5+7abY=;
        b=nplkXgqfgOVCTH3uKjEUob3AOsvE+x8JWCvB5VSrJQNMH7HrzfGnSkysyAkywxHF8j
         cZ/kQWaA1wUlvBINAA+NMO3T3VIvvIwKiAi6y3/8I4cEiabGgMsL5wvWsVMCjZ/G11qZ
         HqMgO+xllyimT0HKoLliQVGG+vHT1GoQ9mOxMZvRQps4Pxkaw5Ff4uDE6+Nl5UrWe8CB
         X6NDwhDicT1XwSCjg9gnkpfmHCCgNq3XUB0diDQWkpQKcN4K2/0E0ZG6YYbU9VDhMgda
         7WgCtr7Q3j46+zRmTUyYXs4Dt14z7tf2XoqTRLyFPEsar2J8xa7qpXZEIvKRUjpLYQr4
         OQCA==
X-Gm-Message-State: AAQBX9dQDS9uN3C+DmTABlTofim+jkgAHBm26vvLSNlItJ2UmZDRGTNP
        tmH36/Qb3pjUwQVs0FTwnmgnow==
X-Google-Smtp-Source: AKy350aryqi+RuV9ljHi+CiqeqROnOEaSpFLworokp2d3dRVTqbHuPLuSNQpo7lLT4JuNVeqQaf5VA==
X-Received: by 2002:ac2:418a:0:b0:4eb:2d47:603 with SMTP id z10-20020ac2418a000000b004eb2d470603mr3524825lfh.47.1681311192963;
        Wed, 12 Apr 2023 07:53:12 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004e95f1c9e7dsm3015367lfl.78.2023.04.12.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:53:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] QCM2290 dispcc fixups
Date:   Wed, 12 Apr 2023 16:53:04 +0200
Message-Id: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDFNmQC/x2N0QqDMAwAf0XyvEDtZKC/MmS0aZwBV2vjxkD89
 4U93sFxByhXYYWhOaDyR1TWbNBeGqA55CejJGPwzl9d13rc1yKEG70eSbQQ4dTdKCYOHHsHlsW
 gjLGGTLOF+b0sJkvlSb7/z308zx9Qoh0UdwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681311191; l=639;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3pZCCb38mF6dE6fGvbscnrKT4drmGOehX7gKEqn0iY8=;
 b=vYBbHNflqlhC9OjbffvWz7vSYZc7FAEIPLGCRDfUV8bc8j+/qXj1oyJSQeNY8xV2iG5Qc/V9L35X
 HF0hXTgXAh89Q1wW8RoJHXlP1dKvROOiYLpzVWsML1/ZXBnDAuJH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I noticed some very msm-downstream-y bugs in the QCM2290 dispcc..
Let's fix them up..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
      clk: qcom: dispcc-qcm2290: Remove inexistent DSI1PHY clk
      clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling

 drivers/clk/qcom/dispcc-qcm2290.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
---
base-commit: 7d8214bba44c1aa6a75921a09a691945d26a8d43
change-id: 20230412-topic-qcm_dispcc-f46cbdeaeb90

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

