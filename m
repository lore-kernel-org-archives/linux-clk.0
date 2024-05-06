Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF215E1EE
	for <linux-clk@vger.kernel.org>; Mon,  6 May 2024 23:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715039634; cv=none; b=mStLP+ycHnVHuFBVlUCorBDDmLLHl4GAMyln+m9FCJK2M3NBOAXXHJvrAH/N814vUvbv2AMfwb2TQZHoakPEkAhJKBKgRzB+vnzYUYMS6yLUQ9Q9+ej0K9D0ySksQn30Y8ANbjIQ/iU08eRaPBHy3ovrzGdMZ+1aa59FaYNrt6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715039634; c=relaxed/simple;
	bh=oXNxRty5jBZYzk2LULzWX/+pxuJZEoNvf4lZmOqybxA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gAtMwughB2LJO220keKAvbFWelhrj+CtFcOuCmEMfgfP73wRZe8S4q5mePxnfFnpZRN4X2erd86Ww2FNZ3sAvXme2T2noRxBa3iJrqDFm0OpWxi3Wp7B8KZdrE/bAPSn35aUbI1xpReLu/G8oRyQV0g/38gGXX9Pa9kUz2+UAso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhw1vEvh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhw1vEvh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DA6C116B1;
	Mon,  6 May 2024 23:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715039633;
	bh=oXNxRty5jBZYzk2LULzWX/+pxuJZEoNvf4lZmOqybxA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jhw1vEvh+BvQO/yy06X2g9UnMrVv5Uh5jFN3zoO+e0eFfVVz0L2uJh6xfQlxpibgh
	 XeYyyIvNGz+XI3kRzpCGXyCQWsb6ZXTsTlRfL6+aK1kBsXGKaRoyMyoaO3lHSyipSc
	 qbs7cvamquXqMAKP5zg3fnjvS/H76J18zfwM1RsCQTHiTFefcB7i/ljpZTgL2K5nx5
	 gxWUqnsiMnTuM3sqh0LxIVZDB2P4s+yr7tQGdLpz5MTCCStFGI+5kHQgwv15YpXn6j
	 1N/3p4zxoWEZVMsv4FzawyppVryPEOwc2gOxzLricVKE0WnGXG/rfqLpaGKNAiy0Ig
	 CY6q3TLDmL45A==
Message-ID: <aed58a87f30bb5717d4a874b7e86bdc4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7502061.LvFx2qVVIh@phil>
References: <7502061.LvFx2qVVIh@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.10 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Mon, 06 May 2024 16:53:51 -0700
User-Agent: alot/0.10

Quoting Heiko Stuebner (2024-05-05 13:05:38)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip clock changes for 6.10
>=20
> Nothing really stands out, it's just some small changes.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.10-rockchip-clk1
>=20
> for you to fetch changes up to f513991b69885025995dcb4ca75d2ee7261e1273:
>=20
>   clk: rockchip: rk3568: Add PLL rate for 724 MHz (2024-05-04 12:38:13 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
