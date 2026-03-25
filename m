Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6C3D3D1F;
	Wed, 25 Mar 2026 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439628; cv=none; b=sWuAdX/hDtau/DNGna/EvDFhUOrErkJYZ1UTmW1Dv4yfHCj/8TdQSJq+gK8Y4cViC3914t+XfSseTii3A3nydHFawyi8bxrxZcP7bYXVABRHNbebngmp9CoF70/0lmkGLxS1665Er3hVC2MDf+6gbeunP/53mac65PKe/VdGzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439628; c=relaxed/simple;
	bh=x891j24irvPH3LuXqfH3siMnDU7ruLZ7yUOPMjuvGxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IdRBkwWwTHvtTQsBJESeGbrzGzUAjNW+2Ql+BGtHrOtZqMOQG1PpiYxQvRa85Egey0Me8A6TCiZbStEW/CahWHU0NHq6bdpson6Up3G96uyupXX//ckGxGC14wMggCfBKWMbojRmEQU/eKpuJxtiHR36/dUCnGV8/TX63vrNj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syjEWOfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syjEWOfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D06C2BCB9;
	Wed, 25 Mar 2026 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439628;
	bh=x891j24irvPH3LuXqfH3siMnDU7ruLZ7yUOPMjuvGxw=;
	h=From:To:Cc:Subject:Date:From;
	b=syjEWOfH5Jp7inTONHk883vuDZoGC7tMLDXxSLbYcF/en2qhbzIR5Bc3njuZJyr0d
	 AshIJF23WYif5GoKHTooOwHXsGaznEQ8eZJih6Ej15BIm5mUUSpD0CC48gZVRSATWI
	 /QvdqRflxwmaJVP858Bq5KumMUO/zOh/TW8mNzh6hMBKBxXbQTkPNh+L52TUEgm5FB
	 hxykqRIg8qs7x0lReYGkGLKpxnKVYvES7HQn5tIerqp4/CZYj3WIEA5iqTqEhObadH
	 QbsJ0CwS+7BbF7XRKE2AYQJfnEErljIkigX9R6lQDiRGDui663NBibMwr7nMcEtrft
	 aw8AOE+AvyyOA==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: spacemit: Fixes for v7.0
Date: Wed, 25 Mar 2026 11:53:30 +0000
Message-ID: <20260325115111-KYC4742284@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Stephen,

   Please pull SpacemiT's clock Fixes for v7.0

Yixun Lan

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-fixes-for-7.0-1

for you to fetch changes up to 54e97360b44bed6b4399dd3be3d65f392df940fa:

  clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc() (2026-03-24 06:42:29 +0000)

----------------------------------------------------------------
RISC-V SpacemiT clock fixes for v7.0

- Fix inverted condition check

----------------------------------------------------------------
Shuwei Wu (1):
      clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()

 drivers/clk/spacemit/ccu_mix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
