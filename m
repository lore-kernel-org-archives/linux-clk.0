Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8DBC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 08:47:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C517561178
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 08:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbhIPIst (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235275AbhIPIss (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 04:48:48 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30FBC061574;
        Thu, 16 Sep 2021 01:47:28 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id w7so5446494pgk.13;
        Thu, 16 Sep 2021 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oop37z3HgR52li/vcT841jMFHjQvdsUm7P/yJllBQgg=;
        b=aPiWktH1fojagpTFlcRcfLEuiCp5oyhPbrWj4v1q+Y/+4sy4kaJUKe+62J5t0m0GRB
         Ph+BUjuguxP5IArbmycLpW4XuKazvT3WrZkytsvYBRXLoieljhtkUs3XqIveki2VSTgu
         65Tz9ZCvcX9+HebdpRNLWtcsveZ5d3MgscJyRmh1yPOVDd/MlSDAKmCe1KZBUeEO8Cpt
         eGUsMr8uEr/ny+Zs9rBOcPVp2Kid2NrWxTovR+ZP+zPquYbMnM+Ga3HMDOZrm2Gvwz4f
         NFHzJbIbWnSbsmYj6monQQ+Ip2SarSmtCIl/8HBn/jC/MYEOS15nC3n8MGHjD9AIzg0V
         l3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oop37z3HgR52li/vcT841jMFHjQvdsUm7P/yJllBQgg=;
        b=hMEWngUfV+cGf2/98+o4J7xTY+kly8oq7KYnJuHgpn7mJ8Jhyez51iK7ST/zR1p9bA
         BMvwNRi//AC6ehnEZlc2qIrl+D6FLjJqqP9+eS5JznEquqexoH5SAXCJ7ZBCxyKGpS15
         N5Ou3xH8PsFc2+OMLFnolTy1XQNJdg6CSy0AASGJRJvjr0XG1A6wG7PwkEKEvy+FitbO
         AeFCvFAet8vWNBv+2F/wLwXg7mCleOLfQDTO2WaFRGb2tDd8lU5V0iBlqUdD9e6OMPsu
         cFcuptjypXYDnomsBuCJIznOAb/TIQUjwDESmKJJ7qg4VWr3fnI7pcnMH56ubDebuXac
         O5DA==
X-Gm-Message-State: AOAM531zWswoIHDtoonsaufmxJWvOooBPCj6Uys04rgTtj29XPmcpnmP
        Ma0Nf9dUbu6oxD7sPWVuqiXOAIuWwMADPA==
X-Google-Smtp-Source: ABdhPJxVDSTxbHiG3O+bFsKRUJXxGbQaqRpO4mpHyedOF0EwXRkvF6OXDXBIs5K/mmFb+SkJAx8I2Q==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr3942486pgs.233.1631782048366;
        Thu, 16 Sep 2021 01:47:28 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id l12sm2187621pff.182.2021.09.16.01.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 01:47:27 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] Add Unisoc's UMS512 clock support
Date:   Thu, 16 Sep 2021 16:47:10 +0800
Message-Id: <20210916084714.311048-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Changes since v1:
* Fixed errors founded on sprd,ums512-clk.yaml;
* Added a new bindings file for global register which would provide register map for clocks.

Chunyan Zhang (2):
  dt-bindings: mfd: sprd: Add bindings for ums512 global registers
  dt-bindings: clk: sprd: Add bindings for ums512 clock controller

Xiongpeng Wu (2):
  clk: sprd: Add dt-bindings include file for UMS512
  clk: sprd: Add Unisoc's UMS512 clock driver

 .../bindings/clock/sprd,ums512-clk.yaml       |  106 +
 .../bindings/mfd/sprd,ums512-glbreg.yaml      |   67 +
 drivers/clk/sprd/Kconfig                      |    8 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/ums512-clk.c                 | 2197 +++++++++++++++++
 include/dt-bindings/clock/sprd,ums512-clk.h   |  396 +++
 6 files changed, 2775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,ums512-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml
 create mode 100644 drivers/clk/sprd/ums512-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,ums512-clk.h

-- 
2.25.1

