Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB93CF67D
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669663; cv=none; b=DXvTEIHE7NoDOyaKFBrjZUGTlMJvf1vVuaUtLWVKN2lfJJfbuGHm4FHR21dmPEiaLg1G1ZtOXe1rvbJ75CeCK38aQhvTnyQdZduHSkb2cr2d3r6uuIrcB0HYPqFHfl2bYc3sdI9jC6/Db1AapQEIfsYcXdQSuXw525Z3w3KcOUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669663; c=relaxed/simple;
	bh=G3FHbnZIvkh4qnF0RbI8m2zIo17GnxV2+bwgVnfgM3U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LZFYgQ5fVueHg18bJ+GOjZjVhTHK3n1Nn3vRgCxQDUomk8NubbOr6nbvHEDtDk5FlGDWYwQx6ZC0fAwGYSib5C4Imc0Go2FXbfe9EydvBiMzjhkbBrhDBKn9LsaVZWofuwlBAjdRwdA04SdyvLFp8Otg8IKA1SjCS1AFstLNJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Q67U35yb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Q67U35yb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b949bf4easo705319f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775669660; x=1776274460; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPKJoXcFiZEHjruKbVgJ9S6J16xuB0veaEwyiyvCi0=;
        b=Q67U35yb5O0Yk80LuVjeuE3Jou8++czgnxOMErqzDr4jW0olOOREmfkO3HTZmZHTW0
         erM13fzO5iuxNSBTGBvKOz4nnD2WntAvTSnVhSW1eOuiM9DBkFezSJ4R6Mtu+TGDU7wv
         dx05lC+8iBz1I/+sZlX7TfG5yhhP4/TjBc38ymqgIp8zSFmmggf+d0kpmDQgVsTBIpvx
         Q8W5WeKawJj072YdJxVN4KY6dMJ+ob9Q6wcqsQdvhY5U9PpAhkIdOHor9zU5JXiOALcw
         DDnMCas5Dgz1ZU/hibcBRrMwA7uSlQCGJ5AOZyt9SvsUkmHH+CLRmVQsJsHWXrEp1Y4l
         pKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669660; x=1776274460;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbPKJoXcFiZEHjruKbVgJ9S6J16xuB0veaEwyiyvCi0=;
        b=WxCfcAcbBjMTRMMGD/3krxafNwsTV5YB6GPUhkSrzrgpXLLDAc77xIN8P0cdU8zBwn
         edX3i6G0Msta4VXCrYUjAElJJR+XKRbc/7Q2WvcCWRXZPk75UerY6Wmtw3/fIZpPOHxQ
         Cd0NFLyMmL46F4KNIN/QX8VvwijOMNN6gNBFKNpA/YzqLNKeUN7MSgU36+g55Or1Ub7G
         vlGV6hPOauGN/gXvKZOOCHIXqsQguM2bXp1Xy7Q4Bz7VGSfhCM7JQl3o5xy8CW0x+BvX
         vVwBEbQlZReO/9cB3Av+en6lxWrm15rN0zgAHzg4508/FTzzqkUr7vZ4PqyfcEyd4Skv
         OFCw==
X-Forwarded-Encrypted: i=1; AJvYcCVD7vo3N/bl1JFdB5FlG5Ga2IfyQjN3UMhP2+o3wXblty6kV0fEtcd9JXTs5Xn0K20EzhEB3fcnGV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCksZugpao/5LixGjQcXmZwgYTZIo2s3F/6JMen8O1SLcYX+ya
	CwP3W8E3XvynAWVO3eiEghm6MqfV7815k8glqH+LctF2+Geh/FWrAHPnj2PvJXzJN5k=
X-Gm-Gg: AeBDieuQLWxL0jz/VBH7GxxNOkY2RmarIACygbgKzhqTVS55OFO3ALsNgAfBOGr17tp
	5q3R6/KDCbv5u7IibN0r5LlyIVZetSWmFXtMcj2MiKKoTzPop4NPAlb2bsljXRF9v809V0BFaQ+
	sflY2x2ZFvMXpLENs/0OCiEXMMh2owlZUoxsdA2zXAWe/EUeyr85pgINKGYB80WvWj1HNE9tVR9
	taUc/mVT/JSLD46SF/A5rD+0bl8d6JXhoad4OnTV8+4jSnY5BGtm/HzCBXLElZiWx/UI94MX/Fa
	OdpaEiBvvqbO5+x9+DfSKp/N389edA4GDFUbYJTJ9qtLfRZcfjWeJio/oUFwUpAFiH1RFS3ZcEO
	sqGFWfHcCS2RSr2U12u1bDy7I0nHic+9G9XfCXG5Lv6Aj4GbVdUoq98uvaZZHK0I4TIBAF6efZs
	YcrUOlp5LjML7pHr8dzt0=
X-Received: by 2002:a05:6000:4b0a:b0:43b:a16b:ee69 with SMTP id ffacd0b85a97d-43d595cf8c2mr485116f8f.24.1775669659987;
        Wed, 08 Apr 2026 10:34:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d54d:290b:e0:25b6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e4d27a8sm60840731f8f.17.2026.04.08.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:34:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
In-Reply-To: <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com> (Chuan Liu's
	message of "Wed, 8 Apr 2026 22:32:56 +0800")
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
	<20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
	<89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
	<76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 08 Apr 2026 19:34:18 +0200
Message-ID: <1j7bqhtkyt.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 08 avril 2026 at 22:32, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Krzysztof (& ALL),
> Thanks for review.
>
> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Implement core clock driver for Amlogic SoC platforms, supporting
>> So how did all existing Amlogic SoC platforms work so far without basic
>> clock driver? Really, how?
>> You are suppose to grow existing code, not add your completely new
>> "basic" driver just because you have it that way in downstream.
>> 
>
> Firstly, apologies for the delayed response. I had intended to consolidate
> the V1 review feedback and come back with a clearer plan for V2 changes. In
> the meantime, Martin has provided many detailed and valuable suggestions -
> much appreciated.
>
> The original goal of optimizing the HW based on A9 and introducing a new
> clock driver is to reduce unnecessary complexity in the driver. On A9, we
> optimized the Clock/PLL controller HW to simplify driver performance,
> complexity, memory footprint, and reusability. Improvements on the HW side
> can also help drive corresponding enhancements in the driver:
>    - Performance: Encapsulates sub-clock functions, reducing call paths
>    - Complexity: Standardized register bits eliminate a large number of
> bit definitions (~1/3 of original code is defined register bit [1])
>    - Memory: Object-oriented design avoids copy/paste for repeated clocks
>    - Reusability: Same controller works across SoCs without driver
> changes (or with minimal changes)
>
> The old meson driver required compromises to unify legacy controller
> characteristics and driver styles. On A9, we want a fresh start.

I thought I was clear on the cover letter, apparently not.

*This is not going to happen*

You've provided no technical justification for such "a fresh start".

There no reason for A9 HW to be supported by different drivers than the
rest of the Amlogic SoC when it is quite clear it can fit with the
current drivers.

At lot of work by a lot of different people has gone into stabilizing
and maintaing the current driver. That's valuable too. If you are not
happy with current level of "performance" then make your case with
actual numbers and submit changes against the current drivers, making
improvement available to all supported SoCs. That's how upstream works.

>
>> Best regards,
>> Krzysztof

-- 
Jerome
