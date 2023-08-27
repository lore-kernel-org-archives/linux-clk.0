Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F46CC83F13
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 03:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjH0D2i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Aug 2023 23:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjH0D2K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Aug 2023 23:28:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D01BC
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 20:28:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ffa6e25ebbso3773956e87.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 20:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693106885; x=1693711685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48xtmF1RnTb+8jPIXovOcqZJ91keOMez755QP1H58RQ=;
        b=XWRUrkYylmdHJ+m4eo20x5wpsT8zClDJNCgFw/AyBsMmAzdCWa9qJ7gPcZU9/JLX0v
         wk1WCbbEpUTPKPUcU0tQYwJhLL6wt+0/NmYq26bbD8E5nZPV54Q0P8dLT/jHh4NRB/5P
         MkhZwNh/fihWnNKvX5rXIY4RvMbMmBdJmvwokHsiPttOCHLuY8s5yhFItiGYSyUfXGMx
         jTxAAL2zUYiuKFDeIdF2cdQNDu1kb+AvNGG33xrXDs1q2M8uje+M3QqXIfRzbFvSXJVp
         +wgR9zp5qtuA2wK5S+90Soh6+sp6yGTnPiLhOk/RoUtWwUGZQ6g3mquIO46rNwquUnRZ
         ViIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693106885; x=1693711685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48xtmF1RnTb+8jPIXovOcqZJ91keOMez755QP1H58RQ=;
        b=ZDyBcudH9GN3xaC2KoXyDmWRM8VGn+AkbmekozRPIqG/FsHkVUuXJVF3iQ9x93/hm4
         43DE/42eVhYAhqfEeoS1CyMbAyCn049GAX6Q4tfbWIXJgJ4fZFKmjK7cabLJX1Qx+Lbc
         PpoZk8qbBjswcX9rf4zMLa3BSmOqdQOaovaVXlEjqBL4ojk55ArLuI3h1nlzhywkXluO
         z3Z1g5daBWmPjj4QSl/OmZkhlUyjTtDeSLjZm4qe29jAM14YFQ/YzuI1+6HjS0qDGsUA
         BeWa97M/wjKyoLJNuf/RkTMBp+9WwZnKcHXx5fgpYgu0KBRknO39Ew9op3+7bFf+r41U
         itcw==
X-Gm-Message-State: AOJu0Yyj6Rnal1PjJip8fVhqLXl5Bz9NjpFOIrybBOV6kxHu5rYItxZf
        HGtE2wPKHe9mZ1JWXoUHgkcMRg==
X-Google-Smtp-Source: AGHT+IEP1TwgavtqGqI8GF+JZMvSgf4yFA5cu5rgQxO5fBAFgONeasxDuVAOx1984PXjxIsEg9lenw==
X-Received: by 2002:a05:6512:3ba2:b0:500:91f6:f129 with SMTP id g34-20020a0565123ba200b0050091f6f129mr6263855lfv.26.1693106884785;
        Sat, 26 Aug 2023 20:28:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w7-20020ac254a7000000b004fb99da37e3sm955709lfk.220.2023.08.26.20.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 20:28:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq scaling
Date:   Sun, 27 Aug 2023 06:27:57 +0300
Message-Id: <20230827032803.934819-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a split of APQ8064 cpufreq series, as requested by Viresh. This
series includes only opp and cpufreq parts, with the DT and soc parts
being split to a separate patchset.

Each core has independent power and frequency control. Additionally the
L2 cache is scaled to follow the CPU frequencies (failure to do so
results in strange semi-random crashes).

Core voltage is controlled through the SAW2 devices, one for each core.
The L2 has two regulators, vdd-mem and vdd-dig.

Dmitry Baryshkov (6):
  dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm Krait SoCs
  cpufreq: qcom-nvmem: create L2 cache device
  cpufreq: qcom-nvmem: also accept operating-points-v2-krait-cpu
  cpufreq: qcom-nvmem: drop pvs_ver for format a fuses
  cpufreq: qcom-nvmem: provide separate configuration data for apq8064
  cpufreq: qcom-nvmem: enable core voltage scaling for MSM8960

 .../bindings/opp/opp-v2-kryo-cpu.yaml         | 12 ++-
 drivers/cpufreq/qcom-cpufreq-nvmem.c          | 80 +++++++++++++++++--
 2 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.39.2

