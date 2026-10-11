Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5CF3D170C
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744768; cv=none; b=tCm2cP0MqMGGNa5eFiQyUNQkJR8wlIK2E4tp7cNSwp+a3eesW5qHVjmowEHfWbpY+8Av74xnUBkHtPVdd/BmmGbWLU7eQyHCxM3ohBoB6a9ddiwb2o1S046gOIuaTOGR42nN75CAqonwVxtwO34QDReIg2aywit7eDznC80X4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744768; c=relaxed/simple;
	bh=yXPQpfc9suKyLzGtUqDK1jBB7VLe8tQS9GLwAXxdCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoOEEYQZVcxPTOzFF5nB+EQdEWs6uwdAF4aqh79oDApZyev1t6mnu/8mnOtiohZTvCdjseSwIlJkW0hYU7eebcZNS9yrYoOGKqFVNoNlyQnsmBrQ1eus3s/AiV6PyY5yMR3IjdpduioMqyFiJ/Fm92fxxVvW4VHJjiF6AOBskcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxQ5oVLz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxQ5oVLz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15253575e9.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744766; x=1792349566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=MxQ5oVLzvvMYe8921Dv+Aj4eIgD60YnftXu+cJah+y9ln+pTjJOv6Est8Jza/j5wgp
         GKbMA9hbmcDHtVEtnTNcgd55hTtDAH4Bh/Bx/1NXcMmHOYSuRcJkfhOHXQU3H9UMvxLI
         hrtcfL3nWXqnGfxqMd5z8Po4gJPx2win/9f9Zz/feob8oZjaPvpnhwbxhmC8oPGo++9W
         ifmyq2NUYNN3i5xEsgs/kukVz/RtUUzr1O1zisiGIKFxb6DZcfmVV29Fti41I+IOVHAY
         f/SH6TKpulXMFnk4j/DUPun3ZBU9atyjM32c0hXA4MsKcmfwFKrbzca/86yAJsLqspWn
         NaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744766; x=1792349566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=0unpkYPtrnQ4E3T53hbUPUZfEtf2pC+g5Wpv5kz8WIntr/4Gp9TAjr6uxvxfEpxc42
         VC2DGihD4hEKphckW0ZiUDgqv4osxRJUWz+VIPC6RUret6OX9DGXfsbiJa+a9KqBhd3d
         8OOqkQulQpPJtfKTg1LjIks+vEL8kYpnE5RgYNW8s8NKl5cyQGM+SfxWO4n56sPL1+iJ
         FCYCYY8kk763p+mhsWINQAERvlYN56JNe92xkFHbDygPOo3BcMCIMecAIGYOIlT8UaeD
         btzvnPLus+dMpeiZO/mzGtqUrDGsbhdQMPYJbgU3uQ9hqmXZLY6Xuq0j6TxlTybLnIlu
         clng==
X-Forwarded-Encrypted: i=1; AKwUvBzSekH4Vdr1TdKQ9Y5vXvbozXhRzSGbSI2iX5oPNOrGZd9Fn5eF3mXeuRh7WmnF+e8H3HLsmLjMH0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJg61r+YPiuNP+5ujgO6UCl/tart4jw5nVw7IyBIdL+JSKlC0w
	KF+VpvnfwIiIjdbvf06Y0RyxOYWNvVBZnq8Sx3CvDGy4tI7kKVM1ArOF
X-Gm-Gg: AYBFou1CbGvXt4nGhW/Y+1xowGjMBmhRhB+8emdKpmWFuBGwRQYbEXqYEjPw7ooLA5L
	pxsm1p/Q/s/B8WKbzCAKy3MFXl5h+slJWKXWDFm6UA0zKb2K//3ErXN9vuIjHrd8s0ALoWl4lIE
	TvTw9F/PNvXjm/PHH04b0pF0qmqpa8RBPaYt0lirV33JkmuSPnEVZURh/d0cnKsvXp4ECPhw6BK
	Avk2v0tcB2tNNdzEqWuQuKbaJrtH/28ziUE3oE93HHNAKrn/EFf2SB/pcFZMP5sCyPZWBVXS2KR
	0NV9Mt1o6t+ooFCJjs09NVuD9kx6Fg6jZ92/Svne5OjrwbIQdmTM79r+EzOmEO701gUxQFmV6ZF
	2d+WtPo0JNWTr99V+UlWINd0y2Bjixkkyw8D2+9hITF3nrZHPPgQPXiBlnlhRJa2mqtm4PfVRp6
	oQ+IBmmC8TDTnczaPN+tINwR0XIi/mWoLjVzCgMtogux0yDUDetO3Znq40tCSswFo3zax1MuDkY
	ORiTjhZh3/3IFH2iFdCTm67ASPDR2qRxDxDIblQ+5k2FF+FVBvPXA0EuySsUUrAKEPq5/bgVrBg
	sYNIfiTzYVxTrkD5focSIg==
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr139504245e9.20.1791744765625;
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 0/3] clk: add support for Airoha AN7583 clock
Date: Sun, 11 Oct 2026 20:52:34 +0200
Message-ID: <20261011185238.52229-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 257 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 346 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

