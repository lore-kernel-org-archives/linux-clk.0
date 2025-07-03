Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C82D1925
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531994; cv=none; b=XW9p3jtyqIsE76TZJA5qpdg+n2dYFaNOECP4wo5t+5V53l2Z/oniOx4EZu4c9ioxbESJYRc+ddb6LBU2p30stDVIVz2eV3SngxapaaWvS99w4+Mh8dE4MGb7ywXhhjDLbTtDdDSGKz7UL3jYjo4J4wloNJdjUg5X01xl+swwyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531994; c=relaxed/simple;
	bh=yjEFNI1vnli0Mlc4ilFGuKnQevWJvkf4tPCLZeb4m44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2lU+VFIENTZxr4yZ5kJ0x3J6SL2INyZg6EYRXb9kSshF9f12qHadIUnV5L6+odRNZFzqK7VQ78i+gc6F32pnixcOtegN3tat/4p28ISD3wDnCe6N+y3etas8BFY0YywU4SmXYzGeOwtCSH7dLW7yRRvMVLSD76cQb5ld8/RxIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wXwfJqfG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wXwfJqfG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2994411f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531990; x=1752136790; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=wXwfJqfGjMQuJtzWDDyMPHXGCc53TNUw8Ej01m7sWCwrJA8ym//JAeRbaMhGEF0JTX
         SmR7+w6o//wYdZfmrqw7mtbkIX9csvsA1ZaxzB6aAQIO7XMA7MAj3t1pjRWx47qzttxH
         YKWMrK+ldLbC7Ywhw1UQWg2cDgLUjeVXcIwFe+zmG7yZxJexHq/va4q8+i9ZOfRcskXa
         vFjP4UqDhzy7MKJ8zRmHV6SIcpEEZDVR8zjuTV6gOxoHT9O15VW3X+evyiD34mo85hUc
         eRBlly7Fd30M0jYYctyjIXu0KQVBaRoylgU7sBZ5GLzH1NtZipRl5DCdbI05W2JLpW9M
         BNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531990; x=1752136790;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c5DYGl47aYWZLPkSpLUyqJH150qyEt79Wo9rxFNQNQ=;
        b=RAiLkFxEncBdbq8wKhe35WwTTo0AiPUOgSuZexACoCo/lUIyvJcWKDltw/HBm7F0uB
         xHeDhzpIA/cTA8RmETbrivUybYZTon4DBOIMAmhyB+BG+InsgFFjJpOo6shcmO3d7P6J
         vhf8nGmNAmbetGq5cyvk8s3TURbAfzoHHm8H2UA5gIs/9syspGwvI+e9FqkGUgGwShXN
         Pv5YBo9UdgLtnip1m9NLOOboKT/M6z3djwznB2LBKbXN0ojuCbqADOyrBlMyy1NX6tp1
         a8R14DLkfV+NODYc4RFClPUqRz21OweFUV1ki8r6R/B9LC8rClgHVJgF0Mc7YdQ+Ndd+
         Yzvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Xq8UGdydmfnTT1xWDnAcDQbauUOvJCP03tzRC4URq7jVpT+sIPC7+5esl3rglvRRBjVLcLsivmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BMTlQkBWttX8dDFtckyPDbEteXvPKSkfRY1ULuimfer9HA0I
	UNLY/FmqMpqiTq9SZ2BONihbcQCZMUSq7NMxfskuag55vv2bxciKOLI/2MS69gt/JpzFNxIrbL/
	+8dMwwyI=
X-Gm-Gg: ASbGncuhWG8oQ0SVd3oeBZI00HCk9jflu2gKPkKEtIOYUcGlBN7YQ2Gwa/zCPCH4hKn
	bq6rAcWkSzHTmuetGwfvYlZD2BzPe1KWQYiMOOYDNBQ0TxaTMAM7uW7XGdPLDTdG+I6Wj4Ujy37
	1xBD/yfaXmP+8tEjVMlXBcZ1TKa+gHtzt1Vyx4ZOjZlyXAQ3kHp/Oo+ELx73v8UdGU4oEdU0xk9
	iBHNuM3ndGGKlAMG8uJ28wX4AVix5faeNNj18+drnoyww4PT55Pvniy+wsVHvlbu1wVM0aV2LaJ
	bc+p2XOU2justN7P0zlm4essuehULIKJ3Domssy0Y71J6+6qyMGRcMez46JXaQ==
X-Google-Smtp-Source: AGHT+IEM43hwgON08uzyYs0xx1I5VpWRjMLLXLPjH06b7O2PIIqRcDAeRfUfliYzvrSLOzEu/UQUYQ==
X-Received: by 2002:a05:6000:26d1:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b32db892femr2028812f8f.35.1751531990341;
        Thu, 03 Jul 2025 01:39:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fab6esm18379133f8f.31.2025.07.03.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:39:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/26] clk: amlogic: add composite clock helpers
In-Reply-To: <a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:24:50 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
	<a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:39:49 +0200
Message-ID: <1j5xg9d5wq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 15:24, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Device composite clocks tend to reproduce the usual sel/div/gate
>> arrangement.
>>
>> Add macros to help define simple composite clocks in the system.
>>
>> The idea is _not_ to replace all instances of mux, div or gate with those
>> macros. It is rather to use it for recurring and/or simple composite
>> clocks, reducing controller verbosity where it makes sense. This should
>> help reviews focus on the tricky parts.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
>> --- a/drivers/clk/meson/meson-clkc-utils.h
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -48,4 +48,61 @@ struct clk_regmap _name = {                                          \
>>   #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)               \
>>          __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
>>
>> +/* Helpers for the usual sel/div/gate composite clocks */
>> +#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,    \
>> +                      _table, _dflags, _iflags)                        \
>> +struct clk_regmap _prefix##_name##_sel = {                             \
>
>
> Can we apply the same naming style to the '**PCLK' clocks? The SoC prefix in
> clock names looks inconsistent and awkward.

Replied on patch 5

>
>
>> +       .data = &(struct clk_regmap_mux_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .mask = (_mask),                                        \
>> +               .shift = (_shift),                                      \
>> +               .flags = (_dflags),                                     \
>> +               .table = (_table),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data){                             \
>> +               .name = #_name "_sel",                                  \
>> +               .ops = &clk_regmap_mux_ops,                             \
>> +               .parent_data = _pdata,                                  \
>> +               .num_parents = ARRAY_SIZE(_pdata),                      \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,           \
>> +                      _dflags, _iflags)                                \
>> +struct clk_regmap _prefix##_name##_div = {                             \
>> +       .data = &(struct clk_regmap_div_data) {                         \
>> +               .offset = (_reg),                                       \
>> +               .shift = (_shift),                                      \
>> +               .width = (_width),                                      \
>> +               .flags = (_dflags),                                     \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name "_div",                                  \
>> +               .ops = &clk_regmap_divider_ops,                         \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_sel.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>> +#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)           \
>> +struct clk_regmap _prefix##_name = {                                   \
>> +       .data = &(struct clk_regmap_gate_data) {                        \
>> +               .offset = (_reg),                                       \
>> +               .bit_idx = (_bit),                                      \
>> +       },                                                              \
>> +       .hw.init = &(struct clk_init_data) {                            \
>> +               .name = #_name,                                         \
>> +               .ops = &clk_regmap_gate_ops,                            \
>> +               .parent_hws = (const struct clk_hw *[]) {               \
>> +                       &_prefix##_name##_div.hw                        \
>> +               },                                                      \
>> +               .num_parents = 1,                                       \
>> +               .flags = (_iflags),                                     \
>> +       },                                                              \
>> +}
>> +
>>   #endif
>>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
