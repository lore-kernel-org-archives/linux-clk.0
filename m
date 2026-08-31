Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7514968EE;
	Mon, 31 Aug 2026 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198862; cv=none; b=TjSdeuW790azqCqsntRd5pys9d0p6M91xexNpL20AgZ5POiGaMPu2RXnfqobnG6p2rdekfbAeWbRWeu5Z7VT5m/aOjITktEC6LYfk5PN53HcXD7smLjp6U9cD592kEnKtx+Z/ZY33HwJw1eB4qfeOlupGN9eHgG0mb63MZdHXc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198862; c=relaxed/simple;
	bh=UBw8U4P1zzMBUxbXAbA5GnrUday+gMb0sML5kDFVsko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GiKreQ1xdvMRhvg9RuoIB7IrAVfwNGaX2gWfRMGgKH8W29jDjcUzk71ehqdT7Je3bS4ONTT0vMoHX/5EBknz5KLnAieYqCdSsH3avnj+YxdCLXLTHrBokr3Br9rpVyTI0jg+fIz15c3jFueZ+gM/zYSuwFT2Pw22P23OgSthEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPVHHNpD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPVHHNpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B3A1F00A3F;
	Mon, 31 Aug 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198861;
	bh=2N7Q2ZMDgn7jMiRiGogUoaXP6JblA9mljddMuVcH0lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oPVHHNpDE7P0PHqQcRk+cMQybdD35eeHZQHf2Oks7f3lp0bSsetHmWkIHhFwdrLFa
	 68Zg/Qt6GL11LXnLsoFuJTu1x59kAJxGIBvxQdSARwntUvop8+9IaAvoh6QkKKSUZ2
	 q7aWGyAWkKCYxo6EE1AksqztD3YeedFiJsB1hHdcqF7SMqyDrhbWzwNLjUgDQ1980I
	 G5HBky5k8JWvHPvJHoUttnwjR+bYTefbaI/LV1fA1KD1zwACUxFJGSrKieZ0R3SiQV
	 GWameGtsJYr4leX/4166wjIk9P4NzfRAPMtFxw7CwOHpD9jkHgWgb4Wy79BVwBWCb2
	 y2kE3/9vuiWIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Date: Mon, 31 Aug 2026 12:53:50 -0500
Message-ID: <178819882997.1411250.8262023626369697707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
References: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 21:47:17 +0800, Shawn Guo wrote:
> The Nord clock driver entries in Kconfig were out of alphabetical order.
> Reorder these symbols so Kconfig follows the same order as Makefile,
> making it easier to locate and add entries consistently.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Sort Nord clock driver entries in Kconfig
      commit: c0f912e6a2088cd8aa356a47ce9325ec9b739686

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
