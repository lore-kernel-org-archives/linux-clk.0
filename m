Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3433FE17
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681820; cv=none; b=awCRcGj1+zF1WwiT89aTBFHWnVhkRBB5YHJgGdLL1Ah5W8OhCwbBJ57chh9HKe8XwkXF1LT8k3AClQudGF7G6a2xrMIiAmpsrA8nhKUP8VRtHCcuxeC8wMiHHZEP3hq60Gz6xgRZcG0FCY17s8zOqDOz/ejHYerwBpnCEHIxVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681820; c=relaxed/simple;
	bh=v6FdTaM3/9S+cgZOR/jP9oZ2cYA4WGpZsxblMxIWwD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V09uXaNSLmdMffkah4asf08eTUCxK/4sHfjF45r/2eD8Y/JEzJDcf7u6qu+YrZMLdPrBdIIykvikU3PTV40cqDnFiaB99+ci0Ll9ZOK+KGIheelfezZeHr/n1eJooDc0T1mJTGLcbfEgcDWnz587TAi4m62b1P0q4bVjbGqepBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4OwQLz6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4OwQLz6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so7998555e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681815; x=1770286615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=E4OwQLz6pVC+lt8Km7jfqv4sY5gYqqp4NjT/S3YpYZSCa9irLmoW2q5UeZ/NEeQwGg
         mYryTs0i54Q4kBxSt/quLpMYQ5K0nOhIfZq1zPD/7ZFoR3peeSceT9OodiPNBHUE27Sc
         L967OHZG2ru3E/qzk2Hx1J3nwT8IR6rmSRhgzymxroRTSIOtbfQJ5KIc+gCUFpYehtP4
         0gUov2XvhgVgQuG2C5oyG1K+o+aIZ0SdiSfLaingRu49mu/SEjZzYkcAnkKVu1WUjzDp
         M0ez2/D9qRxJZEAg4YklR6wgSx8wGfoC8XQZV1TCUK6SkNzBzXj7iMGlcUx9oD17ekqe
         S5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681815; x=1770286615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=QJKRor3iBShkrulytIMuatEFZOPibjpqBiAKEmEvkD5rVVfOYMde+0ZEhpxVOALAD/
         kvFe5eWSVDkUcz7V31hBgNEpMlvFkkMQYNoyZhKnmqLaa9US+x5vTfC2IULkT5tOKFvO
         1yAQR6/cOle1Tt1ZNzCdgLZPHkydBd/uBSYPTaQXHutsUlYaGc7zqpePwN6w1yKxu5Ik
         bHs5MHlDeJYi3fVA/gpJj9eOWszeCgBLokNv23zVrlBxmEaFTfEZecGHNlO084onRIv7
         YiWlsMCC0F1kTcOWF9t7eIMy4RmckG1ybHaBPdLzHArdgpqodEoWbRI+ejbvnrLrunvZ
         Nv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/x2glCoiTAxnDqdee5Zf7cyLEopj75ZfvDzHv3nUsgXugDjcDu+nIdRsGqsObduDfkiqCQHoJEV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWc+TK3YO73hsKCgJN69ftwf+/+9gVlhdM+HpBLdD3eGBNVhvt
	Lr5Vw4AEYoPu9WoXRKCqy2g+p7KmLIA+I51QEAiIRiZERBhsHFmGZYR1
X-Gm-Gg: AZuq6aIh585Q3/1iuqa/CCCwR8ItcNyitquJ4dMdh6CQltXcf6ZbIRGcNFKrGV3dH3K
	PfSb7SDVQDJKnkAKbOuXizphjjcfvJR/IJIgDHLfhtCWHNF0nQYXc9U1JuMP3PDiC6UJRxQ1mBQ
	O3nsKGmxLZePlWZoimMIkH8QXbjvKfQgmCPoCKfGIZ6vWIJCyWahAtHb3ogVONU84+BXDddmptz
	RTb21oa6QOoepc1MM1w+GDH8Uqb/bxxRY9tleLyeLERzwLWHJc8ElgMHDgmY1ogv4+1DpIAcM8N
	ZTc8si/EMReFXV3uPVIJAYvLZQ5BoBF94Cy5y6O9jwXzygU0yrhcuiWfq8NmU2C4e/ALMfXHdF8
	/ewFoNBNfSgjQmMR6U2xPOI3n87Nu0fySpar9/3x0lFAJv5vvfMXOfDaEX+9G35YUEYyldxyqms
	z1fu9hIJ4FwOERklNF
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr91237235e9.34.1769681815107;
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 7/9] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Thu, 29 Jan 2026 10:16:42 +0000
Message-ID: <286fcc0754de31969e0d856a075b9de97b28ed86.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 231b118ecc62..c6b042ac9c36 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -181,9 +181,19 @@ sysc: system-controller@11020000 {
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a08g046-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 232>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GPIO_RSTN>,
+				 <&cpg R9A08G046_GPIO_PORT_RESETN>,
+				 <&cpg R9A08G046_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		dmac: dma-controller@11820000 {
-- 
2.43.0

