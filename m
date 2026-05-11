Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6F4C955C
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525472; cv=none; b=YE0AdFukpRgCuBmcb78We91TGRMXVcKMyUTsvTwgapXhrF7eqgeQM+ICIGDHU8tJw6FoWTXdT/QGqkMQKMehQBPB49Mo4lXNioFIhh4s5kmUf9slk1lWvpMbvOL07uaphmMz8peSD5GWSJpY16hy0SmYET1pZ+L3MQhe+YhiheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525472; c=relaxed/simple;
	bh=6cAz0Exq66CMI0Sw4hFCa7WyDA2HTF+LQZywIWIj8QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE2isk8fFE8HkSehY6ZUiqGluu05AR3p2p6F5nJWch3xfoPAMBfsv1qrsGZob8iJVxeq9jOTkoE3xsOM4bxzqM4bf348PaE4rQ+nEwbfqwL1IWA3uU/Y9hNxFV+WzkZQxYMcDc8UXK7qNWX5v71azX33qrLeBk1HuIHBXJ06Vpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbeIf+eR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbeIf+eR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so37954495e9.0
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525469; x=1779130269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+XpErByE04HSy3HLws+NzAyVqid8HMXCiA4YA83SgI=;
        b=rbeIf+eRbKFaLRC2cc/JMnQlTxyM6E94vkEz0Zh7QpBDmpK3kNXLrThH2cNJCadIKL
         QvFM5kkf+lESX28/z6meJ3BxL9lNV/O3h9CByqIjgeOyWXTA4ALbf3KlX9OMMU/cvvq7
         jPsF7V2OcRFBfHj3gV1ZLyILevtJV8SbCvffP/WAGLQCfo1SdAawoi5wV+lB0q2saVfd
         pqWpJB6/KK+XfzSN76dGu/cvY2ocJUvTEMPuFhuaXLY2bQJAxWUQaD6YqTd+6pHQMFfM
         dJo9JOl3PRMag4fcZWArtOr0H2V9XBm1YGVB8ZmfYcQee1VvBNaQHj1FoCrcyo4Ve8+y
         FuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525469; x=1779130269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+XpErByE04HSy3HLws+NzAyVqid8HMXCiA4YA83SgI=;
        b=SCl8YwuYXrB3t8HMJZlHTiT8+GLvjkWwy07jNf1bYLsVxFpFvNRRa4akc1eaxVhMcm
         0KtAtUMox/Irap09LTdvRrnI5fQWN4BMrxr/mYHYaNFRl7UJEyTWoQAJI/cc05W1WsXY
         cgJs6HzF8Fa9hAig+S5Hweu42b55/o1ANJjNQytYe90lHWMwKd+B7BUS7xmqeOZME6Ay
         ZPZHYxyG1YutiafGxJ+YLNaeGegIcO5eFh2q4mKpBhMQUgudhd9UWQK34W7a3g+8G+sr
         AHYu88rHihCPoRiwn7FB/kzM0zPuz1MmEVbfgaYdurP6mbbtO+628fCeY1A36Mi2lJLk
         igGw==
X-Forwarded-Encrypted: i=1; AFNElJ/OQNrVGsRlhstgGRQB7w4ShPMxt7BsNvKs2l1aUsfVMBBLwwhhawAalZeZWcHGgJiIpmXY3/PdzY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8Grc2M89RRq3FZL8VP4Rb0zymzpNxkkiBk30aYuamNvLCb+a
	GATwhMNJHZ8E+cSTCgIvWwgB7NCBTjdubA43KzoctN4v0tt+HivsPsy2
X-Gm-Gg: Acq92OG848UsuPWdmYYIFxECJBk2QamF1J7MfxuxICWPFkeC/GSaYUHylTfyPYJ2frn
	37NrdYQs9df1Hhaz6DVano9Eh7AWHReRRUS0ubHDZIfCgxbneO9wMl1yD5McCkDh1VKJXJAOD/P
	omjgqVe83ncgCWg98UfFaPKYSZ45Kl4wkcVoqeVF3gTwatEKWx3XbCwnU5zZLKeSRRG3lXg7QDB
	J+qslc5mHnOeUa36TAz2vzbbxlkK1iVmYiGR9P235vtcm+Ic+DOPt0LE5K3rCegkRiEHxvDZ6k6
	1AgVrybjkzVka7vqAt9bXM5Ao1gQBoRXG5DjsfxTsn80atxG9Iz/Zefu1k1aISatkZLjSVn+d3o
	qFvEf5vjWIVxYme1dBDK0pubfIKIvfQjV4tlD05M8c/L5Em9/72BQTpdSYU93D+Foq3YlbcFjvz
	gLh2GEgjsRsOKyVY79Nd0jZipzxgdE+brk+gKtEqxYKKLBgG/m3e6prYd/Wz0Wbp9+owr412YJ5
	Z0+gmDwNH710fBKp7oUYkTAjrd5WXp4ydPnSAuGqh7cDLOMfJkxbyfceWU=
X-Received: by 2002:a05:600c:4e0c:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48e51e21378mr421235775e9.12.1778525468549;
        Mon, 11 May 2026 11:51:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 4/9] arm64: dts: renesas: r9a09g087: Add system controller child nodes
Date: Mon, 11 May 2026 19:50:53 +0100
Message-ID: <20260511185058.1926869-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index f697e9698ed3..170d033dcdb3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1018,6 +1018,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0

