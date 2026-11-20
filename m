Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209465;
	b=IXrzFs/ww0YMUfiMAwWM/s/IvKv4VUXVbbjXJSaxDLVoabZF2PL+94d4121tiJX6Tfqf
	 jQUP6TmCqNNnx2qPkmMXRv3r/ru48c/0My2Dw0yhXoyAORjhf7AMesi5epYrmL9nYDk4M
	 eTC6P42brrpV4cu9INFYkv1yFu17fLbmHhuPxSUDR3DoGZ1P8EQbacBhZ3YyvtX8BHbkN
	 7EqVezlVwEcT4UgjhXOZ98dQ8FR/Qz8UxYBLpph0ugVMYGQA2h5YEawQ7kKsmCX/UrWvc
	 IiR3THuFswHEg9w0qejFTskG6UZ0lSHdB65qWjpj3YtQbiD5U9RUeYpELP446izmUsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209465;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=5cB5Uetctvefp9nNhS///xCjcASOMGc8Te3P2lCCWWA=;
	b=WuEX+161BMT26SnCNFzX57QsshIW8HO5D/3+o+XEZwGVvsIaTNswWpYE1dON1R3aFrMC
	 slJ2TS3ikiyi7wv2ochxVGXoSrA/eF4XZmgeTh85z+2wc5RzJUjU/VIh0Xlol1B00P6RP
	 SKe7X3uOyHQe/sncIx+xZpDHdYGluPp2Z1HqY/TtxapPz5jPAO8+ZVJHPCPWCIQw2b9lA
	 pPuk+RBouirBOxMo2hnw4Z4bf1V3KMDKySH3MqjrKENgZ+tvI9IYhMxb0AxldV3l14+xZ
	 UMW2RoljjMEOwJIxTmIETHi0ZJPttd7xcsIWMuC3qwzsvsmWzUKMFmbaZ1RvhD4dF7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYQ8wzoS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5E606A69E;
	Fri, 20 Nov 2026 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYQ8wzoS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795209464;
	b=eEKyqmwwPG63fBPmuxA3TAH0V2Xg0/H2yOKhPoJL8AQ5yv4wdn/qImnIFIJyaLlGmvJJ
	 YTZSVKyLe1hw20or2etED78K/1pcCqZS+Aggl623HUp+LhewOTHHqhmVUAby39O8b93WH
	 dsgj9YShzy+05RdMWwl1eA8saS51JzqonWdlcGY9t2kcH3kkqZhcOgRuHfOY0KcdD5lUD
	 5r0YsMOT1jKbPEXrAxoQP3f2i+7YL84xfPGCBCGwSOploe/ot4rGBgzgzSZe3NENCoHkY
	 d4uFhQjh8gd4Z1uZwwDf03TRQ7qIz/pabyKwfOHk4eKlK7n8+3Mj0+yh9HziN8okeGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795209464;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5cB5Uetctvefp9nNhS///xCjcASOMGc8Te3P2lCCWWA=;
	b=gDhw+2dG5U46dpm3mvtWAqIByjzy+YBdeDoac3xuGZXxUmRV3WSPsp55fQs206YamFEH
	 INTkjuhbUWi+pZouRN2/Tx+bflvORXH++OktTuXtj08QnoR+nD3JE5E7s6HNl3F+kuoLL
	 j8FQg/WUzrNFhEnr66duXPjK8ZvW7aBRfSbM/5px0zwWzVEqGA8GneKDHsxzQXzDCmUhN
	 WA8Me86vPZnYb8o4Tr83NqOAKj3id2p55nivGb2i7XCPrD93zw4G/OZrVOtw5QFOKlML5
	 j6dobbmLVvPx4x+ljinespsOLpDKiJDkMnm/HFfLZ0nWBUX/4jgTBdBspTj5fdKPkdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 517041F000CA;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209464;
	bh=5cB5Uetctvefp9nNhS///xCjcASOMGc8Te3P2lCCWWA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LYQ8wzoSsd29AaiH2PQfi5lVAWodaHCfnBULWwBeZTnJd6zGOLKgmpjExVNUWMquW
	 Wv6i+76KbA4uL87NKGqdz3pRnAMg6JRN/7DyIq/VCUpvRyFWL818ErnWabUwNOqYHG
	 HlV5BvA8cEepwnvdbp42SQGvaLHS6Y30GRbBzjHz9SHPWNapdu/TEScUSSYRaUQKbo
	 A9ENqiB9zQ1IZoA3BOoT8fjaADfwmL4klLOYdr2peZHHFcihz/En0ZuSgTTO5MI0Eo
	 7W/K37Hqnw+aKadnRSsfTBN1LFUBFNtCqalmZgtqZaM8WPIq8m4pCSw2dyjubgviX9
	 vCqkyytgc0xEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C42024BA30;
	Fri, 20 Nov 2026 21:17:34 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Subject: [PATCH v2 0/3] clk: renesas: r9a06g032: Add reset controller to
 clear resets for mii converter
Date: Fri, 20 Nov 2026 13:16:51 -0800
Message-Id: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0JmbU2niqIr72FYtHWQSaA1U0JU0
 rtbcenyveS/v0AiYUpwrhYQmjlxDAXMpgLf23AnxbfCYLQ5oDZHJe+AamT2SijRlFSz002NtbX
 Gayizh1DHzzV5bQv3nKYor/Vhxq/9xRBP/7EZlVYdERnnTOPc/iI0sHUD+RgmiUPa+jhCm3P+A
 Om+Fzy7AAAA
X-Change-ID: 20261027-rzn1-miic-resets-8308515aa2c0
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kyle Hendry <khendry@reliablecontrols.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795209454; l=1704;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=64flA37FYq7GX7EUX0roYoz1X+pA+V7pvD9Hrm3PL+g=;
 b=KRB/7zyk+sfhm6s21ea85KRVqZs2zvpIpkIF1zdDNcSYpDc0JgzTV4j3XneKsMkesYau7m312
 2RfhwsSykP7BNWLMwZxBRHd8XuwvRLHWp62i76L/oY+61SUOa/mROQH
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com

On the rzn1, there are two resets for the mii converter in the system
controller. If they are not cleared by the bootloader then the kernel needs
to do it. 

To handle this, I've added a reset controller interface to the clock
driver so the miic driver can deassert them.

---
Changes in v2:
- Drop patches for pcs-rzn1-miic to be submitted separately to netdev
- Add reset_controller_dev to r9a06g032_priv fix build error
- Use designated initializers for the reset bit definitions
- Change macro for getting priv data to static inline
- Drop unnecessary reset from controller ops
- Remove debugging argument from r9a06g032_reset_set
- Remove configuration of of_reset_n_cells 
- Add #reset-cells to required and example in schema
- Make r9a06g032_reset_status correctly return the active low status
- Move reset controller register earlier in probe to better handle failure
- Link to v1: https://lore.kernel.org/r/20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com

---
Kyle Hendry (3):
      dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
      clk: renesas: r9a06g032: Add reset controller
      ARM: dts: renesas: r9a06g032: Add #reset-cells to system controller node

 .../bindings/clock/renesas,r9a06g032-sysctrl.yaml  |  5 ++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  1 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 59 ++++++++++++++++++++++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      |  3 ++
 4 files changed, 68 insertions(+)
---
base-commit: 662377fd1bb1d7cf4e97d312255fed868f56342d
change-id: 20261027-rzn1-miic-resets-8308515aa2c0

Best regards,
-- 
Kyle Hendry <khendry@reliablecontrols.com>


