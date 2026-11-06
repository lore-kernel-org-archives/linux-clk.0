Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970493;
	b=Z//p1w5+2c+8dSOmlAiSvYjou9nYooM6WOBFIcXyqMupGKK0n/JTg6xI0qz0iVzi8ID1
	 iPb6H8NK4XFS4QkS7VSMSD+wAqMbTzcYjlMJv/rMFnR/USltKoUwBLXQkn6mt+kXBBrjM
	 0fktWSk27HR109XIOySQ7XmxgBd+7dAzFnVqiuZS67pDfCBQK4qf9tSO+mM+VrYkOUkG6
	 mM5caX47pwQioFd1LEHH/kUkX00zL6R4CzLsjB9N7nzSMO5Xg7kby1YNxfVZMqk1ADKTN
	 hDnOr915oPNmdyC0wv1sEHED2gvDX7NR+dNIXH0AEWDFwng0ejPWmdBCJtrK9MvgaSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tKk5aEZXnafMyBNTOoPm9dVXgFLC2FqyYYQz5rKBIig=;
	b=XuU9xgE9oHgrj1yLejOyn4V195AIdTV+leUPHc0NQyMD6OPzvelKoYImiQtJAPz0ibZZ
	 BxZQvGymH9p6FPmmfRdygYug5E3EyaWjGN071qow4zm1Z6ldonuRWtNtt1SBMsoiX/uWz
	 0xZPeGxpo0yzom6UPAVI3NXbeQhmOicZxPzRR1ThCOr8lHoGHKmXv+053cMJ6vT7KIctQ
	 PmWLz4dOBDnMMLFUL3L8lgch20wfBAkbBQjUxP5w8H+JKvYkzRSWMDI4N1J30yegHdCs0
	 6GxEn47RJOEhB9/ik1RZH2Itt7gexT6JPeSJ6SujTKVSmITo3szU3S1jtFwE5EHQEmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gN1rPbZ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63598606A32C;
	Fri,  6 Nov 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gN1rPbZ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C3D1F008A1;
	Fri,  6 Nov 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970492;
	bh=tKk5aEZXnafMyBNTOoPm9dVXgFLC2FqyYYQz5rKBIig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gN1rPbZ0oLGmpW8QUXAvm1AZiOiwUpm/YjnVNclutatvDcVeAYAdeK+WQNjObbGtj
	 Xun4/WHtjd5XLIKOYH5YTX7sQH6WHCjn2Le521VKn39s7G3gOu7ftDx+eZrlqbR6Cw
	 lMvUskFsobFOei8tuPHn3FqHH7+LG3RUBU7nbQczhwbiE6laXuZqKbjVpYTZWifGHe
	 mJI+7iXBbegLbTwENmNI9O2Bmi3yIZsz8r++ZAW+j+xZxqtm1Gd1Cx3KsEPY7pVzgw
	 Kdb/3pPmz9iGZY5Lu+GqUUsy4HcNHVOAc72CVkuq/jl6bgItygxY4K/gAYQHg6wGMz
	 9FJ+iQddFgS+w==
Message-ID: <sashiko-outbox-201438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-2-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
 <20261105-qcom_ipq5210_nsscc-v1-2-d4fcb5c32b51@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 13:08:11 +0000
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
- [Low] clk: qcom: nsscc-ipq5210: wrap .driver.pm with pm_ptr()
--

commit 32b660ef44d1803c715de35bfad45d1be9b88559
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: Add NSS clock controller driver for IPQ5210 SoC

This commit adds the NSS clock controller driver for the IPQ5210 SoC to
provide clocks, resets, and interconnect clock paths for networking blocks
such as PPE, UNIPHY, and the integrated Ethernet PHY.

> diff --git a/drivers/clk/qcom/nsscc-ipq5210.c b/drivers/clk/qcom/nsscc-ip=
q5210.c
> new file mode 100644
> index 0000000000000..ca749e0af3231
> --- /dev/null
> +++ b/drivers/clk/qcom/nsscc-ipq5210.c
[ ... ]
> +static const struct dev_pm_ops nss_cc_ipq5210_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +static const struct of_device_id nss_cc_ipq5210_match_table[] =3D {
> +	{ .compatible =3D "qcom,ipq5210-nsscc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nss_cc_ipq5210_match_table);
> +
> +static int nss_cc_ipq5210_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Fail to enable runtime PM\n");
> +
> +	ret =3D devm_pm_clk_create(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Fail to create PM clock\n");
> +
> +	ret =3D pm_clk_add(&pdev->dev, "bus");
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Fail to add bus clock\n");
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Fail to resume\n");
> +
> +	ret =3D qcom_cc_probe(pdev, &nss_cc_ipq5210_desc);
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static struct platform_driver nss_cc_ipq5210_driver =3D {
> +	.probe =3D nss_cc_ipq5210_probe,
> +	.driver =3D {
> +		.name =3D "qcom,ipq5210-nsscc",
> +		.of_match_table =3D nss_cc_ipq5210_match_table,
> +		.pm =3D &nss_cc_ipq5210_pm_ops,

[Severity: Low]
This isn't a bug, but in nss_cc_ipq5210_driver, .driver.pm is assigned
&nss_cc_ipq5210_pm_ops unconditionally while nss_cc_ipq5210_pm_ops uses
SET_RUNTIME_PM_OPS().

Should nss_cc_ipq5210_pm_ops use RUNTIME_PM_OPS() and .driver.pm be wrapped
with pm_ptr(&nss_cc_ipq5210_pm_ops) so the structure and callbacks can be
dropped when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-qcom_ipq52=
10_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com?part=3D2
