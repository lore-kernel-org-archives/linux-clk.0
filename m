Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9D0C64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 21:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjCHVg7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjCHVgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 16:36:23 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EA0D30A4
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 13:35:59 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id i9so23108318lfc.6
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZubkqDM02FAiEq3eW9W/hQGkoIRi+LbMNFc2dkt329w=;
        b=U2+2EA4Y3hZZ4IySjfJI7Rl8yoiGa46ugFf4hmN9QuuP8TmiomTY4CaHr6rB8HomBu
         1d58zX7S00aWHBBZPR/9Qn0NTAtJnx4USs+nIOvlr4IZkdCbpiqX2iFUgWZhVmtjwMhF
         HwjoziRqgFYuPmfsOT0ZS+HAnLTHRS9MNFAqStOd4lVU8TSR8VgUBKPsgLLnr5hZOL/p
         aQQzjQFknH52GZKA90Mjip+qHUNF15Q2GKbuq3ZeRxgpOBgMZ742kRiF0mDniqN3ygUL
         PRE7HiM63+DplQpxJGy+qf4hW3UYDcYevICm0uYsosmmjnr9HSLo2RoMKZKCsi2leuyV
         cWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZubkqDM02FAiEq3eW9W/hQGkoIRi+LbMNFc2dkt329w=;
        b=X185p3vn0TBjS88q6LRVTN0YjHeOIQMQg+PvCVJUH8UqJF+JGKAyaV19HlHCGjJ6X3
         EqhUtY+Y7MnAIkS3013S7PbjgW8aLadToEw8z2YoqSbduN2EzQ0p+8B0x3RQqbh496TG
         qVW7ui+MYwQpxvLlZzg27KbtQIB67yBaZIhzaXWQNLlwzE2jipipFXif7OxTzsxnSDeu
         mSS3K9MnKSWpTKuzg6yYil90Y0f1LRhKyI28F4n2ggE2s7IpqsNc0o3wV1YI2l9olBuD
         a7EYQRchlDEYluZvtU5B0TCka3f7GDmMzx2qi+iGoym+OAlS4oOr1bAP+76CEOhwRdmi
         IRng==
X-Gm-Message-State: AO0yUKWZgTOG7zQ2GReZVfPJ6EzEWrTXX+Lq1bJ7bLTu7M494OwXE36B
        LG7FpALNlxkmKyXBzUffEfnnog==
X-Google-Smtp-Source: AK7set+G3EUNHPXsQ1i0gem4UXH/5P0KEDgfYTdtkCno0b2iCeMPN8kRgDjX9mylfukjLAE3B1WfPA==
X-Received: by 2002:ac2:508f:0:b0:4dd:a5aa:accb with SMTP id f15-20020ac2508f000000b004dda5aaaccbmr5350543lfm.44.1678311359487;
        Wed, 08 Mar 2023 13:35:59 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:30 +0100
Subject: [PATCH RFT v2 14/14] arm64: dts: qcom: msm8996: Enable rpmcc
 unused clk disablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-14-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=658;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ymIRVOgSTZj4llDzbcFS8Jduc30n2FcF0wczQdKvVS8=;
 b=7LtP5xJlOff5hrptxWCmxeFmHS62ygyBcYYVTgt92Z6PwhXkfshXJ2lTCW00E24p6ufcwyRA44Pe
 zx7PeJN/D0AhenvXl0rkAAO1hHKJfYaoWqp532nuqUb1Ua8I72gw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 is in a good enough state to shut down unused RPM clocks.
Do it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 905678e7175d..59451d87cfbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -488,6 +488,7 @@ rpmcc: clock-controller {
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
 				clock-names = "xo";
+				qcom,clk-disable-unused;
 			};
 
 			rpmpd: power-controller {

-- 
2.39.2

