Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364715;
	b=0MAqPJ18cKyLpKUx/uOXWn66EATimBn+R0+YWQ96RBP/F3Ly/GD46LeLrqpCIATPRMcJ
	 zndgJTTM5ajI2qlRLuUI0yZZdA6kJ1jFb88btoVSs7TowlvzZJvGH71mr1EJ4GKhwCiSm
	 vAHFff9usBEkQrBQYz2sxtcpd519kUiEKJlB3nedSi8PhcLfMiyjrgntKGjJkXEbxyeQv
	 WzWaVpwUyuKT9RY1VupYasP0CJvf8wxf6PdQVS5uNZLAeRCQl5k8Sxw+wjayzgmPpnlE4
	 Sd6QLNa3dpkdLPznOLfLYHBX7j6z+QSS1fEvGTD5BEYUGahvVtMV3GaGl2CS/KZJ3OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364715;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4mSY2yw665WGUw4XAsg4HFioud5kltYn3bVe4FnNDPE=;
	b=hmePkK3RHg/RB4G5uz1iES02o7rtpJVpTrmyzlosdHmqOTUzh/1BlJ1QhC9vtW9mBl7m
	 fZMA+9nJMOutkeEqaSzzu9iTA1Y+eSzTsrlqTHrIzEXM9iRkQsRt8riOQCqBAGpdva6tl
	 JULCDbtsW3k/jqHkyzBDWRNZ6HXUrEgnveFYXXJanFmD4UB5Dx/4ElCi8AA+CAm7uXxD1
	 EhZ/0gGK7NZy4LRB5k1qkZ0m9ZoHaLnGvtQ6D6Bj2LicUPwdAa6naU+nBb38SrGlhH7/9
	 oyINLMzu1pGo36zSu6OiO3qLcnyZ82iXKJQl+hiqqcfix5i8a1gFPNZ48mL8O3wWAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=h+spo1R3;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C73606A320;
	Sun, 22 Nov 2026 16:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C73606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=h+spo1R3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795364702; bh=4mSY2yw665WGUw4XAsg4HFioud5kltYn3bVe4FnNDPE=;
	h=From:To:Cc:Subject:Date;
	b=h+spo1R36h5PIYzqJ+ef+X/YXfvPODE2mxizEXMzUpPSuxGfA8wR3lEk6rg7ddfd5
	 ygtQsLE76g7D+EoQvbbaVoBdKlwq/NCND5vgXeeWGTfM9lf5a6VtDUN3ovw14WsVsO
	 XSar3a4dXSqp9WC/RCkThzqOFGe2HYlaGWS8Kx1I=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 640042D7; Mon, 23 Nov 2026 00:25:00 +0800
X-QQ-mid: xmsmtpt1795364700txd9pgylu
Message-ID: <tencent_DFDA05189A0FAFA816FFAB91CC2F95247C09@qq.com>
X-QQ-XMAILINFO: NT2OMgh8In2+6/V0YtNlBRwCr45RUbQO+7+y3qbnTb3Ch4Baud2fc1bKvA9DFW
	 SFfqa/39n9Te8c/l+W8qoaNj0zWQbv0Wefr7XhXoVVeu7v/XzQRtH8/XIkLSRe9CUpqxeM1O5CME
	 IPuBSYl3Du2SSfZN/+vygNowy68Kw7cVT32Gx282bMgJGvo+vBICN8qQSfN30/hJ5MuM6lNpcef9
	 KrvdiGt6FpzEqOO5amD+c+qFzZydGIO146M1hMKUXpPDoxICI+xGGylHsNNCHYrCncx3Bd6XjA0o
	 ygJNXQWCfJBcHYc5FUeSI37RNIdrhZLbOSgoRe68LySy540FX4zuQds6AVugYRv26HJyqroQEhji
	 bI9yfeKSEOsKQGDRKQu8UA9L7Fj+ZDy5zsEwWbejKf8+VqU3jRA042N8EtHEx/PuKey+gbX5I9AE
	 L6Fo7Y2U2yhz5NCDUhOMV7ni2Q1MQhocnWLS/AiV1zijuYcmEzxh3Z3Pp07R53/zj9XJZFy+2xz4
	 Nb7VaWazo4TJOidzWbQnVbHuTXgwpIS1KpszW+HQv4S2XlD+tA3JNCPbaZrhF3eUiBMZjMKjAzXS
	 Sj+1sSrhhQ62Jrh6958PUHJxWkFNFfcOXoLxGShGAuSlWIC2916SOF9N5kbpbDkFgQjJl7xcHGl+
	 nUeydKxpvqqcbNb4ujHwcsalKl76wm7fZw/1XBAANIXoXn2d9RaFHUyEJt06BPushMhJSkEBOqYZ
	 Op8mm+u6JZMQxzdoMPOwZOBI5PaJSIAW/jHiAThuzl8Yiq5jQakRP/zSsa3IfYOdCD5nEABPH9WU
	 MjSaHOgYZhI6L43MNsVWPP3H9eGMsVXduwZF7HwKs9AtNDiMEGlTgk1j5VTBSG48IWaV9l1liVD0
	 3GgKDTu8AVpWX4tqm8qq6sYEft01CX3G55kJjXjmi2TzcvzTyX7fVQxYTrELbpXbvU/XpcN1v1xo
	 80frI0wXaoJdcjXLTIUnmK0RuDJHACSzqNedncv6b1JqMHsiYKRZ9ZSUipiNyI2g3QUMHTyp4jh9
	 CEXHxKo6unYZTCJM9T4INSEkRRSvDtZi6K0xUtIzOzfTCZIjz91E4UUffLXifCkbs6epB2yvP3c9
	 k1rqHnyG8f1UJZuwVCmk6vBYBIEq/VwESk7ujkGc2MlRAVhorMmp3jdioB1NgqmPoC21aiI03k6S
	 uxzJ4gj0ZQr/3drIuV++pHs8gd
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 00:24:44 +0800
X-OQ-MSGID: <cover.1795363509.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
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

The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
them as GRF gate clocks so the SAI MCLK pin direction can be controlled
through the clock framework.

This is a v2 of the earlier "[PATCH] dt-bindings: clock: add
rockchip,clk-out" submission.  That one introduced a generic
"rockchip,clk-out" compatible plus a standalone driver, which is not
acceptable: upstream already has generic GRF gate support
(branch_grf_gate together with rockchip_clk_add_grf()), and RK3576 and
RK3588 register their SAI/I2S MCLK output gates with it.  The new
binding and the driver are therefore dropped entirely, and this series
only adds the four gates to clk-rk3506.c plus their clock IDs.  No
device tree changes are included.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits
were read back from the registers to confirm that they get set.

Changes since v1:
 - drop the rockchip,clk-out binding and driver
 - use the existing GATE_GRF support like RK3576 and RK3588 do
 - limit the series to the clock driver and the dt-bindings IDs

Xiangyu Zhu (2):
  dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
  clk: rockchip: rk3506: Register the SAI MCLK output gates

 drivers/clk/rockchip/clk-rk3506.c             | 23 +++++++++++++++++++
 .../dt-bindings/clock/rockchip,rk3506-cru.h   |  4 ++++
 2 files changed, 27 insertions(+)

-- 
2.47.3

