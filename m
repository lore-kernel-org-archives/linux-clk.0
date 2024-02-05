Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85117736
	for <linux-clk@vger.kernel.org>; Mon,  5 Feb 2024 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707123920; cv=none; b=J3uYYufTF3YsNK6WdSdQNKMk5T8yXPUfEdcbYvdVaw4pXyq8KvyESwBRRopLG2dJVJl7AE9XClZv1OSn+cCSz5Mh4gTBybjRgTCAm1xBICaB6XCHHzhr5aWGWm3OuckQAOUt9J8r6apqJzHY0vNS78KvpbHO2OfF1b6mkz1w0+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707123920; c=relaxed/simple;
	bh=5uslP+6MiU5p4xB80AbckdzpFTK8AZLC0FSdU6yovsc=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=saC9x47dyGlCoWLBpocqy0J7QJald1HlOLp/L2K/bCeGtTC5KevbLuogzshYVIRKiYtoQFvrskaEB3LAwCgthp1bXsVDRO2t8c9uy1JSW9rV8tYC6UWgTiQjhVaVx380d/E6QuxUy2Zl4T7q3Vp/4d9QcTpeo6xYWPgLcXJncsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lO/DlnOT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lO/DlnOT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so9139615e9.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Feb 2024 01:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707123915; x=1707728715; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FrzyemCCCe25zosXOoDYB16obaNMd4rjugvPsL9t2Tc=;
        b=lO/DlnOTsaXup4aulR7ByDaFa5LT985S2rvMV1Hx7xUnl0oI9WNNsdQSfeP10vkJ7P
         BtCHPjqc41MMGhBxXifdUN1MeKZxTH0Mn4VsJR0dYOgdzlMsfoekMgmGLFnHd47SGiyZ
         dw8VLOl7b5WW3NvNAmn9581hxcM7zMMV26IhD3ZBdVq57stN7A04DHcSMqTteh9p67ND
         Mdn/NAZ1YE8QnhbO5C8fY4JtanRm76WmS13xxe751bsIivr8Rjygly8lP4eE9JY0NrqX
         ZDftsEbRC+6BtlHwHLPc642iM+LSxB/fXBkR/JGy1YWeVlLZdujpASm3NvJkvZwuuY2J
         uC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707123915; x=1707728715;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrzyemCCCe25zosXOoDYB16obaNMd4rjugvPsL9t2Tc=;
        b=CIaGL4SddmiiHBpkJEn9ANyL/74RKyrH/CQUjQRoky7k98uGb9RnWF9/hKtY8spyN6
         Sde5Bk+iKrhrx+3/UCRk868C+9O0PSHHW2AKgWkZ8JU1qJ0erfXOpj5tjK2Ei8NatYa0
         hMKaucptbdgRLfbIbIyZvJV8NRkHPq08xwIu2aHFaQN45VNtMgJ77S6aeD5vqZ2Hl9vl
         2B/eMwepVgs+/P+E1/sH4SDJem12VgjAHcCVwWHWUjL4ptXizKnWQmr66RV8cyKMrWYy
         jAiFhTue1tjiQFpmKlD00U33B9Iow4xE4OJUE6t6OjInp/YVkrrW2m64hU3gZVJB3duv
         nQDw==
X-Gm-Message-State: AOJu0Yz7aPw8Gguo9aGXjyi9t5zkIwXk2aCC0LW86Ysm9wQ2XGFt5MVU
	3psJGnOC24RB20BB3w5d6m44P63cbO1+Ogek8pBG2baARoVGPfnhQc3yK2YIeqI=
X-Google-Smtp-Source: AGHT+IG52hmC5Eu0sn2V0dkLHe/o74ig7s+Lp2f9Gnes0yU8mdwBjfMoRc4d5bnf/qpdhfHC23lgYg==
X-Received: by 2002:a7b:cd85:0:b0:40e:fa6b:f355 with SMTP id y5-20020a7bcd85000000b0040efa6bf355mr4202944wmj.41.1707123915229;
        Mon, 05 Feb 2024 01:05:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7Wqy/vaUuoF/84sU2+37uNkcfW0D2VCaoFNsTSZi4e3JJEHKNwI+us6HkHjkYhwNaV5JILIKpnQrvUoG+vj+nBRSXfWhLuT1oQDOMLlTKIt77g2J8TfZ0WjBKxk9MEFPAIq4YAUGWuTJwJClAwRQTEOqLyJTmj4CZQ16p2SaLVx+ooRoppxNZO7MW9ue09hSQzl5Y1rdyaabmK0aMd5l4DdacudoB1InieW+d1kF0KxKdE5m13iR9mHcTD9SMvgpNYidAHQoxxndHA0idnQffXO8gKa/GQS5JytIIb20FZb3IK7HwewdhN2Wh/N4RexHqx0hPg6sb9fsKGZAx9/9h9SDwUvmBrMhhWmT9sY6JqVxfrJm8y7qQuN4IyAZzccwvRgL8CII3j804eaqFlCcv1HkXcmHaD0gvaGXtZt4LMt+sBzA6Bm7rAaYzeABxbhF0ZKcCaYm/iHBoKq7m3BuG
Received: from localhost ([2a01:e0a:3c5:5fb1:455:1a2b:40a2:1766])
        by smtp.gmail.com with ESMTPSA id fm24-20020a05600c0c1800b0040ee8765901sm8029761wmb.43.2024.02.05.01.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:05:14 -0800 (PST)
References: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Igor Prusov <ivprusov@salutedevices.com>
Cc: jbrunet@baylibre.com, neil.armstrong@linaro.org,
 kernel@salutedevices.com, prusovigor@gmail.com, Kevin Hilman
 <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: Add missing clocks to axg_clk_regmaps
Date: Mon, 05 Feb 2024 10:02:01 +0100
In-reply-to: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
Message-ID: <1j7cjji8mu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 02 Feb 2024 at 17:25, Igor Prusov <ivprusov@salutedevices.com> wrote:

> Some clocks were missing from axg_clk_regmaps, which caused kernel panic
> during cat /sys/kernel/debug/clk/clk_summary
>
> [   57.349402] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001fc
> ...
> [   57.430002] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   57.436900] pc : regmap_read+0x1c/0x88
> [   57.440608] lr : clk_regmap_gate_is_enabled+0x3c/0xb0
> [   57.445611] sp : ffff800082f1b690
> [   57.448888] x29: ffff800082f1b690 x28: 0000000000000000 x27: ffff800080eb9a70
> [   57.455961] x26: 0000000000000007 x25: 0000000000000016 x24: 0000000000000000
> [   57.463033] x23: ffff800080e8b488 x22: 0000000000000015 x21: ffff00000e7e7000
> [   57.470106] x20: ffff00000400ec00 x19: 0000000000000000 x18: ffffffffffffffff
> [   57.477178] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000042a3000
> [   57.484251] x14: 0000000000000000 x13: ffff0000042a2fec x12: 0000000005f5e100
> [   57.491323] x11: abcc77118461cefd x10: 0000000000000020 x9 : ffff8000805e4b24
> [   57.498396] x8 : ffff0000028063c0 x7 : ffff800082f1b710 x6 : ffff800082f1b710
> [   57.505468] x5 : 00000000ffffffd0 x4 : ffff800082f1b6e0 x3 : 0000000000001000
> [   57.512541] x2 : ffff800082f1b6e4 x1 : 000000000000012c x0 : 0000000000000000
> [   57.519615] Call trace:
> [   57.522030]  regmap_read+0x1c/0x88
> [   57.525393]  clk_regmap_gate_is_enabled+0x3c/0xb0
> [   57.530050]  clk_core_is_enabled+0x44/0x120
> [   57.534190]  clk_summary_show_subtree+0x154/0x2f0
> [   57.538847]  clk_summary_show_subtree+0x220/0x2f0
> [   57.543505]  clk_summary_show_subtree+0x220/0x2f0
> [   57.548162]  clk_summary_show_subtree+0x220/0x2f0
> [   57.552820]  clk_summary_show_subtree+0x220/0x2f0
> [   57.557477]  clk_summary_show_subtree+0x220/0x2f0
> [   57.562135]  clk_summary_show_subtree+0x220/0x2f0
> [   57.566792]  clk_summary_show_subtree+0x220/0x2f0
> [   57.571450]  clk_summary_show+0x84/0xb8
> [   57.575245]  seq_read_iter+0x1bc/0x4b8
> [   57.578954]  seq_read+0x8c/0xd0
> [   57.582059]  full_proxy_read+0x68/0xc8
> [   57.585767]  vfs_read+0xb0/0x268
> [   57.588959]  ksys_read+0x70/0x108
> [   57.592236]  __arm64_sys_read+0x24/0x38
> [   57.596031]  invoke_syscall+0x50/0x128
> [   57.599740]  el0_svc_common.constprop.0+0x48/0xf8
> [   57.604397]  do_el0_svc+0x28/0x40
> [   57.607675]  el0_svc+0x34/0xb8
> [   57.610694]  el0t_64_sync_handler+0x13c/0x158
> [   57.615006]  el0t_64_sync+0x190/0x198
> [   57.618635] Code: a9bd7bfd 910003fd a90153f3 aa0003f3 (b941fc00)
> [   57.624668] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Igor Prusov <ivprusov@salutedevices.com>

This has gone un-noticed for a while :/
Thanks Igor.

Please remember to add an appropriate Fixes tag for patches like this.
It is important to help stable releases.

Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")

> ---
>
>  drivers/clk/meson/axg.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index c12f81dfa674..5f60f2bcca59 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -2142,7 +2142,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
>  	&axg_vclk_input,
>  	&axg_vclk2_input,
>  	&axg_vclk_div,
> +	&axg_vclk_div1,
>  	&axg_vclk2_div,
> +	&axg_vclk2_div1,
>  	&axg_vclk_div2_en,
>  	&axg_vclk_div4_en,
>  	&axg_vclk_div6_en,


-- 
Jerome
