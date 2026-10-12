Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC449B210
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818654; cv=none; b=oB+EojuPcvW3uTpveN+E6EoGvY0ZHW32xv8Eu6wOyMKBM922Zd2mpsoertCACdVAawjqV1SiV4pV4KeruThKD97kktXJoeO6zryoM92qCTngmkKtJYsADfyqKuS8/k4D735bsS2pPF4DFffcQ9YbrzW4SEKcLbLFCs7r0FiNZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818654; c=relaxed/simple;
	bh=BPhVdVn3lLt61EeSVOe16izIdtSs7qr03SzF+WwtHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vlvv5AMgKKJPbNJEtY/3qR4EpFKQgC03lHfN77UpgMxlYmCqrr0viQBrC+f9OluTegzqcaZybtC0L9YXJWR0h/UtzUG2H7I5V9Cszv0mC/9nQezRdRkeDnB7T8Pc/0G8D1j9/jWjYVtfO9XyBTpPvH9nsJUAtrqAojK+BZtXIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=F+SzHLge; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="F+SzHLge"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91986c5cb75so26912046d6.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818652; x=1792423452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=F+SzHLgeYzLnrBR2QMqeSqprXiyECG8R7zUelPJqND5n2lORKaWtTLzU1hIQz9cYwz
         Ekrx5p3BpfVa8ATm3kcElT+2iUTiC3xAliv4LLiBL05ZUG83Ps6hv72lm6hjjvaZI1Jq
         HK1Kr/Rlew1qrQ6Fh2UB4/QYP8JhYdPonZeHAASYP744X5RFysQrVEgZ0jJchbqD4IL1
         pHOQGhX1t924d2pSfOKuG4821OA6toV0moKmDJhYNPvEF2fuHEqR9I8uNHnJfR+5tLk1
         hy7601/fZ7qnJKtNqG17D2Hkvcs11SquoeQaU0XkQnrEiFOIuR11dcDWayrap9i/4eMA
         rE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818652; x=1792423452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=EowYdDGsE7B0XnWdMwZzj97yiL6HP2VJE+8ZgrcRUzgm0SVrPJu6TC5RGT/UVisil1
         zTLnidCS9/7AfGHSb9pDTOHOsoq5P2PxuOYUjSdXmA25qVFMBpMMZ1MM6tnWbpFZl6jd
         y0aDZVFXOcYYXturtydN7LOycfj6ZHDSyYRlhJ2HyaJZaXCm9cn9rOtpxQuNAwhvmFTL
         mCXQ7o1V6HtjMG4HOXWb84YAXXCllECbUNzOPBD02QKVz2F+BGOpt9lIHDJNgXZcUNeU
         bpKKRAqreM9es2Y7nlxEbNsszrCl7wDHCgBUW1H3xtAn/cMKgsxQsHDtau0AgiojiyTm
         TW9A==
X-Forwarded-Encrypted: i=1; AKwUvBwuztll7n4hjGE90KrmDrrnauxIdN15bVQui93Rwl5yHcSzH3FyuVSnkJp9JQ/+aEQqfexaSnkuJyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKEGNp5wlLNzo8xJ/ksQOjw5KwTtyRKb9QWmJfbqNmOutd/nz6
	IoywP5XvcDwMdyryy8xVCEc6lNEYSuSYbZs8AE3BJ6m7Qwmw1BAVncgNx4oLyJ1FBnE=
X-Gm-Gg: AYBFou1dtBiy5OWYWhNkMoKPPehkpBr1TSOaiN1uiI8H/7bssixi8q5Qq5htJ3rnO8Q
	hDkXH1Q6hbYJI5XPQGD3OLiNg5QDyJK5Bvjt9Z8uTEIYr2ilJn4bMJ/sycmBYZita5l2cxmB0+W
	IIWgh2S6UXzzsTkIJNp4PYk/6qH2cGX9YarDHTqCYyb81fAKhyTF2K5oPaunifZKXX+FHd9XQ2p
	J0BNgo6R1TnJYTSxDRpe5xboaCnvHiI6kV+hBYwKhtRh2aBfPsc+MZqH4GKd5EPBQtqVV4Ake50
	7jqg1KEbf/7pHgl+k3SO7Vt1mClSdUaWeqaPJ7/YwEH2euI6g8JC2aTJjve77AbaiTQWTB636X2
	wb94wMnQYfRCutQr1zcmQTlpEY1X+q0wpthXmJt6/eZZ78/hDdpw2vmPVcKP/A6TMAuILFdxDUQ
	01UcscckzLnVkQkouEpSUndsduU7GaEhORL5ra6CshDDENcw6Ne6ki/6kkwNM7w9QpUKojDk7YE
	wwpa1p/ywcenQ==
X-Received: by 2002:a05:6214:2b8e:b0:91b:8d97:122 with SMTP id 6a1803df08f44-91b8d97039cmr23749566d6.51.1791818651854;
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: introduce TC9564 clock support
Date: Mon, 12 Oct 2026 10:24:03 -0500
Message-ID: <20261012152408.3729237-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock controller present within
the Toshiba TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of clocks.

Both TC9564 PCI functions can provide PCI endpoint buses via
devicetree.  Each PCI endpoint bus provides access to one of the
function's BARs.  Subordinate devices (like the clock controller)
can then be defined as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the clock
device node.

					-Alex

NOTE:
    This series is built upon linux-next, with this patch applied:
      https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
    The series (with that patch) is available in this git branch:
      https://github.com/alexelder/linux/tree/outgoing/clock-v3

Between version 2 and version 3:
- What was formerly described as a "clock" node is now "clock-controller"
- The clock-controller DTS node, which dropped its reg property in v2, is
  now a sub-device of the config syscon
- The config syscon is now (also) compatible with "simple-mfd"
- The clock-controller DTS node no longer defines a toshiba,config-syscon
  property, and the config syscon no longer requires a label
- The clock-controller now requires a (parent) clock property
- The header file is no longer included in the binding example
- The binding example now includes the definition of fixed 25 MHz clock

- The clock driver now gets its regmap by calling syscon_node_to_regmap()
  on its device parent's devicetree node
- The clock driver now must its parent clock from devicetree
- Added Brian's Reviewed-by tag to the second patch

- A new 25 MHz fixed clock is defined in a new patch, and is later used
  by the clock controller


Version 2 is available here:
  https://lore.kernel.org/lkml/20261005230927.2000398-1-elder@riscstar.com/

Between version 1 and version 2:
  - Previously, this driver also included reset functionality.  That
    is now in a separate reset (only) driver, which will be sent for
    review separately
  - Dropped the "config syscon" devicetree binding
  - Reworded the clock binding description to focus on hardware only
  - Clock IDs are now consecutive (no more commented-out values)
  - Get the definition of of_device_id from <linux/device_id/of.h>
    rather than <linux/platform_device.h>
  - Dropped a comma that followed a ternminating empty array entry
  - Config option COMMON_CLK_TC9564 now selects MFD_SYSCON
  - Clarified in config help text that the reset and stmmac drivers
    are the "others" that use the config syscon
  - Moved the clock devicetree node to be a peer (rather than a child) of
    the syscon node.

Version 1 is available here:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

Alex Elder (4):
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock driver
  arm64: dts: qcom: define a fixed 25 MHz clock
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  65 +++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 268 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  34 +++
 7 files changed, 409 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: dc44eb73f8da11f478815bc29b6509a6a4c5c35f
-- 
2.53.0

