Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF84C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 11:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239932AbiCBLGQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 06:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239415AbiCBLGQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 06:06:16 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3FA4A3FC
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 03:05:30 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d187so1614200pfa.10
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iM4tqoBNZnRDhHlhJv4qaUp41vM2/itvqk+JO0plpzU=;
        b=eUCFUBtB8g0HcK0Dm6lzd43xTsjUZvZy+n8LQ7kZQiOs8hWrHoopwzWWggNY93Kth/
         d+yg12rDsIzVf25SP9oTp5FxUy9c7NkqTmGgGLdn7tyqW/nDr780P+yvFBiU5EQousk4
         8sF3aEpksyhIccyC3cM2mH4iDzP3NwL0I57CYqkOZCBILQKhuvZJVPOLGySLYvx/yXwh
         I6elZu4Ycv6/m7nev9kSR83Qi7GDI/FnMQVrrxDTYB5k+y8RspG3E10tHtL55dXk1NuM
         A8+SxU51PuLkX6Sw3L2WJ6uX0gpfMDEV2TZLS49hJbLwt/YRIWVY6txZDZQwPMwPUTSu
         0amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iM4tqoBNZnRDhHlhJv4qaUp41vM2/itvqk+JO0plpzU=;
        b=WULN/7KjKL2zA5Y4av116NhHO3yKkZ4rQ7WoPAO++QIbLGyK/PpBiGRXwdpO85uoJ5
         l2p+Kx6kghA+sPZBwgPIXM0OYeqgw3JYlI/ekrHdJ3hEBp5f/u395l3nv0wV/WLCftsZ
         RMtc7+RFK5OsIY9G5dLmLdQTRS0oNmOU8blqAf2Kee/TDMz0/IxEiOxPYoA8TlDRTQBo
         6JRku+l5OaVwDXihOMFr6TAfAF23o+I+F3DnzoxvUGOhpugr4oq73rInQvelwv0bOOk+
         TUYkMoanrJB58UOjulYKjziWGzKMemaAooxAgnmSUZE98VuY29uROGFmBKKvdZQR97A3
         AI/Q==
X-Gm-Message-State: AOAM530HE00SlHBcZf54mPIVGM8fdjROVMztbh7/r5qTs3sK3ys82cFt
        26wqZ5O/mRMthtAxRUXzkuhloA==
X-Google-Smtp-Source: ABdhPJxeyMaemFdosUe7a1Nz/OmLGcqy/zp1HyS7opVeuNuR2PmDhFIdpuZN0hRH0U2QcVKyK817Qg==
X-Received: by 2002:a63:2a45:0:b0:373:1850:d5b with SMTP id q66-20020a632a45000000b0037318500d5bmr24767273pgq.563.1646219130121;
        Wed, 02 Mar 2022 03:05:30 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id hk1-20020a17090b224100b001b8cff17f89sm5049186pjb.12.2022.03.02.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:05:29 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/5] Add ethernet support for Qualcomm SA8155p-ADP board
Date:   Wed,  2 Mar 2022 16:35:03 +0530
Message-Id: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v1:
-----------------
- v1 can be seen here: https://lore.kernel.org/netdev/20220126221725.710167-1-bhupesh.sharma@linaro.org/t/
- Fixed review comments from Bjorn - broke the v1 series into two
  separate series - one each for 'net' tree and 'arm clock/dts' tree
  - so as to ease review of the same from the respective maintainers.
- This series is intended for the 'arm msm clock/dts' tree.
- Other changes:
  - Dropped [PATCH 7/8] from v1.
  - Added more background on the emac gdsc issue, requiring it to be in
    ALWAYS_ON state in [PATCH 5/5].
  - Collected Ack from Rob for [PATCH 1/5].
  - Broke down v1's [PATCH 3/8] into 3 separate patches (one each for emac,
    pci and ufs gdsc defines) - one of which is carried as [PATCH 2/5]
    in this series, which is used to enable emac GDSC.

The SA8155p-ADP board supports on-board ethernet (Gibabit Interface),
with support for both RGMII and RMII buses.

This patchset adds the support for the same.

Note that this patchset is based on an earlier sent patchset
for adding PDC controller support on SM8150 (see [1]).

[1]. https://lore.kernel.org/linux-arm-msm/20220226184028.111566-1-bhupesh.sharma@linaro.org/T/

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (2):
  clk: qcom: gcc: Add emac GDSC support for SM8150
  clk: qcom: gcc-sm8150: Use ALWAYS_ON flag as a workaround for emac
    gdsc

Vinod Koul (3):
  dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
  arm64: dts: qcom: sm8150: add ethernet node
  arm64: dts: qcom: sa8155p-adp: Enable ethernet node

 .../devicetree/bindings/net/qcom,ethqos.txt   |   4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      | 144 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  27 ++++
 drivers/clk/qcom/gcc-sm8150.c                 |  40 +++--
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |   1 +
 5 files changed, 203 insertions(+), 13 deletions(-)

-- 
2.35.1

