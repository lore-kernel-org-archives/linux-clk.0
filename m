Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D12DECCB
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334197; cv=pass; b=Q1bZO3PJ/zXx2RYQNbEcpyj5wraescau0mP5qRmv/y7QOzyjkVia/7ljMwEWLNbkoefumX8lvOAL2SaegtZhDa+HzSOssF74w7nJ35S7UMzcaZWhVyUQbYN38BgZY3lp5icRnp3MvbTXopOczQKPgWm/Y+nOuouvZPWxOpezUSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334197; c=relaxed/simple;
	bh=jibWeNECBJ6nGuuVGpXMaJ411vpC41Hnyp5ZlPjaFrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sisbc+z5zA2w+UkUiA2KhEO6gHVUDaI1YrtQW2At6kXsG7zstm5P433MY7ZpNARoR0+3ppgsRO4Ye4M5jq6151TKgtrmUHhkx5YLKtCTHXww6PLer1nsHZ1y9wY7pwc9SnOUqFtSmeiHlHiDHP9NQl39brRs8FU22WXli0oPuGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjL8i6Tg; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjL8i6Tg"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab432273c5so14776817b3.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 17:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334195; cv=none;
        d=google.com; s=arc-20260327;
        b=Mgz+1m6rczH8e96nqN5n6Jf9Cn3a70/MMKHmXHT67CoN2gWdJvkbzRgWgOX5KjaW/2
         XDXhoXLMS3Pp68ZF+1EaZWiIU8S5Q+u69TM2a+v/MMO+Cu4CKIjBkvb66ANA8nVtUneI
         AF7GQAtYFEhUEhBGHvtPxBwyMJR90LKn92E82soj5Lev02Vl2AV6uDwbNANZgEiudBhc
         i6DrEIzF7J+DtKIS4d5BR3muYzw0po07pY7QmNtF84ngxCUVLctxyiak2caEWGiyrPdw
         dftIr7HV+cjeYJc8yA7/gqVnVh0Gi4azXH1bqyTXIAVy3OgvKbAWWOu4Ebzsesw4aS4J
         PL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        fh=N5+giqfQXyYStRKL+ATfMddvyH5M0HgOjhMPO1Av4GA=;
        b=pjFlMzc82v5yxcKjOKPJYsE+SqFiU/x0CzeO9gzng8uyOkYNAis+2xULyQMb0ScnuP
         g7VvVavRfXK/B1vcSCpu/11ZsvI6iLetjr8gAwLXSS3T+jnkXocf18jMPJOQsUmIcXHK
         6MAm7rshD1D+qh6GcOkuFm0oBVNWcBH1dO1lIAEguWSu5Ntc0PsnUaNROlSR4nSmEV77
         fpegFq7gP48QAUIxJzsD6Y1jQ/wpJRyWPO4DsihCCthYZq9DdXDXkd/XWHlCJg73lLJY
         eaI5EWp2WNPcmbNkW8HA45N8GoRUFKwwzFjh+1leXVsOJ1O+92r9UcEN/q1e+J5vS4b7
         8BGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334195; x=1791938995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=QjL8i6TgtAjF4wRVO56FVrfHK0ABEELBNmCB0IwMtSycsCrADIs3aK5itKSXyK94CQ
         fAXkGoYnepDWarPf7Ey5mwLC5LdBWCH/WbEMIz1qtYfDsniFZLxJ4dEp89xhxNWML3E7
         1znmSyX/1VnIjWkBX+F6IswLM70b6ffqlK6/vQZtF4D5wdEPah/Oa41R9ZTnRR82iBRa
         oYMxDW4ARR5Z634FBE+/LWz/QG6viSIT5Ul/D3D0I3HBio9aa4IwuO1yIrDfvgUMLldz
         lfzqal7L0BBGnckD6CKlFpHqgg0hbYrxVr2JEAo7ySNoSmMHoSFn+z5fsMtyKQqzvxfs
         x2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334195; x=1791938995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=jRzUicHJE1vRaPCxqsEJi+87BCQ7kVzj21NRU4swhCJaP4J3VLGO461pgFLEDhB5Cu
         neL6Od3HFqsdYCAdF1UxlwqwskAKdwjcsd17PJTGyVX2hMMr0Q42bfGazLJbJlUZGn4s
         pgfGftkObz4ppQdaFU0UGLF5jmowqmcepXYIA1hgM8703olr3joo094Fl86NjxfAgbnM
         DNS2doQVOemTRCkcDcdiPABUxr/HRRuQbiBzbYYU1qYSPCGWhZE3aTQH/AABumf5hdNS
         PPBwaowOccyVKYU8aF9a0c4JeCmdyLCyHUn4FpS/Ec9JeHUTloPoqz2rSqY1u69SXJXI
         gi0g==
X-Forwarded-Encrypted: i=1; AKwUvBzEFjCRSU8ezjCwACw/jFITHADQJKgl0FLBAOaGhLWQdW6VMyw4Kbnvk+NY/obSUcn3L1Q0xB7jYD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP1nG1Xjya/VRJ85zdHc797QxDCsiKBF4ascEQ2Tmk2+a56WrZ
	uKuSVitGtP0fICF9Mj9tGw/GdnnQYgL4KFruZsuY3/LCpTYgWpDu9hL4UC3PEwQ5dP7ZzYQw4uJ
	mUi5EcadezO688CLHk+cwj1fhDV1ZLLRU5/xqSrFOAQ==
X-Gm-Gg: AYBFou0fJGdYDhmEPmqM2jCIdbBuOE/RpUuf9YNcPVxYgOC2LkE0CcqO2b8pxKwDSkC
	fWrRrEInDmQ9oMFwFEH02aYIDZe210EhsfqAmu946k/aSEbKnnr9xv9pIZDplnTgyjmS4IsFibY
	uPUKHqhx1SjbCjssCiEnnBMAJYav+VMWaJ+ifTsxfliJ08eynR6ZBtiqupiSk8tvNVqN5JZTU1j
	cwMgplhr3weQTCxU3SxJ6+E6DL+aQuhGz/kh9nMGnYlgngLtrnXjaehUejNbAYsetn0hus1Q1LH
	dNTgE/qR0YN6xqJnbYjVdmmYYhDp4k8W7P91MMQydLJM8JycZUiyvPnpAvYKhuXGEpuy5GkGruS
	6KyeMtfF3thlG464=
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id
 00721157ae682-8b05ac458e3mr9173847b3.2.1791334194577; Tue, 06 Oct 2026
 17:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:49:41 -0500
X-Gm-Features: AclHuK9KAi2YbRrGI4BgLSa88-aMtBCudk5hm_jOIiAtHKuwiCVmb4TkmJdVAQo
Message-ID: <CAPLW+4kQ2M11VbUBkr6ktjfRGRnbdUWRuOK=ek4-3MJxSwGPAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct =
device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 =3D {
> +       .initdata_base =3D ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name =3D "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 =3D {
>         .initdata_base =3D ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name =3D "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] =3D {
>                 .compatible =3D "google,gs101-acpm-ipc",
>                 .data =3D &acpm_gs101,
>         },
> +       {
> +               .compatible =3D "samsung,exynos850-acpm-ipc",
> +               .data =3D &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
