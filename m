Return-Path: <SRS0=iEFu=5E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64444C4332D
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 05:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37D4A2072D
	for <linux-clk@archiver.kernel.org>; Thu, 19 Mar 2020 05:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DEClMfOt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgCSFkm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Mar 2020 01:40:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40245 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgCSFkm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Mar 2020 01:40:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id l184so803340pfl.7
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2020 22:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dFv7/70FKhDKgZsv7z5MRkFYJ6r4vLqdadhMT5bcVs=;
        b=DEClMfOtnRcUSt/Yj3j7ZFjx+OzidFY/dj2fl7OnWDpSQZemsOdE5BmIXK5wIIm9Cs
         q9l76oPFb7v6POI8ur1cBXFfBWlKSVDuE7g6S5mIy/RTq1WXCnPFO3/gzp9+SgDbqUEM
         li+MjvzVXH5Z0KYBsfycUMoTMvFvAujJLJt5/fG5vEY8HZnGjYyK8LSZHiDdoq4VE/Ov
         rg8N3tj36/Xu3JoNHW5N+q7i+pUOnHYU0QmgXqj0t3OVuzEpiGgKZZh2Dqs2ufCnMFzG
         ItpOTGZGzt0fMlbNjj4PL4RJw4JkJ+chhx9XzUWXCsZmkpg+Nc/Qh58yCxIl63Fmmt/B
         pIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dFv7/70FKhDKgZsv7z5MRkFYJ6r4vLqdadhMT5bcVs=;
        b=mI9RYhpD6hnkGnVgS0RJekwoMDy0SVzAQcpF2C7ne6vNlIjNkhPVlGwKnlGxm9XP2v
         DCvuRXZdicFbVp5vGA/0SAvFoW1EAsZo9f9EnZeR1/z3mls33oRXPKMx9Yc2GFN43tXV
         Y0M2yLFQLyXgKb3aUWoxiY4yCKmgJFjhBwD4l41l58xfrXZwhLFQmvphVBvWcJO6aTKf
         8vByMovPuwAoofR3ZAcpRD39z7BhzLUR34mbGV2iTiIFa9UNbiheClY2edBTbzElPsFq
         p7o8SGIG3fpmQAozzaNYlRhYUgW/P8vZU9/WdYT8h8BVUWVkh38gemlzGZybIobv20da
         gJtA==
X-Gm-Message-State: ANhLgQ2hzC8uJZFoMFzJkEdr8PBff/ICdLFDZjDsmQoPXAxTnw+WjxQx
        14XQyFLN8LM+7LH5D5MyoXN6Bw==
X-Google-Smtp-Source: ADFU+vt+jLntul6FGkobwwASG/5WIX4bgXPG687fd+93UVN/ITFrGOV3ahed94A7k0lgV6aBkV+s7g==
X-Received: by 2002:a62:30c3:: with SMTP id w186mr2111437pfw.245.1584596441255;
        Wed, 18 Mar 2020 22:40:41 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/4] clk: qcom: gdsc: Handle supply regulators
Date:   Wed, 18 Mar 2020 22:38:58 -0700
Message-Id: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Handle supply regulators for GDSCs to allow probe deferral when regulators are
not yet present/enabled and to allow the GDSC to enable/disable dependencies as
needed.

Bjorn Andersson (3):
  clk: qcom: gdsc: Handle GDSC regulator supplies
  clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
  arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC

Rajendra Nayak (1):
  arm64: dts: qcom: db820c: Add s2 regulator in pmi8994

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  4 ++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 14 +++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |  6 +++++
 drivers/clk/qcom/gdsc.c                       | 24 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                       |  4 ++++
 drivers/clk/qcom/mmcc-msm8996.c               |  2 ++
 7 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.24.0

