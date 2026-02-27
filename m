Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171636E472;
	Fri, 27 Feb 2026 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216156; cv=none; b=Rg/tyPVrNswpX3BJnEdR7Trx3zJyA0xbLuN7Y2QF+wW9I/n+G9kpp9QnsKCbSX4SCdrI+PQCJEd58nVA1joYqEklrZasKCJgQ6EAuN4NM7miOPE2uMEJtckCTWsNZQga8pPqEOf1vYAPflo/cEnIYIHgsf5FFbYHp+UfDEjL7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216156; c=relaxed/simple;
	bh=lFxX50iVSlnpuiBMKPhLIJk3W+4PP2Gcphk0SCPZefU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MmTNHkP+ae9/rwkn+dacB7glpBG3pgjwkeByQDR8lp2b0evKl5yVAWBjVaDWRpVXhU8JzT2CZBL6dlbEvTjr1i59OZEWodfBQlY33mGIaXS4sCNQoTi9PgfAGvcklFxAI8dDphPzPOeKtRYRO6SCHVyDXJJzzCl0hhapksRc2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=oyctG9i/; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="oyctG9i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772216145; x=1772475345;
	bh=IJQBuqJIDFLF068ZEeM//Jn8YuHmvtnbJIbkjKaD0TI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oyctG9i/fhP0IwGW7lBNWi5EXeTgSsLoEIr65yB+dy/aKzk8cnRE+EXjuPfqqXTPp
	 5CBgaGu0fDtLYbI3Zs9///0JJs74omxS8LObpVqa9yOiRHX1vTzTKA/a9w62wVk42b
	 DsacfO6cl6wawLL0s0YTsSov1DMPX8VUE2Xc3wPx6DW22aB+OP2W2xRy0JUaUZrgP9
	 Hb/wdZsoprdiFHb8tBTVZLC2R/7bgoGpuHeYho2tTEZ6g35EFMWcyKZpJzSKsZ1MyE
	 o5kfJUeoD1JFDQzV/19BXVO1bGStZTMys3ihiiKatmilRdidXg0VS8ebxPx8F7wp6i
	 eIM9llNPE9dPQ==
Date: Fri, 27 Feb 2026 18:15:40 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v5 0/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <20260227181507.19890-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 0612b8fa22ff3219816b113f35263756f3547ea4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the clock monitor functionality added in version 6.0 of the
Xilinx clocking wizard IP core, through use of devcoredump.

This is a follow up from a patchset I submitted quite a while ago [1],
where I was attempting to utilise the UIO subsystem instead. Stephen Boyd
suggested use of devcoredump instead [2] and I have finally got round to
giving this a go.

This is currently untested on hardware, so any help testing this would be
much appreciated!

v4 -> v5:
- Add Krzysztof's R-b tag to patch 1
- Fix patch 2 by moving dev_coredumpv() after iowrite32()
v3 -> v4:
- Patches 1-4,8-9 dropped, as they were submitted/accepted separately [3]
- Patch 7 removed, as no longer creating a new UIO driver
- DT binding patch mostly unchanged. Slight rework (removed allOf) and
  rebase, so removed Krzysztof's R-b tag just in case
- Clock monitor support patch now reworked to make use of devcoredump
- Rebased on top of clk-next
v2 -> v3:
- Move kernel doc variable comment to bottom in clk_hw transition patch (2)
- Remove extra line (and add Krzysztof's R-b tag) in binding patch (5)
- Add Krzysztof's A-b tag to dynamic reconfig binding patch (8)
v1 -> v2:
- Split and improve clk_hw+devres transition patch (2+3)
- Fix/improve DT binding patches (5+8)
- Utilise auxiliary bus in monitor support patch (6)
- Add dedicated UIO driver for monitor support (7)

[1]: https://lore.kernel.org/linux-clk/20240826123602.1872-1-hpausten@proto=
nmail.com/
[2]: https://lore.kernel.org/linux-clk/1bd17a02bab46391872e4934895b83e8.sbo=
yd@kernel.org/
[3]: https://lore.kernel.org/linux-clk/20240913191037.2690-1-hpausten@proto=
nmail.com/

Harry Austen (2):
  dt-bindings: clock: xilinx: add description of user monitor interrupt
  clk: clocking-wizard: add user clock monitor support

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++-
 drivers/clk/xilinx/Kconfig                    |  1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 69 +++++++++++++++++--
 3 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f

--=20
2.53.0


