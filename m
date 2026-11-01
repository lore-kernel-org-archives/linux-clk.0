Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571409;
	b=vkQ/Vo0+VmjxTPymLiNPQqhtzMQPXG78RvNHQfCZ5WHSoKlqq8VvS+aNp0KzoScZykLG
	 4/kly9EXroMsTgDecluFNfzoZDZT16YEINvaCZocRrrMWkk+FEmhKjsWvOQIGhuzhLPyv
	 gR993PzlgQv7oF4ovT/Z3I1faxnhglgaYNXfmGHqk7RPSn/IP+74qnODcBOaDQCXbo0rK
	 zA8sdjF42iHP/jggKH+QDeLjT6zRYDpcxJiWBfE/cafAzdjz5A5/3E/uiQEyPaE5oSlcs
	 YmlZHH6YALZlpheIxZ6M06zpBc23b4OS4phyT4IFIdKi9o9x0iE6JHEQeSnj+eF5Arw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571409;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S2s+4JdjjEeOFEP8ZWyRwRLvfKHbTdhwvT6E1sN0k7A=;
	b=lWvOZpqU5wDCUaYmU/BuMWVumW/w6NvAQ5s5d/4py8xaxM24zgRVZ1XT/LUTiX309Z9M
	 qyDfuhf5KmTo4m6oZC0EASkrGV4mUn7df4wNSmyMqY/MiqyBPIq3rMfvUMHBiFd/6uQet
	 d0vzDerHIpvaMP3C/HrAahP7qmBErd0nxbjKLs3mOt/wAPgBA1cqgFRgVKF0tMVKixEAz
	 yMC0VFx3mFM3/9tSX6+epzMJ0oD35aij3NGAHupMJO8+2RhnsjXxrttgpanpaQvDzrML1
	 UlkQZM1MGnXyXd3RGqdW+01DFKVK+qP3o9fC0VcoALPeGidUZEV/slDVCgNSvW1jhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JEDs5hS+;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41F60A3831
	for <linux-clk@vger.kernel.org>; Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D41F60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JEDs5hS+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=S2s+4JdjjEeOFEP8ZWyRwRLvfKHbTdhwvT6E1sN0k7A=; b=JEDs5hS+q4zd/+QR6XSdNL4HmD
	cLw/K8XDCmRr8aV/Ietrn5JN9+/Vewcr/gXthGsu6VDAOiB4Buhx1JWc+rhEXeWKCFp85G4aeO0sM
	xWKyJW7Ore2VfXk1mSmu9m5BQVJMnuSEU8MABcFoxMKqAsHKEJcHt1OUuiVfKTeMbU8j0qq2UyeiR
	ynNct0j1ajr6ZOKLRMzTM0n4KBoO6latcs2SbnDtj8BCNDJNu6KQEtsv+3bVH5VQiqtmfcZ0HUn/q
	vpz7EwtpqLJ599TE5T3RDyLzNxZKBka2bGbhYyvuiDGv5KOBi+NiUociceGYiZZHD6V+gKXEIErAh
	QHXKqIVA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] Two fixes for clk driver of RV1103B and RK3562
Date: Sun,  1 Nov 2026 23:16:36 +0100
Message-ID: <179357139332.4108484.2588788612920888710.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
References: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 Oct 2026 22:17:17 +0800, Shawn Lin wrote:
> They are basiclly copy-paste errors from the initial submissons.
> 
> 
> 
> Shawn Lin (2):
>   clk: rockchip: fix wrong gate register for clk_gpll_mux_to_ddr on
>     rk3562
>   clk: rockchip: fix wrong PMU CLKSEL register on rv1103b
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: fix wrong gate register for clk_gpll_mux_to_ddr on rk3562
      commit: d317c599db2f8649f6f14408f34788d9f78737b5
[2/2] clk: rockchip: fix wrong PMU CLKSEL register on rv1103b
      commit: e937f8ec9317dbee4669d323d955ec26cd8dbcef

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
