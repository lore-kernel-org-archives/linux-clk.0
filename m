Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720471B78F3;
	Sun, 12 Jan 2025 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689231; cv=none; b=gD5VlImPV24jycBj7a4XKS30b+RI3EjpWj/l6CsC9w/MXBPkSpGNmDDR/uByeCSGEcHgOwemMYdQxSdRkigbt+UdK1PJIJBtPg1Sdx7V1BPGsCB3BFgSomoA/IgWRqxl41RCZguM0mPkgfA9A9s1IWl/WuUAShuKSyXEHwpoX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689231; c=relaxed/simple;
	bh=kwjDtSqZelg7GeU3SBomwpxMyqlJd21v3E/V1AuQ8Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uhem8V3jErdyZxq/jJip96J33Np/zDeWJ82kS+IgzqY73qsUFcUKfYsdnNotk4NztWNOxtpkbGyLJeo1c7t6tW3DYItFZ2Qxmlb90tVOPgUgbxXZwIcGh1I4ihqGdpYIRt0sCuqEEypBjdwt2hQFSpiVwa7sghhfZfGL/wbtGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2cvJooh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2cvJooh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee0b309adso569746066b.3;
        Sun, 12 Jan 2025 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689228; x=1737294028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZJW/NXZZ/V+qtWYbun55683Z+/NrIeigT+/pugHUUc=;
        b=E2cvJoohGA7AVgX9oubYTkabf6PPQ+ObAUYyqaf7gUfLJYll5CF89Zw7m4UAd79n4c
         03gPL2ROfP/o46lNN8/o6XWv3Bad77y2mLdcmw7aI0OavlptvBVychc8hwfTNdmp42H0
         wSek3UVTfacGXI51aGRwa1DKjdZqGwjEsT2xvQU/tTYpwZdUaC1lfM6SIreU2KPYI9Z+
         UR4gTBuDi4uleqpuES/TIpQawRhaO6rdAbBZGyNbkiTnbzHKlLIThk3BmuuTWIuH2WsJ
         2YRMcRwIAYe+1DMHAovHoMLANnmAvf2l03W3PvEhBP5UMLc4RPkaNdUqi48EgHju24ep
         BYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689228; x=1737294028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZJW/NXZZ/V+qtWYbun55683Z+/NrIeigT+/pugHUUc=;
        b=tolq5kClM6qLFdYSQdX02aXaXIsWsvS1uquQCD1whPvQn8F0TL0SCu7S5+OrtQIfaa
         7vK1Zx7NIC/hqTc5dFBMdZF3RtcLu93kJtOdHHLF3WjUilRHTBUYJ9CcGAQDlJVUjE1i
         155LFuLdIJ7Ywz2u+OlMXhGDwb4zAz1h7MVIxOxbfcBgzjGqkBUkoTE2+Ql9fg5e4GVO
         i6WWVnDzDP3mxrtasWVnaLxsscBRZdxhygLlzqSvloJLWr4jgpn6vJsZvRPE9ZvdIjI3
         g13AuMa0v/wM6SINCfOcCQ97RQnmzrwBHeeK4ylXJTEKlzrkVzyhuQdRk8G28SF1+JTl
         j/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqtH3As/b71sOUOLWafUhMhnAHKm22ZiUrKaGbzahmbBBFzo5JZomS2uT2csW1CW9sJwcg1gmxx+J@vger.kernel.org, AJvYcCWJfi6/jSLKsd6/sxzfUdAGB4yofkPPhC0RnK4HwUgICN8PSqL6eArpzD0qawEHi//b2J5Crgvgz6hIJbOx@vger.kernel.org, AJvYcCXdI8UOMPqHP6k3TCFRJkLA0ZrEd9J00MeGy8FgNcXkOWh+gkLCkUg+wlVZeNvM8cYxKu9aOSDLCNXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeUt+dRood+PABqr6YGQxCZJOzFXtxEXHk8vVUHoAHS0HUkzt
	9er7JX1dAdiBxGtG6I1aZrxt0ssvTEQIDvb6shPZmVuodQQIq/gw06m8hg==
X-Gm-Gg: ASbGnct5aPuIKJ1HbFVrZcCXhsE3Nlw8/b+Id4PSEBPXnuOboi5wtHMbtlACb7iX75e
	TcDHuwSP/AACy+IrWc/KRaDueuhZ60zYQztC49DYaqB2gc2F+fEwCysIUkSHu/VO5eaG/OA9aCh
	YBNIuWDx2V9/q0oesLC8vezJZqnz18xlXlkQCbgVs+3M0auwoxkFJhXjKr5tJWnBzwQexTN8kyB
	/rjgilGJr14nDfnccLENlDi9AVCOExmmzaVvXs5H7kuYi57DUq8eYal6kOw0PxBIDuJw6U=
X-Google-Smtp-Source: AGHT+IEi72gZFIFFolBFsF9ItC3bauqT5LvDv8qw+Ny72xbOMIUFM42YdDxj9VqaZ/+Fd34qJnrCcw==
X-Received: by 2002:a17:907:1b86:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab2b8c3c336mr1131085966b.51.1736689227531;
        Sun, 12 Jan 2025 05:40:27 -0800 (PST)
Received: from localhost.localdomain ([109.52.222.172])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c90d9a46sm379421266b.54.2025.01.12.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:40:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
Date: Sun, 12 Jan 2025 14:39:38 +0100
Message-ID: <20250112133953.10404-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250112133953.10404-1-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
should not be placed here. Value is derived internally in the user
driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes v5:
- Add ack tag
Changes v4:
- Move to patch 2 (improves bisectability)
Changes v3:
- Add this patch

 include/dt-bindings/clock/en7523-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 717d23a5e5ae..28e56745ccff 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,6 +12,4 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
-#define EN7523_NUM_CLOCKS	8
-
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

