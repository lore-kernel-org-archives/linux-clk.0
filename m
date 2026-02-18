Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037843451CC
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438151; cv=none; b=KfiVKmeSvi5barDfml5qOtgbKmLx1y4u/qe1oIYMIYz25jBsY1i0GtQxTzYaVk47/JNNBacUYXC0gbOo4vOcHenYR9sPKWnvBdxbr56KAQkzCK9eHkKChj/oh8gTH7oXj+NcZdX5ZUSnk19uG2h8lddceZ2sNaPa7qib3zC8Ot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438151; c=relaxed/simple;
	bh=yEeYbKwJ4dKz6zZmYCTVTgYkxo4KJMNXH37g/tTh02g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jfcdQIPl2vIpO0VyibBa0cifZcW0MiMrGLKJ+pp0P8bZR49IB+M/cL1pFLCc/cDt0hXKVyyJYiry/5Yx6K6UD2Lq20J7w7+N7+aHHGWsAgVGFifKB4+LOJbvdK4NddK9DAKzhIMmskLKj+14IlHvqkePcGcMhxzGVSF4IQNM7ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gGDSRIqK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gGDSRIqK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so1263175e9.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771438147; x=1772042947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHxKKXGBHlMMgCTEd77iJPpVcu514Qc+HROZ7KUYSWM=;
        b=gGDSRIqKU9M+Tl37QS5YPOi3OBQ6cBupJxBijYNfVNrCbcb+K9XYW29P+SInjvhc0S
         W6egA1GNhrBHaA76g/guSMtDpETkmxHtADiyKh018uNzaTB0bE9KypcvONyf39vcQb1i
         5c8Zmui3VPKHCbW6ePRo/APYLpUdR30Scsag+C0yUYOKl5eBSX5/yru5iAROZqrM3PrJ
         sLF2HW/0BXfr0yjJJYmpkem58+75KWcyeG8Kogg0QOUl9LwqE9hij9fLSmImuhy81Ebv
         QiPgUK6SLmGXwW7VNpWNgHO5IUYIxxP1ZL06CXrRALqXVZnC9UzujfRiZNhcgajv+4vG
         FYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438147; x=1772042947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHxKKXGBHlMMgCTEd77iJPpVcu514Qc+HROZ7KUYSWM=;
        b=YjbSmRQs2EsLKMlEWnEfZC+N9TCdDocI0CBpiRnNGQHjS9vntiD+crKMA+vtGzHz7A
         1fdh6QgfsLAJHZX/R7bf4eZMWBoMU63SLywiCoJ5qKOcK3YX9Sg6ki3rJph9pVPwPLIY
         ZkH+ZhR1+wRv67ufvccAXCnfGCdWYM1ER/Q0O5It27raJ3OuPMeYDfGYZ1+WQ9JwLivf
         jUjufOIz8rJxtJnqx5y4TUU+KKyENlEMbdUFsKvSVZkfr4dI5YjtoeWNKsUvaqk3Ql4d
         vyJcPIiE+XOt/c5+39hgXUYiXN+CXvhCRW/8YZisv++ABmJmSUPbS1o++YkWHPM6qvOm
         yQbg==
X-Forwarded-Encrypted: i=1; AJvYcCWtq4LUEMZ22CvqOtV0i3gGtQKZIq0IBAwTiG6IJNEmCD9TZFGO32aMN8vG1usCS/i8Yv+ofNNiv7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNmapWJS9OfMaLTzOH4y18q7blhVf/9FWl/sLUUnH8tALqXa0A
	f1dJ6mS9Hqlqw22k5R2Zg4cp2oJK16RcZ5vHj26l//2VUF/lonLYNXTSnXmCbMBRskA=
X-Gm-Gg: AZuq6aIL7hvYYEpEj/Lo18cm+Q+P9sNbkl0IU5/Lx5ZMcWBbt394cWDVtF4mzG32epj
	a7IRMonxGRZRMKmNZc8Mza/dQEdbh4DTQeKp3b0uiCuKbx6i0DwiT/NJ7jV/0aaMEvZp67xkg+V
	KQFFQQK1VJBoUTnIBvIwk0iumeXSGxx5EBtnQunoEqjGMjtSOym7ipw1kGt5zWGbvY/IkmPJ7ez
	XjWsIyZMoacsTiR3YN65BMKOJXSTPXDwDHRGUvTeUhb6QYmFyFUB0Vuiled2Y4XLZumFH6ZIF+v
	zvHA68/i7yTY08EjRDoL5ZLMzRowez5lAd8yPGjot/JjcQDIVHreFUwGfkjCQoB+Kx/AOs2fWIx
	mUYGxKfuuoxt0htyrzsIQIDusjOdLgp8uuaYZzDoiaGW4nV76JOPpgUe/5FP2RlgqYuJnRzwP8D
	nOtlIwu8Po8XVlqRTMbj1KWw==
X-Received: by 2002:a05:600c:450d:b0:482:eec4:758 with SMTP id 5b1f17b1804b1-48373a4f05bmr316456575e9.26.1771438147319;
        Wed, 18 Feb 2026 10:09:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4835dcfb28dsm560787365e9.11.2026.02.18.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:09:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <20260218105611.36216-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:56:09 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105611.36216-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:09:05 +0100
Message-ID: <1jy0kp6i0u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 18 f=C3=A9vr. 2026 at 11:56, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add PLL for the clock controller of the Amlogic T7 SoC family.

Usually bindings changes should comes before the driver changes in a
series.

This is especially important here because you are using the IDs in the
driver. With order used here, bisect is broken.

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt=
-bindings/clock/amlogic,t7-pll-clkc.h
> index e2481f2f1163..690421009eab 100644
> --- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> @@ -53,4 +53,20 @@
>  #define CLKID_MCLK_1_PRE	9
>  #define CLKID_MCLK_1		10
>=20=20
> +/* ANALOG */
No idea what you mean with this ...

> +#define CLKID_FPLL_DCO		0
> +#define CLKID_FPLL			1
> +#define CLKID_FDIV2_DIV		2
> +#define CLKID_FDIV2			3
> +#define CLKID_FDIV2P5_DIV	4
> +#define CLKID_FDIV2P5		5
> +#define CLKID_FDIV3_DIV		6
> +#define CLKID_FDIV3			7
> +#define CLKID_FDIV4_DIV		8
> +#define CLKID_FDIV4			9
> +#define CLKID_FDIV5_DIV		10
> +#define CLKID_FDIV5			11
> +#define CLKID_FDIV7_DIV		12
> +#define CLKID_FDIV7			13
> +
>  #endif /* __T7_PLL_CLKC_H */

--=20
Jerome
