Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE583C6FA8E
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCDN24 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjCDN2c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:32 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EADD51D
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:28:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j11so6959134lfg.13
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VfW1YYdXfqnKLGPvQBkrMfeqGIPI8djYtcQvRbIczk=;
        b=CuHKcE6GIYECPkggTmAyVhXgEZYVjQzqPZ+LEyC/UxyEz7jCvBfGAXnOPSbLoYWgIw
         2mESFZjkWdBVSudqXLXwRMC3uoa7solX/3JTb+57xNK6B7cSfXhXaw3IAIp3MErdW9RB
         K6oO/o05IZlV3ggGGPfBP/XihsKNYpWqtBYJe2MbN+y6QixXAESM4pC0rNqWiMRYlvmH
         hN7BKS89kE5Z8kuXGNAfvPv6GIoSozqQjoVSa8jXOnDJLB1NyYJiqP4YNNfAGKLxRA1L
         XL7bND4/1mm1+N6LLyLrx6QKomhKfKd1SCsGeBIZpFy7B9/iXi0Kzo9scdIoNsIzZPSQ
         SE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VfW1YYdXfqnKLGPvQBkrMfeqGIPI8djYtcQvRbIczk=;
        b=xC8/nwxdgdjp6521rkIU4/y93oE9kYTyB9cXGcFIuHtkR1L6KQ3YbpvAGQbkqSlmic
         3FuLb6Lr17NIz7HbUQZ3H3YHBlAkl+pA+cgew8PqZ4POl58ZcicP7tTLZnnL7qHW50AV
         k6mxOpSmfxr7b5aFW1JzOxbz7YprDglgXNBsFGZtv2sE9pxeewJgsI7gK+BmgF11CtAa
         SYwfmrcum2/xNq3chifhEL+UQnbEBsCon9wxs/j9VLHU79IZzQk6Q162dXnpmFVDCIkV
         CJo/oiQ5OwvJhJQ8e2jhkQau0KEAJdFvgApWLCgAYZFaXcXbi2dxIS1kprrrQoXr94mL
         DEWQ==
X-Gm-Message-State: AO0yUKXefX7xUHjKRedBkwlkHQoaUjz3MywHEiF/zwNHwhLC0HvRCSVU
        gyoSALAUE70qpQXIsyT6adL6Mw==
X-Google-Smtp-Source: AK7set94cwd3u5KJzDpcWgrvHd+K4bvcrd0Nnoh87E/CNhpmfHjn3F0+DoC7G2PqqHUycuXfcbDfTw==
X-Received: by 2002:a05:6512:408:b0:4de:8588:b57b with SMTP id u8-20020a056512040800b004de8588b57bmr1356654lfk.19.1677936479709;
        Sat, 04 Mar 2023 05:27:59 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:59 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:50 +0100
Subject: [PATCH RFT 15/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MDM9607
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-15-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=784;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1ZJqkfkW4cuOQkRuGuBOVoeDkiqePtVAvw1z0RMFEyM=;
 b=nMrSzvl1dqVIXFXF9GBrlew6CQCWBNkgB10RxnN2SFC7MU/4L4jHAfgX+nRYs6web47uuptxDRDT
 +uRH87KzCXx3FawG8VzHL6yCcy9CI1O4QMO0ipHHfJdm1EZ/LJ91
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MDM9607 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 7e1814f606e9..a098327dc851 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1066,6 +1066,8 @@ static struct clk_smd_rpm *mdm9607_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
 	.clks = mdm9607_clks,
 	.num_clks = ARRAY_SIZE(mdm9607_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8953_clks[] = {

-- 
2.39.2

