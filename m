Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EA4C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 19:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358907AbiDLTlK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 15:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344963AbiDLTlC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 15:41:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D0D3A5F3
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:38:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so25355980ljr.9
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54hyD1O7d+fGWjqIcvEcZYMPlC8QkQ4DBKr7tt1uh5Y=;
        b=y4q8p5Dz1lWFQ5h9jSeVccg2x3axt28EPX/rUe0escn8Vnsb0K8jKO3oTcrTCzFvYd
         wkSx7UXExybWyPTmmNkheq1gj47oPuyvZbu83tRqnFmJPVjWFCS/GfmYVcHwnOZFx8K3
         RIhCQ6yMaKO1Es6irLLKFw87yWbrX0WJHKsLtsN11zdOrn68lbm75jjAKlRtkekbQ0CZ
         bCInMj4jxdtwcdcLi/L4erVdz2hmmT4sdITeF0XtqzOjwH0NCz8PuuikffI64d0UfvGW
         +P7ROmOk7lZaIbJdF8o2IwGeC7MxDCYmTm9eosjeDGQqLCf7VCvsEEnfXOMQS8htsqs0
         gNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54hyD1O7d+fGWjqIcvEcZYMPlC8QkQ4DBKr7tt1uh5Y=;
        b=GQ9MdhnKqJrdSVRZVjK4XymQ6pWzG4IgNHs/rH5x/u4WQ7/sv0Ua0j8P8pJdGrKAYd
         33NfZibAV5i/Qk6pZtSfk3IYlFN7Hqu52CsWpvSYMV3DWAm0YJ9NQDkWDANz0i1wnIGT
         jQuUK4/WFf2YStxWJpGFQCgYQJ4i53AlP/9wws8WuoHLkpyT/AS+0/wr/CK9sGeJp7Wo
         VG74F5PNHVulD6+fdS9Ie4Yfk2Ejy7NHCLAgzcoQ4OdthFWCkXVULsDfv35Shr45l6Sa
         HnVDVnkoEpU+5WkzOIhJfkae1Y3RWMlNIFKAQbOA9TuysegMpIJy1G3+YzQRRBZ1JS5t
         ddNA==
X-Gm-Message-State: AOAM532gNeP27FRviuDfjBlNBuHORMySHoe4PT1Gfl8fCot/GJ1s+iqP
        uOF/xa1E8zjY6AEyCeYx2StsiHmTwY8ncg==
X-Google-Smtp-Source: ABdhPJzTqEdsgl89wcLxch5i9VXXa+ucKXhmMX+8NPi5vVDvQVgSQC9geOfkm7Z2+SKT37yYjuJBgw==
X-Received: by 2002:a2e:9185:0:b0:24b:671a:1737 with SMTP id f5-20020a2e9185000000b0024b671a1737mr5747454ljg.259.1649792322030;
        Tue, 12 Apr 2022 12:38:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a0565120a8400b00450abeb42b3sm2731641lfu.235.2022.04.12.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:38:41 -0700 (PDT)
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
Subject: [PATCH v2 1/5] clk: qcom: regmap-mux: add pipe clk implementation
Date:   Tue, 12 Apr 2022 22:38:35 +0300
Message-Id: <20220412193839.2545814-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On recent Qualcomm platforms the QMP PIPE clocks feed into a set of
muxes which must be parked to the "safe" source (bi_tcxo) when
corresponding GDSC is turned off and on again. Currently this is
handcoded in the PCIe driver by reparenting the gcc_pipe_N_clk_src
clock. However the same code sequence should be applied in the
pcie-qcom endpoint, USB3 and UFS drivers.

Rather than copying this sequence over and over again, follow the
example of clk_rcg2_shared_ops and implement this parking in the
enable() and disable() clock operations. As we are changing the parent
behind the back of the clock framework, also implement custom
set_parent() and get_parent() operations behaving accroding to the clock
framework expectations (cache the new parent if the clock is in disabled
state, return cached parent).

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-regmap-mux.c | 78 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h |  3 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index 45d9cca28064..c39ee783ee83 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -49,9 +49,87 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
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
+	val = mux->stored_parent_cfg;
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
+	mux->stored_parent_cfg = index;
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
+	mux->stored_parent_cfg = (val & mask) >> mux->shift;
+
+	val = mux->safe_src_parent;
+	if (mux->parent_map) {
+		int index = qcom_find_src_index(hw, mux->parent_map, val);
+
+		if (WARN_ON(index < 0))
+			return;
+
+		val = mux->parent_map[index].cfg;
+	}
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
+	val = mux->stored_parent_cfg;
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
index db6f4cdd9586..f86c674ce139 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -14,10 +14,13 @@ struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	u8			safe_src_parent;
+	u8			stored_parent_cfg;
 	const struct parent_map	*parent_map;
 	struct clk_regmap	clkr;
 };
 
 extern const struct clk_ops clk_regmap_mux_closest_ops;
+extern const struct clk_ops clk_regmap_mux_safe_ops;
 
 #endif
-- 
2.35.1

