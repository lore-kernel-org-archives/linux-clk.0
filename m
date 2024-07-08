Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7541D69E
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720463848; cv=none; b=nU3xak612nLt+RNwN060tnsSB7RvPeArYJ3HTjefgoX8PVR/6pj8XQjheqWX4e5SVKyIoV0/uukvjaBxV9x78M0Toz3EH7mP46KtyS2/VaCLT/pwBjfQlFj5TYveUxxwNfAb5o4aKJBU+qc7RmY+b/uST0VOuXb9Zfc5EuEymqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720463848; c=relaxed/simple;
	bh=J9c9tO6yrHhrIS2lx9KzhXbGxf2R8uI8yEfQd2h2EzU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=jHDXVGg0MYdf3uznHGptJA96qmUJP/Cm38KSHOS4brof3wqWX0kkdTz3oj62Ji88qw2oMfDsbZsekNMvM2LUzXn7AwmpfEOTV1MF3D/NvlN3B9sX8gmxePTJijdr0buR8ZhucY3PaDfVjggeEu4viErpMBy1icy++63CZPTDUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOk3yiUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOk3yiUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62436C116B1;
	Mon,  8 Jul 2024 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720463848;
	bh=J9c9tO6yrHhrIS2lx9KzhXbGxf2R8uI8yEfQd2h2EzU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UOk3yiUFDwlSsRkG+i1xT3tbLXho4Zhc4b/HdwbSS8NXeJNOh0uBlQURY+ZspmlNo
	 TIUEi+0bPQwmymLrZJ0JO5u7xYh/7Ibh3lwhmB2t7ppn5rrkjnbmM1ShRdOZZBMKQz
	 ZcH4hAWAiWm1/TOejGxNxMrhzY/3CEAuJ5bXKlzA2aJ9Am6dTAYJM4eHgIH3xy3bv9
	 pc+SmIKriXmODbefcpv6PWIWpePBaRqkB2+MqI2X3jmRzRt8dvl74pvnr5kDCto/TJ
	 oR0o2uvGnX9tUHRyq+AZ5SfT7Xq/VVDErB3GqV7C+cuBR2szWy0Sg3hTwaXWh76vNF
	 izXk8yeqmmrMQ==
Message-ID: <556bb2b286c4fdbebc46360a714ebfc6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8961259.VV5PYv0bhD@diego>
References: <8961259.VV5PYv0bhD@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.11 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Mon, 08 Jul 2024 11:37:26 -0700
User-Agent: alot/0.10

Quoting Heiko Stuebner (2024-07-04 12:17:58)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip clock changes for 6.11
>=20
> Nothing really stands out, it's just some small changes.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.11-rockchip-clk1
>=20
> for you to fetch changes up to d89e8096957e35742c9922d3f6628f24de0d6163:
>=20
>   dt-bindings: clock: rk3188-cru-common: remove CLK_NR_CLKS (2024-07-04 1=
9:48:31 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
