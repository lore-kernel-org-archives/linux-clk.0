Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71715136320;
	Sat,  3 Aug 2024 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722682680; cv=none; b=vFLvlB4I4nLZkzDFXJcSnPhBNvc6JcdQUGe3Fi5qfQSPqKo8T2MNfHTWKAqDUPYshgFtzplMTBdGuv838D6fkg2k58KSiYu9Rnm+YFhf9D6KEd5BK5tJyiYzdtx49Qul7S+1qea9XqGjy06+GUnxYzHK5HVzA7/v1l5IE0SBN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722682680; c=relaxed/simple;
	bh=wBcldRlShYsE/tziCShRrZSLFh59JLWVarSBMPwXEuQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dpfo0ZsPFEcThl8HDdMlROvFJ86B+rgAhTdKw4YV0WrFiVd9/3vuuf/4kRX7yOBDu9bO5LZdSPOyyaBS+d+Gctz5kVnj0eGxcQZo9D4ghmipHFbdY4tXW1aI0oBsuvRJjAXzrPuqrjE8pNhoQfotOnxpK/FVezx4M0iuQ5XcyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=i5Urta9o; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="i5Urta9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722682669; x=1722941869;
	bh=+9L3eB0PjTw8/WJJfJ6bjGYnz9iYteO3NaUNJ3h8kP0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=i5Urta9os9xP1ID5TIudZdf/2btzg9hS3LHDl+wKTVVvJYphjNLfLqYP9PTXhhJRn
	 u6ifuzF1pYmsN1ExSAzZBxmNS3pOxGQv6bu04oHwRcdde2jtR6IghTk6VbB0jH717v
	 JzbuGjVBDKWMA7grSxnch+ncBPZY0bVSBWvTWIZI3jTv7B3nQzgcKHzh4vOK/eRfSh
	 sxgtWam1Ys5NH2bjZ4j/gJfKTtAisyxxOgddVtX26KsJ/JkdQCbglvBpXK9Bpf8BIT
	 5lOnyuRjiVLjiggl8Cfpuklb9ClAUD4DODBfzVPHFptsk2sgo/yY02miNZfV3dzZn8
	 CpvlLBUjvOXFg==
Date: Sat, 03 Aug 2024 10:57:44 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v2 0/9] clk: clocking-wizard: add user clock monitor support
Message-ID: <20240803105702.9621-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 3b2a02ce4fddf6b775dcc78b381e70fd5b402cca
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
in hardware) and add support for the clock monitor functionailty added in
version 6.0 of the Xilinx clocking wizard IP core, through use of the
auxiliary bus and UIO frameworks.

The combined addition of all of these patches allows, for example, to use
the clocking wizard solely for its user clock monitoring logic, keeping
dynamic reconfiguration support disabled.

This is currently untested on hardware, so any help testing this would be
much appreciated!

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

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  32 +-
 drivers/clk/xilinx/Kconfig                    |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 335 +++++++++---------
 drivers/uio/Kconfig                           |   8 +
 drivers/uio/Makefile                          |   1 +
 drivers/uio/uio_xlnx_clk_mon.c                |  71 ++++
 6 files changed, 285 insertions(+), 163 deletions(-)
 create mode 100644 drivers/uio/uio_xlnx_clk_mon.c

--=20
2.46.0


