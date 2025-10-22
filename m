Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59134DB69
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142916; cv=none; b=i50yAGsuZ3LTmUM3Wb/Zwpj/AR44Wdv8F54OTH1RrZaU9DBTE2/xK71tRxYOAa8l50OdfodT/iwNycSWl+FLbASp1+vNdLTo1Dgbg3AtrCylaQREEI/U07regvDKyVoiPsMsv8JDa6d7EACBG+A3RZ2a/jaL8+GsFis+uI/wJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142916; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouIDv6Gn+OMTACfviLUNw9yqRMHsNPJ3Ajlw791IefhvF05yXzdcOEqVV6l3S47UQ6LLb/UiS0UMokrZRCBUDxB3ws0/IQgqK9t1SoNo1eZcv5biS4w9rl9ZqlCE9BPbJbUaKSSvpmpUo0X52x398ooNbdu2/6DmuLxslpolTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2hL1pfD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2hL1pfD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6338663f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142907; x=1761747707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=c2hL1pfDXaQ7BMjEDgI+CWfh1L/rZ+C1/hq8BbB/F5WSf1qIKQoA77SV7hC+sVTuQl
         IJSZCBqQbU8EmkcXQPdAcZFloz0X2sSKAxrkpiDdY360s/7SfKGywmNkZhVI/zYii9SQ
         BV/DfoaXlrOtZS1R9LadVGp8hjA1eDj+BZqzmoixM/zFS3Ir9fow8gvQmZKvB77s9Cja
         82D5L9fwEo7c7Law/gDpzKzx+EgUtNbjlqHR896YMWjsvYWx/o5nvUNGDP0GSgl8+ZE8
         31xNtKXkJX2O4X3epyG63+VG+UHAmkKSRNhS9ttio+e3d1c70PRYCzDJk0GnHWlTVFun
         +eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142907; x=1761747707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=wUhjqOLKPVOORdBZ3cAmGjY7qGtfZHrAcTVyYANK4jyQ8f3ys38vhslaoG52AV/3tK
         5bPtCbuFPp73n0ujD54J6LzvYV8ptnYyaAYVQO4gD5/KIvGkEGlqKS0vo//1CVPyNYc9
         5zh1f5LVYmU1HugfBOfzf6r8zm08JH/HCrgdMQTA84GWfNyIiQufl6nFi7xbbesgkkcY
         cW31km5aIZr6pDLQ6T1JEtODHmWevMlbmLrg6WoIjwLk89kwtUtSsK1aWCQ6WnB0n288
         KA6VvMgJG7X5pIqA7G46dumz0mEQSU/OQ3njctQbpoLBcUCi7AS/h88gnj+Wj7LFYonS
         hERw==
X-Forwarded-Encrypted: i=1; AJvYcCXZucYjVeggltNP3NdU0Iivuk7etacrfHYs9iVG9+10WiIHGfngOnV+tIhD7TMqGyGqrxQckwrrFFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+LTfrUdiqo8mlFOFMrlf9OiYj87FNH96/yYeHFmNnRgs82IE
	ic9Bxd7F+yCnZ5pAlx3xSqNc2C6L0iPmbU2JTezSRFb5L5yYtnxnC87C
X-Gm-Gg: ASbGncusfsNPESJiCsl1y4EIyMTR5FyYszEkK8KQqi90zu/ReVHKqmh5YHYe7qWhRy4
	C86CsORP6aASQf5t4CsETl4taL9IptL5IhA/vL675wFHcFqZMHjRnDgNL6N8E5oTwWTbnMd8h0h
	VLghtwOJh2bo68q4ZoUHgHRqTcyAp3RJFW8pk47ieNs7INrxvXZYjiR6vA/zFRpjUfEkakfY1/W
	/89g/ZnUQMwhK2hvW2O5BrGdZsX2Q4fVzIl6hdomDhZ2K8H2tJcDb9sRhYmleZ5TirP5dNBld4P
	hyU5UvDw002GiIFdztQqVTQIY4Fn9s391S+Ot9hT1ObJ4jOKmM4gIMN1+59aAKPwflasIEnNSfY
	lL6GcWLjJ01v+T6aN+D044U08WOVY2sA7HO2IhmdMqQFTkjZ562qPSQ47zkWnHYEEFEw=
X-Google-Smtp-Source: AGHT+IFuKTY+6VlzlctM2Ho4Y6ooXPbr1OkVqVQk/ddAnkBtDFDjaUEYC7CuSZMpeeIzVLphs/KiOA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id ffacd0b85a97d-4283f7cbeefmr11118870f8f.29.1761142906649;
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed, 22 Oct 2025 17:20:41 +0300
Message-ID: <20251022142051.70400-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1

