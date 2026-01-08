Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D8F33A9DC;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852506; cv=none; b=V/i0+U+EJqXrdDKA+e1f1rPq8FV/g0/EYP9RaDsOUqB+1LeA/A/w4mFgGWnK0hUx8DHPS98og7rU2Y2AdXQbcE64hjY+4GfU740p9VX3rfIQZPLBwbF2vK3y/zACRtuMzJcylMPVmiwBDiFqomBaONkp7vPRmUaM7jE+mKQwTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852506; c=relaxed/simple;
	bh=X2LgKGxvc+yiUAPkHyPMwzAGhXvItiDTlNdNw6TQWqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrXrMwFHVkZIixYnGDpnZPMgpM4FU+GMD98oL/uX230Gs1c1eQ+poicQN+i4G/3MnH9MWsbaWwLdfIoEVano183bhSMMI5o0NPnMuOP0U/v6z2Dl4EsWuim+Ck9A2myi9QetsQ3N4bjL7Z/Y1wKQluyzDraCTfl1ImnOf+s4phE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfOD6BUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfOD6BUN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 268DDC2BCB8;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852506;
	bh=X2LgKGxvc+yiUAPkHyPMwzAGhXvItiDTlNdNw6TQWqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HfOD6BUNRY2AsXZSsaXbSpT0Y1rjKxypgvbHp4hH1mjb8aD2Ow3+NfNbVl8idpLD3
	 dSuYOKbEadbo0ukPcjjz3Imk5FPQdqfqWP2RMPqgCCIRzEBkwM4MYTmH1oLelPVVqg
	 WVSTm2clt5rp84JKvsAdjgWROGHugckAm/7C/4UrD3SHEiNa92VnQXJJcEbed85nwu
	 eq36v+o6PxcUUznMfxiem9wxVJcArQUjWyh/0HHIFjkcFg59MYW5ORliSHsm8RnrpS
	 5mCpZibUpb30L0jIS6HcPZTOte0ZBZNeoRoeJUgWlj/f8T/vVUUMlnvWmS97wK6jUP
	 4e6XBHkM9kC5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA79D148A5;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 08 Jan 2026 14:08:21 +0800
Subject: [PATCH v5 7/8] arm64: dts: amlogic: A5: Add PLL controller node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-a5-clk-v5-7-9a69fc1ef00a@amlogic.com>
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=1163;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=W8yE0gYMnw2TeYIsOkbQZ2yJTdvcybUThyiQBa5vAa4=;
 b=t/vFbrbKMOqOpCzd6cxF8C5mfXd4bTixDvCpsNGDNNux+2+UfsXTjHXOWPtPbccyI2RzeYQIJ
 wZCj1TeI2nSAIf4cjbjvDV04ShQxrNV3EB1nNhlaM6bZvvJiAUcIAZH
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add PLL controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index a6625508893d..70deeab220e0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+#include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
 
 / {
 	cpus {
@@ -187,4 +188,16 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clkc_pll: clock-controller@8000 {
+		compatible = "amlogic,a5-pll-clkc";
+		reg = <0x0 0x8000 0x0 0x1a4>;
+		#clock-cells = <1>;
+		clocks = <&xtal>,
+			 <&scmi_clk CLKID_FIXED_PLL_DCO>,
+			 <&scmi_clk CLKID_FIXED_PLL>;
+		clock-names = "xtal",
+			      "fix_dco",
+			      "fix";
+	};
 };

-- 
2.42.0


