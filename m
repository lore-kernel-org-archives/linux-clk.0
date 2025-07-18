Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8618E20
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872903; cv=none; b=h302e5QRjBPK2mt57afNTmUTHrSrEkQI+UbgzLj7K6K2kxSuo86WFeMlQgmn1v1JT2LYP0TWpadNzFsBYfOOclD5sruggbDNAlOpZEj3aBSusuhgVwcQPQI8Sgp7QJcVKGesYyrx3ZsaP2SPYBcQcgWSf94ortCN0VMOf/E1MGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872903; c=relaxed/simple;
	bh=ZR9JsGSAqvCodkcVpsjeAJGNdxXvSLWTY6AWdO9CtPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aW2D0qPCffakEc8nx9gTtw1K08fkrMA+XQRocSWirIh/3Fnmyz1H2ws7Y0ZHCANhiCdBWcyVwKDIWIpL5t2SeK81U9v642hqqL2WX4JAYTM5AN2AZC1JaDc8yPqiRLvZH3QgXfO0RY1c/+6IQRI7E5Or99ErhYxiZs21XLRDNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nCDInpQG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nCDInpQG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=54k6sFdGBp4s1YIJqMzamAxw5U+YBLgP6C9de7yVWBE=; b=nCDInpQG/1vSCl1B60HljDWF8r
	Jxm9bop/KWP7tarNjK93x7WyDvcMv2Zj3B5xTyPx91yRVJzXSdDFukOLFOxP+8uRypUkp7VxctxK3
	qMWqvRtNC1VUF/M4LJPIVZGPFJ4HUtlRamSDX+2DV6K5EvVEziY2Ld5uao8UHXtaEu9QQzK+eiTp7
	JJul6vhn90SfZMe+jiglq8lwTILlkHPYqwbZ33HN7wTUfqd4WDwKa8ukUiIEuAZjOim/7Y/puSIf7
	Xy4ODb5ei0/XVcRCr25SLNjZg7ubDniMRpFqroPdEthvOVrUGjmgGYU/tmghvbzpjGi1YKMBuMybg
	/2ijqBrw==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsJW-0007H3-3H; Fri, 18 Jul 2025 23:08:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.17 #1
Date: Fri, 18 Jul 2025 23:08:17 +0200
Message-ID: <6515302.QJadu78ljV@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with Rockchip clock change for 6.17
Just a single new PLL rate for rk3588 this time.


Please pull.

Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-clk1

for you to fetch changes up to 132b62280a9dbe38c627183ae7f1611de3ee0d9a:

  clk: rockchip: rk3568: Add PLL rate for 132MHz (2025-07-10 13:47:36 +0200)

----------------------------------------------------------------
Just a 132MHz PLL rate for rk3588.

----------------------------------------------------------------
Andy Yan (1):
      clk: rockchip: rk3568: Add PLL rate for 132MHz

 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)



