Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949258;
	b=ac7zyGfLPRKbFGCwb6ruQvguqiCXf62+I8AQEo5m2DZtRmkdO1KGqyZN1sQ72VQHc4dk
	 awGWMspibzb7IBF4OoZM+KfyUHhbUB2/s7T+Ba9rIkqI/vRfDLEKUD1NTWJpnW27qX9gx
	 Qat4vSE+xGOK3740xY08a1PONlEyS2lfFuE3TIZxKYiDpI0wuINQ57rdaQwubXe/rP9BC
	 vC2OAlGxRkqfW6seyGAppsMHBTW3rkJwhHRFp4/PtK35ON0RBzIsWG7mcQ0GmpNxwgE2G
	 MSDeCvNJjf2NV6+oXL1kXN0vh0Wq9WZuuTaYFyEbdL049Fm3vmWtB+YQNbfvOVKcMsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949258;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kzHAg5Xh51fP70+LSsatQn4NLaZ7XSs7gxDHYO+Tamc=;
	b=ZrFdKAyfeKXW1Xw1J155fPE8a0wcvFdimS46lvXnebkt5OiAvLQauSCacNsKNgxZPoHj
	 0vHT7c/ZNwfQ0bi4+HHDFWEEMIVPB+INWMIle3HKTOgd/wIZQYYOk5QSz8JdWAnPaMOZ5
	 N3sIIhRqvaArh0+tpBi/GLPFWF50sacU5rvnhc5IB3l4/S1RhOejBl7GFi6+9V7xnz9Gj
	 G1xtWAr8YOJfG1Rpp+lbHe2q64sMs9436aUnWqzyKsHAu1CfqjWVroRGaXiTudDZsojJY
	 Jo73/XyIcMMcDWXxJQRLqc4Txd7u0Og49+vNiXfj935WxbE/agEqs+WtrrCtLxDLx7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b="Svf/8GAU";
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA61606A32A;
	Tue, 17 Nov 2026 21:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA61606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Svf/8GAU
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 08F3920D5578;
	Tue, 17 Nov 2026 22:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id DBDFD20D531A;
	Tue, 17 Nov 2026 22:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr DBDFD20D531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949256;
	bh=kzHAg5Xh51fP70+LSsatQn4NLaZ7XSs7gxDHYO+Tamc=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Svf/8GAUvon8ObnHU8kOk8plxxqSCi9mPASh6f0DrVCsJjhiLGHBQ7T3aQtb8uloj
	 polYikkuRbtA1s3T+9iBxISHacSmLuPZIXPVasTd+XlYRbnrbLho6gL8jUgKeoFOBf
	 a1ofuF+Ewy0Iq7EhEqOFRqRWqOxmrjO+Hgk6Pb++XpRXLd2m0ZGAqjF3fLg83JgNV9
	 Kw/mg8jOyq/LLGzj3uoPwjjwXS6/MdgstwQBvnA8Rb3kOq5nUyhphh/+7JZdxMm+8Q
	 5P2k4G6O/YGXAsXv1/ZB6jMkCJfAK6U2I2u3nt8tLTmBFrQ9nqq/eSFtRrfhPoMyas
	 84gvgGS808U4g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id JqeTOOPlcujr; Tue, 17 Nov 2026 22:00:56 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id B84B420D5578;
	Tue, 17 Nov 2026 22:00:55 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 3/6] clk: spacemit: k1: Add RCPU2 PWM clocks
Date: Tue, 17 Nov 2026 21:59:48 +0100
Message-ID: <20261117205951.140146-4-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The ten RCPU2 PWMs each have a mux/divider/gate clock in the RCPU2
system controller, fed by pll1_aud_24p5 or pll1_aud_245p7. Register
layout from the vendor kernel.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 drivers/clk/spacemit/ccu-k1.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
index 364388ff8..25be335eb 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -705,6 +705,33 @@ CCU_GATE_DEFINE(emac1_ptp_clk, CCU_PARENT_HW(pll2_d6=
), APMU_EMAC1_CLK_RES_CTRL,
 CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk), APMU_PMUA_EM_CLK=
_RES_CTRL, BIT(3), 0);
 /* APMU clocks end */
=20
+/* RCPU2 clocks start */
+static const struct clk_parent_data rcpu2_pwm_parents[] =3D {
+	CCU_PARENT_HW(pll1_aud_24p5),
+	CCU_PARENT_HW(pll1_aud_245p7),
+};
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm0_clk, rcpu2_pwm_parents, RCPU2_PWM0_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm1_clk, rcpu2_pwm_parents, RCPU2_PWM1_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm2_clk, rcpu2_pwm_parents, RCPU2_PWM2_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm3_clk, rcpu2_pwm_parents, RCPU2_PWM3_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm4_clk, rcpu2_pwm_parents, RCPU2_PWM4_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm5_clk, rcpu2_pwm_parents, RCPU2_PWM5_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm6_clk, rcpu2_pwm_parents, RCPU2_PWM6_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm7_clk, rcpu2_pwm_parents, RCPU2_PWM7_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm8_clk, rcpu2_pwm_parents, RCPU2_PWM8_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+CCU_MUX_DIV_GATE_DEFINE(rcpu2_pwm9_clk, rcpu2_pwm_parents, RCPU2_PWM9_CL=
K_RST, 8, 11, 4, 2,
+			BIT(1), 0);
+/* RCPU2 clocks end */
+
 static struct clk_hw *k1_ccu_pll_hws[] =3D {
 	[CLK_PLL1]		=3D &pll1.common.hw,
 	[CLK_PLL2]		=3D &pll2.common.hw,
@@ -981,8 +1008,23 @@ static const struct spacemit_ccu_data k1_ccu_rcpu_d=
ata =3D {
 	.reset_name	=3D "k1-rcpu-reset",
 };
=20
+static struct clk_hw *k1_ccu_rcpu2_hws[] =3D {
+	[CLK_RCPU2_PWM0]	=3D &rcpu2_pwm0_clk.common.hw,
+	[CLK_RCPU2_PWM1]	=3D &rcpu2_pwm1_clk.common.hw,
+	[CLK_RCPU2_PWM2]	=3D &rcpu2_pwm2_clk.common.hw,
+	[CLK_RCPU2_PWM3]	=3D &rcpu2_pwm3_clk.common.hw,
+	[CLK_RCPU2_PWM4]	=3D &rcpu2_pwm4_clk.common.hw,
+	[CLK_RCPU2_PWM5]	=3D &rcpu2_pwm5_clk.common.hw,
+	[CLK_RCPU2_PWM6]	=3D &rcpu2_pwm6_clk.common.hw,
+	[CLK_RCPU2_PWM7]	=3D &rcpu2_pwm7_clk.common.hw,
+	[CLK_RCPU2_PWM8]	=3D &rcpu2_pwm8_clk.common.hw,
+	[CLK_RCPU2_PWM9]	=3D &rcpu2_pwm9_clk.common.hw,
+};
+
 static const struct spacemit_ccu_data k1_ccu_rcpu2_data =3D {
 	.reset_name	=3D "k1-rcpu2-reset",
+	.hws		=3D k1_ccu_rcpu2_hws,
+	.num		=3D ARRAY_SIZE(k1_ccu_rcpu2_hws),
 };
=20
 static const struct spacemit_ccu_data k1_ccu_apbc2_data =3D {
--=20
2.47.3

