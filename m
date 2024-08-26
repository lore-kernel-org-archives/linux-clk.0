Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419A812E1E0;
	Mon, 26 Aug 2024 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675895; cv=none; b=EXp88ZVV1JLPSo7gqqDwYw3LP/gNqZZyLCYnWTuurCHjJ3Trt6HQebYbHP1TC/kt17GHcfbWOD0C47N9eZPiiXJ6vNi+6DLyuHqSwOb5n8BVzpaNIjsnucPsYadPlb3q9/2ILnlcSY0MQMTaWBJy9J+hOjOxFFgVIcvEjvkQI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675895; c=relaxed/simple;
	bh=BRlxLvv3IryVJ/kO8Pf2PLWTYIjeE2nmCPytjaHt3aA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cr0zlvq58vwvZ6GF2CMkvF51HmeH7XX5wPncJNhDVqJyE1+E63NLrQS/ZmgAagx/OFMdrlwvWWZ3Y5CSoq108o/ixUUenEmLfsN62Utgbadw8AhNyNwsVjRmGiFTQ7bln25g18w0vvU0wuDgNwHpet/BM8hIBaPwJEt45+NGvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DuT12gFQ; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DuT12gFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1724675891; x=1724935091;
	bh=Z6uBIkei9GJWLHndttwRgtzjIhDrXm6OeWouu1s7L4Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DuT12gFQXjh4nlpdlkrGdxVLZtWOBnWUZ/xCeEcz0VDUnrYbnmrArxd54fo0ReUUT
	 sYJpffNhgbWiIZ0K1AC/IdpRrTR9J0j/eLJ2xwRwl+cKK87tgdcw6+QrvDkIxQ4rEB
	 ILVnKyEtwMM72EHaCu5katk3F6bkcvSky3RIhDxqvPonuxdriTEEHiXP71UISJrc7Q
	 7yeZSdj/dyxNbgPX39+MT+r079dBxFRsZ8+SapSzXXTQ8MdyAi87pVZkBDsrEXyU9d
	 O3x28ifagsh6XlHa8UXMin1AakcqQ5zUqdomoyExDsXleETiS/j7BZ0VmpQMF5vweJ
	 uClUH1VgEiAkQ==
Date: Mon, 26 Aug 2024 12:38:06 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v3 0/9] clk: clocking-wizard: add user clock monitor support
Message-ID: <20240826123602.1872-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: a1269519a7006919c74b176bf00002bdb70b03ca
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Improve utilised clk/notifier APIs, making use of device managed versions
of functions, make dynamic reconfiguration support optional (because it is
in hardware) and add support for the clock monitor functionality added in
version 6.0 of the Xilinx clocking wizard IP core, through use of the
auxiliary bus and UIO frameworks.

The combined addition of all of these patches allows, for example, to use
the clocking wizard solely for its user clock monitoring logic, keeping
dynamic reconfiguration support disabled.

This is currently untested on hardware, so any help testing this would be
much appreciated!

v2 -> v3:
- Move kernel doc variable comment to bottom in clk_hw transition patch (2)
- Remove extra line (and add Krzysztof's R-b tag) in binding patch (5)
- Add Krzysztof's A-b tag to dynamic reconfig binding patch (8)
v1 -> v2:
- Split and improve clk_hw+devres transition patch (2+3)
- Fix/improve DT binding patches (5+8)
- Utilise auxiliary bus in monitor support patch (6)
- Add dedicated UIO driver for monitor support (7)

Harry Austen (9):
  clk: clocking-wizard: simplify probe/remove with devres helpers
  clk: clocking-wizard: use newer clk_hw API
  clk: clocking-wizard: use devres versions of clk_hw API
  clk: clocking-wizard: move clock registration to separate function
  dt-bindings: clock: xilinx: add description of user monitor interrupt
  clk: clocking-wizard: add user clock monitor support
  uio: add Xilinx user clock monitor support
  dt-bindings: clock: xilinx: describe whether dynamic reconfig is
    enabled
  clk: clocking-wizard: move dynamic reconfig setup behind flag

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  31 +-
 drivers/clk/xilinx/Kconfig                    |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 335 +++++++++---------
 drivers/uio/Kconfig                           |   8 +
 drivers/uio/Makefile                          |   1 +
 drivers/uio/uio_xlnx_clk_mon.c                |  71 ++++
 6 files changed, 284 insertions(+), 163 deletions(-)
 create mode 100644 drivers/uio/uio_xlnx_clk_mon.c

--=20
2.46.0


