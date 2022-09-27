Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D88C07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 11:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbiI0Liq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 07:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbiI0Lie (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 07:38:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A7514A799
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 04:38:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a3so15238666lfk.9
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=63e0MRQZtWlFWWMGomzrJx4HGydgEEo5osHWTKB+1bs=;
        b=z5QnAZRCAzWWL9uzsHUHH9BTwPmvDX8r404hOA3iZIizwBqUEIWMAT7tZLd3ozb0uP
         /PRk9NaR9XNMXV0I5x2KY9smE6NoIu3VZmBZcJU861fAvzJPRS9LeGR+UejEed6Mdx3S
         eQUx6h+GAguRYoDlBLN5wWXSf/xHnL2WfGNe7+Z17dKD0N+xm5bsKOKh1YT31W+YomcW
         49HDUr02jl8+1y9IPjGUSU9FfLDh/cotMB/BYoFAF6XP0f1j/0tkKpTuhO8F5vQPSeFy
         fj3ZkPTZmn+MZIKEJZXKeanPn5P7uuh63jHNVBawnbbop5D/fX+c3LeRn3SbRlFC6Q8O
         zmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=63e0MRQZtWlFWWMGomzrJx4HGydgEEo5osHWTKB+1bs=;
        b=KcQ39M1Wmk8J2sUQdfBWEu+rGcYZ+wS8PuSxYdgSroaPO4S4OLqKGMyhW4x6qpFkJd
         ORVl+n1BhbgBQV/wrxAyJ7y9j4Rt6XXGAYSBfBBL6I9oKLYai24Gt2m0Hh+/GsvGOXiJ
         MUgkd+QX5ZBhCUuYSIMMWtqzmGdBJOjOPnsC0/kY5w3nmfXAAsQC5Cvx2xs+4ukXkgMT
         SROXJUUYM0tYBQcOjhH2AHNHGBD3wonRlqIMRASu2YRw3z7UrxkEMI6jc85eY/oY7jRT
         wjhNK7LnFBElHwcYGFu+IDYq/Jx74B7tcIWY0vcGqv1B62T2ZDRYmvUGCLhbu2SY0Ib/
         GYZw==
X-Gm-Message-State: ACrzQf0i3WSP/cnghmFl7k36zPogQ+1zeYJXO+/ToD3TGcEg1Dmdv13K
        CpI4fynofOZ/28KllI1DjhFHQQ==
X-Google-Smtp-Source: AMsMyM6YIrelcc/09mBstD5jOKlHiZ/CdBADsQqHO29KKvmvIC3UHXZcm8C4MN3l1b7VNLFTEmXZxQ==
X-Received: by 2002:a05:6512:3c8c:b0:498:f7ba:9a69 with SMTP id h12-20020a0565123c8c00b00498f7ba9a69mr11257484lfv.8.1664278708053;
        Tue, 27 Sep 2022 04:38:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b00492dfcc0e58sm142165lfr.53.2022.09.27.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:38:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/3] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
Date:   Tue, 27 Sep 2022 14:38:23 +0300
Message-Id: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the reference to the pll4 clock to the DT.

Changes since v1:
 - Add dt-bindings and DTS changes

Dmitry Baryshkov (3):
  dt-bindings: clock: qcom,gcc-ipq8064: add pll4 to used clocks
  clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
  ARM: dts: qcom-ipq8064: use pll4 clock for the gcc device

 .../devicetree/bindings/clock/qcom,gcc-ipq8064.yaml      | 9 +++++++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi                      | 4 ++--
 drivers/clk/qcom/gcc-ipq806x.c                           | 4 +++-
 3 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.35.1

