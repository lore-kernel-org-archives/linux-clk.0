Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073014;
	b=zzKfGv6Fb9Qkt/Zlc1gihekZZuX1i2ryHJUQnW7dXR9qrzlJlLcPnV76PEUZmb73WL+M
	 g6LD8kkMaYSpI27MvEcjuswKRWkk2wKRwgjp4HnR+ICGG3hM9VxW1Yr1XFwVOKSRbtLFo
	 pGae+8ShiIXT97EmHzy0D7T8mVVc9qrp3KR5TX/pOMuqUwKdyc/4llC9+gv3J2J6EXGqg
	 nUwhLCoLGfYRMdrM1tQ3t4ufDHz7NSHYf358TNsyLjf9P7zqhVPhH5Id33VEPudQrLocI
	 GxGm8OoI3a6CSKUiGu6eL9O4Yss82z1G0Dcj05qQS0YcRwRp3xki7zx7ahToIPjoUOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073014;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EL9HwljUGvkt/3N0n8S11b1A5gydTWqrl3vCGm2SOrA=;
	b=IduG4Jz8cvWjpNUx+EA5lbtAjpiaZNdZwOjPO6zVzgVJppsnchiMcXoHiA5UlxFin29l
	 BL+pejPm+F2N3+xcnUC7VNDPAFaid1Dc9ClWHZCostRbz1AkwjiNGmjKHtyk3pptaAW9a
	 VDwjdxsqsffHa9NKWpgs49AkvKdF2XnObNUHnck3otOrlEZy39BTKdf6pRjVH88WwJzur
	 7EdpNvn3qOvJiP07zTLQ+4nvzDg+ha6Cvd/fTkqrD8wmQp4U+ZMx2VEoLCDC9T4JH9hK8
	 xDvIxmdXNrkJYxgDd8eWw37O2v/fQ2bYND99cJ3sQdVMut84lrbV6RUj550jV0wXs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib8e0nFB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74AD606A326;
	Sat,  7 Nov 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib8e0nFB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB471F0089F;
	Sat,  7 Nov 2026 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073013;
	bh=EL9HwljUGvkt/3N0n8S11b1A5gydTWqrl3vCGm2SOrA=;
	h=From:To:Cc:Subject:Date;
	b=ib8e0nFBDRD5x/vWsZV00Bk8adCjjSLNFnrkJWs6QkYzS3lFonTLbTdKBsHmwl/7q
	 7FEwjd4t6gPXHTUtEDj9YvH1otB1S/3VVnOAAN+/JwOk8ZXnW/oCwnvF1s53kq3Rn7
	 +VA0WO99FLXpTHwimLjqASGrMgxv0Cwslo81Q3e+VrhVGL5uNUfmgCwF1Ga10+Xdw9
	 ivMHccVC9QbTrgS7eSRXTnV6IHImgrpIIwawotDV47a33HGNElPpoEbPdOtZqrUZG2
	 mNklYKhms2lR398VzpLGuyEM4wiOJThKJutC4hd21miHK/HPS4Vu4AFKK2xNuYURgI
	 j3AwGlcVdLeFQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: Add SM8350 camera clock controller
Date: Sat,  7 Nov 2026 19:36:17 +0200
Message-ID: <20261107173621.3538964-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Add the camera clock controller (CAMCC) for Qualcomm SM8350 SoC, the
clock configuration was taken from camcc-lahaina.c from msm-5.10.

CAM_CC_PLL0 runs at 1200MHz, which requires the SVS_L1 level of the MX
rail, so it is set as the MX performance state in the device tree node.

Changes from v1 to v2:
* removed linux/mod_devicetable.h explicit include per ask (Uwe),
* PLL2 AUX2 input cannot be used in a meaningful way, removed it (Sashiko bot),
* Lucid 5LPE PLLs should not fallback to Trion configuration (Sashiko bot).

Link to v1:
* https://lore.kernel.org/all/20261104001704.2744766-1-vz@kernel.org/

Vladimir Zapolskiy (4):
  dt-bindings: clock: qcom: Add SM8350 camera clock controller
  clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
  clk: qcom: Add SM8350 camera clock controller driver
  arm64: dts: qcom: sm8350: Add camera clock controller

 .../bindings/clock/qcom,sm8350-camcc.yaml     |   69 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   15 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8350.c               | 2646 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |   19 +
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 include/dt-bindings/clock/qcom,sm8350-camcc.h |  149 +
 8 files changed, 2909 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8350-camcc.h

-- 
2.51.0

