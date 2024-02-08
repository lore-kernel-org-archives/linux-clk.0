Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA246A327
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707379724; cv=none; b=JeT8RxqvwmUFIAxsuHv4RK0isHKRFVwJAFP0xqy9pA/IQD5USmNz7eCdcpPhKmfUoZ1rV28Tce9E3jlk6JB+uA89ysQ416Ov5V4wBzeItm9WetyUtLE5l1ql3F01yMSyb58dqPxg/vkxAHyDo9YXZa0otkrRWdKGv8+B+T6txbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707379724; c=relaxed/simple;
	bh=SQSUf0p3RCkd77wL2Rm4GS4eENLjJ6swxjmhnXZm5Is=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TSHI/EJkDbLiAPDZbtUDWCudYI67N9h4LnUoXy1VheEWyR1nqXSjSGNMOBYg93uiJEJpwx0YTcRTXIF7yf1Ndrl9ZCS7OMYkh8i1Dk3fVpYmofilZwE6L/yIYqdJsUG7e6ddZjTk8+hF95ATX6v16H6Wr+S+5ZTZyuMJTYITp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v++qPGnD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v++qPGnD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b4e5ed890so1106873f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707379720; x=1707984520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vC+Srv2mTEr3nMtduL2F+Bb+D0NjMjAeHr6neA/G6qc=;
        b=v++qPGnDXFcTOKxu9d1AnBW8WAErEMbr/EChwlv/Rlx6gU9wChPzr4ogtxfdCZBJPg
         dUt5+IDOQIefpuWde8HTIXWgEkc91SRd5ifpZ0PuVWj3N38qTHtMfGsGnyE6oVXfRJ39
         elOEuEPBf+P5OqKEboo1IVHQchRYeaAjbxN1C3Ri7bNQiZ9hRWX9jyPOKIeypViuxfYG
         ygjw4FLsbDZNuPKSa6cRF8ywl9zdFza+ujgyjezX2rqX9huoLR/PoABHRlXF1EYDtEaI
         F0ip/3n7fhVagm3Fm0LwZC42qTfLun2cJZYpSIU1f+vvYq96ZqCQAT9BrecTQJcROYa+
         NXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379720; x=1707984520;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vC+Srv2mTEr3nMtduL2F+Bb+D0NjMjAeHr6neA/G6qc=;
        b=lapIYksTLwuiKCeahUbVyewWLHaIQBHTTaqNit6lSzdURf45JpVD+pL/b7QQBX0JH2
         Oc0yAYWNfCmx6FMYzDt5vKz8hr2QS0XTbbdUcPcOlt1Us/TobTEhgdQzsuLbPJfpxjY2
         w2OYS6OtzeC+E0mcc0G8Z7a4voBU9ZLQz/TUEUIc6GjQU0OutH59SQgCTNXV4ApVrkMV
         UkHVPXmrd3ttL3oUEeOw8zotZvInlIZNG1v/lwHZ95rtUdnoaxipZ8wlf9HidjeunVnE
         Bui03Gn2WP+CrHRceJa/xGfU73svx3SODR0ij+pLVI4mVYwSYYYyH/4j9H0z0H9ki70L
         f0OA==
X-Gm-Message-State: AOJu0Yx9F6FGiY010gTH8Q7luuXSfATXv3HAIN+EHXHJSjBhePslvvEq
	SLwbrYc8uogqnwq6fHHN2qGzP0BzxHYZrahElIAUDmNzMHOwvn4k7RdyDUEsV40=
X-Google-Smtp-Source: AGHT+IHa/Jk1CUhb8ez4QL2PTU+VoTz/OmeeYpFp4Pq2vqTyY4hOaoE5kKYFKo2dfcZDPIn7aZRPLg==
X-Received: by 2002:a05:6000:4020:b0:33b:495a:3a9b with SMTP id cp32-20020a056000402000b0033b495a3a9bmr6188243wrb.2.1707379720286;
        Thu, 08 Feb 2024 00:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViqJImkuAju7dVSoZ9CvxVikmUqZYD19Vqe3meA0LVAGfpoYqDhLubRg1PSvMyP8tixczq05Ni3qhF0Mgct8M9gsEwBvKURZjskseEqYSM6wgBnhtBfLJ4Dntxk32XPWlnyn2bq0la9Bv3Y/XavmLO1pRavWRjN3whUUb5GlAj3iXi6xq8s9rNzvPwpOIGiPBDiEsTAHcUCqu6uW0PyGGNI5UvjKEkm+i7xksxb0JaJVfnbvds2goldE234Cbsk+gxe2W/+gJ0b8haG3zvLlfz3dyVc8QoVV2cuyHPrgrFim4BPOd90x0ZgNz+/MF3tzVnl6p7aGjdJgyaC6KE+4tRQsXRWuGGeoCDtlV02rm5JfXDkafcHYNgfOXxaNz6dcFgKhBsCe2Aiym0tVQycrLoWq7ORS8neEhvItAO/Mt2t2UVkUsxxMk7eqHIYoqVw8fkAoNTWw+P7D3KFmcv5GtwPS++LQAdJqJ1b9Tk2UYFwUoZDUQOTNdleYzEAdssR0M4rMTPkvHEAyTe32SP/EdLZ8ClCK/FbKJk+JP2YZf/0x6NOsSwrBzECi8H9bTIwzxXtSdwIQiCkgrNgKPzN0Y6WO5IL8PL/7AkKLZXHug+hjy2/LSLlUPn9yF1Ls/aT5ljML1iHB6WabSMqkxoCVjKQ/oLIIfo6vaAnv06w0dLX7WfkQiCxw==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0033b2799815csm3065421wrz.86.2024.02.08.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:08:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240201161258.1013664-8-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
 <20240201161258.1013664-8-andre.draszik@linaro.org>
Subject: Re: (subset) [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c
 bus 12 on gs101-oriole
Message-Id: <170737971829.52344.1899996118843728800.b4-ty@linaro.org>
Date: Thu, 08 Feb 2024 09:08:38 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Thu, 01 Feb 2024 16:11:43 +0000, André Draszik wrote:
> This bus has three USB-related devices attached to it:
>     0x25: Maxim 77759 Type-C port controller
>     0x35: Maxim 20339EWB Surge protection IC
>     0x36: Maxim 77759 Fuel gauge
>     0x57: NXP PCA9468 Battery charger
>     0x66: Maxim 77759 PMIC
>     0x69: Maxim 77759 Charger
> where the Maxim 77759 has multiple i2c slave addresses.
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
      https://git.kernel.org/krzk/linux/c/f9555ac036e253ca99a4d6d55e7e9402b77df77d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

