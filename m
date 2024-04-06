Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1FD23773;
	Sat,  6 Apr 2024 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712400238; cv=none; b=HsltIc9oWBZeJQ5QhQ/na9nO/p3HlDac3p4HI5AxitSIMlHJ5tSD8Pc/W62fJJ1URTL86K1iKGZ+Nn5+w6EXr1YSP72lOxVqdCn9LoOcnxxBEGhesApaPX6S+NH6LmyRK56O4ivt8ay8PrhrUdSZ3x8rHeuU2ClRdhLi+iNpwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712400238; c=relaxed/simple;
	bh=RCtxoHYlvwhBxQm8LInowYtUBXOvUIdXKufplmg+VvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HECF+9bFUjsyJaYq5ptRz1AYDtmz61P3p8LQueOLc9s4eg8sma5RCF97D7PvqPK+mYWjfJtr0DjuOOzun7CYs4IWbMzT0ZBdsim4h2dF+boCFupoP1iUjCxIEY8WqUvc+dJxAkq2x4AKKovUDw5+sZ/ltLI0I3PNz0xCl/DNYE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE8zM4vh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE8zM4vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FDFC433C7;
	Sat,  6 Apr 2024 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712400237;
	bh=RCtxoHYlvwhBxQm8LInowYtUBXOvUIdXKufplmg+VvU=;
	h=From:To:Cc:Subject:Date:From;
	b=YE8zM4vhHhdpR8Jw2hGGono+iICY5DfFlv5ijcwiYMskvCtQ75ZuLJsm9iZc+hy7P
	 BSiV+ue0Y75nQ674aaHxnTWL+UCZyYhPwN7p/uBw26ndL7/U5xgOH/EBda/UoZ8jMP
	 2ia0g4IOPBFZ5wzE4IHkEPX1S3SmXfm3JFdnix/1S/yq4aRS0CtJZG+bFw1JOmJ+OC
	 eLv5hEyzL04raMnaDjLAtzGElZLqQvUSqV4G7AYI/aOg9jJVnXxz9RslZ1TyhKVD04
	 +N+vDQ6cfEjM1VZfXj+XsgYqAQkxkpIdTx74Av4Mjf0Bm7oI8V87ZUE6XFALivPdUK
	 kwfh5EwmagDPw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 0/4] Introduce clock support for Airoha EN7581 SoC
Date: Sat,  6 Apr 2024 12:43:40 +0200
Message-ID: <cover.1712399980.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this series is based on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/cover.1709975956.git.lorenzo@kernel.org/

Changes since v1:
- add .enable()/disable() callbacks to pcie ops
- introduce en_clk_soc_data data structure in order to define multiple clk_ops
  for each supported SoC
- rename clock node from system-controller to clock-controller
- add missing item descriptions in dt-binding

Lorenzo Bianconi (4):
  dt-bindings: clock: airoha: add EN7581 binding
  arm64: dts: airoha: Add EN7581 clock node
  clk: en7523: Add en_clk_soc_data data structure
  clk: en7523: Add EN7581 support

 .../bindings/clock/airoha,en7523-scu.yaml     |  31 ++-
 arch/arm64/boot/dts/airoha/en7581.dtsi        |   9 +
 drivers/clk/clk-en7523.c                      | 190 ++++++++++++++++--
 3 files changed, 211 insertions(+), 19 deletions(-)

-- 
2.44.0

