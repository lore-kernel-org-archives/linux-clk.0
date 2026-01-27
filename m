Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE0363C76
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533797; cv=none; b=ID8xk9ubVUJKL6CEh9hxHTIIdJdwmzlqjXzPERtQwDMhDofRmQcmEBkMgMAMvjEaifjeDHg+SI4OcBcKzeiHounr+azSUbl9z9RxmAYaAiSGZsa1Kge1N4ZsmWTutc9C+TOKHYQ1Zcf65euUOQOPtYU2jFQiEH6QW4ra0nS53HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533797; c=relaxed/simple;
	bh=z1kakQ9LaR6Mmp/D9XparO7zsqYpwomJgOpObaNr6CQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSShk5qvFa1XNeaNLxGvlJagvE+c8gMqkTm3X8iu9Mr4u1GrzzAS+H263xGaQzecV37JAQJ/oE8rVA03EqCdXfUEc2t6fZsI/ibrmMM5GbVHnpwQ6FkyrNEwZjOfVelzSTgOlfktOhN/PiknojmWLLmHWQPwBWKOV7cjS++y6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XkA96BVK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XkA96BVK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0C25DC211C8;
	Tue, 27 Jan 2026 17:09:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFE6F606F5;
	Tue, 27 Jan 2026 17:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10E9119A869B;
	Tue, 27 Jan 2026 18:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769533792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BVCjO3PiJ96hjbVyejrX+9TN3cIt/NAX8/w5F1wcAmA=;
	b=XkA96BVK8WVnRnOW6FNmyFVUCUFlaeVVR4QVINu+C0sU4B/f3vduZBNB64dpb1kjTLDUgu
	fEsldg3gJe9ADryXAS5vEwM+AcwesXhEH7lZaqyvwX6ssh7MuVxR98Vyp5SmGsiL3+fMjw
	MJomtUrwF6CCiQltCba0pvdtPLOhucSpTYWQdJUwETByYhhB2bxmk0bi/2ntEVm5n6C0xe
	pFyRIQWnpf9Ju71pyZyWxoKbr85KlH+EuOKBZ4KpNeVOJItTCY2utRHGuU4w3hdHUKC1qe
	DfDvCXUXB/aaNr7JfZ9gh91OCHA8JTTFY1h7eQz5UUul+aKEh8YBFQGP+nbklA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 27 Jan 2026 18:09:36 +0100
Subject: [PATCH v6 8/8] MIPS: mobileye: eyeq5-epm: add two Cadence GEM
 Ethernet PHYs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-macb-phy-v6-8-cdd840588188@bootlin.com>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
In-Reply-To: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
index 9fc1a1b0a81b..babf52731ea6 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -29,3 +29,29 @@ temperature-sensor@48 {
 		label = "U60";
 	};
 };
+
+&macb0 {
+	phy-mode = "sgmii";
+	phy-handle = <&macb0_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb0_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};
+
+&macb1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&macb1_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		macb1_phy: ethernet-phy@e {
+			reg = <0xe>;
+		};
+	};
+};

-- 
2.52.0

