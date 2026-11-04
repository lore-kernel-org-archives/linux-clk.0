Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751431;
	b=2wYqHMRA8l645H6XhWbvZ0zx5VMrQZEhISTLoB4ViKkqxR7r4oFuiWOl4flrKvq9mtl5
	 gxstgU2P/+U1X2mKXz+pLZHMCCRCBphjd/T8S70qyNlhmYvvvLLAMDpqgVnJmkp0Pp7qe
	 dSgZTsc772Xt0R0WmZ/aLllYyoUcVkvMVFYrM5fTCR0pA3ocI+dYmjX8+dNV0313mL8Xh
	 /WjjLgeJbaM8GmDuSiCixuw370a/ue5bkUXaiwVxamZxCWWTKS9Eg5EhpiNh3OYlWIPX5
	 jB0BM3kgzLaXqd+XL7AvsuCJ7PuMbtz5JEePVo5bx6+lrIu7TmZMHXOroKHfDWji0Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751431;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xqWKttadyBdN9NxbkSTF+ieKc0EWv7St4IhSOYTR118=;
	b=1T4dUVuAwvJvzx3XADYlOscY6nqVEYQz867O9wcZJsXW+bSLM3uGi8DnfSbKjMA4mMBA
	 TBT9mong8QxaY9QJL/R3oXYUU1h0Z2WMIXy6LVmss/KN93xYjhxnT9oKSHgfdF2bGivNq
	 csAfhJnelNV/CnzTDg1UwPdGz1kRzpvIY5LH8hDMGc380zAjKAjCNspvD4TRclO21xRlf
	 lZNNeCBzUIH54Uqkkm9or8xDPj6xFASNgxRokL4zXYTNrZgezZtymxW1PQyeHPZWzOI4t
	 /WoIXurqI4q2m+R2SIEFocqGhqfMwOEhiNo2hcV78Zqnft97vfGhwSxjsy8I/58nxag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCVyHgrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E22606A31B;
	Wed,  4 Nov 2026 00:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCVyHgrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797811F000C1;
	Wed,  4 Nov 2026 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793751430;
	bh=xqWKttadyBdN9NxbkSTF+ieKc0EWv7St4IhSOYTR118=;
	h=From:To:Cc:Subject:Date;
	b=aCVyHgrKGn/4jkZGieSPnRagyF+Cdx2R55fom4WNR4Bo2QuBeZA8TxjPVGauZ+RX/
	 R6vdpw8JDyyuxrDArhXOkWsEAsGHny2oj0FOo2h88VFIFOFMAHcHuFasHM5FETsBNw
	 lK2GZ3cHykOlorWXpr/Koy3VaKOK52gDt9zWLC5H9m8UvNrU08hTsNm3c2Fk9FXN7m
	 dTVNWzTZn1hfmOz79cgX0rsu3KuctD5rVNqUGDFRL8IBwhZaGCT69OefzyLTIW2/nn
	 7pXOxI8Z0qvt+LUFGSCvEgLpTPPiu6zgyL6gck0KA+JHvHwHjNcRaHh3C7UPGEEJin
	 P7S9mERl0BTHA==
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
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] clk: qcom: Add SM8350 camera clock controller
Date: Wed,  4 Nov 2026 02:17:01 +0200
Message-ID: <20261104001704.2744766-1-vz@kernel.org>
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

Vladimir Zapolskiy (3):
  dt-bindings: clock: qcom: Add SM8350 camera clock controller
  clk: qcom: Add SM8350 camera clock controller driver
  arm64: dts: qcom: sm8350: Add camera clock controller

 .../bindings/clock/qcom,sm8350-camcc.yaml     |   69 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   15 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8350.c               | 2650 +++++++++++++++++
 include/dt-bindings/clock/qcom,sm8350-camcc.h |  149 +
 6 files changed, 2893 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8350-camcc.h

-- 
2.51.0

