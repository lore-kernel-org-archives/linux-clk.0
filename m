Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567470;
	b=qzHX88awNl9i29Oji0RzG25CUZrkDNbRVHKP2Iq+UyBZ/13JoOrNSSdwYR4Jl4UfFhWr
	 UJmMF+6spv89qi/YeeENnY+5rZ9ZHyw6i6JU1Xm0rr2o5ANbI86+41kIbh21xa0+ZRQUB
	 Aayb6z7eVx+e6m8MxsLDaEzr8KLAdVwf1m3HsBI+lLNk2XO1VBVizwpzjm5vcO2+Vvbv+
	 AYL76VMqSgC271psz8XzWADAEI0okJgk41UvlNnGCYevt34lKWbNDwZORh3VezckMWnks
	 POm7Z0anhDHKpMtZ0QvqRjjMA3XwYG9SHMvChvOWVl3HuXSlj14la3czDEtW7dFwXHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
	b=VwaqFo/ZtTgViVXOr8kSI16pXytiLogxrceQftHqtfBkfT26MCcj0qSCMeMETXSqOtKv
	 h/9gAz+2/50j4wbQ5uOLCQkD4sjlHgCwfn/Yted8g+bB8b+PIxZ0Mg7ArHmYhuc/aT09m
	 qyP4I07m0r0hjQfwP9xBWkTov73ZqtkLgGEJC8TMA1CU7omiAVVjO01uXFurwQrpUkczD
	 L3b9edsklX+GRCXm0pAEiUcu1wNkUUmInm3kXB4lQ56rvzKzffGwXxwrYFBIfgYG2nm+R
	 qOA1MsQnxeotmPUxGNvqGuPdVx8MBq6J/SCQcOcIt2Cv6TQgoGqyPe5JQEoOL7zJzdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7C606A8A6
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE7C606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AeF7+1yG
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1455408a12.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 02:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567468; cv=none;
        d=google.com; s=arc-20260327;
        b=iC9xoqIQz8SJdfDcp3Dw4Qd7NYQe26T1OUgCOMlwCA3mypTKA2/QOOqyAAhJsfYzXb
         o8lCP1oDcZCLxzLDfLIuAxlCjxsgXg1k/n4XT0e78vua6wmHEKu1MrwVU01Fegi4yc0y
         8Njxn3S5ppk8eYUWcNQfZGBUGtA9FgnowBSWYkUuUia+kgNJFqVp9xv9olijZOPxZCLT
         GPIkqurE4F1a1MBlXHT0SD0CvWlauCCWe0W2X9O0t7fGyHmf0Albiksj2XF/nbDnzw3Y
         Hm0mPnOJ5nM6+Hnu/UfFHikjEjkRmnFoylWW5GV1p7E+8x9i48XlyceoIcA4NY6XB62j
         7h4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        fh=uWPE7wKlxhPy2Z1oUKIS0Azw8pZ23iPBg4DRaKSiqX0=;
        b=pgXFdZpybMQCJm0NpY1QrXU9+1WP6obQHvTrO49nJr7q3NjV5g+vZrsD0YGnUT0pZ/
         hWYmlAI1ln87i6FtTbSi11TNi73ONP5KmQ1Qn2gyJmGH31TGMlNoDP92F26UEkNRSRHN
         enXA5+lLByrjhmtPjJLh3ooEPrymbeyrqeQBY2gcfVeFCofJdc7EmNEKtBhDWR2NeG65
         Vg0oa4d1I8K+MoEfKA5MdA5KTKCnkO7W1WqDaU+HpfqpYsCff1Euqj/nz7uSm+WA4mlr
         kwCAP4jU6Og5b0srGd4ZAJxoLLbhyYwleXozpEOnynBj4o7mOD2VndYAZjrkhPLIa/hM
         VBpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567468; x=1795172268; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=AeF7+1yGPsZ3QmfWQDKuaH4XlBf4fgKulM1JWAT7w6hasBaoiDc0GGcbM20gyy7oNO
         j21U+7iUbis+Xdebn4EYFBsDglN772fKbxdeaNCqRrdckQJ+dnZpTw0UbxbUXvnZpwLZ
         TPrEWOrDkwKj2jh+YC1sLLS3RqspzA0MaL83n4vmbczTHKfypWXugHYAAlWxLriOhkHQ
         e2Us+G7V8bFuYV08OM4oEXyilnNAwYBkC5TnpOtVOQMrLx6n1DKbY94g5Itgp5Io33rO
         OAXb5K5AuaxWrM9wvYxoqazJJK7V9ATH6tH2LjM3Anjr5F+ht0QWFpjenlkz5qwjM/Kq
         URkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567468; x=1795172268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ITo2z6iHp4Fr/581PoD6+mp3Wi9H+KH5+bmHlHXFqw=;
        b=FkaWHjmI1uPiN7v9Si+6GCgGg3Ny0EzoZX6V4vPGSVdbKZmauJ9ukEYlBb0qhV/IE0
         L9UvUKGWWzEKjFV1xrqrEolJqg/d+7qOKj7hf3WlYlTadWXLQxZLnJ/2iJYEQ+GqcKMU
         LVMpnzBHfwOjja4CnnmilN85axCnXdJ5URNkUvnbnHJnTB1bdY7AFp7BBeVyrC/3ULun
         +YktMRYpBn9sZCOFso6ppinMbM2z8ku3fus2Q3wnwkrB3PSRItcd2BaSe1MF0cGzvszl
         c3UVWllXG5/Gu6BTWEgUqdaanHToiRYw7jMmAfnVyNkdk2vO4jIMzc/bTYTAyqP6K0S7
         raMA==
X-Forwarded-Encrypted: i=1; AL+hErGJsdZbofIYavm0nQS2SVMKutKurCjtp9qE8zRGSbV5bFCSzftx0Pd6rT0GZsBFIWPvnWY1iMFH1Og=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QCUeHxbZP+M1Plk91PSwwPrKXDSs3Z2xESwKnJ5Mk5LvVDrrm
	KKa4cNCJhczwDhkf/1apyXMg5vgoXmm4xa6Ot8U0lS1ePhChl6xw/5mQSNVFXPDX7IuUCRnd3E2
	2TMvp+F3TmFHsUs969gJSCKLiD/r9BVi9kwGn/dPi4g==
X-Gm-Gg: AYBFou1RRfPqju9Vca71yTxp57kvvxzLOEuk3bK4LvEMHpnjNkNw8T80/O44QlMm0s3
	opmWEYVAMbkD1YaOjg4FgpP479mEkDbA7gNqc7OkbQTG4hMXCcQwq4nTjjzl06mrdiE8KxYbY0z
	hJRhGb1j1+Bl6o1y3XhodP48Qwu2mxurnppjfei9S/SLCar2e0GqmAl0Z/bUlwGJug8FUq5uDOV
	6SXYemVYvpf7FFY/24J/YYg2FeQDWNZHGZOc6q3gZ44wbGb1x0u1fnCpX5aV728rSbqcdrKXq4l
	MdagNUvA77dXRyHCTnW8301JEKHh6e6pB92JNS2f2ZMtAWSYrCOoyrMnFKWuS8Z1mxCT2UwMXZY
	e6HNod7iDeMp9hXfBZZSH7TmAvnGEjcNs9AsZmVs1ciSOjaR9p49WLHXlIhDi26DaCoBkCID3nD
	nI6mqavbh3JIxdUag=
X-Received: by 2002:a05:6402:1ecf:b0:6b7:bffa:6f24 with SMTP id
 4fb4d7f45d1cf-6b7c05c0611mr1899644a12.0.1794567468098; Fri, 13 Nov 2026
 02:57:48 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-2-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-2-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 10:57:36 +0000
X-Gm-Features: AclHuK8LZ5o_QWvk6RKRY0YNYG96oQjtDx2eCj61VNIttrc76E2ZwU1wIUFE6TM
Message-ID: <CADrjBPrwZ+dH3==Z46PwEVtYR4xWdzS2T0ZFHHWR4+g=a87cTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> Add exynos8855 sysreg compatibles in bindings
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> index fcdb9ffd2644..845e0caba15a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> @@ -31,6 +31,10 @@ properties:
>                - samsung,exynos5-sysreg
>                - samsung,exynos7870-cam0-sysreg
>                - samsung,exynos7870-disp-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> @@ -103,6 +107,10 @@ allOf:
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> +              - samsung,exynos8855-hsi-sysreg
> +              - samsung,exynos8855-peric-sysreg
> +              - samsung,exynos8855-peris-sysreg
> +              - samsung,exynos8855-usb-sysreg
>                - samsung,exynos8895-fsys0-sysreg
>                - samsung,exynos8895-fsys1-sysreg
>                - samsung,exynos8895-peric0-sysreg
> --
> 2.34.1
>
