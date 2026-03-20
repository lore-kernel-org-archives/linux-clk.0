Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35938F259;
	Fri, 20 Mar 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774002874; cv=none; b=GumrPc5/RzV0YS23W5Zj/cjKEAs56JGA+hBp4gtfJK0KzqPgPk9xKymuT/iIT76fNJrSUd4cnKLiW5CvJCFALwcJsTnwruV3USdysFDs9JwiVRgzrVP6+yk6rM1+a2DTqZHyVvtoD6IX7kifNvyvswtrH9eBVRxuFcUr5rUyUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774002874; c=relaxed/simple;
	bh=UQEiDKSJXeYPDA3RGeG+ndD97rbfufDLqHqwaCQMuJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIObRLs5PPAmZJc+Uw6dHwWeXAYpd0JejV8gjPyrXv5Z21SN/9Wjxbt5H4sTpPHiFM4Yr2co42Qwi6jdlJso+43nl/CvOJm/yk1c1fNrOhPzu0sclIgulGT8oGP2+BpzCRFUglsZYDIVNcplMIAZdluskTj/XL5jcma5VGjOusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=XxW3jZEP; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="XxW3jZEP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rl66oOZ9dra82J7CjNCHzOpuoOwvMztRV6mr5JP3oB8=; b=XxW3jZEPWdVk9ikWPNHNrTOgFZ
	1aELcnb5rU9+1TJfxHoOJ2MauByVKpoV1jAuZiRwVtQX3LRpwoMMzx1jaqWNb4o8bVMoOPiNMVrFK
	QQBcI6im6XDHi0c3D9kSxRJYX72b/A4ff91zwAhM3Ees+GGOtgxZYedcd1Dc6M75BvAmDkmS6bWhj
	aLeQDvcZRtp0TXvSzh8c660p/zp8c9HPMryINfE2ijyCGpF7SUu7V5uzEcfoWAGd1CbYyPUlxbXpn
	6ENG+KbMHbggI1G5vguEcGjmuoAASbDtK/nmme/ljehYETD1/0aBiX5bbKE3jsg04Z8rvPyNkNwzr
	nc1sfAyg==;
Received: from [2a0d:52c0:500f:0:89f2:a47:418d:affd] (port=53820 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w3XBa-00000005JXw-0bOu;
	Fri, 20 Mar 2026 11:34:31 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Fri, 20 Mar 2026 11:34:15 +0100
Subject: [PATCH v3 3/4] soc: rockchip: rk3588: add SYS_GRF SOC_CON6
 register offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rk3588-mclk-gate-grf-v3-3-980338eacd2c@superkali.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774002854; l=753;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=UQEiDKSJXeYPDA3RGeG+ndD97rbfufDLqHqwaCQMuJQ=;
 b=reSZXzfaoxAP4k38LsL5bDJzFTgYbqnd77dmCRG75jULCNmy4BUCYDALolqYXGWvOCeYmOafL
 PNAi7o1x/SZCJ0g6Wi1FwlK47jrQBuuYxeNCcA4T4UQHxH/7vzCCUQA
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

