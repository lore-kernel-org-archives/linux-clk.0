Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20506155C82;
	Sun, 31 Aug 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637875; cv=none; b=BfduypIgEdNxooaGe5U2DGd7h1uDnDDtD1xI2ElTOQxjbcUQ+9BOiilwJeQ5Vfu2N5g39mAnJCYn36PYJZTArPgLfevUWYSM7cXB3vquY+hjfiMwauDF61HjKGj7dh0gqXQVupJxBmeD5ede80QkQ0AvghMVRgVfkr6bPl/gyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637875; c=relaxed/simple;
	bh=wpvVQezoeWpH6NPhgmSgFIYhBL5O1By4R5rdCPBIsI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz0rE/4LT/leui9dByGvHCoa+svu0QGdYXU/E9Nbyj+fVJVCA07kLl9pnQFH92u98SYEW6ubXd0oPUmb5DOImnhOjKHjxDi2LBpXv/ytC8scUV+uVpnuvzcOEYyxriTRcV6v7/Q3Z77VFL+NO13/T7L81k5eodKFOnqZHRwpV8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKKA2eBQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKKA2eBQ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7722e0ca299so1384160b3a.1;
        Sun, 31 Aug 2025 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637873; x=1757242673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLOztf0dJob0Wz9AqRbfa8xvCCr+6HbtB94Bg87OFLM=;
        b=bKKA2eBQBEqqtEot1brjuF/7mEXOil6QTmZ5rYUsWoNppeGEFPgJn7AQkAvwuOvnYm
         DNuGtOTmf3fBrlhroRWO4fzCa18cfUZs4ZpoeQIvusJJPBcyf5gKPj2mWG92zL5HAqn+
         Apzm2jKkcCANtPNUMaSENrKMJyRxuYgiuh2b5e2wbX0lJ78OUDGo/yf5YQIlvWneI5aj
         zEIbJZNFdjFhVA091SHYGYidLsS9QuiZnT4C6C1uS2sXh/YfgcjJGltMtL8vPns67R/B
         YhYh3Jds3yBZ0tgFbTHyxE9tkihYJWAc9zpeOPWy8tJjfPZuoBK3HdPUu4rXjrI0tgrB
         VdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637873; x=1757242673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLOztf0dJob0Wz9AqRbfa8xvCCr+6HbtB94Bg87OFLM=;
        b=Z+jPNYl/mMe+/OZjDL0NFIblOu3Ek4htWjpH6lOvbIgQIbqJROH7VvpsAx4SfxNm9l
         h8srsGyRZsoDas1NRn9fIeWFoU7zYB2xsHroK0mAzxrC3OqUMgsq96y9qwG+SZFi4vuO
         6aGCRYqdA2R+DaltnocSBo/ee+j7nKvn7JkvzkWOlYmyAfc77dct2nAiCLfyij23BGgt
         gVJDg7BsKHVyX3vDeaM8acUlMjhkTa6Oq5I+1cM519uJIlWn6PGl3Ac9zvd29PExvy+/
         XvJkgos+hyeo+fMXbor8XZ+pT4pYynZB1FE1JSpxvBmDcdEazl2h7TSfYltHbF7FnwMs
         wxcw==
X-Forwarded-Encrypted: i=1; AJvYcCVaoF4hZYrYI7s+SBUeffpEeyEfbxpUdkW8L1eL34gdO/rsCjNi3Sq3P2WIWY7QJooinZp0NvmUfNMz@vger.kernel.org, AJvYcCXjhz0PuWtMtUBruv8CAv8yXTT6bCAT9D4hI+RhViD6gDd5Vs8lqEnIug+cNj6/s9Vat0T7JXseKz6n@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbuuE2I80vw13/QUpwanxhH4LJvMGF+lAo2KGOmyVFPNQDk1F
	F7aJfnel2qTbf2h+rUk+aXjXYSu+0jb5GGYGtQL3m2N5ypRpsXlvkH21
X-Gm-Gg: ASbGncsYA8rvG3PAvkCIXjJb3Lel3W71TjdHnkg17nDp7j16/WMxALN/ZNoluJ2lv2n
	WrcFOrfJmHwF3KAqGXIfXRTjRwUqRAVh3MVGZNp0ARQ8Wc817i2koDzOI6/4JjgIm4wT7QjJ2S9
	CcCsiZP906ZQQNj3AIlmiclinz8+D4Nu4abZLwlULXZ7i6ry4JvHSslIyO93HfFOEil5iMa36r+
	bKU2YPSumKa70gfuxVijTjJkjsekp4GKTqAOQcoPwfyFGeJpEtVYzI9rFeDhiRezH5hpVs29LJ1
	dTiQ+qqaN7Dvd6WnDDzCg6bl0m1Mf4Kb4zAXF2U6x/+9jqOFABX0lJdjxZERp3UGFOsTTulVHmw
	GSKK07nBf38T6aAf2ZrM8FCplJXoVXj2QS1MMZQw=
X-Google-Smtp-Source: AGHT+IFcnaEG9C5JF/FXFKuK2oaDx4Si9HMfxZu5+ntpUnNLfkk/5IWfmxp/YZe6PoFE7zQc+vl/kA==
X-Received: by 2002:a05:6a20:549d:b0:240:387:d10 with SMTP id adf61e73a8af0-243d516d7b5mr7539046637.17.1756637873294;
        Sun, 31 Aug 2025 03:57:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:52 -0700 (PDT)
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
Subject: [PATCH v1 7/7] ARM: dts: rockchip: Add DSI for RK3368
Date: Sun, 31 Aug 2025 18:48:55 +0800
Message-ID: <20250831104855.45883-8-cn.liweihao@gmail.com>
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

Add the Designware MIPI DSI controller and it's port nodes.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 674a3676d..5226b7e6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -875,6 +875,11 @@ vop: vop@ff930000 {
 		vop_out: port {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			vop_out_dsi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi_in_vop>;
+			};
 		};
 	};
 
@@ -884,6 +889,40 @@ display_subsystem: display-subsystem {
 		status = "disabled";
 	};
 
+	mipi_dsi: mipi-dsi@ff960000 {
+		compatible = "rockchip,rk3368-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x0 0xff960000 0x0 0x4000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_MIPI_DSI0>;
+		clock-names = "pclk";
+		resets = <&cru SRST_MIPIDSI0>;
+		reset-names = "apb";
+		phys = <&video_phy>;
+		phy-names = "dphy";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in: port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in_vop: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vop_out_dsi>;
+				};
+			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
+
+		};
+	};
+
 	video_phy: video-phy@ff968000 {
 		compatible = "rockchip,rk3368-dsi-dphy";
 		reg = <0x0 0xff968000 0x0 0x4000>,
-- 
2.47.2

