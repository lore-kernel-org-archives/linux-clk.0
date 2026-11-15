Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723082;
	b=5WRZVNIsBV6OkEIecSESVcC70Dc53YiMFIgAKj2wbZgS2SwXEbgT1ZUYrmQDB5XvBW63
	 4nxltP/S1/iNtljLQwW6jkxrTzRVeSPvEC7d9ssxxtm2m3s6V4vsCqHNUbwr1KAG+y5YH
	 /jYH/VW3CZpKY8D7xQtOYwQt1hHbZV7C/RX1HBmEcTYvO0XEyafrKZ/UEOVAEiuda/aBv
	 SqLcmeqKmZD7Ktv0QqfXAlC2FNgM4bea9HK9QW4VtUbDhbvYaFyGuyV1wu7NU+bPcB0gu
	 KdhGoosjByb6diFTF2qUShc98BmhUwFPiA2OhCciskdI95lrjV7ZDO0nCtO1rvnRSQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
	b=p8Se2OGqmDTv9sIh4UVhYgOvPQhoK/XTAKTOuuQSRr/DeH131ol2ipxIXTq+g2/p+rv7
	 fUcs0nLOAE8D2QBSpP3d/amqlkQzFNDsCIfT4xHXX5dKTO+Ebj66xzRoIFCnqt9idyMP/
	 7jqIF2fkpy+VOfFctlNfyssef9AOYkchVJvedHGUhXbz5j18YOW0q4CJLDFzIJXrGKN3n
	 p3SzIao75YDFzfU2xBy6ygZqNUeJbNh2sPv71A64B8OgPyOQsXCuHHQZl/zJAXGzzCKwd
	 +42UtAUMUB/7K/NnCOAgai0d6qtqAkAorB0iX6atruLsoNig0pQxU+PVAWK5SX0P3zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfGO72hV;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0F606A32F
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E0F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfGO72hV
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49318428d98so891477f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723081; x=1795327881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=PfGO72hV+7K+Bg2rbbjq10rm0RIetCz0/FRxgVqU1XK8ZLsGG2X6lmqmEZoUITZaiL
         0uVePmMylD2kf/99hIEE6d3FIyF3HedVSiJ83nuwDxFq3pm0+cACun6X1eQ3LJ0Pgcs4
         jbJ7kzb+9QYKJfh/zVKkpVccIhy07LkJ2EZsB8pEOP1QP/rpxlrp4MahL/WdgH0iP3ey
         Q4TzQiWbARjL4aE8xBCdzTQ8I30mT+WNQ0dFI3dZ72aju5+vcjuO4HvY/jkxtkImKrhF
         RROvPReMcLd4HTt1r68zwPJRzOiAiTP5TGNSPwC1qU/GyGzWX3W+0S0G4moO+g+bzz25
         G1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723081; x=1795327881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=yC4nl2qoo12PzK+hLMOipwUMz6gvIn13AC4SES7skhhDa95iLg9sd2Qdc3UYrD1dB+
         D4lpwC2BwyYscyRUWRlp/6NhBJq3Y5UsjxcB67X3cPESboXoqLcfWigcnDoOmYh1bPMN
         Yq+uU8T5EY1O/uoakvuX84VelBzmM7FE804Jh4LcIPoG/FAZjjlR+eR7n7NXAhErF0Gx
         qC5qm17Y+UO7EfOrGLaWsTz2FxBRd3md1oIuJrT7RiMw6qc9sC8kgXiXfVZpZ2mYsOB4
         /EIbpZJVUMWTz+sDP5PeekChVT29lxYaixkbZFGo9MtQgq/JPjo5Vxk+3JSN7M0dIcJa
         WBYA==
X-Forwarded-Encrypted: i=1; AL+hErFwjRm4090rRjCoMEpI/qLcpFzttRWHgHx0TJ5UfitOWAB98RsoGIey7UelfPmVJNNSV0e1xorB9D0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/+Mrqx58d8slt+YWHZi6RkLXTdgixSNRscKD88s+3hQjFKoAW
	4oYNEiZn14356LB5pzRrujBgqXORx5zrZfC0mdKfLguP8Zgdm05BuQV5
X-Gm-Gg: AYBFou1yXA6wKjtO7LlAYv8POD1ya1ycQt4yz3yoXGaCbVtKq+FfhFuDZxDxBzlNb4f
	MScB72Kr8+jt20h92ba2AZQHiva60DLmv4L81xVl7XQsKC+Nam2Yseb9j5J/DDXdfiV740er6Kw
	3cW0ephQUpwhHy/qa14o7mXu+onnv//iJLrB+mUaoAaEFxW6vCe1SxIa76tK+kwCPykIFsv7o7L
	ztcdndQ2xlggZbde4S6AYPsYJOh0Sxnts3yZBBSO9Fv1fG7mzM1uxaIcI0y0ww6xpWgDXbqlYfF
	S39GIsQ7HVNnZI9dunRtCIKvUaqFbaeN8H3qGx759761rS3dcOMISP4SKzx2/OxI8qJn+F3pN5T
	iQ3lD8Lep8tSjC1y/M8HkNCe69Ksb3FB618DpP7lYPXK5BlZ51ib5dQt1EU+1LtTYWU1wK37Igv
	pxTIdsXNBQeLF6yXfO6n8Aen9XlRFIgw/bvaBHTm1KhV4qMRXcqQnvEfXNdFc2m6moCoKcikBYG
	Mqd65zEqj6LfZ6TO8q9u2KnOsUhVCZqexnWeemLtek1XmfBSs8MZKUJJsZTaISLwgWINQsD3eSw
	P/kgJ2H9vT6/cVMWV/cOb8QDAyD4IQDjAVWdosyRZq/r0s+P6uP2PaKzLSNKABhzUiBNhX7QdIQ
	J3Mkg2snw4fn74gWkAGCfhQIcSCwYktUGPLFcS8iZvNgZ0Orbcs7wX1WxC89PGO4rCBG4CBg8MU
	DHndthz8VXFc3/uCxn7aSGoLfCF/LMzEXebm1T4CbcxlpA/x4TYhcUPocwfBmf4rOnnVQ6EQNy9
	8Bmdhs1C0dqEA==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr148514035e9.13.1794723080596;
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] drm/sun4i: update DE33 support
Date: Sun, 15 Nov 2026 07:10:54 +0100
Message-ID: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 7 and driver prints error
asking to update DT if old binding is detected (patch 8). See v2
discussion for more details.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v2:
- rebased on v7.4-rc3+ (mainline sun4i fixes)
- patch 1: explain in commit message that DE33 has only one bus clock
- patch 2: don't register regmap with syscon, drop preset plane mapping
  and reword commit message
- patch 4: don't expose YCbCr color properties on planes without YUV
  formats (kept Chen-Yu's R-b)
- patch 5: collected Krzysztof's R-b
- patch 6: renamed, get mapping regmap from display clocks device and
  add device link instead of using syscon, defer probe until display
  clocks are bound, set drvdata only after mapping is initialized,
  register driver from mixer module instead of module_platform_driver()
- patch 7: explain in commit message why old binding is incompatible and
  will not be supported
- patch 8: renamed, initialize blender pipe modes for DE33, add device
  link to planes device, limit DE33 display regmap to its 128 KiB region,
  print error asking to update DT when old binding is detected

Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  82 ++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 215 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 193 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  72 ++++--
 11 files changed, 663 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0

