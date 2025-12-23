Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644721531C8;
	Tue, 23 Dec 2025 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494068; cv=none; b=B/6NXyn4yB7nKkososT5VQx1AbYBbW8KXj+GWVfBI0oUofuBsXKxCJwmYkLq1beBFUQdP3Gie89bt7sH62GME1eH36JLiHjZQ0EM9hgckoU4sEW9OJW3a9ViUmd2w64A8XJ4Cf5AhRpeDZVrM4dzCx4wH4YFWDPhjR6lodiYtj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494068; c=relaxed/simple;
	bh=2MjDtfXLypEJRTDTl8IzvcRwXY4LSxBOkoiWuhZLK/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0vtCqJi/eFoEoQ7FMr0FwSln6EyuveKIPeeOhQGghJbb0EBzkTxpS9HrYHQw5+ETZjTBFJrKYAYAyNKkLde3ahoI7RRkYXL2tjZMja68z7FrlUKyxwvyPMC4vzEYk7hn8EFnWROONEh8Y6cCVlO0K2f+V2WQCygXdgEuF8u9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/xMO7Nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/xMO7Nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2EDC116C6;
	Tue, 23 Dec 2025 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494066;
	bh=2MjDtfXLypEJRTDTl8IzvcRwXY4LSxBOkoiWuhZLK/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/xMO7Nw3t3IKgf7oRNo8bj7RH9qndcM/dAQAGbmZiPkooJ0K4tsMdl+JnfF1FmoU
	 px3VoHsX5JNFtyIcOvePmF15TGIUSD90DN9EQ0sdmmq345AS69CX+KI7FEz6FEpG3q
	 zNIDJKg9jWU7X/ArBmIuFsB1wZs6wNeA7R5p1p7ykjTaKei7TLSNn/b4iR8wb3W/wj
	 fqc6ImWdPssVqoUjrok/PQ88iquzXfa/AERl89HenBCD7OVvAWG44AUOQIOel+BsEW
	 AmV5Hspqhp3BgCCdpmE/mQikQwBQALq2sq4FSS5ccQ0uZt64MsBiJyWJZjcwWoyT2j
	 D8g5SnmSMLvJA==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific compatible
Date: Tue, 23 Dec 2025 13:47:13 +0100
Message-ID: <20251223124729.2482877-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
new SoC specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 86ef68985317..a1f54dbae3f3 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -40,6 +40,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
@@ -100,6 +101,7 @@ allOf:
           contains:
             enum:
               - ti,am62-gpu
+              - ti,am62p-gpu
               - ti,j721s2-gpu
     then:
       properties:
-- 
2.47.3

