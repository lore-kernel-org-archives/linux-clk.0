Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5C220687
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317461; cv=none; b=QF80+UCQK9xnnAqaYCTVJV6QFnkhWRiUBhbjfCCewvnMz0ArW2DyvRqyCClwyp8R0zVtq6ceSSUc9XY7H9v2uU/OMIF8BhPVPBIQ5oW/2nSEfHgOWddpdBZXmySxNE0mUPmaDa/cETey4bu1mR65ejKN/YJRvas6JXq2iAJX+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317461; c=relaxed/simple;
	bh=I/V99haVL9JoBdH26cf+SF6eGZu4bFba7hgTA+LWCOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4qeH/Na3n9P2YjmICX4F2+glfuMRau2C9IJEnRSHwy5tG6lmS9SHrlnACpDClaN5X2FlVE5KVprfBycM3kpuOUO1m09cmDOA7DERaIanqVp2VL73tSg2xHm1q4f9hs0HxDyhiwa0WEpx9LesMy5wWwmzOrJYM8A8zBiWCHwApA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+zBCcdG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+zBCcdG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so275810a12.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317460; x=1774922260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIXrKDA73NF+pZizlSPKEVnOH0GBazyacpmOOa1fU90=;
        b=Z+zBCcdGkMFJPJ+mQpFnzPTzLL1T55BmFW8k791Ui9HIz1nEab61r90qHky0IBMtO3
         vmkZu6K3+UyOa2Dh9Tax/CxabARLtVEQEU7xYnMXZz1QWs7UWMFZTIved1TSwhNmB4xt
         zc64GslY+f+3xur5rpqvQLBEPHqNe50tJo+Popal7MNO+tW6UYch2QzG8FJReAxrubUM
         AJV26ELNJfLBnpzkLHFgKIUgdNYXVo9+YOivHMVde0nnMLrrW8CFYL8t+tHcO/b/ADEB
         LHF/clm/XTa+CiUAw4ghX06uyo2nTDvatQJF4lVHQZWEvHwyhQCTCX1HWYnfTIedeCEF
         YbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317460; x=1774922260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIXrKDA73NF+pZizlSPKEVnOH0GBazyacpmOOa1fU90=;
        b=NkXduQbUJ7E37PRBQbJ3ef9EZ3Brh0De59JDOrheC7/v7M+9f1vsDacU2G7BP7nw0x
         DubRRbcntcry5whqyL+MosbqvOeuj6HQcngPq1XxU7G5Wcz3MoAh2dDlyugUG/7FQM+Q
         wybsoR+YMfIvwdrdzE5swX7Z0rzMBRVmZI6rzzS9opYt/cSzdla80EMnAR2jvys9xYUX
         6t0gt9Qe149UzQfkDw5NYU0m8Qx23dM6yXlNTW2JELMgrjCoj8HSS9Ka8am7izoozalH
         eCoeUTMSi4uCJ7J4w3oIDoFS0ba2uK2U0VSlnWAyXZjEB1fAALAtDnNIiWUuFtgF8tOg
         SCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWo0AOrhe7ZS2kPFcv9BmMUm6iQK0f89lQbLCa6ZwRwDcrzfiQJkCx5h9TqtpC3r0Id8ra2CiRFalk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuLNHurivvMN1jO6PJOdyt2RVPzdyIG84p4Z94S0J1+GaKQG1
	uybPDcRlWFOA4aDa3bl71+m62oYgT9L9muE0i/1j5Mh7/ABhb2BqjfZO
X-Gm-Gg: ATEYQzzuPJxWX2VCBXGx2tjRimqg6boWZe/ZJwFwVVGvERKbOdztNGewTWphyo3cWbo
	IppLuxZx2hCuZkDv+AQ+Jn3wp8O9lOxfdRkTwTJQXm+BLWxLtGETjLvwEepOM+gAbuDqs4+JTc8
	yL6RdQnAw1x+sYbLI/cuLaHrA9fpzKqmXUOWNWTthRBHytRMnehP8ysK8Evu6ttmdTKZxd+ofWX
	FQqFPSKtkHBpBJxU5BMssLTnhZxg00GAZ/rkBZh+X69W10UPcOgnIKgqdvRhstxdOG6L9Noz2E0
	oy6qs6odWIbcFLaTNf7240EXfo28h2X/ZLTg9PKXz6+/YnFixBCqVfDmyUZezXmyjD7i/bYcqY9
	HNcKgIuFroEmuHE3MJgnTgyQorVBeSPMfJO0Hkax680PYMOe2c2jxadE5phO8DYOOyXS7kYS1HX
	oaiFb/78RM2MdWqgNd0/sPZQRbAN0SFo6JfmT8ay/X6A8h0t0iK9R+IUQ=
X-Received: by 2002:a17:902:e551:b0:2ae:ceeb:fa5f with SMTP id d9443c01a7336-2b08276a3b9mr131483105ad.28.1774317460022;
        Mon, 23 Mar 2026 18:57:40 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm127922615ad.55.2026.03.23.18.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:57:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] firmware/tegra: add COMPILE_TEST
Date: Mon, 23 Mar 2026 18:57:22 -0700
Message-ID: <20260324015722.12507-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this driver specifically, there's no arch specific stuff needed.

Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
CLK_TEGRA_BPMP also depends on TEGRA_BPMP.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: also build the tegra clk stuff.
 drivers/clk/Makefile           | 2 +-
 drivers/firmware/tegra/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 760d9643705f..334d5c522394 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)		+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
+obj-y					+= tegra/
 obj-y					+= tenstorrent/
 obj-$(CONFIG_ARCH_THEAD)		+= thead/
 obj-y					+= ti/
diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f..ae21f460807d 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra firmware driver"

 config TEGRA_IVC
 	bool "Tegra IVC protocol" if COMPILE_TEST
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
@@ -13,7 +13,7 @@ config TEGRA_IVC

 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
+	depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN
 	select TEGRA_IVC
 	help
--
2.53.0

