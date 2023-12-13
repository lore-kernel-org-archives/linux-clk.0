Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="16TInb5m"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695D6E3;
	Wed, 13 Dec 2023 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493476;
	bh=Qqj7VpGSeV2Wlo88nLvyTvvJ8JpXr4kVLj1TvLAJGDI=;
	h=From:To:Cc:Subject:Date:From;
	b=16TInb5mDZeVwP0vwLXn1heYC86GUQ8TGTZ6p8e+Yj2YhJ5fKOHaH4NWeOCmEf/PM
	 EIMxItG7PXnEkS3q3dIfUVBEzW7dlDPzYdm0xr0IPBSv7ZJO2rpPEzgbKNiXWdPD58
	 AKq58I69L71rpTYUJ3yqpmFogTPjq8DYNbFdKGOP/IPaDCb5D9StfGjpSvmAfdgcrh
	 H2fdhXkUMG3yUyRNqZjGktjOnppj3ktM5imawcmbQhyyppT2HJQ+zffncMUJdAWQFD
	 wpYHxun7q8RaxvCFOZssaqahaEQlawDEZYhfdBlTAF33p8lqXruBCC48iXu1ku6K7E
	 E9NyR5rPsHRfg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C54F378149A;
	Wed, 13 Dec 2023 18:51:16 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 33B234800CB; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
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
Subject: [PATCH v7 0/7] rockchip: clk: improve GATE_LINK support
Date: Wed, 13 Dec 2023 19:46:45 +0100
Message-ID: <20231213185114.47565-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I've send this as v7 for the series from Elaine [0], since it kinds of is. These
patches are written from scratch, though. There are two parts:

part 1:
Elaine's series used to contain patches for the VO1GRF handling, but they were
dropped at some point because of the CLK_NR_CLKS feedback from the DT
maintainers. I added some code, that should hopefully fix everyones concerns by
figuring out the right number at runtime. I also moved the correct handling of
pclk_vo0grf/pclk_vo1grf before proper handling of GATE_LINK clocks, so that it
can be merged ASAP. These patches are needed for HDMI RX/TX support on RK3588
and should not be blocked by the GATE_LINK discussion.

part 2:
For proper GATE_LINK support I tried implementing the suggestion from Stephen
Boyd to use clk PM operations by creating MFD dynamically. This required some
restructuring, since CLK_OF_DECLARE() is called before devices are available.
All of this can be found in the last patch of this series.

[0] https://lore.kernel.org/linux-clk/20231110020358.12840-1-zhangqing@rock-chips.com/

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
 drivers/clk/rockchip/clk.c                    |  85 ++++++++-
 drivers/clk/rockchip/clk.h                    |  18 ++
 .../dt-bindings/clock/rockchip,rk3588-cru.h   |   3 +-
 4 files changed, 178 insertions(+), 91 deletions(-)

-- 
2.43.0

