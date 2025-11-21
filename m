Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6933CEAC;
	Fri, 21 Nov 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732650; cv=none; b=gNpNzmg2a/FLYKO450955i5v7xEJYU/2E6caoB9FxWg56sbY8ZoNJDMuOnwY8SvELJt4cOcVzbnf2Q9LXP7H0OhvFimrmkb6i6fdFmBR4arVpwPNGHIDINH8idox9TS6mU+LzF2LBPHc+X0ltrZHBecdCc7ZtfnWcu2vXOVaovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732650; c=relaxed/simple;
	bh=lDsrtShU/VO8T6WYHAXOOSTPA+dCTONGeNGt9vcVGcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6wjVjzS0hegWXGTGL/lgNIQfVTzsDXhfwAa3IuKvT6vPKI3DUQV1L/6xYRhyqSi3avnH5t9ZsAgKKH0DnvvjTsm3ez4Reat4qeRI/ezTidLyZf3Y5LA6xGaiUBYN68cvQlyEJk8uqQK1+epCm85QNcNkDwKer5bymzCuXtm3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7HOUL5s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7HOUL5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D7AC4CEF1;
	Fri, 21 Nov 2025 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732647;
	bh=lDsrtShU/VO8T6WYHAXOOSTPA+dCTONGeNGt9vcVGcs=;
	h=From:To:Cc:Subject:Date:From;
	b=T7HOUL5s9/0wAmJmOEo9qbvoVqOWdFk77C3ZmCZkMRXfOlUmk7t+PPh5HYvrBNJji
	 esB2Z5m0Bfai2gE6vqsEuMOCTXMXpOrKdCa7sQpiYDk3tb3qATRwIVUKV6Co3dEPY+
	 Is544oytnwcAMPZn5OJDZm7+IbEOFpYunkBGMWuHIOGyGYO0yW0JaTj6/b4O38pHnR
	 cKZIbpRvqMpZhlV3tZKI9DqedLGHeupWgqYCqYf41FOg63qUrQ3qhvNNufYgEQOGqt
	 HbmKUoTi3c3yrZnbP3zijZ3USvHzcDacJs/YdgxfmO5RXVcfxpePQGVX6uqbixQ3sf
	 4FjDgq66IiQKg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] pic64gx clk kconfig/binding changes
Date: Fri, 21 Nov 2025 13:43:59 +0000
Message-ID: <20251121-tartar-drew-ba31c5ec9192@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dil/skRvfu+XgxPfnqEG3kkSoF73rVq/CS0DNDKKvCg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfPmxgvvPcewwm6J7IvYRVvurNZff6B6y/d/C7vPK W6Tm+04v6OUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQAT6RJmZLhq7SjFdbYhqWC1 1JRQ3y31c+srnj7f8i555d19237UL77NyPCBIdTGW+gw6xv1m/mmh/wlyyrY9fiXxPLN/5kjXT3 tOTcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Mostly this is stuff that PH did last year, but rebased on top of
current work, now that the clock driver rework patches have been
applied.

v2: fix the binding, d'oh

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org

Conor Dooley (1):
  clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Pierre-Henry Moussay (2):
  dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
  dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

 .../bindings/clock/microchip,mpfs-ccc.yaml       |  6 +++++-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 drivers/clk/microchip/Kconfig                    |  4 ++--
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.51.0

