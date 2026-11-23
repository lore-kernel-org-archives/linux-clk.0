Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394331;
	b=0O/OutdstG9h0g6WUoFFrU/TqNbkJHAlFi4Mu84y+ySag3HTd8U9gylzw+iKS7OolxrI
	 WqPUJ1zvKDcNHRRocEY+rGW/vVqjfXcfOdMsXGmz4YgMtoQoVovqR6J4a8CVv4lhzhnkg
	 xUWkA6RnHJSBQxtfbybHn+4t+w1meaNABOIPLu4esaVFCoeml9ttVN043emrxKRttW4SN
	 B6l2cHJaa+L/kiA+vNi4MZqP0CCJK5Z1rC07XWhLbLsu/Dt538L9/1q43oO3YF9NrZT2R
	 mT9Eu8/ZmRPsl8m2O6Bu/obmu31MfjYXStZEZv6m9TZ8oPqQ3+QozT8y00HB+iwV1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394331;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yiu3e28olulx9CP4DCFh65cIlree1aq3t6drmeR73js=;
	b=QpTliqbPr2lfz8N1iy/ngaHhXVncuK98WibSsl+0HJg4XVB2+isZbzZQLMTRE13s+3h/
	 Zb9QMF8cGbij/imhIuxO6xsPMXFMQ2kLYwg/z4mCJzmFi9KWHteCedsyTsApEo9ucEC5t
	 JfXVBDyEJgQMGquy/bj19S2qYC08GK8+i8GZx6k2DJNehWovEimKMwNydBPpGmSh0Htwj
	 PVLlvJmzWBlznBlI81Eb33NpeqiM9jKSxKqP+mQ2oDPIRayyRsVCvsbahdSvgUZ28D8mT
	 db2pnMdm2IdDa4zKiUz4K5/Yh1vQaeVX1qNltPj2o6kqaKbbXUk35Rm/SwKkiNf4rGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Or0d2ZLc;
	arc=none smtp.remote-ip=43.163.128.53
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7C606A31D;
	Mon, 23 Nov 2026 00:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF7C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Or0d2ZLc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394321; bh=yiu3e28olulx9CP4DCFh65cIlree1aq3t6drmeR73js=;
	h=From:To:Cc:Subject:Date;
	b=Or0d2ZLcu+b16rQyG5IQT1smBg96M9vYpecJEKl4QkM+Bbz78dCV1Y8R9O0KtQ5yW
	 yi2zPtIXyYYl83SY7TZdzU1xXbH0+C4T3elGluSVj4OuEBhQnRJKLWaEuYrtMuJgSd
	 H6xTtZQ2E5/8fd/wQvax7jhrrCo5lL90xMCBUo/w=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394318ti52zpha8
Message-ID: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
X-QQ-XMAILINFO: N6IfSeM/PG+tAWNxvtWBwLmUUzyr8ZzrighoDFLmmCSU5B2ewDbPje4PUSipFz
	 7dVhdBP3gnPQ7yeNdEt3qLysumbsNfCmKa1ShtXzu0fn0jzHh13+Z3XKgTyQkHHx+rSKxQzqSEuk
	 c0Ry5y9gSBJHLR/e7KpuYd2AFivDNOsXkK2JpD9334XmdDTK4kTUig/Zed7J9f/T6LeuV/2UaL5b
	 PwIMHGeDQF47YjSO+3CDnaH1yB5wGCm9Tf1L4Pf/qXK+g0yaG6IwsYGN3UDWPN0S2Fq6ws8PzdUG
	 ZQ/UEhrKY57sSshHTL62ojTgkJ48aPR901WRqwxp6d/HIN0XhISA+ZaRKGPtv5TNdSXYTs7knsmN
	 nlmKaSs2xRFGqUQC1D363Wa/IRIMmTPu+wgvLyksA+LA+8OFdnRAMPpn6+sck6XofWKXd3/Z4dTt
	 UMf2m+hmwhjXQ9hZfoMVzk4HNjrmuo4efdIEOtAbOLpH/pIueFifPIhhugmD8FvS4ptWr4t3gSGS
	 rF6AtVTlRpmOURyvUkhFnxPnxMOXldG9cTiHXqM70/lsjDol3kwlsr2KI6nODHE1CUT2h0h3jeFR
	 5Onf2RVjuYKHxXp7K2+Pm5C693bSmyNJwYiS3rz8SSir5pMvyQ4SQJagprZ2+VPlTtTaaXVTD51l
	 g8IcYymAdGlK/1qTqZz5nOfJRrpohPiNJFtQh//0poqwF//UbfQBOSgZrPC1X/0oeJC4r9WqgHEg
	 6IsG17RkKVARuuMLoUzirqF7fOxVaUqWnSk+hCR23lcTnprYw/WYXSLluWcnoI6DTjHIyZiPfNyl
	 fUnDosFPF66XOhctySpNXCGRxEjKfdFkxOt2QZBQ/wLwF2nk3MCfvK5IFDCzqmZi0qzfnSpezFmb
	 Pnr4O7yhi7bUZYm5zaukrMbEpF0GQu1qkAuMyeX99no3pL9jBk+hP0YBfSGD99Nuf3j5pCqJrNGY
	 3Je7LEYX33zLrI2gbU3IRy79VroLtNkMDS02M4e0k9C4DQpiUYbRMgyRZZUaskv6aYbSZc34SIq2
	 M+heTsjq3FROWsyI7tk32RfbucANr7YHRfKdEZpj/XGXW5Ql8hhKAxa0zenEsyURtb3TKtunb6Mf
	 HRNHllkkPYB8WlexpU3sj1JhaC4YqpDD7WyOPU4nAESAoQOuLHKvd1+JKM8wh48p7PfDj5BJPq89
	 rLUcUBZARlihVv9dBfiB4GWGuT
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v4 0/3] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 08:38:33 +0800
X-OQ-MSGID: <cover.1795394137.git.1194781887@qq.com>
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

This is v4 of the earlier "rockchip,clk-out" binding/driver submission.
That one introduced a generic "rockchip,clk-out" compatible plus a
standalone driver, which is not acceptable: upstream already has generic
GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
No device tree changes are included.

v2 registered all four gates from one branch table while only the PMU GRF
was added as an auxiliary GRF.  The two system GRF gates therefore came
right after two PMU GRF gates in the same table, and
rockchip_clk_register_branches() keeps using the regmap it picked for the
previous branch when it finds no entry for a branch's grf_type, so they
ended up toggling bits of the PMU GRF.  The SAI0/SAI1 gates are now
registered from their own table, and only once the PMU GRF was really
added, so no branch table mixes two GRF types and the PMU GRF gates can
no longer fall back to the system GRF.

The series now also documents the RK3506 GRF compatibles in the Rockchip
GRF binding, including the "rockchip,rk3506-pmu-grf" name used by the
clock driver.  The RK3506 DTS uses the same PMU GRF compatible; that
rename is part of the RK3506 DTS series.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits were
read back from the registers to confirm that they get set.  Enabling the
SAI2/SAI3 gates sets bit 2 and bit 3 of the system GRF (0xff288004) and
leaves the PMU GRF alone.

Changes since v3:
 - add the RK3506 GRF compatibles to the Rockchip GRF binding
 - look up the PMU GRF using the documented "rockchip,rk3506-pmu-grf"
   compatible instead of the vendor's "rockchip,rk3506-grf-pmu" name

Changes since v2:
 - register the SAI0/SAI1 gates from a separate table that is only used
   when the PMU GRF was added successfully

Changes since v1:
 - drop the rockchip,clk-out binding and driver
 - use the existing GATE_GRF support like RK3576 and RK3588 do
 - limit the series to the clock driver and the dt-bindings IDs

Xiangyu Zhu (3):
  dt-bindings: soc: rockchip: Add RK3506 GRF compatibles
  dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
  clk: rockchip: rk3506: Register the SAI MCLK output gates

 .../devicetree/bindings/soc/rockchip/grf.yaml |  4 +++
 drivers/clk/rockchip/clk-rk3506.c             | 27 +++++++++++++++++++
 .../dt-bindings/clock/rockchip,rk3506-cru.h   |  4 +++
 3 files changed, 35 insertions(+)

-- 
2.47.3

