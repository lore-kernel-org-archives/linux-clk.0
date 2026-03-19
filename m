Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98F3A0E84;
	Thu, 19 Mar 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905655; cv=none; b=egRK/YcPrOqngcTqbBwLn/4OqYRQ5G0kvcgoGpZ/TQ2kkGDvkxVwtZyn01Wmt8nOMkLcjt7hEqlxkeEZKlaRrg5CeItzfDftKhgA5TdV+ICPQ7S0l/Ys3h4jJ6wqIqsvGPYg/U/he/sirH/t37YARi6/AjFOby5LaQlpR5p2Fp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905655; c=relaxed/simple;
	bh=s/jc/s6Rzr1Mg/JbVnbKEPF1NVKRtlMfsACn6kbFdKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6lb6MSscMM9FuER6azF6I5zcLZ0cxAwXeajrwvrqqevAzelZ6tz/Rv97R0r5VBQ2MHOn4vfT7XUzcJE8qw3Q8JC0pI2lLKokxZPqw4ovOEwOJF8Kz90IyZV+PTXDc/yxRLyRyrogjakHjwBngGPu4YTD0LNdcC+d0aPBSryeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=fail smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=NYiXBJIE; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="NYiXBJIE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4r6wkkKWx0HfcJZH7gXeKF9oJ6zCw/C5ilURSEcdU7I=; b=NYiXBJIEH+T+2g8hYewFkM9BDA
	O8NdlkcreHW0y3YCQ5IrlXicy9+WNEMURIjspR8BhZUYHhPnUMFkvPhA0XMbsF12IR0cjQFaVt72/
	rGq3KvUGxISB+2xilHnmNrM89c8oLGzxYgEkvoEzBqNTFng81gEYfr1G6YMbG5+y92Vf7M1Hm7eOh
	VR/eMOTs6PN/rAbImC1MAnRHP4KHUPFV6XBrfTCoJ9vKkomrMAcTNAncyIjtFzYzqFIgmWx/vbu5v
	jr5zq6nXHlj1riLO6TnNdyd6nWKkQ6LSF3KIu7+Pf79HslyyNbuCnbTihjY8Fy5KlviERPcJJKFxa
	6o26tT5Q==;
Received: from [109.52.2.233] (port=10095 helo=mac.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w37tP-0000000DgEs-2phc;
	Thu, 19 Mar 2026 08:34:05 +0100
From: Daniele Briguglio <hello@superkali.me>
Date: Thu, 19 Mar 2026 08:33:59 +0100
Subject: [PATCH v2 1/3] dt-bindings: clock: rockchip,rk3588-cru: add I2S
 MCLK output to IO clock IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rk3588-mclk-gate-grf-v2-1-c4c8daab0762@superkali.me>
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
 Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773905640; l=975;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=s/jc/s6Rzr1Mg/JbVnbKEPF1NVKRtlMfsACn6kbFdKc=;
 b=1jo5TKoywLPX8VEd6ybg8rA7NdSpML9127iS51mq8dWB4mhGkrFI8KjxZTGl32BmLMwh//X8y
 +XL5WnEh++1DPdxfHGQ0DeMYWHqoEMOAKPrOu72abkvOuEQ2Vijmsev
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

Add clock identifiers for the four I2S MCLK output to IO gate clocks
on RK3588, needed by board DTS files where the codec requires MCLK
from the SoC on an external IO pin.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 0c7d3ca2d5bc..7528034cff56 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -734,6 +734,10 @@
 #define PCLK_AV1_PRE			719
 #define HCLK_SDIO_PRE			720
 #define PCLK_VO1GRF			721
+#define I2S0_8CH_MCLKOUT_TO_IO		722
+#define I2S1_8CH_MCLKOUT_TO_IO		723
+#define I2S2_2CH_MCLKOUT_TO_IO		724
+#define I2S3_2CH_MCLKOUT_TO_IO		725
 
 /* scmi-clocks indices */
 

-- 
2.53.0

