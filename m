Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD4620322;
	Mon, 17 Nov 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393758; cv=none; b=Gfw/Pp+9GeOtN6h4MtHNgZCu76Dz6Ccp0R2AzuteW2S/DvrUci71PrzLt3i//BQZsKoUgyTqeqzZketW1RMO/k8LSCMh5/2HS9aQVA2nwAFyK0+SNZfGVliR1ZkLbHnzQr3JoqTVewAkLWCQEIWUH1q1kY56M5kh5Xr/9M9MJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393758; c=relaxed/simple;
	bh=sejSOYyPsY96chKjq2zJmBet1FKv5XOfuLIhGQCdLVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iSS57xAAKJccStkrdePKL3DBaoBa5wLqzb8D4zfd+4Oj2nb9en7YMcvKi9aW/rMBmNCvitCbtHVGX0R+I58yr2JYoG5a0DhcRGYNUJvhfXqMp5HSiIyuhdY+J+pLbP7sUkPZLeZdOb/3VrtMwjfZF+Wwbi/kuHj0DD5NUmoi42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R34oquFr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R34oquFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD228C19421;
	Mon, 17 Nov 2025 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393758;
	bh=sejSOYyPsY96chKjq2zJmBet1FKv5XOfuLIhGQCdLVk=;
	h=From:To:Cc:Subject:Date:From;
	b=R34oquFrUzx9JyuG4r4Lr2LC4ZNyQWLDyvC7Gs0UG47r76j1acd2AeGaGvhhQKbU4
	 mzDkcjA5ehcw+UJTf5qy1s4LCSvcKwogghRx3d/sLGHdaT52HOCaNQnaPYYEnDN5pZ
	 raVP2WIHx5uaiLvLM/zKn+I61CsqpXac0enNr9FsXTC0Yq8C1b0Sw7GfMjPCa1+ztI
	 b6ktixMcKrBi2WWeZ5e7mUZG4LfXKPGECm7TcRFd43XvuCpPCrZ2BGh+IezfnPN2IU
	 dBnESC8gai2vrvX2wS/nfI1FurX0s7kTGli1lBKqwFcnUzDmcDLxonb0A7clnNYUtX
	 SRBYndIoOKRyg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 0/3] pic64gx clk kconfig/binding changes
Date: Mon, 17 Nov 2025 15:35:17 +0000
Message-ID: <20251117-shadow-police-56aba5d855a3@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RzKPgfFKX1yPkSXhio0ERqXCdNZjWR+nMBI/96gcawQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDltyMnrjt4SzLpAXdTo3xZzF0e6a04su4bs7W8os1 gVPFv/ZUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlcfsnI8NRqzz/ODNcFPZFb Nd9lP05KSV90OGX5a0Hvre86Zj48ZcrIMOONQdMt3hl+1/UfznB9d2dX8SxhvoROvvAMRm+V+0+ dWQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Mostly this is stuff that PH did last year, but rebased on top of
current work, now that the clock driver rework patches have been
applied.

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

 .../bindings/clock/microchip,mpfs-ccc.yaml        |  6 +++++-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
 drivers/clk/microchip/Kconfig                     |  4 ++--
 3 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.51.0

