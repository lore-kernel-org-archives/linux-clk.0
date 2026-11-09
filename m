Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184845;
	b=yp7Y1mHzbxGaGEzoHBwkyipNCcDRT8Gy3Dx5IvRM1oPeBiz3s8A7hqKbAhLWUkoflCIm
	 T8ZnJ9esXNT7WVjwglAoaQRtm2jljnadTqomPa2EdeappA0Rg+v1nAv8xqElm97Ui+MEv
	 euQWxXXJzzfZLhS+UzaYT3eio9C3T04fZDLSeIVlubenW4odu1gDLqWqyGMzIvFLjTLod
	 IMmV5FZ295XK5gLsajToUdIKPf+8BhMYeWwqJGrVO/w4vdD5pB6e/EibNR1h8YhmqdFR2
	 oE+SHoeQaTmmQwwOkSCBdIf4cHieGreHQbJZgsUHzZlWAtHLLgLqIGoTb/IFm6wBOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184845;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x18zCSPWD+swobkfwTiUJYHP/xPQnMuTBQbpRIqs56U=;
	b=mXr9h57extN11id2XaTfCiRMW+ErE2BFPDASHXjrGMWWVXGKsvBS2vYogrmKEaE8MPaT
	 X9gL8jgtYylh/aHr/IKqPiMrmq8wVr6O0LG4oo7kr84DaVh6ein210GC9094uJIbH46Yt
	 pGCXOZoz0Hw6e/Djcj+kmq+LiH91GffgFV+V9ZufwBGhKZD+8yMG0HLk/EMtCw/hRelrz
	 errUNtRRXAcj7bOnYrT8dN+XGP5WxRnORnXmq9/s/VHD//cwVMk0oMxGg2fxwV71eV9+m
	 Ubc3hqHnO30T8vPR4slaPnOUvrK9Bz93do/5ycTlwCOekic07UmxD9vvloQAB5VVDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NK9vcBK6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29226606A31C;
	Mon,  9 Nov 2026 00:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NK9vcBK6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CF91F0089F;
	Mon,  9 Nov 2026 00:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184845;
	bh=x18zCSPWD+swobkfwTiUJYHP/xPQnMuTBQbpRIqs56U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NK9vcBK6bYTuT8/nz70OC1pet8qTKJZgxY9+6oLz6p1bCShxq+MTg+nEWhA+K7CiC
	 ihTplvOODqjG0goacyaadZgFFJZ0OrpxDJVCOuuC7Lc1bmf9UB0ieNPxzZptRh4K09
	 g/Cq02e9Fw0XC9uTx9DUFD9RE69jw3o4qICCWtyHVqXb2DZGGwMkFsKR5I1k7Dg4qu
	 gQLyWAGdyCW7mYFru+6x6Ik6oxGlBYyXP17gFAKgQisOdV1M429poQFHXkOim3Zt/s
	 4Hu6QxUFPGPjEv8tP2IQOoDEpIkiHeAA1bVYwJISryocRKYei7H7MjpsbdVb/BWhvA
	 Ac/1SL/thUgRw==
Message-ID: <sashiko-outbox-204235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: Add support for Global clock controller
 on Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-halliday-clk-v1-5-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-5-20c3ba8be0bd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:40:44 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: qcom: gcc-halliday: duplicate frequency table
  ftbl_gcc_qupv3_wrap1_s0_clk_src
--

commit 608509f5e5ce26bad8172d9da9b2a60d503d221a
Author: Stanislav Aleksandrov <lightofmysoul@gmail.com>

clk: qcom: Add support for Global clock controller on Halliday

This commit adds the Global Clock Controller (GCC) driver for the Qualcomm
Halliday SoC, including PLLs, RCGs, branch clocks, GDSCs, resets, and
QREF reference clocks.

> diff --git a/drivers/clk/qcom/gcc-halliday.c b/drivers/clk/qcom/gcc-halli=
day.c
> new file mode 100644
> index 0000000000000..77b078ac50467
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-halliday.c
[ ... ]
> +static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] =3D {
> +	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
> +	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
> +	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
> +	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
> +	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
> +	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
> +	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
> +	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
> +	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
> +	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
> +	F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
> +	{ }
> +};
[ ... ]
> +static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s0_clk_src[] =3D {
> +	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
> +	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
> +	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
> +	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
> +	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
> +	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
> +	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
> +	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
> +	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> +	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
> +	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
> +	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
> +	F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but ftbl_gcc_qupv3_wrap1_s0_clk_src is identical to
ftbl_gcc_qupv3_wrap0_s0_clk_src.  Can gcc_qupv3_wrap1_s0_clk_src and
gcc_qupv3_wrap1_s1_clk_src reuse ftbl_gcc_qupv3_wrap0_s0_clk_src, matching
how the other wrap1 RCGs reuse the wrap0 frequency tables?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-c=
lk-v1-0-20c3ba8be0bd@gmail.com?part=3D5
