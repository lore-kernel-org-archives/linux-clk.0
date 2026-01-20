Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C22222D1;
	Tue, 20 Jan 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931324; cv=none; b=HNQv67RkpqxYbuC0TAxt9uxqwBnm07MwHpDP5sqhFA3CkAOFhzEwsy65nDWXIoMDoVecIlD1lz7x3CL/nZ9hDHS5R8zQE7flLaWq3yFvPzhgRZHd/F6yaYwVDFHg84g2fd5KAgD4O8CIzf+QBYnTDFivwo+Fqgo+SPsi7U2MYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931324; c=relaxed/simple;
	bh=7LL3M4/ffFk/vEeEKW3RCEzG5kttOyLYdkUAYHMBdRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEKZCuVy1RE2obKSL1X5ki9hRqCJzVe1Nqp9glduKziEi4Cwjev5YFGn0CB0QifmOidYvAsSJmpB48Ylnd8DUkcbiD8jonbdpCOWHFkktxgsywXeHEVqtS9aj6zlI7KmxJoH9EkCU9KUZHRCGfCL7AXglzZddk4LVXsUkNmURt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=fNeDGe8m; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="fNeDGe8m"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4F55148AD87;
	Tue, 20 Jan 2026 18:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9iLuhBBaWFw/vFGauqBf+tR/cYKN7IjXcWrjMcj1kg=;
	b=fNeDGe8mv6Rlfr8cFOjBCpX+6Qmj8jO2iHS0qT5DPCfu4kLq0d6MoX4LWa/qi7nti2x986
	l86EFkt6kwe9acw/UA0VDcYTZsAmnUy6AcOAxbKwC5x0FHU5eAMA0P36+DdjYJEn+B8QJv
	da9NlyO2unJsV0tgojRgayTkcmCf//0dLZq5VmZ3GIgFGoEX+opu745SyoyOA81DrHr68p
	vaZqnWRhiiKfCMsGAbq+0BzxZ8Uiix5UmKp6mVcCWoP4ZgDgjpYdOlRG4zqoTfQdPEGaaK
	UWxnIk4AYFJXctNntwVvB5Pde7e37dKAylQjq907GDl0GlIGnoOlVTaYyNMjTg==
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
Subject: [PATCH v3 18/19] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Tue, 20 Jan 2026 16:44:52 +0100
Message-ID: <20260120154502.1280938-12-ada@thorsis.com>
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

Allows to access the OTP memory and Product UID now.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reworded commit message after reordering patches
    
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.47.3

