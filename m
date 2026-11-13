Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567827;
	b=RgjzfNUviOm9oqk1Y7ACQg9L+N4BTJiZYsJHCKgTLFyde4vOHbIlN4qt7JT6cwMHBkgk
	 +IcT8TZMQCsN4RzSg9RIzfRb49dL5gqZlinNED0bzW0Xmnw1dpMia2RiumSvgC8DCVEaR
	 ODVcxVFfoS5u0rAnmK/TynbfjK1BR3korLgoGsEoa6EpH/k97BwQqYEQTwtNa1m5OVvBg
	 r3DyzFLhpYsMVTfdmGMabi3vxSIOeE84vL5sdk1n+azHNp7bhYsRhlD8uQSr7tp/x4uEG
	 Uckxwv+F9y1AEUphPUGm6PVJFYAavg34bP37rSszSdN3zzSeb5Ib610sCz9QYNCPSBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
	b=CeY/G1N3E8hHlwVqEqolRTFdWgv/mMqNGTRcGjJ9Ik49Un4txmjHeXvkOpx70ZfFnUKy
	 O62QaiVS+kWskF5gXg7OA8CPTj6SmIOwgJSDtdDK8lPl310JViu+yc4N4w+lWvwak7rTt
	 kmqCD9/FBbOBFgQjk33ASvmRAbs48hxVkfguCFlcOydH10rKUfzfiHy4HiMgC61GssIe3
	 Ey4NpxAjo6iDL73AQiUaGYoFgIWKbJHCYOAr7lLuPkM2zKYeIlKgEu6mv4XMWRU6GWx4N
	 izm+OEMRFwlyZ8JAW1z72RVP12efI7CpX4z0iy5isQ0vE5OqZ5AMZF8wN5LeK6ATO8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706E606A89B
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3706E606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1247332a12.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567825; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzwT+xnqyELvG2Bw6YcPhyRLBI94UihZKPAZVKv2rRiKS17A8Gva3aBy5E9K6wsAO7
         qFjQTevD7n/bOyHvKM50u+Ux/QIbRpznACqXs2fsELBZL4T0qc4mzqHOZ1cV6S0QnqfV
         ZhCsXGvCxxyiUHQXf8nzjBkkFOeULocZVQ55a3fenPH2yxgOlzLKDtvnVXmkQMNrKM8e
         tu1fuPcsaJcfSrxfv8LPjVjDJopcKY64A3kGbzv0fK2Wo//sx0VVdEUoAkkidL2m6D16
         i5xMOa3gtVxjdeSwK3FfjBQkeBh4Sn0+5Ey8BWyZCIXvY/UbayMT6gpNCsYXqv1wgTBF
         i2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        fh=o2pQ0K359YNw9XMfTK+m56+/xeNt7SvJz+qNOMMJZPk=;
        b=M34dh+xc1DfeKoeKrx76U174gMVjQfU7SiJZtTGV1HQt9CuRgSRqltdpbwo3/GuGA2
         QbrjWrFA651H00Bi4A7MO4KzNYCfeAVO9Iteb2ma4eM9G3o8Lf75ldvC2/nk4Vj6PYJg
         Jsuv+9t3kDDi6y2bsav4t+cFOdnMFyZI852ee9/4K1UdPoCDMpj4ESLvOpnSbKxuFTRJ
         uPYUA6KCtviZS7Rpm2U7ha1+mBU/2DqYICKAgBLwzqKgAgh9noljc2taU9oBHIP23pTA
         Spyg2EQM1A9giSYmKk1aGORknjpJWmg/5vZiQSsFsYp10zBLCLHaL0bRfJJkLIwKzAfq
         rBSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567825; x=1795172625; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=uO1PZR9z6dSSdZdruiUCP+ylb+AYRNL3Bg9MtPyNPpe8quBN5+x0kSfhdc6XsXvP2l
         1EWqQ7J0agbDYHQH0axqwgMEmrDrhg1Oc3m0uRsq4mARWFpqfAlD8wPuiR+2zD/3uQAc
         qgBCiukndMVmJs/IVJpM4hd8qCyxWsLVVoqfyR4MHzajp1b/LSldKdhNuz5xTQf6BwtW
         G7ZtYItfHSpGNE6iBtAws9xro9RsQwnAsuAKn7ImZtuJ2ZhVdKtgkjXPgc1xO9XBrdh1
         DQ+AxJpHhiSmL+tPFg8JVylQURvnnB2fa73o0q3biC5HUIGOevOCFFQGY0cLG1WYTKPB
         RWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567825; x=1795172625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=0sJvRe4UYLk2zu9V0kh90hDj744btt5hQsCt6e+oiW+NcwwCke0dF31GuQF4sGkopt
         PQ8M308Q1bi9eM+JS8tHrE3shkz6AVr9ySv/qOdqyzzSWdevd4Qb0qkn2JyWgCjTXLy0
         6fpt8WwtaumrlEB1467h1wKR8//VrxlgnN/PY5n/ThLSEaAvAfvYUCesN0xY4TVzWILs
         2hFQPQWQ74Wpo2M9Xpc/0/P9NrfSRhtFKZvUzh594IbHOpJOGz+bVk0ZOhfoeva2R4am
         GghKVWEwyF5MXcX6P6ATRnpVrJbOCuKKGui0GH5YA4nNqKmjPBaJx+J8sHWLTS4r7IED
         OuRA==
X-Forwarded-Encrypted: i=1; AL+hErGsVEkTa7jLuYaP9nUVVqcXhZZ092ZOHuYPUjJdPBSSAJ5FMWvxnkkBStXIAVUvUNRvqTxmgb3Tfds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CW7eeVJnBeav24Ln9WVRxebubnpq/5qQy4BGE5uKz22uBNJTH
	HR3cF4OKV3NjEpdQe8xLM95K05Xfp09/66KMtSaRENbQ3hSTBs2Fcq3gwnb1cFIEcwb2GR/o5+Z
	avrVkpPm1jWdmwRqw8DkkiHexuDkIVNO2ngIwcBQvow==
X-Gm-Gg: AYBFou3HlGBag1+J/zvmkZjV+mpNWUMW+LIlWCxVPypGpjJvDYi6gh2UhsI4aGhVAix
	tJ/UX+R4L25qv0tV3RqeU5HYj9Da+6RqZGh73evgLRMxPxghXba6pbxTk9Ipug8grh2/euroAhz
	vs9SlbZRLW1+SoQUUo9FPjyhgLIigRZKLRQ2cSA29VjzW+zcxOaC8HcprbBDtDa3zYnVPmQlzXq
	mruxUScJez4meBQ9vqMBEneoxGQNs3D3M0Ew9IPJIC7xh1CPvgTaGjNOwi9WKWB6+mAyYMLbmQb
	cKmDT2M8iGU4GJP+nHbUbRER/i5ATT6fu+ZvX1jPPljtXfetJj56SaGS2B/ack8wZ31Uu1ukqI8
	QG5IDiKNaKWoqaphn6JIJGMs60eUX4A+PfIvvpFoESMc8hjQ3CYjPkKlubBwPOPSqkT2gDg==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr1814259a12.3.1794567825002; Fri, 13 Nov 2026
 03:03:45 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:03:32 +0000
X-Gm-Features: AclHuK-nQAzdHNmzELAlgOYeQ9PIbGnRzQK2xJ_UxA7DGsqbyIcTqa_Es6uaAxk
Message-ID: <CADrjBPpUSot+jCUBKb4S4A8C5HazvqQbB-+wDvjJtjB5XGCytw@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_USB
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 21928235d131..c68a64eb35c5 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> +      - samsung,exynos8855-cmu-usb
>
>    clocks:
>      minItems: 1
> @@ -143,6 +144,26 @@ allOf:
>        required:
>          - samsung,sysreg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-usb
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_USB NOC clock (from CMU_TOP)
> +            - description: CMU_USB USB20DRD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd
> +
>  required:
>    - compatible
>    - "#clock-cells"
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 67cd97d8fab8..f4261956ab4a 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -222,4 +222,12 @@
>  #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
>  #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
>
> +/* CMU_USB */
> +#define CLK_MOUT_USB_NOC_USER              1
> +#define CLK_MOUT_USB_USB20DRD              2
> +#define CLK_MOUT_USB_USB20DRD_USER         3
> +#define CLK_DOUT_USB_NOC_DIV3              4
> +#define CLK_GOUT_CMU_USB                   5
> +#define CLK_GOUT_SYSREG_USB                6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
