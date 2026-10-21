Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587888;
	b=4pVv1XQocsjGac5aEuw9h+6HWZim4RL95e9be0v1jR0mz7C+GDO1y2XLMmwbiFYJhjMj
	 jMaYy0OQJ4BSw+AO+on3A25LC5lcF4Pc5rD4IwBQROvZcihBIpR9KgXgSBSRP85BXODl6
	 ml/y6jLp7fuEpf7s185MESv9ca9pcd2dYdoj/iCa2ZYXB2mUDzGEFUxV/Q+A4thdy02Dr
	 k+ik/AfPt9Z9Bs+HWDV+bfsfWzWEkqxCKLrM2ZRhFcWaNySceC+lzQh9+xWHGBvnZzFkS
	 B92nSMxerGySydHWoJXe+lLGjrt4Q6/ow+wrY2kxNcZOl8V/D+CHBhbk+Tvm+fQCxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587888;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gAe4auqetHGAeDwn3pXfHEfJRNoE+CKjzeK2bknG6OM=;
	b=jSIYAqNHP0065J8dmvgpewiiM4zD05kIck0Abb5Ke8d1Fo4VPlwdVj0rggO/htCb6NcA
	 yhw3plfEzOBFRfw6ODCpNpSrFQd4sb7O9QLxVoN06q18f/uXuwOefHNtGPJLLf1rVtkYD
	 +eh5ofb0f9iGjBltZFOQR8d+p3JRZz2025Ug8VIkNkA3Ay8949WfIECn9noACrhHmXgtI
	 FbDMvi5hpWTmP2IO8eaWPuLLPn1ESO/kR4QbmoSljlC2lSQaSQvlnuJY4GjkAudAzcHxA
	 Gvf2tDmDX/lW4ik+7/q8+csGm8P72MPTarw6rSZro2R2LD4qEZtYHqn/Dg+upSYm/MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8t6oj4k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B69606A31A;
	Wed, 21 Oct 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8t6oj4k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628D61F000C4;
	Wed, 21 Oct 2026 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792587887;
	bh=gAe4auqetHGAeDwn3pXfHEfJRNoE+CKjzeK2bknG6OM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8t6oj4kizJCfiIXjOL9+yEEKx+QAFvottU4D/+u2ONFh0qVA7jTCGYGpbl+VWXaa
	 rhQYcq9k8F7SpU45fbxMaCISdK7hZ/yGrHg0C+rg571jQfDqW69LNdna0riPD+Xj0Y
	 +1gtzVzz8ylgSwOPZo/BwXRRV5P1nMkQ1283xLKWL722HzsL+oqYbeLbQwowSJeCrh
	 /b14ALBYJRWRcyzJokJiZUlJSNhcNfQijxB4PPBqfxi72uBOlw/ozcXXwvLgf8CJy1
	 u3CqPJ82b7EaXYM1Z5FF18WTjcWJ73O8N7LwNf4HA8Jo2hg/j2OCtXaP5e2dd09Vg/
	 wxV5buTxCx5PA==
Message-ID: <sashiko-outbox-180284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-master-v12-2-9b3df51fd1d7@oss.qualcomm.com>
References: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
 <20261021-master-v12-2-9b3df51fd1d7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 13:04:47 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: enable runtime PM after PM clocks in lpass_va_csr_probe=
()
- [Medium] clk: qcom: lpass-va-csr: stale REGCACHE_MAPLE state across runti=
me suspend
--

commit 5fda051342340a0aea8fc87d53199c8e2fe790df
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

This commit adds the Qualcomm LPASS VA CSR clock driver, modeling the
hardware rate generator as a clock provider that manages LPASS vote clocks
and restores counter and delay registers via runtime PM.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..e5fb870aa36de
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
> @@ -0,0 +1,180 @@

[ ... ]

> +#define LPASS_RATE_GEN_CTRL		0xd000
> +#define LPASS_RATE_GEN_COUNTER_0	0xd004
> +#define LPASS_RATE_GEN_DELAY		0xd010
> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)

[ ... ]

> +static const struct regmap_config lpass_rate_gen_regmap_config =3D {
> +	.name =3D "lpass_rate_gen",
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.max_register =3D LPASS_RATE_GEN_MAX_REG,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	const struct lpass_va_csr_data *data;
> +	struct clk_regmap hb;
> +};
> +
> +static const struct clk_ops lpass_va_csr_hb_ops =3D {
> +	.enable =3D clk_enable_regmap,
> +	.disable =3D clk_disable_regmap,
> +	.is_enabled =3D clk_is_enabled_regmap,
> +};
> +
> +static int lpass_va_csr_runtime_resume(struct device *dev)
> +{
> +	struct lpass_va_csr *csr =3D dev_get_drvdata(dev);
> +	const struct lpass_va_csr_data *data =3D csr->data;
> +	int ret;
> +
> +	ret =3D pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(csr->hb.regmap, LPASS_RATE_GEN_COUNTER_0,
> +			   data->counter_0);
> +	if (ret)
> +		goto err_pm_clk_suspend;
> +
> +	ret =3D regmap_write(csr->hb.regmap, LPASS_RATE_GEN_DELAY, data->delay);
> +	if (ret)
> +		goto err_pm_clk_suspend;
> +
> +	return 0;
> +
> +err_pm_clk_suspend:
> +	pm_clk_suspend(dev);
> +	return ret;
> +}
> +
> +static int lpass_va_csr_runtime_suspend(struct device *dev)
> +{
> +	return pm_clk_suspend(dev);
> +}

[Severity: Medium]
Can setting .cache_type =3D REGCACHE_MAPLE in lpass_rate_gen_regmap_config
cause clk_enable_regmap() and clk_is_enabled_regmap() to use stale cached
state for LPASS_RATE_GEN_CTRL after LPASS register context is lost across
runtime suspend?

Neither lpass_va_csr_runtime_suspend() nor lpass_va_csr_runtime_resume()
marks the regcache dirty or drops cached registers, and
lpass_va_csr_runtime_resume() only rewrites LPASS_RATE_GEN_COUNTER_0 and
LPASS_RATE_GEN_DELAY.

If LPASS_RATE_GEN_CTRL has LPASS_RG_CTRL_EN set in hardware when first read
(for example, when loaded as a module or booted with clk_ignore_unused and
inspected via debugfs clk_summary -> clk_core_is_enabled() ->
clk_is_enabled_regmap() -> regmap_read()), _regmap_read() caches that
enabled bit in the maple cache.

If the device then runtime-suspends and loses LPASS register context,
hardware resets LPASS_RATE_GEN_CTRL to 0 while the cache retains the set
bit. On a subsequent clk_prepare_enable(), clk_enable_regmap() in
drivers/clk/qcom/clk-regmap.c calls regmap_update_bits():

drivers/clk/qcom/clk-regmap.c:clk_enable_regmap() {
    ...
    return regmap_update_bits(rclk->regmap, rclk->enable_reg,
                              rclk->enable_mask, val);
}

Because _regmap_update_bits() sees the cached value already has
enable_mask set, it skips the hardware write and leaves the clock disabled
in hardware.

Should .cache_type be omitted from lpass_rate_gen_regmap_config (or
LPASS_RATE_GEN_CTRL marked volatile / the cache invalidated across runtime
suspend)?

> +
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	platform_set_drvdata(pdev, csr);
> +
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	ret =3D devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get vote clocks\n");

[Severity: High]
What happens if runtime PM is enabled before the PM vote clocks are created
and added in lpass_va_csr_probe()?

In drivers/base/power/clock_ops.c, pm_clk_resume() returns 0 immediately
when dev_to_psd(dev) is NULL or the clock list is empty:

drivers/base/power/clock_ops.c:pm_clk_resume() {
    struct pm_subsys_data *psd =3D dev_to_psd(dev);
    ...
    if (!psd)
        return 0;

Because devm_pm_runtime_enable(dev) is called before devm_pm_clk_create(dev)
and of_pm_clk_add_clks(dev), a runtime resume triggered in that window (such
as via sysfs power/control) runs lpass_va_csr_runtime_resume(), receives 0
from pm_clk_resume(dev), and calls regmap_write() on
LPASS_RATE_GEN_COUNTER_0 and LPASS_RATE_GEN_DELAY without the vote clocks
enabled.

In addition, because devres callbacks execute in reverse registration order
on driver unbind or probe error, pm_clk_destroy() (registered by
devm_pm_clk_create()) runs before pm_runtime_disable_action() (registered by
devm_pm_runtime_enable()):

drivers/base/power/clock_ops.c:pm_clk_destroy() {
    ...
    dev_pm_put_subsys_data(dev);

    list_for_each_entry_safe_reverse(ce, c, &list, node) {
        list_del(&ce->node);
        __pm_clk_remove(ce);
    }
}

This disables and removes the vote clocks and clears dev->power.subsys_data
while runtime PM is still enabled on the device.

Should devm_pm_clk_create(dev) and of_pm_clk_add_clks(dev) be called before
devm_pm_runtime_enable(dev) in lpass_va_csr_probe()?

[ ... ]

> +}
> +

[ ... ]

>+MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider"=
);
>+MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-master-v12=
-0-9b3df51fd1d7@oss.qualcomm.com?part=3D2
