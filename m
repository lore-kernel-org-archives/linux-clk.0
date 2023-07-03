Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716E0C001B0
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 18:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjGCSUv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 14:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjGCSUg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 14:20:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09F710D9
        for <linux-clk@vger.kernel.org>; Mon,  3 Jul 2023 11:20:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b69f216c73so70243591fa.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Jul 2023 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408421; x=1691000421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMGOdp2WrmK72JlLnA4GZHmaTpxK++joMT5QYp1sllQ=;
        b=lhTdDtnHM8h9ePa+Murs4OHPWVomZDeXPgOpnX3OehH26YGjrpqtm70lui0AjPvQtG
         jaYtgTl041ICwg0AI4Wu/6jmusMI2Acl+N7AmDGsFWGtT6866CWdY9kiiszXiQ16XoFs
         A9Zwi3qrscx/QnLuDmfkzMKizuAqL6rk2AEMpLN5mHtsCFBTZgXwn4nB87wANtHhph1C
         l7rty66I47+ALpGD0xCaWOQTSslViZZL5N2vJizbzhkoKG/lHLx6vaQJ0VTebvOFmOcS
         LgOawt1ww1e0qSzzYnBdCVMLj+ZkF2SfC34Lw2HJJ4ZnNaZjhR/zsnn7qh5S1pPQbFPi
         da4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408421; x=1691000421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMGOdp2WrmK72JlLnA4GZHmaTpxK++joMT5QYp1sllQ=;
        b=FFLLT8YdoKVoodrY/idW3t2tsal+jT9Ic1wh13O2HOB17Mc/m+E4V7S1D85YaUy7rv
         dIyjGeiJzeHaVG3hiwUziEveB+raUJR+jMWobXQGIZ8P4XCRuvahfMeMVLtkQCCgOmZl
         2e9dX08+nA4qT5puTwyXbWBfovN9SS7yJb80LtzlvQgEHSyre5XlR1RKbga/ZXzf0cly
         6MiQAHGw4QTIv0Tg+kq0Vkt86N7050CvmmleECNHZNvMc5w8FDqux5ioW0CRs38HRuaH
         eBC5/Dltb0nipW/ioYlmgm5L+FR/6+UtBwm8xfiSPy3p58GAE4nl+aOMvcMaihTkSACm
         fQpw==
X-Gm-Message-State: ABy/qLasDkhvUfqI5ba/P0jF+c2+O3dMogkzGFjMYTg7Z/lJntJa67eY
        NKV2Bqw3saxnlEaUzB5PKqQw+A==
X-Google-Smtp-Source: APBJJlE8ny5kSPTUjmQmeDKziqPR0/TUc/91ONsaWaWWKJ4df8Y71rdn6WYsPZtmTayEdfW6z7X7Fw==
X-Received: by 2002:a2e:850b:0:b0:2b6:ba00:f733 with SMTP id j11-20020a2e850b000000b002b6ba00f733mr8333259lji.18.1688408420733;
        Mon, 03 Jul 2023 11:20:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s9-20020a2e9c09000000b002b6995f38a2sm4946224lji.100.2023.07.03.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:20:20 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 20:20:12 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: msm8998: Use the correct
 GPLL0_DIV leg for MMCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v2-8-6222fbc2916b@linaro.org>
References: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v2-0-6222fbc2916b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408407; l=1108;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rcLA8twyqUlcJD4D43vneN0vw2noKKbjZxFdyfHDJZM=;
 b=J9qF1k7V2CcK1QdJjF8lyl9xKqY04T25afPjuYYxmly9bH9mpvemJtiRXtaKrrEaWRVNontZE
 8X79xc6aeF3D7pgVQuJGJEZIkWOOAAtyaan6pgi66L4r5buBBT1lL5i
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MMCC has its own GPLL0 legs - one for 1-1 and one for div-2 output.
We've already been using the correct one in the non-div case, start
doing so for the other one as well.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 74bd05579796..c4faba092368 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2718,7 +2718,8 @@ mmcc: clock-controller@c8c0000 {
 				      "dsi1byte",
 				      "hdmipll",
 				      "dplink",
-				      "dpvco";
+				      "dpvco",
+				      "gpll0_div";
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_MMSS_GPLL0_CLK>,
 				 <0>,
@@ -2727,7 +2728,8 @@ mmcc: clock-controller@c8c0000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <0>,
+				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
 		};
 
 		mmss_smmu: iommu@cd00000 {

-- 
2.41.0

