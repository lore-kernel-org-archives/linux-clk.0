Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2931D5160;
	Wed,  4 Mar 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626493; cv=none; b=VZVLv35L8WDzD0g1mfC946PE6hfnNxfrTlM4/9m5YdaE+XHa3OVuRDfyo8vBeqRjSETtwBBSJTkIsP8BGfHK/K+93SVI5WR+YiSC09K0skNUCkf6edadIWAGpSPKMPvzHJMOrDG1VkeSV8u/5RnrehtuZa7t7LJl497ZPm7Tvlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626493; c=relaxed/simple;
	bh=NqnDBviaTEomwJ3bklzRsuNCUDDwoczxNW/pCGr1cF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdkFZYn/ENWAmQSZM2D/dopvW1KS3MU03jNvxfvBPwVXv4NwcY/a/FU9HstXHMDzWPfk+R8J7SMZyH60NxuKXGZlFhFeoavGIzE5FaH00p42Jb/gvW4s3caQFZdY2xo4856JLsKtd1SCRY5SEJGpcJMBbHsn4LlDBNDfHVaZxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RtzuhTVg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RtzuhTVg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=2Z2Lu7KyAxUqBfTltkfQbHav7d1VSfTjzY0e+ZOM03g=; b=RtzuhTVgvfzamcYYMwd2F5UgvZ
	Rs+60jPo0mTLU1USTx7SK8CelhQI88B0TG6pyh/QlIDKqtW/Hx9rg7XSEBJwSSeJ9rBcKWR/g3Qzx
	6SeB1GWs+23q5dF3cnSKlU06QY1xec49M6oV/FfH7LumjhJhmLebIN0zvzz87UPJudkSNhrkG6MCY
	lWBBgqsj0uRTWMvlzWmO4NnOIGszVnuUNidwLlPLekNW810uDVESfUHDOdWF0Je8QXbjGZ2Qng77L
	x4K3FHsmpVI7ARjj5rQZW6tIsYg1H3s8fGw6Bt9s5Lk8Kca/yLZ9aEnOEp4XliK37C+0GJ2a14E3c
	DutmfHQQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com
Subject: [PATCH v2 0/2] Bring dclk_vop2 in line with other VPs on RK3588
Date: Wed,  4 Mar 2026 13:14:24 +0100
Message-ID: <20260304121426.1184680-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dclk for VP2 behaves differently and its use can currently break
other peripherals, so fix that and additionally allow it to drive
the same outputs.

I've kept Quentin's Tested-by from v1, as the overall change is the same
but did not transfer his Reviewed-by, as the series-structure changed.


changes in v2:
- split the actual fix for breakage and change of reparent handling
  into two separate patches

Heiko Stuebner (2):
  clk: rockchip: rk3588: Don't change PLL rates when setting
    dclk_vop2_src
  clk: rockchip: rk3588: Allow VP2 the same sourcing options as other
    VPs

 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.47.3

