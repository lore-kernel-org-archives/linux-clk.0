Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28FB1339B1;
	Sun, 19 Apr 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599007; cv=none; b=WzwGIE3qA44X4tQUJS6Iiyrmmintfa4tJISxU7llk5Ll33U5kyK/Nnyu5BWLPEW4l2O/85AfMGcHhUXD49L13KTtb5eH+mCxrTQ09cQnodpWKwmPmP8Y5sUKo+V6aD+7emviCPAXD+hBeErkBqxenFl+e3Iq9/jYynw1UViXa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599007; c=relaxed/simple;
	bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJ/Uj7+R41zJ3UI9sh45TaS405Qt3CB6Nx22eUgfhfa+dHNOXNDPdEVDWsWV9lu1UL0pyL96Vm0hk2iwabvclZzbhMtzw3tTVwj0WyL3RqJxpPvK+i1Df0ed0TDF2ugvW+ralNuTNEB5tR9g1XK+uLcRSlARfVuQ1Nne2wiH75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=P4LBgMeu; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="P4LBgMeu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ob+IZvhkIha5DTBe/HV7/KpWvsF/0JXOGJlTDavxCws=; b=P4LBgMeuLOq3uCybMLrjNXny7k
	0nSUQYSlzzL0V8PBZFPq85imcyLAGUkfcpiteQYIzX7/eLE6ROppehSQK4wmh0LptCdnVxwfWCwA4
	ixBB+9NQHOXzC2m+AEren/ZWXQdiaKe0lchY6mQ7e7ejoz5ufWc9OGCf5LWKziJJFXKGCrNPTKfbZ
	u9lRUG90EgrpDsexljotIJHq/VP/m2kKExXF4oYYntiDCmbERM1b4SGgLQnuCH/X/00iuR/N74jm9
	fuP1c20f5OvgVzcoZh8CkzNPGZIIpNl0Oc7wF1PIoCjJkUEKPUqbt7QEQ85iTz7yppjrgC6hYSc0T
	IfB3F0cw==;
Received: from [2a0d:52c0:500f:0:89e7:36b:a29f:1abe] (port=50188 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1wEQYe-00000000aDt-0794;
	Sun, 19 Apr 2026 13:43:23 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Sun, 19 Apr 2026 13:43:07 +0200
Subject: [PATCH v4 2/5] clk: rockchip: allow grf_type_sys lookup in
 aux_grf_table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-rk3588-mclk-gate-grf-v4-2-513a42dd1dcc@superkali.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776598989; l=1708;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
 b=5VqU7APGADLVd+zkuPwb667zDrM45YTOPSrvYA0INwI2AXiQrDTV9haJ3c3wRGex6+Weu/f6F
 6DOsVhyLvwDCvSHfsAu1IlMSpEOMtCJy38IWjaonWcgyQtG7arLj8VY
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

Remove the grf_type_sys exclusion from the auxiliary GRF table lookup
in rockchip_clk_register_branches(). Previously, branches with
grf_type_sys always used ctx->grf directly, bypassing the aux_grf_table.

This is a problem on SoCs like RK3588 where ctx->grf points to the
PHP_GRF (set via the CRU's rockchip,grf phandle), but GATE_GRF clock
entries need to access the SYS_GRF instead.

With this change, grf_type_sys branches first check the aux_grf_table,
and fall back to ctx->grf if no entry is found. This is backwards
compatible: on SoCs that do not register grf_type_sys in the
aux_grf_table, the behavior is unchanged.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index e8b3b0b9a4f8..911e6b610618 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -509,10 +509,9 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		clk = NULL;
 
 		/* for GRF-dependent branches, choose the right grf first */
-		if ((list->branch_type == branch_grf_mux ||
-		     list->branch_type == branch_grf_gate ||
-		     list->branch_type == branch_grf_mmc) &&
-		    list->grf_type != grf_type_sys) {
+		if (list->branch_type == branch_grf_mux ||
+		    list->branch_type == branch_grf_gate ||
+		    list->branch_type == branch_grf_mmc) {
 			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
 				if (agrf->type == list->grf_type) {
 					grf = agrf->grf;

-- 
2.53.0

