Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704787;
	b=2iZRKxN6ODNwYHQrtS/dQVinw+A9uwETWkT8SGmghWTYQF9SAyrf4Elfj4+gjnz9oWWc
	 zkBSpR0HwWgC89Cr22EmeMz4Slzjxaj3qPC009b3JdjfBRoX7nj/1enQblolgxvkH1NTm
	 3iFhFM9bU6CY66MFHDhgr56yH12+VMFkKh5uU6FynIy5seFnQz3LMJR7YDQ3d5O73+YxE
	 oC89lorId6jfc32e9Z8qf3F6/CvzL7xwQ4NjdYjOkba7IV0cdlycJ6DinzME5Fc5dWvGo
	 09DONTQpSqLqchmO55hX9QrCKo65R4H60trpwKD+DXPfYR8pxjmPsvxbfhzyzTqeYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W6Tv6gg2RlXhQUM1tcxa1AIAU7ukm5wR66FQHXyYDHg=;
	b=b8P/U0fiwqdZKz0XIvfh/Oq3tDP/Bif9aDjUQHD+S3eheDuZpkAzqo72FcB6V8rxoZMw
	 pgI9V5e8fbsNEaOVUf93X3AQe+zr31oBC9FxZYEVBzmhQwpVy2EWWQLWfA5MTEgVGcUWh
	 3ISNrRI+AZBq3Z0zsBlIRzB3ZDAZCGW13YwEaHfavvbWFasQARQvhgYnts4wVXBcKEVGN
	 Dtm0iyrXTbft79hL/cPb8LSsI623IyQ6qoDeSJ8jq2FbhX6yP9wZgcDtLXr91IVO2+j8u
	 5RBp79faIEG5FBCJ7dbdl5wOvnDYLjMtJGtvhtKKGphQlVmpx8G846wiamF03s3W4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=iN87VZmS;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56C606A688;
	Thu, 26 Nov 2026 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A56C606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=iN87VZmS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=EGZQ5hw1OE7xV9Ltk+oXBVhBXm1P+5H4gIIoayzJU3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iN87VZmSD5C5XJU1a0MmKkg5vZuA3sOHhOxOjn40cjvVa/aB93QpQTZQDd4SIyLZ5
	 8KE/VJkbtVGxV66cCXUWRIiMIyalVummXvfuxF9dvCvLgtHUatbcPw4//2yH/HmRQh
	 5HlyVAaTjbZDJepSc0VJT931NHrKGQUELTBVrY9kARLWkJHAsgdn2EPPM0DtxpDs6X
	 nvQ1PJfxmAD3/dQSa9jCcNKQA9sn3SQjVSuX2Iz24eS7lWIcqF3s6VxNNfizgBJi8m
	 3XePlPoBMYzzpSDvLwE4hvYusbzcy6SYiOqmG1zAwDGwU+d8IKmwjVLo9hKAGavPR/
	 Ur2nr+vZXRhng==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A152E17E00C4;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 60AA148002B; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:36 +0100
Subject: [PATCH v3 1/6] dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH
 clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-1-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kl73j53q8IZijypx0BWfssWY6LoAy/tptcYcpgMl8Co=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9BglrZgxoQr6c65BCUnkeVfs6wFT5cKA
 eVu6cnnvIVorIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qagyIQAIaqNWBmj3m0y2I5nI5lwOdUpd4d5hVoAuN0jQGucPLzeV/PB8U2czKOVyoCn3nul3w
 o+JCqGbBnHusaS2n2gDLmhOT/NEATW1eqdjHzPOge56/0pmOTKw7UCqnejpnmmbM0NrGsJIJHcI
 IXnMDjOnO2sDfNbd5TSRzitoyjqmlVs/9IPKiyncJcDNxhQAMuCepS4JN6nb6MgdqS2Y+cLO+tJ
 qrvM8piwAFj7WHWjS5Av9yRcbGUTKEeaZYSKci5gp9JWeKaqMXPKFCO5tiRfigJlCCwSX2T/odx
 0aGZvOJE+9Zxn11INKHhc5VrEkUug9EY7nrwvAjOnWky6HHHLElnxcC+XZDhTABem2ftCyPkEJq
 xD3G1OXUdCa+YhFZtI4N5j1tND+XYDL04zKpovkuh65gVUdxai5IoCaY7jXr8KlC36BDs2J4dux
 vdwJTnFr/G8v7wpvKMSiutXdY1AfPHWjC9F2ML2mAchgs/Mf4Ki8E8Dof4FJw67iiE8VJstTNLz
 pN//JdtP5ar9JooIieiakSiWdBJJyqU84kJ7+ZI7AZnIRKb3i0d8loPJ4HjyQUBLrq/TRRSUSS9
 P+UTY3XiXKSSX5FGfvvlg/BLKyS5Mc04NH5Y48lyjvLBKaKordlTkQ9t7Ds1GLxdleLq1FYl0qh
 /iprSqUWVB3BJFZZw5jMu8A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On RK3588, each memory channel has its own DDR bandwidth monitor
silicon, and each instance of that has its own clock gate that drives
the monitor logic.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 7528034cff56..6ea25019ebb4 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -738,6 +738,10 @@
 #define I2S1_8CH_MCLKOUT_TO_IO		723
 #define I2S2_2CH_MCLKOUT_TO_IO		724
 #define I2S3_2CH_MCLKOUT_TO_IO		725
+#define PCLK_DDR_MON_CH0		726
+#define PCLK_DDR_MON_CH1		727
+#define PCLK_DDR_MON_CH2		728
+#define PCLK_DDR_MON_CH3		729
 
 /* scmi-clocks indices */
 

-- 
2.53.0

