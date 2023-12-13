Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lVadjpGy"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B6CF3;
	Wed, 13 Dec 2023 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493477;
	bh=fPmx8Nitfxko3MoZPVdVim4NzYjJ4HdO5wW6DU3UhDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lVadjpGyNrC5dLSC+9hb5vzptqPpZJLqkeSniTvnasQQN6c2heysVa6MFkXJlef4P
	 B6aL9TJ+kMzMpIAwApDoWOjgEHU+/tnUwUKfM3IQLVhT+qp5mux17qg/xHJWYMyark
	 15aPdKX+Pv5zp5++Ze3YCVv1Edap2N9onoaI0gvouctw07eGC56uPmGH50Oro7i5WX
	 NG1MGbZtI9kf/94gkW/PRpyi1w4PoOGCylu2F8SJrIuOwcAaHYurEQfX7qcRd6vrLS
	 +8pCFZtSxsPEdUatdRgdJyNZ3cjPxkHYX6kg8tyZL1mA0NglHWhIBPXEsWrNDfKIoM
	 hNglAvNvej+VQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3932437814A1;
	Wed, 13 Dec 2023 18:51:17 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3DF6A480108; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v7 6/7] clk: rockchip: rk3588: use linked clock ID for GATE_LINK
Date: Wed, 13 Dec 2023 19:46:51 +0100
Message-ID: <20231213185114.47565-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213185114.47565-1-sebastian.reichel@collabora.com>
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for properly supporting GATE_LINK switch the unused
linked clock argument from the clock's name to its ID. This allows
easy and fast lookup of the 'struct clk'.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 46 +++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 2e8bdd93c625..b30279a96dc8 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -29,7 +29,7 @@
  * power, but avoids leaking implementation details into DT or hanging the
  * system.
  */
-#define GATE_LINK(_id, cname, pname, linkname, f, o, b, gf) \
+#define GATE_LINK(_id, cname, pname, linkedclk, f, o, b, gf) \
 	GATE(_id, cname, pname, f, o, b, gf)
 #define RK3588_LINKED_CLK		CLK_IS_CRITICAL
 
@@ -2429,28 +2429,28 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE(ACLK_AV1, "aclk_av1", "aclk_av1_pre", 0,
 			RK3588_CLKGATE_CON(68), 2, GFLAGS),
 
-	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", "aclk_vi_root", 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
-	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", "hclk_vi_root", 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
-	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", "aclk_nvm_root", RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
-	GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", "aclk_vo1usb_top_root", 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
-	GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", "hclk_vo1usb_top_root", 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
-	GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpeg_decoder_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),
-	GATE_LINK(ACLK_VDPU_LOW_PRE, "aclk_vdpu_low_pre", "aclk_vdpu_low_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(44), 5, GFLAGS),
-	GATE_LINK(ACLK_RKVENC1_PRE, "aclk_rkvenc1_pre", "aclk_rkvenc1_root", "aclk_rkvenc0", 0, RK3588_CLKGATE_CON(48), 3, GFLAGS),
-	GATE_LINK(HCLK_RKVENC1_PRE, "hclk_rkvenc1_pre", "hclk_rkvenc1_root", "hclk_rkvenc0", 0, RK3588_CLKGATE_CON(48), 2, GFLAGS),
-	GATE_LINK(HCLK_RKVDEC0_PRE, "hclk_rkvdec0_pre", "hclk_rkvdec0_root", "hclk_vdpu_root", 0, RK3588_CLKGATE_CON(40), 5, GFLAGS),
-	GATE_LINK(ACLK_RKVDEC0_PRE, "aclk_rkvdec0_pre", "aclk_rkvdec0_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(40), 6, GFLAGS),
-	GATE_LINK(HCLK_RKVDEC1_PRE, "hclk_rkvdec1_pre", "hclk_rkvdec1_root", "hclk_vdpu_root", 0, RK3588_CLKGATE_CON(41), 4, GFLAGS),
-	GATE_LINK(ACLK_RKVDEC1_PRE, "aclk_rkvdec1_pre", "aclk_rkvdec1_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(41), 5, GFLAGS),
-	GATE_LINK(ACLK_HDCP0_PRE, "aclk_hdcp0_pre", "aclk_vo0_root", "aclk_vop_low_root", 0, RK3588_CLKGATE_CON(55), 9, GFLAGS),
-	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", "hclk_vop_root", RK3588_LINKED_CLK, RK3588_CLKGATE_CON(55), 5, GFLAGS),
-	GATE_LINK(ACLK_HDCP1_PRE, "aclk_hdcp1_pre", "aclk_hdcp1_root", "aclk_vo1usb_top_root", 0, RK3588_CLKGATE_CON(59), 6, GFLAGS),
-	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", "hclk_vo1usb_top_root", RK3588_LINKED_CLK, RK3588_CLKGATE_CON(59), 9, GFLAGS),
-	GATE_LINK(ACLK_AV1_PRE, "aclk_av1_pre", "aclk_av1_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(68), 1, GFLAGS),
-	GATE_LINK(PCLK_AV1_PRE, "pclk_av1_pre", "pclk_av1_root", "hclk_vdpu_root", 0, RK3588_CLKGATE_CON(68), 4, GFLAGS),
-	GATE_LINK(HCLK_SDIO_PRE, "hclk_sdio_pre", "hclk_sdio_root", "hclk_nvm", 0, RK3588_CLKGATE_CON(75), 1, GFLAGS),
-	GATE_LINK(PCLK_VO0GRF, "pclk_vo0grf", "pclk_vo0_root", "hclk_vo0", CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(55), 10, GFLAGS),
-	GATE_LINK(PCLK_VO1GRF, "pclk_vo1grf", "pclk_vo1_root", "hclk_vo1", CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(59), 12, GFLAGS),
+	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
+	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
+	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
+	GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
+	GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
+	GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpeg_decoder_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),
+	GATE_LINK(ACLK_VDPU_LOW_PRE, "aclk_vdpu_low_pre", "aclk_vdpu_low_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 5, GFLAGS),
+	GATE_LINK(ACLK_RKVENC1_PRE, "aclk_rkvenc1_pre", "aclk_rkvenc1_root", ACLK_RKVENC0, 0, RK3588_CLKGATE_CON(48), 3, GFLAGS),
+	GATE_LINK(HCLK_RKVENC1_PRE, "hclk_rkvenc1_pre", "hclk_rkvenc1_root", HCLK_RKVENC0, 0, RK3588_CLKGATE_CON(48), 2, GFLAGS),
+	GATE_LINK(HCLK_RKVDEC0_PRE, "hclk_rkvdec0_pre", "hclk_rkvdec0_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(40), 5, GFLAGS),
+	GATE_LINK(ACLK_RKVDEC0_PRE, "aclk_rkvdec0_pre", "aclk_rkvdec0_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(40), 6, GFLAGS),
+	GATE_LINK(HCLK_RKVDEC1_PRE, "hclk_rkvdec1_pre", "hclk_rkvdec1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 4, GFLAGS),
+	GATE_LINK(ACLK_RKVDEC1_PRE, "aclk_rkvdec1_pre", "aclk_rkvdec1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(41), 5, GFLAGS),
+	GATE_LINK(ACLK_HDCP0_PRE, "aclk_hdcp0_pre", "aclk_vo0_root", ACLK_VOP_LOW_ROOT, 0, RK3588_CLKGATE_CON(55), 9, GFLAGS),
+	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", HCLK_VOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(55), 5, GFLAGS),
+	GATE_LINK(ACLK_HDCP1_PRE, "aclk_hdcp1_pre", "aclk_hdcp1_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(59), 6, GFLAGS),
+	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", HCLK_VO1USB_TOP_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(59), 9, GFLAGS),
+	GATE_LINK(ACLK_AV1_PRE, "aclk_av1_pre", "aclk_av1_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 1, GFLAGS),
+	GATE_LINK(PCLK_AV1_PRE, "pclk_av1_pre", "pclk_av1_root", HCLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(68), 4, GFLAGS),
+	GATE_LINK(HCLK_SDIO_PRE, "hclk_sdio_pre", "hclk_sdio_root", HCLK_NVM, 0, RK3588_CLKGATE_CON(75), 1, GFLAGS),
+	GATE_LINK(PCLK_VO0GRF, "pclk_vo0grf", "pclk_vo0_root", HCLK_VO0, CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(55), 10, GFLAGS),
+	GATE_LINK(PCLK_VO1GRF, "pclk_vo1grf", "pclk_vo1_root", HCLK_VO1, CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(59), 12, GFLAGS),
 };
 
 static void __init rk3588_clk_init(struct device_node *np)
-- 
2.43.0

