Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C70A1B87E3;
	Sun, 12 Jan 2025 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689233; cv=none; b=gOLmiHOV6PEkG+13ARIrG3HHJ2UK8hH24f9vpcTViJgX3B31u7abaMTKzwjhk+NLHdPzTYqAtB62/F6NMT2ABAQg3dZbL2Cbc38IaVX0xW23gsFkXzNIs6zUB78Re8ylhqqRL95+k0y2JWYk3H0G76kxzL9xns3ffy3LIs9Z1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689233; c=relaxed/simple;
	bh=7GIQqUjlMT5bgex6Ozz6WNE/20sFjJIoGKoZOcWPOlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmFYx3lL2A2bBxlQFlRZGw+jm97lho7Truz0OcAdHC4S06KjEWBHUYD2yarATzbUya6ODxZLn5OA1vBg6BFUpkS8doAmw4mmMcBGI2WN0gSh4AiMdfCedPm3ikiV6j1bB8rmqslXYuQP2Fgl5d43KBRzE1ZY7CdRjTsZn0PKVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsfRoOOO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsfRoOOO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaf60d85238so653849266b.0;
        Sun, 12 Jan 2025 05:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689230; x=1737294030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2d8+jeTpX799XdIAphX2pC/RY7vgNu0VjS1hTZC2as=;
        b=JsfRoOOOs+pQqX62aG9udgna2HUBbIvW/JfxkBOjOW9kzjtfdmUeurt5vxgMuEBJHi
         Jvfeo4gstDE7UFNVrKOLcteBpKQealDyHv4m4OjC2yi+IJLH1EsYCv3kzv7W8QyoMEtg
         44d11TdoRoMHD2qFwk1AEJYQ8tptabwFP+4ggaee+aFf+47kmCZpMO55384queihJyDS
         3rP9FseqkwSltca1GOtk/OpoPQX63i5qmvLh7g+CBin8h+OWR7oKxd485cfp9kUMHvab
         Zzl4OUrdLfn2O4RW/+DbAObSwreb7BASNFFi6BM08NcBwR6cIY4bXJ43tmYnFKdvCGA1
         o4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689230; x=1737294030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2d8+jeTpX799XdIAphX2pC/RY7vgNu0VjS1hTZC2as=;
        b=Gd2A5LV5FiphrGVI6/PYl+pz8Jvk9C2dBLtDUMo+Z9XSBMNGvuqivpSL60xaVMTNnM
         lWDugtFd/TtStFmK+7jO6t8T4TuBmzK2HxSyG+z2/vOUXIhZ/IuSh+PAcwTOr7yPDLzV
         nidxXBaJ9Uiil0fWoDg5QfLIzLYR4JyPPb0zha+UX3JM4hm1YkftD9gdo80NKu3cdqNp
         d3wNzVvaZaqA4raXM5xYyZgNDb0Z2zajWNrm0Tao6rsHT3P2xRUkQBBKG4rZCGZrqFQS
         +Ss5V+4vaatopBlWPBMUHrImZkZEYnsy5ZdvewxkBQz2xjRVKXb4aGwVDwWq/fHsVqcu
         0LSw==
X-Forwarded-Encrypted: i=1; AJvYcCUEmpH43Qe2lxuSmv54e+X7Kj/rAkX/pha8quJOHgbCyhMtNFaTSEb2ubyE+wDC9yDnGqS1yggZibT9v3LK@vger.kernel.org, AJvYcCV9ts35MEbqFlqvULHdAib7k/GqQXFLO95SXnJaajkBA1L8dppf3tE1JyZIc/W6Kc0zzi0F0rbGQh77@vger.kernel.org, AJvYcCVb+v/HVtko9FDwT0J5gA/L254TsTN9taqK2PceLXFdqJPtIAUAuZdYZybJAOaGgYuT7tjM3r0GYwxD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Ecih6UEUETySaM4xUp4o1IA2tWCp/BWWColAjmC2Hf1yEtf/
	SrWvnJQlfswWR8VeVW/9ytG/mRDnGC5u2ixRpCr6uiJXcjkSMHfx
X-Gm-Gg: ASbGnctoNTRYDpoWc2GFfppt4w8H7wQffSaR9UnisbcUswHX4Iog0roBUd30epnmi6b
	ye5bhEa2K5YB7r6LQ0yhYsElj+sNzX91iLgPyXrixD/ja4HvIC+4wXbZ+p9W9p/7M90W8Wuy8wZ
	De+SVQPQM/1GbToxE7gqtgzh3tgn+lvU1aa69UFOa/GLoeJ8mBZsNTl9J0D57U95EsAcWMGxXZd
	nXU/FLp4qIZW0Ny4+iKZOI8Ymf1N7D9GTB4ZnPtCyECy1RK2Vj0RXAs2KKDC58WT6bzpT8=
X-Google-Smtp-Source: AGHT+IHADvd8u6xRephvXlpuOc6xQBI4RHqlOGTeRCG7Rn9BxOz0NFUfKVQmvbFKUi6m+PXcLoy4nA==
X-Received: by 2002:a17:906:f5a6:b0:aa6:8a1b:8b84 with SMTP id a640c23a62f3a-ab2abca0be8mr1636794066b.57.1736689229732;
        Sun, 12 Jan 2025 05:40:29 -0800 (PST)
Received: from localhost.localdomain ([109.52.222.172])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c90d9a46sm379421266b.54.2025.01.12.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:40:29 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/4] dt-bindings: clock: add ID for eMMC for EN7581
Date: Sun, 12 Jan 2025 14:39:39 +0100
Message-ID: <20250112133953.10404-3-ansuelsmth@gmail.com>
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

Add ID for eMMC for EN7581. This is to control clock selection of eMMC
between 200MHz and 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v4:
- Move to patch 3
Changes v3:
- Add ack tag
Changes v2:
- Drop additional define for EN7581_NUM_CLOCKS

 include/dt-bindings/clock/en7523-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 28e56745ccff..edfa64045f52 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,4 +12,6 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
+#define EN7581_CLK_EMMC		8
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

