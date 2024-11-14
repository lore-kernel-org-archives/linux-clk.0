Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B411990C4
	for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624100; cv=none; b=HA7wjxPyjHfRAVY1usk5SXbVQe5zL0hZvAGwukyzNTO52oxFg9wz8s/wk48QcmrAv5eHWg/Fh5E2RpoothjC3BrYy9eFkEk+ux5Lvza8NFuc3LQ/CBpN2wHFTb/verfUexoFn5BRpbIjv2DeYpOqlVRkHgIcIUq0ke/SOLJpR0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624100; c=relaxed/simple;
	bh=vQzEBRctSFfejRp8W+MgBC0e6t2pdFAweBbGFmzpxJU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=vDfAPot8FpkXWIulmL7K93ayXWqe80D1256wxECxG0LUHjAv5O0W4lCYM1xCx25ikwhotOIu7KVJvfXhy41ZAG76le0rcb1hJxOfkQrk4YIUM3xs0KYUFnomzYTwY0BJ9sB2U6JrpGao/V/TlhYOduUnW9G/DIZdApXZsbMANi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLt4E0ZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLt4E0ZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8600CC4CECD;
	Thu, 14 Nov 2024 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731624099;
	bh=vQzEBRctSFfejRp8W+MgBC0e6t2pdFAweBbGFmzpxJU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kLt4E0ZDUrpuqpqUSBqWTTaLjAOxvvFhFu9lNSzYIpD31yLl6FMGWSVZiXBvzK1c6
	 ue5TXf7Gg3C0GfxD/lO9J3VUzEzQhap5bUDlX6GzOu+3xa7c9+jZ/H9uMUQ7rBTI3V
	 uBpWpBYLlEDcaEknRzjRRibxu/3vG0NyIlJH08UfCU0CbskTJ7xk4E51gxmKb3CF6b
	 BxQGSWk0Slvk3eZzTLyVT66enZZy3OAB/91TLJPGIB2zyI3S9kO7A5Y6aroCoeum4P
	 2PDHIWARKUlw12abYLfMKffYahuk/oz070V7immI6e9/Gzr35lkbGirankaXNXSVkr
	 W6C/4i4gRIotA==
Message-ID: <9168a704a7a09445fdc1d159511b25c3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3061836.mvXUDI8C0e@phil>
References: <3061836.mvXUDI8C0e@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.13 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Thu, 14 Nov 2024 14:41:37 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Heiko Stuebner (2024-11-14 14:38:35)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with one Rockchip clock change for 6.13
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.13-rockchip-clk1
>=20
> for you to fetch changes up to 5011cc7ad9aeea98029385f8a0e81a0ebfc45bed:
>=20
>   dt-bindings: clock: convert rockchip,rk3328-cru.txt to YAML (2024-10-08=
 21:11:29 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
