Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D2DC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 18:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbiLBS6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbiLBS6r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 13:58:47 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2EA9D2E1
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 10:58:46 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b9so6381854ljr.5
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=myayZNmEVp8o3RlAnMfTfZSp2nHYaLSYb89ntLcNqrs=;
        b=hvOgGW4DVy/fLDW2l1zkB3irnYr9jD5m/hq9O7/rq9WU0P0QoMSEVMnMlhLJEv92H4
         zAmQW07zpvX0VRl/vrH38aXXh3/e7z/3iYUJ4pQdH55aKJkHv/HB3YVl9N5AtQMdFHpH
         QPaFfO3GOBXkr8ByTbgdMjfXionazcgcSTnodPhy/I56birKbyO5Rwx0dtCf89hg8k34
         T+NaggPFWhBEAcXRa/DPaidlP9nsijnsbJgwQw3Zp+itf3iM6jPBYQMNXhjl8uc9hnEP
         BdTrL3m8a5UgBMcwxGf81CMXOSerNyAFCVBTOH8F9xbHkASp8xXvO4YBd2N2CSHLOQVp
         edXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myayZNmEVp8o3RlAnMfTfZSp2nHYaLSYb89ntLcNqrs=;
        b=YaUqnD/47jfxDNTZEm5L5YPz8lDEuyZpwmA0ccGJqzpD2AXcnvSvsTMwr5nIr7lJpn
         Ird6Li2TQowzEhlhdmItCMlIHb1com7Z0Jl4HAImq+qpqPhglmNOoIPRA/OVtjIgKE+b
         /DqNIuO3WQPgxP6DhOVSzlu9o+kE/e2gpiDAfWODnJeW9GkGqUwFTkXwxS1WfFgfV2AE
         7D2HVjoJ00bZABrHIf3pZRm9fHAWq2ARsp0AUwlGTVGlrsmJdJRMTLpiNlfI2V/HWSPa
         dXb2u61uHCSBDxKBMDZN1sPSLhmEqWpoGQeb7UGHS93LhVBz24nJbbeWQsSbLSXxp+Q6
         XuAg==
X-Gm-Message-State: ANoB5pmrnWIIPs0YarUNUM7Joo61g/1WHVmDM2V1OSJ3yTQxUwyIhPF/
        fxMXovVjqjpA9Km5VM4hCv26Yg==
X-Google-Smtp-Source: AA0mqf75LqWNvLtOak2N3tqLeeEgo8APB3wBiHt07VILCKW9lGr88WoRIq4agAaBisipVn/xcVZyQg==
X-Received: by 2002:a05:651c:1a10:b0:277:5059:82c9 with SMTP id by16-20020a05651c1a1000b00277505982c9mr18980920ljb.218.1670007524529;
        Fri, 02 Dec 2022 10:58:44 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 0/8] clk: qcom: rpm/rpmh: drop platform names
Date:   Fri,  2 Dec 2022 20:58:35 +0200
Message-Id: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Both RPM and RPMH clocks use platform (SoC) as a part of the clock
definition. However there is nothing really SoC-specific in this
part. Using it just leads to confusion and sometimes to duplication of
definitions. Drop the SoC name where it is logical.

Changes since v2:
- Additional rework of ARC/VRM clock handling as suggested by Alex

Changes since v1:
- Reworked and split the Soc-name removal patch for RPMH clocks

Dmitry Baryshkov (8):
  clk: qcom: rpmh: group clock definitions together
  clk: qcom: rpmh: reuse common duplicate clocks
  clk: qcom: rpmh: drop all _ao names
  clk: qcom: rpmh: remove platform names from BCM clocks
  clk: qcom: rpmh: support separate symbol name for the RPMH clocks
  clk: qcom: rpmh: rename ARC clock data
  clk: qcom: rpmh: rename VRM clock data
  clk: qcom: rpmh: remove usage of platform name

 drivers/clk/qcom/clk-rpmh.c | 421 ++++++++++++++++++------------------
 1 file changed, 205 insertions(+), 216 deletions(-)

-- 
2.35.1

