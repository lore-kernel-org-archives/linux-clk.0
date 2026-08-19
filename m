Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2CD34EEE5
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153175; cv=none; b=ZTUEKu3mcReK/TsHu+TMMoC7OoHWEx7F/glvF+lVYaQS5J+AlVW956LE3VWvchcLUINjQyx/2RPmaHGaaX7rwFlvAnnnC/hp6cRDiboaPdcLQ/mseAxuEf3fbXn3aBUlQvVvRUmvcy8f+H0BWrLueicWc7UQRjwCnCFsXwH75iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153175; c=relaxed/simple;
	bh=KUroni8tprXlojD0kzaT0KYlWx9yyDY5qyk+iWcuTGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iyCeaQ0WqRRE67Rbva4r/YpVnolD8ecbZn7UC3TOa1zbHHE3WcANKIRagoSM08DWJmvcdEbU0wfmpY/jxNX38jvHSEG04c40PtO9Xa376QqlZ7YlgOWn5tL3PNKYykofpU8hjstAo/wtJvHrPEy2bM85r1b7DSG9n7jW/FIThyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl7B98TI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl7B98TI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso13460365ad.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153172; x=1787757972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SALXsfEo0CULtkLcwdzPbmcj9OnpSD+IDtXd+njUb7A=;
        b=Gl7B98TIZ90G50kk5+NJ5mMB/ZWWQbEPSmtpp/rGIBXOCwP6tt+kJiyeKBR40YSF0w
         IyWlkaaR5Q84Lw+o6BN36b6ki8Ap3cFpVv1m9/UQn0FCzWUDwoHx/VLrx6KLaT1bX9Mu
         kOvd7pe27WleG3ODGIjuMua9nMueJVj3GHdw2Z2nKNH/NIXAHBUEE9+Rkf6FkdP1pow0
         14sncdu2rwyxskxFRDgYjFtZXZS3u8zjaJjrblln1IHfr9Co7yBZG+Hr4MKv/mowCRTx
         NlNIi8WZKLa29vWSNCFaOMCsE6aQ+0lPPqioBwrwn5AA7oD0EdUCuYFJJ+eUhfPafEno
         x7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153172; x=1787757972;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SALXsfEo0CULtkLcwdzPbmcj9OnpSD+IDtXd+njUb7A=;
        b=i8bdMm2qpvkwGmpAWrRJ1N+78vEhK0393emeo0jDxNbxGPMZkUx8FHNLf0h8Wr0cb+
         ED33dfMfXkRwJW5QQT91BJNePwoFbYBsxtlu05KmmM1YD+7pKrRt7OGvejS7tlJHMXet
         2QSQQ0hWYeI3GPkYDimR1ExYHD4NuazYISrF24SZsXpAaWASZfJvpBGlEsUWVvNFgRN2
         vOJ2EufoGBff4M102FUSk+ll/uYmbaU5GFKGIH0F8gwtysQyRY/ute03CkmN4KZghoht
         3PQOKRlt5dpP7XQywlF6KBeSPQxgxThuHflbo0zn/fLYF6sggsdBMwOYkbboGivVPJC4
         +lQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzf6G978SdRVntXLn2KJh6doKwsJfuiPcpmB/Lt6Ku1EjnhdDPVgWJyWaGX+rOIKH2sUjAasjbRA8=@vger.kernel.org
X-Gm-Message-State: AFuF++k7X1LTkEbyMCs68Ewh2Yb2iIfByA9dktlo7c+mMwqbLRE8Az9h
	AeJkYvgoNy3RJ8Ikw6ja9f+UlBjY6uyxmqLoiMhkHzC9e6Walmx9cRrA
X-Gm-Gg: AR+sD10YTwuScbceQ6K91pIPYzzqbHyv646oEThidQ33gpsDSRuivRz3r51UgI/A4Gi
	Y1QymxXy+y/y/8J8zCGWNXrMMxIkZJyiFCyeY4EQvcwbeXtj9Iq39BSD1vgWXPCAHSYtrDCDuh+
	rj5WaCQ94sj/l1OKLbH5Ewq2tyCTDxNCdFzTE0HqyWflzyu/InuLxVDYX2NwIyRREVqgMHJgNvO
	xwrjXjqoy0o+WgRk23H8XjNPVeVg2vNsnx1B8STSd/Y/aHPDHYqueJP0OAt4ANdxtv33RDI2qDU
	fKVx5k+oxgjQ6BnwvGZruTqDMhp8AOlq0lc68atSx++bN07oztJoQxTbVs8xytgTZHyazwjqilE
	DLoGmGu/e8o4H6iA17i84TIFXu33WOL+W3h0/2NEOYKeab6z0Nre7LY8ZoKocuCw0JzsUCHflIz
	E8G+aQNtVXcbQcIpcSQKmsN59p70+5f/LppIx2OcQCGLGN4KMB+CoFOJHHGGql+C2Gow3A4EXyZ
	VG+zTb98TE=
X-Received: by 2002:a17:90b:2c8f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-39580f119d1mr10377347a91.8.1787153172547;
        Wed, 19 Aug 2026 08:26:12 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:11 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 19 Aug 2026 15:25:29 +0000
Message-ID: <20260819152545.3934-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A77, 1x Gold Cortex-A77,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com

Changes in v2:
1. Added SM7250 cpufreq hardware
2. Added the tags from previous patches
3. Fixed commit title as per the suggestion

Apologies for the noise in v1 — I am new and still learning the
kernel submission workflow and missed collecting the tags from
the previous patches.

Thanks,
Sreeshankar K

Sreeshankar K (13):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  612 +++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3186 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

