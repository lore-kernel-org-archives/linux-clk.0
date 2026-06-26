Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BF13E9C1B
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465650; cv=none; b=p69P+FDFTgBi1Y5ZQqiss09UidY+5zBODaLfS6S52lhkHzZk9kFJDV6lydvbakvEzUVNr0jRByrYGoWq75+zi1JRp5JkcNz3mQasWhESF4bC7UYImTAQQG4SwfIosqnFddoUzyRhdz61NoSsTtiWoAZh5VWTQaLc9HpKy2NWYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465650; c=relaxed/simple;
	bh=ZuNZE8rcXpZILcOaEBKLDnkP7uQZIoXjCu/kApiOj7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdt4BGuFKb4WdvM7a94Bw9lqZ98YW3AKMKUH/v7YaVZacEpsXlF6DAT6dOmhsd7uHWDvEed7kr72yb4UQ/g9I0gQbP7CuVxqvM/icN5h1g4xCGcKHd4BBzmzNCczEps7zMoN70C0tm8pFmTWBk0+mVcCNmemqZpC0pmMq0lHiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmwn+f+h; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmwn+f+h"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46e30429b10so422590f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465645; x=1783070445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=Tmwn+f+hQLjT613ft4JfBaBwQNbRP2Ksy0+mh6WwztCeTSm+/2/I3DE4SmNH3X75G9
         +TCizRPIIxrdzi6Ihdg3FRlAr1ZGCndG9ev/oAZOSY/70Q/vxJdZjBtQkHTLkgfH25y6
         j7zYwWclwZVZH2VXCyvMq6itKa+66k0GaxEndBfCtDXvii+n7VZ3xBDxiLCQq15K2TpJ
         R8xKwQyHZbLOJ9vNUFd+99hp1cMRrFgfdE9rFMD4/bksOCJdJiebtSUwZeg+0oYupmt2
         INsVsYtd8hzTGIjkpigJmKhep8vdch43Yzt7ZPPB0PtIFsm10UX9tIFN0ns6dbXpPZz2
         ef/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465645; x=1783070445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=qlFL7AalysxJZDIqiyovrAubuZAA/ZZL8VoeDa4kdrjbMhHIodaebXML6ngTsnpevN
         KRE1NZEcQ4jDjSOPKumWTvDG0Ft8LT+0T9ShWPlyRnoNhZrA4y0ffmORjQMnXrKqEiIh
         cbeOK0JwEsOfoSIBeH9FaADg5JvALG7ToDBWfH16q4KNQbzp61NzCc59fexGR/eF3Yih
         GoEL7M9vSD3q0iiNE3q87zj6aRpAZOSKMws1X4nlehd0QaVzemrvpSqYdWMRVv+LrJXM
         7mAkFOfzJ7+ap81r6e01GlinRj08T2nF+CEx0404KiH9YaHTj4YNxSzEYj9q1d+m5Gdn
         9slQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1SfVrqVsCuLa+Rxdl2L45hFYRy6EdRKqcdcV8bEUfsV+ncLHYhETwtemrmizYbN6YYxhPPSGDMHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xkVhy6XRoSD3tm4vz4wJLYDlHk31A+Iqn9DBqmC45njTUVTU
	f35tZ+Iwrn/e8NBbNVTp9n8wN/Zf7UX0eFSIvPaxHtFmWLZdrPOBpdpK
X-Gm-Gg: AfdE7ckbsYeNfpRCFNzAPXhZTXerfx1jdQF4ByuzZ5vTPPq+ettB73yQNZ9Udiqz2iX
	f2pjdPf3kO03VL1KC0UDwQFDEb12x+tApzy9H8AUY9ztOpHiekgZuIPEBoHs8AW6QBXnE/Q8T4r
	erXDmN0q+UY+/DEs+NDfOG1bacOwzZNT3dRqUANavi6nlJgjwbGofhTd4lR1/mr6HTTe8Adctdh
	Hk12WyeGcNJonUNGCTYOvmH33LzTfTgidpEfaSzDmFyEaWJhB7kjuYs7P7n6w+Iv2sg00e0/1Aj
	cre9I7cw1Gx6MiVs4ZwTmkJHmLlOF0rQhRmqcE11rzFnZgEKdTbDzqLEqvmHVymme2r51e0UIAE
	XRDDjop24XAzbR8Qhb1WnzgkYQbV6eqMMhCrKOD/Z+ANPBpO7YXcoSDEBhxCCGZlhijMIhdIV7r
	cKAg7UWSTolEqgkZMhr19fDYR1DaaUyqydh1Q4iSCuJgAgi2MIXFLXGm1SJtaCT1BI4H89dYeBP
	A6mrI+Z9joo
X-Received: by 2002:a05:600c:1c05:b0:490:ea8a:32da with SMTP id 5b1f17b1804b1-4926689ee78mr79972515e9.26.1782465644046;
        Fri, 26 Jun 2026 02:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Fri, 26 Jun 2026 11:20:25 +0200
Message-ID: <20260626092029.3525264-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0

