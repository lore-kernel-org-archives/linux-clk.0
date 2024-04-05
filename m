Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88912F36B
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302735; cv=none; b=V+R4CxClwrz4Akh/ecj2oNh5MvtlbPYl7XszNrW7MTzXr5NQc4cPpRQW5WPkRHpTfR6sk+BoYFkGn0Mr9cspNosIDPPsV4RAXIlS/MuIWIcm2SFBTK5X91cfTCghmj9yrL+/pYWaxbg6ZS1EoRISbEV/820hiL4+CC1RxjbLkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302735; c=relaxed/simple;
	bh=Q1q0lpvEiRrF/DtOMIMMNcoHWUtaSlZl8xP7ty3msrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8zymP5542h89aju4/NHFHK4qg78y4o5mjiv3LE5tcusC6vIoKGEiUAD/gzkkDnjcy1S7IqIwxAh4ydYCW2EuS/3tzbKHFKKEZGu9rYc8m7IuefzBW6ggezRQCOx6ZOiY1NX0sEWOvGHeE0D/YF7D0uIv+Z1A9tfu5/5PdpRRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9n-0005mf-Ol; Fri, 05 Apr 2024 09:38:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9m-00AWpy-Tj; Fri, 05 Apr 2024 09:38:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9m-008vil-2i;
	Fri, 05 Apr 2024 09:38:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 05 Apr 2024 09:38:37 +0200
Subject: [PATCH 2/2] clk: rockchip: clk-rk3568.c: Add missing USB480M_PHY
 mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-clk-rk3568-usb480m-phy-mux-v1-2-6c89de20a6ff@pengutronix.de>
References: <20240405-clk-rk3568-usb480m-phy-mux-v1-0-6c89de20a6ff@pengutronix.de>
In-Reply-To: <20240405-clk-rk3568-usb480m-phy-mux-v1-0-6c89de20a6ff@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 David Jander <david@protonic.nl>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712302718; l=1727;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=44l464I+8ufBOnGWKzr+u7dDUBLxmqV+t43m4zLKDNo=;
 b=QJj+czEOvCKL7bvhelhLzfG22dqf0ZvsMg4FkodeTlWzPJILaF+9qW21J3tq+ELCWizF4eeGO
 6LIcKkcUsRwBpGKHJdvfqGnLJBM/Ba687zl43n2wT60h70+XcI8H4RE
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

From: David Jander <david@protonic.nl>

The USB480M clock can source from a MUX that selects the clock to come
from either of the USB-phy internal 480MHz PLLs. These clocks are
provided by the USB phy driver.

Signed-off-by: David Jander <david@protonic.nl>
Link: https://lore.kernel.org/r/20240404-clk-rockchip-rk3568-add-usb480m-phy-mux-v1-1-e8542afd58b9@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/rockchip/clk-rk3568.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 8cb21d10beca2..2d44bcaef046b 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -215,6 +215,7 @@ static const struct rockchip_cpuclk_reg_data rk3568_cpuclk_data = {
 
 PNAME(mux_pll_p)			= { "xin24m" };
 PNAME(mux_usb480m_p)			= { "xin24m", "usb480m_phy", "clk_rtc_32k" };
+PNAME(mux_usb480m_phy_p)		= { "clk_usbphy0_480m", "clk_usbphy1_480m"};
 PNAME(mux_armclk_p)			= { "apll", "gpll" };
 PNAME(clk_i2s0_8ch_tx_p)		= { "clk_i2s0_8ch_tx_src", "clk_i2s0_8ch_tx_frac", "i2s0_mclkin", "xin_osc0_half" };
 PNAME(clk_i2s0_8ch_rx_p)		= { "clk_i2s0_8ch_rx_src", "clk_i2s0_8ch_rx_frac", "i2s0_mclkin", "xin_osc0_half" };
@@ -485,6 +486,9 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
 	MUX(USB480M, "usb480m", mux_usb480m_p, CLK_SET_RATE_PARENT,
 			RK3568_MODE_CON0, 14, 2, MFLAGS),
 
+	MUX(USB480M_PHY, "usb480m_phy", mux_usb480m_phy_p, CLK_SET_RATE_PARENT,
+			RK3568_MISC_CON2, 15, 1, MFLAGS),
+
 	/* PD_CORE */
 	COMPOSITE(0, "sclk_core_src", apll_gpll_npll_p, CLK_IGNORE_UNUSED,
 			RK3568_CLKSEL_CON(2), 8, 2, MFLAGS, 0, 4, DFLAGS | CLK_DIVIDER_READ_ONLY,

-- 
2.39.2

