Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44192C8E1
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706077959; cv=none; b=XtXheyTjqKWc6wKe1fN2A5jwiV9JMTuvDtjOY3vj5mTQqVWPt9mr/XK4C/o43M6yWJx/ZeZSVFZSBXQ1Q3iKwVpgry3nRgLX7JdyDmbzcC67vHa1YGl17aX6iqutkO8kVKQPDJhhDlZcsC55CVQL7ppzudXryWztDs/OtaFyClE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706077959; c=relaxed/simple;
	bh=W2A6Spf2jYLp0Om551ROYCkUMUGNSA0Xbwv1wks76g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOuqTSteDSH/naTfCLhm17igmzIabKwbgvmR3UPiWjFHlhfqRrgPeOhP3eNuoFhzXtZjaeQqjSA7mBX4PjJzG3EN1IyONQgUv3O9EcHF4NB8InNs4Fkwgt44hH4j6DPO1UsPB8RSI3Vr8uV2jN371YkamTLk3M5c8mudSqxv9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCXhHkKE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCXhHkKE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso56147975e9.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 22:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706077956; x=1706682756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbAT8z/Z9mzjHZAanqmmp59HdJKjGmfrVSvJnkugrds=;
        b=NCXhHkKEFGqPHJBlR6Cc0o46T3GSKaAGzg9T36Ckt5UZvf43aR8AY8X9cdMOxkuXRj
         miwSLRKmCrDkRi7O3WJ1q0Ot65PZcWKR+dMHENcFSHmSDgG0jyrRoav1kZGhNuLp5d2y
         X+JKZFqOhWQFKzYjRzAd4hqTK1iqPP3ra+rjjafGt0keyjcZ4hVGoMFnPriG3IyOEjpY
         Hrj8iA/r3wrPMmw3MuI7tBNQsi0g4mdVp40ZgU/F3woxQORO1qr5LWpyGMzDkEnstulb
         kN/Q8Ge1NN/1bcYiAUzSpHPuLk0F/6oZ08XUDECpIBZAm3fYPLZQot69UyVnensahqkj
         6cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706077956; x=1706682756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbAT8z/Z9mzjHZAanqmmp59HdJKjGmfrVSvJnkugrds=;
        b=XCKz2Ccq3X+NTnWO5Ktku7Jov2H9F5aCpMow2TrwZXUZrqcjkPd/rUe8dp4/Ew8mAJ
         5Opzx9QzDSEj2v6gzZpPmTs4OOWHfraXPwXo1IzbaF3WhnivYzyEUoo7L+LVzCAF9Rb9
         AEPDb5V5lxtVJaHRSmOltku62RxEZfAYW3PD/48RBxAk8oAXdKJTY1Qo39mT7Qcga6us
         yzI2BEWv9I0D2Q5/Zkpbayr9QYnVemRG7V8jerLa86QwBHCwgWRqtEj/WC603lmiOjKW
         10LazSpIRx7/qbsT6tTvUX3KWxXfw8VsuXBxEhloYLLs3DCAm4unpfn5m8yAwynwVJdG
         G3og==
X-Gm-Message-State: AOJu0YzZFg6eVJyxdCOomYX+kApGmjDjrRkluVCe1cK5ih6VGrjt000H
	b+IoEtJ79u1d0t5VEnRE/8IRwo0gYivgrNkHk0lgmL8qIMkmqy5+PkQ0IZU6KTk=
X-Google-Smtp-Source: AGHT+IF1pY971lIXL9bV04ZP9uV3BjbYP/RorxUyM06IpSBhjN85T7dfZN2WdsKvttVXPMoz0Ispiw==
X-Received: by 2002:a7b:cc93:0:b0:40e:51e:7295 with SMTP id p19-20020a7bcc93000000b0040e051e7295mr1062828wma.82.1706077956521;
        Tue, 23 Jan 2024 22:32:36 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id hg14-20020a05600c538e00b0040e5cf9a6c7sm44673594wmb.13.2024.01.23.22.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 22:32:36 -0800 (PST)
Message-ID: <14ab8da0-5b3d-4878-84fd-ad7b7d150eb6@linaro.org>
Date: Wed, 24 Jan 2024 06:32:34 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: spi: samsung: Add Exynos850 SPI
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
 <20240120012948.8836-3-semen.protsenko@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240120012948.8836-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/20/24 01:29, Sam Protsenko wrote:
> Document samsung,exynos850-spi compatible which will be used on
> Exynos850 SoC. Exynos850 doesn't have ioclk, so only two clocks are
> needed (bus clock and functional SPI clock).
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

As Krzysztof mentioned, I see lots of spi dt-bindings patches prefixed
with ``spi: dt-bindings:``, so probably it is better to follow that.

> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> index 79da99ca0e53..f71099852653 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -22,6 +22,7 @@ properties:
>            - samsung,s5pv210-spi # for S5PV210 and S5PC110
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
> +          - samsung,exynos850-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - const: samsung,exynos7-spi
