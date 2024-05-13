Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B9433A4
	for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603849; cv=none; b=G0ESzgaFqV6wwOCylMAFXc/rQxWZ/hGQiozO/132Lyx7+WouYS6uO1afbh2K2HGlzG6kPYKWaCSOh8+UdQbibpJhTaWP36HGDr2eGIcvAzpSzf1MhwQEwrVwwdOS2LwXUHmM+9l4jG5OFt51jr7ruzKYE5qax7ozADbaJ5k+qOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603849; c=relaxed/simple;
	bh=lH2P3VpqXlcWVSGVwRn1kZDQIWe0cm6xyew/RScYB0I=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=RQu3ENt63J0GjLgsUeY50VM1lRupWu5Y20TQF0Ktvno04/6LPSR3hyy4R9D2yaYQtDSJNIrGmVwdgCqMlUxnkImmp2AwkLaGH9jqBkT/Ijpm1062xlMY9BkG9HPmO5GjJBXCtvaaZrN13wWUfd0qMWAa59DGJ91fCqhQtNXGnmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=J7be9N4h; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J7be9N4h"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-420180b5922so6302505e9.2
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715603844; x=1716208644; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=q8zF+CwTJwmT8VWgpfibQL6tO7taDX8lcb6Oh133Ym0=;
        b=J7be9N4hIo+S02n/EVA6Yhkym/jwFN6zEwIwco6Eu6rge+Ikqaq6wBz39Nh95IqQeB
         znhl+v0h9i5SIZEuqHzHOKkMpig9DnInFV8ywdoWpiBF6uCi0Icszz0K9rrMg4/hZhaP
         B+hq4zBtfTo0a8WY7ArfwZnX3EIPdz6r0l5F351HjrF20Rqsuj0C+hK4RMUchG6JWg/N
         xYjgBfDM58+nVkoHwrfrX+fsbsp5a3s8MIEigePPcBePI5xQiwKtcd5vj/sg/IFswCxb
         KEzhzNu6ZASLFTmtybwFyoAko4+BtvxojvCZllSrJ9FRUsmlw6TTZZIy772cAgFPcra9
         WPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715603844; x=1716208644;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8zF+CwTJwmT8VWgpfibQL6tO7taDX8lcb6Oh133Ym0=;
        b=KaeixLS45GMJbHmbMh1aX/YGrCNYJxg8M9OPcV3OUMUfMvRoDZLOQP9IGNql+FsPqi
         XIC1dBzv0nevD6JzzyWYT2851hFotUVOBux6vXjCbYbQJSahy1JbXabtkdgBtSsCh6Fo
         Bb0UhnDDo+eWaX2JSHTasWuOXUoi1hCqrY0RwGSSXeei/k4K/G2D9oD+9cq137lBJLRJ
         fb4V1Gu1Feo71Dp9TWdyJp17IN7narVmMUue0egWVI5LLbodwS54OXbOhaVYhVjUiH3M
         U0+uCRRHbGTD401FG/EzImVH9ET5cUaPq9uFLPCNaY/K8QmyAPTQFwggat21Bzn0q2/a
         Ijtg==
X-Forwarded-Encrypted: i=1; AJvYcCXXTzvz15FqCcMpDnFVPbKlfv9xBs3oFY0KFa2XMM9W7KSiGrwjc8YnZjD87g9PohKqgpbPyBkjVyfcI0TVVPAS/HJ4E7QnPCpo
X-Gm-Message-State: AOJu0YxVbXHjo6qfbmOLJ4HvbEfLfcs/+uOjjPJe6vKWYC7HBBISCg6S
	7LeUqy+nVRGMrZJiRPGvsHOGyvkUDzzs4G9aAFi1e7c9aWrIchhdpPt93mu/i7E=
X-Google-Smtp-Source: AGHT+IFsHz1EpicfNBa8SK5EZAZ1T5+dy4IspYfwOFlNMLVrJU9DmGujRx+HhvdOUVgWsVRH7gZz6w==
X-Received: by 2002:a05:600c:6a14:b0:41b:f577:373 with SMTP id 5b1f17b1804b1-41feaa38e45mr94830085e9.15.1715603843566;
        Mon, 13 May 2024 05:37:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42015deac1asm37075625e9.17.2024.05.13.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:37:23 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce
 new syspll bindings
Date: Mon, 13 May 2024 14:04:41 +0200
In-reply-to: <20240511-secret-barcode-e25c722ddf1d@spud>
Message-ID: <1jjzjxzy4d.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sat 11 May 2024 at 14:08, Conor Dooley <conor@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
>> The 'syspll' PLL is a general-purpose PLL designed specifically for the
>> CPU clock. It is capable of producing output frequencies within the
>> range of 768MHz to 1536MHz.
>> 
>> The clock source sys_pll_div16, being one of the GEN clock parents,
>> plays a crucial role and cannot be tagged as "optional". Unfortunately,
>> it was not implemented earlier due to the cpu clock ctrl driver's
>> pending status on the TODO list.
>
> It's fine to not mark it optional in the binding, but it should be
> optional in the driver as otherwise backwards compatibility will be
> broken. Given this is an integral clock driver, sounds like it would
> quite likely break booting on these devices if the driver doesn't treat
> syspll_in as optional.
> A lesson perhaps in describing the hardware entirely, even if the
> drivers don't make use of all the information yet?

That is nice but it is only possible if/when we have perfect knowledge
of the HW being implemented. I don't know about you, but I rarely get
perfect documentation for HW, let alone a public one.

Those things are bound to happen as we implement support for the HW and
discover how it works, not to mention the mistakes humans will
inevitably do. If Linux was only supporting perfectly documented HW, it
would not be supporting much of them I suspect.

Stable API is already hard with ioctl but there, both sides are
perfectly known. That is a fundamental difference with the 'DT ABI'

Getting it right on day 1, every time - because things are set in stone
afterwards - is unrealistic. As a maintainer, I do spend a
disproportionate amount of time checking the bindings submission because
I know how painful it gets to fix things up down the line.

Unless I missed the simple solution to this problem, we can expect the
problem keep happening again and again, no matter the number of lessons
learned.

>
> Cheers,
> Conor.
>
>> 
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> ---
>>  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
>>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> index a59b188a8bf5..fbba57031278 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>> @@ -26,11 +26,13 @@ properties:
>>      items:
>>        - description: input fixpll_in
>>        - description: input hifipll_in
>> +      - description: input syspll_in
>>  
>>    clock-names:
>>      items:
>>        - const: fixpll_in
>>        - const: hifipll_in
>> +      - const: syspll_in
>>  
>>  required:
>>    - compatible
>> @@ -53,7 +55,8 @@ examples:
>>              reg = <0 0x7c80 0 0x18c>;
>>              #clock-cells = <1>;
>>              clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
>> -                     <&clkc_periphs CLKID_HIFIPLL_IN>;
>> -            clock-names = "fixpll_in", "hifipll_in";
>> +                     <&clkc_periphs CLKID_HIFIPLL_IN>,
>> +                     <&clkc_periphs CLKID_SYSPLL_IN>;
>> +            clock-names = "fixpll_in", "hifipll_in", "syspll_in";
>>          };
>>      };
>> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> index 2b660c0f2c9f..a702d610589c 100644
>> --- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>> @@ -21,5 +21,7 @@
>>  #define CLKID_FCLK_DIV5		8
>>  #define CLKID_FCLK_DIV7		9
>>  #define CLKID_HIFI_PLL		10
>> +#define CLKID_SYS_PLL		11
>> +#define CLKID_SYS_PLL_DIV16	12
>>  
>>  #endif /* __A1_PLL_CLKC_H */
>> -- 
>> 2.43.0
>> 
>> 
>
> [[End of PGP Signed Part]]


-- 
Jerome
