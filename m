Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC74C6537
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828003; cv=none; b=DbAkOhDbmJ9AGM1+lDYErMgWlh3fgw5GatPvIZJJt1R2QBSuzOwrjlqwaqNIZnz7EjdLD8fW4v7XbpGil2ENELBlLI49SfEmAU+4lQ4SAGNKLibfNkCLtBw+DCpRB1QiVqmeFHh5m09y4AZCUYUefAlnax3P67i9lPiRWqkzqik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828003; c=relaxed/simple;
	bh=S2dBBIifzufeG7jvev3/uimqR0jcFF4c6YAp5n2nvcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnyZEbDSSrPaxcoPMW1Eo5oS5M05meA31t07XD/OS4wAKFPS1SY5lSLrZPvC2Q/CAGwrbB1THuzXHI8/wXowxXLuYqz1asGZITNk9nk5ydp+yhYo9AFNG58wScqZKkeWw43lanK6IyyzDLFAENVYypLDBfPUH4NKTcgdv00JfnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxeyOr4B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxeyOr4B"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso15005645e9.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828000; x=1792432800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=jxeyOr4BFFEELmQ+tvRVzwrDsmUpRxhhDyTy8yqdrbtpRLM/83D442fu4eMDb5jmuf
         0dwnvtGGHEdnX47WpYBkt7IdNADB7K63Sck3C5uHV+/FrrAU+p4/JCLfCVS7dsqKVGqm
         aPIZroXhm6WNemdKjIflRgSXstZaDGRKvZVTr5jiJooAiiY9fbo5qgc2r2QbtOCf5Oei
         rHxDtBkpufpW0qt7E3xgd5P9ZOwJXwnbWFoQwQzpww6DAHABClK8Z2Iv2eYdPjJZrexg
         Ndc4JlaABhnwJggOImOKBYt6e4NzzUFRx1siFtG2lSi02exIyz7C2onR67iAqshMY6nZ
         IOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828000; x=1792432800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=KXjTCgCyyReVN0s2vdAYAt6BDAHCB/beKkGCcLgb0KOPVWzAVWknXkqWwW9JWA+iI3
         ErRKQHkClrRevtqFUQ9tgBrjcixLs4Pws69FFrK+Fwkg8uVic1Umj1FPxWfcqOHJSZ87
         y1TTXfUpJt6oHQxe283Mt3qZ3Y5G8sGxfzShGL6+Rimlg7zc7FVZuwrjho1yo4Mbk0Yc
         62c1LKGFY1GodHOyhFBmPwLfviMMYgUEcIvmPr6iuaXkyk3/kxcRRo4cqMKCYzVTWzGn
         YmwycUZkwuoQD8g0c1ukOQN1GDv3InSsNj5Yk4p6VAsAQn9PCS0o/KJd4sIubAODtVBl
         soDw==
X-Forwarded-Encrypted: i=1; AKwUvBwDaSKIplu+O4k9dXCw4K48Z1IRxPF2nhOWa69yvSDKBL8BMO7mrq6JUH0+taDpLmTnztaJAhNMjU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0l8CycncZv5tUlJuxZLP23mg7NrfK+VPKE/O8fRRUIpwosnZ0
	7mQtByYteLEDLB8QpZpZagVkCOQ5g/mfgrLch/HpjGhSUOqNrLEumg7R
X-Gm-Gg: AYBFou1npI0NTa0UKPR6J4WhLAWH7Yye/ttDhaL2ZfX/FRK8yYH2OPI9HVq9HEz2jpf
	/ZSLO3l7kJzIImjl6I5cDNrRSN4sRpXT65bVgkl/Pg69HY8Esx8EVUf5Jp9YSUKLom2VwSk/6jR
	J0scT9L9G1gJOfl4fjp6N39Eq8S/NYDGa6ne/2MCA90khoctCZVJawYO7/ZZeqigqS29HVItm1c
	teexZFjgu8I8N9WiUv7a4vjC8Rdc9F97p18k/54MTd6B9mbFS8V0mrQZGcokDtkEh7+t2d4IEz/
	FNaaJS70cSpKOXCiBdVG55A2rL5id7Sc3oT8oXIJxqSIO7AIPencLAYRz8KgRQcZ1CTJRtfLpH/
	fPluMUplPfpx2tsMvZVLkhRdbGk701FgU2X/QJOI+rwJLugJxpfay25fdAxXNHL/9Y9MHe8jlAR
	O0OYzP57E3UqW2JKtSZYH0pZk46ElKtJN1a08lMVtAVbarbyj2bWdxVZqn/WNeGhYcLPyiefgOp
	TxXybtIequBk4oB
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr193832545e9.24.1791827999830;
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.76.80.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm561705395e9.9.2026.10.12.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <electronicconsult1@gmail.com>
To: m.wilczynski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com,
	alex@ghiti.fr,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	aou@eecs.berkeley.edu,
	bmasney+clk@redhat.com,
	chaoyi.chen@rock-chips.com,
	conor+dt@kernel.org,
	db@domibel.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gandalf@winds.org,
	hal.feng@starfivetech.com,
	heiko@sntech.de,
	hello@big-grey.co.uk,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	jpeisach@ubuntu.com,
	kernel@esmil.dk,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com,
	maarten.lankhorst@linux.intel.com,
	mani@kernel.org,
	maud_spierings@murena.io,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rfoss@kernel.org,
	robh@kernel.org,
	sboyd@kernel.org,
	tzimmermann@suse.de,
	u.kleine-koenig@baylibre.com,
	vkoul@kernel.org,
	zhengxingda@iscas.ac.cn
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display subsystem
Date: Mon, 12 Oct 2026 18:59:41 +0100
Message-ID: <20261012175941.258219-1-electronicconsult1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a VisionFive 2 v1.3B with patches 1-17 & 19-21 of v5 on
Linux 7.2.8, plus the clk patch that was 14/20 in v4. Patch 18 was not
applied: it conflicts on 7.2 & there is no Rockchip hardware here. The
same kernel also carries the out-of-tree PowerVR BXE-4-32 enablement &
the SiFive XPbmtUC errata patches, so the GPU could render to the
display.

- The dc8200, the HDMI controller & PHY & the vout clock controller
  all probe, with nothing left in deferred probe; HDMI-A-1 reports
  connected.
- kmscube (GLES via zink on the PowerVR Vulkan driver) runs at the
  monitor's preferred mode: 1683 frames in 28.1 s, 59.93 fps with
  vsync, picture confirmed on the monitor, no GPU firmware resets.

Only that one mode was tested; the modetest sweep in the cover letter
was not repeated.

One error at boot:

  i2c i2c-7: of_i2c: modalias failure on /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
  i2c i2c-7: Failed to create I2C device for /soc/display-subsystem@29400000/hdmi@29590000/controller/ports

inno_hdmi_i2c_adapter() sets adap->dev.of_node to the controller's
node, so the I2C core registers the controller's children as I2C
clients, & on the JH7110 that node has a 'ports' child. The display
still comes up. Should the adapter get no of_node, or a dedicated
child node?

For patches 1-17 & 19-21:

Tested-by: OOHehir <oo.hehir@gmail.com>
