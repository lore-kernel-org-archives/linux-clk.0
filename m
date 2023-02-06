Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722DEC6379F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 00:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjBFA1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Feb 2023 19:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBFA1x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2023 19:27:53 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42435B748
        for <linux-clk@vger.kernel.org>; Sun,  5 Feb 2023 16:27:49 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id dr8so29776324ejc.12
        for <linux-clk@vger.kernel.org>; Sun, 05 Feb 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
        b=K2C8OmmYLDe9OgSRVG/UAqx6U+TulXaGYzBLcl9ur5siVQWhXdNbBvv+dRKGNwRUyK
         ON0vfsXGVHAH4TdIkBpW3RMMb7G9Cz25ktOBos7BwcBe1pptKBrGjbcQqSPx2RL7TMb+
         Rmp0PvidYYQZdADBlzSxdGfQou9/hylKnWYfd6Uudp/khcn8EGJ4yNmUS33lJWZeirIz
         ND+V/1Qj6PSSwkRweyREeb+5RQRTA4/d8n8IyEpLk7mawYCKKa9Ul22cm+8QSnAU0R3n
         vlRYgYmRZVQXRzgmmhsjeqGeK/vBb3rc9PwbBLR0C7/IPSoihk2+oggcgruNU2Mgv+w8
         lRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
        b=q/aGjSK05Tqbx+SpV3OMpfa810YLQcEOx+g37580IsxDVHghRLMdpgTru/LaG4+dNv
         rhKnLL7gl0Q575tEj+UNyf2a8+BJu6oyUpk+VgV32EFbSbjkQ/r8LHgNI325KPJOnR5W
         KDBxlSik9wmODKinUEgJsIDQ2bQQUcz369jgHIMEypWWt3x663IdbB+ZkyeyoZqsZOm5
         2xnwE37/nRGFicURoeXDy3b1NlhANyuoVRcfIHtVpg+jn8RV5ql46iwQ0HEQDhx9r6RO
         XxGxxJVyEpz4YxW1f8518jlv+5RmBiOcy5ZAP0hkVguHuHq/SHU3MTu4NOp0pQpQfJ5Z
         xdIQ==
X-Gm-Message-State: AO0yUKWEc35D6p+QEmBTZv6dioa6kUwijeGGeEPqvnLlOVR4eOx3jp+J
        phbF6J0dxQaKr2vY4p/g2+WXxQ==
X-Google-Smtp-Source: AK7set+19/vKl62cK332+ZCFWeKvlTsYTe6ZjYoKDmCYrN0DndYD9oPU9OCmnl+2iZc/kdYqtrGnNA==
X-Received: by 2002:a17:907:da3:b0:891:b1ba:4c85 with SMTP id go35-20020a1709070da300b00891b1ba4c85mr7946118ejc.74.1675643268790;
        Sun, 05 Feb 2023 16:27:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Date:   Mon,  6 Feb 2023 02:27:35 +0200
Message-Id: <20230206002735.2736935-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
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

