Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EA419302;
	Mon, 24 Aug 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574358; cv=none; b=sJHvl48Geo0Vawo2hOEB2F65GXh2Z49AHvnVEVlH1BRt197eNL+DIQZTUS0J8YcyO52ZLiVfT1vIK57y+ri0Ln2+qrfhhGDH0Lpkw+m+XFV2bMhX0jQ0Ve8U1i8TY286udxGLsnFSmQrCQfGeeOp2p/sP8fcKyMJO6dLU9p49es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574358; c=relaxed/simple;
	bh=RLSMyezgo3qufZG9DCrqSpHRCqtnHfUItc/YMnQB7Ko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3In0jJksA61wSFFuU4T5KJa/2j1y115PAXYWKEXMxT+GYwG68HYi5doB/fqxEeLQ1Tn/agygePQUnEix+etOdbvbbRaWdC/jFGebFN/lsyKNE66KC21O4xfhfX9KHp2+pFFPKKwmUibuhl+yJTC80lGTqG2/PgRUKP89wZzE1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjTEBNsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjTEBNsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E191F000E9;
	Mon, 24 Aug 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574356;
	bh=f6YBdatTPb94SAGMQy1bmEtx1Ma3URHUHlVl1RqeR5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZjTEBNsyD6laNZzskS17N5il7S8f4wfzUU+kUjz88XUxxCJYADqm6ipTXvL57giJ4
	 65DDK1UZgwn83njWVyMwBkwcjYm3GpR09IqlhkJUQycdJp25mANGKzoSNBCJzGXlK9
	 COp3FpAv5eD4mdHpzofuAuCuaFGuLAPJs8wtPwpUQGiuAvm6lR1AqA0oMV+jMXmgTP
	 ZSmHsgyAknLw+vQStUIHn/+boLqr8dBSA3VenI81dCBRE6tASGBIYcBbNrqn7rXIIN
	 sSoZ9oEMpircXH9EjJoKpNbzkDHC+RwK4lsG/BbOBYG/cPrewFxrX8c7eywpCOonfl
	 cdTcUb0OofhXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/47] clk: qcom: gcc-qcs8300: Tie the CX power
 domain to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-13-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-13-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:25:56 +0000
Message-Id: <20260824122556.89E191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The GCC reset implementation does not take a pm_runtime reference =
before accessing reset registers, risking bus errors when consumers assert/=
deassert resets while the GCC controller is suspended.
--

--- Patch [13]: [PATCH v3 13/47] clk: qcom: gcc-qcs8300: Tie the CX power d=
omain to controller ---
commit cad1ca2d5bc9c295249e6fa075b1dac72fab663e
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
   =20
Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs830=
0.c
> index 146b3b5dfead3..d04980e4a0bba 100644
> --- a/drivers/clk/qcom/gcc-qcs8300.c
> +++ b/drivers/clk/qcom/gcc-qcs8300.c
> @@ -3681,6 +3681,7 @@ static const struct qcom_cc_desc gcc_qcs8300_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_qcs8300_resets),
>  	.gdscs =3D gcc_qcs8300_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_qcs8300_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
This is a pre-existing issue, but does enabling use_rpm expose a risk of bus
errors during reset assertions?

By setting use_rpm to true, the GCC controller and its CX power domain are
allowed to runtime suspend when all clocks and GDSCs are released. However,
the generic QCOM reset operations do not ensure the device is runtime-active
before performing register writes.

For example, when qcom_reset_set_assert() in drivers/clk/qcom/reset.c is
called, it performs:

    regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);

If a consumer asserts or deasserts a reset while the GCC controller is
suspended (such as from an error recovery interrupt, a teardown path, or by
a driver not utilizing PM runtime), could this register write fault and cra=
sh
the system?

Furthermore, because the reset operations use a fast_io regmap, they can be
invoked in an atomic context. If a consumer asserts a reset from an interru=
pt
handler while the GCC is suspended, it seems structurally impossible for the
consumer to wake the GCC controller first since doing so would sleep.

Is there a mechanism to prevent suspended register access during resets when
use_rpm is enabled?

>  };
> =20
>  static const struct of_device_id gcc_qcs8300_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D13
