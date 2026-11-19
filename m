Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111100;
	b=c0t58IwwbRvTE9j2VAEel/WPZaQH+2Q0mHwPj3uBB1p0KiXOqiCGA0YcavXoKELbvwMr
	 7dRA0UzPgeDiFdw2q9Gib377YK7+19mjlgxuxrEgpUoFCLdsazc9ByaVh+0hqzFknzuT/
	 MTVThwmvgJsLCv3CYm+QVkhXWFeN13KO0S/rDZdH0vxFkU3R/Ijbr77rWSby8DGjK8egs
	 QVNWi6uzVpSWCGk/OW5wSfgEvTgzeQvZXMQ6LpXQzA0r9WIs94g/UWRtPIBjtg+BWdn6C
	 reZarsn99f49YB9aATigj6kajhn+EEkDPwqt+Wldnseuv4z3kgkpVjIcpN/f26Rgygw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111100;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H6hyuPg8ykMc8FcnbD1I4+hAc7d+aTTA0QfNmAS+Xmk=;
	b=k78ecXQUWOzbXzORgCr6U19Mb1/QNlRMkm8JnGO7OPye7RpE3krM26+kchWMoe89I3fR
	 TM2rUwRiaXxMO9NaSVP+CoMWrtVrJ5zzGHjR8uqSOniQA/TNA/iqkyKHtVYV2hFBi0CyO
	 0pM+kSEqN3+FfdlC70eNbtAz691hfmDmbMBlKktGQJSQVLkB4hU1k6Ma0ibk5sYu7fIIn
	 h/xGUkjQ7octwzHkLPROsWFLdLzHWsXa8Gk1CxW3q+apyhI0L27fK7h7E3KRULRUPOxnJ
	 y7tRUtdr27NTe1b1YM1SP+z+9iZy6Qluh3s1joqJ07Ya0VmL97OH5iCJ1TTapyLypSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b8Ba/uMa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913B60A261F;
	Thu, 19 Nov 2026 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8Ba/uMa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111100;
	b=PiFhjNWJYH+swKxG4Mx69h4A3QTamJ7Kt66T6/+zyaXI8X8Ir0i7ewpJYY42CmlTk/yA
	 4JCVjh0J+jF531KrZoiIEvBOJJei1cGQ7hcSvCOAQtdbeUXOTs7qf9OGu2gAXlXYVZv/w
	 2weURin/LPvgXdnjh3PfaL1JdKrUr+SCefmqeQ+3dCX+UEhpCOiCwsOBzujkvo5itRP8d
	 C2dFCsSkju5H5Yb427sTdPWcyxwObUJtAjKhF4VrrZPIwFjpGhntabqbir/HJmcbwGT5s
	 30g1UgZk08z/6dZPcQGFhx3XYhco9q7K4Pmz2dOYecf5852ZIWom0OBlPUbmBCLd5rA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111100;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=H6hyuPg8ykMc8FcnbD1I4+hAc7d+aTTA0QfNmAS+Xmk=;
	b=o6igUfzURX9PtBfFUtyj3cQsV8cg8LqYObbL7rMUwTr7mj8CMG9ZHyqigmGrVm/ZYVnp
	 cPfWU8k/K1f9CSOaiMirH8qv6TFkrZrRI3HOEhPf2kSwtuhIB2JnRj6qwHadn4Wvg5FOS
	 e49rLcNRMx0QNNw7LJKczsmW1apQ5Cb6Nw2aG/r1dzkhL2QBDmLt6vNFWx/fvyNzOAjwK
	 gqpFetEVSEELJTKMpw61lbRgm2EEx5bGYoZcB6deWCWyxvRJYyJtKnK0RF82aeU5oMCNc
	 sfPSFnUVDhjJMut/EVUCT9YLxrDxcNdbhhcEwEdc5R96eMx2M8lYtL3RWauLh2nzcpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C76771F000CE;
	Thu, 19 Nov 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111100;
	bh=H6hyuPg8ykMc8FcnbD1I4+hAc7d+aTTA0QfNmAS+Xmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b8Ba/uMapBv0DrtWJneVRi6y1T2bMofhSMP5bcsJd7XB6hCbUPKmb5yNjMTSNeYhn
	 r3t3heJ0tD3a6IPCWewaGUYqPNvhl7NCB9tsNSSlC9ZZHAh59YKpVNEh4miH0v1d37
	 LpFAA9Aaqvxc0JFNo/QvxoImPmjvLOV08gzFDdFHoxGBCwm27Z9isFLgb8lA/Nik+d
	 VDidSqlBLAB8atXtRIk+hUEZoPraks5cRL8HViFA7E8yZOohvp2CUz+eN4oHO74wHu
	 OXUNbwnzX1h8fIevDBZMZydfQOs0uwO643AEFoOu7KUSV00g1gEwcA8WfmdAZWUqnj
	 UAe777+1FPvlQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8FDC24B3B2;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:47 -0800
Subject: [PATCH 5/6] net: pcs: rzn1-miic: Add resets to rzn1 info structure
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
Message-Id: <20261119-rzn1-miic-resets-v1-5-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
In-Reply-To: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=1138;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=J27gezGON7U1BSPHR97CeYos8JNMDptm1U9mPf2DCsA=;
 b=Vz5uGN4jIeTJ/CkeTD/1x37t5B6Ma5MB2Y+rjOEBO77+UJW3NMgViLHlU/WL/8ogQ2YuD04Te
 Lad8nu/LlflCkZPMcbhl7NLBiJIugLWelfCnW9pdQY7H0Dv0GanamHr
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 info structure to include the resets that the driver needs
to deassert

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index f8bafce26bf1..38164502c08c 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -128,6 +128,11 @@ static const char * const index_to_string[] = {
 	"CONV5",
 };
 
+static const char * const rzn1_reset_ids[] = {
+	"rst_ts",
+	"rst_miic",
+};
+
 static struct modctrl_match rzt2h_modctrl_match_table[] = {
 	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
 	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
@@ -855,6 +860,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_port_start = 1,
 	.miic_port_last = 5,
 	.sw_mode_mask = GENMASK(4, 0),
+	.reset_ids = rzn1_reset_ids,
+	.reset_count = ARRAY_SIZE(rzn1_reset_ids),
 	.init_unlock_lock_regs = true,
 	.miic_write = miic_reg_writel_unlocked,
 	.type = MIIC_TYPE_RZN1,

-- 
2.53.0


