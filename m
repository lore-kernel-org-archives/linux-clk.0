Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8106EB64D8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 11:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjFVL6b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjFVL6D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 07:58:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFC71BFA
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso77907401fa.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435076; x=1690027076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BeSpE3Uo2n8gHC5/9wqy8m/N9Ajlsi5ROuDjpnkB8E=;
        b=uN9D9VCrZ/r2UEX6MtywDEFINRAwY0Xmp4Z/J8Qc38fn2mKMGtEH8SxxyGAGkNrJZv
         XgV/ojRqO28ptAy7Sn3JXO6QLfBHM8Y3UTmUHX8iTw6N52UJSmFrII+Scpemkl5TLW6i
         7KUrsepVkTY+Z6wEJ1yMVmMETIB5cfYl8wP5yBWJAGH+MfAdjAsrhxmIHAwjU2gLJvnD
         Sv4tOhpQaqhrbdPw+xR5ENTnEFBg/CPYoqb2dIgh28Yzdaejy8ylVpaHTnoPIpbqHXkS
         jcGYk6HZTaW88U9EJXlkyVg8VTd9f2RkxjukzrcSiu28QSC10vUml+WgHgvhBFZqOiki
         a9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435076; x=1690027076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BeSpE3Uo2n8gHC5/9wqy8m/N9Ajlsi5ROuDjpnkB8E=;
        b=LFu4UajZNyLffkuhKZb/nDplVx3G5iemjz01l32Bk9NZu5A7l+6r1ooGTMrukdUaQz
         LxdESSf5VbT5UJieLCPsBQGvI9nKbjuMdttUxHBIidj938mynyQGmqYWpJnJuodwtot0
         iN06S7zEPDbpgy8FmI3OVY/9oJNfIIWhQ/UMOxfy7/xROGRHUMufHbIlFM6fCFNvpJDf
         9LYsgWEHl5dxNNN4nQnIjDpXxpOhhBbHr4oiNYfA5aSPl4PVf183JzKYRc6VL9spce38
         +jOUxUVVRoWW1AmcxdcHKX2FCOouS12v/9vjvbx3s2kzPOsXj4kPmaFMTZkOl/CIhewj
         biIQ==
X-Gm-Message-State: AC+VfDx2rv5K+7lFzrpXbiukCjijZVt+1kUomNKXK/jdXyUuHT4oVXt+
        SWxn/DJdbh010kbgmspVKrmoKPyPv/+0zCc93rA=
X-Google-Smtp-Source: ACHHUZ4+NaZmD70hTl4GjwDfaM5+0kvxGlaDPhrX+r3D+Ca6PGZQjFY+fu5+mDmEKSPGvsoRUsTL5g==
X-Received: by 2002:a05:6512:68:b0:4f6:3ab6:3d9e with SMTP id i8-20020a056512006800b004f63ab63d9emr9859962lfo.59.1687435076336;
        Thu, 22 Jun 2023 04:57:56 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:46 +0200
Subject: [PATCH 6/9] clk: qcom: gcc-msm8998: Don't check halt bit on some
 branch clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-6-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=1420;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RMdpPTx0djdmSD0IRCOXo7v4qwhogMdk+CvkRbKSXoY=;
 b=nXGgMQ70zoaumt/TBlld6IqSQFvVaxn2XlqCKqTL97RyXLaeCUKWnUU136fMxxQeDB49j6YkX
 Nay9tUVEsgPCUFc3D8OUJSnju0/0HSp8deMuJoJKr+0Sy8N7N7hXXor
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some branch clocks are governed externally and we're only supposed to
send a request concerning their shutdown, not actually ensure it happens.

Use the BRANCH_HALT_SKIP define to skip checking the halt bit.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index cccb19cae481..ef410f52f09f 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2112,7 +2112,7 @@ static struct clk_branch gcc_gp3_clk = {
 
 static struct clk_branch gcc_bimc_gfx_clk = {
 	.halt_reg = 0x46040,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x46040,
 		.enable_mask = BIT(0),
@@ -2125,7 +2125,7 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 
 static struct clk_branch gcc_gpu_bimc_gfx_clk = {
 	.halt_reg = 0x71010,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71010,
 		.enable_mask = BIT(0),
@@ -2151,7 +2151,7 @@ static struct clk_branch gcc_gpu_bimc_gfx_src_clk = {
 
 static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	.halt_reg = 0x71004,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71004,
 		.enable_mask = BIT(0),

-- 
2.41.0

