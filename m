Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5FEC433FE
	for <linux-clk@archiver.kernel.org>; Sun, 13 Mar 2022 00:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiCMAJm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 19:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbiCMAJk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 19:09:40 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C31927FE6
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 16:08:34 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 25so17009770ljv.10
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 16:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=APUYBe0TqoLNb60yJh0EtkIi3YX9wceE9eYvJbV9UfA=;
        b=SlW0HqEkN1zYQnhxxR3IE91D6sz0cg+4HVyw6V5rbiIqEZ2CbmF1zct3K3QTZtRV8Q
         3u9Q9gdDX54cpyKl61ldEVCR3anp30A00o/6RXDTGsoQ+nk4REekCHvlklO++C63aJ/E
         V9GcHd8YUMSKI4yAqE+JgjJUjM0Xbg2pJIQ5a0iaNTawMtkahUWD8Gc59l4gHCqffLc5
         OHIG7XMUfzZ0898Q1FIxgFB/KWz2Vhl0Rx7GGSqQFTCoVL4hP8UM9AyFe5B8IF8eRw/Y
         mYtrfI5oKo4hrg2YiaprYgZ7t+IcCI4oIME0Phx3IxlA5sYUFDcor1NZOSHOQNZe96xD
         OzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=APUYBe0TqoLNb60yJh0EtkIi3YX9wceE9eYvJbV9UfA=;
        b=7vadufRmBdk79YqORURAmFYctLk2EztOwtlOTe96C3eaB3y//Uifl519n7tp7RaELt
         TVLg/R9XdIdbPNlf/rm+Gu/D5aD9Pwi9YlkM+6begJYIZn3x96c74XR79XMHwyHpIFko
         JIkUGvuvBdNm92YYptV7Er85zA44kgGqiIYYCFyRLmvRIziWXYKHVbazGZ+iXL+qjyCK
         AHousEsSoCZanGeqizarJOAfzEQZTgWOCuBSfMVkls7QuXS6nFzI1XTV8rNlipIDkUZG
         ml1xd7nBNOpX9/T7bmiPKNQvaDlJOCxWHvNP4/HxT/e+nzuWpJ6oA5AQxpzza8RjHN55
         DZPQ==
X-Gm-Message-State: AOAM530r9MZCtaShMfydly+PIEcY0lsEH/ut4XPhWEC/L5ywNA+Q5G/g
        2Be2sjOGZu5L2cu5hyGJe2y4CA==
X-Google-Smtp-Source: ABdhPJybR54R0cNuQzQ9YRRjo/Xtdu0cp4IFcVpA/Isf+aIM6lLvHJVHLYVsXFaO8c0ZXKDOPNAd2w==
X-Received: by 2002:a2e:bf04:0:b0:246:7ace:e157 with SMTP id c4-20020a2ebf04000000b002467acee157mr10227672ljr.241.1647130112241;
        Sat, 12 Mar 2022 16:08:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (pppoe.178-66-158-48.dynamic.avangarddsl.ru. [178.66.158.48])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b00247dbb3e476sm2776017ljp.40.2022.03.12.16.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 16:08:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [RFC PATCH 1/5] clk: qcom: regmap-mux: add pipe clk implementation
Date:   Sun, 13 Mar 2022 03:08:20 +0300
Message-Id: <20220313000824.229405-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
References: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PCIe PIPE clk (and some other clocks) must be parked to the "safe"
source (bi_tcxo) when corresponding GDSC is turned off and on again.
Currently this is handcoded in the PCIe driver, reparenting the
gcc_pipe_N_clk_src clock. However the same code sequence should be
applied in the pcie-qcom-ep, USB3 and UFS drivers.

Rather than copying this sequence over and over again, follow the
example of clk_rcg2_shared_ops and implement this parking in the
enable() and disable() clock operations. As we are changing the parent
behind the back of the clock framework, also implement custom
set_parent() and get_parent() operations behaving accroding to the clock
framework expectations (cache the new parent if the clock is in disabled
state, return cached parent).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-regmap-mux.c | 70 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h |  3 ++
 2 files changed, 73 insertions(+)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index 45d9cca28064..024412b070c5 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -49,9 +49,79 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
 	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
 }
 
+static u8 mux_safe_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	unsigned int val;
+
+	if (clk_hw_is_enabled(hw))
+		return mux_get_parent(hw);
+
+	val = mux->stored_parent;
+
+	if (mux->parent_map)
+		return qcom_find_cfg_index(hw, mux->parent_map, val);
+
+	return val;
+}
+
+static int mux_safe_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+
+	if (clk_hw_is_enabled(hw))
+		return mux_set_parent(hw, index);
+
+	if (mux->parent_map)
+		index = mux->parent_map[index].cfg;
+
+	mux->stored_parent = index;
+
+	return 0;
+}
+
+static void mux_safe_disable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
+	unsigned int val;
+
+	regmap_read(clkr->regmap, mux->reg, &val);
+
+	mux->stored_parent = (val & mask) >> mux->shift;
+
+	val = mux->safe_src_index;
+	val <<= mux->shift;
+
+	regmap_update_bits(clkr->regmap, mux->reg, mask, val);
+}
+
+static int mux_safe_enable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *mux = to_clk_regmap_mux(hw);
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
+	unsigned int val;
+
+	val = mux->stored_parent;
+	val <<= mux->shift;
+
+	return regmap_update_bits(clkr->regmap, mux->reg, mask, val);
+}
+
 const struct clk_ops clk_regmap_mux_closest_ops = {
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 	.determine_rate = __clk_mux_determine_rate_closest,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_mux_closest_ops);
+
+const struct clk_ops clk_regmap_mux_safe_ops = {
+	.enable = mux_safe_enable,
+	.disable = mux_safe_disable,
+	.get_parent = mux_safe_get_parent,
+	.set_parent = mux_safe_set_parent,
+	.determine_rate = __clk_mux_determine_rate_closest,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_mux_safe_ops);
diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
index db6f4cdd9586..ab8ab25d79bd 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -14,10 +14,13 @@ struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	u8			safe_src_index;
+	u8			stored_parent;
 	const struct parent_map	*parent_map;
 	struct clk_regmap	clkr;
 };
 
 extern const struct clk_ops clk_regmap_mux_closest_ops;
+extern const struct clk_ops clk_regmap_mux_safe_ops;
 
 #endif
-- 
2.34.1

