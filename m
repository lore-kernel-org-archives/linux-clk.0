Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3137D11C;
	Fri, 20 Mar 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774002871; cv=none; b=sN/wpjjuOSmCSHSfrSwTZJulNr8uhyajkS5iYkI+G9xO5gNCS7AvRHVUEIsqJn/fMNEyxAnFTRwZWWfaOGnbFFysuqSbpB8ZLU+pAToBCpFGoYb/bzrdhVzMQ6xe9LMokIdn/9FKImM+KjvIZvvYztiV00+gYEgO/wxrVCvKvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774002871; c=relaxed/simple;
	bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5kguDZUeWG4ENuiPbZasSl3fqgJeSKXovqvQOVDl3MxqTlz8F1eAVaokSG0JA0WWpdCb1EDDiJY6JsB0b+iMImeg4iFaHytE4azghsEKqVqrG0VLxMS2OXmaesrhOEkTd+Nt8S9D4AgjiPrd17Br4ca50HaVG5Zgkxw7H9dj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=ms1v4Gk5; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="ms1v4Gk5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ob+IZvhkIha5DTBe/HV7/KpWvsF/0JXOGJlTDavxCws=; b=ms1v4Gk5fJjt5tUCjPL4TCWeBT
	O2YctRvPsU1HkWdJg5EQ7f71SnMCSjhzJ3LPL4k9xFo5+3CV4L82W1XEw1sg6w7dFtoiv61l4m4Yx
	wsjXEauOD0N0e25hOXc+oIH2fpXBHV/4ablG6K380ZKuYf5LmUK83ibH23D693p+acnxCgN086i0U
	M4repuVfPJd0wNhaH68PsYvt1NW4Ler7cijv/6EJVQpeuzwQLDWC5nxUh4vUHpYhEOpYwrNkkANXe
	KwQnVIVtg9FcVmVnn2HpPGqbdXVPS2SOp5sZ4kveksMuHFR9SvMDf+Qz8ums72BwCSEBs0wDphL8/
	GYfHpd8w==;
Received: from [2a0d:52c0:500f:0:89f2:a47:418d:affd] (port=53820 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w3XBW-00000005JXw-1WAm;
	Fri, 20 Mar 2026 11:34:27 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Fri, 20 Mar 2026 11:34:14 +0100
Subject: [PATCH v3 2/4] clk: rockchip: allow grf_type_sys lookup in
 aux_grf_table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rk3588-mclk-gate-grf-v3-2-980338eacd2c@superkali.me>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774002854; l=1708;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
 b=OmOmt2iWriL7TqxPVLJaGDFEHhSk73NWzFr6M7ELjJJb+ystBb0yvMxsqdrXuv81P7PUahUZS
 8CaZutVbw1DAMH0ffPzeNYnUcUXYXCx2tHzsYAA6OR8aaSynrPbJB81
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

