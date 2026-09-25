Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5F387373;
	Fri, 25 Sep 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347526; cv=none; b=ERuchhy6ifQIkoNw8X30+L3orUH27BWCsBMpKBWor3uhmJjHOEZOMHp3p7bxLmAHICHU7CU1j5IAXwWW0aiQxAHGFAa1pnc0FIDLP/zQf/suxtXDlA2cqmQsBIf8k9zk/hIin5OxnPiXQsozWhrPlv3rSx1zAQrJ1JBqVfimDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347526; c=relaxed/simple;
	bh=ML8xGeJkMBFFuMCc01tEEnknU1OExtMrKqZGCEmNfaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbrHsPDMZ6YTqeCa1DWQIpq0wXBsJ3rxNsSqrFqp4SFrHMyCn++/bsRdDGO1kRHmiXrU+iCxWSa9MSH5gRuOZTXFM4n//R4wWnwTWbvfMt4GYkElFi0amxlsoxjF7pK81XNlHTwDGBXsAxwrW1792gaNVwcFOvQcHpuAxW3CRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uO46dbdX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uO46dbdX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2AB18C653F0;
	Fri, 25 Sep 2026 14:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3805D6073B;
	Fri, 25 Sep 2026 14:45:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47AB4102F1E07;
	Fri, 25 Sep 2026 16:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790347517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rLcTEY9bJK7D3aB6ON4jRKBYa5Go52EKWi4ZLVeVWAM=;
	b=uO46dbdXDQzTWoXCmwNHDCYs5MGzz1k8Yi4clftYkyWitlHG979vJvanTTBAL3tTl/y4Aw
	Xj4EYJEgfFFwz0ks0fKanM4frUfmlZwwGkm16jPFGUDHBncL72LFqn4SSpRevaNQFv0mCm
	vA8v5C+wTswqi6jXsWWDS+4AU72qO8T5Vsn/QIamievB3+0rIOnjdKSA4dLuBxdOTKLaXK
	A0qQM9d1qL8CLzgeZSJ4F5P7hkSNB0JUKoMej1dKJs5EGm9ranUTmOFKp5AGpwjT77mtz/
	qj9/8gLfTHTKBPd6Uod2OloYazOZM2nNvNZSImwxabBreOeupeUVRPSyeOlZrA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 16:44:25 +0200
Subject: [PATCH v3 6/6] clk: nuvoton: ma35d1: Avoid possible error pointer
 dereferencing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v3-6-ffbae7e020a8@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

MA35D1 registration helpers store their parent_hw
argument straight into the parent data, without checking it first. In
case of registration failure an error pointer will be stored in the
table, which is then forwarded to the clk core, which treats any
non-NULL parent as valid handles.

Bail out early when the parent is an error pointer, instead of building
the parent data.

This issue is mostly theoretical in practice, since reaching such an
error would involve a very early -ENOMEM.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c |  3 +++
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |  3 +++
 drivers/clk/nuvoton/clk-ma35d1.c         | 13 +++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..57a7b4ed3b5e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -90,6 +90,9 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	int ret;
 	int i;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index c7c0dc91a012..92424e9c669d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -336,6 +336,9 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 	struct clk_hw *hw;
 	int ret;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 538ec87afeea..98608a26c5b3 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -130,10 +130,19 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const int *parent_idx, int num_parents)
 {
 	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};
+	struct clk_hw *parent;
 	int i;
 
-	for (i = 0; i < num_parents; i++)
-		parent_hws[i] = (parent_idx[i] >= 0) ? hws[parent_idx[i]] : NULL;
+	for (i = 0; i < num_parents; i++) {
+		if (parent_idx[i] < 0)
+			continue;
+
+		parent = hws[parent_idx[i]];
+		if (IS_ERR(parent))
+			return parent;
+
+		parent_hws[i] = parent;
+	}
 
 	return clk_hw_register_mux_hws(dev, name, parent_hws, num_parents,
 				       CLK_SET_RATE_NO_REPARENT, reg, shift,

-- 
2.55.0

