Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797180;
	b=cNm3RxiFnA5fUiJ0WdRwWbJJtPyNexX/M85YYEyZGIGtL0kCf0IcYHjKEBcft2KqqOFj
	 VQAxaWeLG/DUK+QzxQb0htpvdiUHCBEp66lpujxvjCUK7WA2M+s5xXh0vb/KmfvkGPOZG
	 NgMQMhj+EpCcATh+gPN37sm0blluu1H7pBXz2PcfQDQ2ze6/SVdKg5NxHtobeSZe3UB+a
	 URfp2U2T14HiSATJIna9rQqiRH2JGvE96LDI2AyUwoIg0RRBizpbiO9kWvDJklrwAWzB+
	 BpqIHCKCxQ9HEI5U5/VkZTQ+rBW5MJfYNsKoA9p0u4UZapdwFIT8db5FZDVWJBXb22w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
	b=CzEfV4GRTFX4aDNj06TJc1/Lmu7drXjR7K2i1bvGjUEUftr93czRqB+VrXeWu91nWN8L
	 /yXjxCcxpxEAvV+ZQkWagQul+Rzol1A9e3EIMSpBb7ir3ZplBPHBaANUAe+wEGYl7bPsL
	 Yd+eGOg9jr2d5PpuyVPj+ZQqfQbuMW/5BFGVubMT4GP4gVkGGtEiVcr8oK0+EdKgLh4/7
	 lu3KJwFvCHChqZq79RV5gqNUjPqNTGHfQ3tsIGsudMMtSfSkxNl4B33E7X+FiVJqoVS7a
	 WuwdrIIdB+XqUM4+YfNefWH9WDl+GXr7XYiOLj6RwLaMwjeEGSIbJqTLPNJUoWZ8K1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0OV/R8N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3373C606A324
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3373C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0OV/R8N
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a40a9a01aso1052702285a.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797179; cv=none;
        d=google.com; s=arc-20260327;
        b=fYozLjHWFqT3a3e8hyq97PBWeZ71O3bj1aVn6Cz69lsd7jyxka64kCyfZE4vCySC/L
         sssYm0uZ1KrwEz9FHq0Pur98a7cbrkKLQ3ojHArFlQ7axxi9vorVxVc8A3aRHpH+0ux6
         i8+O/47nQvl/SpclKv45SuZH9Q89CMvxfLWuCQON/Z9VEzkR47ef29zn5TXeRWwRY5Qn
         qnwvVxrPq8V16sNHxuKvkP4qDZyeirlbm/iHSypTDbfhH+xdJE7iRlnL2zM7hQELgmlO
         /x2RLB8i0SjLgozN5M/NwxpV0F90BrvR37Es1SrwOtP86N8cvySLdWdcl6acEFxuqO2Q
         oqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        fh=UuaLsX2E65CPCju7DGjZUFshk1fgwNqWvruGaneVWqc=;
        b=E/h2sgk0h/hsYGWi/kzmy99VTKTKmYkaok6w+xyZnC0nSTf0WtV3nCzNTpbfgAa1pr
         pKSvXmkVwQUlreyKibfg0vjS2/BmbDbRzFrDu8KO05MUKadpDIijrXcjzglhzwSNHm4o
         Nk7qShIbtclvNimkVf5OklS14v65Ll4zn26XBsvBnviOXP/Ub6+KYAH7EWSE4rfKtf8H
         0gQS/niuSlf+hPieQ7jVWY3VTZWKmihlQ7XI7+9l847WqU/CvYoWc8e+ji6rkF+9y2/Y
         C91aVD8pGRHa87XQxHf1qgcV9pEAUG6umZxrsnhBWYvNc4n0Ms9xpG2uRTjxUI2hG8LQ
         3ctQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797179; x=1796401979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=R0OV/R8N3BVXXKY1j0aTwOiPavF7AId5koBfS3gHaU4jEr5HoP+Tj640rwdSzLgRXH
         CGvg2hqLOF9uvz+3E5CeSvTj3enmbqX+80sdsC35Zd7qOQo+aGoPD10v5P1GRogm6G8t
         SmBwu0rJxJRYkL0DIta9tRVhidpGkA7hnA3xNd4BY/X9OQ4C6SCSxLW+Mjdj89Br4mTx
         WRngpZCi2qvPMoFP3fI+CtwSkMcv4e8jOvO2SlpMmWE2HLkrx5kGzmbg+muJAYWduDSB
         UJoBL0pXIs27FYQQEEXDxE6N5YTsacs8zFatD3SuAWjcsNLfNJ3jCy9LLMzfXNd31Khx
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797179; x=1796401979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=Ylmkvdzp491gdNo4DN7731FNn40NJ6En2ZPVDBv5QEn8rjNGoH8I5/nUIf0Y+veEql
         qExZgCt60HJMTqdej4iW27TmWj/iFobPN1ZybttCkJAN4lCeyema/8K6uIYFOS+C7Xc6
         eNbmvJvioinM3J22aegCE62O//+IGYEf2NqxcvGESkbM0uSrBbAi5Cm0/Cvbp0a3A9vS
         xocMxNqwPt80NPND9xlzBpou3NhRgCVvLXfJyqdVXwRTI6FB03RVBBPAK7mQoqCW9wV/
         BR17UCVwWAxhZ8B9srou+OOM0+y848vTFlblsRAJRoRjERB337lwYxTHYLy94zYWMTx1
         ouYA==
X-Forwarded-Encrypted: i=1; AL+hErHhEPuZq8L7uZJNBBLmGBXh+a47w68zWpNjlY6TXBuEJZ3e2XF7809O9pmMZz8te+ogjE2CxH8fZa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fgoIHc/EbIyhDuRejMb9tNZaau3sjgkQHpMgv8GMrIwC87TiH
	kS507q9N/flCSLYcyf96K8fjnbOTwF2OgLS383ambpbUkUo9pbWCLL/AEfRVy+03Ee42CtadwlY
	nOLbIV77cGChu5LAXHc9jooSdcnG+LU4=
X-Gm-Gg: AZFdTZeb/0WQYFgpPqim5v7s75/9MZfNKUPwNr0eW7lbsCTRCyLJQYnqdcdPiMDwilW
	RIKDRnSwQXn1xxRqRyO2q9UDnp4BDsUFTkme1r3FDcyAhB1M+hXGTW5Q6fQFI05m5ig0Z5zvk0l
	xBNbBO3ghGwx/IBSMRfWOjDdYpbiijeT2/6cu7NsDLyT7B+NY91ReyQ8VCsuf3EIYKoL7yVuj/5
	Eaadm+ADzpyuibjoc/rgWpPrU0FrWLjueZbIwDz4n6Itx5AFUVsafjFDLOtJe8g9726ibtLm0HW
	P+T1Cj1DskKh/prIrYa85AVOjcjZEhCUy0+1RlWFaNiNR7jGoVr3EiING9vGGqUcBX8PC4+Y2uY
	j6B0+sz0uUEbJIvenBHyZsx53I+nUScuy4aC8SFVEJiCfgLa5xvnZHcET2EXWP1UXeZE=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id
 af79cd13be357-949b35ac8d5mr4672679685a.18.1795797179191; Fri, 27 Nov 2026
 08:32:59 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com> <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
In-Reply-To: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:32:48 +0700
X-Gm-Features: Aa3M54rpV9JJE-D1PefPa0XgKPQ9lDOZXhSn9zQqqor1iBHttCk79es3V0AufT8
Message-ID: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the suggestion. Splitting this into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes (noting the
dependencies on the sensor series) makes a lot of sense.

For the gcc-msm8953 change, I will drop the board-specific reference and
update the commit message to explain the basis for using P_GPLL0 with a
divider of 8 (including comparison with similar Qualcomm GCC drivers like
gcc-msm8939.c and verification on MSM8953 hardware).

I'll re-spin with these adjustments.

Best regards,
Hikmah


Pada Jum, 27 Nov 2026 pukul 23.14 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> > cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> > MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> > devicetree updates.
> >
> > Changes in v5:
> > - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
> >    entries in drivers/media/i2c/Kconfig.
> > - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
> >    ov12a10 driver patch to preserve per-commit bisectability, and add
> >    MAINTAINERS entries for both bindings and drivers.
> > - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
> >    v4l2_subdev_cleanup() in the probe error unwind path, update the active
> >    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
> >    post-powerdown delay when reset_gpio is absent, and match the initial
> >    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> > - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
> >    child node under `&rpm_requests`.
> > - Include base-commit metadata via git format-patch --base.
> >
> > Hikmah Gumelar (7):
> >    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
> >    media: dt-bindings: media: i2c: add Samsung S5K5E8
> >    media: i2c: add s5k5e8 image sensor driver
> >    media: dt-bindings: media: i2c: add OmniVision OV12A10
> >    media: i2c: add ov12a10 image sensor driver
> >    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
> >    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
> I recommend breaking up your patches in three separate series.
>
> 1. s5k5e8
> 2. ov12a10
> 3. SoC depends
>
> with #3 depending on #1 and #2. As is you need people to pick up patches
> individually within a series which is always tougher.
>
> ---
> bod



-- 
Best regards,
Hikmah Gumelar
