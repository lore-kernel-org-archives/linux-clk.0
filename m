Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080093403E5
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994851; cv=none; b=bmcu1zzFJwvCxmwPh/Z127uwiOSMhsOd3D/zj9rvyzo/7ii3VFbC3gAs9xYejDmZAonVrC2aarFFncAcyabdbD0XX54dH8cGo+SdcqXnuUME1av0FO4MFnTea+YVsWMPbrf+8blMg7DcMsAaRBlgbWlYxJIqvENVU/LMhB4Qc6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994851; c=relaxed/simple;
	bh=G3QQpR8rFP9MtjIXSfetY6TLu8NVajep3IQklei1i4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3nN1uBUW43TbRKC8zKahj43fEPB1q4L2uekIP74Xc1JNFwcmm15Fdn+Hle5zoqF1CtG4N7wQ5mVQWhAM7TbrQeYdCc8F4Zhc2QNaMmKL3+mp/NhICZsDRxbC7QYsqlX66Wd44gS53DsJWQ6FsLdMpkgkiNIzjPeSjc2oCURkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OstW3Qcr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OstW3Qcr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1860558fso8261988f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994820; x=1780599620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMXXtYGcE9eK212AumCdNI+6/leOGhk7hdPMWy8VAbo=;
        b=OstW3QcrQtCVFZc2uaEns05VF3FuZ8UMYncjTgWVKxrgQbIawGITqdihbhBySIVBG8
         GmP3uVljiEoaaDBXKcrnAiBUS+ePi/ec9gBVASI/NlcTUCN6wBcQlDgssNKCgqBoQq5Z
         L82ErrR1960QihtI8GvTkKzML5joVBtTsJ+SVciOfCNB5ZF84DF07LeQJBYLuZMFpSuW
         Orow+l5fJbNeS46EPL0t+pgIUZFpXiyTWHpG+pOZmGQ3drzST02V5iV4N850MQLKEqPP
         D9eK+RWsWovSMjbIFGby5U12MFXGgTdTkPQ44a9ZkCgVHq3oNh6pTGoolbGCYq1Iq+b6
         z9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994820; x=1780599620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMXXtYGcE9eK212AumCdNI+6/leOGhk7hdPMWy8VAbo=;
        b=Wbg5HcB9l3pdKe41Dvu3EAFjr9OHN17gEpTJScV3/z/WeauAci3RdwyYgBanobtHEF
         ajuN7niqF/8OfIqTdDx33sxs+a+P2AJSTvvSqZOoplnoUUGygnxSxm4D37GQxqV94eIK
         D1ppzoYw2SO4iGKFy+JF+wTDcQOLObFD2XAIY+HBTLqGdUfwoLLr+3fq5rp35Hp4d637
         QSVAJC1AuhRw1Ol+J9n3FF/ikJmfneMWgI0ZKOr8c6M54lkWIsqNYS2jfbAO63SzTf2g
         JlwWMkeush9O7M/Nic+UvcODlwaOeGfnxwnb6OWXqbuA9OdbYWYLtJfywKEBOgitURx1
         Q8Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8MbdOKnwfJ+Hq0balMTfXT5dTDS09ZIkfLoN4XYbm+1KwYUlnY7tdpBTzLUH/gJ2smqoHlEPMAvbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuDpBzpOSBFGyOFxnf+Txz27JftSbn5ok5hSPe8Sn3yJEn2ea
	bA/U6elJnC5TamfccRQoLG6LEbIsu7ppSGzsOaC/u7ye0QykANUqcxrd
X-Gm-Gg: Acq92OF9A9gWLHnO1yrQywpw3lpcqqMxGUe5wA0Hwf7xrLW+ueLvl7O0viAr4mu+KTA
	Hz0oZzWI8LGCuaoaqkyNfn1JkUZib8BW2WUQuuvoBBbng5fB5RPQOufiNRij8bcOkcu2x2mY16Q
	eCfIjmr03Xba1ee2Efbco85DQtOWU70LNel3oty46RRBAqmtvag8liRpI6Vh5TXZzdDg1HWw0MK
	tHyBW4W4gmkHQCaZ87j4SebTVgBNeRFsewKlv2OJtgm/8ntTqbpFbUCp053Gvytri9njQli9c6B
	sztTemOQDM+Kt+6RryGlpWBvSz10zsnQU3GCqQ8mpkWAcr0am08DoU/BFfqcVYG/v5CmU8Gjfon
	eEKsY8068toeWPyXrvOhB9/KSjydFDqvbMWD/SSF6/fbQ2rXuEKZTPCvuVxKxMCSbzkuLSVlrDZ
	DmlM0+XDdlM9vGZ10wnXEGeB8As9nZxbT7aUE59tRVjyGukKMWsb9oUG7N7SQD0OhFom2NWieCy
	/fqVPk=
X-Received: by 2002:a05:6000:1006:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-45ef05f84f1mr517631f8f.30.1779994820053;
        Thu, 28 May 2026 12:00:20 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8625408f8f.16.2026.05.28.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:00:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 2/3] clk: en7523: generalize register clocks function
Date: Thu, 28 May 2026 20:59:55 +0200
Message-ID: <20260528190000.9164-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528190000.9164-1-ansuelsmth@gmail.com>
References: <20260528190000.9164-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..087ff4568124 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -115,6 +115,7 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -711,12 +712,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -991,6 +995,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.53.0

