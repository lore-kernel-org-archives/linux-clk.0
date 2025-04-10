Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47F70830
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296764; cv=none; b=L9HuFTwGkmihD2hxsXdiUpWAYko2oS+qp83JdEiPzm/Q76VgC8LfT95KAI+Trtv+b25skmMdHGQHI3YEmR6ucoGqY1PzfHi7yvZnyETSK3e3123kv+N5BaUSHU/7kBa3o/aGjT4YHQ1UKOW/cMra3saFdwsZrAT3lPWjGMVXKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296764; c=relaxed/simple;
	bh=E+sFEQ2GFyHsSBu8Wjg6EXPOUAxy37gIgKf8Smnquo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bHai+ZbFMjXF0Gs6VyjGueQML6YzQe2J3nay4l7ia0Pa32U7XpxKwUcKwlkLXXGmGbrIkLR4wF/8B1efcnVYyaU0Ylf8ZW37BiFGu6fwZenLuBjm/Y8CRMPl3Qw0ypKUOsbGUyPqJ2RR4tGX8fB3aeLRewLgoB7xbyH3M2EeI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YibUoEhg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YibUoEhg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lRK33yxtCQeIXgKhMQvdIbclAkIuzgypZhMp7g390Uw=; b=YibUoEhgpViGaO5kLSUA2hI+qt
	lwZcCAx30NFrvfuEDX8BB7arkuzhSJANxerUdUe4EjYEByMf/6ROv6Th1Mwfd+2XcsloD9zhC0OGy
	0ktMaZQ+X0LvMVC3TvsTlmCgCTLqudqX1kGpdBUYhx4ZrUWO6jnOKwGlQqfCBTZ4E6oIOyyB2PUzX
	NOJHkhlFPCX7wa5H3VBhbNXfrsByKzjhqj+JDyA8iOCXXWZctJ9paM3yghFoEKIclzljMlX33q6Rv
	9eJgSBOqM4UVzWGiQgffZk++qDuqsU1ZQfZ1zgN6w8P7APKvTrWEbq6vfy+JI2zfMaWV265jynPsf
	qfPB7rIg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGh-00012N-LF; Thu, 10 Apr 2025 16:52:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
Date: Thu, 10 Apr 2025 16:52:25 +0200
Message-ID: <174429674410.910874.4317858718877059208.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408064612.41359-1-eagle.alexander923@gmail.com>
References: <20250408064612.41359-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 09:46:12 +0300, Alexander Shiyan wrote:
> At least one RK3588 clock (CPLL) uses 1.5 GHz, so let's add
> that frequency to the PLL table.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
      commit: 831a8ac72264426ccd0ee5d2b0d74491ea7d2bfb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
