Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA00469D;
	Sun, 18 May 2025 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747540410; cv=none; b=tA3adaPXHMy8+sSIHO0uOwai3MWx4f+TTk88O8VJ5DukTgZF7SAXa9EFBAEkLBm17MqH8ts8sAxn40smPhylue96qq9qmLNsEc6XOgN4rSdG0W8nBPXFQWaPHCPRhskBKPgSK0hqrfEVhusC2vEw5NcBS+0NZKjYTUeetJfkce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747540410; c=relaxed/simple;
	bh=tuMaOoNtIHKV2aaM1zkh1QtkTJEjsaNHk1Ie+Q3ajWY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=G6h15cusYEdhze8iHn8EaTtYj+n3eYm1GcP5RwCUBnCjVQIWQU6A6dAHsn529q5GannsOW4Nv+les0JR+smJc1U2ExY3oWmVy8SBEnwAf7qYWKF9dK4zNKkduJDt61dMqsNp+AXqR+TIKeKA8Vra9t4jk8b0bICv1G6hCRUDFG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX482lJ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX482lJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701D5C4CEE7;
	Sun, 18 May 2025 03:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747540409;
	bh=tuMaOoNtIHKV2aaM1zkh1QtkTJEjsaNHk1Ie+Q3ajWY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lX482lJ0XYwV1eqq9evloIAMuZ0h4VyD0uWVVz/7OGDu8B3jBODa2eS4iWnJs1f9s
	 btND1n7QMLbzW47kF4ezSPtpYaD/tZLDexLyLL0GxqRqrxrKZV0qsgqDmI/jsJUWld
	 KooxqBNXzmbl/j4BldVZUXLs91cWpTbQyJORdyuTPVttRXI+h5oWIfaM1asm/EuY8V
	 CqNcJl9KLqjjTN6MdIB7HwiAEr+AabnWepm3xy36bvWyFZU3+D4Pg5xv2g+5joc5kI
	 ULHHL8pUW0UuO1QEZcXqFwkZpZ0L9zsKsZtTRjZEc60Ly4an8UU5cvUMKXbDNbYtrW
	 HIw78SRkfr6qg==
Message-ID: <ceaf3ca397d8f2fcbe0ad992636172f7@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aCaek3S9Mf0g48Ze@wens.tw>
References: <aCaek3S9Mf0g48Ze@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 17 May 2025 20:53:27 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Chen-Yu Tsai (2025-05-15 19:10:27)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.15
>=20
> for you to fetch changes up to 98e6da673cc6dd46ca9a599802bd2c8f83606710:
>=20
>   clk: sunxi-ng: d1: Add missing divider for MMC mod clocks (2025-05-14 0=
0:40:13 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
