Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB4371;
	Sun, 17 Dec 2023 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXEGErVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4222C433C8;
	Sun, 17 Dec 2023 00:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702773078;
	bh=fYsAQBGx66BYi1w7HOxaZtms58mW1adlTTXy4g9VgLU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KXEGErVzdkIbbCmWYxKVsbY2x/f1YOFyCSZMy0dJxYlVuw6WNqYXekQlp9+4kIVb0
	 QjCRl0tTw5S70DzoCuWe5evE1HPcMg1XQgDqCUqTstuQ+qN2J063ChendqVltyGoJZ
	 n0Rz6/KMVl/9EowpjEe9RvpybhYIfGOKEHpXAi1fX3YiRy6oSIKAQwKgaL6fUCM7WS
	 MXqxeMe+ZrSQFef0CfwG3BOaXaXUdsqvNOcwWMmpcKXqV06d0qkITQqez0RYG5HwQQ
	 PNivNhzzk8pY6PGeiMsdwxVL0xKcvpN+IN9aOCSrvg8YzoEmUZProlEMLhVRJ1hyAk
	 fbiH2d2VqA2zA==
Message-ID: <931927373c0b43ac6484af146494ea61.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZXtVtZt30bBU77m6@archlinux>
References: <ZXtVtZt30bBU77m6@archlinux>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.8
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Sat, 16 Dec 2023 16:31:16 -0800
User-Agent: alot/0.10

Quoting Jernej Skrabec (2023-12-14 11:21:25)
> Hi!
>=20
> Please pull following clock changes for 6.8.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.8-1
>=20
> for you to fetch changes up to 89e00444cb894a42c33ba88738eaae788b05b924:
>=20
>   clk: sunxi-ng: nkm: remove redundant initialization of tmp_parent (2023=
-11-18 23:20:34 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
