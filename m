Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963DFC7EE2F
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 12:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbjEYM36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 08:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241113AbjEYM35 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 08:29:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBFD189
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30a4ebbda56so2020041f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017793; x=1687609793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCxzKkO2/lHavfo2OyvfuRt2aCjvLPfV2Y7BikzkuZY=;
        b=K8SpNBammOEJdC0qmg8B6k8tFL5P8MCricyIA/vJNvi+JRW8UapzXZTpYFKkQNVVH9
         A+M9qVUEEiccpvC2afmP4g6AvTdd5MkuRTEVh75F90nJPeHv+/AruPCiY5usvCEfzUUD
         qTk2JzjuxtUK6yXMBpksOzKkFnIDl4D1BL4R553WfOG6FlKr83HiqZm0RRqIfjIRUgl5
         S/2YXgeBt4xAlokAzGKRqM6dcw94LfgSY3e/H3132vM8GGoI+7jsSM5L4mQ4peDz+w7j
         hg/vhGrhwOEwoxLo+MZi+ZUlMobIzSbxCp7G6l77tHKOT/n8Ho/mgOeS2pLSFl4/ymkf
         6dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017793; x=1687609793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCxzKkO2/lHavfo2OyvfuRt2aCjvLPfV2Y7BikzkuZY=;
        b=e7Ey2lzVPP1uRi2J89pR5Hgl3gdAnW/7NB2Mq7sLFgBr76ncMZpQOfZ2iqCu8X8s1J
         IZQkToeSYZakkIgt8cn5XPI4Ll2dovI7lScYDDdmOnaM+5ejmeX5RYVYRjlN6DCqpuEs
         RuPQX7XQjy74uz4bkbKP2St1wPJZGotOjdwvsBGGBmNMwIc9+1dtD7xNR28SXqiFBvVN
         iRui2t8GIWdi+Cbu9CodpeEe66xXjv4rPeFwrxlYj/BPH3mAKgvsJ6pycdIhdIm3mP81
         su12pnfuhotrElO2OB38/9E10IvpiD9Y+Eb1FDNgP1BY+vPUMPFMJ7KkjHD5p7nOpskq
         FyfA==
X-Gm-Message-State: AC+VfDxhu7RRXzQWOog5zSRLDyTQYzDgPKIsip+ZeRaHkg8euj4CTvnG
        8yPVsoYgR4lhHHZ645YX0fIYf+Sn5RWeNCdjuy8=
X-Google-Smtp-Source: ACHHUZ42qAHS+VWwocT2RaowE8Hwgv/dRON45KLUBXwbPTMzVke9heU6NltoTaBVTlNkQUreXsGnAg==
X-Received: by 2002:adf:f404:0:b0:2f3:e981:f183 with SMTP id g4-20020adff404000000b002f3e981f183mr2310548wro.10.1685017793509;
        Thu, 25 May 2023 05:29:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:52 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 6/6] arm64: defconfig: Enable sc828x0xp lpasscc clock controller
Date:   Thu, 25 May 2023 13:29:30 +0100
Message-Id: <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enabled sc828x0xp lpasscc clock controller driver required for X13s laptop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57ceb528426d..95ece45fd0cd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1176,6 +1176,7 @@ CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
 CONFIG_SC_GCC_8280XP=y
+CONFIG_SC_LPASSCC_8280XP=m
 CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
-- 
2.21.0

