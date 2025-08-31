Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E816256C70;
	Sun, 31 Aug 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637827; cv=none; b=DhxzDYeRr4Aoy06tjc4cKscWZ5ogsReh4pQZG3nhp//uqmbBOYZu78a0b4H6xDJ73LHIJ0jBILXf9LS7JJaqtiNUmQN/DHSsMG+acbiljEJZnXWnyirpIpYyNchIq+nXZlNYiwgZgHLo3kfh6lODIbVOd7TWqF7rctggYzUo5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637827; c=relaxed/simple;
	bh=BnU5SB2udRjPoVNFF9aQL0ys95wrDMywMzhaJP+x3is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfwMVL0nzczTPWYzz8TbYVYhuetFlgIu/W4rlnfOz27nya3gpXoSyxl6SyB15TTzzpNBrjNspgWgxTHFqCb9+bZrLvK0ES8iSqwDAxeQAHkmltDyc68Gqaj3kuiTuEQi+0BmIL2hguYW4YoR78uRJ48Ws9P4Nl7X4coYBvhDTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCiYfb9+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCiYfb9+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7720b23a49fso3826238b3a.0;
        Sun, 31 Aug 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637825; x=1757242625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJwQjaeE93qyQOSenr3zanPFc1womAA6Vk4p8VoV7Yc=;
        b=VCiYfb9+Xuf4XMu0VZ4GPXhRHz0mjIadd+Ih5iqwYMCJbq7LRkFshT0/xa0aFsXwTS
         aPCoDMu7bfE1X68vwQySXoZB3HjMpyD3puYPh3jEP5X2LIv7tjmIb3o8Jyn1kDj8uyzN
         Its3kfbW3IuEQ6PHV8VM8zNNbkWDt6uXVX1/5mUAb9/+EmdXuw5UwmGxmOidCHtD2zj5
         u7iYW+lUYpWQ9M1QrnPE8gR//P9a/7Y15+PVoJq5Kj0VOudQBCpNzrMhbyUteoMAPkoR
         IiaJrvyDtqLehK3sPRfn68SKvjmmcgGmuQ7tMEExbb8zEeJ1yiVku8+NndLXBNmZRTL9
         eEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637825; x=1757242625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJwQjaeE93qyQOSenr3zanPFc1womAA6Vk4p8VoV7Yc=;
        b=hiDO9i39yVkd54YqyvLezzGMTCxxiXDPKrTuZEvc8wIu73qgyccx+h0dxkOaKpFn8c
         dHx67z7vfiwtJb7BCC6VW7eYZIeROyE1BqDySqzaZzfbOvT2gHe3QgVKASuMQ5yuY5zb
         qhnXW56MXqkw6GH/rVeOu8P1asA6GSgMpmpdgFz9dkLmO1+ade461+OUVujhNSsysbam
         7RTFFrCBUuKHrgJtc7fRlcrBr16RZT1jYG80CLVUOPYlmJa3Sh4AXdd1KhDbOtltSDE5
         JbgPns8MJfEK/9Ud3s9ng/9kLPEXRYhrrX/MxNc198cb8CX47mzKt0iOW7axC+j1bTmG
         mDxg==
X-Forwarded-Encrypted: i=1; AJvYcCUuFj9vvrAkBRlER2Uz1tIMTFYnz2EEpd5d7zt8cUQIVmEQcUDPgmPUkWPIe81jkHPZvMrfr5H3Vyb4@vger.kernel.org, AJvYcCWxC7+teniy/0cFUwRHbujPsMkEDgi72cBaJ55jnJxgndC3I7mknaqGRYBDFMZlswVSvjdzV6iAWUz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyce5PvwX6ogCIKqAIl3lUqswpQXh22FICqkBLezOGFk+z+pn3b
	GMYoXno1ddowjYztB7DU/KjyH2aR1h/88cCWJhFMlfX7ZUl1wBff2Nwx
X-Gm-Gg: ASbGncshe/3NtrM2jGz4oGqClqsW1CViODaCYDnIj0F+fLlmyQa/8aN/AXuS4wNlnIk
	wCg6rXKoZ6Wv2/o/bItHCAstO9EYxA5aHLc+ik6Du6p2FKvx1Wx+mFJSKdGkL5sybGfcyujhooQ
	Po6AIYOGIqh25YwMA8BHfPjpiXD8Hi+4QLcc4pg7AV+DLGtHlSe1TSCOcVGZGZGJzNdoSTbFiAx
	PpqcONgZOmOxHrTKMiL/i5OlCXWqAXFletHd5oO/j/qT/oHTBIpSJqzXyZjbs7atqXz69fXNsdU
	qSn++nVOfZ1NTGibvbdm8zgbIzCDGjUiLugDEfSRc/7G+4pQGkGEFt8nMC6ZhRF59QQNw+zftVs
	PHx1l/FC7xpKtFKF6YhYRgswCeWzeo+NPk/gDm1Y=
X-Google-Smtp-Source: AGHT+IE8Bmh1kmOPzle18/zGZBPiVjKeOm+kyr6BD8Lxwfgl78Oa6KVB17LD/Katn4sZOo5Iv9GxLQ==
X-Received: by 2002:a05:6a20:914c:b0:243:bf79:b121 with SMTP id adf61e73a8af0-243d6f7e67bmr6316571637.52.1756637824875;
        Sun, 31 Aug 2025 03:57:04 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:04 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
Date: Sun, 31 Aug 2025 18:48:53 +0800
Message-ID: <20250831104855.45883-6-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vop and display-subsystem nodes to RK3368's device tree.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 73618df7a..0e47bf59a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
 		status = "disabled";
 	};
 
+	vop: vop@ff930000 {
+		compatible = "rockchip,rk3368-vop";
+		reg = <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0x400>;
+		reg-names = "regs", "gamma_lut";
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		assigned-clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
+		assigned-clock-rates = <400000000>, <200000000>;
+		resets = <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LCDC0_DCLK>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vop_mmu>;
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+		status = "disabled";
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
-- 
2.47.2

