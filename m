Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4E4CDDCA
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952236; cv=pass; b=RULaOoFJHcr5QawDNxQNHNDSLLUjksA1zbKD3kzeI8UWrfEPaEGUJ3Cm+4iKRzQ3Pdx0S400bGLlhV6fPJ09rVGRRm6BwcTgO206DBBtc/+eGbQrX+2Z/cn3xYOCMT14vIdCT8QP/7np2nccODX/0i+xImk4hCjXERQ3efq95OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952236; c=relaxed/simple;
	bh=ciy5AYs5s8nztyVhIOwmEsvrjTLJIlrAEhcvpdlNER8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQ4oSF8wxFKdMt3/GPJN/E9ruKRH+UQ9AsQZg27VumlqTZ886P58l/39+Gf2VhWJzec+pQN23ZX9T/Jf3UD0TGYgL/u9e12hmpiJbrIV6FqCGwArdZ73v+wSUMlKkVsJdsx4W3HW6vubIFk9Vao3m0zYGhz4MR5QzxKtUTBxDiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCF3L400; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCF3L400"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b314b72db8so2397899137.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 07:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952222; cv=none;
        d=google.com; s=arc-20260327;
        b=diXy5to6sfhYPoRr10l3hl8ADBF3TrApf1Ub0fPXThR9zH2FYNqlj17S50eO4cIOqc
         gEstnqV0r76eA/w5Qy6OScLhVySeVL0ZcX7LtfLGadQaRbz2g74BWB/CPsk1hKMeStGX
         ySE/bCcwCTSMQtfaojsCwsHmdLSTmguect5FYPfI6/ywkpC12Ox+FKR+BI70mqdCZOqj
         k1cqmmIyJ/9SSolWKMOARaqV4BU35hMoYkrtEuBrfWukteBTyAoGju+xwyHx+UkuU2UK
         HP/SprE0wDKWzRbkkS52JVuI/XN5/GPIotS6ihsdMbwep8ywEUEXHINrmP8n+YbHFcvj
         sMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        fh=QsNOxM6HsUN0V9yDf1OgqP6zBGrdur2nY86QIXakOsI=;
        b=RWVCp8pAjbsVDR0j+56g8kYdGuwqj7W3iQYYwTBI31QulwAj0iPFhoz7aoHbia2PJ3
         E29V+HmE+snNcO7oLiqEVodJRIUizuRXh8SVO/WLVKbDavje4eC8HzA42VI9MJspT4ct
         NrplzmgokgEYXFDdDc16bEEjzdNWL/JldroUWSRcVfFAFnlDyW7IiEfAHCDq8Zsrkt+e
         rAd8jLtWYNGkWNVbbzEBhqMXU77mEBveO1nZB+MFwwXUfX0/NkeuxAAw2TuYgG7/gfaW
         C4d622eLVam7dxQkUZ5s7cu2F6e1kJ6FG3sFo9yc3fWXuFnFuHDEZGt0aUr97fsgikEU
         QL5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952222; x=1791557022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=uCF3L400Mw41pP+ID6dTCrQn/Ou4FPEJbBHdeII18Hoz2k1k4rre1rJFIAO6bUlwre
         z6gRPhTpXcPlz3nq0557AFvFh64IkDhE8gu0hkTjEtYc2AALo8ve7aHeBWZgT9kS+qGm
         Aahd4jObOdGpUC05G+dt5DQuF+dhHOuKKmZ6W24WpocQRINW+cTk76pKa47/8kSJj8hq
         vlvzoyk+5wxSfN4jV0Sl34fdQ36egSdDouJplkpNq5THjyyVeVWZqvL8by+BiUPNF7Xw
         3PiJS7vaaBE6zz6Q9K+202iOt1HVPlA/GK7GXLGJs75ihgepxby2XEeWJJsV23G3G3Nd
         ThfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952222; x=1791557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=EUGWOC3saY5ygINbJAn9RNJHasuUcozC1RXhqh/hHqwhTH6AcoeFmlDx9whbfyO5aO
         q69ri7DjKUy2ejwS0VJHy0B3SIkBxHYMkpSTZXvIEVeruoGJpwi+X6A7QqP34XRhJQoi
         WtUPMX1YipPNqWW7fh4NiSK4HhlN8I3CkgKFfD/9skqVOBYG0nUW8fkBXpU6CEDwUP6a
         JJEB9WsGX2kP3mhhY/FMqm3kJX5P4Dbka5ppZzah6XCy+aOcL4e6Twp2IxJ19e8RZAOc
         Ih80K2y9Y7bjVLaOlpBOOa7NUVyLtwwnbfO7rmDYMcgpTvijzdb8l5alwSKjR6+W48pC
         /fqg==
X-Forwarded-Encrypted: i=1; AKwUvByAPwYed/NnjxcGrgBD10yZK0NPQ4kjpOfZZJ8gx+rWdpUnrAbAjGnCTIP0SgK7ueMv/k/kF/3oJIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/pqkUu+uV7syG4cf15VAQcRWJ+lBVoTg/uIm0nSSqq5FFgpfH
	24O+EuEveBOAeaZLOgKCTduuVGs4Uz4nNS38sHlYGnt8Kcz3bDkcvMXCSeNzh2P6yahPNhozjt3
	ss/9/IDzoAtycNPlolgm8pTMKXBoV2CSmP4H6dkKFnw==
X-Gm-Gg: AYBFou3PgYIfeHbu/S/WFyyNd/OhzU4JA57eFvWzMfHesO5zCGYcP/ZQNvMAerorAIL
	3k5tU3HIqej7sefgdJyFk623N6nhwmG5URFaHxim1f3WbdacSWrZ0JV4mHehJn7ynNR6iiJSu6/
	8XQC7+oyvQa1nLhlAImBr82N7bc/dmXTBbiHnOHoBsyJPfAhBZ3Zs8bay3ma97mT2esKU8JimAF
	D8AANfr6t84NOXZip1OAH2CzOG3tvt+NfQs5OAwODTuiDcppOZCvOS0P59387ECtBrsZuY4Pp6Q
	Z6i3rfoq810mNEYqMpGtwWIkerVyGjSyRgWNPV9Sr7+HISPqqgZSY6m5Av7cbYDEF7lIJ6mEBdx
	LVteBUye4W2KzkLYz2JtCO/18
X-Received: by 2002:a05:6102:f9b:b0:7a1:f980:e936 with SMTP id
 ada2fe7eead31-7c0f51a9b92mr610476137.18.1790952222091; Fri, 02 Oct 2026
 07:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:43:29 +0100
X-Gm-Features: AclHuK-HUUsrOdFljkk42xven02N-tiuZrJ__yBG6xUzcagLPJ7c3UWcflomjnQ
Message-ID: <CADrjBPqi3RWdUy-S2Vn2-E6h0OGhrFPWEcKcarswivOdPzFTKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 03:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
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

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
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
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 = {
> +       .initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name = "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
>                 .compatible = "google,gs101-acpm-ipc",
>                 .data = &acpm_gs101,
>         },
> +       {
> +               .compatible = "samsung,exynos850-acpm-ipc",
> +               .data = &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
