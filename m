Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8403535D7
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709892019; cv=none; b=Z4LU3+NBVaiSnSHo7i8DQu62XtMXZ+nhNe5Q2Z5sfVFE8K8sRir45VdY8qNIUuHLT8LS/X8KodDNPvze7QhGX0BO4ctT2kIacksr1xIowcnIseIhx4rHL9XQ8LhK2TW0hyK098qG1HtoPTXbEEz6mi9oZc2U6hcUWjD1qoMyAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709892019; c=relaxed/simple;
	bh=4Cq6hyG5V6lgV6GytS9TShPkv15tJRH6MPVRuTUffmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IjjgBrVsJAMchGP2ieHEPN++19MDg0gDuZZVC05Wk1rCuoaCvnH3Nj3pO4uUjtho8kpB9x1LCN6VwFj8eeUJ2o9fN2c0g2JTNwUmdEU/oZjFeb0m+HlO81wef1F+exScRLVF5kK03aPSMhjQMhcqsVzj9US+EfcDEhCoI6M9tjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X4g7syj0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X4g7syj0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413183f5e11so2294555e9.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Mar 2024 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709892015; x=1710496815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dI+EkvO2k2itkQ+4Wvz3IcWpTJAxVhTrdZVR5FX373o=;
        b=X4g7syj0anMmInLqZBNZyFK+FiJcYBFw+iVGJlBsxhWN2Gl3u6RU+KoYXx7YEwGcxO
         3YUHPjEl8Z4k9SYSLYodvbkLSnKxypGmZKj/BPbUAfSrokanW0f6U6m5oD78BVEklJus
         2ac+nBrgPgjBCJBZRTVp/dNCHbdiJHR/4FwFBDCbdgFSViksMKwciunhk1cv9qIlNw8A
         BTeP/qaTldA8tbe4kaN0EfFofL8NxGV+KZLZirALG4LN+jagowfzrAVjpGUe+aFDZDzU
         6vHNzu2AcmG6cN/srqdIYTZuct7gbAuo+8UvW8hk2r+Mz7pjdBZJAXyKzjj5gs2Gx4nb
         u2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709892015; x=1710496815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+EkvO2k2itkQ+4Wvz3IcWpTJAxVhTrdZVR5FX373o=;
        b=NsWOKU5iMCf7PsKk8Q9KMvEwe9WmClce4h1wSEpO1mkyKIaAnNa0eB+hVeQ59Em3Is
         RrN8VXCKbyQ3AoGVjNgNDj1+Uw6YNnBaQBwYNyCIoga6/Vf4xpa7gwFx5V/99K3qX/aP
         gOYAv9mJ0AONh0RC7gsq/l7oUpT/SJu3aof3uSRmIZ8hEu2gLvt0KamB37B+MfiBeTiv
         s4JNfEMfljypqJjpi5f+S57RiruK+nL9V7G28eEJG//lqWOb3JetmpDkM+raBGqLyOXb
         nOyW1izjrP/fch2UYYJqxg11HiriFUVINTdjEet89ltbTvh38I8KGpLaP4/jI+BVHv+8
         d5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMK35A9xyOyzHVMLSDKsiS4I+HDKNcEzmvo+OqvDVP8rnl+HNyReATT2P1EaMhcbQDsp9Q7XyfVMq+za2l0lzF9sVpKuUz0DEm
X-Gm-Message-State: AOJu0YzYRHfu6wxq9CNqRO/G3f8ieFcM4qOTDNZpsVA63DhrEFEe6YeS
	CwKW9elUQynPP1GChLiLP/Q+Fxbx7YnD/jwffYc4+NLc+4hgCMa8OJwX6dok3cs=
X-Google-Smtp-Source: AGHT+IEQE/1qeUOESsKPVtciOgLw2DK/vi6tnQKiVvcoVyKfkCrPiYdEgieEq83fy8he0q1E6IQizA==
X-Received: by 2002:a05:600c:1d12:b0:412:ef3b:6f0e with SMTP id l18-20020a05600c1d1200b00412ef3b6f0emr3969562wms.11.1709892014952;
        Fri, 08 Mar 2024 02:00:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b00412a31d2e2asm5446795wmb.32.2024.03.08.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 02:00:14 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip clock updates for v6.9
Date: Fri,  8 Mar 2024 12:00:13 +0200
Message-Id: <20240308100013.697607-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.9

for you to fetch changes up to 72151193839e4fe222d0be9931f6ba3a94de7aa5:

  clk: microchip: mpfs: convert MSSPLL outputs to clk_divider (2024-02-06 14:07:18 +0000)

----------------------------------------------------------------
Microchip clock updates for v6.9

Polarfire:
- MSSPLL hardware has 4 output clocks (the driver supported previously
  only one output); each of these 4 outputs feed dividers and the output
  of each divider feed individual hardware blocks (e.g. CAN, Crypto,
  eMMC); individual hardware block drivers need to control there clocks
  thus clock driver support was added for all MSSPLL output clocks.

----------------------------------------------------------------
Conor Dooley (6):
      dt-bindings: clock: mpfs: add more MSSPLL output definitions
      dt-bindings: can: mpfs: add missing required clock
      clk: microchip: mpfs: split MSSPLL in two
      clk: microchip: mpfs: setup for using other mss pll outputs
      clk: microchip: mpfs: add missing MSSPLL outputs
      clk: microchip: mpfs: convert MSSPLL outputs to clk_divider

 .../bindings/net/can/microchip,mpfs-can.yaml       |   6 +-
 drivers/clk/microchip/clk-mpfs.c                   | 154 ++++++++++++---------
 include/dt-bindings/clock/microchip,mpfs-clock.h   |   5 +
 3 files changed, 96 insertions(+), 69 deletions(-)
