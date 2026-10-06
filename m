Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1D21D3E8
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 23:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330468; cv=pass; b=l3rj4iGSdZhN4avHeik8w30f/hBGg5ZMjgUqSDtdaQTwBbyGJ68Ii0vUwnL0ypEztBThbMy5Cg8ZdJgVVyriBKFiN5WioKnaAmVqsGlE9RWju6B2Xol6a1+Gw1BeUO/3rJS0lZD6f1vdKGjoTeeks8kAgOJf8DOBuev84PAxqJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330468; c=relaxed/simple;
	bh=gexAZAM9D3qySWszn5uyjGHra9XjdPZHkujc4evGP1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKwT40CbFr3EYxeRzVo0zJkAvGTcwaTE1yz7eiz4TZnB/qkG1en9FIBCZlOqkRA83GgG3ojgh/ID1jnEHQmTVv/RWWPGpe6bIHZfgSXkBvQRwq4s9ku8REoNTkMDpZicIMmfIs7tV8kVG8hm+y/D6Fr/yuIhEp0xFepnF5+OrEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5uSQHkJ; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5uSQHkJ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ac4806e210so15313507b3.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 16:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791330466; cv=none;
        d=google.com; s=arc-20260327;
        b=I2RFrjGEpx2AYTTpde36JLQMCMpUpqMEJ3YgBGKBI4atTVR24NEKKje3h/cjYtRVVV
         aBahkBQOWyhFGx7bWjYb/6h3hKltkaUJsS41cy32LPNjiSctShgWTpbaPZoYVJn7UTHz
         jczQH8Y/hDQmfLhGngCy56wttJ/Lv02N7uWSGk8aFGS/PNmZbZ99vR50owV8ZggXlZz/
         SlAzyVUQ2blDjm9qQ857K1RdSc6YWUbBy3PsQChAL/7Q9LSToO3mk6Q59N/o4feRsh8C
         a+XBkZHcLp+V2UZHQrBuft+grYOj+Wdmr3wIgd5wm7Zxpyu3aH6cHIx/c7LwjPy1sTva
         lPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        fh=CMmxBd/Ij44932kNVTjUigFsWQaL2/vuNTtmu99bv9c=;
        b=R3fHwgoyJzXu5Ev65qyE424UeWMqJtDg6oMnjCcGbbvHzaluO7DjpQBibgaUGqCrV9
         ktn5Q7fg80fzh5NfTdV8RwV1E5vZ+iUeWbT3hkBAfwNdOCJP2em6W1cttKCLd76tKNaF
         1g4jakqiWg8lgwdEjhADifC+U3KCMKj2EUOGBu/bmEkA+TDGoYai82OC57O8s/SGNpBO
         QBIBDiNZrwK7J37xYP/0k4C7m3+B+SmSDqoA6gGh5YuR6pV1aE+oDYqjOw1pmGyzpgEN
         eMUU3G3o94RHkbZ22sV781tCoVTuDYf1zmDVRjb7NnLOkp05dBwzHl7PPyvydvq+ToEt
         2ruw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791330466; x=1791935266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=k5uSQHkJUU5uCBUJ2iMCeuQk6NXZ3sTuNH1HFWHUTegxMX0jy9NBHan909SUQ0+ulL
         Mg4ZB3qqs2+sFYz6Ql8v/Xs+/ZQFclh+EBoDt+F5dsheXmjl9/9npo92PCaDoDms8eTD
         esdlek1oi0tHoUibqyvwWKxfcY+dYxN6DzksCWOjtNKINrrnvU1ZmNlxDhob62hHROES
         zfPFKAquppldgh2dL0v+kI+jZkr/hRMMdFLJ/7lNyyeMR6LAzZ1guAywK2LukAlsmQD6
         8EfcBLPT1P+8/CMsC2bqv8PP6LOSYBjDkZ1wbGKJ3YT0sUlAfTiU7BuCMSSynAA6XFmh
         36CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330466; x=1791935266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=IFEPpqAG+GiJpveIDB16UwO0qTEO6j1ZrLXNudChsswHj+hezDZZ9rFKBsWHiKc6Yg
         4D8XnN2j3wSzWlhUIelYC3YyDzVt5a49Dy/+/wbCoZifdekRGEzjb50XUdoWWlFBIUMH
         g1J3bcGCIk041rg8ABpcfegvVDpMuabPT1NuZPrFokhY0uXfxQi4lifVZR/VwPciMWsD
         Dnm18ZY1XLDEfKTlRrJf4fL+IDwiQGF39kWzTMXm6lBLBUnRzZzdGCxBJGsYgJFCb9e4
         Oa3XEYcmyo4OofYWRWVdIpooHTeOpZ0CrpY+5SwPvLoW8PS5eh/MsxQcB7+D0MC5jmJG
         C6hw==
X-Forwarded-Encrypted: i=1; AKwUvBz+st6WCfjrNJ2rAu0V5FQgyXOCDVckQgiQYviQgSkWEYS+hGpIYfXtsVuFWgrBlsqiB+IOHrb06cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcaMh/76IcJAWDdHxiOVep6goMGfNP2R5CGcwr6Zl9g48EH57P
	ol4IZpd2PGBKp0QJVsjxh3eHxrU2zAWbPJlsHEjwtX8rw1xLgFw1K3Uu2DLlvioZX9mKzV9HdYp
	0K0JXR880n8F4XKhHN2nZp9K5ehETIBMAmFqhqIG7lA==
X-Gm-Gg: AYBFou3TKq+vM8plchOPBkNC+UWIr3U7PldfQ5DVD6zqpgdOOe8YHTC28KConm78ZAQ
	a3hnZCm+hFJJ/Tyv3gG4ryjuAz9rSKSuv2mQtdo9WVt2+aNRIbYO1FKfndUAtIE6iELxym403eY
	fxmQ+n0strLdREHrKIzpeMob7xORlrZLc/yg57nXgkDzuNB71ccGZbhGFr03yLgOzcWmyiHL9QZ
	f/dXMQVhz3ERAkaJSNrWS6GNr590hZdjbw+KWXI4IH8KxM5Ory8b+lq5u6X3wFMZbf522P/Birt
	86fw7ItvXwLcKWXdzKCDJzCt0u9P0FH+75gwqwYHbdQRSQYb0fl+5E4h/hu2ZWTPv5pB391rVgf
	+67cp1n4pybSDnA==
X-Received: by 2002:a05:690c:47c9:b0:8ae:91b3:f0a2 with SMTP id
 00721157ae682-8b05b01c13dmr5311187b3.20.1791330465608; Tue, 06 Oct 2026
 16:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 18:47:33 -0500
X-Gm-Features: AclHuK8biRi6brKVjnQsgRrEOJZ8txDP9zLFZXlunl0eP3sSkOkiUAUTUCWs2z8
Message-ID: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
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
> The Exynos850 SoC incorporates an APM co-processor. Communication with th=
is
> hardware block is done using the ACPM protocol, which handles IPC message=
s
> for clocks, power, thermal management and PMIC control. In this
> architecture, the ACPM firmware running on the APM acts as the central
> supervisor or arbiter for shared system resources, handling requests from
> clients or agents such as an OSPM. In this design, the OSPM is one of
> several clients or agents communicating with APM.
>
> Dedicated compatible string is required for the Exynos850 because
> its firmware utilizes a different initialisation data base offset
> (0x7000) compared to the existing GS101 implementation (0xa000).
>
> Additionally, the ACPM firmware implementation on Exynos850 does not cove=
r
> all clock management operations (such as clock rate reads over ACPM IPC).
> To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
> called domains, add 'clocks' and 'clock-names' properties to reference th=
e
> underlying physical clocks.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines f=
or
> Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
> specific PMIC child nodes for Exynos850.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++++=
+++++-
>  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
>  2 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index e68f9c3ca5e2..0eaa9c881f6f 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -22,7 +22,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: google,gs101-acpm-ipc
> +    enum:
> +      - google,gs101-acpm-ipc
> +      - samsung,exynos850-acpm-ipc
>
>    "#clock-cells":
>      const: 1
> @@ -33,6 +35,20 @@ properties:
>        appropriately with the clock scaling. The argument is the ID of th=
e
>        clock contained by the firmware messages.
>
> +  clocks:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      List of the underlying clocks associated with each ACPM clock doma=
in.
> +      This property relates to ACPM firmware variants where not all cloc=
k
> +      operations are implemented.
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      Names of the ACPM clock domains corresponding to entries in 'clock=
s'.
> +
>    mboxes:
>      maxItems: 1
>
> @@ -77,6 +93,44 @@ required:
>    - mboxes
>    - shmem
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-acpm-ipc
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-acpm-ipc
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            enum:
> +              - mif
> +              - int
> +              - cpucl0
> +              - cpucl1
> +              - g3d
> +              - aud
> +              - cam
> +              - disp
> +              - cp
> +          uniqueItems: true
> +        pmic: false
> +        pmic-1: false
> +        pmic-2: false
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include=
/dt-bindings/clock/samsung,exynos850-acpm.h
> new file mode 100644
> index 000000000000..87fc6ccc1d99
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Device Tree binding constants for Exynos850 ACPM clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +
> +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> +
> +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
>
> --
> 2.51.0
>
