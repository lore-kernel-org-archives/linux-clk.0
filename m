Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558F468C22;
	Fri, 14 Aug 2026 19:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734281; cv=none; b=IGeVpjVC0RqoypIceVpsGgQ1WJEUH3daysEya/+h81l/EKW8zzlpoPVKG+8cnNtfC5ouiyGTsYzYgWfVNErvOierHS2IZcHlLFkxA7DAis5hxCS2Iz0lqpViSDqQxMoCLkbETvIVPbqv+Jx3mptrnofhHPzriI3LmkqZOyeMCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734281; c=relaxed/simple;
	bh=ZTacEdamTjtcOWYg9r7tGbj7q1FmVA0oefjhwKlnj9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OP+7OURUe3G10BMJCdBtaxqH+u0AnhDdcVeTkXmL1dG8ArNpzHC4YYPKSTAoaMf7ALLYYdFwhuSCBhsux6Myb+jHPW5ctZYlVpiXPzujzLqv5U/lxporv4owbmfqLOCCUCs3gU1o9Tel8WgWb6UfvUKC7hBq7my2EsallDf9bYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFfYJNzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFfYJNzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ADB1F000E9;
	Fri, 14 Aug 2026 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786734279;
	bh=GRfpXXydvaAKWVSgphfezwFWU7FKmN072fWVW1CtMOQ=;
	h=From:To:Cc:Subject:Date;
	b=OFfYJNzQMZ9iccGEh2AvFXqADxiFWjRLr/l2gVbI3XbfYPWsOZdOX3PT4ww1AVuHQ
	 WWfMOFYrRgIAN3Xhf13/d7OVMjN2s5ux6ejC9HUe0vAwvmAQZT9XB6nvCbUmGQ9S56
	 yMkVm6QZXJKlP8qlgf7WdBpUhC81zxF3L1WEdnnumlRmPqVZMo9s0uX/BbuFIav0k3
	 XYboMytFTZBDlUO1ZG+WjJ4K9cYflxUyDPht4qnJIIWVbVgOqYEZEzydmEqw/MRg7Q
	 buyNt6uYY3gQ9j7nSsLbx/58es5KLRFFLf4S9vqJRxGTNh+CqM3hyL25pMyEGns3Wn
	 eTfeD0MSHb3Dw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v7.2-rc7
Date: Fri, 14 Aug 2026 12:04:36 -0700
Message-ID: <20260814190437.464381-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 7ae8acad2d5c415ecb754409a4b64f09169c082e:

  Merge tag 'qcom-clk-fixes-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes (2026-08-10 11:35:50 -0700)

----------------------------------------------------------------
Fixes for the Qualcomm, Rockchip, and SpacemiT clk drivers

 - Keep audio working on Rockchip rk3588 by skipping disabling
   unused clks
 - Fix SpacemiT USB2 clk data so they actually work and keep the
   HDMA bus clk enabled to avoid system hangs
 - Avoid clk hangs on Qualcomm Eliza display hardware and revert
   a patch that breaks PCIe on some Qualcomm platforms

----------------------------------------------------------------
Daniele Briguglio (1):
      clk: rockchip: rk3588: don't disable unused I2S MCLK output gates

Konrad Dybcio (1):
      Revert "clk: qcom: regmap-phy-mux: Rework the implementation"

Krzysztof Kozlowski (2):
      clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
      dt-bindings: clock: Replace bouncing emails

Stephen Boyd (3):
      Merge tag 'spacemit-clk-fixes-for-7.2-1' of https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux into clk-fixes
      Merge tag 'v7.2-rockchip-clkfixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-fixes
      Merge tag 'qcom-clk-fixes-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes

Yixun Lan (2):
      clk: spacemit: k3: fix USB2 bus clock
      clk: spacemit: k3: set hdma clock as critical

 .../bindings/clock/qcom,gcc-msm8953.yaml           |  2 -
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |  1 -
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  1 -
 .../bindings/clock/samsung,exynosautov9-clock.yaml |  2 +-
 drivers/clk/qcom/clk-regmap-phy-mux.c              | 52 +++++++---------------
 drivers/clk/qcom/dispcc-eliza.c                    |  2 +-
 drivers/clk/rockchip/clk-rk3588.c                  |  8 ++--
 drivers/clk/spacemit/ccu-k3.c                      |  4 +-
 8 files changed, 25 insertions(+), 47 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
