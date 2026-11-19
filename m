Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111099;
	b=4cBmy0tWFeyPggB3iah8t14ewbtG3B1SroQa/V9+iK3UZvrAmSVFNTLP/UYpzku4Gyni
	 88zN4MnEa2vz93q/RSSSzIFWz6cS4mw+FwYG2K0K9esOLXxrrYEaQabs1cx2NvisiL3+s
	 pTnbOV6fDx8qHKGMPMFB+Bxo0xgLgXB9S9Bhe1vj9yz/YZiZFhc5zFYbUsawG1RQ45dCP
	 5h35QCKiBdrxkp28EyXrNTrB/wL7bl3d7j4HuUfALcgaPV3Dole4v5s9wkbHTfGviDoSw
	 iNrKtip1u/s2E1U1RcDmIHzWtVNc7RJnzq1WAb4G6fh9Y0IqhRyquAgGmjjaszVx5BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111099;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UXOIE+Lb0btn4l/XTdxQeU9rcXoPhYMDROX7/rKQ2xU=;
	b=DpqyndnLmjBBTjVUwEOxn6gzc6UYsm7XaYTDDEcwD0rEGLlY8HHyDF2uVjPMvOO/Jg4M
	 QLFRiQEKE6qyH/E7WE/rRnSnSXlPVRD+a3gUXhn0uqTa/0scd2PyqbBDsSLowzk4zGZxL
	 t2QJAl4NEopSuq8c5deV5ycPSXeJMvlf+dGZWil7BAiHgsKzOOm7YvBgMKEemcldjpSlK
	 gay1mM1oWobAqLP4eXz89L7QwWUDd/s2E2yQ2e0JmmbvchwzUvB9xdlmULKW9WtHoSVVb
	 Sjq6r2rFZvQoLHGGMAZwL6cpI9/ugq9GCpajBbTFvHVks9q1NYRk3oTX16jTfMEJXHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OqREfhaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BA606A333;
	Thu, 19 Nov 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OqREfhaO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111099;
	b=c9+hIWQL4s13Jf5BeOvHFNRT/ee5bkVCK0j7kTGSfmlyyx+gjio8chj0tcchLk0UpDZc
	 hrZQqcsR7fWlJy+nRTSVpmavEmbnW52RqClmx1TNii10M5usuWLDLZDLcO5Y2/A6KL9fu
	 Eaqzj6n5LDf4CSFiK60wkFV9aKD0hMwIxtQ79oM46t1jOqaR43W7vGE8MfIgK9brO703y
	 d0HjhUXv82UVpRbWolc0ohILW5mobWmce5g/Jz8pmG9qKgCckL8LE25X/GZts0VjoQzk/
	 HTDTMIzyQM+AoEJUvGMyQLdNtOsCoCrGC1nH+3GON/O2Yq3MRyAKbviUFOHnK54ukjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111099;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UXOIE+Lb0btn4l/XTdxQeU9rcXoPhYMDROX7/rKQ2xU=;
	b=uZ5QBxtm+lWlGIxkE9sxcIE7vFEF+9u3EHrBu0F6HZ8VTqQs05g/FLYoaPbfF7wo534s
	 Gj6fCh8MjeGD4owQ2BbI1uo6ZT19YLCsOC60U/bZ3IudMVbiALhrDTTQeBHQn1Ynh/BJl
	 fwqD6LDr+tq6W1dj8DUU28J12AUD/YkBgqIi7ukPpWVB8+aXPkJ9ysaWlqVkbIntUxu17
	 yLXxBeuZ5Z04jT+hM5NbI31gloV0ztYtIkQmCrUEmOPu/jQuEOAQEDzhYHlBpqrLnRRr4
	 prn2XBdEOnWvNmvHK9GuwExmDC0fll4JnKgQ7z5MTHtAuRu51tZba1nwbCq7m/CYfOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE8D41F000C7;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111099;
	bh=UXOIE+Lb0btn4l/XTdxQeU9rcXoPhYMDROX7/rKQ2xU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OqREfhaOxmaVWjlizJou9DWh++ihZuEVpF2Qdw9RGUb/JWv4pwdEVGbshZjbA0Rid
	 8Bl+Kd/QwfvNXfkuaIKJ3H3yesLFXsHlI66D+r6ENoEpZTFVNJLHz/UP5Uzr17AobV
	 O5+ZWxYAyrKiM+JKS8XASxG9P+LuXh/LG+l0F1Mtel6uV/q7bwpFX++BNfV42AzIzA
	 Qo4uudw1tZU0w5C7ZJ0zU9Clv6njKHOelJnegDBHMBhpYpLCKCCfJT2EogPHeA/CDK
	 o5HypkHta1ekgznkPcjkoNyFIf29FYXsEpryGkyB2QXWd4N3k/x6phQ/3gxDwun59m
	 Yj6BpGh9KkIAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5BB614B3AA;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:45 -0800
Subject: [PATCH 3/6] ARM: dts: renesas: r9a06g032: Add #reset-cells to
 system controller node
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
Message-Id: <20261119-rzn1-miic-resets-v1-3-feee2bb28bb4@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=742;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=+MYagGpleI9cljL2vJhNov8A+HH3o1Sf6uAHaCyWxlc=;
 b=wbDGZ/A+rly1Lo5TqI/yqXCGDYFXaHLDdGsT2obz+a/oGv4vLzQYZU92XB5OfKkB+hA7xUf+u
 vqgqMg1wuEjA32OPmh1TsxklbtpXci4b6TRzvqrutJGn3rCX0XkN5H3
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 system controller node with cells for the reset controller

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 5455dccfbdd0..f2bf087f7ad2 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -146,6 +146,7 @@ sysctrl: system-controller@4000c000 {
 			compatible = "renesas,r9a06g032-sysctrl";
 			reg = <0x4000c000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <0>;
 
 			clocks = <&ext_mclk>, <&ext_rtc_clk>,

-- 
2.53.0


