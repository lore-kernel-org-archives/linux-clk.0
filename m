Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A38E14AD3F
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606267; cv=none; b=eVulHbqdtvlkuOYrXs7KN2ea/4xRiEf5wbJDN1IwNAkPGJRVoKo7rXbDOCpXXy1nO93bypO/7zAJNwNPhCLNY92pN+NEbxy1i4FLrs7vrbUIinfvolK8mFuc9wjAaOilR98AVZ7uXzwI4xIDgRl3gNptims6GTA57BZTS8Q0THk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606267; c=relaxed/simple;
	bh=8WjZia20575zWwWqBXNo4kBtOCi4n8bCZvJqfR2vml4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MzvWKXjo0v2liQosCXCA40W+CS3gU275iJ98qeeW+JuA6+RGq6kAp/JW2U6pb2eV61ixBDF+4Joeb0nIjQdw2u2submPh9f1wYQ/wZTyhzcrzVYY/hIRCj81lJnDUMTkUsBV1Uax1UUa46JV+SSkXrcoyNkCAyqoSyo9ejo56Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hCenTb6e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hCenTb6e"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso12454255e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2024 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725606263; x=1726211063; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmvQ+Tp6rwj8ytkbPRHE2L4V7NjEhAGYliO1vaPNhGg=;
        b=hCenTb6e1BckR3gufECmL1ihXasB6qKBHcGNdNiX6rH7SXGtigQqRGVbJMKqkO9Rd/
         YaN+vvVx9UO93yUupadZzuE0O1upp83Ou9PcIeFs6dp+VmoqBTcu854zJgofFX6ht8lW
         sttSciWlnWq1iOgy1HRwLWAnhG8tR+H5f8N3DeVLaVlCko6b7zaCpPtI1rePjL+RDUGW
         IDsYdKeeO7nzOIJTuj9jUJfA4BacEz5Kfa4GeWqZ/mvqCE/1Dp/STmYKBc59fx8/aIlS
         5jXCWBgV8uAvra657YpoMBwePp/OUauG7jCrENJX5CfnKb3J7SdoKGAZL0dTRkTYOTJN
         4LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606263; x=1726211063;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmvQ+Tp6rwj8ytkbPRHE2L4V7NjEhAGYliO1vaPNhGg=;
        b=WVcfx1xpda1kzZl/hEuFpnd122dytscu6XZtwND3mCFZav3V2dNi0tHHW77g0Fhzmz
         bCVWJapBhpEt1sowTbDkxtdGUhA5gGZ1x0vyzo9os/VXmumD/W2/79WRPLD3ypNZjCPn
         oM5iglmk4soYO8pKme4PkHUAL8Xhp60Ej/rNmeB6UAtkuJlOvKCZwBKs6Xzhs6XWHA4y
         W+vst5Rh4aDWlnygOBUcVjNsBZVRp1q0O8l7mmH0ddWayY5Ra8LrBFXYBApr1ECx1z9o
         OEzi+ZRWfzving+hFiNJWQ0ivVn9PtaAfOLASUFdbHEqUBaspntuQKarA4Jw0CYuU8O8
         BCKg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQWMH6YxZz8fwn6znxL0wyHbzRB4liHG8i/NRr3RLeMDQoDk/c+3DgXKihoYMs4QcZJYv/kldc3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyItaQuMbRavC5dMb1lhimBi51eiTjx6ansZlFHGYnQuq6yIRAD
	HhBfgD4ugZ3Tnnh5mD+GCVoAZWPxJ+0rSb+5hwTYpE1Qq5ONNfkS38ElDRPZIeY=
X-Google-Smtp-Source: AGHT+IGlyWHVSEWro5k26v/9BbprNSe8PT6hvmfZpe/tLbwFZ0rhCf+beAnjTByheeKXnnumuvMrBw==
X-Received: by 2002:adf:e747:0:b0:374:c847:866 with SMTP id ffacd0b85a97d-378895cb1ddmr1033472f8f.23.1725606263243;
        Fri, 06 Sep 2024 00:04:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c70d6sm10465345e9.5.2024.09.06.00.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 00:04:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:32 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 09:04:01 +0200
Message-ID: <1jo751qn4u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> Some PLLs with fractional multipliers have fractional denominators that
> are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
>
> The hifi_pll for both C3 and S4 supports a fractional multiplier and has
> a fixed fractional denominator of "100000".
>
> Here are the results of the C3-based command tests (already defined
> CLOCK_ALLOW_WRITE_DEBUGFS):
> * echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
> * cat /sys/kernel/debug/clk/hifi_pll/clk_rate
> 491520000
> * echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
> * cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
> 491515625       +/-15625Hz
> * devmem 0xfe008100 32
> 0xD00304A3
> * devmem 0xfe008104 32
> 0x00014820
>
> Based on the register information read above, it can be obtained:
> m = 0xA3 = 0d163;
> n = 0x1 = 0d1
> frac = 0x14820 = 0d84000
> od = 0x3 = 0d3
>
> hifi_pll calculates the output frequency:
> calc_rate = xtal_rate / n * (m + (frac / frac_max)) >> od;
> calc_rate = 24000000 / 1 * (163 + (84000 / 100000)) >> 3;
> calc_rate = 491520000
>
> clk_rate, msr_rate, and calc_rate all match.

Thanks for the detailed description.

Is there a possibility this applies to the g12/sm1 as well ? HiFi PLL
has had trouble on these SoCs since support has been added. It sometimes
takes a long time to report a lock. So long we consider it a failure.

There was no such issue on AXG. If you check DT, it is the reason why
AXG use the HiFi PLL for the sound card and G12/SM1 does not.

>
> The test and calculation results of S4 are consistent with those of C3,
> which will not be repeated here.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (4):
>       clk: meson: Support PLL with fixed fractional denominators
>       clk: meson: c3: pll: hifi_pll frequency is not accurate
>       clk: meson: s4: pll: hifi_pll support fractional multiplier
>       clk: meson: s4: pll: hifi_pll frequency is not accurate
>
>  drivers/clk/meson/c3-pll.c  |  1 +
>  drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
>  drivers/clk/meson/clk-pll.h |  1 +
>  drivers/clk/meson/s4-pll.c  |  9 +++++++--
>  4 files changed, 28 insertions(+), 5 deletions(-)
> ---
> base-commit: adac147c6a32e2919cb04555387e12e738991a19
> change-id: 20240904-fix_clk-668f7a1a2b16
>
> Best regards,

-- 
Jerome
