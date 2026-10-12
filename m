Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510447DFAA;
	Mon, 12 Oct 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806788; cv=none; b=RNd1PpgZFwj9KrIv3EPQnGRbL9QMW6fvAxoGxvokawPpyrKxoRUoez2eYt4OU0py63xh/VNFh5cuzSflkOfwrBt9Ite28rXVkAL8/D12iRkmt5cQ950zMNB8qvmpIzxj+CEeFdiFFF1WEVgphqGylxDVkVok5igxhTXO2occOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806788; c=relaxed/simple;
	bh=eAXkDUzZ2wB9QehMuY6cbl7a7INapjUNENe0CMXcvHI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HTgKbLedQWES3mgc4q18ddNtvpE92oAxz/J5mqIybxWVna9bQTya0FpuCg6m1blvKFrVl0w/SjXu4TEAcaPvrF16847q8ZOs7gZYImk7A3fRRavjAILCK8YplsyD4vmPsvuSddafvQjzDCcIbouM+MZbAn92jdGZkhWM/2iAKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWJa+c5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWJa+c5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0A21F0089B;
	Mon, 12 Oct 2026 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806782;
	bh=NMSScUbqWVepl2HdTdAH4EuaAwtanPCLv3NFHUR1b5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWJa+c5LCb1HfT/qWtm3SAZSf3GlyKBevOMj+zHDWoQnhO73P9+vU9Wivmi+86Xzk
	 oNHLEwSrUphTGiwXBi1SkurCRWmsGIndEfe4gAt18JWLMOyfSyAKoIraWwgGgEh85M
	 2xQwgjEH643/TGRvpQ9gZNkeCC2uvoLSBacwBEzy8UPFOAZWZt98KPUiugW1nrL+63
	 rR8Y8y/msaI/Z13XETMU1tAtGTxbuyIJevNWCYgJ/SOfecwnto8CBnT3WGauRv2d7S
	 hbaGeFQ6HjnznJMhRRm93Gv+RKJldOBuqw8TVfO7yMSCWLzBB4Vl3Mjdedvw9xF1cm
	 X+U42ZHr63WrA==
Message-ID: <sashiko-outbox-168061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>
References: <20261012-master-v11-0-15009e3ecac3@oss.qualcomm.com>
 <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:06:21 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: qcom: build failure due to missing PM_CLK dependency when CON=
FIG_PM=3Dn
- [Medium] clk: qcom: missing hardware initialization when CONFIG_PM is dis=
abled
- [Low] clk: qcom: unused-function warnings for PM callbacks when CONFIG_PM=
=3Dn
--

commit a480f5be8e9c721f7e655f8562c6eda38da7c50c
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Subject: clk: qcom: Add LPASS VA CSR heartbeat pulse clock

This commit adds a clock provider driver for the LPASS VA CSR heartbeat pul=
se=20
on Qualcomm SoCs. The driver models the rate generator and restores registe=
r=20
state during runtime PM resume.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 27d0ab24d50a4..da2e8005d0756 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2137,6 +2137,20 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
> =20
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	depends on ARM64 || COMPILE_TEST

[Severity: High]
Should this Kconfig entry have a dependency on PM or PM_CLK?

When the driver is built under COMPILE_TEST without CONFIG_PM or=20
CONFIG_PM_CLK, the lack of dependency exposes the driver to environments wh=
ere
the pm_clk APIs are undefined, which breaks the build.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..e5fb870aa36de
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c

[ ... ]

> +static int lpass_va_csr_runtime_resume(struct device *dev)
> +{
> +	struct lpass_va_csr *csr =3D dev_get_drvdata(dev);
> +	const struct lpass_va_csr_data *data =3D csr->data;
> +	int ret;
> +
> +	ret =3D pm_clk_resume(dev);

[Severity: High]
Will this cause a build failure when CONFIG_PM_CLK is not enabled?

Because the Kconfig entry does not depend on PM_CLK, this code can be
compiled when pm_clk_resume expands to NULL. This causes the preprocessor to
expand the line to ret =3D NULL(dev); during compilation, resulting in a fa=
tal
error for calling a void pointer.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(csr->hb.regmap, LPASS_RATE_GEN_COUNTER_0,
> +			   data->counter_0);

[Severity: Medium]
Will the hardware operate correctly if CONFIG_PM is disabled?

The driver's hardware initialization (programming LPASS_RATE_GEN_COUNTER_0
and DELAY) is executed exclusively inside this lpass_va_csr_runtime_resume()
callback.

If the kernel is built with CONFIG_PM=3Dn, the pm_runtime_resume_and_get()
call in lpass_va_csr_probe() trivially returns 0 without executing this
callback. As a result, the hardware registers will remain uninitialized and
operate with default or undefined values.

Should the driver enforce depends on PM in its Kconfig, or explicitly
initialize the hardware in probe() when PM is not enabled?

[ ... ]

> +static const struct dev_pm_ops lpass_va_csr_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(lpass_va_csr_runtime_suspend,
> +			   lpass_va_csr_runtime_resume, NULL)
> +};

[Severity: Low]
Does this code trigger unused-function warnings when CONFIG_PM=3Dn?

The driver defines lpass_va_csr_runtime_suspend() and
lpass_va_csr_runtime_resume() as static functions without the __maybe_unused
annotation.=20

When CONFIG_PM is disabled, SET_RUNTIME_PM_OPS evaluates to an empty block,
leaving the static callback functions completely unreferenced. This triggers
-Wunused-function compiler warnings, which can break builds configured
with -Werror.=20

Would it be better to use __maybe_unused on the callbacks, or adopt the mod=
ern
RUNTIME_PM_OPS() macro instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-master-v11=
-0-15009e3ecac3@oss.qualcomm.com?part=3D2
