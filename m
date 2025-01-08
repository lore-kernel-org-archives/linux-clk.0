Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB4198A06;
	Wed,  8 Jan 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736366489; cv=none; b=RXLX8zdz1txFWvxZzys2q4DAiG1BnuO/5Xp7ie2GMa+qTd8wjXCfzFikW0i1YGvNK4gRhSlC9oysKrPptNQWqTA/4o8dfJ9uQChnWTmO66xP2Xt5NxMHvLwyI+dJupD3K84gSqQhP3dHe3z5cdEv8s1rywge+JRYrnUFyMFeH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736366489; c=relaxed/simple;
	bh=6ywCQppCWtOwtFwfArEz2OP+esU3BIUhDuQ7BW9UrcI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Etz63TnikduLNlHqzdYZvuCXd5tyu8RDF99veTQLoELDpfMtOCR9bfV8ZPf9zgnFKLB0/ss19HzLSCFug40P9Jr1gr4vnBaqGmWn0RP8wsXdmfqVNBxBSWLKiT+QLwqjSivAHtYasuvb0/GrZ6ZU0MGhdegjX6QoSqe7qhm0okM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDUIU8u0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDUIU8u0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792C1C4CED3;
	Wed,  8 Jan 2025 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736366486;
	bh=6ywCQppCWtOwtFwfArEz2OP+esU3BIUhDuQ7BW9UrcI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NDUIU8u05SwENZ9i3amyDYGz0jHrYf6HFIm4izpxm8feSfXtbQmIcPmPlUqznHQJL
	 PLoG6iIZ2gOoUhnNjjZydZO5kaxRQ+jx0UZEepMiGTO6iJXmxF6idD+nQtvnunIL9A
	 +UvhA9pwkIAvK6UOb3grRHOgXSG3WvZhjLVzLP0zLQrJUvSVbFuGBRbVI6nJ6UFgLN
	 VW6KIC5qOekVfLDjhiyvWOuxj+0jMCFZN3ultcIMy4A8Q2O0Zn+UO2DqWRtqnu0LAB
	 WbRBMZdVSxVlAxcKGzNHIzRjCdKugBJq/uPZ4wfo5pg1h3GUAV0fqwaGXITOWOCvUp
	 OGNz7MM2+kwiQ==
Message-ID: <762c4c506463f368a0c5d64650d4fac7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z36iMwdeyq6DdKOw@wens.tw>
References: <Z36iMwdeyq6DdKOw@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 08 Jan 2025 12:01:23 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Chen-Yu Tsai (2025-01-08 08:05:07)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.14
>=20
> for you to fetch changes up to 383ca7bee8a93be9ff5a072936981c2710d2856b:
>=20
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent (2025=
-01-04 20:17:11 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
