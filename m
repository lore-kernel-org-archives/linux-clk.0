Received: from mo-csw.securemx.jp (mo-csw1121.securemx.jp [210.130.202.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587152110;
	Fri, 14 Nov 2025 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104245; cv=none; b=iJNd4JxWMh6up5M1La4jryeIY/4svK4MRMNuWK3RlJamI4617w+lPNbe1veZGQfMrEKcHtkI/dErSJXAPO1CHJJEhdLqJYcavCsd4ayGmTbppnP0PsdM4dM3Qr+Ga6iL4gDlE2vMoEGR3ZFXoL2FXOE2hacgRyFOnYbFIoxUSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104245; c=relaxed/simple;
	bh=ZyZbk4geM5CS5wO0ueAyUR0irGkrwv8RifK13AYs0oA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJMZNkSwC4f02sf5ylCozGo5upJAuIG0AcHsOvjnEZwMUa8S4vrMD2kqWYipW6UDA4uWfMTuFt0ngbvnt67VEtqXcdVmSuFlkyTO7jyrcnookped4iNjQOi7WLpOrliBPTnOVz2Bu985+w0L8w7LZEDyfptnus5Nr9gRV+7cGAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=vCUy6OvE; arc=none smtp.client-ip=210.130.202.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="vCUy6OvE"
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1763104224;x=1764313824;bh=ZyZbk4ge
	M5CS5wO0ueAyUR0irGkrwv8RifK13AYs0oA=;b=vCUy6OvEEqQasGSfhXrd6CbayylYJ6+DUmtxaq
	h1P8+Z33yyiUA5J1vRiMVCX9i4V4ULXe3K7lDMQJ+Iryuapyn0cJPTBhwHQuDfOfI9JXicZchMGZx
	xwenYuDSgyJA+5rxuKw+W3u/CH8yEPhaQesivnM6NpUxxXNB0z+pIDbulVx9axbsw6PvRjlsyfywk
	mMbqL37/nKUjb0yth0ZT1dPIO+0VcQ4zRiUJMEAQ4dtVdEWKrQC0mtAqFUL1W0x+8zXB1QHH24CCl
	OozTU1Vz/VQXjUdd88yCXDdKYk+0JLRFYkUs3Vu0y9xdQWoLcQCqTIyL8v1XA/VUbRqW/py9Q==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 5AE7AONa3876984; Fri, 14 Nov 2025 16:10:24 +0900
X-Iguazu-Qid: 2rWgP4I4zWgpT5ii9N
X-Iguazu-QSIG: v=2; s=0; t=1763104224; q=2rWgP4I4zWgpT5ii9N; m=BKYLoLsdkX9EDYa+JXbp0G+uwgGPlmm/1WYhYC2H+gE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77ZQ6cCcz1xnj; Fri, 14 Nov 2025 16:10:22 +0900 (JST)
X-SA-MID: 54823655
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v3 0/2] clk: visconti: Add support for VIIF on Toshiba Visconti TMPV770x SoC
Date: Fri, 14 Nov 2025 16:05:10 +0900
X-TSB-HOP2: ON
Message-Id: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Video Input Interface (VIIF) module to the
clock and reset driver of Toshiba Visconti TMPV770x SoC. The first patch
provides the identifiers for clocks and resets. The second patch privides
the control sequence of registers.

This patchset depends on https://lore.kernel.org/all/20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp/

Changelog v2:
- dt-bindings: Do not modify existing identifiers to avoid breaking ABI.
- clk: Update clk_gate_tables to reflect changes in bindings identifiers.

Changelog v3:
- dt-bindings:
  - Only add new clock/reset identifiers.
  - Remove TMPV770X_NR_CLK and others in a preceding patch
- clk: Obtain the number of clocks in the driver source.

Yuji Ishikawa (2):
  dt-bindings: clock: tmpv770x: Add VIIF clocks
  clk: visconti: Add VIIF clocks

 drivers/clk/visconti/clkc-tmpv770x.c         | 75 +++++++++++++++++++-
 include/dt-bindings/clock/toshiba,tmpv770x.h | 11 +++
 include/dt-bindings/reset/toshiba,tmpv770x.h |  8 +++
 3 files changed, 92 insertions(+), 2 deletions(-)

-- 
2.34.1


