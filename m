Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A40331215
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520575; cv=none; b=kdhEENuVmMHae5a63qSdJ/CKoqyvJYuTjw5x8/B07aeIKaP0lzywrOq2u9uef39N88Z7C2IEQzWUdOcJYm50KGqupNYkxnYzirzdgW1w2e26zvwyY2EO9WYYwkmq+zFSKAnkS3RjJHquVwpaUv1mT+x5Ik5HVBRmUxErg65oXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520575; c=relaxed/simple;
	bh=wRP8FmdA12Aje5GTOxIiYJPqjm12DSPC5YqsI4gARmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYLGirdUOQG7DLLQ0Z4E6o+EWbq+9oZyDDlLgUUhfJii4MrbsckYgTN/CuNzgaqeu2jifKB7FcwEwMZxEPbYnLph8hvorvTiMHpa6qrQJrBLO9Gcb/go2BiS+D3vWnEheFsSxu4jA6TDJlxmdlFYT3Askz4I1WVb0AM2W5A3ir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Ey47b6zA; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Ey47b6zA"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-790b7b3e594so13792237b3.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520566; x=1769125366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhfgD4MLmYb5AUeJY2eVc/fXqLoD7qd7hkr+2xTsRcM=;
        b=Ey47b6zAzIAhxR+xJDoAjvJOeWR2uF7yXf84lb1fDQlLiCUQPHFS/qhbtoZulQ2d7M
         Gub2oNlAY/lMNmz8Jhb+zuOErZ1fArV3zSgKm1pCmtak75L4it+0IClXiqhsGNgVU4li
         qLY/tYHAcX0Ui+/5gseJQr0RCeinj9yiq+htJGF63aaSpG99gwlkDQyUYSD17kha2Jc8
         xZl05KhoH1ig1ul+N1rSia/NQP9ZcD3R9aRDp+gk7JFLZekVsgtxbNWPBvOAcO72CwWt
         rMv8b16rT2ihbsKIj2WB4kAP2pbsfmBozRBoZenXR15fbp11Vw5Wkf6hW5VnDhtlSuaV
         Oh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520566; x=1769125366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhfgD4MLmYb5AUeJY2eVc/fXqLoD7qd7hkr+2xTsRcM=;
        b=s/t4us6WTXqfoX1u3yYgDNefX8JqSRVfCz/YPV+s1BCxUqamP7LUVcvWqScELMjhbA
         NN0ob7CsC+vmKgAIEwfKtbuEFts7/VXD8VrcfjvXmn1S/yxLWpKktiLhsy/3l1KqppAR
         H+YhljvCelkuK2r1Vzq5VU/SbIEh4rktc7K9LXLj0K+hz2LXPzVkoUzJ7i5kH2sok3uR
         Q1USj+wO/4ipqyf0y7IFtlGxY6CfQp3YW2ct5GNAbXureofgMeBXqZiKxjIgGuuCc+iq
         24DCJVrFhZtvxQg3gOEErfzVfp/uqtf/PM61EewfQVG9BRMp8lUeLMIjpz1QlRTqi2VP
         082w==
X-Forwarded-Encrypted: i=1; AJvYcCU5/nw7UKaxUJt1XmICJrAAIXES83eSGBY2SL/yn71Cbw/ppA6mKdP6PFa/m6un1OFjIlIfoOr5Nl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyBfKM8vLUKvdXHCqhjPsebxqWqzS1LsWJ/JmPGaALw4Yqy9J
	8EZYSXfgE+Tq5k0LU9ruUsDVUuCgV9rNHNOFfh5rz609aU7VMnVZy6A6fvPT1chwK2c=
X-Gm-Gg: AY/fxX5eKhXOi8z0sNSpu0J0eLWQlDmXvwhvBrSN9gEs2uklSBu/m6eaXPFrKpQfzcW
	Eqqyp37umLoyDGkae0LkRzVcqqPMnjJx5812TezZvFW5fJrZp7Wu8X2I89i5b5IB3Z/s/nYB650
	ZcCbW/ykAyout6beuL+kLoH30LRBb/R80CR1OsAtRGP0WfpHXnVW8A21Z1EyNZW4SgptmN1wIWF
	s3SD/BogP5quUu0rri79tVOy3aV2DXQhpSXP8MLDGEwgoIOtBObRCFE8kbCfx/S8TZcJyh6QgTN
	i6Z1Fxqg7+1gDrWVbUSJWSqDX2Ah1MYOLfnqPawsRgRUzBB+kc0stfzoi4IXn9M1cZV8JAHacI0
	rXz7OHbZSOZkdC67L/skdOAUINDyjq+BATW3bQl/5WrcBOQS06hrg6JJXhjEoav7uQJ+S3f/hyv
	+f1adj2+ekkHLdna5d2yRK/YhcxFUD7ne7tK5PwPmsGntafhOFMTO5LSQmREwHtOM+gdmlwN6PI
	xded3mmCA==
X-Received: by 2002:a05:690c:b0b:b0:788:c22:1f0 with SMTP id 00721157ae682-793c53c4539mr12329207b3.54.1768520566220;
        Thu, 15 Jan 2026 15:42:46 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:45 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:01 -0600
Subject: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Document register offsets used for controlling clocks in Atlantis

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                               |  1 +
 include/soc/tenstorrent/atlantis-syscon.h | 38 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19a98b1fa456..4a2017d647b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
+F:	include/soc/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
new file mode 100644
index 000000000000..b15dabfb42b5
--- /dev/null
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+#ifndef __SOC_ATLANTIS_SYSCON_H__
+#define __SOC_ATLANTIS_SYSCON_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* RCPU Clock Register Offsets */
+#define RCPU_PLL_CFG_REG 0x0000
+#define RCPU_NOCC_PLL_CFG_REG 0x0004
+#define RCPU_NOCC_CLK_CFG_REG 0x0008
+#define RCPU_DIV_CFG_REG 0x000C
+#define RCPU_BLK_CG_REG 0x0014
+#define LSIO_BLK_CG_REG 0x0018
+#define PLL_RCPU_EN_REG 0x11c
+#define PLL_NOCC_EN_REG 0x120
+#define BUS_CG_REG 0x01FC
+
+/* PLL Bit Definitions */
+#define PLL_CFG_EN_BIT BIT(0)
+#define PLL_CFG_BYPASS_BIT BIT(1)
+#define PLL_CFG_REFDIV_MASK GENMASK(7, 2)
+#define PLL_CFG_REFDIV_SHIFT 2
+#define PLL_CFG_POSTDIV1_MASK GENMASK(10, 8)
+#define PLL_CFG_POSTDIV1_SHIFT 8
+#define PLL_CFG_POSTDIV2_MASK GENMASK(13, 11)
+#define PLL_CFG_POSTDIV2_SHIFT 11
+#define PLL_CFG_FBDIV_MASK GENMASK(25, 14)
+#define PLL_CFG_FBDIV_SHIFT 14
+#define PLL_CFG_LKDT_BIT BIT(30)
+#define PLL_CFG_LOCK_BIT BIT(31)
+#define PLL_LOCK_TIMEOUT_US 1000
+#define PLL_BYPASS_WAIT_US 500
+
+#endif

-- 
2.43.0

