Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470670;
	b=cOxPrho1ClAO0H/EFVt3Ff9qrhZVvMC/nRQ4/U+vq0SYWYkU8NWSbqqhYgF5Fv5FR/ER
	 mSHqkLXTVStOATJsU0qsoXbAtX/ifsMtObjAqmhsRSOdLsvuVDl2HOrkmeYpdRU3mOCj6
	 MUP2ntlLUYsiFVuZJVq6A0wpbkgUVd+ovuB/5Cg/uB20g0IHVVZ9bToc0/qxbxZhIvIDW
	 7L4/sVkUha6tX1FwQLdaAg8UF+siroRWVsGXqUd8uHwTd+JBksCmNqkwonfxi5pyZyys6
	 ujS4nm2L1/V/x54vDpQ0uku11Ez24nqUAc07QEw96mOKmGFXucvYOW/qJ7MtOBkhxgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470670;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=xjXNGYnj7m/BeYzbOpPelNrEBThHGMUhvfbeKCE5olU=;
	b=tCNH5qg/z2hIzr7ViN/ep2u+pV/2YRaRW6dkSVh/MgZLo8+9cldn+9PBa6sxykI4arL1
	 CvHLKdNGqs8p/oB8WqTgyOjGnQuCUIoU7VhiUUlMO6/kBgJKFYSYnzqYNZeFI5H0l6QVX
	 AGoTIMVRQ3yw4wdUJLQuZhJ6ie/PDJAnX54rSiKaK5lQBsZodjZj9tH1nQCkSShnIhqqp
	 JAA7Zu5U+QusnYNC7PIMapk7gW4I1c17py562h3K755ASP2YHq4agPoXt6wUknce7ciKn
	 UsVXt5Qep88gHfSL0hCccEMbSmkgQyY9GvpPMF7bhVPB9WLWFjQX4iRbvlCp80U2Wqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdL5Bah1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7ED606A31E;
	Mon, 23 Nov 2026 21:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdL5Bah1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795470670;
	b=oPtdlqCuD1HfS+sCE1Ev12MhbcuR9wfespY5sBOqwGrpnPdlncVrIMPAU6zxae5DIn2k
	 J4h4pyRHc1pG9zGgtlgl3ZgZA0Qfj+lzD5g/adepxPBNGZpTcltUWclpWcFV+O+M8/E8F
	 lZQuQr8YxkO3HjzJgvCY0qpQEu/oKfH7u8BW1zORnhfXJCwddKRXBi1hDMiUsIU6Qpf2N
	 YEBX63DPYxODyP9JRh6PgB2IBVcch0cT3kRkGgKSoS34gKJncDDoDajcPR79BYOcgEYl2
	 Ta85Gl0T1n3Q2s3K0MBQOvsiilWZzgTFZQfslCP+3pwnNfh7X0ZCwWsf260UzipTdDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470670;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xjXNGYnj7m/BeYzbOpPelNrEBThHGMUhvfbeKCE5olU=;
	b=2vRruO0jVziZtRpJdK75XuQXrfSgIOR1K8fo5g1gmDkgA/RR0sQRbgrOnV13Jlad8fyy
	 TGbPYNenfWi2D87i+vxntcfX4m1FRjIxCeRD33ieUsOuElGAkyz3NRqIH2k1+sv0PfL7M
	 w8icK4zzhB/fjdEq8/WCxYJ5d5LyyD9QbH/f83agQeGwlHDTRdZFBenqLH+iyCCXU4uli
	 snnXvzq7rDXbvq9kewj1GrDcm9sPp0mALOMtE779mt60shbvTNjgS2H0SeywD5SfImmmR
	 K6X9B3dtpzPU8ywwyax2hJTF0ecVeIc82pUhmMdDFk8MNWswLvMTSH/8CuJ5DgNcSrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 123311F000D2;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470670;
	bh=xjXNGYnj7m/BeYzbOpPelNrEBThHGMUhvfbeKCE5olU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bdL5Bah15ParTBHLRn0eDSWgOmgidA1jRJh7mAn7piHifFS94+KEk3wqF+LTKsI0a
	 MO8mmfU/58Q0zRHv675xTjU2PmAb3m0bGlq+9ol7ObUoEGEU1NuFeqZaxm5fP1P0Rs
	 YsbfqsCKPJJzOl21T4hyStcoA/EfZt2pdWYcU1gxZta369/vkoFwtkXWMxSJCEPZGX
	 Cq4JXGu8lKsbeFWsXaPJjE8sTfDlJA07fXKhMh0fhQPY+pbQTWjq3TBTkn71pExQvG
	 cjo5lG8GCqPfzzRinIXsHFmoFjq1GNTKZXBvMhRYpQwzWQeZMP3FIDa5FHBh6kyoq2
	 eKZhxYIqLVw4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 949084C780;
	Mon, 23 Nov 2026 21:50:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/3] soc: cortina: Add CS7542 shared gates and reset
 domains
Date: Tue, 24 Nov 2026 00:50:57 +0300
Message-Id: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOSW7DMBAEvyLwHAbiIonWyf8wfJgZDWUGWhKOb
 CQw/PfQ27GB7uq6KuGcWFRfXVXmS5K0LiWYj0rRCZaRdRpKVra2rTHWa/SapGu81eO0Ikya1mX
 L6ySavXeEgJGDVWX/nTmm3wf7cHxmOeMX03YHvhqZf87ldHvWFIJwIc5z2voKW9hFcJ7Ym9ARt
 rvBURMCeMQYyRniZsAQ76iZReBh21cvV/cWlT8pkvridK2joboD09Uuhv04Q5o+y5063m7/3tA
 fLgsBAAA=
X-Change-ID: 20261124-b4-cs7542-global-controls-e443cbabfe82
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795470657; l=3632;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=oWwEGHbvb0LFq8Gwa0S1Oy8KMPiFJPQoiptcl7pgoU4=;
 b=yIq+dxLdfFEletCfSzHbkgBFAvZw9FdhHtkrme/yaAI1obYfBq3IaTyySKRj2cYNP3GCwjZS9
 Kx70zwC4m6kDotVXQUXBQ51uUBsdhShNfmYG6yeLT2rhZdTwiGTX/hC
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

The CS7542 global block contains PCIe clock gates and controller resets,
and a composite network engine reset. Publish these controls together
through the existing early global provider, so PCIe and Ethernet can use
the same provider without either consumer depending on the other driver.
This also avoids a resource-less network reset child node.

This series extracts the global controls from PCIe v2 and moves the NE
reset implementation from Ethernet v1 to that same provider. PCIe reset
indices 0..2 and clock indices 3..5 remain unchanged; the network engine
uses reset index 3. The NE domain includes the entire DMA-LSO/SSP block
and excludes SDRAM. Its consumer must own the domain exclusively.

The existing NE assert/deassert readback polling and partial-domain error
handling are retained. The new NE reset index does not support pulse
reset; its consumer uses assert/deassert/status. PCIe pulse timing and
registration error cleanup are retained. Clock-only DTs remain valid.

This is based on the posted clock/pinctrl v3 series:
https://lore.kernel.org/all/20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com/

The next PCIe and Ethernet revisions will remove their duplicate provider
patches and use this prerequisite. They do not need a dependency on one
another. Board DTS changes are prepared separately.

Validation completed so far: full independent ARM multi_v7 vmlinux and
modules with W=1, COMPILE_TEST=n and no pending platform series; binding
examples and complete integrated board DT validation; actual-source
fault tests covering gates, resets, partial NE masks, polling timeouts,
regmap errors and registration cleanup (736 cases/106098 assertions).
On Almond+ with the moved provider in a Linux RAM kernel, checked all
six clocks, NE assert/deassert/status and unrelated global-register
preservation, real factory MAC probing and two Ethernet load/unload
cycles. A second exclusive reset acquisition correctly returned EBUSY
while the datapath was bound. After unload the entire NE domain was
held in reset. All six PCIe devices and root-port MSI remained present
throughout, and MDIO read/write/induced-timeout recovery checks passed.
The test partitions were read-only; no flash writes were performed.
The board returned automatically to the installed OpenWrt.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Fil Dunsky (3):
      dt-bindings: soc: Describe CS7542 global gates and reset domains
      clk: cs7542: Add global PCIe controls and network engine reset
      MAINTAINERS: Track CS7542 global reset specifiers

 .../soc/cortina/cortina,cs7542-syscon.yaml         |  14 +-
 MAINTAINERS                                        |   1 +
 drivers/clk/Kconfig                                |   7 +-
 drivers/clk/clk-cs7542.c                           | 211 +++++++++++++++++++--
 include/dt-bindings/clock/cortina,cs7542-clock.h   |   4 +
 include/dt-bindings/reset/cortina,cs7542-reset.h   |  12 ++
 6 files changed, 224 insertions(+), 25 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-b4-cs7542-global-controls-e443cbabfe82
prerequisite-message-id: 20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com
prerequisite-patch-id: 083c8eb9fa3b09678418ed19c0dd275afd66ae1f
prerequisite-patch-id: 746951fd830617cad03b52208443a8b6f7e8f440
prerequisite-patch-id: f8a2ba71717f71ca2bedda986f8b861995cdc586
prerequisite-patch-id: 7fbe9405265ef3d1ec62811415a46c0061afd7c8
prerequisite-patch-id: 25220835f5d2506a01ba652d86f9b9ac3ad5121a

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


