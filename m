Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC8C37D13E
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957792; cv=none; b=Ejs7g7wq6WmJV0qITZqwVDuz8mNn2M5QCBys01Ddzk47+oQaFzlm9ks+inQyFzwTrDcf+GPd1Kneb65aU6m/FwLt0UMmrd5APx86IFMe//Ek9f+6MZrw0bacVPDI1RwEj08nA/d/cZa0thlMpRHu649h70HNxu7/35zC7BQLFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957792; c=relaxed/simple;
	bh=FWU5VNsYMZRRVGYIioWPuaaPLaZNzDvKQUDpPiPlMQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzpbIlRKDaMGOBPaxS9VK3TdvoUmafOD303YuR3pYb1N3ns1+PWTQ0iI5YymVhAxXDZ4aVGm30ERkhQpuPw7svjJAZ4eVhnEUiVr7fwYFAqc9CLGG7lw+l30wDX8BKQG3NOJdpBxYn7F1hzVMoLGp442HAeD3Uldb2/4UT88AF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCAAZbYY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCAAZbYY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so79606185e9.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957785; x=1777562585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=GCAAZbYYy/w0aeRmk5QZsvV5wURYbYWtVTwOAMINonLeq5HBbGn/Av0cd+ba/u4LTM
         SN2iOemM1vnNT9JwCPtIvNL9WlrC1X4pRpJqEgZT0VAnHRq7podSz3q+QPuMHrVOSDLH
         TWEEuBPfpz/3d4HqBZ2yz2Vo6tvlOX3U81by3UcDU1jcJGjqh88gaEaetY1CAtWsQOUU
         2cN+TAJVM8/Wimal812AvM7qIoDyuQAe7/YqY4bG6Wb99um1MFIEJI6HqxrQjG2+F7dh
         6dsR0bOh95tRe2qA39DhAiheNmE/SP+0RPwHLfGMJuCUrP/jbtZz9KhmUW+5LafOkxh1
         iXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957785; x=1777562585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=Sxz9rEDCHAwGBY0Av+ApgJ2XQnq4zpy0RoHvSi4BuXVX/RtNQAbfmL906clJhcyael
         N/ZILa5YsiY9PEIxofXqLh+QvXX3iC8v2G4tV7UWG4MHJGou2BqqFaC0xocrpt7aY2nr
         ALiILqyaxQ08HUDrjWGDnlfM0mBFvT6momUPoMrMRo3Xk0LaHcQsWR7dXZyJlTmRkxEO
         x8gdBuQ6rD9b2I9XzoWmseB3/FBXRTFaGlKwLb57nKO1xDcLB24PTCUeJLTVlwxS8jwC
         rCZHQYSUqKt8/E9WhP0P0GHkh4dC73NGwElXhWTLXs2aCBXALxqAR3gSeo0RWamYQ2w4
         6fJA==
X-Forwarded-Encrypted: i=1; AFNElJ9NV7JQRBA5psdclx8joQGb/l1cOzNgYovitC2vNey7juIcjpy1i7B4cSARTHQn61cKvd2eUk+2lzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjDY00ev2NLVXN+p+YO+pVMxue5uRl1k+R0L2jUtfPJJ/7eKD
	Hu4L4zbXEb9KcSEbEQBkawQdnAFJppt8RfN11GlXi9TjkrBfRqOPj/XzXWwuyzdUurg=
X-Gm-Gg: AeBDiev/T4Ks3JWkqyRk3fUNnlw7landZ6QTghYRIPV0fbLzvi1S0CUimDGktUWMGEh
	v3apCDZuCvG3aXdWIXsEwCBxCCGAFEcX54kPBr3F5IHhgpe80xCKpXPN4A5yJJYzqwAkiG5R+BW
	R7hPYvzddjwFOsxi7Tc6DFuw0DAqMkAR6doJbeSZdTHZOre3BSWZO/W+cLIxruCUBDUC7NhCYGb
	7b+ESqOc17enQuA4zLxy7dW/ob2Tbt5yRXbWZCd4Ephxle7MLoP/fq5QFquD/CQKXRF4Zc5Nfbe
	f4QXy2GscLKuk1WUbaTDTRUDL/ZgqqGofokUFWtZDW2qmvR3xHtZZBYE9pFC3piJ3OfazGmpSCg
	MRzZurO8JYoizB/Oc/gm/M3NCuJbSIqtJQnoG2eLejPwGQ5+Orn/0DBTb827RiKTPdelG3fkF/G
	f9lUrh5aAx1BhGRyGcfBCtdl92oueaJb9WuPz8JgtNFToMH/e6hhHfJeAUCdzWvwDxFDcwFL1fv
	M6AaylhAhJLuX9wTw==
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488fb78ede0mr397227715e9.29.1776957785364;
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:57 +0000
Subject: [PATCH v4 09/11] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-9-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FWU5VNsYMZRRVGYIioWPuaaPLaZNzDvKQUDpPiPlMQk=;
 b=oGan3n0YDDTqNrNPvT5e5tY9UzUuAumcLznabKnHsbyyIVFfufKds/6MUWf1Xq0V0ycSAXT3/
 KZjDYxlqCdNAPXdbDR3RyrFMLbqE0LrVkmWv13ndxJQsDwP/6anSJj2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9b7b6f9828e..759c05bd0004 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23693,6 +23693,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.545.g6539524ca2-goog

