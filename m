Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4BE14C5A1
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752394; cv=none; b=QUeQmGa2uvRa32snFONyxnxHOIam8SmCZ2ui8imLAby3nLBzS5RV8HSSyVMcqISe7i4zyr8GknXuAwl/OFVZHupq+YB3BJFZyia7fNffYSmWa/Wde7zOcytrs+/iUAl1yNrnEoBsTb6w7+SLws4RKtll2jK6zC56dShLHLuEmtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752394; c=relaxed/simple;
	bh=Rlsm3g465sL7REjC1ICV1eiOlwWaRmEDM1DT0XXv+YA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NNxJ1178ZR6SAQBQLHAXIRm5/NXte4Z44s0h2BjNdzFG6I1aHBkVWmDQBWtklQDEmpOKA02OzUA5MKXET0/9heLlVT78GccHqKIKi9fU63qKfEk2HJBY07FmNXyiznjUleW7lcq4IDjsTRqOMyPdHIuTgrg0KCxmoC5JB5vTWkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/y2ICbV; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/y2ICbV"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-708cf5138b6so4367083a34.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721752392; x=1722357192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgQLREszlba2w2e3rfY3g/vnEu09NDSRrgY7DbqY56U=;
        b=x/y2ICbVqcUiU02XjFn/lUWlurBQ2umA/4pmmpitBbu6O1A+qVpdlbN4ziwSjR5QBZ
         PLJkhXvYcPFqoqtqYFlT8+Rf/IikHevM1xRQjtNL3EvC2ia0G/WZQ9i3PNtS1Sr54KoC
         QkTIkBjZEFG15PXcg4EOLw3m4wNeUG3lME/ZvXSNSSfqW4fNNaaeBH92nMTlf4eHz5t0
         kb/3dHoLwijLz3W3KubM7LDbxKYF14O8/m0V74ngylrnDrwXSJnku46uHz1sx45CnRfh
         HfKFFz16xjKgm6YxoE1mhGhX4/T3jpCP+jAHmkaej3WAFZQhTztSvjU0O00VbgwXBa0l
         RQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721752392; x=1722357192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgQLREszlba2w2e3rfY3g/vnEu09NDSRrgY7DbqY56U=;
        b=iefCIpIEQnCTTo1vYL6y/wAAiCdrcCfi3u0X3RqLx8sEf4UEGkn1KnCVVLezcfzAIZ
         F5rgoOdHI4LF4El07h66EjaXL8Rj2uGzJyqq/voi4p808jQHE10hvwd84fZVYw2Ejual
         DEu9vlDtA3zSldP53T5d0SYDRhLoUSRlEaCubFz2KjHoY9wvuTpRBmpmMQ4uzWR0+JDW
         vadACtcrNu0k0itFULVjAwDo7HLs9yZrGyysroPBVmFAZmLLPSPlsiQYZeW2Z2bSJBRI
         /BAInq5ik84nX6RRWzB9HHKI35yBjA7dHwnMZrjxgjVK0yTjHVWlfpquDq1VwAmZaq4A
         /CYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2L2DXXKGIPzymdSxcs7xaFtbZs2P5B1EO2ZGlLBHekge9Ex7a8zdZ/ESUFOe+YlZ1p+ZI7zeZDx1809lBE9zSTwv7QCxG68CP
X-Gm-Message-State: AOJu0YxhYNTTF9QQr+wefY5n0nGMwTHqO2wrGYfmQMVv1OQPtTRq4mcG
	OUkX1iD6OB5WGz7JtsB8XqehyGZ/PoK2hG39VXtp9Uv2RwXAfZC92+zgH/xJZmE=
X-Google-Smtp-Source: AGHT+IGBpe6peQ8ESbWSihyzWm1b4sHXIw/4hvjia5dWTqI2J3ZsUT5UEo2Jo5H2dBkib0oiHWbtaw==
X-Received: by 2002:a05:6830:6f0b:b0:703:795b:f675 with SMTP id 46e09a7af769-709234ca4b2mr449959a34.28.1721752391805;
        Tue, 23 Jul 2024 09:33:11 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f61913b8sm2059965a34.68.2024.07.23.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:33:11 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Mateusz Majewski <m.majewski2@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: exynos850: Add TMU clock
Date: Tue, 23 Jul 2024 11:33:10 -0500
Message-Id: <20240723163311.28654-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a constant for TMU PCLK clock. It acts simultaneously as an
interface clock (to access TMU registers) and an operating clock which
makes TMU IP-core functional.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 7666241520f8..80dacda57229 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -358,6 +358,7 @@
 #define CLK_GOUT_UART_PCLK		32
 #define CLK_GOUT_WDT0_PCLK		33
 #define CLK_GOUT_WDT1_PCLK		34
+#define CLK_GOUT_BUSIF_TMU_PCLK		35
 
 /* CMU_CORE */
 #define CLK_MOUT_CORE_BUS_USER		1
-- 
2.39.2

