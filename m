Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A9372
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 00:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753143679; cv=none; b=ZZkgW6d9EWzG66M92x6x2aPs+t2dJmlgMoPTZ/jkimpZlw39A+oUflvSpSXpwGwrSE8F8lKHSPHE+f/Jq84j1Bnijj4wyWCvDzAwKLcXWzQ7RIDKnlhXqTougdLjLU6v4Pa5qVm5inqtVk22hxX6RUDQX3NC7JQMqAcZSwO0nB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753143679; c=relaxed/simple;
	bh=+mLBhEzMvbH2b1qWZhdNH+Bt/zTqoN/FLVEOzmv3fNU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rcu3kFfmL1p7r8NIe88Fc13fut25iQBanxmQCZrvGknYk+vvuyjn/hWIucYOBoLU9azwPoEFUft5ZWIZyuxUQTfG/mvA9gClzKs8nq3+I78WqlAl36f8UZ6qmv6X3CBxaU5XDVeAaGHNpL7NBMXANng18qTZf/8RmK9sce9HepQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Plz27BxP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Plz27BxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26608C4CEED;
	Tue, 22 Jul 2025 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753143678;
	bh=+mLBhEzMvbH2b1qWZhdNH+Bt/zTqoN/FLVEOzmv3fNU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Plz27BxPZAQSqAldMb9xeV2pAdre2DclZ4pxgO36K8er0p709pdfTjsLnm+r3NTVG
	 h3CUKBgdgslf8BZnuG3in1ViZCndznX8B7sWnElh7I0gd++c61LMMX+SBfuTCDOgo6
	 53sdGHEOYNreS+bmQiNm6e89yMTGGkXKu+Z2tZnD3hHf9WrpyZGJRUFRYJq7iN20jd
	 wlk8YfoEjYbE5bQc2LuGHxizVn+pbZACJjHZxIsyURdjWkxL0DeO4RRcpwgYCjnO8t
	 eWnDAnRYBD47TeDupbqFgtt7F6R3j8GKugyXvRn+pFDmjQiEAhXQW9Tbh+QIhgYIWf
	 aFAFeS6A/xgiA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6515302.QJadu78ljV@phil>
References: <6515302.QJadu78ljV@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.17 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Mon, 21 Jul 2025 17:21:12 -0700
Message-ID: <175314367207.3513.432381120008342441@lazor>
User-Agent: alot/0.11

Quoting Heiko Stuebner (2025-07-18 14:08:17)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.17
> Just a single new PLL rate for rk3588 this time.
>=20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.17-rockchip-clk1
>=20
> for you to fetch changes up to 132b62280a9dbe38c627183ae7f1611de3ee0d9a:
>=20
>   clk: rockchip: rk3568: Add PLL rate for 132MHz (2025-07-10 13:47:36 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
