Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83475C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64163610EA
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbhINDWU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbhINDWG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 23:22:06 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B252C061762
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:20:49 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n4so7223516plh.9
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=evU0I9HnPhgr5ohWZx9jr9eeUj1gyXGQSZ1qih7ewsQ=;
        b=vFkKjmn9myJ/WwjipewJfdVMZf/gzpnDh21+ca0Et4u9BXQ7MJtB2v8U1dFXgo4G2k
         blhyZzgesJNZy3/f4iSyo4xA0UETFLbTEp9fnWCbSwO0V9qdB0QTT7eDtyU9XgxITDgh
         q96znINhWc7XoE6oGNYtpfl6pkn/Zsy2L+Jfktx1mqt7eZp9a1ohfIjv2Rh6qDO/hjO/
         vWW0sWbRikGHilXi/PBLgnwAbEp8BezQ/nBO46VycSuxCxzK70cvJs0EmK5mlG/1S+J7
         SEVDCnr/oRUG85mkrNZ2yIKHCLZWsylMNUg7uAA0jmGSQE4eDJh7vkivnkWapPAU/sCT
         WEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=evU0I9HnPhgr5ohWZx9jr9eeUj1gyXGQSZ1qih7ewsQ=;
        b=LhhRdfawRRf+zjtR9M3ZJF1ACo+zL+PR/h5ws1hHD+dlyPOD09VXsyT9IODHlCMhgU
         Q/V3pNZwal9F7wqgI0389cq8eIYbmxD6yI7X86KjgFrBS/ot0z+cNqOLNDgCysf9m3zD
         dSuMV4AZfTOiMtR22TRVGXAib5eRLGle/V5GrGdDOvk/4OfB9NqSRJNfo6JKi99IW5wE
         sGixRtB8xxtIycOrrJq0g4cMjq9I9EiIMAB9Y2gOVv1SakkyWc7piid1ZJU0HGianknF
         56djeajgRfwpffr7s3P19miMuXohSlIX06MDsZCiaD/CdudH5zBzK9KcPJ+KyvdoJzgq
         l5Gg==
X-Gm-Message-State: AOAM530YX2D7o1N0hpOjqvsqZfKqQe9uJK2jfRAFfv3fhcUHbOjWUetU
        mWF54FjsefNrJ6k9L1B/tJnRaQ==
X-Google-Smtp-Source: ABdhPJxIyQS1srZp9DOkaJINQH22lKR3XD3oL6MRF2rFo6uIbf1esGRLezTtlN36pPLaf73feW+VpQ==
X-Received: by 2002:a17:90b:814:: with SMTP id bk20mr3048004pjb.108.1631589648946;
        Mon, 13 Sep 2021 20:20:48 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t68sm9714498pgc.59.2021.09.13.20.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 20:20:48 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add QCM2290 Global Clock Controller driver
Date:   Tue, 14 Sep 2021 11:20:39 +0800
Message-Id: <20210914032041.6547-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The series adds QCM2290 Global Clock Controller driver support.

Shawn Guo (2):
  dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
  clk: qcom: Add Global Clock Controller driver for QCM2290

 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-qcm2290.c                | 3007 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcm2290.h  |  178 +
 5 files changed, 3265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
 create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

-- 
2.17.1

