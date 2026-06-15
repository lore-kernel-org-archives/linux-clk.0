Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C8342CB2
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520534; cv=none; b=T23gUl+s/D9nM0ZQkRFyKHnMqTj/JiVwc+n0vitbkBn7fW/wqd1jDxcqHBRGhCOJHE3s0xKkOndvQWSY5iSzKT6QrHu8g8wI43RonkHR6lJ61F+BfWjf53PNkAb8oywT8JEHVenN1Ne+2SwrG5TsdL++z/mvLdAz8GLzN5iqyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520534; c=relaxed/simple;
	bh=5auvEJum18T71XbAkYK85Pglurw/z4fjkQItDw3akdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjQ57Xkll7g/sRcyIn2K1gZ9ZR77V2ZH4JQgGiQEvOErGkmzkJWApNum8vHMhvh2iS5v4q7wNWh5RV2Gwi+OXtS5gwY12/s8mD7KDHHkP6fanYVNKd5xs9vK2Urf0v6Rj4dqMu4yhJDAbmLXS9HaV7MBlm0Oe6y+pHGqO40ae5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKkErrht; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKkErrht"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46019b190b6so2681123f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520531; x=1782125331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXFKNVRWxwW5KMFwm/zQYHz9ga+bWsg61qgYj0OuJsI=;
        b=UKkErrhttxoZNtHZ0YuOxCjq6DTqcVf5Rni3V0GiSahDFUNiF7w9Csn/j7DfjqGydH
         hMNITXTBUzoXrG6bdhl6vCAAtsEE2diX9JR6mnoE1tJsfLe0fE+T3SoewLRfRwxkxBK7
         f3ov5eorcUzllJ6KixsxlpLqrc3AWxQqoyICjewDrDcF7Y8NmnJzntk0U1IMSuPbkIDr
         qsvTUqDHpeBvMISUUFZt4zKQF1O24+apd/equxIcQ9va6Lq875Hu2pUXYCLYppJc66ZN
         BJlKgiiQ76THFP3dLXW3OH2zM7P6iXcDF8D5n3OxFvrMtRYmARV2ZtHlVlZOprnWVm2Y
         l2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520531; x=1782125331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXFKNVRWxwW5KMFwm/zQYHz9ga+bWsg61qgYj0OuJsI=;
        b=QHnZydMG6N9idU1+j8PE4ila1Brb8RTz2EDUQM74zhBovkI4Q84Z5+i7KcPy7iqlUN
         Bg7zqb2vPJ4/q9wBv89tLgdnyfPaxuZBcp8CEaVoQHm7XftYldsG1oZh9GoQ0hQyYBQo
         7QtBSSzDIkQpG/clv2K5JPi2PLfSv2gGWyyAaD/a9nbL9nlI6/dV7MPHFs7u62/T79/b
         sfuvLm3e0h7109kEjK0ha2YeRrTg7L01h8h0uyXFXR7fi+aU5BiMIpl5lvXDgfJnnwF5
         Zvp+df8vlgj0eOAATdfhqTBOaOsC10E720M3mPfHMlCdtQPuMgqC9ESHFdGyCtbdmhaH
         6ENg==
X-Forwarded-Encrypted: i=1; AFNElJ+1kctavGSxoXGq2OM9L65U3PEMkgqlW3ZNf0iC/a9uVMWzzv/Y+SfiM2QqaIud0ykFtaDtWbpORJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBPemI8IEYCwmOfwj9FdzMPlau0Zkx8exYoDzzF8DR3cKVECoL
	qk/sj0p/X/EOK3R4+LX4XJjzrdfUQDpqmySbEH/fYEzUB/dqHmFvjuaM
X-Gm-Gg: Acq92OHsQE4GgM4gsmNUjWXWjMXG8dG6qywI+LUtGPtba3/SrYKb3UMlmey24QX4BZd
	k2CYWubCz0FkPeKpRK7taDC04IxxS877YM6zA9+TzPqrBKGHVNQ2PNvVKCOxlESynw2ryosW+jp
	t26tsIdR9yLUzzjOY83NfafHvfrf4yVRaVwyj38aeAq+o5qlFn4CVgfyjBSnccgrUOxqz0s3E6Y
	t5SIzJ4F7EOegUlLG76uQj4VdltXTWO56UQG2zgCjj4SiTZ40f64RhRNoL692763ER1m93QbK/3
	a+GUjeOw+unWbh8eWHL3T9Nc7Ruhl9KDIOpwX/IXaHgnMoGq7cqf+mylKFMyNUAdmHorT9f4XzA
	14uNJCGu/cd7D31aTBBOYsDdaWpRj5M7abqEAHk4TTTT23OEThf6g2ibpFYGdIJqokZdZUdKDoO
	jcLtIQHmpmzEZj5+cJ2QQ9vCAXnoWwD60QLF9ylEdssG+ACBQLD0oNRUxrE4a2AjyiBjvrywh+N
	xhaaa4Wx3uX5fz9Uxw2ue91ddHRytiCbsEN
X-Received: by 2002:a05:6000:2210:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-46074a87c6dmr13828858f8f.3.1781520531159;
        Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Mon, 15 Jun 2026 11:48:43 +0100
Message-ID: <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- No change

v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

