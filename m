Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717112FC890
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216056; cv=none; b=JdbXKzDINfyPGv42nVdnC3mlanh8s+SnQkRVtaEQUvLXXRxUMjrHV7yFJ3fRYs1RUrZjDytYs52yNQNRzyAAh521m3utw9nK+5V641nT/Xai517VXnINHIsiIxdFSxyEtwX7L1ELDjrkF5Sg8rq+6jQUGgSaRJJBtszG+0LlxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216056; c=relaxed/simple;
	bh=vHkwErpfhnxxsv02IcLQLhIy7rGI2ZohNEYD9R+2700=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=URMUt7IG/zkyp+z1O7g6wqFlrgiQNfvLnWfloli4DR2R173CIrgBtLEDx6lYOtOJoNYlrvRAELSitc7nYLk5EuDQRH8T4vbPScrnVOgNf9OxUOX9vzDrc8lvugWrzJ+DT5FttHS4z+WC7kb4WmSfRcZHn1j1oxfCc0tlWb43pp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1xyL9j3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1xyL9j3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so4934126a12.1
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216053; x=1763820853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=F1xyL9j3bVAI4D50nk9qeQaIyMUGfIQv6tshhTOti+C8+uJau+WD3MUt2hupYhc71e
         3AJlWmoQBcg050dOy6QQZLueyHrAfkd0csju6vq/iadsUooRN21Nl7OQdsUNxFfo+UFR
         RSFeE/30Xfk8vpnl0K7fUoqejZdux2ozeUNNLLvaffWN3L8QV5b1bs2xMhSL2Qmvm2Ti
         oB+BXG5BnpeIAHfmmRgihLa5YhtK6ti4EJeKGPt0i02inGe5h7YaawsogBRsJuEqDpk1
         m4f2iRKJV3/zZsyb/IMucWLK7WTUlk1lM+cD5YUcOI3vaxio5V08zheIC3l926/Vm5f2
         MraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216053; x=1763820853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=Joaoj1DuNUfrOw2eTosknn/cHC0jjUUunsXHCc+zjmvWsYPgd+9H355kv1js4AL67L
         CtuV5Jn+P8qdtZtKsK3MSd1HZyz/m/Tw3bKfbePYZhJmvq9evaK7Fwih8kDlYXckjBOm
         3DUE86aeDtDvHWP4jtFNkgGEfeuZD8416YHfBudi90cnv+R5zu1MtGo2rRe2uE/GlKDl
         kdvC/UF8nvb9XlgSfgxq7isqYMoOhYy5YmdTSFMAFcm/99fT1N5nIXTsbyNkoPKK7PI5
         zdq2igUulgkTPzavcdLlymBlFb7vqyBXS3DIOPlMzUU+UepEre/lXvZqvGtXji7Nz1+g
         4U4A==
X-Forwarded-Encrypted: i=1; AJvYcCWctysIJuEfDkCrfD+GoyKkaPJIZROFu7L1XbdiZGWzUn1uFh18cs3YWrU6DaiPLe1cNUpyWxqXIwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuhIGRwg0fbKLD3vdz+Ro4sLi4tXgKYND05iN+7f/r9HUseOg5
	mwsZ6mS5ouhjkOrhd0qjrSXwBgC+0mZ5ciLW70Jb5Hfi64F/ZwsMOJRs
X-Gm-Gg: ASbGncvww1pmN1xW1m7T3bq2rxqD2Bn0QF6IjaHN9vyKobixM9Rhhe84x83SJigeTNt
	XU2DMgdtRGqfi0Uz44HKOgPCMWreeA6rjo1i98/WYRQx0k1Dty0eSNGLlPGDxEVmyPkY96+9V3B
	xmfgtji/+oJEaSoNC3BRIibUezhiKwIl/VdUF++MWSe/rtgUtF9P96B2cPf3F01u+ejygbaawPl
	PQ6P2wHBOyGGVqfS9YWeE40Iv18KBC1xvCx/qxba6KX/O+sASWd/cz/pO5hQjTS6f1rIuaBciVJ
	eIH3AtLLO0j4EHuqHB4Dxh4c2ld4BnoHeV7ZnV8ANT6yqowhSdhuu6co0bAxy3/+peYvLVJGuqt
	IAJGmBYYQPmCYMoM33Cg6k2n9h3T/0rOPMsVS51riDc41K7LSI1aw+8LmGkehssyho8C/eRqfzc
	UQiFmqZ7exFy6sN959ZRtMhmfAFubeNlHbOp1y66b3AdPO61gG2LBs5rWq
X-Google-Smtp-Source: AGHT+IFp+Taw68EnwDXLkJFHgktvsI4Q2Kx6E5s2D/JuSsEx96b8Hqrxaybkmry8X04xeOfOSy8LRw==
X-Received: by 2002:a17:907:25cd:b0:b72:6383:4c57 with SMTP id a640c23a62f3a-b7367b79f4fmr713777466b.55.1763216052568;
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] drm/sun4i: update DE33 support
Date: Sat, 15 Nov 2025 15:13:40 +0100
Message-ID: <20251115141347.13087-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Fortunately, no user of
H616 DE33 binding was introduced, so we have a chance to update bindings
and introduce proper DE33 support. Issue with existing binding is that it
considers planes as resource which is hardwired to each mixer as it was
done on older Display Engine generations (DE3 and lower). That is not the
case anymore. This series introduces new driver for planes management,
which allows doing proper plane assignments.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (7):
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  clk: sunxi-ng: de2: Export register regmap for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Update H616 DE33 binding
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  44 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  53 ++++-
 drivers/gpu/drm/sun4i/Kconfig                 |   8 +
 drivers/gpu/drm/sun4i/Makefile                |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 205 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 130 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  36 ++-
 12 files changed, 543 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.51.2

