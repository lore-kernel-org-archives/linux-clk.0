Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2623E33D
	for <linux-clk@vger.kernel.org>; Sat,  1 Nov 2025 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973258; cv=none; b=to16vXQ5eMkR02V9WxZFesXKg2oW7X1dDeaf+harkmHnBlSAjS6UY4QRvEPA4qzFSvlvfvGT9nctFkFL9L+04RUIv3BFvg0fvQvVcxz8HVTn+PUP93X5d97D8QbY1XnN2a4NhOye7hJLRE6ResUCm+AbBhxAYLP+KzsVct+9eX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973258; c=relaxed/simple;
	bh=16CUY4BHukYrONigdNf6hHwKpWDcA0Nh385BQ5R55XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVS7fOFZL3S6WhTXCYwkSvsq5ojt9zxGBecQqIK5sJM9TH+Vzs2ys/NIYRD7HOXZhxRWSZzTYEYoMApfz9Ngmtfp7v+71ir5B81BW9r8WBhhwhY3Ay0bIaiOQn11V9fuHNamwP55QmDta2FvCq2bibsgX9IErTajWOwMuiC2OC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGmNCzlz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGmNCzlz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a2738daea2so2910786b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 22:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973255; x=1762578055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiw7k5BoI+E1avLBAbhUpCYSAa1PLmht1gV7sVpOsMA=;
        b=aGmNCzlzq7yYoC2K6jmqxllEEan/sdZdJHhvtVZj1vHUpGCPUv8s29CfFDD2Gs15ny
         5jVCw+cg9BgI0HMElFeZuhWkVQfGNxJXz0C3wUKyKcrIharSt5dMBdAFAsqAu6/R8515
         VKn5x6KjmnmMC8+n88SpTnPapc1se7M60tnFUxYmSZEx4wAwLuBnUP1m9xZDdiEqdeRf
         TO2GC5YI4X1+Kl+xTwODewTtU4NbYkv3q/SiQTWm4PRsg6QsGg3Lt6sxNE1RpG8dzybe
         Qmtuox+KBCJvy+fPO+y8SkGACl7ObB5ZYz6zhwEcKE3uW62k1IOPYdI+Om33ayLmgBJH
         wJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973255; x=1762578055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiw7k5BoI+E1avLBAbhUpCYSAa1PLmht1gV7sVpOsMA=;
        b=JJZ/GlyXC+lhme5xZfBisaVfa1mxro8XxqzoV9LyK2XOaOuAyNvEXLYRaqbK7Ojj2W
         frhLSQQN/EusMzsN5V9PfkfdbYDGE0DTtzRf7GILX14wKf8FIlmqUKyOHhcV38f68YA7
         U8l9IPygCfvTPLxnT0Y/aTgwOWdU3SIoCpon4dU9SG2Buk2txz7WC0XUt1i4fsMs9jli
         xOjOM+vlUr68KU/Qx+DFugP14OD6nbqvgx5k6Tao+ZiHYAFBSWCWVRLt9pvWptvUYq0I
         YmaLkBz4d8GdRNFKjhNqowWBYWHZT4ZVgIroDrh7mluevDqNJJP+0YKA/IL8E0nI1BsT
         CnXA==
X-Gm-Message-State: AOJu0YzwWXGMNnH8NTrkOuaYg5f13/YIXiU4T8NqtGD0k38AsEXYXVaH
	rGTn9yGk7CQvIK5tD19w1Dm6DSjU9srMEuVVHmaIHorGgJ6HIsicw773
X-Gm-Gg: ASbGncsFqMG/x9RrR8aNCQt126plmDQ7CQCjnTayyj7KTrEjluMEQJYzjOKQF7OoiVh
	zpeww/3YtJumD5Uq3rZadCBhwaLrNJwjGp9uyRUw5p+WJ1Z0HTKdr2B45b4jT7PzpixfdB+SEhJ
	sWWrmYG6yPcW3oF1Qhre+TzGhW0D8e1rAe1CXWrKm9hr7djhWVOwBIF0jdmiG+2FsmJ1iGr46zJ
	MwdFrCgIxjdcqUGR3iKsRuQAo8r04Rwh7J26cCL2FtJkI+0XYtWDyKI8pw72DcjpxuO4bkD/d5C
	fyzTFaFIiCVAGlMXrPs1PIIpWdlpv1Mo+sj3reP+1QxVkmGOV1MBvklrxE1K/eJlTKfJNy1bouY
	s6GpUuRw/PyUw/OraMnSUDOWP0s0o/InpO/OVKs7r0njVW8HVS/2a7/RpJg8PwKB9Paqem0WV+P
	+/DuI+UeAPBp5XKypKqF4f8nWiF0noJas=
X-Google-Smtp-Source: AGHT+IFd2bk88eDysEPUx421uqVUQRIoZmTj+xtwyXu5exUwOlKOq6uKKxTjYZHf2N0IRzsbcLrjcg==
X-Received: by 2002:a05:6a20:549d:b0:2f3:b278:eaa5 with SMTP id adf61e73a8af0-348cd213c93mr8457177637.60.1761973255036;
        Fri, 31 Oct 2025 22:00:55 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
Date: Sat,  1 Nov 2025 05:00:32 +0000
Message-ID: <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add definitions for USB3.0 core clocks in the R9A09G056 CPG DT bindings
header file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
index a9af5af9e3a1..234dcf4f0f91 100644
--- a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -21,5 +21,7 @@
 #define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
 #define R9A09G056_SPI_CLK_SPI			12
+#define R9A09G056_USB3_0_REF_ALT_CLK_P		13
+#define R9A09G056_USB3_0_CLKCORE		14
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
-- 
2.43.0

