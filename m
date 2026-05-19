Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B733EBF35
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228508; cv=none; b=CZg4CD1noD0wOxDPB6/hbeCaMMfyJSXQmqFDnyv5gZMJircsEfXBKiLodEUI4XrK3FMM0EIqW981y6VCC46bxDaDwzG5JPFJAzs8V/CwwUryxipImPOD/bnCShEJcAkN5cQ2MXxvqfjbLH0Fu6Sk9aTujvaCR0bhxD09BoBVKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228508; c=relaxed/simple;
	bh=3vo4EjwZ47aVA7WSUMBXBxtlqtLd3RODMItLFpKEVLo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oS4MPQ7Z9BRVdrs4UQVhJECnKqpQdr8lym3svhENKh4G+IK5YseN9ifDBhkfi6ZOl5jgsxBLa/uXLua8b3iK58WUZRmFSpRjSO9B92Z4LM87jGFpcfGY/FPq/0q0hCyctbj6W5aTRmUG+6EKdjVDSGroqFI+sIbVQiEXeKQiOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcQJCRBm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcQJCRBm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso22757265e9.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228506; x=1779833306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Pl3lC2lLvKX6xR22U61HDIBcCG9FBCIFd8HUnvukfE=;
        b=IcQJCRBmKt4I0V0mAzlhRJ5HefdFTLUdARSmEHIFYRzIlj5dGgLcgL8DaekkA8/55b
         dB48TmFhCvz9zqOBnU3a1ACZp4hddLTrzwCVHoeK7notGM4K1HFDpqOe7HWFvovbwlnE
         /gBCsR/G6pIIHyLjHM7XliUJg9ojheWQT4FSEv7crSqsx0aGGwxt9t4wkQI8yKGRs0U9
         pIOPz0crb9g01/R2zrFbDkd+rrYPimj3UIMD4f6/wKuNFEdaBMlvE+oH0Sp4+mRhHOvp
         W7vxyLZWu9PWSjBFK841NytHqpg13eeql+nbvQo5vEF7GpuD8UgYdTSzWaeAVmm3eG0t
         VOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228506; x=1779833306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Pl3lC2lLvKX6xR22U61HDIBcCG9FBCIFd8HUnvukfE=;
        b=kbuxzu5uSiTK+XpKkyplm7DJrKX4LGaBxdtW5I/8u3BbMP8M7qUebPC1gJccSxwzhy
         vRRN6cwQOPzw+AauTolIACT/YKD7pDOpM/DS04Jb5nNIaZcMsvRWVA93bDv6ObW8qaq2
         PZiPcc/rN3XM3E3S9/J+oKFEVabBT09m47p5TxrGYXLhMdsuNSacmHz/hfzS+/ZPx3po
         uLj8RDRtjpbX9pS06ys5OGHneCEKwkgPIvbG8I4RlFmCL3jJZd+UOgBxAHk2xUQcoD0o
         7BgZThTigNwwd7pBvQq0yE+oUihGLMt4NveJ5pCb8P/ezjnsP5WZQtrCoiL/MwWXOj3M
         1YTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VgO1TVB9xo8/sIImc7Kg0zyqtk6T3r2O4wedu4gNZ0e8kSHWBwNluMbVEO+6XfDT4IKTJKxYqyC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJAKEbhiIWzPVepDUukE9Ln8YZK19kKdqod1qYl24JjN95WKgE
	Vtoza9lisdIsfQqOKv0tk5QFUpO9Z85q70W0cJJ++yq9J2WIxFl7rKCb
X-Gm-Gg: Acq92OErK0fjraAk0zt3RcmLid/ui8WxmTTzCrMTtpqC5sdjHN5ntcEb09nmT3qCqlw
	eygV5OBu140bLUdTtx5Be3u4+DdFuPSzItEO83gpC3U9JyllLOczRrdXTjacqQK0QpcFerMFywa
	l//DBJIehXTpoI6RGwdz9aV3DX/NrOvNcT5rCLkdGD381ferIs+kShDOj4qFjJGzsaXAsO/gEIX
	yuOyq0GRSY7HzVvrMMJ/10cZrueaQlPORdzVHWJy8cINgHIKVTD64ctJWI0oqXGd4XawreDY+ZM
	PHm9HieRE5g89RtT2BliDyQ83RNXz1SCwnJF61/ndqGZFT47y20C31TtW1XnHPiA+FUYbd4u5kg
	ak1YC+3UPCrdJe38iRMSuZ9lBd8n1VHSjZzq1ddwOkEZVtnY0mPoACZpiSqOIYcmQZgGSlWP4gU
	vDbqRPUFqULEEB1LTTGGYp4odvoTjDOoutj6v63u/uDjg+ZpKG8cF4R0Jag/gybSXw95t6VEz2S
	/RmReadwoft3kVqBWa0
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id 5b1f17b1804b1-48ff1997aaemr165115725e9.27.1779228505743;
        Tue, 19 May 2026 15:08:25 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 1/6] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Wed, 20 May 2026 00:08:06 +0200
Message-ID: <20260519220813.28468-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
purpose. For example the Serdes for the USB1 port can be both
used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
used for USB 3.0 operation or for PCIe.

The PCIe Serdes can be both used for PCIe operation or Ethernet.

Add bindings to permit correct reference of the different ports in DT,
mostly to differentiate the different supported modes internally to the
drivers.

Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0

