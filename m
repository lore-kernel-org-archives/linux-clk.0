Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154B31E838;
	Fri, 24 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018978; cv=none; b=RkktXat89sDozENiwQvsQdCkcWhlyOadq17zL5AM0cnR6UFq/EKtg0nqHBfsMHlKIJagulnQJ6lhO6DA63lG6vWfklgdbi5cx3a59wetINTP54d9Pbir2gXLQeEEW5fMgXHgtX3Iy5Aw0Kv2VKYVuU0oC01WlEJS0kU0UtnS/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018978; c=relaxed/simple;
	bh=kJ4wjwl55ARQtE+qPhJ2CtnALergFmy741Ozvwm9Cew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVh23IXubjrHNvyWNe2xgk5QpKMDY+O+/zt6EwSVED4IJ6fvMhzk6RT3qY/BTxYtJBpH8Ssr90zGmdf9D10BJ8MKKq3aGQc4PZ2gvw9qUn6JalxaafaoWW2WpCOLPnBAi9joYxV+GkssjJCKnNwsiGy3M7pkpBdSnzqdIxtbjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=EZjHEmVR; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="EZjHEmVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777018891;
	bh=c0kXRPXhs/2a2xxEUCnekU/nRCUJKDYsT3ezESBZvbw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EZjHEmVRIQ02mNlW/YfZJJTtbskflqsOfeJefdPTFUENXTjsYFhAEnbIaOAAxGZwy
	 qpWY6WD5e+IJ0m4PT7Qk17KBjOj+IFP48rpUl2PGesNp2TTFmCm9aujilJZQ/4p9Ey
	 GyTGB7WOIqjfGPrppDvZRPQeTm5m85H80sXde7a0=
X-QQ-mid: esmtpsz11t1777018889tb8c57d96
X-QQ-Originating-IP: 1xRj0+GO4eWRIKlf+UoqlaBZOM43aRU9Y8UB9yqq/i4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 16:21:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15045921169373201256
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 24 Apr 2026 16:20:32 +0800
Subject: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-k3-pdma-v3-4-efdf2e414a08@linux.spacemit.com>
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
In-Reply-To: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777018865; l=1109;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=kJ4wjwl55ARQtE+qPhJ2CtnALergFmy741Ozvwm9Cew=;
 b=4o7F5/m4mBEsMHsL78wUkhdn5hXCT/SyixWCFZENH2NT6HVmPXcx2GUB9MmxuR8Da/bRQAngt
 U7y2BaMAVerAC2n0K5IfvWKmb+gKQMLcUQ/2eexsoX2S+n+8q+9IVRp
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Now9Uv9+9hkyH9JrzReXUqyg+f2XVwASJAAUKxmLePXcSUcopUkkl+Cv
	ukDe8OTYUE5NHwd1Hch6YqsKnwGU+80u+re/ltoXDYxYesB1lQpqzaBjBWSfEacanPU5BRK
	LM32GzVQRsEPxIoEgV6mHnUXicnLKQ7NWoMgx6ckjoVEpLLpaA/ugZUFo7QVBb98glmZlCy
	DiXdxHCjmN1gduR46/SlxU2QKUOvkjaxpbEZBpFglgzH+Ek/2lb6jA81N25QKvwYp5BchMn
	LH9xqDmK/q466I0wvP6iqkgF3wX5Dxk0HSG0S2VMP0acQFbNOgALxEh67IBk1FLz6/V7j5i
	2FjdfZacomRc0iExnViiKu5qAdmRI6kGYxLBrCfwiD97qvm/cQJclbZ4iOX1ltRpQ/YDWdr
	pyi+XW4N2AYU1Hgs3T71PIvmHDP4J4QV+U68UMxrgLaCn+gxpDEPBajkgWvH/dLp7Ig5+ur
	nIPDo8rEaC7U3YL35Xv8CFrFSyvF+6KB9Qg6jseOhmZgoJThhptY4/+R9SrzoDyjIkNjEDS
	rck4lVlGniSMaR4VwxISLlcNNjNij6oECC3lMspegI5daqcaZQ8zELNiJM5vA2c42g7se3D
	PFikcSw/nDJh9OsB6l9HqAdpGMBl9UgSmRTSj3o3xjL+f3oQwhL8NtcjIbBg2jjBgflcMPh
	e4DKA1V03VIq8P+VkMuLdUnx1ki+FZm1nyvg3W/UFyEWPpevpr/IBQOTHO3yMYWOeP5mQt4
	5zFo/KiXSCav/+/F9OWh+SLeFwuBJY0qFlwHLjH4qZMMGBTECEfgy6rupaz2H0sqXz2THY0
	FvrTVY4uvJ4LwWlQU8w0djkmltjGOUV1vu51YgkM/HN4JJP1dPnvHj0dlErf3rO8vXI+fKA
	ZC6O2c/me+G7rJiEluopbeBQb8qDGsyk6ZJOF4Wnwx8oEAL+u/YiTntl276JcFDRfpt6hPG
	4ygU04cIhBBjCa7Lahsh9OHDbN0rgQY/eEkmKDS0Alw9UlSikYMGzNlSJpnnSv2irV4Xtn6
	RI/jP72AJEw7ByWVKbp8guHb/jtxHlFAGOC/2iFRVPPM9Gw8pFTgYMG0oF9y7fg2bAO4XGP
	Over77anPgOzLaJVCNXfyWteyCzdHz4oZgfqiLoGYSgylB0BznUM5gAMPht6BwA9Q==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
all memory-mapped bus transactions cease to function, causing DMA
engines to hang and general system instability.

Mark it CLK_IS_CRITICAL so the CCF never gates it during the
unused clock sweep.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..bb8b75bdbdb3 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -846,7 +846,7 @@ static const struct clk_parent_data top_parents[] = {
 	CCU_PARENT_HW(pll6_d3),
 };
 CCU_MUX_DIV_GATE_FC_DEFINE(top_dclk, top_parents, APMU_TOP_DCLK_CTRL, 5, 3,
-			   BIT(8), 2, 3, BIT(1), 0);
+			   BIT(8), 2, 3, BIT(1), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data ucie_parents[] = {
 	CCU_PARENT_HW(pll1_d8_307p2),

-- 
2.53.0

