Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A61EB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjGQPUo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjGQPUZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:20:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD85626AA
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:53 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so7473276e87.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607172; x=1692199172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ucP2HxOwgP4Yjc3Q8ZZBgQ8j1uIc3OmiWC7cbRp7SQ=;
        b=aAsyFds6D3PMJEXo1mRw7yaSFEFyCwzpw8bc7QERWt12x+GbYXficzoCDkDyBo7h4Z
         62Z6Rxu+5TMH3EeAAlv60yIOJkKs1lSTWu6iBieEmkUsquuIa11nMNQdHG1kcNXk6Jml
         vJ3dObu5l1Rzkk8/4WSFhvQI/+4XhyexGyeCk2bUjkLEU5rjBwlHMcklMQfaStrCnlHC
         0xORplVjcyGhMZq87BeArmLClMW1oKgWZH6VyMbA1rowzdSZMO1VTIDvtjbCAqA2QdlV
         Wng487nS0xowQ1eGL8UF+0LXKbfRkU6VVCeJzJxiPeyy1m56qprgDRFCfjNPyi5WNzZ/
         iDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607172; x=1692199172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ucP2HxOwgP4Yjc3Q8ZZBgQ8j1uIc3OmiWC7cbRp7SQ=;
        b=Q7YJ9JMqKkSdng36/8US04ooVeYDNKvsEmNPMpQ2u8e48YmKTdl/Rg9DPUZ7eVnmhz
         DGf1XQNWNWXnVnpFDkhSlOgwT80QyxumqDIKvpsZNxOAdJxJjLa3mYofzTcpdL2el9Ax
         QFVx8BvnKYq5rHO8PgfAEQUTMmzqLywDtggRHLkshTi0itNuOU19DO7fEy3gOtdIfWX3
         Y3r1DvIi64pJFutMtR+dgbHRrEZd57k6lUer16b2nkAo5v9YnQK3V95/eDfWO4zxiKEr
         +i8xncBCjI48XM6ybjN1nWNU/sp8CjmYqkz+ZAxAbGinfZVliKya9Y8YuhoP3lpLe21L
         dMxg==
X-Gm-Message-State: ABy/qLZmsOCBIVDKe23jQfJuiNc/jPJVkW3jQ5HP403ltpuobRrjYkBu
        VDMAwCXdXBDBgrYRlz2a35AQ6A==
X-Google-Smtp-Source: APBJJlETFLB1UkIpgDT8VZRfl/t0P/UEyKDkNh0LsL4uDtc+FiFnAOYV9Piu5SCozU2cMNsEkgAryA==
X-Received: by 2002:a05:6512:3121:b0:4f8:6533:3341 with SMTP id p1-20020a056512312100b004f865333341mr8483185lfd.20.1689607172501;
        Mon, 17 Jul 2023 08:19:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:22 +0200
Subject: [PATCH 15/15] arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-15-27784d27a4f4@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KUdFQ1vDlHA4ohS8EU78+JEQV/TntyZtIcOU/vB61S4=;
 b=PXU+1NIif1o8q606ns3V3Z9OE4O7LZWnqOhTWMcpM/+BblfkOHNE3GpDoGEyTgvH3VTTUBZrq
 TubYMkT6OmRDcWp5p4Sj2bY+QorleRofBFq1lfUNCd7lsYo875iG8b+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPU_CC block is powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 29b5b388cd94..bfaaa1801a4d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1430,6 +1430,8 @@ gpucc: clock-controller@5990000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
 				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd SM6115_VDDCX>;
+			required-opps = <&rpmpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.41.0

