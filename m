Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A530E0D8;
	Tue, 23 Dec 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494062; cv=none; b=NJ/nctXX7F03oGyDWCevb2GeX17I3yFHlevPRrmCoCvIW6jXM6L6MhmtyaWZEwJrm8mynrV9Ko/YD6oMWVaD/XTwYVIHUJqwm7G/OPPPe9RtCTvkT/wsAh3wjCIhunifs32AdGkHVhQ3SzrpFLRRVyCupqPlRMFWw1UJiUqh+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494062; c=relaxed/simple;
	bh=vIDLcNDvZkN5LTCFnFI3qztjOOsnOhIPYziKgleG5U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXiBa2yMgO+61Tv0jijTozbwGfDtYaO0DtvguzsP6c0L3Nwkh9XUOBgg3hxqy0+fg+RrCXPacPWX5Q6MGs+jrb2GuPW3wlZLEePrcpgeyzUj4E8H1sn+jxnNLNJgXTBmJ7/SiUUToLTy9gPHa1hkgBgebgvlPbKNJoiBcfv4V1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS/LYUGG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS/LYUGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD6EC113D0;
	Tue, 23 Dec 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494061;
	bh=vIDLcNDvZkN5LTCFnFI3qztjOOsnOhIPYziKgleG5U4=;
	h=From:To:Cc:Subject:Date:From;
	b=nS/LYUGG3bQWx8kgoisYWGHKKh0DWJMRI4/JUwCUzxuCqJhdEffcw8bQ6NJDCLArK
	 +yD6VkIsifDT4qNnKcj9Y318Gr+O0v8AdqXcjAnSPubjbv3c2DSqAw/x83DeYTgl8A
	 cTuhu28oH0JFPZn0F5NDPomxfJfbHUnfowah+2KMDXlDg2Td4MsdMTvD8XXuK2xDsI
	 azj/89k4Qgct2+VIjwZKvEweKsuNrW37HxfPtjBMb0FDBRruLcHNo6B4ek8cvv4QT3
	 /A/B5HnDGrZgFKBHz9thgkbQkT2EyxyH1qB/r/kDXAiispTT/+youTbGrEvK3FeCHe
	 pWTuHBusy9TSQ==
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
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 0/4] drm/imagination: add AM62P/AM67A/J722S support
Date: Tue, 23 Dec 2025 13:47:12 +0100
Message-ID: <20251223124729.2482877-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
In theory, one have to just add the DT node. But it turns out, that
the clock handling is not working. If I understood Nishan Menon
correct, it is working on the J721S2 because there, the clock is
shared, while on the AM62P the GPU has its own PLL.
In the latter case, the driver will fail with a WARN() because the
queried clock rate is zero due to a wrong cached value.

This was tested on the sa67 board which is based on the AM67A SoC.

v2:
 - collect ACKs
 - rebase onto latest -next
 - new patch which enables 800MHz operation for the sa67 board

v1:
 - https://lore.kernel.org/r/20250915143440.2362812-1-mwalle@kernel.org/
 - Don't set the clock to 800MHz in the soc dtsi. 800MHz is only
   possible if the core voltage is 0.85V. Just use the hardware
   default of 720MHz. A board device tree can set the 800MHz if
   applicable. Thanks Nishan.
 - Also add the new compatible to a conditional in the DT schema.
   Thanks Andrew.
 - Dropped the wrong of_clk_set_defaults() and instead disable
   caching of the clock rate.

RFC:
 - https://lore.kernel.org/r/20250716134717.4085567-1-mwalle@kernel.org/

Michael Walle (4):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  clk: keystone: don't cache clock rate
  arm64: dts: ti: add GPU node
  arm64: dts: ti: sa67: set the GPU clock to 800MHz

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml    |  2 ++
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts |  6 ++++++
 drivers/clk/keystone/sci-clk.c                        |  8 ++++++++
 4 files changed, 27 insertions(+)

-- 
2.47.3

