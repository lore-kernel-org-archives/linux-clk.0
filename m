Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644232860B;
	Tue, 23 Dec 2025 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494082; cv=none; b=OFDL1tE+igzdBK9I03tcZ4ExyBaIg4+UmHFUjkF+GozeUifmQEvVCNGX7srOGiLSn0rrgkho2RViNlbjvpb9nw3rOZUu6/+uceN+R5DAvgjpjpU99aqdMfQAr1Wly3889HgDyRl1tKqBSr8l2mM8pt9ouEwAO/rXRswybFQNeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494082; c=relaxed/simple;
	bh=B3xjfPRKFS0qoDeFoIRFLfaayzMur0aXjaMmej6M+fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNdQpELdNqzleEMErPnuasdi+vbKQ2D7BI6MpDKrIr/ffv75xW44aemgi4r633vvoxIQp2PdHtasjEpuvmTolxMK0u+sc1VxgvZzw8ov0mhbd61Y/gI2OMroa2J63/WeDebAkiwneDENy37pt9qVWe3M5KFTovV4f4XJJRQe8l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbcY4pX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbcY4pX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8E4C113D0;
	Tue, 23 Dec 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494082;
	bh=B3xjfPRKFS0qoDeFoIRFLfaayzMur0aXjaMmej6M+fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbcY4pX7UDRBAH4ABtafnWNjBiGs15KK27AUjeMprV6VHlaJScb+kc0gkP4pq9L64
	 BnExPDBzCuUh4NNdaojK6q9d+2HvCjUKfhxmXNUCdPkP+/KI3dSk0KfB9ZpP4+xQPI
	 6+aBqjJh5BBnRhixRWoVMjer4IH+31iJXIta72hIW+FGgJdn/97wLG3cumHLXPvLtt
	 nzugW7B58tBFoaO4W8iCsxOCpo8GKnunDulQoMUCuzjDlg+EdQgbHieFvJ4zT4VGPo
	 FXcaVYmCJjWYzWcw4/vJbqqNiRYs3ZWm6gohw3+3z49F7IwWLQKvxpKRSCSsVDuRAg
	 oi9eh0bpFPHnQ==
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
Subject: [PATCH v2 4/4] arm64: dts: ti: sa67: set the GPU clock to 800MHz
Date: Tue, 23 Dec 2025 13:47:16 +0100
Message-ID: <20251223124729.2482877-5-mwalle@kernel.org>
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

The board is running with a core voltage of 0.85V and therefore we can
clock the GPU at 800MHz.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 7169d934adac..0c7f3e10a150 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -292,6 +292,12 @@ &cpsw_port1 {
 	status = "okay";
 };
 
+&gpu {
+	/* The VCORE is 0.85V, thus we can use a faster GPU clock. */
+	assigned-clocks = <&k3_clks 237 3>;
+	assigned-clock-rates = <800000000>;
+};
+
 &main_gpio0 {
 	gpio-line-names =
 		"", "", "", "", "", "", "", "SOC_SDIO_PWR_EN", "VSD_SEL",
-- 
2.47.3

