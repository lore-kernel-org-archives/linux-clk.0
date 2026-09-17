Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A756329A;
	Thu, 17 Sep 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654085; cv=none; b=WiQehSY5xI3WWmcwg293ILXSv5UcvOuhhdq/pYuPFcKHpobvnLc8Y32JgRYG3iW6Km6Q3l5fUwMSYO+MOcn+G+dOxjsVDBB7dRVPf8POyeZMdanJNsGwgXIk2Dt0l47876S0xwrUf3ey4U1oFghd1oztYiswJH3imCTSFguo7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654085; c=relaxed/simple;
	bh=YTdhMdJzY4ydQAK8RKlhvMFELRRpmXAqtNhRAIPv/GQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qt1OI8HUBZE/6/RY4wSBfqMULBpXSUPfADDTNvLVyUjTlWxoGeDeJ24gFA9BNavahhH34NSoz1+isPwtow9tFGdyZ+zScRqM1saV0H+eWB0NaboHFaRWfEv7Va5SP+KG7eNFA+iYYZx1ySk9G4HZgp/2m6hTF/+yEnQEIQ3kMdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Exy+OuPG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Exy+OuPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C651F00893;
	Thu, 17 Sep 2026 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789654079;
	bh=/s2CueMCsjQaX0fqgZ5Of3hQBkzdN60bvadbT5rcLbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Exy+OuPGm13Ya8cRvoXFKunEjMUSRwtEEXp4Hzd93REQYlpJGYJtQPeE96+arQhY4
	 CTWi4EXTkmXFffVtXlDM/+3wifwi3GNstS+1f9VHr2t/I/s5oxu54k4S/Ys/Sc4lLr
	 ttVcnpofg4DMA+kMfbBMCeWPXnUXCebO0WAjM4D8YrLnKVJ/+94RNFQsRZ61/1gAQL
	 isOhxtoWA9jOwZ8FbOdKaiCmKZPvzDvR3MCY3aDxim4DJ5BnaKSKsCYlyeBQEmPThp
	 zjZY1yQ/fYVnEmSvQB7G0U17JV9GQnYILSkmDGWte0W86VcuR6h8ffzo64wlMFkb7h
	 gF9zC0d92ZyMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 14:07:58 +0000
Message-Id: <20260917140758.A0C651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: lpass: missing pm_clk callbacks causes unclocked hardwa=
re access
- [Medium] clk: qcom: lpass: async pm_runtime_put() races with devres pm_ru=
ntime_disable()
--

commit 5684759a56eb84ac05a7585939de6fdaa87b92de
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
start of DMAs and Codec Interfaces for the audio usecases and can
serve as a periodic wakeup source for the DSP. Add the LPASS VA CSR
driver that models the rate generator as a clock provider so it is
enabled and disabled automatically alongside the other clocks during
runtime PM resume and suspend. Attach the DT vote clocks to runtime PM
and resume the device before programming the rate generator registers,
so register accesses happen only after the LPASS votes are active.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..3c87c3319f156
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c

[ ... ]

> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb=
.hw);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}

[Severity: Medium]
Will this asynchronous pm_runtime_put() race with the devres cleanup?

When probe fails, err_pm_runtime_put calls pm_runtime_put(), which queues an
asynchronous suspend. The probe function also uses devm_pm_runtime_enable(),
which queues a devres cleanup action that calls pm_runtime_disable() on
failure.

After the function returns, devres cleanup will invoke pm_runtime_disable(),
cancelling the pending asynchronous suspend request. This leaves the device
permanently active and its vote clocks enabled.

Could pm_runtime_put_sync() be used here instead to ensure the suspend
completes synchronously before devres cleanup?

[ ... ]

> +static struct platform_driver lpass_va_csr_driver =3D {
> +	.driver =3D {
> +		.name =3D "qcom-lpass-va-csr",
> +		.of_match_table =3D lpass_va_csr_dt_match,
> +	},
> +	.probe =3D lpass_va_csr_probe,
> +};

[Severity: High]
Does this driver need a dev_pm_ops structure assigned to handle the PM clock
callbacks?

The driver registers DT vote clocks using of_pm_clk_add_clks(), relying on =
the
PM framework to enable them during runtime resume. Without assigning a
dev_pm_ops structure mapped to pm_clk_suspend and pm_clk_resume in the
platform_driver, pm_runtime_resume_and_get() sets the device state to active
but leaves the clocks physically disabled.

Will the subsequent regmap_write() attempts in probe try to access unclocked
hardware registers and trigger a synchronous external abort on Qualcomm
platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-master-v8-=
0-823d2c5d090a@oss.qualcomm.com?part=3D2
