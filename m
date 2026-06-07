Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996C1DE8AD
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865979; cv=none; b=cwo9W4eodEK5wzRf6H6SjuJbZyxUqfoxzSjpNuxjF1Aa5WXeRm0DPl4Dtp93gvvjJ/whCxzaWeT6g7bFbR/4ObUd6o2oKQmwbgrULE128cyCstC1iBsi5WeY0laKK8qur9rc091RBVuKs0eE4cwgv4/kGF6m1N7bfzs5SsCHfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865979; c=relaxed/simple;
	bh=FcdczMiGt1szFBmKcbZimXAWAZoC2HoJTxTgs4ceeqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dz0tm5VwlTcqPtRzp0Ea1ZKAgJTpaQDrGBm2DfwKeL0hW9Gr7Gs4ONhO2MySAbGqd0Vmei3IHnex6QwUajdFi8NyPJ4Izuv565qoQ3XClpKhYq04ceDza9dTSRmqK+AHzp8WsCWNSncs+PH+Ho7Pdse/YUECzpQEByTju+E3/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=n5Rqs+xq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="n5Rqs+xq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=4NlgDV4TsT6w9EnMlZlG3KYV9Ye7aOC12HGWEXLPzwQ=; b=n5Rqs+xqbCzLFNuTJer3hO90nJ
	PeXBBvCoE4xYqlA5LO7HDyVAr001Eqwy2y04czk9f4rzcwad02QjMzJjxcvkRsiRChLo++MDQDCs4
	9Nyth6SopWz9WnDPHH1WffXLwSbalB/WtcT46NAkObiFDQeVfBXEXaQA/rBq9Jo+YrGdguwZHfNq5
	Cv4KRaxI/pjwm0kfLMPtOQfiXCMt8QHoVFBrhZYWwWXl3i190Ih3MtiLFXPXX+meJ/k0jXQp2yqzV
	ljBr8JyLS9r4aljgBCIS7fJVBcegmXY+VliNVaZ9JN4t+xmUaJaNEM6GULDO/VTMhq6OxU8VzWyax
	XsUysyJQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 7.2 #1
Date: Sun, 07 Jun 2026 22:59:31 +0200
Message-ID: <4272848.9fHWaBTJ5E@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with a Rockchip clock change for 7.2

Please pull.

Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.2-rockchip-clk1

for you to fetch changes up to 7edfb7fb58ee058298e18fde76a6077ef17d19d8:

  clk: rockchip: allow COMPILE_TEST builds (2026-05-13 12:35:57 +0200)

----------------------------------------------------------------
gate-clocks for i2s outputs on rk3588 and allowing compile-tests
for the whole clock driver.
The sparse warning when the Rockchip clock is compiled on M68K gets
fixed by:
https://lore.kernel.org/lkml/b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org/

----------------------------------------------------------------
Daniele Briguglio (5):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: add helper to register auxiliary GRFs
      soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

Heiko Stuebner (1):
      Merge branch 'v7.2-shared/socids' into v7.2-clk/next

Rosen Penev (1):
      clk: rockchip: allow COMPILE_TEST builds

 drivers/clk/Makefile                            |  2 +-
 drivers/clk/rockchip/Kconfig                    |  2 +-
 drivers/clk/rockchip/clk-rk3588.c               | 16 ++++++++++++++++
 drivers/clk/rockchip/clk.c                      | 25 +++++++++++++++++++++----
 drivers/clk/rockchip/clk.h                      |  3 +++
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 include/soc/rockchip/rk3588_grf.h               |  2 ++
 7 files changed, 48 insertions(+), 6 deletions(-)



