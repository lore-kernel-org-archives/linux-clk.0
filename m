Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE48236430;
	Fri, 25 Jul 2025 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753411005; cv=none; b=eDb+UPjoBraYyalrntqdqhpAf/F55/oWIbSOYdSPkjZ9YKbuawag2w+iVyfLJf5jqqqNRuFm5Z+Nviw1AFQIOB8Gk0Ou4Ex7sh/Sr30sb83yIBc6hybAAONq8lu4jMIiAeYkst//seHymP2rygXTdkxjdUURWSNP2jE+kA0aXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753411005; c=relaxed/simple;
	bh=NcQNLpCapTocLDEkrklXTk9xmH7O0wOVOHF2U8L23PQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iwjhdc/DwUUN7i9rffiF1pYhlNw2eQxennKhhKMrIiEGJF6bWv/P68TAWgEyFWD4Eoqfm0YGTR2zgdz7RWn4lB1uxcfmECxJLtb2CUCMi0Km87oQhuOnieY5pyp2yo0UdtOKEkSidL9QXM6TcUNuUYqdLLobYjVxlQzAjwOqUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsSbZw0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsSbZw0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92400C4CEED;
	Fri, 25 Jul 2025 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411005;
	bh=NcQNLpCapTocLDEkrklXTk9xmH7O0wOVOHF2U8L23PQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MsSbZw0WrGmeLdlsR73muQEXhDwRkjqEVCYIXt06wTyB0IiBfncY5gV2qvFT7Kdpv
	 PRo28nQZoPh1lepd5VteAn3PhMI8Ovk9NtahLcTtPRoBxbvaOQyoTJQmHdaz++Yz1a
	 krKXqy9dqbxRRb5ipx/Tmdk/6LBoMuOKs2x8sLK6NagJQsGN2xWFZ/XxTFyIbj8fbj
	 5zB5Kz7zfvD2j7aiTWarUMa4taUepCMVQ1nySoHBUOLLXeHywZFt+XHQ1o4xEz+Zy1
	 r+1LkJygl18AKwJrnQLrS4NTw2cC8zDtKUhde7vJSHwWPOQ9mhnw5jR0E41X0zyBH9
	 6fkGqtUx3nkyg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
From: Stephen Boyd <sboyd@kernel.org>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, dlan@gentoo.org
Date: Thu, 24 Jul 2025 19:36:44 -0700
Message-ID: <175341100482.3513.10826909212334043021@lazor>
User-Agent: alot/0.11

Quoting Hendrik Hamerlinck (2025-07-23 06:25:04)
> The function spacemit_ccu_reset_register() allocates memory for an
> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
> these resources, resulting in leaks.
>=20
> Fix this by using the appropriate error handling path.
>=20
> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---

Applied to clk-next
