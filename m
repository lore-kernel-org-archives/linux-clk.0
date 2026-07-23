Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CC14908C5
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846039; cv=none; b=uIHOEXBRjm189bTVrWGPJF+9v/4iiq4vOSCax3Z3TTas83eR4KQtK13jBWnj0kXYBOM74Qb3eMML6ZO7ka/xy7wiGo1apjqBJRHi9M1CJ4Szp4lsv1xXcZcv7REROyO2OWo2BMhMcfySA/8H8yZPYaN/jADoL6xSbjEtRHoD0vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846039; c=relaxed/simple;
	bh=cHeWeXQZOczKTkSUW9xVgQrnidh7z02WC/8HXtGf4oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ODKbFvOmr0vfhQPTkY6o65KPXsXP0Q3lxbRcDmbnJndn/Dm/0kso3WFZBTTs2nA0yLbcAZinWkJf95r9e3Wj96esWXJ9sIJ7nalfViBx4EroVh5q+m+7nIOwzEIZwDOjkxVt5Y5ASDJpGVZMpUEttKDzy+1ETnxoDstbUgvK+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LYoJwbLR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LYoJwbLR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=MpEHESMNTRc4WI9oAvqXsy9cYc98aqQpHvwBNvy6r/M=; b=LYoJwbLRmOOK88zsXAWXGyU0p4
	ZkOuAekdXCRuIQH8poWjT1b3CsxALXIH4E6ppW+HTl4++ehT2Z/4ZHU5VtUYBElrJFnjOs8IJkRtG
	NyaeRWtuMOwUY+KQXQLyncNVK6aOT14AKbeiG01M2lzt885WNxR0fZk6b2rRzkb234mbJSDQvpMYI
	yDLMSwuvJOnnrfqYHqA7hG6+uj7brrlFlGn4B8hePNALZDb+3UB7vVtfn6gi1BxsplQ90GpbA6Eky
	h79kTEZNeBm138X21pZ8s0K6nyku9yfZP3Q6AfRfV3NfiqmXaO30qQv5iflBPMe0wYfsoIBooXfQP
	QuezOEjw==;
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock fixes for 7.2-rc
Date: Fri, 24 Jul 2026 00:33:43 +0200
Message-ID: <1912648.b8e9qBsS6s@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

here is one of those seldom PRs for a needed clock-related fix for the
current development cycle, which fixes a regression by keeping
newly added clocks on, if they're not handled by a driver.


So, please pull :-) 

Thanks a lot
Heiko



The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.2-rockchip-clkfixes1

for you to fetch changes up to 946352b2f88fd2378f0341312e47dff1e8dc2fac:

  clk: rockchip: rk3588: don't disable unused I2S MCLK output gates (2026-06-28 21:09:50 +0200)

----------------------------------------------------------------
Fix for the recently added i2s clocks, to make it backwards compatible
with the existing devicetrees.

----------------------------------------------------------------
Daniele Briguglio (1):
      clk: rockchip: rk3588: don't disable unused I2S MCLK output gates

 drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)



