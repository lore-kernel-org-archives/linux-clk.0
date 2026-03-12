Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0A3B6C00
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314651; cv=none; b=nNBRIs9OY6wmAUSF95qi/vnNujQzc8nqF9rq1+iNGUyJSf8j9dv0+xFwo43ZYOkaO0Sqjj3b2l1BryOhOpTBPx5G005UyOk8diS0fxBvi4jlEiAYUqfVK+LLk2v1p/7SgtexVi9H1rq0EqCG2KquiALyJsYsKoSpe5l/I2NMcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314651; c=relaxed/simple;
	bh=1y2VS/ietuAhmno6T7EhIEmFdrSCb0dHUupEAtbIApg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2yK/PQv/0L40YWadS0hUsfuXtp9FnraCpzsMxyGpvqRPMiJ6IEdLctiCFJJszBvmhve0063kJcXu1JKWCVLlTf9AY2QIaqi2nere3HEQXke5XmT4AUBa5krgy8NwEAoGDIqubBuLqbChnpjAu4SsasYBCTk5PKFbGNQtylIHvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=MIE+U1Ev; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="MIE+U1Ev"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m2sWcaN4dQ9R5JKMcE4ro7NTUdKauq+zmG0lviY8lRU=;
	b=MIE+U1EvJ3lnlUMIUBT44G4ZJ/dbEs8O4Y4ypvTYiNHANTEw5yH184tLwtCKyNnXask05P
	YgXzUtaIZXM0MNP20MhZJUpsE6BrSlsiklRRS2poi8KRn+NgxTZb2eLEAqZttPrDVm6Yd9
	MaJaA3aIwGw6R/vUnlaT4Wgsw9e2cOKpDxL3HKaYZ6Qcwd9NYeujenEdjheCD/BuH9dRWM
	D8l0bkOkFHiEKq1eU4vnC41NC1dyVhoI1TTPzu2vdH32sJ2oKRBPj7WeWgGjslaNWRPfjI
	IqsfNflly4+5XzxDL1Z0+Try5d0UFbL7Rk4kBaQfBqFHohczGtsipHdh8JRRrQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] clk: qcom: sc8180x: PM-related fixes (and refactoring)
Date: Thu, 12 Mar 2026 08:12:05 -0300
Message-ID: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v2:
- collect tags
- bring in dispcc patch mentioned in cover letter
- add a couple new discoveries (mostly camcc related)
- add refactoring to current style (qcom_cc_driver_data)

v1: https://lore.kernel.org/all/20260309010214.224621-1-val@packett.cool/

Also bonus new question: I found
https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/commit/489da2db487312fdaf9441056745490031b59f55
and almost included a patch adding `.skip_retention_level = true` to MMCX
in rpmhpd for the SoC, but.. it should not be necessary, right?
Just having low_svs as the requested OPP in the consumers in the DT
shooould be enough to make sure it's always at least at low_svs?
(I *thought* it might've helped with the GDSC stuck-off issue for
both Titan and MDSS but it's more likely the other fixes..)

~val

Val Packett (11):
  dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Use retention for USB power domains
  clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
  clk: qcom: gcc-sc8180x: Enable runtime PM support
  clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
  clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
  clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
  clk: qcom: camcc-sc8180x: Remove wait_val for Titan GDSC
  clk: qcom: camcc-sc8180x: Add missing HW_CTRL GDSC flag
  clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data

 drivers/clk/qcom/camcc-sc8180x.c             |  76 ++++++-----
 drivers/clk/qcom/dispcc-sm8250.c             |   6 +-
 drivers/clk/qcom/gcc-sc8180x.c               | 126 +++++++++++++------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   5 +
 4 files changed, 132 insertions(+), 81 deletions(-)

-- 
2.52.0

