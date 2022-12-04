Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0C4C3A5A7
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiLDMpN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiLDMpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C66915A0D
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:11 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so14532157lfb.13
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=777FHEh3O7IZu8uucnCXQ2Ee5VkdgIYyKFJ5ECXfkn8=;
        b=HtBtp4soyyODpi93YgA3zSMgbrFDHJVdfwQH/zSU+/AxvRsIE8Wb9QbObyiE6CLY74
         dxwmME5jeE2BmalGNSI9VYMaO+7vDvjn0H58X/sf/Bt+VN55F6/B93QTHk8KsEBrWJge
         LyNIrP6cB5ganx/IBiCVC2FQ94+bl0oiQ14sa+UFYHix4IdT7ACxAsOcBGT2WgkKfjLX
         VrJkELuaSnjRq2MVhfHjqBDA2CKxfcMGo7XDDnOYHwjvpi32OFuRdufoeV4guO25/d5Y
         wMRuZsElx0MnD7yXEvXvrV0+1NgHPobUNeLY1La4Fh1YjkWmSxuGGQ1T4zoLVsFgmpEA
         jzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=777FHEh3O7IZu8uucnCXQ2Ee5VkdgIYyKFJ5ECXfkn8=;
        b=uycmOZkd2DucwW1x16VtuGtYASJ1xvhRftlZi7eEbcDW6cUQhOG1/Gz1NoYhN6qXwG
         GTDYwAhsATf96+VtHb7J23FZ4gx13LCR5WsBlR4VzEWjAkCgVeQ0hJImDHQzMQYu+ztH
         y8plYwrLSmjttdiuqwx+3kNBIt6EMCcNYfxRqblC5sEVJgMkN2YJbPsFqNnmHtPSW1qp
         xOu0+k9YBupBJXlEH870GI37ILcyLliT6wlfmmq+8l2tNJRISMdpnarDJ/cBkzE9u32s
         HxFWQPqryLwqlrM0bzuJ0gI0+aS7w8DtQ+OP7i6diz+l+XJHei4seJXsacO4k4g/+qFf
         kSMw==
X-Gm-Message-State: ANoB5pk4ObWLXxnm+teSIQvTn+dMeU4OjObupQKJjmzlg5lC0iW85fdJ
        RjdX7Xl4LYip2wo3DXKzodjC6g==
X-Google-Smtp-Source: AA0mqf7nk5PFSGxVE9TRo/UFpC2GUwvffR6gCWvlhvH52zU3fTOVH6CbnpctGIdQlBnTadL2uN7rpg==
X-Received: by 2002:ac2:59ca:0:b0:4b5:6a20:ca94 with SMTP id x10-20020ac259ca000000b004b56a20ca94mr1083886lfn.135.1670157909677;
        Sun, 04 Dec 2022 04:45:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:09 -0800 (PST)
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
Subject: [PATCH v4 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Sun,  4 Dec 2022 14:44:57 +0200
Message-Id: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Modernize drivers for global and multimedia clock controllers on the
MSM8974 platform. Switch them to using parent_hws/parent_data, use
clocks through the DT links rather than fetching them from the system
clocks list, update schema and platform DT files.

Changes since v3:
- Rebased on top of for-next
- Changed gcc-msm8974 description and title to follow Krzysztof's
  changes
- Fixed commit messages to describe the reasons for xo -> xo_board
  change

Changes since v2:
- Fix typos in the commit messages (Niel)

Changes since v1:
- Fix typos in the commit messages (Niel)
- Change bindings license to dual GPL + BSD (Krzysztof)
- Fix issues in gcc bindigns pointed out by Krzysztof
- Fix Taniyas's email (Krzysztof)
- Removed dsi-names and changed dsi-phy node in the patch adding the
  second DSI host+PHY (Krzysztof)

Dmitry Baryshkov (11):
  dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate
    file
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
  clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8974: move clock parent tables down
  clk: qcom: gcc-msm8974: use parent_hws/_data instead of parent_names
  clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8974: move clock parent tables down
  clk: qcom: mmcc-msm8974: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: msm8974: add second DSI host and PHY
  ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
  ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device

 .../bindings/clock/qcom,gcc-msm8974.yaml      |  61 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   9 +-
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  38 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 106 +++
 drivers/clk/qcom/gcc-msm8974.c                | 682 ++++++++--------
 drivers/clk/qcom/mmcc-msm8974.c               | 736 +++++++++---------
 6 files changed, 928 insertions(+), 704 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

-- 
2.35.1

