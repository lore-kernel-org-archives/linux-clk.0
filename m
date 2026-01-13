Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54EF241690;
	Tue, 13 Jan 2026 22:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342323; cv=none; b=qK4K2lW+IK/jzfoaArI7KHHpIoQrqMplKi9fo8ypHh8PCNRmsg1Kder+koZIlQV0DX38vYWPkgHdhyDrvgZFqg2SATwPd4Dt/TWFZFQ6bdzVNzKNoLX3UQqvQGMGD+b8MWnlzavyOInIyuncFVJtqIJUpA2lboLGX3MVqYByIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342323; c=relaxed/simple;
	bh=8piZ3BAylRiP5AdshOvRIEN3ooGFtRYuj3L56yhJI1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nfyo5PHgVrfDHAK8bml/Xe8QezXyZzEekcfJ8HXHVsoZyfcq2cHrFL7uo2OwsPb0ipL25TDXKgU84LGl+5q+wAW9RFqJx11HDxPbgRhqk+bfIPEsMu88zrL63kA8Qo5Vm/n2H7XzXtEpCaS6Wd0dClLh3Xw8CKInE4cMXYNpt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Va65M8i0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Va65M8i0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35168C116C6;
	Tue, 13 Jan 2026 22:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342322;
	bh=8piZ3BAylRiP5AdshOvRIEN3ooGFtRYuj3L56yhJI1U=;
	h=From:To:Cc:Subject:Date:From;
	b=Va65M8i07ZbmUATu4F20jFEafvnHFQfGnbXrGxxM8jCxFepDLm4GUAGmxfdC9Vncj
	 AfqTQXqPfhqNZw4d6dpuUTCe5ffbJ5BlLM7af63LqVHOvpRDQ+u3LKV5dvZLarHcem
	 luMuPze15Ty3JnIY8lEkOIhFlAvkXkPBFsqeoXjLMXP6UR7aDdRGYJNV5rO2jLUhVu
	 N9PhzmKiLtoW6rLRZajypZPbz4vopwmPuXGHrKVD0Sy7IM6huqW10oIR2HiA381yOB
	 2mKlX5WKxBYm38EJHS4xCavJIyqfsqOm2RnqoQUXpKxs6QtsEa78PhD/iiKeS/TmAn
	 FrYicdTQxwjVw==
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
Subject: [PATCH v3 0/3] pic64gx clk kconfig/binding changes
Date: Tue, 13 Jan 2026 22:11:44 +0000
Message-ID: <20260113-snagged-blemish-52af3d00d88e@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=l6nheBj3BQQJEV+4zoKyudCtdj+MNDvSBpqn5C3pvu0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph+Wvpl59FHq2sFWod9LfVXNFAlqPri9szZXsqZabx u5VOm1iRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbS68jIcHIqp/K0bY9+iRcV HRL9nSK6wzRrw7R8R7a/gW+Tblz4ZcfwP9HoW3uumo65X+cShW0/dm1ePmXtyffOnxbM3CvrPum iPhcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Mostly this is stuff that PH did last year, but rebased on top of
current work, now that the clock driver rework patches have been
applied.

v3: rebase on linus' tree

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

