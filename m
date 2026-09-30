Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE83D6CA3;
	Wed, 30 Sep 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762811; cv=none; b=O3DtnupZ3bnVst8UddibFZDQdtDugKGEwd9niYjBoENmm9yY4oBQVCWlAczlQ41m/V7UYtHhFC+UR4fMFZoiD7u+X/D+xtmZNFA+T1peEhMlnOmd6/TfU2hHAxofemMiBt4lclvelk/nyw6dwO6ev535wg71DBx6EYwGM7ixA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762811; c=relaxed/simple;
	bh=e0ovPuyNd18QSOBneZJDDbXqd0wbmt9df0ODgWjm85o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jagWQB/G4+LYmd39NEAIbrG7XeGWC33bVTHeVuwVpMIJiiGlKNsikLiqaUnw0G8taPJ6UYymrhCQltt9gXzpNjSVj2C7PY2Ut7I3bECoV8yfuMzNh+861byRnF1IHNy5QX6nF00hV6nRZK8RXVr3srNzOyaYzT8RF07o4+ktffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5QY1uY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5QY1uY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2B91F00893;
	Wed, 30 Sep 2026 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762809;
	bh=eeYdI6c7HCKSlPtKmElz96aPh98TIc6cdoF8MQ41edI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i5QY1uY4CBiHRc8ajHbsoG2d2HjQ+iIpV8CBjSUy5sptXXX3N9/ILHmjOuI44baAJ
	 p4REfDk2qz5FvCWrcujL+zky+lDAtnlNIGvZJRcu8JSO89SNRNT748gtxHqakfdudh
	 6wHCh6QsjvG7xhcjGmBztV32jIfztsGaatIhydWTg/TG5lRR+01znv4s40WoL7c0tS
	 /XoY3sa3IUiKW8tO+l9VaxvCyv/2gSijQA4QHNQCCw00RxBIxZwAzh4JmbOl7/NDrQ
	 tbvh2gP7hv9yI18vN7Bcl9Z9MtZ07zYQctgyQD/1w1tofSE6twSPiDvrdFXm7vDUu9
	 zYeHmQhuIVX+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260930-master-v10-2-105207bc5275@oss.qualcomm.com>
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com>
 <20260930-master-v10-2-105207bc5275@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 10:06:48 +0000
Message-Id: <20260930100648.BC2B91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: missing hardware state restoration on runtime resume
- [Medium] clk: qcom: missing NULL check for of_device_get_match_data()
--

commit 506d9b3aab397203423c9181e755579f9ddb3dd7
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

This commit adds the LPASS VA CSR driver to model the rate generator as a
clock provider. It attaches DT vote clocks to runtime PM and programs the
rate generator registers during probe.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..b4c0f88187ebb
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
[ ... ]
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct lpass_va_csr_data *data =3D of_device_get_match_data(dev);
[ ... ]
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(regmap, LPASS_RATE_GEN_COUNTER_0, data->counter_0);

[Severity: Medium]
Is there a risk of a NULL pointer dereference here?

If the device is bound manually via sysfs rather than instantiated through
Device Tree, of_device_get_match_data() will return NULL. The data pointer
is then unconditionally dereferenced when writing to LPASS_RATE_GEN_COUNTER=
_0
and LPASS_RATE_GEN_DELAY.

[Severity: High]
Does this hardware configuration get lost during runtime suspend and resume
cycles?

When the clock is unprepared by the consumer, the PM runtime reference is
dropped. The pm_clk_suspend callback disables the vote clocks, which can
allow the LPASS power domain to collapse and erase the register context.
The data written here to LPASS_RATE_GEN_COUNTER_0 and LPASS_RATE_GEN_DELAY
is only configured once during probe.

> +	if (ret) {
> +		pm_runtime_put_sync(dev);
> +		return ret;
> +	}
> +
> +	ret =3D regmap_write(regmap, LPASS_RATE_GEN_DELAY, data->delay);
[ ... ]
> +static const struct dev_pm_ops lpass_va_csr_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};

[Severity: High]
Should there be a regcache_sync() call to restore the hardware state?

Because the generic pm_clk_resume is used directly without an additional
wrapper that syncs the regmap cache, the counter and delay registers are
not reprogrammed after waking up from runtime suspend. The subsequent
clk_enable_regmap() will only write the control register, leaving the
hardware with uninitialized or reset parameters which could break audio
DMAs and codec synchronization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-master-v10=
-0-105207bc5275@oss.qualcomm.com?part=3D2
