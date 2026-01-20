Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D387233D4E1;
	Tue, 20 Jan 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927619; cv=none; b=PehlQLgajmLIvpOtah6Eo2xqGceUptlpYjy6eIpi07KQyEKGsa6t7EZpma9kR1U9DQORjXeULtMi8AhjgVrHZz51TIy+f8aC867MM4K/nXy9B/pPVF/RLG815N4O2mm6IgEykkX7JS1XcDW2+DIy1zHegUX0ern1gUpcgsuFnxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927619; c=relaxed/simple;
	bh=+/J8bN8ZXWd7ZPT6M5wsO8nw9TSIuNFETtix1FidLbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSBaR3OOzt6d2rI5y6iZnfQSd3EzVHlM0pbM3hchRng45bekyHDIPoxtiu28U3la5YulQCoypZXge7cIRALuaov8Nv29jNqqQ9U0tcZj/rVOQtk/BVnOWD41x0/lUe1mcahbBhk+Dk9ffA4vAENqUBeZ3ZeGggN0Ymz2oaOY4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=LOgKswLU; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="LOgKswLU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80A7D148AD7D;
	Tue, 20 Jan 2026 17:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927615; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Na2lG/ZFqQP/kePMDfHzvjLtQoruIDe9Dm3njT0tDe8=;
	b=LOgKswLUf23sHSYJ3wJIV1aXibG8xAeu7nWk4n5/XtxbbxzEecv02H8RNIRbN0TU/2nhrA
	l4o85DPGlhqC/MMRaGJ0mzr7WWT+AcKlVdMChDp0uy4qIjWo3bHBE9g/l6L0vXoAs1169P
	hSYHpWCrzkmkhCG/ziqjWDbxPW9zc1dZ5l3BSpOzg66lJd6gaPjfzCUHuQw7/mcorVVzhK
	nVcvk3cgLCIXi1kY83xAWLbEeqAqzKzJV+oIViD6hjgsdstDvtoMFsOlWC33rdCh7FksEB
	6zcbl702q8yee/NpqS3OULSOJ5tcyrN5hVGU8aQa/772efJeR83+Xv8B0JHxrw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 16/19] ARM: dts: microchip: sama7g5: Add OTPC clocks
Date: Tue, 20 Jan 2026 16:44:50 +0100
Message-ID: <20260120154502.1280938-10-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These clocks should be enabled, datasheet says:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
of peripheral otpc_clk, so this is done implicitly.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sama7g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index b8296391fc696..30193f3bf9775 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1036,6 +1036,7 @@ otpc: efuse@e8c00000 {
 			reg = <0xe8c00000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
 			temperature_calib: calib@1 {
 				reg = <OTP_PKT(1) 76>;
-- 
2.47.3

