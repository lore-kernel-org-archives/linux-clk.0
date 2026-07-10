Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662844999A;
	Fri, 10 Jul 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673908; cv=none; b=niFhtkDhffgV9NPnygSMcMkRYyPmehXBArOvqfrTQcw7aJmyc77wsiEx6ORaT8kfjZwLu6OxHX5JouRCkvg9uP2txh0Cf9stAoo5yPF+mq8lIqvCoVUWKuOjqr0cuSybO7L/EjVX/jEm0J7zgMO7zQU5JTMXC96UFwlCL4YzRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673908; c=relaxed/simple;
	bh=eLAgAANN0P69+E8Skm+XXXXG6bVfOHOixZkNGzGfrKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBDuRzB0MEfFeDLXHnMrh1YH6ZCiFLp4381+S90Bw4ASBTTGRlWz8urB/0RmsISZhSP8M8mEJsFhxn78bX+nJA8DY2DEdeR+Ab4NtKCPGy6x3tYOfRlQay68kslOTZZgSsZXgF3yBIEwIZNz0648X5Sf4dPRmF+1aO8aDp8uWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CnU5jstr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TNTWjDVF; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CnU5jstr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TNTWjDVF"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gxQjC1rStz8v2j;
	Fri, 10 Jul 2026 10:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783673903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4/HdArdtBTOLZopTsp6zg00kQq5JIv25vlS+uIDaqh4=;
	b=CnU5jstrID6mTzlFWMsnOvnvRtP4dTcnLqqLJ2sh2YH/4l4XxPyHVrdHrLtv2gxjFx3CxA
	SbB38wX+zvPPNfR/RqFHA2y4F7Mg2+5mcMD0PGZcXMAcGtI5GlmLv1xkAndotWxqCM8lWx
	8WgAtcXijMpEizB8vNfol4LPDSii8k6fkO4W/eEP4jm6nw4vWbwnQ/aDt9dUG6ll8Fttfk
	RWhj47C0E6cB4XNjJnfIQHxfzah64XnyE/XmRlDrRi2LebxusVkXnStRjCth55VJB5eAC6
	qbW6YsJMoJ7k4LyJKoTCkXeOtG7svUiHOP9NDorlwFPqx/kL6vi8+LKFAzCsYQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TNTWjDVF;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783673902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4/HdArdtBTOLZopTsp6zg00kQq5JIv25vlS+uIDaqh4=;
	b=TNTWjDVFy+Zf/Ca9CaO/FkJR7riFNOpdpOtGlc5oz5YVLCNv4JSMzwNS7/6yOedcoPMgKF
	IQLXcLVG/fy+0kNJv8ZM1WP3Od5U7/Kvey61UeWN2Nd9N3NbVzwJtRtfbgwgZtGGPo0pOb
	PSsXrepTlUWHBsEu/xqEZHhEtxmUxuUgxcpM5YSXhVgmT9PJuf8GUo875bP8Vis3vfwPuy
	YVyHzxrALf2LsGk8h0s5qQpjGsC0PTE026t/x2j4hBPP6U0ZITmEz1J9mdYz7cBbpFFwh0
	860+P1mI8+U2tcfJNMAWRrAkqj4IpZIpCryMqTyyY8NGNIeAco8Cr1eXb5eSWg==
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Date: Fri, 10 Jul 2026 10:57:44 +0200
Message-ID: <20260710085744.430340-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9177eea2e3f8d0512d0
X-MBO-RS-META: mxshgzspygbute4md3haj5rceje5cm64
X-Rspamd-Queue-Id: 4gxQjC1rStz8v2j

Add ')' and fix sentence structure.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -13,8 +13,8 @@ description: |
   If you connect an external clock to the USB_EXTAL pin only, you should set
   the clock rate to "usb_extal" node only.
   If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
-  is not needed because this is default setting. (Of course, you can set the
-  clock rates to both "usb_extal" and "usb_xtal" nodes.
+  is not needed because this is default setting (Of course, you can set the
+  clock rates to both "usb_extal" and "usb_xtal" nodes).
 
   Case 1: An external clock connects to R-Car SoC
     +----------+   +--- R-Car ---------------------+
-- 
2.54.0

