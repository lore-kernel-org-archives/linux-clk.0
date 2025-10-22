Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477E34DB7F
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142909; cv=none; b=W8WEuqpuPthvvBA72bnI/DBtlfEhyiAkHpDpDBQlOhtAeA9vk1vx1t7XHlWq4/Bpb2k3eXVdfuFJi2+WvT5Suxx7jco/qBz8153p5EkKd7mnbKgfN9La5sGcxPGT7zt+scPcTdN5xiLedgzk3Trgv/ceLP9cErhp6c8R1YUWw14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142909; c=relaxed/simple;
	bh=NPYq2prUDw6E4LwASXaQMdEqr6v2oIwItNqZJN/XQxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dkv3x9E1/RUmmulaXVmyZyxKDlXtqzjrp9YpeJEh6d0UmuGY/X3JKkcgjZU4xtP76rY6cxB4RWRYZ1vYbP9Lk+GpHoelYCpbmWBMZpRJKpb4n3F5ThZZUmoerjG9tpGlN+4OyEpleNXiaDQDBDEy2Hsd+RR9HaEsSOaQPIyVX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN2k4WE0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN2k4WE0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso6788061f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142901; x=1761747701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=dN2k4WE0ZY529zJSRBJ5ZwORqoW8KLeZSCDG6UUz7GYvoOwhMzgy1KeJ9j7hImNFYF
         6jgoUufnykUb7VrhHxH/ZbMkng2hRNLbLq1WXb94zmPgT7TBt1gYeZypt52aMSWdZn2A
         /nijUnNp08qxO3kNmhbsPtM1rZZ6YtRpStfEJITrlnFL7NeNBPcQxQrX09tmPKQOT2u/
         s+OHrFBQERBAlc/eA1zcXlLEhbwAo13Ju8WQ4DBjWVP6U7cE2wtMvU+GOUVJDwBNR3E7
         KyiRW5CeKo7CM6Ec+rKxfvq20nd6aTr6KFQO/Yy+9nbETsYnbb3kD+PZ/nQYEecAIMQC
         KA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142901; x=1761747701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=X8X9bCavIuK748uAmiUAjuwOE1sK2/zD/zeY8hA7Tt7J3Wn7E5SOtKWQYaS3g/zZjN
         STl9myRQ0C/w3/kWfbsA45ZfPFEcP2P/p3jFBTfDVBcgMOQuE7hFzbVCDBB8MpfVrADV
         9bLwrl7nsYi8Q38wxOA6avaAe0DJ0cGiwHpUrpaY8Rg1Ie0S2UFGvJ1Msa8b0WV5VDVi
         Uw58m8SRlzqe/l4vrTsoEjm6+aEQU/SN81z8sCl1IoyuQLZJ/IE1Zln6MMR+o5UuMpX3
         bmK5WQt5fyRCVLC+e4OBI2R6zGqFKGUVIVcMcdeeAfulBV3M+qxb4WLwxtbRdcUPfpTo
         15Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUoVwYZyDGH/G99bqzxmVWzYZK1l6wgoOVT2De3MSRMi7sbhVF4Hsdkv0MhVlmtNa4a5yIqZ8vRQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhei9ugfdORe4r/cM/3yCTG+qi93jSJ6Oi23OphJYjyqFWOipU
	cZvwVIMQujoVYBz3yRpWZnV5zoBocl+JrG33fY5HWSmRezutVwDmncN5
X-Gm-Gg: ASbGncv6GXxIbi9AfybSxCsi3VEnZ0VPQ272ghU18QkzSbWO52qzHr83+Az1L13H23B
	2pVyazwm/GIqbYAaEo4MfiYNaV7uvXPPCht/qMmOVdIVK28gKv/IZm9mt+gQV8dzSkSfPiFmpvW
	nRBnycJ3rk8sBtMcp7jD9RCMANAk4pSRqtzmnqyU97wyCWOhojMSTEjzxfDjRZiIzorstv5fHlV
	uIzi0UyOFhzvaIdiRPl8Ror42qKwQZHIvuVe5IXXhaHKdvWFmWq8k4wPjKj9x+/+nIL/9rPqKUJ
	0paBUFsZLIPzw2KXIxavXNLXpwjMsAKOQE7l74NFreUV0lHLUNxgEKRwSaQxqq8JNjAiC2ZSaTN
	LxndSEvtiAdL40r/vEqlmW1lPuupc5m3SY0MYZP02VSJAVviEOFep+Yg20AZY2uhDcbfq4IjaYW
	l7dg==
X-Google-Smtp-Source: AGHT+IHM03V7eJFt3Eu6ja1MYetjG461AcLXE4YT5HRjXzs799spnfwnfQrFSdx7t2nEB8DurbecfQ==
X-Received: by 2002:a05:6000:24c6:b0:427:928:787f with SMTP id ffacd0b85a97d-427092879c8mr10794030f8f.21.1761142901362;
        Wed, 22 Oct 2025 07:21:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed, 22 Oct 2025 17:20:38 +0300
Message-ID: <20251022142051.70400-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MIPI calibration device found in Tegra132. This compatible
already exists in the Linux kernel, I have just documented it to satisfy
warnings.

Each Tegra SoC generation has unique set of registers which should be
configured. They all differ, hence fallback is not suitable here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1

