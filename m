Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77A2AD2A
	for <linux-clk@vger.kernel.org>; Sun,  4 May 2025 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746396543; cv=none; b=HMavS85gohbJF8A5ojGMG8K6KTZoneAVcFoTYCUL+CIta31Uu5G7lygLDXpSqWyW3IrI9Lxf+qJAiCHTFag8AsMj/CLYB5PVn6+apNhfcXDh9QYR0/1w2bXE9biUjhAqc3Jf/GfCRG6UrQEMhLNdafcAzxxdraS7PW8na9PidXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746396543; c=relaxed/simple;
	bh=QoV4/DFE14PNvxT+D3YRbmds52TfIbj9PBMMxkd0JyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n1EVbJTg6g8mJD0Hfw68Nc0HwXV11RZ2yyxKGpOC1gyHv1vIHttSwC0G6g62LTVoFTcZG2WYvHOv26r9xBNZkP9tMjU+yZHv66xX9Dnd4WolvXcs1F1QKkZb14K88Xy7Bys4wBjrCCYA1xpqP2wmD0AdzlSNvqKmdP9pxoATLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=POgwbCER; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="POgwbCER"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=UJHS/deKALTS1fEsNNm2kcY+92bgBd8Nc8/JBeUNYdM=; b=POgwbCERqcEyY6iBwWLO8DP3cu
	USU9WJFu4XDFaG2MTk0mskNDOGnfMtamWVGjEUyEj1PtOXM+Yf8gTspp1GP20A/JjmumL9Yca+eBq
	S9dVfoPE3gwr1cSVAYSjV3pxRcS57XM0wqAEbHjLeTf/7j91rd5CTu2gLuJuTWsLAsiCspdF2rYMd
	lOC88edKHXlpSawMWidRcLS9NHX1bRL0SdZU0JcakWxswJXrCrM8lQ6SmN0BW/5r6A/caFN4JH3Ef
	2wjtyHvHL/ghh9RGVmUde5HrZORZ9CVHzu/BDH5lHnPYMsrm9w0bPjcEnhFo8YjFBRoHPWoFb2bsz
	EYRh13XA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBhVz-00069J-QR; Mon, 05 May 2025 00:08:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock fixes for 6.15
Date: Mon, 05 May 2025 00:08:50 +0200
Message-ID: <3034384.VdNmn5OnKV@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

for once I do have a fix for the running 6.15-rc round.
The nvmem support for the rk3576 encountered a number of mishaps.

First the clk patch was marked as applied with the driver patches [0], then
on the way from the nvmem tree to GregKH's tree something went wrong which
caused the whole nvmem patches to reach Greg after the merge-window [1]
which in turn meant that the otp driver change landed only after 6.15-rc3 .


So right now, both the driver change as well as the devicetree parts are in
6.15-rc, but that one gate definition from below is missing for everything
to work.

So, please pull :-) 

Thanks a lot
Heiko



[0] https://lore.kernel.org/all/173978599692.25901.15315285566342669137.b4-ty@linaro.org/
[1] https://lore.kernel.org/all/20250411112251.68002-1-srinivas.kandagatla@linaro.org/



The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-clkfixes1

for you to fetch changes up to d934a93bbcccd551c142206b8129903d18126261:

  clk: rockchip: rk3576: define clk_otp_phy_g (2025-04-26 00:04:49 +0200)

----------------------------------------------------------------
Actually define the gate-clk for the otg-phy on rk3576 to make the nvmem-
support work, that was merged for 6.15 .

----------------------------------------------------------------
Heiko Stuebner (1):
      clk: rockchip: rk3576: define clk_otp_phy_g

 drivers/clk/rockchip/clk-rk3576.c | 2 ++
 1 file changed, 2 insertions(+)



