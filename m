Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C44843ABE
	for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629288; cv=none; b=bgNOYyGO0SxNvvKnVoCTqsXJhIEykxI1h+FzLxJaKZXwHboT80prOSOOge6Ax63HYk2MbE7iFL8DCiEyMk3BYdDeeLoxqHN0v7kHe3dscRNREFWnFGm1PKeU+iA+BNMnpDg5QSG1b9CdFQTL0y5+cehG2eSDlsGP/3AYoqDOsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629288; c=relaxed/simple;
	bh=N0VnPgbWrvY1XSHkJSVJnzw1cjtZzFe0yo4Covel7Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DsSY9vHOGewab03beKNRrnshMm03j/heaXjsxM61IjXFOFbAg/PI6LOyFEx7Mxafbc0DE4i+vFql2ucvKY+2fXcCwzYlNYg5+BgIwbh9f/aqAx9vCIdBmxOUeUVjscjudIuQJ3fXIZbf45tByMizl6EfhfXwiDg1eagLmcxmNw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypwiHoIt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypwiHoIt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33edbc5932bso601946f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711629285; x=1712234085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wFpD+++a2qGN194PQlW/ydpKP0vxDJuH65l8GmtaME=;
        b=ypwiHoItjV+5/GIR/MZSqp8UFkl88D3MPWZ5EsBWcyDv7aWwXKwugVn0722FobebGe
         R38jX5z65/G3N1KAV35Mb81InwBIykUshd34indmcysQBvgCZFaketKk+tGrORhTOcfO
         KfEQyusE4TZSKXQccVLabuD52xDppzbGOs/KOZMshkq+VtZUJiJ6VhYEY/3g7pyLFgYO
         W3XOV3hsdu4Oc4pZISXBBCwNgQbcRSI3WAfQd1jAM7bMiiAFZoWrilcMpRArTFuXQcyY
         +HmxL0iHhWL0HvwL1PQofKDHAinW2IAxCDLrzJXsprQmUB39MziU2JraFHTVrDBhJkrw
         hcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711629285; x=1712234085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wFpD+++a2qGN194PQlW/ydpKP0vxDJuH65l8GmtaME=;
        b=bwPyMQCrPEvTs7BicRiOZC1P2xf1rj4J1oDtMOslH9n/x+CxXFErLWmr2iX0QLErgK
         gcC8+74ELp6F+whMBATUmZx8vcAaywRFbintKy6e19R4MqFrj559PKDRmzSa0zS7ZFur
         FwwY4B0P3XW56Gs4YKIkC4gHQBVjLP5H4Eg2PbOipxBa0ER0FVy/c90bSopZfx8XND56
         b5bV5yit4wf5WXwhTBfBM45bhbUa8zKOCTTJND7xO+Ig6VNWZGS1NyJju+VeXg8iOlyU
         4NRISTdF1YgPfnCG3aVyTR/T1hmYt19VIBzvTSNJQLp8y4bYl7vv9NgNPvWzwmdp+EcS
         ZfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJQK0EpcnzvOwfL3PkwK7Nl2tjsPt68u/qNJ20XnK6F8Nt6oJ3bcVskMg2Tx5rkgn8QLM/zabAkC0iK4djoJnlVfbBcwm7pmo+
X-Gm-Message-State: AOJu0YypnMwC607qtlurmt692hTe2Nd+tK1N0L6ZG0nTDX8tylO+gTGE
	PT2F6hH7z9mxsglzl8bjmctvM/MMfqwtgVHn+//ilIkHnkP9ptes/hx7cZ0GE4E=
X-Google-Smtp-Source: AGHT+IGeWvo/4NVkNv2RtRW6WUniovQcsePcpHiG6m59zjQV4C3QR40TEwzrJzXenDVVjdliNkIBvg==
X-Received: by 2002:a5d:6448:0:b0:33e:c316:2a51 with SMTP id d8-20020a5d6448000000b0033ec3162a51mr1524284wrw.27.1711629284889;
        Thu, 28 Mar 2024 05:34:44 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id u6-20020adfa186000000b00341e2146b53sm1639671wru.106.2024.03.28.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:34:44 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	linux-clk@vger.kernel.org,
	jaewon02.kim@samsung.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Thu, 28 Mar 2024 12:34:37 +0000
Message-ID: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3:
- update first patch:
  - remove __nMUX() as it duplicated __MUX() with an exception on flags.
  - update commit message
  - update comment and say that nMUX() shall be used where MUX reparenting
    on clock rate chage is allowed
- collect R-b, A-b tags

v2:
- reword commit messages
- drop exynos850 patch on Sam's request

v1: https://lore.kernel.org/linux-samsung-soc/20240229122021.1901785-1-tudor.ambarus@linaro.org/


All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().
    
Introduce nMUX() for MUX clocks that can be reparented. nMUX is used
in GS101 to reparent the USI MUX to OSCCLK on low SPI clock rates.

Each instance of the USI IP in GS101 has its own MUX_USI clock, thus
the reparenting of a MUX_USI clock corresponds to a single instance
of the USI IP. We allow the reparenting of the MUX_USIx clocks to
OSCCLK. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks
to OSCCLK. Follow the downstream driver and do the same.

Tested with USI6 and USI13 SPI.

Find discussion on MUX reparenting to OSCCLK at:
https://lore.kernel.org/linux-samsung-soc/d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org/

Tudor Ambarus (3):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate

 drivers/clk/samsung/clk-gs101.c | 225 +++++++++++++++++---------------
 drivers/clk/samsung/clk.h       |  11 +-
 2 files changed, 129 insertions(+), 107 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

