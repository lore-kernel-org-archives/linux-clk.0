Received: from mail-qk2-f22.google.com (mail-qk2-f22.google.com [74.125.230.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1405158A3
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750365; cv=none; b=ivjH1ikq4bLr6JSpctlLIWbxTET26cFYP9YzdA4ldSzw5LzKjZvHRLTfy6t0KhW5YsUGiR6PWxqwsqrMF4ZdGW+StyivoNnsHbzNkRMjR7MZFNd2PzJLBTKhB1G50t6vMoFmzVnkxlRnYhA2TJfRhk8vzv1Y1HlnQbvU1oU/iX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750365; c=relaxed/simple;
	bh=im7bHLtGYT9Yz0ql8qKBFhgsMiDZmM4stEa2+3CQjmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxCXh1dvEfbJerki0gDJ2xtCflpzIj3omXh+fFWPymxacsf6S4eg7KesvGQ/jjNMwyXYhaLlpsCuy3OFaKFcaRxYdtbC4LzYg2Z+W1o4gQvvEzcNmokwZiF4LD22+5xrtikgp/h6RzMGVq9UcqXuyc8vOIj+BPu9P8auv84tWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=K3bTltgi; arc=none smtp.client-ip=74.125.230.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="K3bTltgi"
Received: by mail-qk2-f22.google.com with SMTP id af79cd13be357-93910cadeb4so104893185a.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750358; x=1790355158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=K3bTltgij+YGsuW8NBaMUplLapyFfvvlGqIe2hFCNzdFwnw0Dj2uMDuHJP5av5L7Mt
         GgSqVNn1H3J3eFwjnNjqAbjvKH7XlekR/s51bFgHeYzmsY/3grrdZrfRYtybBhZuwA2I
         lRf7zXLMIL5PbsN9OVcKeaGqHY6vGWf896uwEnPyYY2qdLZfdQkWzLHErbreweevaFQy
         r1Y4etaFcrp8p1f9Fpb6PBDN8WFc+LtMgBB/cXhdLC9gaRyf+T+49IziLnZVwGwJVJ3l
         PglLQjQy49HWbSBR8RvpQi6KiwnZFA3SCd6E1ds19hjz0FyLAPvQu6QTAv0eMC9uMrXV
         8Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750358; x=1790355158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsHLj9guVGOwJ1+byqEfFywik/JH+zBDqG7OfDqa/L8=;
        b=HC9H5NMtBEZRbS8FRhmmFxTrlWgCbk4LnD4Ta/smk82vZEpyIGkvftcbwwFVyyF3In
         3FWVJD27RROJA8ZPCsp/nuwDPR8Iw+O4mt5lFulXv4zXjJOL2pX3i9/dXVNgNDBtLhnX
         S62FFzMPgXGn9p3Cd5VQxmw/AVENrPtndTmNkoacX2lU+mUFtK4TCHK03WDIEaO1kIQa
         hairV5EiXL7nv+9IoLYzT/P+yscnHXNI3A6GO9MdTcH6Rmv59Bhw+pc+0i9twWDPEKLW
         4LXExuX/jN0WM88vb6VwiLKkKgxWL8tWcj6Xg4p+DqsRU64GlVHl2RCPtuuxC4Q73r2m
         ZAFA==
X-Forwarded-Encrypted: i=1; AKwUvBz7iRQA7vlIy1CHG3LJcidf6B/cPI+lBOufkXzY/htBQOij/r+CSehaJpRwK6a/eLZpIBdR76hKCdI=@vger.kernel.org
X-Gm-Message-State: AFuF++koo9rZ0a/K5ct0HqPWAb72gK1Ovl8zspEQsKVrcUpbZKTVd9N+
	LUrmi1V0aeBO/9b5Z6AMoM3Sj07Aeno6pIYiNBOP0+BZSFMHiFMOn0e4uN19K2AEWEo=
X-Gm-Gg: AYBFou3qELwRhLjXSK9B1ZvP3dlYHjsjaSjRgrdRwfGGR5OnJjrq/84INImEMtYiGyY
	YR1iBWZ991Nex11sLGPyuxSOsxsvrVRffQ9Z/V5e7TaK9xxQJmc7n5A0EF/yvGBOenS511PYDx+
	JSkpHJL/SPq2j8F1mNbPd3CzbMhSHcqupsOHfdkTFIfrWW1CB2U3is2AXF+vHnYEN9qh+Xc5mgm
	pycqRFSCCQHK4643UJ7/O98B+R/o6qcrsm5RY4iwbn+vGE5PknsL1sYahRU+OzFvPAz/8CTizPZ
	hV/IM8wG+k3CQavVRXaHqcKzXQ1+pyKph+C298k9dhAOL4l/H5t/553jmMEyo5lMUkVX+CGL8x7
	Pi8FHjfSwhchU06OHSOwq/L7edMEIvQmolRArfNfm4UWFv5C7Beadhm71kNNfm8CmVJpUPXGOdk
	uIVVSv4udvIvETA9PTTTadSChVIDQfiWbPWkpNIwd1lX8FQQRwjstblDU+i75tfxeNvS9MVfgkM
	Qo=
X-Received: by 2002:a05:620a:a0da:20b0:93b:e412:8cee with SMTP id af79cd13be357-93be412aa37mr210118885a.73.1789750357966;
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: introduce TC9564 clock and reset
Date: Fri, 18 Sep 2026 11:52:29 -0500
Message-ID: <20260918165234.687224-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock and reset controller present
within the TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both of these PCI functions provides access
to the registers that enable or disable a number of clock signals,
and assert or deassert a set of reset lines.

The TC9564 PCI functions provide PCI endpoint buses via devicetree.
This allows a PCI function to use devicetree to define subordinate
devices accessible using one or more of the function's BARs.  The
clock/reset driver binds with a device defined this way.  Only one
of the two PCI functions is permitted to define the clock/reset
device node.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/


Alex Elder (4):
  dt-bindings: mfd: introduce the TC9564 config syscon
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock and reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  64 +++
 .../bindings/mfd/toshiba,tc9564.yaml          |  56 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  11 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 366 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  54 +++
 8 files changed, 582 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 79d34e34e9ab629be19e588ec2eb7e1855d6dc46
-- 
2.53.0

