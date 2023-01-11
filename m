Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE6EC46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbjAKTPP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjAKTPB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:15:01 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CA03DBF8
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:58 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id f21so12625065ljc.7
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPcZBzHD7ae6hkELFAHD+D8x2hKPutj+3M3d+IlT3KQ=;
        b=UMv7/eMyntz4XC/n0FQobQsKOnZQOAAYdZD9dw3Q3LzNgH71k0ft+Iqir/z2+HF71I
         zOnDFjw0DTI+biMwLY/eQLXThEOF2Xzv2OoufOF1WV0kPt/+imGpxihOFw4THOplbGPT
         0Ts7mtKSZReDkPU2MUcOEmwPAvX99rtX754/l89mElokerv1nguqcGty0yzfos9RHjiu
         cwQhGRlSZVNusrCB/tJJYE1WsQ4xAAxD0vmHEpPb+RRN0Hruw7xSNqKaRv+/AMIpX+lG
         Usiw2D4N4Vx+2n7BcT1tReSttWk0BGwrqFBz9URDKSZbMfzzfhh7XufNQJFrLRKiRzi1
         nNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPcZBzHD7ae6hkELFAHD+D8x2hKPutj+3M3d+IlT3KQ=;
        b=SsCZ5M9Lf3eocDSUdv5kVoRd1KM+5rF1zRWHoQaa7Ak9JFbL2QN35Mt3p08GQzxiYk
         c8hW4zOuqnEM1rKmgINV2qChA6n8KDLwAtx82yWN0UI0noa0LJQAjCzNDJ+hCQJnKSJR
         REONOIDGA1NFtx3j/5bPnsEeACQMZlJG1CrB7OgxLAn1XMFyB+K0Xkzg98AENq5BxHqE
         M2b7zqbb1QW726Wuqeff0Q61RfWWT7vGeR2FUwtu74p65c1qC7wjEa1YKvgExXrdlPZR
         faV+yJodJXgADxwddI9tAU4v8TcywOSA8zfscbo386kvuj0h1FFEl5JRHo6jkfAg5aKy
         zhww==
X-Gm-Message-State: AFqh2kp09baaKnU+quxXFVKEkJ8V80WNBPvBm84OPd57fXr/PowM9cnf
        m5kAUFBBsR2vhqw7VNs2414xTw==
X-Google-Smtp-Source: AMrXdXuapSySspddRmgkrBvUeYqYXvuI/qlqdHQcrDRWca5y/BcX5TCLFKVsmrpgEhlHLopnJUHIwQ==
X-Received: by 2002:a2e:b52a:0:b0:27f:fff4:a6c8 with SMTP id z10-20020a2eb52a000000b0027ffff4a6c8mr7328861ljm.48.1673464496896;
        Wed, 11 Jan 2023 11:14:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e8e27000000b00289873cce0bsm76343ljk.14.2023.01.11.11.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:14:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
Date:   Wed, 11 Jan 2023 22:14:52 +0300
Message-Id: <20230111191453.2509468-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
References: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8996 also has the clock-related part of the APCS mailbox device.
Follow the usual pattern and create a child device to handle these
clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 0e9f9cba8668..bd61dacb44ba 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -42,7 +42,7 @@ static const struct qcom_apcs_ipc_data msm8994_apcs_data = {
 };
 
 static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
-	.offset = 16, .clk_name = NULL
+	.offset = 16, .clk_name = "qcom-apcs-msm8996-clk"
 };
 
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
-- 
2.30.2

