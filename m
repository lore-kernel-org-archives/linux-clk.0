Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48F59153
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520821; cv=none; b=HJqy7ryUrzJ+DHA9DQsZ7jjvZOykFsmh0M6tV83UrFHlpJJNNNS2CASbeQRhyC3XzhIf2yUz+O67Pgx7I38soDRKdwsnEx28oqRzI15b4li6gP/UVI0cxBgYMjfPwm5mp8hwonLPj+LKZM8L40FtGad6feqcE45kB7aa2/Yg6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520821; c=relaxed/simple;
	bh=F08uG1fFi/fLFDzlR0qXMroCbHKufK1YlVSo9WyAdiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G37ljiR7ax/K62blRv7FabDvlb4Cw9X+ijWqT26mtCuAC7vI/bvDnjk+npq4gnTjAt80zItnw60Xc3gwQsNXMzr6F4+kNADf+RaCvkQCaYzI69G92unn3NqG9YXOMdh1cbBZYmIbUUwviGG68Z6b6B9QLYCUZilzJnjdkieTQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJQAqNh4; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJQAqNh4"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783f49812aeso102039685a.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706520818; x=1707125618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/A92MZzvjUr5qNJFHAqRjVJ9i3IKPry+qg4x9OfXy0=;
        b=PJQAqNh4t799Ryz4IIcud2cjjYwaXZ2GXEfSTscpBiy2pT6OuerjJ9yQkGN5suniUr
         0uDP6TmaY+1dXVI03LQCJMgziocO7nemsXaJGxU2Edb2aOQ/55riLiqXWLOh8QxTfqZ6
         5YYcD6T0KP02MM7v7M9Ml2/nRBkJiL16u9H62zdeig0Y1L0NvrJeyhazHgMgFt4UYN9D
         EuAOr5vraINBgpKvECupGO8wh7LKmSzsmo7GDy4LOXikfvpG0zGk52/me3JsCM3V7Sk2
         kwujUuD2S0JoJQWYwAWTLTvl/aY2OKeRatLHcgP++kQIQ4+Up5WK9dVLV/ak87NTJneP
         GTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706520818; x=1707125618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/A92MZzvjUr5qNJFHAqRjVJ9i3IKPry+qg4x9OfXy0=;
        b=DppEoG0RCBYifdwDOG8qmH4wkhuaqWBt7/wjzwcBxjBo5lY+EHgrOZ6JNLKBSpMbeI
         zq9FfEu1B/QzH7rk4qkFOXO5L1d9hqaJqnnPgc14lytKDTphwH2W4I5I5JYRL6cP4OOJ
         2fdqaIfoGDP1xQWCAbmq6spihS+mweitFqhGnbY0Xbw+miqyjHAXyeLCeXT65u3OCV8M
         H63PDM+bHd7bO49U0Lq//8qWdqV5xiWrceHA6GBanbqSmqDsNvqImoyjIZDiU8SyTW/s
         Jv+ldhwAiFkMtVw1XJFN6KgGA/wuZGzRLx10lBcYvJ5ZoZBeecl9BKG8Qd261pSW4+FA
         bJrA==
X-Gm-Message-State: AOJu0Yz0akNtVTlmdW3rLlwVIMmv4tfJtu+whSEmTg9qY5rbErj1ec+M
	P89WL7H3qbC5moJrkpP1HOXpzuPsbvitodV+n1lmdEZQA6x4on7LFJdMMRr9PDrHyeLuqgpscym
	k7NL1I1PHFvPaQG4y7QZmF4gyTjGiIJbA+qRISg==
X-Google-Smtp-Source: AGHT+IEU0GPPlIF6iHh/5UWCSLCCIj0jEqEODZOMhFSPXOcrOtrk2N4luE8XcYROBlvPp88vlBopAUq/6j9ZKWTW8Qo=
X-Received: by 2002:a05:6214:c2c:b0:686:abd7:12c2 with SMTP id
 a12-20020a0562140c2c00b00686abd712c2mr6475664qvd.122.1706520818159; Mon, 29
 Jan 2024 01:33:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-8-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-8-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:33:26 +0000
Message-ID: <CADrjBPo5ojYm+Zg-d2qvZJmTbG30QR_z+jdSsbx-ma_Bfe8uiw@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: samsung: exynos-sysreg: gs101-peric1
 requires a clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Otherwise it won't be accessible.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index 33d837ae4f45..c0c6ce8fc786 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -73,6 +73,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> --
> 2.43.0.429.g432eaa2c6b-goog
>
