Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF4C636D6
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjBFO5b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjBFO51 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:27 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4905B2367D
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:19 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mf7so34938734ejc.6
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
        b=FhbKMLoNFUAWgn+KHQ69RJuJ/z1JEUNsDQLrN26ILh2sf38Q3tVGNkFLuWo7zm3hH4
         VLLg21KcCOr24lh65lsSoa7CFwvGDQg42Xs4nYoAgezqd74ZEifIf7d99YOwT2POgPxu
         j04Uzj4TeRpRGz/s1hUBFsC0C6dM0EcH5wEgBez56Xx15AdyJ/h91W2KsUEBWywAiVoO
         wx63kmm1nCsonj4IV3MCPAY8NJPyJylDJZEps7dYSqUZT3dHnoOkB2IbRt5G+ZvIOmf+
         7DNnzBJwmUc79kb6U31NzTmt4lWLA3gS4hqhDcw2RKrAyNwORB1EVwHdF44tBgTWs+gc
         Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
        b=7/7IPQ7J5UqKbNjT4iJYs8o5V5Ox7RMfUrfTU7wi6AICHFJkSPhxbUjGCBd3yvA44C
         kKoXmIgXwnqLaJJP+ORsQnhvgX8pdTKP4eHwXwR8T9N8ub87Q8Uk2x5XsrTUnzCKCNmQ
         GhLQjsPgmPXOAgvJdRj8dekpTa3zyFs1Ub3DhDfTPwPtUN3C86qzgSDukF5MORp5ykU8
         wMgG/LeuJJDjhQPBIZzDGhDhJCayjCZhsqNm5CgK/TgzsYT+InwW4XfxmRnIYT33jIzT
         jJ+9EnVScYYZ+BiqEeYOX3wSaawMUUjxIg0yiNTyt0xC59HhmFdaWO0w/b9w+S1ReDRY
         3LLw==
X-Gm-Message-State: AO0yUKVhZ6KzACuHXJOuEZenNXoylK1JswHzftwWPnT4/YkR+skvnT7C
        QbbQcae+U5JcPckLxghZk9QVcBAhaQ15L5+r
X-Google-Smtp-Source: AK7set/BbBwZ2tUdJQcmNpQqX0iYCeNQD2U/sxj9vmbzbl37IVzdRVXDEFmvzjMIvEIWKes98WxnkA==
X-Received: by 2002:a17:906:4b57:b0:885:2eb5:68a5 with SMTP id j23-20020a1709064b5700b008852eb568a5mr17647451ejv.66.1675695438882;
        Mon, 06 Feb 2023 06:57:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:18 -0800 (PST)
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
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Date:   Mon,  6 Feb 2023 16:57:07 +0200
Message-Id: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index df841230d1b7..5e744423a673 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -284,6 +284,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8350/a660_zap.mbn";
+	};
+};
+
 &i2c15 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.39.1

