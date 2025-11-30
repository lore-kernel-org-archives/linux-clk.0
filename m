Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865B28000B
	for <linux-clk@vger.kernel.org>; Sun, 30 Nov 2025 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764531722; cv=none; b=jkdkSMGWUM+wDvmmkW+MxO6XcINz0rSXuaiZ0luDc7c9y7SK2HaRNlPLI2fh5vdH/a/0utAHocTmsgle14nQejYXOPVKuT/wpkbmbdSL7GW7JM3943wLDDIVFYblkSrMc4JKBR1Vsuzl4EBihBYatiqtcV4h8ozlV4tMKf2brwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764531722; c=relaxed/simple;
	bh=uBoEGOPuR2UlaK9Xo/sPUaqui0n4YWeVvB6Znq0uSbs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qFRzrUcDLH8GcZXU8/Rgl6dpHYSyjLfAeUGxuhB1ekwpKPXjBl6nqSJrzrsdWwlqBpPUHyemKY4KhW5CdXISpGb0gMgG6tmtLwzhZoMk4ej5uZJY+HtjwU6xMdLaMh/7hXZ614F3J6Q+2f4CxwpS8wtJB1KNLXQPCiewz0kEvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQW/gzUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQW/gzUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84D9C4CEF8;
	Sun, 30 Nov 2025 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764531721;
	bh=uBoEGOPuR2UlaK9Xo/sPUaqui0n4YWeVvB6Znq0uSbs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oQW/gzUbLJkoQRZSA4GdjBLMhqnVZCiTNbTM2Zhf2x/pLDPLFoaIf3Em59kQV8Wvb
	 czhYiiSTpx2ZUoSM8sLMIHweZhSlMyKr+qn69jnQ7tCcMrBYOh6qqXreO05e9A4dpm
	 uQIukyp/NGLhFfWgCqcDeh5gNFtt9Zjp2hoKMjncq0hUCI3zuCArOWkJ+whMexI8SM
	 89QxR63/KcxWB8KNFp6yOFhNkMX358OjYaKGdAj8ie6VD9Nia+YGMDiCYzpCuq9r4d
	 jU968VK/Gvqvl+slYsWUbrMUlnfcQ6HLtcns6JrEY1rNs4PYwR/aJpi3GP+m9rWwwX
	 VJER/igrkH17A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3018362.e9J7NaK4W3@diego>
References: <3018362.e9J7NaK4W3@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.19 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Sun, 30 Nov 2025 11:41:59 -0800
Message-ID: <176453171913.11952.17955530818254096640@lazor>
User-Agent: alot/0.11

Quoting Heiko Stuebner (2025-11-24 13:57:09)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.19
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.19-rockchip-clk1
>=20
> for you to fetch changes up to 18191dd750e6c9e17fabefd09ff418dd587bcdb9:
>=20
>   clk: rockchip: Add clock and reset driver for RK3506 (2025-11-23 22:56:=
49 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
