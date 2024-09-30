Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA407DA6F
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727699594; cv=none; b=QpejEM5AC2cRK3Bei63dsjGqy/RJuJVLFGJdpG+Lxki1zRmFvDceyN7COalTW2tZkkR5lRU1WDQ5xtvEg+TIWhJ7HYcNki6IRnQ88Ic4Zry+f2zmFXZlP4/pL8jFkiWt93AIXDA/Q8IDq2XBZO3ZcPwz2lHJUtaN5BUWkzgWg7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727699594; c=relaxed/simple;
	bh=LyzJmmS8LJTwx8gYpxEgleRy+bmQX7rq30u7XI/LQ8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tSRLyPxbkn+OnDmUNdKUN1d27+RfFuJg9huP7j15NFMYjnM9rG1UuUK0WjymMHTf8GIKJ01IGDmuEzLoQ/KyQL2oKUDcF8HbjxUWL3yGjvDnxYdga5w7NEu3R8CzaNp4RgJLUg23UqqgexAKwo+32rQTLi7Z2Zc1EchqfL67Tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=leSmQSfx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="leSmQSfx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso2889458f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727699589; x=1728304389; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcTFAf/39stw2L9rW+QSJlImzmwdaZ5jPtnTMrK6EJE=;
        b=leSmQSfxWbg3yBwX/2SxBjSUG7U0uzsUy8P2gfgjT4cslVU9OA+u36hUaYB+G7QHTh
         0gXkqIW3d8llJaKvHMhSVc+nTN32vrsTvQ97guoQSPLc2xt3NR9aFMhjkKTt6e3s226J
         QuZZNUz98xv0fTcrPd5JCnHbBUhKhZ8pZZE23Ph4QrfmcYtWdL8aexS1nCMNAWov0KG+
         3I6q8aLqn/QwGIJfb76Ll+mGcgyABnYX3ILOE/g/x8k1kjA9fvf6gqhLkaOeQXeXkEzo
         vJo+CxT4POlymwaSar2RMoghk0S134eXJ6ETRfBzTz/Gs01lEjTGADqtQ9gWpabXeE68
         rH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699589; x=1728304389;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcTFAf/39stw2L9rW+QSJlImzmwdaZ5jPtnTMrK6EJE=;
        b=T6XHEqiTEOm6aaJUa7jKq/rEdHMREvisKrKWhNGKOgcop0djWEsiyD6u6WkbqOdasg
         FG5irSN+JZaKlME8MHTWqC1HHq9WBc+1DMhqx4hyqV3cQ27JUXdf0um8f1saRIIro4Hz
         jEVi4MsSWbUGue0CUC1OllZatrT6izXOogd9jA/Qh/RTBOFRgxCWvevOutOOFNn2eSr0
         RU+50lRSPWEQWnBcEb0ABRSPCNsR64TizKRWO8oN/GJsAMcAOHxK/k6Nt86Q1O0LwvNC
         5a24bOFWn1xgP0I2FLOwKeTsJihlpmLC15OqmMBQvwkSFK25xkeO/wPEgeegXYaSAaXW
         9KxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjxGpA9kOlRC2ccBBiEcYYvTXJTb9YTrtiFaqW0bAeZLq9OapoJGaIc4IUwpFyHywfGfc4MxHIT84=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiZclftCzPUaXr4oHJ1qlYZSG1HyFpH0nR38d9VRJPBLBqQDW
	/FpDTwHoA4RjDg1jvogh5cVT6Caht1J/l/KXHry8edFda7phcjMJj0eTVtixNvg=
X-Google-Smtp-Source: AGHT+IHTY8puEfxRrHvmLqweSOnoM31uzsPdJHEBi2OMm0NwVB3ar3t6Omd21i9AD5kxBgtkSBpjTw==
X-Received: by 2002:adf:f1d1:0:b0:374:c621:62a6 with SMTP id ffacd0b85a97d-37cd5aed352mr5657657f8f.47.1727699589487;
        Mon, 30 Sep 2024 05:33:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fd9asm8996599f8f.75.2024.09.30.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:33:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] clk: Fix issues related to CLK_IGNORE_UNUSED
 failures and amlogic glitch free mux
In-Reply-To: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com> (Chuan
	Liu via's message of "Sun, 29 Sep 2024 14:10:04 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
Date: Mon, 30 Sep 2024 14:33:07 +0200
Message-ID: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 29 Sep 2024 at 14:10, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> If CLK_OPS_PARENT_ENABLE is configured for clock,
> clk_core_disable_unprepare() is called in clk_disable_unused_subtree().
> Even clocks that are configured with CLK_IGNORE_UNUSED are disabled,
> resulting in the failure of CLK_IGNORE_UNUSED.
>
> To ensure that amlogic glitch free mux can switch clock channels
> properly, add flag CLK_OPS_PARENT_ENABLE to glitch free mux. The issue
> that CLK_OPS_PARENT_ENABLE in CCF causes CLK_IGNORE_UNUSED to fail is
> also exposed.

The problem is that you are mixing problems together and it makes things
rather difficult to follow. There are 2 distinct problem, there should
have been to distinct patchset, even if you reference the CCF one in the
Amlogic change.

CLK_IGNORE_UNUSED is no guarantee that a clock will stay on, no matter
what happens in the clock tree. I explained that to you several times,
and it is the very reason why you are being asked to justify each usage
of the flag. Most of the time, using it is wrong.

That being said, there seems to be problems with CLK_OPS_PARENT_ENABLE
in clk_disable_unused_subtree(). As it is, I think
* a clock with CLK_IGNORE_UNUSED and CLK_OPS_PARENT_ENABLE, would 'leak'
  an enable, essentially making the parent subtree critical.
* All parents of a CLK_OPS_PARENT_ENABLE clock would have its
  CLK_IGNORE_UNUSED ignored as a result of the enable/disable sequence
  (note that in any other circumstance, enable/disable should indeed
  disable an CLK_IGNORE_UNUSED clock).
* Parent of ignored clocks may still get disabled.

I'll be sending a proposal to address these problems soon.

>
> glitch free mux channel switchover failure issue(Test vpu_clk on S4):
> step 1:
> $ cat /sys/kernel/debug/clk/vpu/clk_parent 
> vpu_0
> $ cat /sys/kernel/debug/clk/vpu_0/clk_rate 
> 399999994
> $ cat /sys/kernel/debug/clk/vpu_1/clk_rate 
> 666666656
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
> 399987500       +/-12500Hz
>
> step 2:
> $ echo 0 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_parent 
> $ cat /sys/kernel/debug/clk/vpu/clk_parent 
> vpu_1
> $ cat /sys/kernel/debug/clk/vpu/clk_rate 
> 666666656
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
> 0       +/-3125Hz
>
> In step2, vpu_0 is disabled, and the vpu is not switched to vpu_1. At
> this time, the vpu is still connected to vpu_0 and vpu_0 is disabled at
> this time, resulting in the clk-measure not measuring the clock.
>

If keep the display on and managed at all time is critical, then may you
should consider having the module managing it as built-in.

You would not need CLK_IGNORE_USED at all because device would be
present before clk_disable_unused() is executed.

Past the late init, if no device actively use the clock, disabling it is
the sane thing to do because nothing says it will ever be used.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (2):
>       clk: Fix the CLK_IGNORE_UNUSED failure issue
>       clk: meson: Fix glitch free mux related issues
>
>  drivers/clk/clk.c                  | 67 ++++++++++++++++++++++++++++++++++++--
>  drivers/clk/meson/a1-peripherals.c | 12 +++----
>  drivers/clk/meson/axg.c            | 16 +++++----
>  drivers/clk/meson/c3-peripherals.c |  6 ++--
>  drivers/clk/meson/g12a.c           | 18 ++++++----
>  drivers/clk/meson/gxbb.c           | 18 ++++++----
>  drivers/clk/meson/s4-peripherals.c | 32 +++++++++---------
>  7 files changed, 122 insertions(+), 47 deletions(-)
> ---
> base-commit: e736da1956cf0880a02ec5023f3487eea7611b5f
> change-id: 20240929-fix_glitch_free-290c88923c31
>
> Best regards,

-- 
Jerome
