Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862DC219FC
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059017; cv=none; b=k9kO0Z1VJws9wDTtP8Bjh+H9ZuF+9N776rD4m9i/UykoBwnJXOYLVUMTqyCNgzuAiAzkBtMxF75rEYOJdRCb6YN8UIZ1i5bi2+iT0dMoTMvefPgy1aec9TNZGFV6qC5q5NFiMc4/GcvJ0c5XLn9U5JePPwz3rlUO6SmZTG8ic9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059017; c=relaxed/simple;
	bh=TdgAPsYtLNa7eA628pR3ESYZjHWL0NOGyWyRNwblZKo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Q4vJexY+HvA144/R1O6kGGy+CKketEV1AtvZASa6dKZ1/D1Hm8kqGfZMe6BSdkIBCtufKRzmr44NvXqx6HIFIuHU7CI2OPflxdG+7iqKPD5/UYh3Vy+HFdZA5Jok5Et3ajGOhhrnYYODYUf5Nh2sI8QThmuxVlIeOAuVtxstx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SM4u3sfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SM4u3sfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEE2C116C6;
	Mon,  2 Feb 2026 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770059017;
	bh=TdgAPsYtLNa7eA628pR3ESYZjHWL0NOGyWyRNwblZKo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SM4u3sfJ5Uzsm9RwrrDVAIez7Dx5+HixkQYVl86zIAse7Yz81lDl5yUy+J1eQV4+s
	 ZEXLiTQGPoboagOWMH5nkYV+z/qZBTs+lEAL70+JaPaUYu80cTXPTJub/pdNoXh0aD
	 KIkc3SYbcjaV8uzybi13y8sve8vnGXPbaDNqlWZh1vMcBBtc5Dn3E4Ai/fSZwCWYAc
	 EsgQgoEyY8EASxzWQiXl/wGBoAjEwZTOF/DSZ+NBqeozVfYWXxW4SyuvmNcDVvzqhP
	 sfsvJTgf4GtFaN6n6VBWHfK+VCEBMWO+HLifTgb2gO1ENpnrCXklyQABUlrKDPQ9nb
	 +VI9fuzLnt63g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5742396.ejJDZkT8p0@diego>
References: <5742396.ejJDZkT8p0@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.20 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Mon, 02 Feb 2026 12:03:35 -0700
Message-ID: <177005901508.4027.9674604444759816459@lazor>
User-Agent: alot/0.11

Quoting Heiko Stuebner (2026-01-26 10:19:16)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with a Rockchip clock change for 6.20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v6.20-rockchip-clk-1
>=20
> for you to fetch changes up to a8d722f03923b1c6166d39482c6df8f017e185d9:
>=20
>   clk: rockchip: Fix error pointer check after rockchip_clk_register_gate=
_link() (2026-01-09 21:16:20 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
