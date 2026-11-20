Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209466;
	b=EviXNVc+h5HyMUYoTbYRJTLgW9GdqATzIa2LY8q7sZRTdQmhIeh1mWA2H7PfW6n6WqnB
	 n6jaJzf6ZQFEkfrA8cEfaLB0R0Mztvyv6cNaUdhktWMMm9k0wtbYXRU9TbDtPpx5M2dcT
	 mKFDQHUcyYZq1aFCpGW/U7IhNbeGjFf0gxlfB1E6YZ+BdSykqYVGYZchANaD5GmFganoq
	 JKNY3W0rN3HS/9NeFh+vIQc+/DiMxJqsB3LAseT8Xsc+o1PrE75wTKkQnpbO6mNWoCwks
	 /kCxndrrEfso52d/8QTWEurcRKj/ozR5eV8JIotxS6cOlN8wbaR3mIGLBVRQpHRo7oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209466;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=MwumQUwwkk4q1Fb1MqwN9ui/qJnn2r/GOFGhz1f9xvBaWSV2JD6tgFBE9EmbffLuWoU+
	 8tDbjRYIC5SCqWKWI2/BJAra0uDRbTrLFtByBTiLb4Eg/lZUabKpGYPt0BoeBL4225HMb
	 ulZM4qwB1r4i44lGUOq6ZXN9SVY5RAIgZKzSdjRojzblVZI6U+/nNbjM1c58XMjfD/Dqb
	 G5cOe87TwfmgWMIDejWl2tYyN+P1bW12rFEoEwJ8NE6rSIeYO5LwC+gTcR2Ah8cZDMS5U
	 qv9O/5V8G4mfeD7S1PAcq74tkF6gnnjihpix/DDvnhnk4Ra4oqpbFUSW/N/zg66X4Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S/uAl2vM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9D60A2603;
	Fri, 20 Nov 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S/uAl2vM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795209465;
	b=Pu7Bb3sgNo+lKVaIyT4YHpLLYKjtY2oyx0I2N+epy7cdicU5aOgel5JlVXKNJcisZhMI
	 m7lUB/x9ZpIcGeTNDZ22R2W+qoLzEfEcX+lqOf+qIDeBiicc7brLo9VXpXhvlR6Qe3WMK
	 7dEVtXUZzLLMaMUJb3RtOrIq1B7xoszFcF0IuVAt22eHjyCEXxvBLfwt3BVe+2BXzXbMd
	 RFgMQoPPrkSiHMYcRYu0cN2/DiOLUhi/oFJMdVi0izCgJtJhuWn1trzY+E3zUWdLsAT9L
	 cAup3a2jiGH4E7OLhmLy//X8TqA6zVmefGNEx2hPzrCmwV1NRnPiWjaCGE2RnOMs9OQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795209465;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=zOiFoOT9uo2tSIofbgEfDdXLhY4+PUOqWX5ObGPu78415vtx8OUPlC0ioRR4NYKGV5Vw
	 56zCt+cuLo4gMfXS6UkO3/8USGwYtya4FD25hFm2NB4rdAJtBQ/HjSP87n/F69FCarS7M
	 UG6hhnw2OHONOxpEuTslOY31cnGnHLOC9wl0yAxByQOoTylljmdmNL9YKeL+vqXo+zqU3
	 qZSBdDCR74jgn6SwVspTcqUMNCFXR6i5sfIs6UjLXis+inZqFJcC/mgumV8myCTfWgx5S
	 vroL/7zhD774VAhiQwC1MstdgmKF5UceV+0z0TWh6ow8t3KG+nHQdH5NKQj4vtafNwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B8941F000D3;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209465;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=S/uAl2vMBBg0ZON5fbMNPMGhtsyvL3eGfUBiVhvIDolNhJSPADkr305YJcQpZ9LbH
	 2Cm1vpriN2v+dtmBORhDUe7ZZ/EkZZO3UPl8JGZfq8vYoqCr/8fJzVKRUNa09PEPuT
	 d/tb60gpYq9+Qx23OUyTdEk6DTT0wBlJciFXu6Wf5TkhfzvHzaoLD7afwKf/WSnJhX
	 mmPzi8M/l38XGhRIVFR5LiUKeynQRs01pIz6PDueL/FC0w94jjX3foTvkTMzwpH6wH
	 yBet4+/+kmED3cgX0ntEaT7V0MuVrzUGLTR2NyCSi14DXOSG8MkdNCvPSXcweuOYY5
	 NvBCMCAd6fT5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 29ED44BA38;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 20 Nov 2026 13:16:54 -0800
Subject: [PATCH v2 3/3] ARM: dts: renesas: r9a06g032: Add #reset-cells to
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
Message-Id: <20261120-rzn1-miic-resets-v2-3-f1cfa678615b@reliablecontrols.com>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
In-Reply-To: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795209454; l=804;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=WWyo4QGHfN4nIjzzAN5Okr3IhbwMhhhW3P0Osmvu8I4=;
 b=tzuxOoZNp2cotuYleAplho6OWBk/ynCrDxEU3P2SEnDzRu24C/0ELbnJp8mw4szmETjJzwV9Y
 8gJlNd5N0JuCs9y/9Wdu0WgFF8YW3mDX3CZhEgvxF1RBTweGiJ6ICMo
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 system controller node with cells for the reset controller

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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


