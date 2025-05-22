Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BE26FA6E
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952437; cv=none; b=uUUVLQY/G30fW2xZ5gAHE4bSNvs2vKdzc2CvLsqbYRviSahzlbEcxS4TyGwhv1k2LGbm9kk3y0BsBLxQ403LUHyzgPeHqE2pe6D/V2H4Al40m6D/USkpQy0lIx8D1FJDC0gw/P7JmWGGLi08Sgs7mK758RuPfEn/9he29B2BtD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952437; c=relaxed/simple;
	bh=23AJ1U1UdFDOx/kboSmvTs8LJQ6CAaLHpSBbT4THA+0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=n1hG4aQ+7kN6wnfJaQcI4bySqS5bWMdOviy+VebeAUo+XAQHjqpBzRnzzVcQhVGAPi1eZyl8qlmjYj0VLFe0BAA3bleviG4/0EkfQiFDfZfHEC0KH9MEXtC9JdYyLjizyejGifJ3nUW5oaDw+740zJ7NisBJOQwnRTiKwuJrADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igtF0jxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igtF0jxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3644C4CEE4;
	Thu, 22 May 2025 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952437;
	bh=23AJ1U1UdFDOx/kboSmvTs8LJQ6CAaLHpSBbT4THA+0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=igtF0jxs4xsi7YZl22+L/vMwX2NMaHKIMZ4QjdVaDor+OkjZ8YnZzGiCWwxBHDHVo
	 3QDsGfO/bDVCo1E13NI68gpkGBTCVS2vBjIRu6tTRNPxGTOHfMb07sUXQeur4Vj1Gu
	 Z10aZ0MgxqmNjuewsMzNjpcrtJ65/w0sZ30xodxEGuKIaesaTs+c3GkwkLZVAxPwUt
	 DenztlTWXnCQ90aGNJM+I1S5TeqfuqJXdOwrGIwu8BssglgTpDMgXZ0cJ/YQJm8RW0
	 91KRgFKtgcWV3w+YPbyxlrpeKobRDhtGoScz38SjF6JqjDyoELUfN0wMuGsfQpsDO5
	 s4iAujdki9FvA==
Message-ID: <3fb9315bf068af36e3a1376ba89cfe82@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250507013030.217818-1-dinguyen@kernel.org>
References: <20250507013030.217818-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] clk: socfpga: update for v6.16, version 2
From: Stephen Boyd <sboyd@kernel.org>
Cc: dinguyen@kernel.org, mturquette@baylibre.com
To: Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date: Thu, 22 May 2025 15:20:35 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Dinh Nguyen (2025-05-06 18:30:30)
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/s=
ocfpga_clk_updates_for_6.16_v2
>=20
> for you to fetch changes up to 0248bfb2557932b27d3e1375a3dc6902127b42bc:
>=20
>   clk: socfpga: stratix10: Optimize local variables (2025-04-24 17:38:07 =
-0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
