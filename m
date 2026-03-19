Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738E3A1694;
	Thu, 19 Mar 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905655; cv=none; b=E27+nC8yyiSr4nX7Ojlen4lwdJbH3n0dWfCyM61OqTgCa8JStgz/b8X5QL28Y6AlTZiBS31RWWjlbrnd+YQ39QlSlnr8cJINS9pUhy1j53653yRStwMpVN+gn/2uBHCLGj3XoLPp7nmjL1wN+5swp9dWnSEruuWy2KfJ2VEO3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905655; c=relaxed/simple;
	bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpwSmbNZ1CkW+kkHvDs+tmqzVfzEgCKmIb0p5V09mKCERKFELYS6LhwhXigGRveyxbwJ3RKveSylP5BHwSSe3DiIuWqG2v6ZIs3VEkDEvDAzfyLOca3jFoW06D5o+HMh7Uv+JQC4cqErSTvVmppdxw7EbPxK9rXWwUNWaxgQZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=LCUuc0Um; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="LCUuc0Um"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ob+IZvhkIha5DTBe/HV7/KpWvsF/0JXOGJlTDavxCws=; b=LCUuc0Um3IQUEw5OCt8m2did9c
	02xLgHhXHwXZH5P4EDFOP8yzDJ7A3iTWYZKH30OL5QmITY9DQkR6qKJr3ySjkJd6IC1j9u9p4RIV1
	0HM6F70JB/NKV895yUVPsrqNzkA7VZbeck4zitfqmVCf6zZkEeYvKZhyrRQJ8+Q/OQsR1oNoKHc5r
	XMCob9bsXHbl86vGVRGXVSLqLHL9GiEirMJucbSpkw7JfihmXR7hOjOU/s+FCStp0eErIbgA+cuD7
	RwOUMsIzTkgkx8BAPcXjmSHLzGU1WxyCL7EgaDRfN+9aL6rKO3Z9ZjQ/DVltp8SMwPuuv6ZhYIRwB
	WYQ0+w5A==;
Received: from [109.52.2.233] (port=10095 helo=mac.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w37tR-0000000DgEs-1Eqr;
	Thu, 19 Mar 2026 08:34:06 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Thu, 19 Mar 2026 08:34:00 +0100
Subject: [PATCH v2 2/3] clk: rockchip: allow grf_type_sys lookup in
 aux_grf_table
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rk3588-mclk-gate-grf-v2-2-c4c8daab0762@superkali.me>
References: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
In-Reply-To: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773905640; l=1708;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=WL4AZHxfBGBXO8GMVo8sFDi5dqnXuP+ssvyAyb87JKI=;
 b=CIBbXZiSnKKJf6/VCZVNzJ5/Lt9EuE5/PE8VkfNlNP486LQx0DFv1wQzMlAK+TMvYM17A3kOZ
 iPesQEuOR6EAbz3FxOiT0p4rKB9TickY9UT0KBVTzswjrW3QbrNIp6c
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

