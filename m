Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9D598C1B
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890327; cv=none; b=Lha2m440Ajb2eKIkqbX7oOX2C66SvHlnMH5vn6hXiZwkSfLReLAL9yx4A5Oojq/HzFcfLNzNMs0jHKFz23W8uA5QKWYOTvzN9IGpiN9s3DVp4f7+CQcFwuC6dJh75RVaJZu6BjllUAj+LHx05mTGraHbqNcWhNPklc7D/P0goeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890327; c=relaxed/simple;
	bh=pf+Z7Z9AAkbMzPIqRiZRVhyDtFhYW/Lu9Bus3OBX0t0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDb4fUbbP5VzLsnT4ktC0qJt3gHgcHYxz9SxxSfyCxAMx5GsSvV1iXnsTZhabhNYLhTu5UF5uyoj/xF3U7bpVpkYB8UKruktrS3JBic2yYVpTDmOaU7b3uiwitQz5xTWXH5sueduHmXLCcO6QE1XEpwj6sqmSbxDeYH+825wWK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrtT6nQn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrtT6nQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A4D1F00A3A;
	Tue,  8 Sep 2026 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890325;
	bh=lUJhdBjvq9F0wTRGeQBGqub5Wg6S2T4/vMtAMMwOFWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrtT6nQnDHvNj3iaf9wpbFv51klovdaDh2On+VTdkSRWrGGqSxzjpbkCF7CcbviEV
	 rnmk8lcVyl/GFruJdUNjL7jroqLEK1E9jSbdppkNsX3TJandZmMRI1NWdaVVEz7v3q
	 MVOuRfEilmU4BS7BPxP6NLTj1hXa3KRUvV+SkPHIMRboFDnoeAVdQF41f3p1IrZshX
	 qQtJJhR8J6ULLlM50Z0O0Ck1FK8N/X9HT/+I8A7sV72bnpMlrWp66jwc2oC/fwIaM6
	 zO2NmVcUFfsOs+vj1l5oXgjSMZUTaK1fk78+s2qr6GZKFKOJmMOgIX3JVFfy2sS9L2
	 HqSm7WmBpBKNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:58:45 +0000
Message-Id: <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing semicolons after macro invocations in `subsys_driver`.
--

commit cdf3179a9f2205efd1b552f70b7522e1db5ee888
Author: Brian Masney <bmasney@redhat.com>

driver: core: add subsys_driver() macro

Add a new macro subsys_driver() to eliminate some boilerplate code in
drivers that need to register earlier in the boot at the subsys_initcall
level.

> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index 768a1334c0a1d..29fbc01ef06fc 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
>  } \
>  device_initcall(__driver##_init);
> =20
> +/**
> + * subsys_driver() - Helper macro for drivers that don't do anything spe=
cial

[ ... ]

> + */
> +#define subsys_driver(__driver, __register, __unregister, ...) \
> +static int __init __driver##_init(void) \
> +{ \
> +	return __register(&(__driver), ##__VA_ARGS__); \
> +} \
> +subsys_initcall(__driver##_init) \

[Severity: Low]
Are we missing a semicolon at the end of this line? This relies on underlyi=
ng
macros providing a trailing semicolon in their expansions. While it compiles
today, it makes the macro brittle. If the initcall infrastructure is ever
refactored to not include an internal trailing semicolon, drivers using
subsys_driver could fail to compile.

> +static void __exit __driver##_exit(void) \
> +{ \
> +	__unregister(&(__driver), ##__VA_ARGS__); \
> +} \
> +module_exit(__driver##_exit)

[Severity: Low]
Could we also add a semicolon at the end of the macro definition? Omitting =
it
is inconsistent with similar kernel macros like module_driver and relies en=
tirely
on how the user invokes the macro.

> +
>  #endif	/* _DEVICE_DRIVER_H_ */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-subsys_ini=
tcall-v1-0-cbccf4cd4288@redhat.com?part=3D1
