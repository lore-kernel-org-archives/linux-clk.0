Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62A190685;
	Sun, 31 Aug 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637785; cv=none; b=kBis3xfy4cR0VSYvfNP+3kK5+jniDUGs2/h/T2ny/OcJbqS22gYrZ3fI2+NhzzzyUwoStB8cte8TP9FeG4JScqJPgx65kLoOEc9XoBZ1aeA9SBdymbGh9SVFGLc5JGurBdq8F+fWJ4RPu7C5y5EwKixeKQ7ujH8GzrubmR8r+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637785; c=relaxed/simple;
	bh=pKMihHNeoIjexSn5j98+F6SYvhhQp72++66ZBaIXjoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fde81FRK9w8OLEvuVwaJ7DrJyw6YBshQ0CQVeaQVhzp6vRGhNZjQw/+vt2g4VqeIycibULy+i3t99/73/ZP5hM/1M/mhtgUS6AVZUCntXcEua39oJnEN8KneQK7HJT+XUnrBmhtzC7l1T1dPKiB47p8/Un+YRX5kA3R2P9KLITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ez8eIlYR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ez8eIlYR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b49cf21320aso3808590a12.1;
        Sun, 31 Aug 2025 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637783; x=1757242583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Apk6KML4dyqZBQ1Buqld5ww4xwE9iSu82US2UzeUrjc=;
        b=Ez8eIlYRO8DAIJqwKqKjz1mP/wFmGYKxqPc6rrcfhBZ05scAhY8y8k0M57iIfRApmK
         umd0byRuVYTlHKYhc1hDscAZK6+3O67HtBNpxErp6ow8A3VKWomtQfFDZB8X9nlcfUDA
         GCCjokf8p6W1U/qkBYU32o7IYjITSqrQ3L/WzgPsXB75RWvc1oGB4jvXTHkZZ+4HZ+On
         mwp3fzhdavjR6bhyvjtDxhR+Nd9KxSz/D4N8sRQ2vDoFYX0BCnZ8KVXk/KH8rfrPxabQ
         F7EMXG+NaMlYdqDMNeXPNlQpMwd+3c0nnAiFf8uSTdoB2OLdqDb9SGzIjhTGP92kAqCr
         4Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637783; x=1757242583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Apk6KML4dyqZBQ1Buqld5ww4xwE9iSu82US2UzeUrjc=;
        b=CpY+6lVyoQwXziG3hKjtb/Mpd6vr+oivniPH29BjgxNby9jyY4UAb8CyDjYK70Plud
         R/LC3IOrkD6jWXrCVQc0CCvk0TdolcZUcbIAb3Vz87SYFkHLwFHbGuNLOaDTmMbZa38j
         Gj+Ysnym2c9uthtkgAN5qynKbbE2xlu80eOxncNnDZ//DNQGEzkT4QHeBjOxD1D1IjMN
         c6x75ome1KQSNW+VodEGWc6c0kJKvPLVGlSHPEef8cLPyd+uBInINKlOor7CI4OiPltU
         TpBDW8xnbMPsRYGVsjO84SjHXZTtTc0NH/qh+BZ79uOIRgd71m+j7piug28K5GI/RTkS
         SfXw==
X-Forwarded-Encrypted: i=1; AJvYcCUrVX6e/gU2bO8Ec28G3wx9S8qT2gfwoHyDlj9iwSAEx+20R6zJNRinnZH5I65Ptus8tVjP4w6DNehu@vger.kernel.org, AJvYcCW7Kp3lxvmVs8jhh80ISFjaQqRIVeu8FVn9pjzRxwyCdcii8UDsh1D0cIiopigLgpLAmvbHWnmLpLny@vger.kernel.org
X-Gm-Message-State: AOJu0YzVaz6LdQMiOMuLB1+HjbQGTl25/Zdy3cWWEyssw/q6pJaVKtK+
	zwJ6T8uejFVBpDxJKN/RuvAq0752gLkWqMqqMSOYjUdOI6T+r5arIx6Q
X-Gm-Gg: ASbGncv4ukYYmyfJO1p/YD99Iv5gHyJ+Oh+rmdC/OCgDulg2aXXypkLNd3LrCMj5QRF
	MEM9mXyG20RNVOIL3MPL4AIVECefEBQ7vJ4jbmxkrjTiXw7Rwzg63vOEBKHg90PWmR0+6HQvlsy
	Dw/q3hzJbUBRCT80sMb8gjsmWgTeRqYsT3SXpCIH+bvoKzwFWrTLTR9j5P9I1uvSR90J/Gscax2
	rwAUPW0LHYzjR1dq8tGxAmc8VTlOo/zP0IEOHnU0fdStGGnYG8BGVHtiK8SzYAxq9z6K3nB8lf/
	6PWcqshduO8zvuOU+9hi/Eu79V/9ksro2lcacIRyzB3xbx+eqtpTCwVDwAxteJqQfOvIUwo3asY
	niBjUO8nZiAu0cB6quEppDWjBeMIh4Q27dR54Om41dGTPQxn5zg==
X-Google-Smtp-Source: AGHT+IErGK7FJc+FCPGEwd2GnQFzRtcOpYSLZTpB8rjH79fTnlx1bOGmzhq6mdWM8W7i0rZcH9ZkcQ==
X-Received: by 2002:a05:6a20:9191:b0:243:9824:26f0 with SMTP id adf61e73a8af0-243d6f3b97cmr7135848637.46.1756637783407;
        Sun, 31 Aug 2025 03:56:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:22 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
Date: Sun, 31 Aug 2025 18:48:48 +0800
Message-ID: <20250831104855.45883-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
native display connectivity through the MIPI DSI host controller and
PHY. The changes span multiple subsystems, including clock control,
DRM/VOP integration, DSI controller binding, and PHY driver updates.

Key changes:
  - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
    phy initialization.
  - Add missing lut_size of vop_data for RK3368.
  - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
    which is required for enabling the 24MHz reference clock.
  - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
    and register mappings.

These changes were tested on a RK3368-based board with a MIPI DSI
panel [1]. The display boots successfully with console output.

[1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Tested-by: WeiHao Li <cn.liweihao@gmail.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

WeiHao Li (7):
  drm/rockchip: dsi: Add support for RK3368
  drm/rockchip: vop: add lut_size for RK3368 vop_data
  dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
  clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
  ARM: dts: rockchip: Add display subsystem for RK3368
  ARM: dts: rockchip: Add D-PHY for RK3368
  ARM: dts: rockchip: Add DSI for RK3368

 arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3368.c             |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
 include/dt-bindings/clock/rk3368-cru.h        |  1 +
 5 files changed, 102 insertions(+), 1 deletion(-)

-- 
2.47.2

