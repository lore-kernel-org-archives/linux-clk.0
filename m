Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427952;
	b=h3ZAuJndgslFBH3zb/pXYmJO0plIymiFD/oYEmRM3csKtP6wPm8fvqd9fxACqT+SapxX
	 7pyuxmgkz73Ir+EgkrnH9lXL3+ogqTjK4T8wacA66mUs6Usra5KFVTAbOOYY4lnl3hAEW
	 Hmr4aJdglgGRnFoVuKR89Nfht8vhonNJAui8WCSnkJZrRh9mNtispOZH3mHiMloydVXec
	 Xcfma+grlClyvYhcAbDSNBrSlmOwlwJesXnE4AwFN30QKGh/9hABl2vKG2ShhCaFB+v3F
	 AEapgZE6HhLdn0VzJxrGmqLd7vJrH+dw650wNoEouTZTJEA6Y2cF/gmBClVEVSrysHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427952;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=zSZ/MpBtD/kNl9aZH6KuQ47KMysciB4nys9MW6FEKPA=;
	b=kjq12MbVhSQHUa1QlufxQXhB3wXpUEJwSbltIP52PH/OKjwVi+51TShYN09DBTP7Rfj2
	 PbQYhG6+eYjtvyW0Vp2L3/1aK5y1LS2k0I3hJFGdV+LdjqZ2SVXXlPKE+bx2pd+jv9575
	 s3OnMsY/8sWir3qTj7N0OmGEfymFgqtY2htgd/I9na/5BLj69lMTQtiCApQgTwxwGcE6d
	 qX+tEtQhzjc3qm6g+3SQCBMXLnJ8pV2nyRcb7MHXzKSJJTVcKwG1IxbXDxniGgPOSihRk
	 aPaTPr3diMIgMoYelcXcKc6pDnlhddmJq4iPsCBddUvz3mFnOsD7P8OhcX9kLnRwy8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpoTyrvc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE4606A32D;
	Mon, 23 Nov 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpoTyrvc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795427951;
	b=Nd41ScdLS1z+hrReyTTQJOGplD+DpkvJ+AmV9ZcUmHDJBSnm4o5WOTllKnGUjeOa9bb7
	 dLkf4km28rt4WwMjfC+Mf6UX/ZhFcLSL2eTpgDJjp/o1Y9i6MFECuAaq5DSr20VzYz68z
	 0+lVp5/fOSLo242G32k6yh5Wfgwze3nppIcWlQqknlvmISuNQtMJaxQ9dZWpzv2BhEn8m
	 kxsJQ+i+3SznMNWc9ROt0lcNAitZakViPTwzgo9kqyVT1GfLhMndRdTJdA+IJP1yzVwsw
	 iwGh7kzuLHsF100DcwFMG4GjPFZ+m6Vyj4OsihOyUVL7mzQsYskcZOYVE1Qd7kBdi6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427951;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zSZ/MpBtD/kNl9aZH6KuQ47KMysciB4nys9MW6FEKPA=;
	b=iYt2UOazfc4tTtc+jG1gUKDXh3nKSs+CXAaALfbL0a98HU8OTC3tC9LpF9pxwSpNciud
	 s0BcPyVEUj4N8VqR7aT9OOuOjVGkWSdVPIqTWPP9nq1k9UeU0kqYVQ+qgWYOkcMKRHlnH
	 rB385z+q1Bb/fsWcBPrFBtsddEmKw3zhT+4hFsDz4IZ3IDix3UFVy/9yDrrwVrv354nAi
	 4ZOTYGLfutktrLUKQEGAjOuTgewy9ZtkaCjBRzj052v2U9gBUO5lwLf9xTGP6WTSX8EZ/
	 xvcidAIPVxwk6HW2rj04EiPQND2srGGmRgROutDyAZbeLxXMAPd6tqNepMCIg5oXIDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 688AD1F000D8;
	Mon, 23 Nov 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427951;
	bh=zSZ/MpBtD/kNl9aZH6KuQ47KMysciB4nys9MW6FEKPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FpoTyrvcJ2mmv9JWcE4/aqUu1Z1mYdc6Quq2I9xzx0mkpSoJM2ISWsl7sOVwbvGiz
	 5g09kmUeEgN3nbggO6u6HYg5SFyWorY8LeYi7Pr9J+VoQh9+GFengNSYOrKniGUQT8
	 YRgi+GNOeeQe8kUfvEF/570ITcMgXT2ovw6RSLS+nv6if4XQwOK/w5RTRAHSrXFXUn
	 P6Lq/atkMK9hQXGuGVc2nQO+3sxnIE2scYoW9vZKUkVl/E2SjgM73vwSX/i4NqpswN
	 0n4ewywLT40UHbKKsZQqK6P9m7p6fixvEXXadO08o8lWD81nDxz1YytoTTTcSQRzNK
	 eIX5bXtIkLTBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EA3464C403;
	Mon, 23 Nov 2026 09:59:02 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 23 Nov 2026 17:59:02 +0800
Subject: [PATCH v7 3/5] clk: rockchip: Add composite clock macro with mux
 table
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
Message-Id: <20261123-add-board-ok3572-c-clk-v7-3-16f6860191a9@qq.com>
References: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
In-Reply-To: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Cunhao Lu <1579567540@qq.com>, Jonas Karlman <jonas@kwiboo.se>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795427940; l=1536;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=yxo50L8CzB/1StZYdCwymW+hb91fAweyci4aIptKK2w=;
 b=xKVsyK3stWTQJ5YUnAtv+eo3p/FuwhHqJpQTx3tQ6R/GaEsslVWYVhbx1/pdgexVS+P5BqRRC
 xawwrwMcu6KDonOVmtCoUBpOpoCTbbURT8dyfF8V81gpJIzAGuoUsLE
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com

From: Elaine Zhang <zhangqing@rock-chips.com>

Some Rockchip composite clocks use mux selector values that do not
match the order of their parent clocks.

Add COMPOSITE_MUXTBL to describe the parent-to-selector mapping along
with the divider and gate. The RK3572 audio clocks use this layout.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v4:
- Split this helper out of the RK3572 driver patch.
---
 drivers/clk/rockchip/clk.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 063e3d567a2f..d84e42533266 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -871,6 +871,28 @@ struct rockchip_clk_branch {
 		.gate_flags	= gf,				\
 	}
 
+#define COMPOSITE_MUXTBL(_id, cname, pnames, f, mo, ms, mw, mf,	\
+			 mt, ds, dw, df, go, gs, gf)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_composite,		\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.muxdiv_offset	= mo,				\
+		.mux_shift	= ms,				\
+		.mux_width	= mw,				\
+		.mux_flags	= mf,				\
+		.mux_table	= mt,				\
+		.div_shift	= ds,				\
+		.div_width	= dw,				\
+		.div_flags	= df,				\
+		.gate_offset	= go,				\
+		.gate_shift	= gs,				\
+		.gate_flags	= gf,				\
+	}
+
 #define COMPOSITE_DIV_OFFSET(_id, cname, pnames, f, mo, ms, mw,	\
 			     mf, do, ds, dw, df, go, gs, gf)	\
 	{							\

-- 
2.34.1


