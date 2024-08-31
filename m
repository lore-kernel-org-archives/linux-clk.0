Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7F54279
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725102777; cv=none; b=dFiwDwarJ/VsXU5bucdPFBaIs7fYp1xVsVBxFkcPYiBubkItsjLOlbJ1BVb3nXTCZAqAI/pY+hVuWdn4FqS19cmJ2bqL0wpEmQaO92gLbWF/+B0Wz2nBun66UJDfwl2pizvwclKgaLPtr4yH3JpWISDjS4sIsWPwSXugu2CU3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725102777; c=relaxed/simple;
	bh=4ISkToId8X+ha5nIzzORWuecwVvKZZ2gSCD1N62vRi0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u/YPRGx191+s8B1+SRgIO5KolDNkWiQPsg5TBjqTKikslt5NZxpwo/Y2/vHpzVD+gnVHdmVIm0LluM0wrUcBQws2NK/MsLUNjqvtK1qWR7Pp1zkZfXBMWpKgtUuL9jcOA3lgVS7fHTKddAPCQMoEZzQFYR5KMgf4ZOVcuVa3JYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=e7rdhy7y; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="e7rdhy7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1725102765; x=1725361965;
	bh=Dols8a+z76GM/RLMd5BUNqT9/WON4qjk7rpO6N/5q0M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e7rdhy7yK1V4GQuAs0e9ZrPvKzJ82M1QXMdRs2aFPeGztEOsyxJxtUi/tabHKpOlV
	 4/F9Z3mrM5Cr+Vw6eJDQzjK1VvUY13xrbUMo1YBV6rFefYzxZt1K1/jlhqnmQA9fcv
	 XCYiirYxY0mdEMX2CNwmosrz419G6+tsoiV9Z5gkDegHcJQieXB3DsuZeKnLWCUT6O
	 DNhoNSu8nCLN7enwunNyZjmmoM0IF89p6c+PqQEwzfGo0L/aawoUvWmLQqWAK9w2TC
	 neOFmQIEkQ4jtRSY1PvgwIq7G2wjEgRGR9DkM4vsrSyzAc4S1dI2IrFK01sQxN5r7X
	 DfFzme22S4E9A==
Date: Sat, 31 Aug 2024 11:12:42 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH 0/6] clk: clocking-wizard: modernize probe
Message-ID: <20240831111056.3864-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 6bb30e44e4ae9f6e2fe7232420e2983d9a9c7846
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Improve utilised clk/notifier APIs, making use of device managed versions
of functions and make dynamic reconfiguration support optional (because it =
is
in hardware).

This is currently untested on hardware, so any help testing this would be
much appreciated!

This patchset is based on a previous one [1] ([PATCH v3 0/9] clk:
clocking-wizard: add user clock monitor support), whereby I was attempting =
to
add support for the user clock monitor functionality. Those three patches (=
DT
binding, clk driver and UIO driver) have now been removed, with the intenti=
on of
getting these simpler tidyup changes merged first, while reworking the desi=
gn of
the user clock monitor support. These remaining six patches are unchanged f=
rom
the aforementioned patchset.

[1] https://lore.kernel.org/20240826123602.1872-1-hpausten@protonmail.com

Harry Austen (6):
  clk: clocking-wizard: simplify probe/remove with devres helpers
  clk: clocking-wizard: use newer clk_hw API
  clk: clocking-wizard: use devres versions of clk_hw API
  clk: clocking-wizard: move clock registration to separate function
  dt-bindings: clock: xilinx: describe whether dynamic reconfig is
    enabled
  clk: clocking-wizard: move dynamic reconfig setup behind flag

 .../bindings/clock/xlnx,clocking-wizard.yaml  |   7 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 281 ++++++++----------
 2 files changed, 128 insertions(+), 160 deletions(-)

--=20
2.46.0


