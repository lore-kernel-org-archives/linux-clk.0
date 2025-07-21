Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635521421A;
	Mon, 21 Jul 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753118900; cv=none; b=H4gzgSwBx/I4L9V/8D//SDk1ITXgGg4Qb2r6X/UnsX4FOoOn6MqMseX08nOGFEFQZ2FXaMvk1wXmbVGuii6vlLkQxIiP7RXNU0zTJxrGehXB1sl4SeskOJc03eQsJlxCJOcAgInkzpXZWkH06UfMiyybKDQPsaFfv83Kvi0pQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753118900; c=relaxed/simple;
	bh=HRBRYF2/NyCb0Fsivpiz9bVx1nweWWT51S0yLpD6Sek=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=f4+ZjkFvi9wZig5MXwL8v3DXcEAsyC8UN3xr05WYlQJmAzZ9erNGm/Tw3/5gpXnxz7B1dUEhcqjVS7HrMfE98vMbexpkNV7H04Mndxxwrsj1pSB3eyUYQB+DvKcGsyQeFrilzeOSD0gWDOlk8sJdZgZ16tOJGfSwbjP+pefSuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHEnloKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHEnloKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EABC4CEED;
	Mon, 21 Jul 2025 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753118900;
	bh=HRBRYF2/NyCb0Fsivpiz9bVx1nweWWT51S0yLpD6Sek=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XHEnloKbOOka8/yBo8DlG9sc0haxuEAL4z2khqKhwv6WhCqTtScVklmZzu15YO5iE
	 1fqawpGazU/t8OUXp9z0Yw4uX8ahUu+Kl47XZEEgljnsaCVLXl1OVDutKgGfvuw6Bx
	 5YUunPuwPz3Uu6fzscEO/AhcXV2twgWgELwTGdTqbjVVlyztBom2ZOrZ12qrQmNB/N
	 dra3819WxJ1zD1C1vj6BQnMjc6ymXLuLUmkdy132SiWriaNhY3GGWcbPTQHZ5hcYbT
	 FVD6Rb2/dkQsCprZZEgUgjDaQTvEGf1aqlZk9vIIKXctc4Yoa6NNH2JVy1VgY/de8e
	 /yItfRIWtQXVQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aHaIfP2TJ_zkWv3G@wens.tw>
References: <aHaIfP2TJ_zkWv3G@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 21 Jul 2025 10:28:18 -0700
Message-ID: <175311889817.4111.10122993217327312049@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-07-15 09:57:32)
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.17
>=20
> for you to fetch changes up to 80395c3b47577c12121d4e408e7b9478f7f88d02:
>=20
>   clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate() (2=
025-07-14 11:56:18 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
