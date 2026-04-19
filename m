Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68733EAE4;
	Sun, 19 Apr 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776600012; cv=none; b=aYFDFli11alvsO6YVzaGCynmpdLrx6PNuESV2JYMHGjEK+jLu2AHxZ1aONyAagkvGa89/NH8LPkkfiVvC3V7ZP/4S/HiTMLGEJbq64NzZR7UFImQQcFM/W2sRP+1t2Kr5ESeabMluXOFek3NVznIE9Py51fCekjupyg3tFKcmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776600012; c=relaxed/simple;
	bh=s/jc/s6Rzr1Mg/JbVnbKEPF1NVKRtlMfsACn6kbFdKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GONHiTNpqZHSquADeCVvWHahVC0ukv8NGPQsNpFR3NNVl+gbMgWGvlcvH8oQ3W9WtxnvW9HR7VijRxPdYRnWSlQlEFgMnRQOu45BFpFN08z+Cl1/9AtxVfkxiyR1tGoqZV6DhAYZ6RwQxfaSq8EIccRPyUKDqDT3+JOPQCQDZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=iVSs40kM; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="iVSs40kM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4r6wkkKWx0HfcJZH7gXeKF9oJ6zCw/C5ilURSEcdU7I=; b=iVSs40kMSXExWxcYbEJbIbjbDf
	ECnVYZWEBKwfGf0YIINpQ162mgyPLpr28/iFUwwUxAnXTGbfdENdTKw75J/fhYIDDLR0XBd2OMxNx
	swfnoyMhOpOsDvHDhQPi0+c4zkTMpdJVUdY/GgzzYamn63axl1nQbtm368NqB91iINv7f4FT5wgDP
	KNx5TJZXxKhCWb+GE/0O262KZQcJix4nTJX1A44NST7+eEFtxJZGfs/fu1b7X/3BXX1tPyy6ExF+Q
	a4/IkefBTkZ6tBfNMOdTmcj1WKEnlSbw6IgQI8kMqP+SvKTW0VVf4ZP02q2grZOqEXR1NBoiOXj1S
	sUMS1V/A==;
Received: from [2a0d:52c0:500f:0:89e7:36b:a29f:1abe] (port=50188 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1wEQYa-00000000aDt-0lKr;
	Sun, 19 Apr 2026 13:43:19 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Sun, 19 Apr 2026 13:43:06 +0200
Subject: [PATCH v4 1/5] dt-bindings: clock: rockchip,rk3588-cru: add I2S
 MCLK output to IO clock IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-rk3588-mclk-gate-grf-v4-1-513a42dd1dcc@superkali.me>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
In-Reply-To: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776598989; l=975;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=s/jc/s6Rzr1Mg/JbVnbKEPF1NVKRtlMfsACn6kbFdKc=;
 b=jw66JKq81FohyP0tMKSSjcJsOwW+DXQwziYnEDIpT+1Q2qulTJ8m59TDX2Zh03coMQCR6OY8R
 0EvaB9eLU0EAHNvi77q+yT+5gWokt5HSY562mq/tLJW43Nq2cFjkdel
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

