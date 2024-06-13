Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82617FD;
	Thu, 13 Jun 2024 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282859; cv=none; b=lQhVWY0Ie8URSTHpd65pa1cohq8ncSygjygBzVPOiQf8IpbCaMyvLWWUAVnHevEmEEnb6M44Ex2XkbraTIHeLaf/tg7zweAFe8e8hNGCq2yx+9WNYgn7wu9/vetv95icuGCyKn7SicfXs1B6+iRQB18jM8XV+UqpZU7+KLH72BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282859; c=relaxed/simple;
	bh=owO0zqfTe7FA+mgDkZXnzHI2Aqx+GCJIs7Xwqq1g2gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YzEzV/VR7KXJd2P0qjUKpgzz2J3x61gIKXHZwgNc4kulxF/whvlCJvScee36ZSBjTar9Axr++UDcb+yh8LCSUZiogVmsJkvW7aS79JyO5Cd9sdU6RoqjiLEKYHkxAbLytHPg7HrTqeYqp9+zVScCf6CqO9xstM3SU8Lj1Il4bFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+YKBy/w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+YKBy/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A89AC32786;
	Thu, 13 Jun 2024 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282858;
	bh=owO0zqfTe7FA+mgDkZXnzHI2Aqx+GCJIs7Xwqq1g2gw=;
	h=From:To:Cc:Subject:Date:From;
	b=O+YKBy/wofpVaYLA546tFskGvS+zdL3CA/K0ZjZ59szyBUUMqYydQf0dVgey0gIMh
	 HMK7JYSe8iJQ4V8Y1r6wf2ahuAX80z5UjfGXI+XyF4PFv9ISARGsRu7eueIpbzHVqP
	 19OuVAyXYVN+FBfAaCwVFH8Xbw5V2sfuop1ucLBHglxZLAgj8iSko8nCJOrvgwfEu1
	 hqRu38XZMFjwoQwfVGmyV8PtvCfK4FG0/1MArT4C087TSkMKpQj2Rd1jdKEC5TumAI
	 VfhKmRnbmCovFL5jD/UX0ZSKO6zGS0hIBGkxNdGdmwi7f6lh1ab2jSFEA48QBt4omJ
	 v3dLrg5qZx26g==
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
Subject: [PATCH v3 0/4] Add reset support to EN7581 clk driver
Date: Thu, 13 Jun 2024 14:47:02 +0200
Message-ID: <cover.1718282056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset-controller support to the Airoha EN7581 clock module.

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
  clk: en7523: remove pcie reset open drain configuration for EN7581

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 +-
 drivers/clk/clk-en7523.c                      | 253 ++++++++++++++----
 .../dt-bindings/reset/airoha,en7581-reset.h   |  66 +++++
 3 files changed, 291 insertions(+), 53 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

-- 
2.45.1

