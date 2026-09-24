Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FC4756DC;
	Thu, 24 Sep 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248096; cv=none; b=AreZiVdaxkG7do27K2cw3/57WiWeb0odvKhtVJNH4pfk2R1gNtoUH7mnnXxlgZShWpUQPNkh79WyeA+riRfrEIKnQyzyGkyrQEK30hvhrDy6p24DM+rGve955q8wBhJxl00htnuudThmgtBUI/USk1rmgofJ9LAGc93XxMtO5IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248096; c=relaxed/simple;
	bh=6ZVDAa9aGKdh/C7qL33mIDXqc9NTzFWWhEcit72GMdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZhKarkgh2qGzFlGE26XXBS4+mg3oL6Z/xZLdj4NgDTo5ACoTb1jdICGZEWT0qarZjkk75Axw9OjVg3114mhQe5OsjkP/0v34ebeQPUyKQEzBXpCtxmBm+LCMs2np4XeeM1ipzkGhUo6qnYmN3/RxvS6cfYW6HIVdlVr3q9mM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdAZmwFe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdAZmwFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244D41F000FF;
	Thu, 24 Sep 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248089;
	bh=2RPX+vpniF5X6EKVsIwFwDM0XvI+kQJkaddjeH0w6As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VdAZmwFe4IGQSLmJmTWz7pRzxvdkw0/R9ZVnC+zP1FQeS+NYiV2bRhWt3YhUT2yZ0
	 FORewo8oLX8QOWvgPhNLy14kI7uVXclDD2RGjejk39grrKHXdDg4/y/W2op08rdC1g
	 Xvw7HHPWgS9NbByPPrfiXH3mc7SOp421qOiJua/58CEMfeZcIRFCNpCJS+6QiOUZp8
	 +IyWE1I+1W5DgeWHU+SJ2Hme7+qqZH9O3YQ4GBdgjEROeAL9QYA1bFs5MXpskqOq+t
	 rEsjufiMhbUvnMd8vcbAFJdopagi8LajcF57NI/DojX/6tXNqabZ8t/Rxthv7vN2Xq
	 xqb1Vmo2tGbWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 27/42] clk: qcom: gcc-x1e80100: Tie the CX power
 domain to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:08:08 +0000
Message-Id: <20260924110809.244D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: gcc-x1e80100: missing register restore after CX power d=
own
--

commit 4516f7fcbae3fe60975d4e2ac718022779543d8c
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

    clk: qcom: gcc-x1e80100: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller by setting use_rpm to
true. This allows the CX power domain to be powered down when all GCC clocks
and GDSCs are released by their consumers.

> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80=
100.c
> index 9402fd7fddb8f..b979b74153774 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_x1e80100_resets),
>  	.gdscs =3D gcc_x1e80100_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_x1e80100_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Will the manual register configurations performed during gcc_x1e80100_probe=
()
be lost here when the CX domain collapses?

During probe, several manual register writes are made that are not tied to
any specific clock structure:

gcc_x1e80100_probe() {
    ...
    qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
    qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC...=
 */
   =20
    /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep.=
 */
    regmap_write(regmap, 0x52224, 0x0);
   =20
    /* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
    qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
    qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
    ...
}

When runtime PM is enabled, the CX power domain can power down during deep
sleep when consumers release their clocks. Since the driver has no pm
operations to manually restore these writes upon resuming, and
gcc_x1e80100_regmap_config does not configure a regmap cache (such as
REGCACHE_MAPLE) to auto-restore them, won't these registers revert to their
hardware default states on wake?

Could this cause dependent subsystems like the GPU and UFS to malfunction or
crash after resuming from sleep?

>  };
> =20
>  static const struct of_device_id gcc_x1e80100_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom-tie-c=
x-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com?part=3D27
