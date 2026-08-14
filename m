Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC741B8F3;
	Fri, 14 Aug 2026 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693945; cv=none; b=baM24zlzI38QlgU3hDiwbLhYsNYa/AGIuKMkf48mU7Q5scgNo5uSqQvikyZ6cH5kX+AJ4/2zC7kJvMUcIazJaqyABQCkoRnyj3ZLjaki/4c1HSTP0VO0riiNKt/818NaM7gv8BKAJ9SHtxevOoqB5ivt8kSZDgOcslnYP79ZqgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693945; c=relaxed/simple;
	bh=LE+B7Jrp5ePC9k8fWWtGvF4EzmbRhjmDydb4Fep8quI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QnlJUfGTzQWoKXRzsIRnhzfE8HkESc3zzCfbSyO+6A0hJ5WUGJTtfgP/dkgfVGH6/Jzpy7PZ/9MJC6Q2+CvyB/sfhnuZNbi0gKwp7rlpW+p0Ukvsn7IzhrUZXR8PnmuIgh1Nj+SOeCK59ODUTP5zfzWocnBcqFA23JaleRSDJeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwcOG0To; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwcOG0To"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A791F000E9;
	Fri, 14 Aug 2026 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693944;
	bh=FU5kdP41IyhFjJjb+aNltPhxMpdpe+6W9q7vnnAYt+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dwcOG0ToEE7Ub2uO/AaskVwIgG2fTZp13Cxmxl2vyEdvHDo40mUp6YbcS68ziOREk
	 Gnt1osSNZ3PWZtJsUSfV2pWVCBBkO64xcosUtAOm3Aboxo59B3IxSm2vljgUGA/J54
	 GHXNy4Xg0d2v4ebieeRWCaR7/rlmIIh6G1X/zUMLsZwEtMXaqv9qlpWOwxLtYIYhj+
	 eu+89GLZHkGVDSoKwrMyV/EcZyv14WbrBJUbWWbRi38/qSDWymNUpamsiqrO23btkN
	 f0gBT9E7dC0GnPwKogOuTR6I8fMMmt6rDiffQbEmZ1gAbk8Mb7k3SPq9jzruQJpNqJ
	 1EJf59rdH+U+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:52:19 +0000
Message-Id: <20260814075220.68A791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `gcc_sdcc4_apps_clk_src` clock is configured with `clk_rcg2_op=
s` instead of `clk_rcg2_floor_ops`, causing frequencies to be rounded to th=
e closest value rather than strictly rounded down.
--

--- Patch [11]: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller dri=
ver for Kuno ---
commit ade5c3550fedfcea560b82feb4f95ed6684c4853
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

clk: qcom: Add Global Clock Controller driver for Kuno

This commit adds the global clock controller (GCC) driver for the Qualcomm
Kuno SoC. It provides the PLLs, root clock generators, gate/branch clocks,
and resets used by peripheral devices such as UART, SPI, I2C, USB, SD, PCIe,
and Ethernet.

> diff --git a/drivers/clk/qcom/gcc-kuno.c b/drivers/clk/qcom/gcc-kuno.c
> new file mode 100644
> index 0000000000000..f7401ae315dd0
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-kuno.c

[ ... ]

> +static struct clk_rcg2 gcc_sdcc4_apps_clk_src =3D {
> +	.cmd_rcgr =3D 0x6a01c,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_sdcc4_apps_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_sdcc4_apps_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,

[Severity: High]
Does this clock source need to use clk_rcg2_floor_ops instead of clk_rcg2_o=
ps?

When the MMC driver requests a maximum safe operating frequency based on the
SD card specification, using standard clk_rcg2_ops can round the frequency =
up
to the closest available table entry rather than strictly rounding down. Th=
is
could exceed maximum frequency limits and potentially lead to data corrupti=
on
or hardware issues.

> +	},
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-kuno-soc-s=
upport-v2-0-3079794f0f73@oss.qualcomm.com?part=3D11
