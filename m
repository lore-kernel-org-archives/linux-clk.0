Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807F316917
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792658; cv=none; b=q0BLg44vi5Bz3BcumxBED/GT+TxsTjuo/W9cVy2R3B0UE2D4LeCojmFq0OGr433fVeha2Z9ob6ll9z9XPWgR3kGQdMfGU4oLUatX2PW31Zkpt0MLB7E+VV6h0mTlnY66aPKKJe6SqC4ng8056+vo5gl89GhBt8KNlHBXeO1jEp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792658; c=relaxed/simple;
	bh=ytHIDgU/qJ2cOfjrTacAh9vt9YGb5WOKdUkBnY4rcBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcKJtyzWOevZay4y0/BtrfmVf37QKbWnv148aAc+QVmP4csbN3LW5K/rdNe+Vc42ixrhTsrSwlzLqQxhYrW86mzsxsULLWgyHDNJHjiZknSeKyx3p2ShS+M9eosvj53gSX5eJYwVuf9gyn8HdoqppXP2rHvstwnOiky/CVhJ2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5db469a92f7so913531137.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 08:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792655; x=1763397455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNNWB8RzQw4ag+R4GGbGdNDxdfn6zllvkiSdySRdu9E=;
        b=h3/7IGWj21cAYV2iTWnK900eX9j5CFb7WmXMVrb3tIXKjQNyPh3A8/7lodVfS93LIU
         v6a5KlQ60CJ18T0ikhnpGiQCDN/r6BjqX8yL3mDy4fAYhsfu5FlHLbGXwgBVla+CCvOC
         ZkS5enHQ2hdXGXJm++IsfHPRml7T0ylUszYDqNKZg9W/VKYTK7vdd8WymM55YPa1Or0T
         I585ZM77DV5tGaz9LyvsQrFvixBzT54BE308kuwfVHEdYQrwaizy702sLjaHBw3skHUT
         rl9rpcCwKgo4DjAyk4GlznaHnyqvTNHvoicaz3mstyzYXVioB1fN1J8BFF2v9yKDvaDm
         lLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2zQI1Ol2tRgwKkv/ugCmbQVNuyTAfMhT88iF4I8YApThwWskBnoYmYQwpFNH0KllsGyu6Khmg2QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Fs4QuWu518duy7R029/+Ml7kWiaS6+nMD7LogPfk/mHz90Wn
	+Uh6LMBkRSpDy2Xpae1oiKD1ZZQOUuTyEhcoaQz3uZEraHg+3zhnK3HM35Bf2bmv
X-Gm-Gg: ASbGncsiTp2HXo+sfeUUOXFGUMseVAS8nyTaSYAlwH7chSHPu67HS9PDp9uAThSpY6D
	UUNBSxCjG/JEuV1v6l7i27E5Qd83kSEGkLyVMhl5SYQOJPui8/omO7yVQyWb1bHKswY0udugOBi
	0KG7Lv9UlTXV5qlCSxoIq4Rnw5R92Ds46ShZfs9W1m85EiywXxDk5+fi46LCvBHTaqoVS569HDL
	3mUJD67FaVVafJfSTSpBbOgFcJmCC8JwiYA3bUrFDNcH+EngI+bOh2/6pOI5G10q1p2RvJPClRs
	gTIKy67dykHtULMoh4Wz24u8j5/0xemyPOJkKzVRx/Ygm29eL9wCj3GI3QTyYWH2GiHzaw1yPPh
	kseDwqq3veZTSasFxbDYk2gf8AM9HR9hArXf+tRqNHrT6m1H9RmIYF1l5FCHyPS8Ev9JXxbXfs4
	zeDJG6SggX38C96Ha9lBrFn9VDPltBze9487Py+F/tvTo9T3zJ
X-Google-Smtp-Source: AGHT+IEZcZpLLf2Sg7REPMWrgXpiS55tR1SJsXzerzFUdM8RVg6/7LRgISVlJ9Yck3sNvC04GtLlkA==
X-Received: by 2002:a05:6102:26c6:b0:5db:f9df:34de with SMTP id ada2fe7eead31-5ddc47e33a0mr2380556137.23.1762792654887;
        Mon, 10 Nov 2025 08:37:34 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937088206a6sm6032135241.6.2025.11.10.08.37.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 08:37:34 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so1185638137.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 08:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3S09Lcx507G6tTTSJpDXgmG/j0+DiiMRHLDWnlSulOGqk+7x0qxZgQNEVJYl9ck49oqT+TsiJ6Is=@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:5dd:89af:459b with SMTP id
 ada2fe7eead31-5ddc467f048mr2635129137.7.1762792654419; Mon, 10 Nov 2025
 08:37:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030061603.1954-1-vulab@iscas.ac.cn>
In-Reply-To: <20251030061603.1954-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 17:37:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrngq2P+uPq79Rgi=Ba8hYBftG8ztSGXxyTvppqwYc1Q@mail.gmail.com>
X-Gm-Features: AWmQ_bn0aO0m42o8pyfa9vnXYaa3ntXxxVMU8sBWoUFD7yP4GCSqBzv-mQ8MKV0
Message-ID: <CAMuHMdVrngq2P+uPq79Rgi=Ba8hYBftG8ztSGXxyTvppqwYc1Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Fix memory leak in error path
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Oct 2025 at 07:16, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> The current code uses of_iomap() to map registers but never calls
> iounmap() on any error path after the mapping. This causes a memory
> leak when probe fails after successful ioremap, for example when
> of_clk_add_provider() or r9a06g032_add_clk_domain() fails.
>
> Replace of_iomap() with devm_of_iomap() to automatically unmap the
> region on probe failure. Update the error check accordingly to use
> IS_ERR() and PTR_ERR() since devm_of_iomap() returns ERR_PTR on error.
>
> Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
