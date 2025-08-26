Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BB302CD1
	for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199500; cv=none; b=qbBA30xDiN/4PlOAEPIece6WnCh3y3bTl1xJ72vpBpxmuKhGU/vgivx98qoRp94xA/IJmw+q1zSt0DFYjYEVi2VwcWEZPi+SLc5iLMzRedWYjfSU/wJMpB4/Wm1hL61jPIfQDkzHqmfahmxiCPOrGewAcszis/wsMCxj+kl540s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199500; c=relaxed/simple;
	bh=oUvDJknltmsHE5kgS2L1KW2dhWMzUcSQlAHCv0I9Kjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GJ+1ckkzLNKL2XKafDvitrNu4I3Ezb+H02pAOYWF/jBtPd9tKLGpm2KnaeFtQYDnR9mpUnm3JlTStfayvoSJusahwgQmIRO8Rbvp1d6or1yfm7LWGBiu9kV1Gmudt5Nvp2WrlBOcKTKtAhltg2FMEtK8roai5O8BbE0pLUBGEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F/KVRZrM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F/KVRZrM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso41944745e9.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756199494; x=1756804294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=F/KVRZrMHG3qI2k5+wSKxz5kmtxtIVRjTQlzLtokJLSKUVnXNhaFlhfUGf0T+w7EOs
         Jx9BOS++tu7wXl+ca7ZPKFJ8iT11olkcNnJVmhfM01Go9Z3BIh3bawlMVT6ILq8QjnKk
         NpT4figuvWk2/DUyuHkKkmqlQS+YCyA0qV4CYaCpVSTa2oUULlBhI2Jrr0T3HsdgmNU2
         /ASVvC0RPGIuv7RoVN0XLXiiv7oLROTHSuS+xt2dkcie17El3wsuz/xejYq7p73cu58P
         iiWH7v05l9doBgYlWOBBNeWtJRBoxONp3/3DOVx4FrjQxJPusSM91OcGCDjm3mMtMHjn
         BBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199494; x=1756804294;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=tjP1G4ll2mpMrjjAI3+snKrWoSbVD0f2M1nXkBcXKiAMgqK7FaWekDVJ3Q1ce+jXWI
         tl61KghtsKUE6uZLKyWrCLjhBECgLlA4F+B83XkO3wTaCZ8m+LuQlt9M/XR7vEiTQzEf
         +Bhwfw+M5iA6Tmyj4H7VuDegho8LDgfIB/8NLFtzSwhHlib+BBGnzCnMgv/Ovvvb2Ze6
         YhXYcW+s4IE4se2tGccPOJX75FxgKpt2U+oRI/6MmGrcyWZSy7/GMoJS0q19GiSVL/Ar
         7iyktnGzceolsV3OJomszW5/Vaw544gtdB0AUrN6B9WrEAZna8bimFW8rWP39CyjmiOZ
         I5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVqt/I0c9lXfY36GR+/rQxvI5Id/GHBQcWcYnvTGUMA5bDF/LIpiR+VtKRWPzdFL3D50wllycl2URE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOZjQjQTpU2/Z+7xAc4trDSKdN/5UhEBtOpBcEMCv8DRTdQsd
	KbTJayfg3ga+VAhh5+CA8YMvw+CtvRQEv+PNUeroSDDXlY2eJ/5VS5rvtQjXjXg+t4U=
X-Gm-Gg: ASbGncufTw7HE4bcNvk9b7lERSfRMp+PDt9DF/nUWnvbi0FfD8HFdBQxXVBY3lpiXxj
	kya33bdj/ZCUrg8JoUz6iBwpumsFIUjPE73VlDX9UeebqXq9iSdaEqaaggmhko4bWRC+V+RJpe3
	F4d6Cr0m/LfvEghCn4CnCCQriPPTbqecY9ILB6pezebr/0E1/dlq4Y0fZ6rVLQ31gyOOeVpOawc
	cEtUdQMBpJgo4j3r844uQRfoXOJBvziHu5D4x7ZPcC5b2pW3konY62zYzhb/MWYN4Xx4MdELOsQ
	QDg9Ht7HFCfFe/b2FzU2Rov691UEuHNl2ECknrC7Vnr8p/6TkUOSoyf7tVIJXnkdvJF3J6UOYbA
	6ehLBvuGe7aQCoYl48k0/XCCEiyGSCOg=
X-Google-Smtp-Source: AGHT+IFtBWXrOWyVTOM6kOSvzOnSizJ26W7d5kPzjQBIk8HokgLiwvROTQt35HufZ0kQxPuRV/tMwg==
X-Received: by 2002:a05:6000:400f:b0:3c8:eead:3d2f with SMTP id ffacd0b85a97d-3c8eead4359mr5090468f8f.41.1756199493485;
        Tue, 26 Aug 2025 02:11:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:46d7:73a6:7b7:2201])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cad431ea49sm4204236f8f.42.2025.08.26.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:11:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Da Xue <da@libre.computer>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com> (Chuan Liu's
	message of "Tue, 26 Aug 2025 15:59:32 +0800")
References: <20250822002203.1979235-1-da@libre.computer>
	<c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 Aug 2025 11:11:32 +0200
Message-ID: <1jy0r64fcr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 26 Aug 2025 at 15:59, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Da:
>
> =C2=A0 =C2=A0=C2=A0Thanks for your feedback.=C2=A0but this patch is wrong.
>
>
> On 8/22/2025 8:22 AM, Da Xue wrote:
>> [ EXTERNAL EMAIL ]
>>
>> The bit range 17:0 does not match the datasheet for A311D / S905D3.
>> Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.
>
>
> The upper 2 bits (bit18, bit17) of the frac were deprecated long ago.

deprecated ? that is really confusing

That seems to imply that it does have an effect but you are choosing not
to use it. Please clarify.

> The actual effective bit field for frac is bit[16:0]. However, the
> corresponding datasheet has not been updated. I will provide feedback
> and update the datasheet accordingly.
>

What about bit 17 and 18 then ? does it have any effect at all ?

>
>>
>> The frac field is missing for sys pll so add that as well.
>
>
> PLLs with frac support are used in scenarios requiring a wide range
> of output frequencies (e.g., audio/video applications).
>
> Since sys_pll is dedicated to clocking the CPU and does not require
> such frequency versatility, it does not support fractional frequency
> multiplication.

You are mixing "HW support" and "usage choice" here.

What I read is :
* Da says the SYS PLL does have HW support for the frac parameter
* Amlogic does not see the point of using it since the CPU does not
  require fine tuning of the rate.

Is that correct ? or is the HW just no present ?

>
>
>>
>> Patched:
>>
>> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
>> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
>> 996999
>> 500000
>> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>   hifi_pll                      0    +/-1562Hz
>>   sys_pll_div16                 0    +/-1562Hz
>>   sys_pll_cpub_div16            0    +/-1562Hz
>> + sudo cat /sys/kernel/debug/clk/clk_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>      hifi_pll_dco                     0       0        0        0
>>         hifi_pll                      0       0        0        0
>>      sys_pll_dco                      1       1        0        39999999=
85
>>         sys_pll                       0       0        0        499999999
>>            sys_pll_div16_en           0       0        0        499999999
>>               sys_pll_div16           0       0        0        31249999
>>      fixed_pll_dco                    1       1        1        39879999=
85
>>         fixed_pll                     3       3        1        19939999=
93
>>
>> Unpatch:
>>
>> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
>> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
>> 1000000
>> 500000
>> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>   hifi_pll                      0    +/-1562Hz
>>   sys_pll_div16                 0    +/-1562Hz
>>   sys_pll_cpub_div16            0    +/-1562Hz
>> + sudo cat /sys/kernel/debug/clk/clk_summary
>> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>>      hifi_pll_dco                     0       0        0        0
>>         hifi_pll                      0       0        0        0
>>      sys_pll_dco                      1       1        0        48000000=
00
>>         sys_pll                       0       0        0        12000000=
00
>>            sys_pll_div16_en           0       0        0        12000000=
00
>>               sys_pll_div16           0       0        0        75000000
>>      fixed_pll_dco                    1       1        1        39999999=
39
>>         fixed_pll                     3       3        1        19999999=
70
>>
>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>> Signed-off-by: Da Xue <da@libre.computer>
>> ---
>>   drivers/clk/meson/g12a.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 66f0e817e416..f78cca619ca5 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco =3D {
>>                  .frac =3D {
>>                          .reg_off =3D HHI_FIX_PLL_CNTL1,
>>                          .shift   =3D 0,
>> -                       .width   =3D 17,
>> +                       .width   =3D 19,
>>                  },
>>                  .l =3D {
>>                          .reg_off =3D HHI_FIX_PLL_CNTL0,
>> @@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco =3D {
>>                          .shift   =3D 10,
>>                          .width   =3D 5,
>>                  },
>> +               .frac =3D {
>> +                       .reg_off =3D HHI_SYS_PLL_CNTL1,
>> +                       .shift   =3D 0,
>> +                       .width   =3D 19,
>> +               },
>>                  .l =3D {
>>                          .reg_off =3D HHI_SYS_PLL_CNTL0,
>>                          .shift   =3D 31,
>> @@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco =3D {
>>                  .frac =3D {
>>                          .reg_off =3D HHI_HIFI_PLL_CNTL1,
>>                          .shift   =3D 0,
>> -                       .width   =3D 17,
>> +                       .width   =3D 19,
>>                  },
>>                  .l =3D {
>>                          .reg_off =3D HHI_HIFI_PLL_CNTL0,
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
