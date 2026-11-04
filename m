Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780049;
	b=Otz4lW1Frl5S6I+MAXKkGKupjpv0LxeCt2Hl2CXMYI6dAwHxRtenDXmZRlubt/G/Uas9
	 ccFrQhfIe29uv6G86n+qL9tSzzGt00YgbwybUyUG4ZXnXxZs2lMWu4lM3gT42KBrGPn6x
	 ZyGXrUnu6ZHHzYs0rgxTIWclyjizjP3stwaBTpWZ2RNw20W9kT41AZZLZ/fzA0ABubZ8y
	 u8iBVg8NWqnNExnGw/LXz5xDOBj1hqeuKnBTrT6mRSD/9BEsAKfD7Gz9pO3Nal2Ftm5Ar
	 oWQlcluVdMd1uy6pENEkt77ch6xiP5PPr2mfRn+m3IA7UCwyyxHQNdkIKXLFqZv/01g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780049;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mhQw30OBK6THYbnP5bFUVzME7pKzITD/dPhtNgP/8Jw=;
	b=h8pEUD6nq57pzjXqto9za2xicEO61oLS3IB4GiRYQMZ6aQdWoWPkfbm3y2HjPkZYtV4w
	 A3HWNRnHYVFc1M1lYBcbIDHxofBy8aP6lzpx3yUz01cJvaOlxJSIBkm7Y9Ml8vPfjPiZE
	 4wpPvfmT+MzKDiJpy7r3N+UFz5vkzEtZd0Uf9MgVyaYlsh1ll3+iPuuCweCtsXdx6nHd/
	 vJ7kKhIkx09bCVhgI4n4RnTfe7g1Vy7IkwvrC2DKhw3iW9bW9BOvdW8HqTMS8HI0wiYbb
	 vwXTo9+mU9isF9+AkLPbUI7rfL0V5nzCVaRJI21qdDbzwwJ6pvygQpJxe0/wORkISOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dS/AzSNy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF7606A31B;
	Wed,  4 Nov 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dS/AzSNy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B4A1F000C1;
	Wed,  4 Nov 2026 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780048;
	bh=mhQw30OBK6THYbnP5bFUVzME7pKzITD/dPhtNgP/8Jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dS/AzSNyhkAlOpq4j2QjxL7ymhm4n1H1M+ZnQBKhmIk/2L17M2RpFW8GacAsVsNMC
	 Nz3ZJWLwIbXHBopgZL6YFCLyWsuROqPGwwrg+1aYW+bhuRDHW8vURaK8GKXzmK3bAt
	 zNtOPfDgmFv6NCIz56LrI4aSKgN+TrwiF4sifkgHpXZDjmc3/AwOQx2wjnMV3pxtcG
	 8An8tc+/5de1UnO3beWfjeyvSnHTlYTVjD34/9Yy2zVUl8weEypmu/S7UJ8+YHbEok
	 uqUXpGQ0C2gbYLp7aYsRZlrVV2+xGWxDKF7elPjkQS1sRshxXHxJQnebebR4/e39Dj
	 665/KP6qqPjZA==
Message-ID: <sashiko-outbox-196867@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/6] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-master-v12-2-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
 <20261104-master-v12-2-57fbe9eef978@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:14:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: qcom: gcc-sm7250: wrong halt_check on gcc_ddrss_gpu_axi_clk
--

commit a24e620aee1e1a738b8a01486a74fa9dab88eef4
Author: Sreeshankar K <sreeshankar0910@gmail.com>

clk: qcom: Add Global Clock Controller (GCC) driver for SM7250

This commit adds the Global Clock Controller (GCC) driver for Qualcomm SM72=
50
SoCs, registering PLLs, RCGs, branch clocks, GDSCs, and resets.

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> index 0000000000000..949a12ae93c99
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2278 @@

[ ... ]

> +static struct clk_branch gcc_ddrss_gpu_axi_clk =3D {
> +	.halt_reg =3D 0x71154,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x71154,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data){
> +			.name =3D "gcc_ddrss_gpu_axi_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

[Severity: Medium]
As reported by Taniya Das on v9 [1], should gcc_ddrss_gpu_axi_clk use
BRANCH_VOTED instead of BRANCH_HALT for .halt_check?

When gcc_ddrss_gpu_axi_clk is disabled via
clk_branch2_disable() -> clk_branch_toggle() -> clk_branch_wait() in
drivers/clk/qcom/clk-branch.c:

	bool voted =3D br->halt_check & BRANCH_VOTED;
	...
	if (br->halt_check =3D=3D BRANCH_HALT_DELAY || (!enabling && voted)) {
		udelay(10);
	} else if (br->halt_check =3D=3D BRANCH_HALT_ENABLE ||
		   br->halt_check =3D=3D BRANCH_HALT ||
		   (enabling && voted)) {
		int count =3D 200;

		while (count-- > 0) {
			if (check_halt(br, enabling))
				return 0;
			udelay(1);
		}
		WARN(1, "%s status stuck at 'o%s'", name,
		     enabling ? "ff" : "n");
		return -EBUSY;
	}

Having .halt_check set to BRANCH_HALT instead of BRANCH_VOTED causes
clk_branch_wait() to poll the CBCR_CLK_OFF bit on disable rather than
delaying 10us, which can trigger a WARN() splat if the voted DDRSS GPU AXI
clock remains active.

[1] https://lore.kernel.org/r/1ea96c7d-102a-4261-a70e-ca0813490a02@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-master-v12=
-0-57fbe9eef978@gmail.com?part=3D2
