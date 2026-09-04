Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D73E9C18;
	Fri,  4 Sep 2026 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548550; cv=none; b=jd6HYEHTOcJ+8MjJ8w9DQLVsZsSDdqaEEklFNC+GvB3odtOE3TxoL7uZ+gBIwcaLYeZzOvSgGPxZyNC+lyq1YQUZTPiHb9fTvxCoPsezwlgEKAgmeoMKOEZ9AUx1XgrOGRfLorqw+9lXJpR/AfgkNOKPjN8RGHRXP3QhtLNdo8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548550; c=relaxed/simple;
	bh=5pOMefOaJ27NZHdUjC3VGxRaG/Cn2zIPr26m6M6wyKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+NTogv1Wvfgashl5gN45S26KBvYfpKHClm2Fq7was2iQdKyL80YrwGCF2wJO4+xkgbqJoCFQIgcWWw66aWC2K4xeRiWYk2ZOPWD/ar+mQHGRXPDnKqIHQXDeBzPe7UYibc6QzwpvoI6xmEhSLxXmPsKZ9fp2FMZTktth8kFGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/wZB3l0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/wZB3l0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6681F00A3D;
	Fri,  4 Sep 2026 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548545;
	bh=KKW7nY0THuoMgtz8NDqIxS4aUZitKsReQbZtIEhPPwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S/wZB3l0FGCNWChwEmICAwNYe2GqGv7Umc8KIK8c/FrZw78VWQU+SVxErSQUkdIy4
	 jip+lnTtDQ8xlOu3ap8MbykeXUZnsLxorZU0QgWlHdvoHCAurOeIT5UKu9cMM15Kbw
	 TcaLoBtkZEr9ExcRslgq3a/nlK2+eSJJNduVTFYEoW5SKh1BW5tkr+DsyxPkALWw1p
	 f5PoJkDPvSZ8eNoh9HMaQdKNX+jjkmagt2/tEjbq+5Wxo5Cy1AkO/IGAHRDgxNC40U
	 w6rA3uMNjEkMKTqJTIw95lkPbije4/IXBhPRFysjuVW8XRugVIIolSg8F++rySYfXw
	 ZJswuS5MptPvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 19:02:24 +0000
Message-Id: <20260904190225.1D6681F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes a UFS GDSC hang for `gcc-glymur.c` by using `clk_r=
cg2_shared_ops` to park UFS RCGs at XO during init. However, identical UFS =
RCGs in sibling drivers (`gcc-eliza.c`, `gcc-kaanapali.c`, and others) stil=
l use `clk_rcg2_shared_no_init_park_ops` and remain vulnerable to the same =
GDSC wedge issue.
--

commit ea0c46ac321975e91a07a59d21b631f1f46de735
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs

This patch switches GCC UFS RCGs in the gcc-glymur driver to use
clk_rcg2_shared_ops instead of clk_rcg2_shared_no_init_park_ops. This ensur=
es
the clocks are parked at XO during registration, which is required for the =
UFS
GDSC power-on sequence.

> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index a47a2c6b961ba..1957c847568af 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -2327,7 +2327,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src =3D {
>  		.parent_data =3D gcc_parent_data_6,
>  		.num_parents =3D ARRAY_SIZE(gcc_parent_data_6),
>  		.flags =3D CLK_SET_RATE_PARENT,
> -		.ops =3D &clk_rcg2_shared_no_init_park_ops,
> +		.ops =3D &clk_rcg2_shared_ops,

[Severity: High]
This is a pre-existing issue, but this commit appears to only fix the UFS G=
DSC
hang for gcc-glymur.c, leaving identical UFS RCGs in sibling drivers vulner=
able
to the same problem.

For example, in drivers/clk/qcom/gcc-eliza.c:

static struct clk_rcg2 gcc_ufs_phy_axi_clk_src =3D {
	...
		.ops =3D &clk_rcg2_shared_no_init_park_ops,
};

And similarly in drivers/clk/qcom/gcc-kaanapali.c:

static struct clk_rcg2 gcc_ufs_phy_axi_clk_src =3D {
	...
		.ops =3D &clk_rcg2_shared_no_init_park_ops,
};

Since these drivers share the same hardware IP design and define the exact =
same
gcc_ufs_phy_gdsc and RCGs, won't they suffer from the identical wedge failu=
re
during UFS controller probe if the bootloader leaves the clocks in an unpar=
ked,
off state?

Could this fix be extended to the sibling SoC drivers to prevent UFS
initialization failures across the subsystem?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-glymur-ufs=
-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com?part=3D4
