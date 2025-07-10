Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB12222AB;
	Thu, 10 Jul 2025 11:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148129; cv=none; b=ZdB7mABZuXR/kbZLS44MrsO4XtjVuOXnINKizX5GS8qUapsG/SIfjoZ7HDVf/CP2uvwLXs+bKHMQLQmRwO+XHiJXwpz/uuIZpaYNaLAxSWGmklQHMa5QT0XB/NLWFgcP+AdHzBf6S0UE59rEU6PleLgX+OEq0yZGDjelkBaasDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148129; c=relaxed/simple;
	bh=Y8ODQ3usnbJxaB70tVVCgBYLeFbC+x4qHbjISxINAhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ek/UxLE5LpohvNPATq5Aj91Hkp9p5N+wtX7bBp7dIKZuAuhosiR9XcmoqIdjur8q67atJ0DM45ONoArSqZFcUyHJnCP7mO59IRFh7TsB4Zu9zG8UDsQWoZOk2HKZ28txbrwfGO2h8JcisfrU6lgTXdTf6i+DdlvJo3DkinsV0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nRHLVAA9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nRHLVAA9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=y4s+IUaUyh9dlQ/Hx8EWkCmljPen6fWuwD0jHRtCum8=; b=nRHLVAA91vDKuodTPolGnRickg
	MZaOnRcGGAMfQxRoBaiOPM8+2tohT5OeBxIjdjRNeDIrx+xB5VeYB/NnDGzC4ooY0DAjB0ig+Bu6R
	F6ZVldo36ZBFEJy6GloU1ozA0jnI8JnF6s0nHgkAx/SCSfpILFSUlF5/nHclT8x1Iviz4+MhM+O6s
	3ZzGlk0uzhUc1I7OgVsMFrN2weqxgHFRa9Q215flxKPQo/gFflrO3gjwt4cMUew8kM1sgNZN+knzD
	WXZcJBNywCOjf70pXwimIsehTUu4wtGRkdELWLA3Yg/zyEM8TYrT9rkskh3DgEyHvNDOh+pvB3jVx
	8K8jSB7Q==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZplY-0004dU-ES; Thu, 10 Jul 2025 13:48:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 132MHz
Date: Thu, 10 Jul 2025 13:48:37 +0200
Message-ID: <175214811246.1905791.3082982718132036980.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250615123922.661998-1-andyshrk@163.com>
References: <20250615123922.661998-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Jun 2025 20:39:05 +0800, Andy Yan wrote:
> Add PLL rate for 132 MHz to allow raydium-rm67200 panel with
> 1080x1920 resolution to run at 60 fps that driven by VPLL.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3568: Add PLL rate for 132MHz
      commit: 132b62280a9dbe38c627183ae7f1611de3ee0d9a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
