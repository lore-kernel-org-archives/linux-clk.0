Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAF3E9F76;
	Tue,  2 Jun 2026 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409392; cv=none; b=B0fkUyWsN3wDaZjNytuMUmSzXr6yLp8W8zby+/5zcfZofESuEiTL/vAxFHtn9AFmMGrktgy/XONwElnmFDm91e1wpZaaqXJ6bi9VawjB84jABaUM8kAlbp3IsCR0/Cx/OfO6KiH1PLHM0ItELHtoLnCpj30lBNR1/gmV0P5hT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409392; c=relaxed/simple;
	bh=rYjHVseEk7q2fuVN4PVp5fpkdyQd9XxI0lYktezqe6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRwlb1Bq8a9nVpsAlk2Y3QiSzZF/+Jgod/WaLc5tfOJIzOL7pOqp5RwOU+l9crQe5r6gdx9RDDeGCAYv3rtOJ0yluxhjFTmddC29VbbHyXtEkl9LpEDW2Z8A+Q3DGXwmtcf9AtVK8QkTQCjSk1LVzmMj6CDQ0htrP9psaZDyYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=dIm9qE+4; arc=none smtp.client-ip=136.144.136.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="dIm9qE+4"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4gVCPs3GJMzGr9F;
	Tue,  2 Jun 2026 16:09:37 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVCPr5qRSzJjhY1;
	Tue,  2 Jun 2026 16:09:36 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 3/3] clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()
Date: Tue,  2 Jun 2026 16:09:34 +0200
Message-ID: <20260602140934.796697-4-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602140934.796697-1-github.com@herrie.org>
References: <20260602140934.796697-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780409377; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=yxHvBRpBzJac8N/xBG8/ALRzjPpG+vDneOpPAWA20jg=;
 b=dIm9qE+46Q/dO/NMnSlT2bsToHGES41k/cgFGCfE8sRR/dTQzKus+cJnM3kA226GSN3wg2
 l7fWF1A54w2XEDabU6pHjEYSmZH/sa0XBdbXaaFGBzI3zGDak3iO3fL3rPbMxrZqhZ4lwn
 1WhHrKD+OFxqc6Kx1SXRdHFwRfl+RSCRZTCUZh5Z0AHulYXqO2H9GiEucSI2JYCI/Ei9Ju
 p5rbSfQY4PBPKBQxA8BDXPowSLbJKctLrJ7dXYwXKbscjfnLBnTwpkJSlHTeeLatkPXniN
 VOcGWee5Fm4SmlEj8YZrmpwWmibzBKAzg69E5eWvTxVl1TLH+x2dEyPOFPdbBg==
X-Report-Abuse-To: abuse@transip.nl

gdsc_unregister() removes the OF provider entry and tears down the
parent/subdomain wiring, but never calls pm_genpd_remove() on the
individual generic_pm_domain structures registered by gdsc_init():

	void gdsc_unregister(struct gdsc_desc *desc)
	{
		struct device *dev = desc->dev;
		size_t num = desc->num;

		gdsc_pm_subdomain_remove(desc, num);
		of_genpd_del_provider(dev->of_node);
	}

That leaves dangling entries on the global gpd_list. After a provider
unbind/rebind cycle (deferred-probe replay during early boot, real
module unload of a clk driver that owns GDSCs, or an OF-overlay tear-
down) the next gdsc_init() will end up trying to re-register a name
that is still in the list and pm_genpd_init() returns -EEXIST.

While we are here, flip the order so the consumer-facing OF provider
entry is the first thing removed -- otherwise a fresh
of_genpd_get_from_provider() call racing with the teardown could
attach to a domain that is mid-removal.

Iterate the scs[] array and pm_genpd_remove() each registered domain
after the subdomain links are torn down. The regulators stay devm-
managed (devm_regulator_get_optional() in gdsc_register()), so the
release happens automatically when the underlying device is unbound;
just the genpd accounting needs to be undone explicitly.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a80a489763ed..71826ccbd9bd 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -645,10 +645,18 @@ int gdsc_register(struct gdsc_desc *desc,
 void gdsc_unregister(struct gdsc_desc *desc)
 {
 	struct device *dev = desc->dev;
+	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
+	int i;
 
-	gdsc_pm_subdomain_remove(desc, num);
 	of_genpd_del_provider(dev->of_node);
+	gdsc_pm_subdomain_remove(desc, num);
+
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
 }
 
 /*
-- 
2.43.0

