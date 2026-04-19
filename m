Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AF3264FD;
	Sun, 19 Apr 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599018; cv=none; b=mB+twBBo2uQ6wTGmp7HjDm4GoTcidEgcpmYG3LBzweOQeUQhdVWiwYd1kPNxdiW+U8lSMhYirSkQDfzbAKYP8tk4wtBJNwgZLClUf/NcXqXV7wTD8saY6tShu7xUFaCJdPJAxaIdTS3cSHxL1oNG6yy2402AU7gJ1fIzotgBl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599018; c=relaxed/simple;
	bh=psj5QJkOPaUusoJinRKeZbRw1QnonW/74AVrQw1r/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVbS2+jhSHeNLanywRY/AjVFnO5tmrLeGrf7Bpp2mkDKVtxyz4f2GLMMMhP4cr/zDeA5A8odhMb9ZkfkeZ36BAT9tc/gWOdroyVjdrhUwkZ5F5V/H19iWR+Vwu1nqoLlJMOAH9sSMlveZi47/u53BsDwZPgUKruNNNF/Vw0nops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=fyJwZ2Rn; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="fyJwZ2Rn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VlRqlyVQuztkCSZ+ucZAFKU3OzZAzdBtOCzMJNs1zHQ=; b=fyJwZ2RnBjxwyL2LwZDSSD+6AD
	W926+r04j6K0L/hDv9V4whbpnGzG3YgWSxp4tC2C4q7WK1E7snLu1QHFXoecea7EfyoarC6YAe/vQ
	47bEY2yWNQYXWots7h5RneuT1PnUbwq5bsLGkEheMFoC+ZDS77tMq5PoJ1PSKdDpzdxrgosjEeGS/
	II2dmEZyfgLEHQzZlvRniCCEpupxpDANvghlG96JwEayYS2dLFTjkDIhPYSf1eREvaMVzddOz79xr
	AXGQT4mpvaBhog8OtIbOFD3QgXhiv64fJf/bNYYQLC9COTxaMXIhtBrHWzfehUCdysuigqCvm2SDv
	a+p4A/Lw==;
Received: from [2a0d:52c0:500f:0:89e7:36b:a29f:1abe] (port=50188 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1wEQYo-00000000aDt-2CdC;
	Sun, 19 Apr 2026 13:43:34 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Sun, 19 Apr 2026 13:43:09 +0200
Subject: [PATCH v4 4/5] soc: rockchip: rk3588: add SYS_GRF SOC_CON6
 register offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-rk3588-mclk-gate-grf-v4-4-513a42dd1dcc@superkali.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776598989; l=821;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=psj5QJkOPaUusoJinRKeZbRw1QnonW/74AVrQw1r/Jw=;
 b=1p6kStTvgkkWSvQiDVUEGs3dDMs3uLZjP+ZZ5EQ6TpjS+CW+mfUwuZKz5GZ8MufyYepLtxpNM
 h2uofNkGNVbBorptxlJSFf64JJPpT+ANw11baw6W2Fbaf/zkyBEndnu
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

Add the RK3588_SYSGRF_SOC_CON6 register offset to the RK3588 GRF
header. This register contains the I2S MCLK output to IO gate bits,
needed by the clock driver.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/soc/rockchip/rk3588_grf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/rockchip/rk3588_grf.h b/include/soc/rockchip/rk3588_grf.h
index 02a7b2432d99..db0092fc66ad 100644
--- a/include/soc/rockchip/rk3588_grf.h
+++ b/include/soc/rockchip/rk3588_grf.h
@@ -19,4 +19,6 @@
 /* Whether the LPDDR5 is in 2:1 (= 0) or 4:1 (= 1) CKR a.k.a. DQS mode */
 #define RK3588_PMUGRF_OS_REG6_LP5_CKR			BIT(0)
 
+#define RK3588_SYSGRF_SOC_CON6			0x0318
+
 #endif /* __SOC_RK3588_GRF_H */

-- 
2.53.0

