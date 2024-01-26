Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A020B11;
	Fri, 26 Jan 2024 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293766; cv=none; b=uqisMx9DnhyEU5YqUAOLr3SwB8AFj9aXPJoLLlQylTbcGqOjzN0TzVyzw2AUcXfUw7y1+EVcV8ciPsvaknHx6J3QHNpcGo7HfyuY0ANog2XTlwgzpm7V+66IYFWdAB289iHYUo2X0CkUcj2LZUccCZO0WTI505k4tbcxCZOnAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293766; c=relaxed/simple;
	bh=qH4wgxYS/QxVVd4rAM7HJxckxSO0Woynsp+9EbTo41o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJOFkL2IU/5N1HUkMFtf2c5olv2xBBu0UVmNUYhwm0clq8D5yUEvRXfvgltS8nJHLGQkbwUGSU+YemRLRutBHMkooWOwp5AG3ng5vYFqOnlYbLRIJYTDJSersOLVJAhCKYIgwL2u5T7tvK3I3Lk8mrX6gaO9qebDr+4mgVTIIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S3YJS3mB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S3YJS3mB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=qH4wgxYS/QxVVd4rAM7HJxckxSO0Woynsp+9EbTo41o=;
	h=From:To:Cc:Subject:Date:From;
	b=S3YJS3mBMQAO4i0ykGCkUQhuItHdFnun27O5imvtyTUezAfxaS/zTJgRoFqNBFDGE
	 ajlYOsvZCOR1p1XW0LLnq1ZFTOR0nL00sNjfl+uOAeYCByx62W9M2qX4JRVZAgG0vn
	 CEPqJh6LjiEDfh93Tz849QX/BYUgCEsSZ4uXDmtcgIUj3rrKBriohN0suIOX4fdoPl
	 7wNZf5Mu+ukjK3bnWRQ0lUu4tPNLGqojZGK8i9N69US6c8yyM0dyEXvnQ4UK9fN8HB
	 xxRaQoV5esBb9ksb9VY/JhtLTe1Gf7yS3VgDz/abkWByYQQTcWXGhWIm50xbl10/T2
	 ffuX+Z2cgpcww==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7CAC37811D4;
	Fri, 26 Jan 2024 18:29:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 915EC480C4D; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v8 0/7] rockchip: clk: improve GATE_LINK support
Date: Fri, 26 Jan 2024 19:18:21 +0100
Message-ID: <20240126182919.48402-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a follow-up for Elaine's series. These patches are written from
scratch, though. There are two parts:

part 1:
Elaine's series used to contain patches for the VO1GRF handling, but they were
dropped at some point because of the CLK_NR_CLKS feedback from the DT
maintainers. I added some code, that should hopefully fix everyones concerns by
figuring out the right number at runtime. I also moved the correct handling of
pclk_vo0grf/pclk_vo1grf before proper handling of GATE_LINK clocks, so that it
can be merged ASAP. These patches are needed for HDMI RX/TX support on RK3588.

part 2:
For proper GATE_LINK support I tried implementing the suggestion from Stephen
Boyd to use clk PM operations by creating MFD dynamically. This required some
restructuring, since CLK_OF_DECLARE() is called before devices are available.
All of this can be found in the last patch of this series.

Changes since PATCHv7:
 * https://lore.kernel.org/all/20231213185114.47565-1-sebastian.reichel@collabora.com/
 * rebased to v6.8-rc1
 * Collected Reviewed-by/Acked-by from Krzysztof Kozlowski for DT binding patches
 * support nr_clk=0 in rockchip_clk_find_max_clk_id() for smatch

Greetings,

-- Sebstian

Sebastian Reichel (7):
  clk: rockchip: rk3588: fix CLK_NR_CLKS usage
  dt-bindings: clock: rk3588: drop CLK_NR_CLKS
  dt-bindings: clock: rk3588: add missing PCLK_VO1GRF
  clk: rockchip: rk3588: fix pclk_vo0grf and pclk_vo1grf
  clk: rockchip: rk3588: fix indent
  clk: rockchip: rk3588: use linked clock ID for GATE_LINK
  clk: rockchip: implement proper GATE_LINK support

 drivers/clk/rockchip/clk-rk3588.c             | 163 ++++++++----------
 drivers/clk/rockchip/clk.c                    |  86 ++++++++-
 drivers/clk/rockchip/clk.h                    |  18 ++
 .../dt-bindings/clock/rockchip,rk3588-cru.h   |   3 +-
 4 files changed, 179 insertions(+), 91 deletions(-)

-- 
2.43.0

