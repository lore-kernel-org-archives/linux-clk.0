Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260971339B1;
	Sun, 19 Apr 2026 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599011; cv=none; b=uW53H3wws3s3jQGu361bSYQchVyXVBxeKRluzc0rdtmBi0S9xhvKo9/CunIgbq/SV5hhrdH6pjpDlhbZI0gzHgtlVqK0pWUf5kAwiByUfLN6bghvuyYSBjA4AALXTP+S4qtw7PybBjavSYmAENJmhDGVD1bsAXLtL22umb96AWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599011; c=relaxed/simple;
	bh=xA2GFZB8SzFD5608ibTQ/WmfI41xporUbQa+lsAS6LQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDQ99DpT0BNysw0/nj2TkS2KfrV6eNy3fHi+9/1nl6pbU931fBn/Gr5SfISv8S28n85dZm4A3J5hEepjAGS8IWCQs/8HiAtkNOszwxYizN9mSaFGgFpPVlmD6WJqPmxbQeOGeictR5Ft7pA/AnChUxCHLVXlBcnSxzIk5Pk1PiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=n+E+ckmz; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="n+E+ckmz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hU+eJE464FJ6heESrTJACH4k8SfbVTNxC512B5AQLnk=; b=n+E+ckmz6R5fHNL/f7qWmyHjs8
	fe+ASeWmhchWTlnJJdtvDjItGdfDK3l/BHOsyYI1/4qzOgFuMegH9Qhr6ybBr5l8VCIkQLnHxpKMS
	7MA5UNSObOadY8JauuFPzekc5XSInl7RcFHue32JwHe7IeCieOBIF3TGW6qMEJZYkCPDgousKq1Iy
	w32giFspzdPvSoE7Z6cSzHecBvNX/2mR7k8ztegH7lakxWAhYf6T4nDYWYY2HL58vHX//f2WEz0fi
	s1Bb3ff9l7N4lyUzBBNjKx9L4Osa2myKF1umtj8z8pudqqK4ICqXYqSkePiSDXjeHrLt7wr2ZboO9
	VkeoejkA==;
Received: from [2a0d:52c0:500f:0:89e7:36b:a29f:1abe] (port=50188 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1wEQYh-00000000aDt-3K1H;
	Sun, 19 Apr 2026 13:43:27 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Sun, 19 Apr 2026 13:43:08 +0200
Subject: [PATCH v4 3/5] clk: rockchip: add helper to register auxiliary
 GRFs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-rk3588-mclk-gate-grf-v4-3-513a42dd1dcc@superkali.me>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
In-Reply-To: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776598989; l=2139;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=xA2GFZB8SzFD5608ibTQ/WmfI41xporUbQa+lsAS6LQ=;
 b=VDYFtGvJ5aGaeqR2rmblNWgQDR05FgbIqovQcFPPKoOMj8JlvOR2hcl+gx4XyexfORQ77gzCW
 PZKAXO6SNTKAwSW4ysZFg/O9t+ZF9c7JLcIrmbDj2tpBTokZppBx1Df
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add rockchip_clk_add_grf() as a helper to register an auxiliary GRF
into the clock provider's aux_grf_table. This encapsulates the
struct rockchip_aux_grf allocation and hashtable insertion, so SoC
clock drivers do not need to open-code it.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk.c | 18 ++++++++++++++++++
 drivers/clk/rockchip/clk.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 911e6b610618..ee8c79b938d3 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -429,6 +429,24 @@ void rockchip_clk_of_add_provider(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_of_add_provider);
 
+int rockchip_clk_add_grf(struct rockchip_clk_provider *ctx,
+			 struct regmap *grf,
+			 enum rockchip_grf_type type)
+{
+	struct rockchip_aux_grf *aux_grf;
+
+	aux_grf = kzalloc_obj(*aux_grf);
+	if (!aux_grf)
+		return -ENOMEM;
+
+	aux_grf->grf = grf;
+	aux_grf->type = type;
+	hash_add(ctx->aux_grf_table, &aux_grf->node, type);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rockchip_clk_add_grf);
+
 void rockchip_clk_register_plls(struct rockchip_clk_provider *ctx,
 				struct rockchip_pll_clock *list,
 				unsigned int nr_pll, int grf_lock_offset)
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index cf0f5f11c34b..9e3503e2ffc2 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -1329,6 +1329,9 @@ struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
 void rockchip_clk_finalize(struct rockchip_clk_provider *ctx);
 void rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx);
+int rockchip_clk_add_grf(struct rockchip_clk_provider *ctx,
+			 struct regmap *grf,
+			 enum rockchip_grf_type type);
 unsigned long rockchip_clk_find_max_clk_id(struct rockchip_clk_branch *list,
 					   unsigned int nr_clk);
 void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,

-- 
2.53.0

