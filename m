Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6DAE74913
	for <linux-clk@archiver.kernel.org>; Mon,  2 Oct 2023 18:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbjJBS7s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Oct 2023 14:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjJBS7q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 14:59:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01B3DA
        for <linux-clk@vger.kernel.org>; Mon,  2 Oct 2023 11:59:42 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50437c618b4so31636e87.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Oct 2023 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696273181; x=1696877981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZip/SoWAYWjoJLiogZdNAb2cSzXOUGAYIfG+e2fOpQ=;
        b=AhPnttFaZgmSXHW+UYfdOoSYYCvIVqBFxhVLWvZPKT2iN0KrUuX6MtNE3jlZvKnahX
         XSuMlpwNQxouAjyeNkA2MUo7TA0oEZUTpuhwNGKt/97nX9iOiFeEZYc8YHgBqslbIEBq
         pigfZdtu2Gl3+i1SF9RTRDWGDuOHE3FnV2a7qQe4C+UERZqKtZNNyg0fzwMjaZtLUExl
         mD0jHLwNCKanvGEDiuntph0/OjKRzIM9jd9jgzp5vIZ+srRW+U9NAEd2MEGF0I9aQv/N
         oN+IKoYwQgi+R9Hze4u5t7KpruD88gkAhYY/SKdLcTc3EMoaUgx638ZuTieLFATe8wgY
         H1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696273181; x=1696877981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZip/SoWAYWjoJLiogZdNAb2cSzXOUGAYIfG+e2fOpQ=;
        b=mCvZ73A68CNIF1m9ZpnhynN6q64wQXekQo6XPf0k+38TKP5KoEiRyongU6Grf7iURV
         jnpW7O2Gzi/67j88o1PeE77P7GGxCkxmffOnlq0wFGp6TnR9wRv8efgxhoT+/fUjDaw+
         uSjrEtaCl/3se4o+I404LKmiltfeSGJrzp291bxP/kFCO6K+6tswOQAkxwOu7FcQ0Wj4
         WNbZKScWCskQT4OjWuebvfvqjy/kZBT7dXT5n1N2YLHbA8UjdBJYOmkionyYgizpseuG
         xKBVEdU31wD/nSBrtLINWfnXgxrcKi/ocRqcvenrIUiX3mptjEKX14Q5yPKevlCXDTON
         Po4w==
X-Gm-Message-State: AOJu0Yx94iOzmhunk+8bBR/+8C+r6iNq9zicpDxRJKMToEGFgmqGH6yN
        oA54VeHgp3Lp3vDTYGAL9kA74A==
X-Google-Smtp-Source: AGHT+IGjb5Jg1XcmsDdZdl0z4qoFlhyD+DRcYLLU1OIqismvL95SROetVKjucOuOZ23za4jdB/J2qQ==
X-Received: by 2002:a05:6512:3e01:b0:503:3453:ea7a with SMTP id i1-20020a0565123e0100b005033453ea7amr12823132lfv.66.1696273181222;
        Mon, 02 Oct 2023 11:59:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t6-20020a19ad06000000b00502d7365e8fsm2443981lfc.137.2023.10.02.11.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:59:40 -0700 (PDT)
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
Subject: [PATCH v5 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq scaling
Date:   Mon,  2 Oct 2023 21:59:34 +0300
Message-Id: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
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

Changes since v4:
- Reordered variables in qcom_cpufreq_init() (Konrad)
- Fixed of_platform_device_create() error check (Konrad)
- Dropped unused ret variable in qcom_cpufreq_apq8064_name_version() (Konrad)

Changes since v3:
- Split the series (Viresh)
- Unrolled loops in krait_l2_config_regulators() (Konrad)

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

