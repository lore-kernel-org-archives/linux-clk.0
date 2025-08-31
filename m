Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C8190685;
	Sun, 31 Aug 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637848; cv=none; b=KmzrzlpfWwoIvjMDNqZFcV8AFr8OzxKw7rIcqUaAMt/fmOdK3PHN3rFkTFT89Sn2zSuEqcUQ2Y4EHXV4/Tx09gbbWkspEM08Lgtt6PsrQDdJzxJCKbxBV8F8LmssR7IH9IjOrXt5RJ20jmdjz3LGCB8BmyzVDHotlScrxxe+5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637848; c=relaxed/simple;
	bh=cXBVepA7TLNACw2a5tRnjEwJ762ktxS9EdTlbyYWWyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6uC65eXsSTlIsHQucZNVq7MceJhdm1cnBGPqXHzHbZzyTuMv2ANL1K+GE2cOXQaccnALHpT+n6bVtCy9d4yt/z12WpvJGdP9TTKNifeFe6LmnxJ/6v3gsqZcvZja2dp7U0EkFVYYz8LTYhoedzn1CTyLbIToDN8cFik3iC2x94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKIv9gAG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKIv9gAG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77246079bc9so672902b3a.3;
        Sun, 31 Aug 2025 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637847; x=1757242647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9RhloQd8FyIRUvh/1W1whEioGXbbLiifjRKRWueUl4=;
        b=SKIv9gAGaCGvH574qyZQHP5CDqRF+8AdPU4hCYuNhYUZ0iAqg2MmwZahLcvBMwIPrX
         nWyrbCdgsDmNyleNWJo6/bQHrze+UYudRr9lRVfpbQVO6qnO8sRnRVXqboz/pK109foX
         9tGxOmvQiYyUoHVEewF6Af8Xxbe3No89+nTJth37e2K2xEraWmmxcg5qOdjmxnB4XrYw
         aj/VvKoZUjnqX0o2Pdi+XSjI+1yGyIS6bjaC2Pj0WUoLqqNd0RtyvjmD1E3UOeIRJYuS
         FBrhhJZKRG8GIHaP78nji0wvA3+K7xKAV6UB+pVEduiiO0CObxVETDB8twwJUBn28pt4
         OnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637847; x=1757242647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9RhloQd8FyIRUvh/1W1whEioGXbbLiifjRKRWueUl4=;
        b=Af+EJgH+NXijUyyBYgRx91czaxIj2UCn8FSTJl9eyk1X0RKsXRa+mk26qGIbK1qXK4
         BeGS70+ANcM25NHlbPRlnMGQsp3i5L4CH8hyJ8+XalcCbfCTdpPrSMMG8Uos2wpBnQ9Z
         d+q7co73R7g2+WOOMl78WklNgR/06m0fc5KgRWDT+8SgATphdnI2gYr1By1xXUgDTlX6
         jWQiJCqEBdByuAUVhpuOzLw0VAxyNX1YbE8+mcBTkeMIvbfQDU3vHxV5sj536o2+cqpr
         fzqMjK1qcwDoi+GGT3cNVowEHOrVYafrUcW6KzcDOg+EsDOvjEkhp7o+f64dJoubnoRg
         5KVA==
X-Forwarded-Encrypted: i=1; AJvYcCUaPQlO4Sy8GfF4+zN0HTna0K+IKS7KyJsr27CzFeWtKmmILt84IhbvAB3dpSxv2B4Aahqu365YL9fl@vger.kernel.org, AJvYcCVQbd559YZgNCCMO7DUMXsiIhXyMZY0kHpDR8Ubaio0hgH5E02+LQFI5Q3YpWNyJ7b3jIiG1s04XZXs@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAw3rcCvpdha9A1mieJqBMGNXRpiR8Ow6aHkz8nkt9++7UV8w
	WA8uNnRRuqhIEFx+/cZ1eq93/rWQ6l+AG8ns6PSMT+VKAkP2CgDzMi9C
X-Gm-Gg: ASbGnct2JqV0weW0l3ji5vWme/MhA78XDADc0C8DFQU73/EoY02nx2QGxA99ZlVchr4
	wphVjDbF2l7dU4ubFm0mlIztCMN0Hwp3bvKYryHdOjeRc+uXGZBsWuOk7aG1vtEifYWionPn+Sa
	zZYJhN4LFK2f2sBBgDxR+/vyIjA6QSITm3WAFeQlQFYXjjB0KCpdwePBWmoqQdyq/xeKsEYZgeQ
	DAkofXwOOiyCJfYMGSUrDbIHEWH0CZiwylC/FiMx4Vowq8dI8qIyiW7fW5x5SOPtI33AwhHvhAD
	FDX5WnrkofbOKHcgWPGZ8ml9h5CVDDhw5Adl/mxnTph1veO3gmq6d8epxkl/A8/jXDMA7dk6Nfz
	Ub9XK5KmAnDEDrge+nAme2ErXICMNlUKcOQ1d/S0=
X-Google-Smtp-Source: AGHT+IHJ+aaw5aw2xAtoYYFqlQzNbX+trirXwnDJntQaqfh44rp73111tb3yTPpeEXOyXQHd6503IA==
X-Received: by 2002:a05:6a20:7348:b0:243:c336:7bb0 with SMTP id adf61e73a8af0-243d6e5d4d7mr6150732637.23.1756637846707;
        Sun, 31 Aug 2025 03:57:26 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:57:25 -0700 (PDT)
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
Subject: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
Date: Sun, 31 Aug 2025 18:48:54 +0800
Message-ID: <20250831104855.45883-7-cn.liweihao@gmail.com>
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

RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
trasnfer rate of 1 Gbps per lane.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 0e47bf59a..674a3676d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
 		status = "disabled";
 	};
 
+	video_phy: video-phy@ff968000 {
+		compatible = "rockchip,rk3368-dsi-dphy";
+		reg = <0x0 0xff968000 0x0 0x4000>,
+		      <0x0 0xff960000 0x0 0x4000>;
+		clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
+			 <&cru PCLK_MIPI_DSI0>;
+		clock-names = "ref", "pclk", "pclk_host";
+		#clock-cells = <0>;
+		resets = <&cru SRST_MIPIDPHYTX>;
+		reset-names = "apb";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
-- 
2.47.2

