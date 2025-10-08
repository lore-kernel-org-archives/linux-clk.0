Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCBF2F747D
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908702; cv=none; b=B4i6G4x2lB1hjRFRSEmBwBnuTFabWg3dXvuLLkjTq1gbFpiFwoLpoX/U4Gv1Vi6c+MYawRtujJCKzDazAiieLexQdvGx5BsRM0c1YWflkwMFjgC7snc+0F3DwCPXwsmqidyGzpQnpO4ZDFIib3zBMQggn+rGMHhxyEiAr7Enii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908702; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rK9u6U0xMWoq85tQ3lcjApxUOgVbSPF+hJOWpPwULLGTTgGcQUOlYj+PsoyvkkQWhLDLvODMmirK0Xcq9mFDQxtMHndFffyOewgwaKOUowWXq/VGdf8L3OO/VTLdIZxYe7XXYtPmf8rLVsIVRtM89rtGZpP+8KjE3jdjzbwl1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ectvjZni; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ectvjZni"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7113076e87.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908697; x=1760513497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=ectvjZniNBnhT5DnLSpNzu2/yyZUGH4x1NJpun4RBY20zR01dI2K7u6ermdYckI/wk
         rYw5LaxAH6MXNgla5ggqueDGY13PVw3Q8j9JblrLiz3eDxmIws1G6f48rgmAjbgZJKBT
         RR21vzwQpmYU+8rewQCRyicae8/IcBdI96JmwOr+uAJnQ9Z37J4nH7jQjyqHPc7VpRo/
         Vo2VGDH4VjVegd4OeifsPcvEwKeg3n0BjdWNAPqAZYoqC3N1mMTgLbVCTvhcbxpxh6bY
         0LhVCZNCwsH/T9qDcdGcLZfqXZeiqG7YFaOIP6ylxTXnQ5DeKJT/nkFuuUuD9d3ELiO8
         +bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908697; x=1760513497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=ezxzktOSux026xpeD9LuY8zx8RoYktgiWc0q4UsZHT2pmd1Hf1lxJvKyvliv1bD9QF
         3JfZ6suaWpYElZXToqi1wSX3v7pu5emibDqM+VkYvlqr4IusLs2VSznLWqRAQOZufPA0
         RnbiECDTFR6LDVZe3q4a2ID+6WBELIAH18J1bUwyyItTHrPFhjMnAU70BBmZuU8CZUQd
         YnL5ebod2KMA46eZBMwlOBHaLZr8vRsQbXmeJQQ1Lhv8eSVkSelSVt+nhHpmSvODlzlX
         RROv+dJwOswJHkonbkGAaaE7o2Bhef8jioGuoaEcyqQjuyzSX87SOFLItEITz7zJLJya
         edDA==
X-Forwarded-Encrypted: i=1; AJvYcCXvDEuAQA0NtMJ3CsHtNfHRxeimzbYBgYGH8PJu6ILp7ICSTp7LTLQjgJJQ9xf5jWKb1K4ZUDJ3KO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+beTh4LTqKiE18SULm2XUhBySPBTq8yIgUfOUgpps4k4+tZE
	qr77bCTq1DaxldAK+qJQa3x0vKyaO+JngUs61LX+SW00f1bIQ4I5uIQ4
X-Gm-Gg: ASbGncvz2NbxFGKWKjNZkDGmMnCMkpKEcwGSfg5JlzkftOyTtWPdRIN6VRkirIcrfWd
	DJPV1WK3w2LL/BV62cDzkkwRyQ+f4FpgEczMeGL268KJ+x3SBkdS2UIrkKYRRC1rW1RI1RjcYvd
	c+6bpnILvr7NvNciVwrdD9TOSCXPLrSPxy7aGUC3HO/drhrUP9/ocg2cQxUbayE8RI3aRFuwUrU
	PuCMMADolxE47CmHJUvXsynb9+9xqSSfjOR4GvqpOckedM4qjoM7wOfspHinow65ke/FGbO4NIZ
	XDLGU07d9LgpuILbaDhcsa5xAp8CZ2PlggBbG9edoIQKZUDj5bm1KCpGXi7Us0dy2HQQcmn+9JI
	VPfWHR872Bbl4NvL8jAckC1QvYSykpp+8pOSG5A==
X-Google-Smtp-Source: AGHT+IEjBzSywNMkFOAbwPQ/jDGY7x/5cVSXXn3BDGuPeQ0omEve1y2ZqSoYQ22QYGSRP1UJUPETlA==
X-Received: by 2002:a05:6512:230c:b0:58b:5f:d97 with SMTP id 2adb3069b0e04-5906d896c1dmr693727e87.2.1759908697218;
        Wed, 08 Oct 2025 00:31:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:36 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 14/24] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed,  8 Oct 2025 10:30:36 +0300
Message-ID: <20251008073046.23231-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

