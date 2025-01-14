Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1182232453
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861447; cv=none; b=Qf0PA8NNz6J+w2q//t1TEiOw31MkfdUg/kC6He6pUNnf7NPK5kPUV3+W/srHWsnRFcuRVNoq8wfrs2SfFbmMxWY/CGI8KKeXh9tik3ASmrcJMiQDlJ0Z+USnfdrLDivbyGlpABhNH3RLUKa4ijeLLnZCkt/AAiKHBjm3siZeKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861447; c=relaxed/simple;
	bh=v+CYuZibBv3r8fvNtfDPDxH9UZrX1j1jONfkBdqEqlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OhKh0nuR+2/wLll38/w/Cll8GNi/9dw8iOmvlTaIpRRXyJLcvkBuCkqGUG3fImtA9Ko0URz++PYb6MppZ8BT+Jt7nXIvFu5JbPcxm3sv500gcYvilCjCLpjDr7WZ0/w01kIkOKAbahIGE9+tD21xW1VXLYQ0EQ+EfwuoVyq4wEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZxVsSuT8; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZxVsSuT8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DsDqFsKNlq6k5bv26Wc6cezOu7WfsIt9U2WvPdD+fPo=; b=ZxVsSuT8Xs5o8SLdZaOxUY8byS
	O8m3iIAPaCTgl2t9Qmq0bFUCKO9G5xIfg90xcvw0Ps4SOm9phB5k/2fZzRKMcMKOM5Tzn7H/Dg6Kl
	ztrb0ZHGDNsDGe/I3IVrnEBqXqAb70NPBLx1fDw6M6gbCM+qAliy8oi1hOH7huKSgEr7S/ddz4sp8
	nvVKu79sdIugOnd1kUmoqjaBgze1LFLXlvkd2h63/2tok/NbrbIS0LZ1gjjfVU8HxzFtkO3ZJ5voR
	qDhJDBZHAEqXBHA5pwvY+mdSgdAmvwPy6+8aTvH1zWv4Hv/3CWMHxp6htcNUT/pRchiQZz48WRwti
	pOdjrTGQ==;
Received: from i53875b2c.versanet.de ([83.135.91.44] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tXh08-0002c1-EM; Tue, 14 Jan 2025 14:30:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.14 #1
Date: Tue, 14 Jan 2025 14:30:35 +0100
Message-ID: <2020465.PYKUYFuaPT@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with Rockchip clock change for 6.14

Please pull.

Thanks
Heiko


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-clk1

for you to fetch changes up to cd8b5366636bdff0449b789fb2d33abb20804255:

  clk: rockchip: rk3588: make refclko25m_ethX critical (2025-01-09 16:23:32 +0100)

----------------------------------------------------------------
Real handling of the linked clocks (clocks of the interconnect port a
peripheral is connected to) on rk3588 using pm-clocks, allowing us to
stop marking them as critical and one more rk3588 critical clock, that
the kernel cannot handle otherise right now.

----------------------------------------------------------------
Heiko Stuebner (1):
      clk: rockchip: rk3588: make refclko25m_ethX critical

Sebastian Reichel (5):
      clk: rockchip: support clocks registered late
      clk: rockchip: rk3588: register GATE_LINK later
      clk: rockchip: expose rockchip_clk_set_lookup
      clk: rockchip: implement linked gate clock support
      clk: rockchip: rk3588: drop RK3588_LINKED_CLK

 drivers/clk/rockchip/Makefile     |   1 +
 drivers/clk/rockchip/clk-rk3588.c | 120 +++++++++++++++++++++++---------------
 drivers/clk/rockchip/clk.c        | 102 +++++++++++++++++++++++++++-----
 drivers/clk/rockchip/clk.h        |  40 +++++++++++++
 drivers/clk/rockchip/gate-link.c  |  85 +++++++++++++++++++++++++++
 5 files changed, 288 insertions(+), 60 deletions(-)
 create mode 100644 drivers/clk/rockchip/gate-link.c



