Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52F3AEB4A
	for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562504; cv=none; b=siDDVw1Jrd7zKEUFr/a+8umu79AIJDNnQG6uNz8RDKQsMTjgBRDrghPZ33nDmvDwWJmwi7JJ8qNrcy4deqk1iCt0z6qVizT2TsFfesagCTtQM+RQyywvsR3Vor6j3QRKAfADg6Lg4qau3JoudjRPM4SRct4YJ2iXhHkJgcQxDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562504; c=relaxed/simple;
	bh=5cZJrlPKOxxy55cU1I+05GjtpUsf/PqzQR7YobX8VZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fA9dRwYzdIsB9INY9tOlvUmtwc80LZfI/Q3USAtPFO1dD3W7A8CI6VwTblzmwOx/12G79mvBCDuygZjI6pAgRsf2jxCcj8goOeKuGi+EAspS9Cxd9vkG7jh+DXIZ2DFdF4r40RwDiL8wuZ3/jxVRX/dZ8oxyVudlyUDrX+rrGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFoSnGKD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFoSnGKD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49222fb062bso20431975e9.1
        for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562501; x=1783167301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=iFoSnGKDTDoVjV9ZO4L7oaMPM5xAiGSbk5f6ESpfWfYr6Iv4S4GA4H9IGRhYq/2Jiz
         HUJEWbtreC9/7pfwx1yjIkA2YXWMRaNjuF6Z7zQEYknm7rMoputFmk3il7y8s9YOCNkL
         6C3Qx/ehBw8q57LfKIkOU6INeK0OYPAG8u0vmWwNgYtdXNtImLx8SfLeD+UrN3nxfy+7
         A8Fv/qRElyjzAjVWa1jsihR6/dyVpMPDhLUcojH3F7BAVqVaYvvblVAoKkTA4N9xl4Y4
         G6Fdy3Mz98ZH7U+EbVbGlxG53JlUChPnbaRZA0aove3dMIPu/u3AESmJV4hTzEyaIjbW
         pm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562501; x=1783167301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=j9bbMBwKDCqapFRdeGnaLs6D7Ce/GplwSweCf1fsSt1UiCtpiYKnkYItnzGQJDpMch
         6hZj++Bk9ik8y5p8x6xMKDme7VhCeLWEq8R4JGudx7N6d+YCK1ucL92Dv3HOG9eBFNm3
         C3nwk6csw/O4xCL+OZH51U0egQcXMkWfrIePEkPG6Xy04NaGLMl3iPTD34GolM0A8wBn
         flWv9n5JF3uNXMC5cd4cYoMHwmab5T4fvolV1R/4Mxpkqi4UEDmhawirWSx6OeFLkHY7
         EvvDKeR0OQpz5ToqkvpKm3ahuejgDj6kOm8Yb6SN/6F+k/ZfDsKSPAkyj6Leqs4jp6Zp
         UIMw==
X-Forwarded-Encrypted: i=1; AFNElJ+eyVpA00BI5lspVGmlF3irtCLQ454FZ+DpYsetdnAo7yyToOjf8z2m8gytjoaZac05OVrkC0zbq4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAw4qili9Hym5lia+jHf10frAW3uREUOFZ1zdar7fGBWF5z1YO
	hJTZ94W1LDd9khBzxv6rEjPOm+j9bReZ+7+9ScuiX0V/Xi9VD2CuztIb
X-Gm-Gg: AfdE7ck/txviWAfHEeK6HIXkY6ukiyWLJo9aND+msAEW2/XHjmfzwErq0u2vdZt9qns
	L9hbZKIgSQvMgFbrMc2kKYc5Fkd6+rSh4UsydBqsaKtFnSy/94rTrpBBEwGsqtGnH6I+vhkE2tQ
	Od2oGS2Wn+GZmhiSYiD1cGrXLTpSR6rE9pRenNE94WAK0ZJZbVhn344MmF7t7EU5i6rFf1UXJyn
	zcbP1R6lXymvXPZYNrnpvoUZIwpWNAC30UvA97fQjIkIsnAH5rlP+7bCOY3bdYJy8B7S7MHkNaF
	99YxMq/A6WWmpr7ekHQ8X8gqHBrJ5NsUNsoo2m0kWKWPvVtF7LxL5MHM/4s/3xdD2JNMONFSAOQ
	wVmHBO9leDL0vXI1EmCVGytsb/stoneQ4hGg8LdWkYFBi+l76PA1M5GNRQ61kjwKR/5Zz2DsWJN
	zaAxZ7z3FWKpa3OHBBwpBrnEhLe8JFtsacoKEgCgLG8dVbe06PkzXOMgzGhINfrw==
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id 5b1f17b1804b1-492668551dbmr160952675e9.1.1782562501557;
        Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:00 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Sat, 27 Jun 2026 14:14:42 +0200
Message-ID: <20260627121450.3529133-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

