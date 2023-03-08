Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBC0C74A4B
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 21:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjCHVgT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 16:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjCHVgI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 16:36:08 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D17FDC3A7
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 13:35:52 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id t11so23133797lfr.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/go9JzzVOEsVKPzeAceWp3TS35nZ2mbESw1jgSMGm7A=;
        b=y1r7IR/q5CFB+NwNRrjeOgw5mcgy6SiAP4aq4/6uUugMPqIEkqrjka4MJovtVPukAF
         KtjQCWEh9dDUBqPQA9A4S7UT+t+FBa5pSCbrC0fiZhIKlITgO622Vfmpa2RVgdFtlz/b
         OWGm55WlYQtq5LoEBJultPT4Tff4KXJS8GEJgbnE9rS/VN7UwD6YRqEDEecUb+A2FmWU
         13pImcnL1JbaAdAdcI2QmXGce/DRUOnEhUcPUXzAOvPOx19QmeBe+BGAxEghssfzCNLn
         upVManq9skJmwnplxBX5CudGvJSkxVkzwloS6kvE3imD96UWE61rlEB2wDD+DGFiGr5B
         npFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/go9JzzVOEsVKPzeAceWp3TS35nZ2mbESw1jgSMGm7A=;
        b=bzRdcmrNxx4r6eJxjBB0sI/SZqc43tycJ5Z4efxnwvAj/8g/61eacjCpwGNodLqaYi
         ZMtnMWEfm9A2DpRzzqYfIZ87lVRUgNTQORVDF1tMVuC553sUs5PEjHRN74cPQOpv5Tp9
         j/wXXacKIo/3BQ4tbFbX/l9WmOL+8MfpFrJmtlypE6h4SnyVYXuC9L4ss/VkrhZJhIeZ
         kfGteH+TTV8MyNzVIqTEzcNSM8H+XJpbF0zvygoRuQdtpaKHwzpllD8JIqHFtbb5nncp
         vZvwvHjmg2ERFFX7mgKYDyr2Lg/Tbg2SEEaa8XjZR4iiriL1Pkoa9i0zBRnyM7dM4Gh+
         neEw==
X-Gm-Message-State: AO0yUKU1scmYuWWCS6jO3KrKJ1BiORGpMjJfe+AtNLqFik3rXgSyrYs2
        hs9FNYYpmj/YCGdUw6MG8S7wDA==
X-Google-Smtp-Source: AK7set+wUGkTJxfe/LDVdq6Rbt04pIceTywLx4q2uqA4bXqqssqCvaGnGHMD/pXuXb535yBp1Hb3yg==
X-Received: by 2002:a05:6512:401d:b0:4e7:ff1c:6030 with SMTP id br29-20020a056512401d00b004e7ff1c6030mr4353486lfb.15.1678311351542;
        Wed, 08 Mar 2023 13:35:51 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:25 +0100
Subject: [PATCH RFT v2 09/14] clk: qcom: smd-rpm: Add support for keepalive
 votes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-9-ae80a325fe94@linaro.org>
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
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=3522;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PET/xgo25kPZz4y++jzQYNkadiG9KbkszadHqMCSmYo=;
 b=U8c6gZZepRlLHsxJCUUNeNSgs2R1pXwK8Oz0lee09UzA9sQohyMnpsOokWw2mt5ez6+UA+8waarz
 1XTH+4oZBjlT8ZUcGNF9pFFN0kJ4hArj/ANRqAQUEIswdP4QS8cl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some bus clock should always have a minimum (19.2 MHz) vote cast on
them, otherwise the platform will fall apart, hang and reboot.

Add support for specifying which clocks should be kept alive and
always keep a vote on XO_A to make sure the clock tree doesn't
collapse. This removes the need to keep a maximum vote that was
previously guaranteed by clk_smd_rpm_handoff.

This commit is a combination of existing (not-exactly-upstream) work
by Taniya Das, Shawn Guo and myself.

Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index eb7781e5c8c1..d89918f9ae60 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -45,15 +45,17 @@
 		},							      \
 	};								      \
 	__DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active, type,	      \
-				       r_id, key, ao_flags)
+				       r_id, key, ao_flags, false)
 
 #define __DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active,		      \
-				       type, r_id, key, ao_flags)	      \
+				       type, r_id, key, ao_flags,	      \
+				       _keep_alive)			      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
+		.keep_alive = (_keep_alive),				      \
 		.peer = &clk_smd_rpm_##_prefix##_name,			      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
@@ -170,6 +172,7 @@ struct clk_smd_rpm {
 	const bool active_only;
 	bool enabled;
 	bool branch;
+	bool keep_alive;
 	struct clk_smd_rpm *peer;
 	struct clk_hw hw;
 	unsigned long rate;
@@ -198,11 +201,16 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
 		.value = cpu_to_le32(r->branch ? 1 : INT_MAX),
 	};
 
+	/* Set up keepalive clocks with a minimum bus rate */
+	if (r->keep_alive)
+		req.value = cpu_to_le32(19200); /* 19.2 MHz */
+
 	ret = qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
 				 r->rpm_res_type, r->rpm_clk_id, &req,
 				 sizeof(req));
 	if (ret)
 		return ret;
+
 	ret = qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
 				 r->rpm_res_type, r->rpm_clk_id, &req,
 				 sizeof(req));
@@ -438,12 +446,29 @@ static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
 	return r->enabled;
 }
 
+static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	/*
+	 * RPM resolves the rates internally. All we have to do on the kernel
+	 * side is ensure that we don't accidentally put down the keepalive
+	 * clocks, which could happen if they received a vote below 19.2 MHz.
+	 */
+	if (r->keep_alive)
+		req->rate = max(req->rate, 19200000UL);
+
+	return 0;
+}
+
 static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
+	.determine_rate = clk_smd_rpm_determine_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
 	.is_prepared	= clk_smd_rpm_is_enabled,
 };

-- 
2.39.2

