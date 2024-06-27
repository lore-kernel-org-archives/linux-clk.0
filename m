Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4D13E8B9;
	Thu, 27 Jun 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486299; cv=none; b=nrk17BH5OARR6R8TK0ONtBUh0GRfbqFhC25PQSuQiq+aSeUJAOhjNcS0+p9z7rOV/iVIiA6o1RI+8VJHis19a06Bre/W2aW4GK1qpsicn4Kf+zSDZr5XMGry2vVafD9CQI0eWqA/GtaFXBJH3PQ4I+NYcQtk+Yzleiuewafnlkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486299; c=relaxed/simple;
	bh=8ZzDTsMOMidSBP3qxObEzRIVmzQAHImEyQbdHOCy2uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pykq/mLyJuhNdUvEisOnRSLSbIXHssAGQEyPMPj+xkntZPqy/+8UDvhzD8yZixxMTguSazocdrNk4N8bTI5zisdlQ3QmEjkF/5uVvW0daOk2ZDqFOBgaTmGSep/zutGMJuQ3P63JAyhtBZVha4a7QZPs3jqKICIgUM3owsx4u40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7yK+jpR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7yK+jpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE68C2BBFC;
	Thu, 27 Jun 2024 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486298;
	bh=8ZzDTsMOMidSBP3qxObEzRIVmzQAHImEyQbdHOCy2uc=;
	h=From:To:Cc:Subject:Date:From;
	b=L7yK+jpRDLdNv3MVlh1VRwYL4RusBLBp5pboX1jV1qD4oJ9yRMwb9JQw5ykdIbyBh
	 1m7YtVhNVuBV6fjVgto2zxKGHLqTwzjuTiSNmI66HW4npVoSUtamChibJ+yYN3TXKX
	 yagXOPLjLiUWg1DqN/pTM+C9/rX2jQuXloWQcYfSlun/sHtanmWG+NZf1nkffXdZoT
	 hFXr4rYl/HmURE+cVOLj1xkDVzxsX+Iy1Xp55Kgq96kFRcNGv7+o9JOPMb2F6phXjP
	 qBfrRENLrZ2CcaC1sw+JDI9iD5lN2F/tsHLTznsBJRd8U8GHbGtdIaJ8dfU3AcMWbF
	 eEqC7yCng4lKw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 0/4] Add reset support to EN7581 clk driver
Date: Thu, 27 Jun 2024 13:04:21 +0200
Message-ID: <cover.1719485847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset-controller support to the Airoha EN7581 clock module.

Changes since v3:
- cosmetics and minor changes
Changes since v2:
- move reset io registers in a dedicated mapping since upcoming pinctrl driver
  will need to map some registers in the adjacent region
- drop patch 2/4
- remove pcie reset open drain configuration since it will be managed by
  upcoming pinctrl driver
Changes since v1:
- squash patch 1/5 and 2/5
- introduce reset line mapping in order to take into account possible holes in
  reset definitions
- fix error path in en7523_clk_probe()

Lorenzo Bianconi (4):
  dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
  clk: en7523: Add reset-controller support for EN7581 SoC
  clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
  clk: en7523: Remove PCIe reset open drain configuration for EN7581

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 +-
 drivers/clk/clk-en7523.c                      | 245 ++++++++++++++----
 .../dt-bindings/reset/airoha,en7581-reset.h   |  66 +++++
 3 files changed, 281 insertions(+), 55 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

-- 
2.45.2

