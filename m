Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85326C74A4B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 16:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjCMQ7i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjCMQ7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 12:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4FB1EFDF
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726664;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FkVDFtAQ2HQaEyizSIOrTNSjW2E/XPvrw+UQkBvQei4=;
        b=cxw5MI7axlHvX+HtFrp/MJ9jxWen48K1cf5mDUtz451QdCALfC2CUKmNNikl6sePjzKlP7
        4z3RbGtyqhJpKaeO6B0iD0xiwmrmSNX4OQUxcJu2LgdYy9+MARehmiRfoksQQUge7zGZfm
        6TNCfxgLAb15z2l1IyLwIm+YnVKMc5E=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-v0DF8hPSNLyvCJT6YaE2ow-1; Mon, 13 Mar 2023 12:57:43 -0400
X-MC-Unique: v0DF8hPSNLyvCJT6YaE2ow-1
Received: by mail-oo1-f72.google.com with SMTP id t3-20020a4a96c3000000b005252e74e78fso3517457ooi.9
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkVDFtAQ2HQaEyizSIOrTNSjW2E/XPvrw+UQkBvQei4=;
        b=b5aCh9Zi7B7k8hXqNpKhk80xgAIiK6YW0zffuqRUf321wrxSOWAUcYJ8N6R6hBoT62
         HDzICYgFZJcjb7sEFpoaMYZ0inVXMfvrCTu/jkdMii+sh0ri46ThcNPdLn2MIvm6wA8h
         QL0WpoXdgnsMuoqcw9KT3BySQYIOjPB9pdVrg6R0/utrgfpB5ZcGGUAHbnz/KlsiflMe
         qgiQDBtG99ng0L7232BKKUs0zCYwsYE/3uSM+E5P4SWPoeNXwFP296POoFbd/R3023lW
         uVnNWfadADXCtZYPCGYGZrxkqGDCiMFZZOUzJapWZ5krm+bCUooXAcxJqTMVsehdkiD1
         oqiw==
X-Gm-Message-State: AO0yUKWJTGz8oiIAj4lscDoI8petn5xxMvXlq77tgFDcvhIcoQ75K8LJ
        hQgdTl7UgspzIiESEC0Tj0hXjeSNi18GkCWfAUBLKBvb3dRiCtWJUZDzloS8IRD3HUckMst3dQN
        qFMBT9fyK+bj+ZTMRMyDC
X-Received: by 2002:aca:130d:0:b0:378:7c77:6021 with SMTP id e13-20020aca130d000000b003787c776021mr13373616oii.8.1678726662721;
        Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set9zI+gra3VQW7qNd6jbtiTXOZJk4ZtO+IfaDcE9o1iUhzMPehPEW5A3iOw3mlYvk5kuKPNxoA==
X-Received: by 2002:aca:130d:0:b0:378:7c77:6021 with SMTP id e13-20020aca130d000000b003787c776021mr13373580oii.8.1678726662434;
        Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:42 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Date:   Mon, 13 Mar 2023 11:56:14 -0500
Message-Id: <20230313165620.128463-6-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the EMAC GDSCs to allow the EMAC hardware to be enabled.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c               | 18 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b3198784e1c3..04a99dbaa57e 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6873,6 +6873,22 @@ static struct gdsc usb30_sec_gdsc = {
 	.pwrsts = PWRSTS_RET_ON,
 };
 
+static struct gdsc emac_0_gdsc = {
+	.gdscr = 0xaa004,
+	.pd = {
+		.name = "emac_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc emac_1_gdsc = {
+	.gdscr = 0xba004,
+	.pd = {
+		.name = "emac_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
 	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
@@ -7351,6 +7367,8 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
 	[USB30_MP_GDSC] = &usb30_mp_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
+	[EMAC_0_GDSC] = &emac_0_gdsc,
+	[EMAC_1_GDSC] = &emac_1_gdsc,
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index cb2fb638825c..721105ea4fad 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -492,5 +492,7 @@
 #define USB30_MP_GDSC					9
 #define USB30_PRIM_GDSC					10
 #define USB30_SEC_GDSC					11
+#define EMAC_0_GDSC					12
+#define EMAC_1_GDSC					13
 
 #endif
-- 
2.39.2

