Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F3AE8FDC3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 01:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239603AbjJDBXP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 21:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239531AbjJDBXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 21:23:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB933AF
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 18:23:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435ad51bbso1776643e87.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696382590; x=1696987390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZOGHdiWccaH+lI+d4c46L7IxfGyvf8H8j4Ss2u6XUM=;
        b=TBRGA4Yp9FS21O3zyHFbn/8MSIXusOs61P5q5+KmnqsoHUgQMkp0lKoHVrjdQrCuZx
         ib96chpw89K5A3f6m7dqRaYkuwz4wgMH/kGD9x/FSVw+8DQXsssvnmxAM9hgaO3Nwd9e
         JARCqCRX7jJnU6qo+mqCpfSHzkYVdx7pZ3RF+VipBvXoWWT8LSoXNiOA2I9KXcTovZx+
         0p/kvo9BGl00xn4HtfRKj60gFaGuH+pjMUFYA8IcTyargw2WqXgLznTBvDnF98SEQS22
         fcdW4dCkPe6BdDBCcwBPWPa9sAf4u7Rqj1UcPN+Y2wFTWNM9zZidyWi95HnZW9RFkqYL
         Wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696382590; x=1696987390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZOGHdiWccaH+lI+d4c46L7IxfGyvf8H8j4Ss2u6XUM=;
        b=SvLCSNC3D2vDTqMA23raI1KNOKtsi/dC7fR+nGUzJpOUCa0Tcm6XrTxgMJlSYBpzeW
         4OmBOrQc2k+A6qke1QDaRFLmliCBSXuWBxTrnxQNoizqanwG6n6clDJQiNwe/aXOB4V6
         0E6iU1itmEbdKN7gJ8vS6cciNOLQX/6/0da2JwspD5l8DASH6CCQX7bzbhTTpxmiZX3l
         ryqY5O98Lc7mtaCLRge6//U+5pQAA2cyNK35bC1eyWPAQr3xigVQWx/EboEsvHDPJ52V
         fKsckmSRweL5Mis3ZN0aemCXnDrxCEVwedsnkkpaHwaoYrpScEjKSa+s+HkDPBYOi6wF
         PB3Q==
X-Gm-Message-State: AOJu0YzGAvUk1+oFeO47gLm+0MuNMTrmKODPU8NdRbaC0UJ42Qzt4FSe
        SbKIrV3BVUkgQLWWMzSwkATNrA==
X-Google-Smtp-Source: AGHT+IG+sf42x5UqgX6/tUnADMw8ywfyluNYFJxrjCn5F89fxCcebmJvXrjI2e0zvbIZZXO7gGVTKg==
X-Received: by 2002:a05:6512:b1a:b0:500:9a29:bcb8 with SMTP id w26-20020a0565120b1a00b005009a29bcb8mr785860lfu.4.1696382590028;
        Tue, 03 Oct 2023 18:23:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 18:23:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH v2 0/3] clk: qcom: provide alternative 'parked' RCG
Date:   Wed,  4 Oct 2023 04:23:05 +0300
Message-Id: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement an alternative for the clk_rcg2_shared_ops, which also
implements a proper is_enabled callback. Note, to use
clk_rcg2_parked_ops one must remove XO (safe source) from the
parent_data, parent_map and freq_table.

Changes since v1:
- Replaced a call to clk_rcg2_is_enabled() with check of the CFG_ROOT_EN
  field (Stephen Boyd).
- Added the init function, reading the default clock configuration and
  then defaulting to the lowest supported freq / parent if the clock was
  not configured at all (Stephen Boyd).
- Dropped P_BI_TCXO from freq_tables too.

Dmitry Baryshkov (3):
  clk: qcom: add helper to map parent source to cfg value
  clk: qcom: implement RCG2 'parked' clock support
  clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 56 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c        | 12 +++++++
 drivers/clk/qcom/common.h        |  2 ++
 drivers/clk/qcom/dispcc-sm8250.c | 13 ++------
 5 files changed, 74 insertions(+), 10 deletions(-)

-- 
2.39.2

