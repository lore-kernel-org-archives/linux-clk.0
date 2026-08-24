Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A1417D9C;
	Mon, 24 Aug 2026 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574017; cv=none; b=MUmuvPAz8J8fB+SMyfJYp1OpAci1wD8o+fcvjRegr7fPE6fjvE9fcqFAWVmv12rEcuXGD2S1YfIoLqOxIPUutlneSChNIg4pPnkDpukolQw4BXTI6UgJKhblKpsj+M75UMSu3Jg3VUf8KGq8VwAq9zzCIPbR0b/Hly8TZKuVk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574017; c=relaxed/simple;
	bh=sBQKJxo1BdaPDeyWiFKiHz7+DsBTsx2fG3NZD26nMPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=abiKNVuKmZ+xOz+m6hbibEdwIfO43cpbp7K37Kdfw58cLe9p0VMS48r6ihTXPGUDoCSa6LDR9hRxtxiClli1+bZ8A6WtsniDWQGkeywSBmIoqvcSYeAdIUu/WHEak4BAXnvsw/OSaYLTuPZeC5YPFlQfitJvuvT66mlet5NUvKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deiGxsSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deiGxsSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495FE1F000E9;
	Mon, 24 Aug 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574012;
	bh=iqukm/8ScNFZ0JpSXrfXf0jNctRMtcnWrZUWJNC4ABc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=deiGxsSOF6SZ2lbf4PGyWiAKbMF4qvTfPle+jrgPOOlBxEwyWJUXVcLYRtstvEOGY
	 fDR5KInKx17v6x48moBzmq9r803OadXaju/AmzLaRgocOxlZxpiGfUGuBiJFcKxDCe
	 we1o9Gxo417xL+hjHddCO9xUILkkV/bIpbOitrWeL0uhksURXBXL/aI+bj4WzONKqp
	 xqdkPAOMvXP22ur+Hv7NlFf0pTUaAsdO+yUgrh8fyA50VLZOw8FeG2lfbwBKWMBnYH
	 9n20pQst35n/v2HozgQ56X5Dog0SGZqCyv91un/h5Yetkj9BY1hXnoxLwQLq3Ni8j5
	 LZVhARx4xsdcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 26/47] clk: qcom: gcc-sm8350: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-26-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-26-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:20:11 +0000
Message-Id: <20260824122012.495FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing pm_genpd=
_remove cleanup on error paths in gdsc_register leads to leaked PM domains =
and global list corruption upon reprobe.
--

--- Patch [26]: [PATCH v3 26/47] clk: qcom: gcc-sm8350: Tie the CX power do=
main to controller ---
commit 463c8123d4d3a81e488b69352069b211c58bd412
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8350: Tie the CX power domain to controller

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> index 2d94f3046b711..996ee8592fabe 100644
> --- a/drivers/clk/qcom/gcc-sm8350.c
> +++ b/drivers/clk/qcom/gcc-sm8350.c
> @@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc =
=3D {
>  	.resets =3D gcc_sm8350_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8350_resets),
>  	.gdscs =3D gcc_sm8350_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
This is a pre-existing issue, but missing pm_genpd_remove cleanup on error
paths in gdsc_register() leads to leaked PM domains and global list corrupt=
ion
upon reprobe.

If gdsc_init() or subsequent subdomain additions fail in gdsc_register(),
the function returns without calling pm_genpd_remove() for the successfully
initialized domains:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
		ret =3D gdsc_init(scs[i]);
		if (ret)
			return ret;
    ...
	err_pm_subdomain_remove:
	gdsc_pm_subdomain_remove(desc, i);

	return ret;
}

Because the gdsc structures are statically allocated (like gcc_sm8350_gdscs=
),
the leaked PM domains remain permanently linked in the kernel's global
gpd_list.

If the driver is reprobed (e.g., via sysfs bind/unbind or late probe
deferral), pm_genpd_init() is called again on the same static objects,
triggering a list_add() on nodes already present in the list.

Does this break the list pointers and cause a kernel panic due to list
corruption?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8350_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D26
