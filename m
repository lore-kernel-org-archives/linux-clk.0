Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704787;
	b=0Afdq0hix5w4OAYu2OREzwJJwUvuOQOd8mPrgBRmdLQ7y0lbbqfIIiQ1HNLhqwjh2/uD
	 xZrqTrN0+clufwBQJB04t/dtyUSTbkb5eIGuOusGuahVG3JWRzRJQ5mMzLiqVFUqGWPag
	 JYoxiPhPjU2NC4jDgqNP2xR2lbJU69xaSp5GHg9ketG7VX4cJshhOp9AwNbaEDIUOSuc8
	 Hxpu9s+mnxdvLrbfTFdi6eICqrpfZ0ah0Z5jVIVsPEXVEEEVvB/yDYGFR2nj55HvuMs3h
	 9NpQ3S37JV5CLkIu5DylLGKPHCWnmJtw23yTadefzFZFsIiieaMFQ8H9Bc5orQrVQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sPahzrcvT3RZFJ8PseMpGem8/LBfIlO+73qMBgTYdqo=;
	b=QHzJOXW5YMtiK2RAnCCb+XfyxvjrrM4Hn3nGpFuU25UjbS+kEYhbVeaZmEBuXsH1sY3O
	 60SR+U0aJg8hyI0GzvBtV2BwZqP22AtpHgMUcMIGDvneI1eT2G0eRIGt8x8LbdERO13Ly
	 3FEj3QHEv0hs1I0um4+XZZVIZi7ahYdvG+0qvOpia9QqKjK4szq0ZrmzPKdaPaJjmG7gG
	 wfDOfw+ELNgXXqahlR28lCwZPBjvpaWBNxVNpncLQoYYlPsSTUgYERTDqk0jBmrUvR9Kn
	 SmEdlKpBlJzIYEieIclVAFdzkX7DJ3FiqhtpqbHF4AH+K3u2mehjJ0alOxWr+cAtGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YSxwHOVA;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A522606A33C;
	Thu, 26 Nov 2026 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A522606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YSxwHOVA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=P+04Z1MX3zoNRz5DSJxgK1log1B1KePm97Us5+d/6J8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YSxwHOVAARaqm+emsVcEV7p/Lb8Pg4ucF+SuCFYL0OpuJLPyRmkxq/uCVsrXwa9YK
	 HQj3RICR1vgemSPp8Izz02BzkENLbBideQrrIqjrEBwSx7f7IVp5JvVFriuuQ+eqNE
	 kAR9/hzw44O0Gn4/JefQ5qrNwok0kRskJ/x9+nvkF+UjWpJbXAw5jtbnio9PtqW+V9
	 Vx2JP3wlhB+qDbpBiDxhgTlUA19RYxmeXvTRLjsilLF/J26l1SyG6KwNUpFmOBFK5p
	 2hUO/ZBOwp6HpLT7tj7ALSD41Smr7VxsCSwBgPVO+KyooubVjDCKZQ79md0+I7j/8S
	 BzQjFghsoEe+g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3DB017E07B5;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 61A9A480030; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:37 +0100
Subject: [PATCH v3 2/6] dt-bindings: clock: rk3576: add more DFI clocks
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
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-2-0f33c1b8df48@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UfwNA4f0pWBVqpKkpibVMUgMqkfCfa2mC1buwCjD6uw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9B3WOcP1GduoK97tw5PPWHVXhsahY3En
 1led8hJyUCuyokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaZBwQAILu2HobZ0WzFan/BMl502xHBwxP+3ze+9PGL9e9sxbJXC0TEYOMTeMPn10qKb+M7YR
 h4FkUSFrz35w36JLDwezHM2Zp6c9PKYmw9ozstD3dch4iPgQb0nZZWtc2Kgj+f+RkDsW4HEaZgN
 MEZe/qCZKJQpAdMROWbqRuLP+Tc8rmc5CslovNygWKqw8muEdWnC5rN4+VwZpJMjfqKgJXAb0f3
 to9RSXQd/ThKUsrS0SzFoRBiBX5SOAUouC+J+wj45q5kgXiaLmTX42XpYb82mA1S4uGFov/z+nS
 w6iTki7gtzKjoOZyRaNmJ0tMtCdq787XpYrWk6Rf7p29oIfIcim8WquSyr5H1MBWRGRYbkWegR+
 x7+wTAqyQ8eSDaP9OAC5nKVyEolZqll0C+69633MmK8tMOy0zTEZHgva0VPfn6sbfjI/pJeZk2E
 k5keYyY2UT5Dcf+iHKLXQJ9wsdKo6oViIapHGMwuuQwvWfZOwI5lxJ1QiXdP8DVv8JwMQA6Il8r
 Apseu/CLDua8NivoWX5krHcV7Mqi/reesym4fczPr2EY+gyV30KbJQwNLjyeADHvy6k1xY1zYB4
 OkT58o4SoelU9jD7hyM6Nh/HplPpSRCpXSr+CjrfuY1fSGdhfVCv3sVGojHigLeVrd/Pw5c/j5w
 w8LKQz67E5ddp5YM5Ezg1Rg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

When the RK3576 CRU DT binding got upstreamed, some DFI clocks
were missed. Add identifiers for them.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index ded5ce42e62a..c5b74f2d8926 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -604,4 +604,10 @@
 #define CLK_FSPI0_TO_IO			576
 #define CLK_FSPI1_TO_IO			577
 
+/* Clocks that were missed initially */
+#define PCLK_DDR_MON_CH1		578
+#define TMCLK_DDR_MON_CH1		579
+#define CLK_DFI_CH0			580
+#define CLK_DFI_CH1			581
+
 #endif

-- 
2.53.0

