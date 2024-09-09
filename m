Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E593178CC8
	for <linux-clk@vger.kernel.org>; Mon,  9 Sep 2024 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725915876; cv=none; b=pSspmEpzC8khNAPFjN5VBVvxa2GqQVRL98NA8aSx1Nr98tmqRBAQC3+WEEEBcCKV9SBxsjY8qfO/O7O6HWFnZZ8Ahc6YKoqnjT42bHDWLMucUH0v8m6IVcoog5z3H6kJ29lkCj1wKrho4za4MZwxh11+k1kTtVFRzwBr5VqL1Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725915876; c=relaxed/simple;
	bh=M7m3GH+gOlIpfjY+G+PXI+B0/CNE0K6PT4myOc9uHKk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UL7x0rB6jyvBeSoii5gcRTJaTMHyXfdxUp3kAcPUpTr2avb0k78j876uHgV3kg2AWCcB/RKyXzlQ0qEPSI5xse+ozOQlb53nZIUdzShStYmue7M6m6A/S4zD8KTSnr1sCoGs3DGLF3U1ROFc02u2J3e8fLa8h4H4bVegzUzVORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RApUS1vl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RApUS1vl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5937C4CEC5;
	Mon,  9 Sep 2024 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915875;
	bh=M7m3GH+gOlIpfjY+G+PXI+B0/CNE0K6PT4myOc9uHKk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RApUS1vlkxvSjLqP2ylVqWgJ1e6QwPvQY3QF+9b4HEbsz8s3/5qDzPDIuT5snyNgI
	 FjrhYyq8HvxdZaKaMdstdHlp5lmpTvnO2fU7R6hvT6OlqlGaKDSlk8fiT0QqLqnIcy
	 ni+1OmwTQNxb1YddvE8w0AZ/ANelht5fTLrvPOgEY3MJD89Mwfpo6HotSepdNM/mNx
	 EzS8euz2KdsHQlm0y7OIqOHw0FsyncC9fyvZ2yxP1Vy0mrV83bQwUcReLwfwWMWo/k
	 NUu/7NOqZXXRYwfu8q3sD2kD1VwwamZtuA/AHhWLBgolFoFf9KFP0Ji3TbmkkSmCrI
	 ZamQcgAy6ZJAg==
Message-ID: <9f354ca3eff2c20e98b84bf2590eb586.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2436757.DCRlREXTYf@diego>
References: <2436757.DCRlREXTYf@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.12 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Mon, 09 Sep 2024 14:04:33 -0700
User-Agent: alot/0.10

Quoting Heiko Stuebner (2024-09-08 14:51:56)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip clock changes for 6.12
>=20
> Please pull.
>=20

In patch 'dt-bindings: clock, reset: Add support for rk3576' (49c04453db81)

WARNING: Block comments should align the * on each line
#100: FILE: include/dt-bindings/clock/rockchip,rk3576-cru.h:3:
+/*
+* Copyright (c) 2023 Rockchip Electronics Co. Ltd.

WARNING: Block comments should align the * on each line
#698: FILE: include/dt-bindings/reset/rockchip,rk3576-cru.h:3:
+/*
+* Copyright (c) 2023 Rockchip Electronics Co. Ltd.

total: 0 errors, 3 warnings, 1212 lines checked

In file included from drivers/clk/rockchip/clk-rk3576.c:14:
drivers/clk/rockchip/clk-rk3576.c:334:7: error: 'mclk_pdm0_p' defined but n=
ot used [-Werror=3Dunused-const-variable=3D]
  334 | PNAME(mclk_pdm0_p)                      =3D { "mclk_pdm0_src_top", =
"xin24m" };
      |       ^~~~~~~~~~~
drivers/clk/rockchip/clk.h:564:43: note: in definition of macro 'PNAME'
  564 | #define PNAME(x) static const char *const x[] __initconst
      |                                           ^
drivers/clk/rockchip/clk-rk3576.c:333:7: error: 'pdm0_p' defined but not us=
ed [-Werror=3Dunused-const-variable=3D]
  333 | PNAME(pdm0_p)                           =3D { "clk_pdm0_src_top", "=
xin24m" };
      |       ^~~~~~

Please fix these.
