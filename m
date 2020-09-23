Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B422C2D0A8
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58064206B5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="aIJ0RV1V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWQIK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 12:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWQIK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Sep 2020 12:08:10 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785E2C0613CE
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:10 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id y11so288760qtn.9
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZ0348TRdT0YDawBjd2XHLLSCdDgvLqffmteVGAitSI=;
        b=aIJ0RV1V0Qdht93vOvnqU2PJ50cedQv7cJb8rKhWLXA4wcYQXRslrOIt28jKFbJ/xN
         kX0/yVK2qgL5Bq6dwl951khapRvjBcwvGZk08yxWyhQnLWnh7IEWo41LGBqvhDByK/VS
         CoNu9HPN/i92SXBf92VzAA6XDSNjxlojdjWXMB9BvVa9v6X6TQZSrhtwHgbOq6wflYmp
         NGNRiqOGQCrPRP0ttVNqulGfJR7eIWa2r5qc9sfjf6E9u6b5WK0oxdwSl1I8zbdTsN+D
         5HWVp/Od+6RJSF/taYVqaKmTRBGzSxArWAshE/xJFTjx6ZpF2p7UkdJc2QVK/+t8XG0C
         wVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yZ0348TRdT0YDawBjd2XHLLSCdDgvLqffmteVGAitSI=;
        b=K4c5Sth/743kLYzaap63c4r4Cs76pzi3lXrMNFoKRdUNXE5InMOj5cKnR4BE6XALNG
         m0YpG6Ivt2bNu6A1ZWoPFZ9Uq5xXx2Iglgc6lNq0dtR4fOP/JifJjj3tlF30vDDxNhKt
         TUT4F9oIEv40qOck0mfjc2f4hqTDQFxQNRFYO2eAkggEaRaQqJPs91lGsN3aE5iYTTvg
         q+uvxPiY8Xjnl0sIfWOMN49/EpdKGZe5OdxLwPM/QjyDIGDrAXTOEOwWuFhD1Au2snLT
         5SOTxwg7rNBL3HhVYJjm6smIrtWdZYAIb7zRHNvCFCE31ZYq5fLJ17h+uITStWfE66ao
         TXYA==
X-Gm-Message-State: AOAM531uwdslwysXTdR6r5gOXrvH/y7+lVK0+mzTsa7g3ZiUJ1E3v881
        0ZA164Mne+u2IJQdB3ELtpuHtILqgXtozVxU+fE=
X-Google-Smtp-Source: ABdhPJwO7U5dnPsjdpjIkDfxJhOvi1XUFsYN6liGAdba1B9V5lCo1Vm3z6V0c3G7WfHcO8ayQnLxNA==
X-Received: by 2002:ac8:3630:: with SMTP id m45mr772297qtb.358.1600877289561;
        Wed, 23 Sep 2020 09:08:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 145sm279159qkf.18.2020.09.23.09.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:08:08 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/5] SM8150 and SM8250 videocc drivers
Date:   Wed, 23 Sep 2020 12:06:26 -0400
Message-Id: <20200923160635.28370-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add videocc drivers for SM8150/SM8250 required to boot and use venus.

v2:
 - fixed dt_binding_check/checkpatch warnings in SM8250 bindings
 - added 19.2Mhz in SM8250 freq tbls for consistency with other videocc

v3:
 - sorted sc7180 to come before sdm845 in combined yaml
 - deleted some SM8250 clocks (hardware controlled and always on)

Jonathan Marek (5):
  dt-bindings: clock: combine qcom,sdm845-videocc and
    qcom,sc7180-videocc
  dt-bindings: clock: add SM8150 QCOM video clock bindings
  dt-bindings: clock: add SM8250 QCOM video clock bindings
  clk: qcom: add video clock controller driver for SM8150
  clk: qcom: add video clock controller driver for SM8250

 .../bindings/clock/qcom,sc7180-videocc.yaml   |  65 ---
 ...,sdm845-videocc.yaml => qcom,videocc.yaml} |  18 +-
 drivers/clk/qcom/Kconfig                      |  18 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/videocc-sm8150.c             | 276 +++++++++++++
 drivers/clk/qcom/videocc-sm8250.c             | 369 ++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8150.h   |  25 ++
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  34 ++
 8 files changed, 737 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (68%)
 create mode 100644 drivers/clk/qcom/videocc-sm8150.c
 create mode 100644 drivers/clk/qcom/videocc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h

-- 
2.26.1

