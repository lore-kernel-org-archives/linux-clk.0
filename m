Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2F9C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjAKTRm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235844AbjAKTRF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:17:05 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722CF186C8
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:16:37 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m6so25022260lfj.11
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh3hYJeoCeFa1TcRgxGXltrl1Ege4H+8PD3ZWKm/His=;
        b=hrMKwn1pZMHcobnPCUK+JBDldS49J1N3PNPXTC9Cprxr/pPxxMr+PHtiJ5sLlwYE/4
         5sZ3wizj7aEtfEpjgph7RFr8hoe/MtCy7YV0hvzTmP6uhHLljxnjg/1JtDWh/Z1Xd+Yg
         2KHsfgSll4uKcLPcF3PB9uNGhNhqP008CkcEQwOEp6RZw+a+0g7hHlCQrfrx6vEc1zrT
         TPwY6w/A7SxvbgSnmA/MOWXa+XKz2ye27BoAX3wLG8wcWoOEnakoZDWSLDl0x3hLqhso
         jpl3XnmXxkBlz8jVDYQxYg1gROi03XeQ9ll1YbWk8N9M9uxo8HODijPCoewdrpdD9bZv
         npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh3hYJeoCeFa1TcRgxGXltrl1Ege4H+8PD3ZWKm/His=;
        b=mDhCdDvlb/iWXACozfd69TNoaPZjz153LdJSpFh8N1K5lZEJyKLpRllhcBnwX90GbQ
         5DbTJ6EJv5r+0/jnKd1Tmha649PZoWTg5cV2ZPXl3tP0nfasNwgahe/fJ2M5C929tv5U
         WsrfyYjVqgk8DABM6+vI/6T6zOR+UC1W/CUd0o8TRO/1+ow6cKQi0Tf2bb5waMWoN2S5
         YRR9Yj0/QdkfCKkZr1zH+ruzWxuPG+Wx+yaRTciWv4Chf3wrUgyU3dn1C9gJ7lg9FEmi
         7uxjSCvxFnH6u2K55UQ1HotF+DNZSvpr6YayzM258nWd/KMYG+SYkcPnMPqQSncEyQNW
         rCEw==
X-Gm-Message-State: AFqh2kpFi8tEJvnLJYaRzBlgRUEm0ASv6zvlF68YBPF9fiVcYXxwJ1dQ
        39wxWWNdWU5avVAAusY3iGyGfw==
X-Google-Smtp-Source: AMrXdXvvAUpUFyXv5YtBNvsyhHQFGGH5goVp//W4VRpUWa0oTOGVvwwoUR07Fflkz5FJhyBVrO4ekg==
X-Received: by 2002:a05:6512:2586:b0:4b5:9e70:ca6e with SMTP id bf6-20020a056512258600b004b59e70ca6emr2843681lfb.17.1673464595860;
        Wed, 11 Jan 2023 11:16:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y19-20020ac24473000000b004946b549a19sm2866414lfl.45.2023.01.11.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:16:35 -0800 (PST)
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
Subject: [PATCH] arm64: dts: qcom: msm8996: mark apcs as clock provider
Date:   Wed, 11 Jan 2023 22:16:34 +0300
Message-Id: <20230111191634.2509616-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as we added the APCS clock controller support, mark apcs device as
clock provider by adding #clock-cells property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f69..d52023c19682 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3485,6 +3485,7 @@ apcs_glb: mailbox@9820000 {
 			reg = <0x09820000 0x1000>;
 
 			#mbox-cells = <1>;
+			#clock-cells = <0>;
 		};
 
 		timer@9840000 {
-- 
2.30.2

