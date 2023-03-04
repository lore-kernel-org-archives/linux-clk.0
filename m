Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC685C64EC4
	for <linux-clk@archiver.kernel.org>; Sat,  4 Mar 2023 13:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCDN27 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjCDN2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:34 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAAB15CAD
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:28:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id i28so7104821lfv.0
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwpdNKDF+NZllqTRGwjUJbvwc53G+1D/9QetVZeUhx8=;
        b=kfBEf9VJHTFaNDMvnQRTXIO1B0LeU/XrM2oD2JTWWo4rG3N9NTkDxVTzXmfpw2guwu
         Bzs6hgAT2aN1l5vuv0viUpchEdWQjGkOFxvZRWJ8e81BtShZNIt2v/b5eny7PD1IaPe1
         BBlBov58NGvVbxK/pM1uaBrPrrY+Een2xG7KIP5kGdrq+isL/MCJJEYvdWRaViCbNqKY
         7WIcth1ZbZxX+vUdmXCn/LHEL8wJ9qqr8fsBN2eHsHzybgnkOvRGaoHU7TdlW8gUy+/0
         /IdAnFEPjgiHW6U2P/wfp9p5h3CdN6GWO77BAUinBQ/Q6sPmo0TQ5TUj1zDKBC+BJqLu
         BVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwpdNKDF+NZllqTRGwjUJbvwc53G+1D/9QetVZeUhx8=;
        b=sTN7uD9654clkgS9kvMEWe2b8Xdi2Ec1ByKQQN9dzEYwVN5POQ3dCg2KsaAZyz4BPd
         uVo5mmO1Kc+uUDh2xM4eRx3rddMzbsxVo2d/0oedNOBAXZ9J7epqDs0Ne1HqlXoJAn0G
         R9PuZgktN+Q00DcUDFKnGHwFJ+gTMNhjzIFREo6m6sUbf9xkI0etmDjGfO4Mu0+Jl+Ow
         bqSCO3Ye8GNlUUBE9BEWgr2NKmWgskuvyLd1C73HayPrHQ3/6i4a9kNOHLDTrSKm5sN0
         3DgRbkU6oFJ3ZyiB/ZB5vPp0I1H26Gwzm0cWWFIHrOt1xMBfu/bpP9YJq5w8z4pjpKr3
         TOqg==
X-Gm-Message-State: AO0yUKWbd9/2wWQejwH2kthFL8p7zynTRgKYGJZ69mgLo6tvBEYvtQlR
        y5gqg6bbRKpytoKeqD18dS4D4w==
X-Google-Smtp-Source: AK7set/IArmaG8UGmH1bSO4gYOnkCuJ0LxcNf26GWp6veMhYOODsCFTrDanapwMT/6yHoc0CA0nVzw==
X-Received: by 2002:ac2:518e:0:b0:4b7:2a7:1241 with SMTP id u14-20020ac2518e000000b004b702a71241mr1427849lfi.64.1677936482814;
        Sat, 04 Mar 2023 05:28:02 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:28:02 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:53 +0100
Subject: [PATCH RFT 18/20] clk: qcom: smd-rpm: Add keepalive_clks for
 SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-18-d9cfaf9b27a7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=792;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9IYygSv7WyUS2mTDxWuyuom5yDq7gjXSU2vpknvMF+E=;
 b=bq+/ReILwYadLeCOWmzOuXbedMdRZAszg/pNUCgkUTbBA4cndH+eBM81EfJPwvN7t43o1nkmOfVK
 3tJQizn2AAyHgW0e6WR5fFELV3OJh01zfTIKK7ellMNWzcH0uuJu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM6115 requires that the CNoC&SNoC clocks always get an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a5171b818d15..c3ab882de7ff 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1191,6 +1191,8 @@ static struct clk_smd_rpm *sm6115_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 	.clks = sm6115_clks,
 	.num_clks = ARRAY_SIZE(sm6115_clks),
+	.keepalive_clks = cnoc_snoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_snoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *sm6375_clks[] = {

-- 
2.39.2

