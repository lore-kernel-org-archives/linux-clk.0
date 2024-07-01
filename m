Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB25916FF47;
	Mon,  1 Jul 2024 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865506; cv=none; b=b50sEpPv2mDDgbp6/2wN8eQFRjk7hUhiftrFG8w2IdS6efLacZjDamZbDIf5+Lwg/19pW0YMmeB3z/YtXqJgXH0Ts1S374bpVLuc7phN4+d6yaZV/Jkn1MGNNPb+6gwKUepbQqZx9x3tZWyuPX8oSKeVQLqpbHKtElx6wfkWo0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865506; c=relaxed/simple;
	bh=6YtYYht39tEACUCXWZi+0yf/GOTTkHqOKqMiZxb4zhk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=WAXF99RQ+PEqgokPFMUrPL+BxMASI6UuaSYpGHa9Mqu1Itj+DIylaNuyk8i/+tsRQl0xw8x0eeEhcWfUT/HQ54f535RtQlIxpwka0Te99n2gdV/kGsD183Zwy6xZFvKOrgMYhIbTWZROX9u03FLDd9nzcQjl8t3+PCw90qovrMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKe1GziL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKe1GziL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F46EC116B1;
	Mon,  1 Jul 2024 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719865506;
	bh=6YtYYht39tEACUCXWZi+0yf/GOTTkHqOKqMiZxb4zhk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UKe1GziLjtR0vW+L/lEPW9VoYH95mzZS1foBbDqIzGFFfJVDyUTTp+TeN4nTPPQZY
	 Zu3smfaKLuIVO6nUKQkPlh/+iarvZpOcujTC040ODzyRbj9W0HBo2LoVdd3JhyWZLp
	 LtfKaQJR1kDw4eCY7+1zve8lt1pGlGxFYJz/a9yU2dc3Ooq3Oi2qGJ4GFvV0jUnf3O
	 z5gTb9fgwhCLgu/Y9qME+iRumny+y7qcLLCSYgjMuegIB8KSuIPhKCin6R0GFHy4ho
	 XK8VlcpZTaTCLkQjfGok9H1otCOr1LUXEQG1MH4v1dyK4jYZTXGuTy3UzVVeDoqCjI
	 O97YVGftBXebQ==
Message-ID: <559ea2104181196c9b5f8869662e1b3b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZoLswiclc8k4DHi-@wens.tw>
References: <ZoLswiclc8k4DHi-@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 01 Jul 2024 13:25:04 -0700
User-Agent: alot/0.10

Quoting Chen-Yu Tsai (2024-07-01 10:52:02)
> Hi Stephen,
>=20
> Here are the changes for 6.11 for the Allwinner SoCs.
>=20
> As the tag message mentions, there is one commit that is shared between
> the clk branch and the soc branch.
>=20
>=20
> Please pull.
>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.11
>=20
> for you to fetch changes up to 002cf0dfa201e44685e3b96ae06b8de258b8b2c2:
>=20
>   clk: sunxi-ng: h616: Add clock/reset for GPADC (2024-06-22 20:09:20 +08=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
