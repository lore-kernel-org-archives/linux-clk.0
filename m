Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC70C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 19:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjDMTQn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 15:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjDMTQl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 15:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7BE6A62
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681413349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=CyFNTW2bH08UNfrtJb8ahm47RC7NlEjQsoGfNVxd6ws=;
        b=Pn72E2z2A/nbaZXtdBpWLFRjKBVBuCxyUdc2XMCc/1AQIFpr+w9Cfuzmaklr+88rPH4lSf
        dSOr+/pjr00lIeJAOgeH9/ytlsTu3WeLcr6JOQClQYpPo8xSoPAtFrngtYbeTNlQQ/WOgv
        e0vptqrVSSR91Y0P1FxVECA/QJB4ic0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-g2HRqnJDNUiRxExBvVeVCw-1; Thu, 13 Apr 2023 15:15:48 -0400
X-MC-Unique: g2HRqnJDNUiRxExBvVeVCw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-54f89e7de94so73670347b3.17
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681413348; x=1684005348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyFNTW2bH08UNfrtJb8ahm47RC7NlEjQsoGfNVxd6ws=;
        b=lfiLCToshZawC+jGAmueCstixKkltyHm8PI2Dqi3ve/zVJuELtHgQyb3rqSh7Xl5jz
         UJZiRwoXRnfcJ32QrjM0QV+hyXzcKjHjO3qvDL2ec1jLgaOiC3LzgnnzqpgOc8Hcmctk
         g1hLqrZFmWfqk/3n73amxNMhCVJJg/2XH7WMu/UjLKA2jjWb9rMMPvIK43JEAZlAUNtb
         bofbF4aT9mBfN4E/bfqbEUdV7xW7g+SPpd0jXQVjmjRlWT6XKSCBUIGuh+WGtB9TwCSb
         +2HNGtgPhf2xqDZePvtPuzsOruYjGBCr04wWhiMjzaLKwuaonsD3RB6xiRJd5AdA8Sa5
         gmHQ==
X-Gm-Message-State: AAQBX9eYHkabm6H9hoN99bNbw51SYGfMuKMjoQOh5g5DBskJqDAAKUYP
        TmMvdEx6qIIRp9pAQZ9MxBf95aiHsd0V3p3uTD64Mn84WAevgoa4hflxOpdQvvSVcogNr3oBK5f
        GV5iEOCSn8VFvFMT8p8op
X-Received: by 2002:a0d:e294:0:b0:54f:d7af:dcd6 with SMTP id l142-20020a0de294000000b0054fd7afdcd6mr2199269ywe.46.1681413347945;
        Thu, 13 Apr 2023 12:15:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvf+9dFJiV7NYQfmxvquuPW7kwpw7eE2uZJXlwN9RCz9ZUirWDC0RIWTbAHjVvfF+Pfo+i5A==
X-Received: by 2002:a0d:e294:0:b0:54f:d7af:dcd6 with SMTP id l142-20020a0de294000000b0054fd7afdcd6mr2199256ywe.46.1681413347695;
        Thu, 13 Apr 2023 12:15:47 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id t11-20020a81780b000000b00545a4ec318dsm673203ywc.13.2023.04.13.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 12:15:47 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v5 0/3] Add EMAC3 support for sa8540p-ride (devicetree/clk bits)
Date:   Thu, 13 Apr 2023 14:15:38 -0500
Message-Id: <20230413191541.1073027-1-ahalaney@redhat.com>
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

    1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
    2. A new programming sequence required for the EMAC3 base platforms

This series addresses the devicetree and clock changes to support this
hardware bringup.

As requested[1], it has been split up by compile deps / maintainer tree.
The associated v4 of the netdev specific changes can be found at [2].
Together, they result in the ethernet controller working for
both controllers on this platform.

The netdev changes have been merged, so this series should be good to go
assuming it passes review (with patch 3 being the only unexplicitly
reviewed patch).

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
[1] https://lore.kernel.org/netdev/20230320202802.4e7dc54c@kernel.org/
[2] https://lore.kernel.org/netdev/20230411200409.455355-1-ahalaney@redhat.com/T/#t

v4: https://lore.kernel.org/netdev/20230411202009.460650-1-ahalaney@redhat.com/
v3: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#m2f267485d215903494d9572507417793e600b2bf
v2: https://lore.kernel.org/netdev/20230320221617.236323-1-ahalaney@redhat.com/
v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/

Thanks,
Andrew


Andrew Halaney (3):
  clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
  arm64: dts: qcom: sc8280xp: Add ethernet nodes
  arm64: dts: qcom: sa8540p-ride: Add ethernet nodes

 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     | 179 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  60 ++++++
 drivers/clk/qcom/gcc-sc8280xp.c               |  18 ++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |   2 +
 4 files changed, 259 insertions(+)

-- 
2.39.2

