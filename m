Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214614EC5B
	for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601876; cv=none; b=heiw/94UFWLpmDhunWKjNDP3cePk8TL75lvsxY2yiu16lRhnn9hEGhfEQkDwondoVMHL+UgkAG7uGARW+wA3Nha0sAO9COL9DtafCSXlqJKb/DvNjFaEU/MMTvvmgaRa3BX0WISTprF9ZWmjQ2/iJcJyAmAIpckBEq+g1ZM/y2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601876; c=relaxed/simple;
	bh=5j40C07Qf/yIsZFYFIIXmoDKx9psThMJypiQuPwNDBE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=DIbZQu48tdvL8Hx0rL3L0ATMQ/XRuImberUw4sD1MbLHvcKRSh1Zqx1qB8/pwbpIlE9C3Z1/oQqEdFl7INdzgABmvmQWP6EocUQBK0OSyHFtIcj9hE3g1CdICeiFDK5q/TRZq8SHIWqajEQX//bztsqBaagIqVjgahIjdxVjq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s/3OmJeS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s/3OmJeS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4200ee78f34so14954285e9.3
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715601871; x=1716206671; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=evr7Nj7xKQ7Cd3Ztm3Cf+ORmYJrKhwgikDv0J0g06qQ=;
        b=s/3OmJeSjthWytt2VGdU4HwVXqvAer28UXexihlo9/1d6uQ8G2VAsyuU26vcXY4vnS
         thy+3Poe2eV9a9dwjbgy2envd2BBNK+5J12cKqbwrUOwpEghk54Y5cyZXIOtNryeGTBv
         h0xwPmMYttaJ9On7a+9yFPVRh86W7cUPai2oHQl6iyFRAgYD0KpAAUOxF1k08r2F5y/e
         VFi7J6H5A7Fy1YRMmNi8qdGy8kDbxVSLFqZ/1Kuag1QipW0ShYYAh/S6CV+iPrLOROBJ
         KI7Iz5g6yFmO+SkGA0YMAOoY1T0912qKzxowT8tHMmKIrRClBS97P8J9HaER73FnXEMY
         mRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601872; x=1716206672;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evr7Nj7xKQ7Cd3Ztm3Cf+ORmYJrKhwgikDv0J0g06qQ=;
        b=vavX7zIMZHVJhqssREuuWkWTkdo2zhhQ7js0GcDbS389d/WJ0p0Uo9cVO7RPHswTy8
         LwI0Juf+FDoBgNMCSBAPsm4qpIbsETqYtsmHF9PSAw71mKRdj2PS0QJHaY7Q89z/FiRL
         e0Kv7gPkLMKz6XpqVHWsdbHezaK9RGGOqYLOlFFtUHuwpGukIVHp0VzWPlxMzNeCjlRh
         bz7HBtFXlNTCexnew+m4dnm45yDE6s5YGidzigCkKPk7MtHy29WHgCRu+7BdbYKd4Fd1
         RWXwLuwAbwW4VgzNKOdWqJOx1UVujyRgUKqQp8+mZTZvSs5b1tdbLUnolwJTaBDlBpz9
         oAQg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5RRT52jbsY0YyoetHiyLAR67nCJhZUszax6JUFhqpK/VrrRlLq3gy3TQTBPiKDkFu2XeXDYt2TeSm36Al0ik1/+7MdwxiNzd
X-Gm-Message-State: AOJu0YwX7SyErWpqttDfRnonMrYCDocMaqHqf5GB3hwbb39jPXeLrW+m
	rriwenBRUFNmdBPideV1B3UnMHMfyPULpLZBjjEiLZyOqmO1xh9SIs70n5kHJUE=
X-Google-Smtp-Source: AGHT+IGnkiii1p31wpEBxYvlhM/aMqmsmiEtQ3NQ+1Qn6f87Nt4y/G9/2KcL8KQaX8/8bf+QvAuVbg==
X-Received: by 2002:a05:600c:4fcf:b0:420:1585:7a99 with SMTP id 5b1f17b1804b1-42015857b80mr27774355e9.38.1715601871464;
        Mon, 13 May 2024 05:04:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42013c5fa61sm49472435e9.40.2024.05.13.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:04:31 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-5-ddrokosov@salutedevices.com>
 <20240511-courier-afflicted-e351af5cded2@spud>
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
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll_div16 input
Date: Mon, 13 May 2024 14:02:21 +0200
In-reply-to: <20240511-courier-afflicted-e351af5cded2@spud>
Message-ID: <1jo799zzn5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Sat 11 May 2024 at 14:03, Conor Dooley <conor@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Fri, May 10, 2024 at 12:08:56PM +0300, Dmitry Rokosov wrote:
>> The 'sys_pll_div16' input clock is used as one of the sources for the
>> GEN clock.
>> 
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>
> Provided that this new clock is optional in the driver,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

The way CCF works, it is not going to crash if DT does not have this.
It will be viewed as non-connected input, in a way

>
> Cheers,
> Conor.
>
>> ---
>>  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml        | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> index 6d84cee1bd75..11862746ba44 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - description: input fixed pll div7
>>        - description: input hifi pll
>>        - description: input oscillator (usually at 24MHz)
>> +      - description: input sys pll div16
>>  
>>    clock-names:
>>      items:
>> @@ -39,6 +40,7 @@ properties:
>>        - const: fclk_div7
>>        - const: hifi_pll
>>        - const: xtal
>> +      - const: sys_pll_div16
>>  
>>  required:
>>    - compatible
>> @@ -65,9 +67,10 @@ examples:
>>                       <&clkc_pll CLKID_FCLK_DIV5>,
>>                       <&clkc_pll CLKID_FCLK_DIV7>,
>>                       <&clkc_pll CLKID_HIFI_PLL>,
>> -                     <&xtal>;
>> +                     <&xtal>,
>> +                     <&clkc_pll CLKID_SYS_PLL_DIV16>;
>>              clock-names = "fclk_div2", "fclk_div3",
>>                            "fclk_div5", "fclk_div7",
>> -                          "hifi_pll", "xtal";
>> +                          "hifi_pll", "xtal", "sys_pll_div16";
>>          };
>>      };
>> -- 
>> 2.43.0
>> 
>> 
>
> [[End of PGP Signed Part]]


-- 
Jerome
