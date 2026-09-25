Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D086D36B915;
	Fri, 25 Sep 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326420; cv=none; b=khyWYRFmv4qa0JTzn8SWuEn3bTL94lkkUHt/JnGiYLBzAFzEyY9+VS4rz4PrbUZPij1L+e5cei6CtFj/2thR7sE7Ax6lJqG3cq+RUFqsxxjeVQ5NQyFEvotEtRYBvyQwwLwKVpGxs1bIgHuPO8p5vztpStMfOhlvQ410nB6GIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326420; c=relaxed/simple;
	bh=CsaeSEFWuPTwbJJqhYH7m/aoMeAcLzz0O0TLc+hk6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7Ze8PTB1u1mc0nY/LCmKJosWj+BvJoGPC4mhkuLDkL9PT8xnDkTjcWUqZyvm/3iwdM5WvCn2T1kyvaqsI4zJhdYOALVvf05Xl2iVReJf/TnWt3eY15R77NSOy2aOaLqhShQ06xR64FuYXGozVGQrOvyWhq9wHQFIpKYHp7Aibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E401F00893;
	Fri, 25 Sep 2026 08:53:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a78000: Add MSIOF support
Date: Fri, 25 Sep 2026 10:53:28 +0200
Message-ID: <cover.1790325809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds DT support for the Clock-Synchronized Serial
Interfaces with FIFO (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
I intend to queue these in renesas-devel for v7.4 (the first patch in a
branch shared by (future) driver and DTS source code).

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
  arm64: dts: renesas: r8a78000: Add MSIOF nodes

 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 104 ++++++++++++++++++
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |   2 +
 2 files changed, 106 insertions(+)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
