Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BA7C6FD19
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 17:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjCMRAa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 13:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjCMRAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 13:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC21367C3
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=t5POBg1qZ82GqoEDaDaIA79xn4Mgw94E10MmvGFG+QA=;
        b=JLOjZqJ0RWQzrZ1tdSlDJBvZFrtJus2alQQIor9zsGGha4WRZUFDeQtdg6u3YhCIz2XfHA
        FVvcb6W6my2NiSH5eA3ipsebRU+njvFDFrWmbfzOLNA9xwUuRYzcdl/Vj4I0Gqds11NXBV
        XGYTuqMu8HtIYACOAHESkLTh6j6zFQc=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-YwZVYtUSOUut3ZIQk8NVlA-1; Mon, 13 Mar 2023 12:57:18 -0400
X-MC-Unique: YwZVYtUSOUut3ZIQk8NVlA-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-17270774b8fso7539570fac.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5POBg1qZ82GqoEDaDaIA79xn4Mgw94E10MmvGFG+QA=;
        b=LeUQs5Lh+dL5Wb66gYaCMirFDt18zizgMmb/slw9dc3GwMkhmzvfWQVUWEBvmdgVup
         qusdqLQitwzUssZFTUVBh3ZsYL6bJ/xHP0yAqLXTU/SYlb3c+7YRh5reViYannB8X6ov
         EoMZNRduesU+F+23FIyBSBlufCLyvuUoQoRYn6N6TRkruqeHFlyZKYFGo+rA50b+CwRz
         FFX5Ru8hoOq4Ie16+9iVvMdRTnzlLT4uM3ybeZqlFvRvpat/IXn7xpfzLCpJg+N5gbtl
         73tzD/RCJSKp4a5lqY3qOBRfjhuDFTS3/n5ol/bMo+v/PzYaVDf4ZZZo/vVUvgGySKhg
         /T5A==
X-Gm-Message-State: AO0yUKWoNXh+5HkTY99G+QN5ZXMyv8fOmNOyIjjbruoTGCo1zEwPa0J3
        qjd6UttFAdsdx4tsbXTCKM3Z4k4frJeqp1TwFWd//WRgd7VvAgLkFnDBvwOtUYVkSmwDA7zLXZd
        M6HDDzzRdyyPdRvP4T+Ip
X-Received: by 2002:a05:6808:150:b0:37f:b1d6:9f3c with SMTP id h16-20020a056808015000b0037fb1d69f3cmr17439005oie.46.1678726637931;
        Mon, 13 Mar 2023 09:57:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/DcZ9ZIOTk8pbqQbIpqBKMFacVCaRW/B1/QFZ8b2XK2GO2nvasDBBZ4a2w0GAU24OnbrYXGg==
X-Received: by 2002:a05:6808:150:b0:37f:b1d6:9f3c with SMTP id h16-20020a056808015000b0037fb1d69f3cmr17438954oie.46.1678726636191;
        Mon, 13 Mar 2023 09:57:16 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:15 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 00/11] Add EMAC3 support for sa8540p-ride
Date:   Mon, 13 Mar 2023 11:56:09 -0500
Message-Id: <20230313165620.128463-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a forward port / upstream refactor of code delivered
downstream by Qualcomm over at [0] to enable the DWMAC5 based
implementation called EMAC3 on the sa8540p-ride dev board.

From what I can tell with the board schematic in hand,
as well as the code delivered, the main changes needed are:

    1. A new address space layout for /dwmac5/EMAC3 MTL/DMA regs
    2. A new programming sequence required for the EMAC3 base platforms

This series makes those adaptations as well as other housekeeping items
such as converting dt-bindings to yaml, adding clock descriptions, etc.

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17

Thanks,
Andrew

Bhupesh Sharma (3):
  dt-bindings: net: snps,dwmac: Update interrupt-names
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml

Brian Masney (1):
  net: stmmac: Add EMAC3 variant of dwmac4

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ----
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 113 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  11 +-
 MAINTAINERS                                   |   2 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     | 181 ++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  53 +++
 drivers/clk/qcom/gcc-sc8280xp.c               |  18 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 161 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  32 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 190 ++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 336 ++++++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  38 ++
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 144 ++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  29 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   2 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  17 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   9 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |   4 +-
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |   2 +
 include/linux/stmmac.h                        |   1 +
 21 files changed, 1164 insertions(+), 251 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.39.2

