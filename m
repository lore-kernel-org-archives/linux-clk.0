Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797BF33E360;
	Sat, 19 Sep 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818480; cv=none; b=o1OWM+dnHikiZyFakN4z8IZdtDREXRE5CcdgXdxyXKgKcy7ANkloS5g+wXDgooaTjI40FffQvIkouUos+sXg1CY87i5BoZbKulpHH2TTvHHMtDdhfQuXlMGP2/1KdUur4GccxNCa0spFL8El//eJ2bX74XHCCkRs5Cjc3avuq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818480; c=relaxed/simple;
	bh=jeLNFpvlK9hkCaWDMFHhysZdee1DdwAbYN73gmDTox4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTbopLGBugy3rQ2cMN6qg7n5nFjwrDtHDz2OJ0aUGp6dYEUxoB/r+UR3egLnfv4qHXb1C5GtFf+Hu1clu3zDvtOsOzU6lPu5cxSxq6Ky1FzearDnlEDKZ+qj9C2xldeHsoW9vaIeqmo6fHx28QXHjt+Ay7xuNLpyrX5/MgQ5ilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=MWvMKCPl; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="MWvMKCPl"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 8176F606C4;
	Sat, 19 Sep 2026 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789818473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0OCTyA7s/r9aQUp6Mw8/8jVPFE4DEknKW9HCUStOOjc=;
	b=MWvMKCPlr11NeW/bYzee3d+HGfxrg/HP6EmFopACA3PF4gDHDkD10G/jeQJFRg1s4LGI2z
	4o0qKn9pelV0/EkFtBTrEZCE5u6EmCpfowXY8+TmVpefjyPRrMdiZsRy4cSIRgevBAAZ0X
	cENQgALFqYaNFpp+vDBEBHgO7yn938E=
Received: from frank-G5-5590 (fttx-pool-194.15.85.231.bambit.de [194.15.85.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 360F41200CB;
	Sat, 19 Sep 2026 11:47:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Frank Wunderlich" <frank.wunderlich@linux.dev>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Mihai Ordean <research@mihaiordean.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/2] Fix mt7988 usb with shared phy
Date: Sat, 19 Sep 2026 13:47:39 +0200
Message-ID: <20260919114744.46777-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

One usb-port (ssusb0) on the mt7988 shares its phy with pcie and here 
sometimes it happens that a trace is printed while bootup.

Mihai Ordean (2):
  clk: mediatek: mt7988: keep combo-lane U3 PHY ref clock enabled
  usb: xhci-mtk: power down u3 ports skipped by u3p-dis-msk

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 12 +++++++++++-
 drivers/usb/host/xhci-mtk.c                | 13 +++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.53.0

