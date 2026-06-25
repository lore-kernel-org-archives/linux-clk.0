Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB7377009
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424682; cv=none; b=AJ2/iiNijbuQxBlz9pNj5fmLTAWeRI9A9hZ64ggF1HXdF+2f/8TxFEiaAV4QxcG+m/0FeB8YpeCw38dBY4Jku1bzr0wce4AQVq8s6lVqD11vZRwvXxYGfI4QGeQ532RtYv/Z/FY9HFuXuDgY+AKRJvxbX0Gx3re6uSD4p+t4Nc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424682; c=relaxed/simple;
	bh=ZuNZE8rcXpZILcOaEBKLDnkP7uQZIoXjCu/kApiOj7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pESp0h06iTJWAnkaj3x6yGwod0A9MoyaSe7iHU8oA2tDwMxIKB0q6awdgpZsFrSxF9s9enQAS4la2YOavQRgqdqQmhZgrBZhj1QMF+4o5m3XEzpK4OT3Meug1p1EbKp3Ri5jM5EFZGGIR9qHpueb84FbHDXwC4utblLZ77DIssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSW/gAqE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSW/gAqE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49261a64cf4so2124265e9.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424679; x=1783029479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=cSW/gAqE+L/J1Jm/7Dbcb4QcLx+DZDmo5LeW1VIln2ZMRQLu8F2pxJLAuY+TvRsNmC
         UTJBH2VDst0hEVGXCMAxE6Cj+j/ZORFQRLLYcdySYR1m7WzYrKhxVpY8iHZd7tsz117d
         WOzWElJAcWMlKir4mnG4l2jm2hJe1KhjMLfcdcCgw143g7S6E2OkC1Aj/wCUF0/4vPrN
         1OrZb+z1BaB9kh5UiJn9CuP6VuthtJL2P37imkXcLq3LmtFYnJDyw9pUpX17RX+Ozl3g
         MecAy/Lrsgxyoo63m87kV6/GmSayt6OBO3nAvSsaN//0ENHZNnjd9p8FbgXbmC5RG4SA
         9tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424679; x=1783029479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=EO4Cu9agSUHN8x+yB6I75AGnvWPXSQaiCJQnj2fImPAKVkwffJZLVqdS+D1/dKg6Uu
         oxGnzlU4O2JY7IRYTawW4uhJX+Ms9t1CTm5kTLqM6LUfXEmjLWcC7DL7B0Ovu4dVV6Sk
         vt99ztzVPuZuQptSv6HyLIhpd5cOT1n7zkV5kILZ7zmjugNV9ezhsKxdNTD//HByhrAQ
         yp9xh08rEYdS3V0mMsARcPB20ttLR999hHv6SR7ZM6FfR1DqSa3/OsT7T4igpBefN1dG
         EsJgWMrLqslSkV1/h/U9DKZeEMwWKG5vYQMi0EcWCZUsUUr+5zwgKWserpyOv5yIGMJk
         WczA==
X-Forwarded-Encrypted: i=1; AFNElJ8F5DgoN4xbf++TZSmeBfv3sP4OY6unuHJpyttnpv3tn6AIBJ8GmFA5hlv4RNU3sF2FKoF8eU3gNhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCed6K4ByXVXwQl5v7ktYYIwMyo+DDaMFUCEEAASIMpivRibGn
	XXtz2YQgb7y6XF6wGXg58pniyhDwBTPSWR2MMv2jf5JB2wQ5v0HzVI3n
X-Gm-Gg: AfdE7cnZK56GO25daRpEurL+1o9RBmzF0CVItczvxP4UcRyibA6M8r3osHFsMEMfCuC
	NGYUExxOMZgyyol2EuxzQQFjyI1mUs9NNVDYgzpxDyZcX9Ag7kUnWJFXC8FDL7vv2ll1Hazu5ir
	OHuhqX+qHT89eWNnKyoF1AIfpPddR00uK1STifAp16l3jh8oL9evUXUzhXwIWg+K0AA69G0RMDi
	97uJMPYKbQKolIMJrURepXe/kYR3XI1oSk3RmovjF7sZ+PTO0PVVGtYwIXeHAk8Vt3jU8qzkg9y
	Q/JOdMxwfDQxQO+9NegHFuzsAQd05MHUiFlKxWdKxhOZVM7dmk4lChHBPoqd/lGlMouTSCBcUah
	WLoJkOtj+7D6RSwR5U8Ak9YK/euquc+cdORZDBMCkC73yMN/ADrD0cpfWdBIoqr00g6juhXJdqH
	5lUHanDUz8PWZDCynOreZ8uZu8wzNfulwfWOBMlyWzHgYqXNyz14GVEAgIQBv44pL8VpauDh0vV
	4bVoxgFbUTEjgPX1R5V75A=
X-Received: by 2002:a05:600c:154a:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-49266881b0dmr61623945e9.21.1782424678463;
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 25 Jun 2026 23:57:34 +0200
Message-ID: <20260625215741.3253212-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
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

