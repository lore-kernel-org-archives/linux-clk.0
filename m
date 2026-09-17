Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AC2EA15C;
	Thu, 17 Sep 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647656; cv=none; b=COnc2prSoyRJYFTlK6nDKKEjk/iJqXvh8nN9tYpyWsZr3xQr0XNg4whiAHbY52fuWwH/JwzOzqLZl89ApEOYz3CQ34p7bIgxb0lE89J+CvJpwDGb7ycojhC9XH0fPfXu0wba6S2sTSRZREbetxKFXazGCJ0o3DKWlp1o7z0ceKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647656; c=relaxed/simple;
	bh=HTs1Ltxxpoubxx93SVWaXFYXNJYsNMQz13NnRDCz9qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ep2iKWeW/a7OLAh3kLVfZXRtsjRZ4v+23swn1e2kgebpoxnTvJHhZsPO9+xTf/NjqNwqYz25rBK1/yPetjE8evD2zhOclunLZhvFyWjXEigIoG/SMM1nm4M5+Tprq6SRqeOJ16f1q2A6RiAlEjtmvQ/J/2CEfOhTeAk0Xo79NC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvNmdrPw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvNmdrPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305591F000FF;
	Thu, 17 Sep 2026 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789647632;
	bh=n3+IMej8FKw+H7EY6KDO0qhxO3eul7RlOk5+A+sLSIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvNmdrPwj1ndlHUZlEopWdAPJIbvcjJ44jgaw3qDbifY52Cu2pB1V6TuWcwVDmmRH
	 o3qxysDOCrbgBuAbgB3bNi8jHYvVYMaTlDeT+a+uWYr/etsgs0EqJMT8GZyemUQXy/
	 rvm6xtDmY/2QEX886zmK1tychpP8LQicN46I2p0EsDyb2E4uDpSDYoLQCWjRGI0/f9
	 Uc/pMNp/6LPmpfhWzsTFQt5RjBSG2Ya4g8mI5oYb9KDQZKZP4MAQEKW1XOSFtjXi2w
	 RpmtVM4YImH9D0sPuN4aFIrQNN9LhzmsU6kFMEzLMYchoRcbGoR5xciaZVYuS9DO/Z
	 fyTehHruL68hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and
 VSP for SCP FW SDKv4.36
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com>
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:20:31 +0000
Message-Id: <20260917122032.305591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: renesas: cpg: SDKv4.36 clocks applied to SDKv4.31 firmware =
map
--

commit b14958e73ed5111dda065cb1076a7ab55add431c
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36

This commit adds fixed clocks for FCPV and VSP components. It explicitly
targets the SCP firmware version SDKv4.36, adding the 266MHz variants of
the clocks to the static mappings.

> diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a=
78000-cpg.c
> index b820d09e1a195..17792ff6ab8ae 100644
> --- a/drivers/clk/renesas/r8a78000-cpg.c
> +++ b/drivers/clk/renesas/r8a78000-cpg.c
> @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0=
[] =3D {
>  	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
>  	{ R8A78000_CPG_S0D4_PERE_MAIN,		FIXED_CLK(200M) },
>  	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
> +	{ R8A78000_CPG_SGD4_VIO_DP_TX,		FIXED_CLK(266M)},
> +	{ R8A78000_CPG_SGD4_VIO_DP_OTHER,	FIXED_CLK(266M)},

[Severity: Medium]
Does this accidentally leak SDKv4.36 clocks to older firmware versions?

The commit message explicitly targets SDKv4.36, but r8a78000_cpg_fw_4_31_0
is shared by older firmware versions in r8a78000_cpg_fw_map:

drivers/clk/renesas/r8a78000-cpg.c:
	{ 0x010d0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.31.0 */
	{ 0x010e0000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.32.0 */
	{ 0x01100000, r8a78000_cpg_fw_4_31_0 },	/* SCP FW SDKv4.36.0 */

Modifying the shared array applies the new clocks to versions 4.31.0 and 4.=
32.0
as well.

Should a new dedicated map be introduced for SDKv4.36.0 instead?

>  	{ -1 }
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-epaul-v7-3=
-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com?part=3D2
