Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709486;
	b=YmvEWvf2OyDgz8HfzrMKmrtDzPl4Xbp7LZB6VQJ4PqpKICTXbI/YNHRCjLjfi4NwtNoi
	 +PMmKPCkUgq6dxTWm5m8EUB9nEOnK/jK9vDn3dTA7YL1+bZPEciHYXoV4lSmuRywzWMxz
	 yoLLknDKkNx+NqB35ghYgcNRQfvTQQmLVtgG7U2un+Z7dUxzQ3nEkAW1sKUsloZCjoFrN
	 lMFTTo589kAlo3DKnTFInb9FzuyOWhcAOOh7zVAlGilapOJfhVk7/ps00KeCjMKMRPQek
	 j3Sn3N2RxP4tO7L15US/KvLCmuk+sxFFS528gTZijoMn0moaSU2/8VFYUB6xHXE13aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709486;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=B8afIl54uofw4fRffgowD2yNAcmzGv6guAeBglCdr9bRs8k4zkL/togSScrv0a+RxYxl
	 luq/ncRau2yuA1e/a2EvDExe374TwJ5dcPAYHgJhSb1QkQpUUkwo+FUH4N0noXKU9ug9Y
	 5dbbUUwaPUraOuHOVF7HyP1GkP698zrYk3did9EcTWr2MFURGqlM2EZGWA0+5kFJCv7gI
	 Sbu/050yh9/ILL6dWwpIfhpaLafz+SwkdWCyf4ZoFzAlUnyXqEZZaC8vxusYTvp8nbSti
	 1e31hVSeVY8xrguXnTEfxG2HY6gv3iKPpcWMCE9K1s1d53fT0XkeIvor2wHQjKP9W6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMFvJfJO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51D606A31C;
	Thu, 26 Nov 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMFvJfJO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795709485;
	b=n+KnvR0JKNbamuNFNxusojA6HQmFIF9QHGR16XxsUJIXBJLTY5uDhTWftTMq0qevh10V
	 Fw3uxzz1Q6yK0CN7KTbVuGOUkKG6cQgSj/vO7YtlCBE/E3CPSyT5wiqRBQsb5VIxOT4T8
	 MJS67LpR94MgKpwPxGuJJJL0OKsMM3g8UkgBrKylypfzcEzzGuhGW7rY0G3WMs6MrzB/S
	 1Y6+y5b7dwPoTZPiRjx/F+9HIppUoo9I1tJ98MFpnDlDIRuWzoXNMNToQNbX567htpnH9
	 LyLFdajNq3wLaC2oatABiWUBVKkgcrBc3Lxg5QovsTdZXr5MV3G059TCS3dAKiRXsqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709485;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=aqaqKzijaz9I3x/qpIV6yw1XUCNElS03WL4wYczuK3+3hG+UVva88LafO+Q5dWZ3Snew
	 00lWefuMrEemj2ziF/iuTwil7XT9RNIPkBg1lN9rKUHa/H8AZ3xxNFuKzd/cikuTf7ciU
	 n9cswF2pGperX4BFaHXcwxLepPYkBGqLJjG6FAmNjWX8yZWh9z7ASeqRz5B9zaLacloBV
	 VjD/V1oHRSBgqrsFcmVXopIkdlxOT/x4XhqpX6P9qH1/+dLQizJ7EUJz7GIHwuUvLNJEM
	 suXKYn9IwdEeAENgmiWVFUIOI47JC4cGc/aieudAcSw/oq6zGvM4f/ccoF4S8DmuEEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E9991F000C4;
	Thu, 26 Nov 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709485;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CMFvJfJOqrYqCsXkpM3PZHdfR8YM/lVyKsrDYLNICtgEeXEK7ZEIpt/bYkMLTvT+S
	 9ujVmLLlfOTmdJJLBthB9bL5IAXhraWUukrLLz6btW9g9+6gXxL2lQvMQcYk1vrEz4
	 S8zREYNZ6P5O7tvihQle8FFV5aNV+i/FEpiSI2T4rwcz62Jm2/0EK6K+v3weufeptD
	 UyT/cijFUSLjNFggoD91VclGo46BoP58k3PJ8km47rkYRrL5iD5KrDl/NLBe33ww/r
	 aUMoVOhfLFzvxd+8jzTQiZNbGiYlrElq1v+V9HvScF+0U7sz7xiH4DORBzgeRFia5z
	 csKX9Csz2NWGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 881914D708;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 26 Nov 2026 08:11:07 -0800
Subject: [PATCH v4 3/3] ARM: dts: renesas: r9a06g032: Add #reset-cells to
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
Message-Id: <20261126-rzn1-miic-resets-v4-3-4f73af81d779@reliablecontrols.com>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
In-Reply-To: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795709473; l=804;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=WWyo4QGHfN4nIjzzAN5Okr3IhbwMhhhW3P0Osmvu8I4=;
 b=1XkYumVv41gu/rXPKVLmjuniWX+x9G/DjTFLjPBGDrQXdnP9iZG0juGPy79WISILKfVd+C/Cv
 5EnR/l0ELsNBLpGMhwpq2Pzm/21dXBNGtNrqfTwmB/MjsqmKj8JAtM+
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


