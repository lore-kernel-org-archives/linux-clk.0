Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111101;
	b=sqRQ8+SilazKBT5q/ZETcOxlMHFpO8Zj8gmL/VLk2gNYFCUrUU0xtZW4BWq145vOFKse
	 WF/KUlqt4o7YANa2RdKyH4/QLLcgz74cR6bBdkJBJUdLJEiuuZRKn9lcdnsJRq12JGTnj
	 rYOFJ2bvSIalBwNYkpssN0WEFF7pBkhLALyHpNV+V7I1id7h2rvvltI1EgjETqKNm11YK
	 aZurFiDo7MKlvotaJOgXxtB+qnmCeifn3MCUD1ZKI8v8oqwVE77IqgaALQ9bnclAcSIsr
	 Y9VoUZIo6ohvx53k2X6Cr31YlCCOuO/mIRltNmsvzVU7MQG3BtwM2ffWK71X0j3Jpyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111101;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YOu9rRqlMqXgJo9K0RA4KBUJJfmp1x33sccm5Z9IIHU=;
	b=P7eofT6Hzhvsdf+E6e7avclV4gbQTorPHn7BeNHb9fJ1/psjZTKe+E92GJNt6m+BdJZE
	 xiNNMAa+ACWKMuiXC3tP8I70EbCQEZWOikvpJjFh6cRqYwKajU5LmYLVW3P3Jy3tWmhHj
	 3217crfsgMtX6rXZWADuGjfsOV5WVfwyne6iGWI7T8o7fW5DlMPhvWDw61LigAlBd98vA
	 VZEN8495KPb8Sxv4294sq5sej2HtLR2knG8jJ0TyaqXWljgDeIRLsLRVp9bfgLd53927R
	 qFD4skcqVQR2SI5QSHtgSUbhQMTeyTUj2AV5i4Xw+tYJMhiD7LmAuBiuMLQ5c+fq/OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjMdM262;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BE60A3802;
	Thu, 19 Nov 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjMdM262
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111101;
	b=L9rUh+kr7Rk/k+0FzH1NZszw2pnu2UJ+4AZqtZ0YUfdV+HuTnjfvydL0K+QEOHjxjSJX
	 LZHjPxd3V+mCqrSCWvTGbPYyZtpHLpE059nIUm63kdMCdNrSNiQUwx8gs4SyOX5R9HLUk
	 mBUKFGYPwTro9Hqr6KsFQu9I/sBtzM33SMP3ORW11f7NAH35JSzEHGS2WFsmF6qTnq7ax
	 JWOHXd7xiobADaRdgZks4vf3lD2vI7LWGH9Hky0vxcKyITNN07GCLXd5ivOa9yEUbypWF
	 Y/+Y/3Ek7Vy9nkGoZgCYbEAzfiFbiuI22PM5q4Wv4X8+h4D+tH+5DDNPfiR22K1tiMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111101;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YOu9rRqlMqXgJo9K0RA4KBUJJfmp1x33sccm5Z9IIHU=;
	b=mIBmN3sj7gp1wZJYRdYP9peLUU0H475FX76OVbnxJ4cpZVp1bFUJFp4l5EcR0lhUCBip
	 nGNYvj3E9Ar8Y5LXie9GAvtYgIuKVDriVxurCvRiPFPXwy1UNFeiS0aSrjYpNrsAnjfqi
	 GkefPRUDfHEt2GRQ3B8aYlHcPF155NtvT5Z/uVvyTc/zYtun44bsNziTuBlhX/27o3Tvl
	 7ueRfITrgmlmHn4S+uBDmiIMLDdX1GgDe2FVTUsN/0vHYJ7ikHIcEw+G69tpiXx7uSzPb
	 OK0IEdENZuWi6wgI3njmluFsX4qYFK6/knOaguFqFjeVIF0wPViQfXEttaR3tfKTy/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C879A1F000CF;
	Thu, 19 Nov 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111101;
	bh=YOu9rRqlMqXgJo9K0RA4KBUJJfmp1x33sccm5Z9IIHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CjMdM2622hJMRYq49PVeIea/Fyh38bjCeeQZl/VgTBSISAcObjhkQ3GN+ZFMup+D+
	 fejJJ7N+1UbAlSTEhr6jlY4c4oABhQ4vBZRn7DaHpyE7G/cbMiqV2pb06bJB1jnf3u
	 AHEwpHfGWcDZYPtdw67cAt9xR4uBzj1Cmybf0pLgcIBbMOFc9A1xWg3cDRarapAl0y
	 roSLQAAhu0jNtc8mY7U746oLBqTrJWW67T+1lMySlg01HiULOlJrw/sjPuBaVQfQ1T
	 ArkvUf5DeYhx19bNg2sG/IUVs7HdRKOzqo0HDtAtOd+yviN9ayBkdpoEzH/A6uvF4D
	 YaJAikSG23YSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AAC384B3B6;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:48 -0800
Subject: [PATCH 6/6] ARM: dts: renesas: r9a06g032: Add resets to mii
 converter
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
Message-Id: <20261119-rzn1-miic-resets-v1-6-feee2bb28bb4@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=858;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=qgvA5VciuFpDDlBloW4+43M1wkddJY2irZpJYObbd+0=;
 b=OhrIO0OOq4envOlQ9SlkMKgZ8zwywCqI1Hl35UHS4W/dakNbGHiHRR1SxMVHYQLVh/LFjgBDm
 5VR8kkDEHxuDewOhaKUuZGCrfzaMxujoY0XpSH2F3UcUugaAkVPUUrP
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Add references to the resets in the system driver that the miic needs

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index f2bf087f7ad2..0a538d922125 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -463,6 +463,9 @@ eth_miic: eth-miic@44030000 {
 				 <&sysctrl R9A06G032_CLK_RMII_REF>,
 				 <&sysctrl R9A06G032_HCLK_SWITCH_RG>;
 			clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+			resets = <&sysctrl R9A06G032_RST_TS>,
+				 <&sysctrl R9A06G032_RST_MIIC>;
+			reset-names = "rst_ts", "rst_miic";
 			power-domains = <&sysctrl>;
 			status = "disabled";
 

-- 
2.53.0


