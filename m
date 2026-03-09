Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4D1F16B
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018180; cv=none; b=mJS4biFpR06UAQLDfJOInj7fuicbN+J09hGnWtfpnBuB73PasFiZsk1cT9/F13dbvL8+V1zNRh059rIBtpolCU/zKhpO3MmToIvYm525gihe49orlBfRMhqZxJT7Wk7JJp0s9+l0VFSrpiwL8gNZgtuftZweebpbcII187rWYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018180; c=relaxed/simple;
	bh=rRc/e6K/yWxakpik9GUm14LiUHLzoaW9X3Y/2OZeQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahs9lK2+eezgsbbygkWHTZTqePFJuIf7XMpHCIOsvpai1gphp1acag3hMoxqpOJzB0WoQMCX0djbbV3x022drycqS47rrIvbp7VOV6RhjBDIC+b4G3oSQI8KZQDY3OoKf4CIaRnYt5oQcKEPGP4Bx5P8REjEJg0AGJwG+UFm34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jvhojoBA; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jvhojoBA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jW4mW1GfYwAGUTP73I4AqgwxwPvoK4UJopMM4jq59Q8=;
	b=jvhojoBASFCnkcme347c3UBfC/LO8ikwtiZEpISrAKLStuwCJeuozbZ9fTNFhD3aco4GqC
	wq1go//OsTEZIOPQcHnQfrRcdvAROZPRH+dzM3ojdRayne2hB6cptJvNM4/sQs4f6bu2yL
	VT2w/k60CouQG7gaFL1t/MaB2+PqswpCrEUhjrpANzaWp7YIcZNHORotlEJ+QNj3zwLHEO
	mlmI8pXn/5atPTocsfsjPEu7q0c10jbyyC6RVrxLIcyYID2oRLy+hGwrC5YZjZIgIVXoWN
	sYtwSJTK0HpVBJWDczs41DIxo7UfKd8lBjI8tBIqLXLYBcm4m3oPq3rrL7st6g==
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
Subject: [PATCH 0/7] clk: qcom: sc8180x: PM-related fixes
Date: Sun,  8 Mar 2026 22:00:22 -0300
Message-ID: <20260309010214.224621-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series mostly ports the fixes that were made over the years to the
sc8280xp drivers to the sc8180x ones. (With apologies to everyone for
somewhat stealing the commit messages in places :D)

The most pressing issue this resolves is s2idle exit on the Surface Pro X
being slow and breaking NVMe:

    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
    usb usb1: root hub lost power or was reset
    usb usb2: root hub lost power or was reset
    nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
    nvme nvme0: Does your device have a faulty power saving mode enabled?
    nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible

Hopefully it also contributes towards improving power usage eventually..

One thing I'm left wondering about is 8d114b94fc39 ("clk: qcom:
gcc-sc8280xp: use collapse-voting for PCIe GDSCs"), not sure if it
applies and if it does, where I'd find the values. (Downstream dtsi for
sdmshrike, which is the closest SoC that the msm kernel supports AFAIK,
was my only reference and it doesn't seem to have anything related.)

And 9410fb940114 ("clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe")
.. we don't have the _src clocks for PCIe defined at all here (o.0)

BTW there's also a dispcc patch I sent as an RFC but probably
should've been part of this series:

https://lore.kernel.org/all/20260307111801.631060-1-val@packett.cool/

Thanks,
~val

Val Packett (7):
  dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Add missing GDSCs
  clk: qcom: gcc-sc8180x: Use retention for USB power domains
  clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
  clk: qcom: gcc-sc8180x: Add missing GDSC flags
  clk: qcom: gcc-sc8180x: Add runtime PM
  clk: qcom: camcc-sc8180x: Disable always-on clocks on probe failure

 drivers/clk/qcom/camcc-sc8180x.c             |  14 ++-
 drivers/clk/qcom/gcc-sc8180x.c               | 112 +++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-sc8180x.h |   5 +
 3 files changed, 109 insertions(+), 22 deletions(-)

-- 
2.52.0

