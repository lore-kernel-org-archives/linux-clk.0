Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2B424D65;
	Mon, 27 Jul 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173358; cv=none; b=A2yaDiXOeqgKk47+d8FT9bwwKTavjnDR6LdWEEaIFHBaTJImoN829rUC6wOHuAe6OxlhTb9vrD5J5aiG0iOZGjrl/4zbvNSm5i5fv1XESKoGYfN2SUHM80An+mlyn3kp/WfUDmd4hfVk6bBqVLIqJsX6jZd1zNvf+5cVJYy2YHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173358; c=relaxed/simple;
	bh=l+chZZyn6P7kGBMNFbMCOegDIFUTqz6MY50Cx6g2xWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3kYkDpmB9RTh8VoDEjOOS51p5fTomld5pD+KF3yYTinZ2H4F9MXSoKBQ7FGUOOq1Edpz+qKQIwS9bUZUYakt3r7TmGJhNEk9NysJXfAivz4acHrSEFKkHwwTlOrFMDPe5YcfnSQxYIdkpnOWkzFY45timtxq9sGPPJ0601JOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jj8RVaoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jj8RVaoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3514F1F000E9;
	Mon, 27 Jul 2026 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173349;
	bh=t5Q4ijmgMjKnU+9LIjcY0dZtKwKFuHlQnsscP9xRfKo=;
	h=From:To:Cc:Subject:Date;
	b=Jj8RVaooChr64g6dSC6spIp5P/w9009J+kLlPTUTt8AtNaXpWz/CCLu3Lwp1UULai
	 f7Ruc1q8heBlpKCrK4a3LQzitV8Tj469QsFlQGajlIrS4gls5nSviO5OgUxcZY82tB
	 +m3uAxXdH/WhxVrwGf04QOppUUqCtJPzMBCpT2Dm7RhaLLkTcYoAjZdiQ55/203vsJ
	 temTJM05Ee3DWb0SmyQNw/aMidiFDv3316nAh5EPtmQILuP/EWSfsIYtJmKcl6/Xty
	 m+zRPI5yo7mAqiaPONgzbg2FHzFsQfOTJCBvxkwWqni1F1SxopVZmK79CSj9TH8I/i
	 52XTL9mZv/LrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.2
Date: Mon, 27 Jul 2026 12:29:07 -0500
Message-ID: <20260727172907.21229-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.2

for you to fetch changes up to 1aa4e2ed7caafbbbedff89fb226a982413469baf:

  dt-bindings: clock: Replace bouncing emails (2026-07-11 10:24:07 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.2

Fix the Eliza display clock controller to avoid RCG stall. Revert the
rework of the "PHY mux" clock, as this broke PCIe on several different
targets.

Drop (and correct one) bouncing maintainer email addresses in DeviceTree
bindings.

----------------------------------------------------------------
Konrad Dybcio (1):
      Revert "clk: qcom: regmap-phy-mux: Rework the implementation"

Krzysztof Kozlowski (2):
      clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
      dt-bindings: clock: Replace bouncing emails

 .../bindings/clock/qcom,gcc-msm8953.yaml           |  2 -
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |  1 -
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  1 -
 .../bindings/clock/samsung,exynosautov9-clock.yaml |  2 +-
 drivers/clk/qcom/clk-regmap-phy-mux.c              | 52 +++++++---------------
 drivers/clk/qcom/dispcc-eliza.c                    |  2 +-
 6 files changed, 19 insertions(+), 41 deletions(-)
