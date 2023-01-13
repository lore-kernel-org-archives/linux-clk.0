Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED147C677F1
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 09:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241099AbjAMJLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 04:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241177AbjAMJKW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 04:10:22 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F7073E3B
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:48 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so32186381lfb.4
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSmE9cynsrYFh6rLY5hIYK83BZ2PiKJQicmF0TXjgHI=;
        b=O818piWKVwWTAlBLjP7+WiAvM94Ja+tEgOOBWTdIwlXn3o+UStwTdfcqWLzbaNGNrF
         0zOucrzuLUKSUH2qTKs0CXuvNchvdQgR4gMOA2U7gjjd5V6CAv6AYxtDZQKpqSqPT5gI
         /K3XPjtZCGr8bSEsV5rbdsGLqUfmVBhvNw7suFDaOol3VuaYvFMo6gcQ4OmnmUIlcnhR
         s007J+lvXDiOyvlBYzkBsH1JPhT/s+c6VlOhWcvaScZwlY5xDcank6G5CQ5vwnZmLdlf
         vsq8Ex9JJ40UV3v/cBGf2tH3wrT7hK22YEJ3lq8IDqovp0RoCsogJ671qpLObDE6qOi9
         o8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSmE9cynsrYFh6rLY5hIYK83BZ2PiKJQicmF0TXjgHI=;
        b=EE5g/vTqh27j6n7ehIHh+YL1EG5wq6h92un68OTn7/CfRn/ccVPvHRPctM0MaP5KPw
         8S0sPgsO/ANdmPqMBYiPWAZXFZCQ8LjU97+BDGOIZQbzrKUnaQMFZnTFM4KFPVQMz6D3
         SPVa5o2Xhr17LqsL6YOlpP0Hh5yzuUtgFlQxJEypRE9BHe8/42/X395RtkIdCI1ZpFdn
         eEzdKJ7GHJ+8wbsGAmrpCqEvrk29/Ipu9RL5LLblVU3Bkxo3DxEZ9WsJWBIIdWvsPEqu
         Y4z8JcG1avT2+cV/qNMcsF7nwux19ZiENuttMzxyIkle+O90+W0LLz7oOeFyzOvj2oQB
         Fcnw==
X-Gm-Message-State: AFqh2kqS2mfgvuus2F1ooo28aD6LZLm3y27Gxfsj5Nj+jlUf7RURSHk9
        QonOupOD9m7rxfb4kyEi2hEvzA==
X-Google-Smtp-Source: AMrXdXv52XNgEnvFlmIuqurMzUPHvUK49R14rOwiq/ZuyaFirHZMRKKJsHyWuK6gRqbDTtg4ERbbKg==
X-Received: by 2002:a05:6512:308d:b0:4a4:68b7:d61d with SMTP id z13-20020a056512308d00b004a468b7d61dmr23034123lfd.4.1673600866715;
        Fri, 13 Jan 2023 01:07:46 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: msm8996: add APCS clock driver
Date:   Fri, 13 Jan 2023 11:07:35 +0200
Message-Id: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sys_apcs_aux clock can be used by CPU and CBF clock drivers to drive
those clocks from GPLL0 while doing initial setup. Add simple driver to
setup and export this clock.

Changes since v1:
- Removed the clk.h header inclusion (Stephen)
- Changed the module license from GPL v2 to bare GPL.

Dmitry Baryshkov (4):
  dt-bindings: mailbox: qcom: correct the list of platforms using clocks
  dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
  mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
  clk: qcom: add the driver for the MSM8996 APCS clocks

 .../mailbox/qcom,apcs-kpss-global.yaml        | 10 +--
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 76 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 80 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.39.0

