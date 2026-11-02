Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635405;
	b=cNDo4p2HZd57YuKXvel3ZSf1jMcFXabcaBGwELeWxZ1NfzrRx/2gBOMxLERWSnOqnXyF
	 Wj+mV1SDZm4kjjlAHH6eUnDQjkT5WoZwqWxmcQOmZ063TwSyFaJyYR5Jz1nmuhikMt4xM
	 RkgtxtSL7hXeUtkc4re+E78SEchgBIxLLEf+H9wUXTpj1EPgXT2nHztyywqgMeBJ6+Pto
	 JiYVd3iUF86MD5sGOJsAUzWLYhYptDshRRNL9kfh5rRZixWLA0z3W8R+BbVG+uuhO4pym
	 hd2VF/Sy1o3HDyUzm9Pm7TsO58MCloIdLyNIBHti7Lw96PpZbvM4SoyOtP1kXmfFK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
	b=F1r3UzVBYOHc9r0W6FTGZUkhV5O5IBZUq+JJtEzoQm5ELuRdLQ8LdM71wdn/nOFymh7K
	 WJWpQefBNqM/yV7aQvC1fMmotsGPIUnrvo333R5mp2r5fWgyEdxZcc3R6SBYrzQGkm3vI
	 Pu6lYVB54gmHKN0CifTekaOkyADWA1+g4vqUoIJrBXYiih0W/6fH8LS95szjwYGccvoFw
	 5ku9AKRbhqX6QzA+GLzMNMH2qBgUYCUNM04WdZ2YNlvmMpVDoitFZJjiEZmDKoIDLvzJH
	 QwaFuQiAFsoUHyHZ+OEagtSDAeasYAhVfLwD7sJM4E2bZJ77fOMCh5ULjOzopHymAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F5606A5A3
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 16:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07F5606A5A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso7521903a12.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 08:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635403; x=1794240203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3vbLOX9hUXZuFkvJUQUq81vQYgMMNAerq8+/A9OKKiU=;
        b=QmQGCOHsj+wUrmMZqRFu0vJPgIeFim9UoLLChIgA3OeCa6SrmEJ3TQ/Ow2+DOPDSb2
         JJK+xbmaz7k4hFp0vpmSr2rTuo2g0oxkT4+QsP/AzpMvxNXJjqmVYBuupWoxyyzPThKR
         bY74O4WsyktpMhpNZ1/BSUwSWOng0yRVs8WxlJra9471aPRhMQBwLJsOePYz4KYItRIu
         3lyD3yRVEGIRgQ3reFz3k1aZEexuV3iMBAPAw4nb2HhtYs/od8QW+cuPQJZktWSb5PWr
         vbgpCV3NIcR8zeQkFpwaRS22Em3X8BPgvGwBLBjSeO4nDSyrACKeallTQNy+6+Uy6yTG
         hqDQ==
X-Forwarded-Encrypted: i=1; AKwUvByjlTUjZQeuITj/tvC3Q7SpoC3hEPZcuj5u1WVcSd0+Mg0e12Sj9TrMKcDzIE7aigjKLxOEmV6P1ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/a42m1blwgzxmjPrC9ioyy1NVZWRHYB1owT9ub8jkNah2rNm/
	oAU5TAzPpocY/o4yJrN6aS0iOSWpAJMQFPm5Ai5l2YHmkiogsA939TgDh+zx9Voy/Eg=
X-Gm-Gg: AYBFou21EenMc8maYW3/9Z5r0euJLHlRMknqW+CsHa0cwo8Zj60FQVXskyA/E9ORdeg
	XEfuIwXKKZ5NhVYmHBzgtl/QPrAI2jhNnEp4ftKrY9XWcmCjwpKC7GQmajkYTBtYG5radxa3wGg
	V3tbJ70FAODcfHoOd3kFoSucYLTNnLjTeDxK5RmmUppYO7YRyGgJWuaBhTwywOtlxW3Kw46P8WG
	ETH/LPMHhf16u8v1pyUUAQDRgp4perDe4SnSHOg2kJFUbmS3Ez7esnO779WgE9soQaMIPCAr6Jv
	3II/LpD6kbZtbi/CPpZ9jzrbiT+kSfcedI2VU3quN4uucnMDViOnc4N6HI/4OLGKp5gqtkGdjbk
	ZLa9wMiH/ib/tAPskRgyzTk/adoKJ9q1UmMHuwtFJkmTsXhXqtRN/Xo26qukaQeW0MoCKS5jPjo
	i4z8yn8KRESFMg2tcHnG9Xd4GqTKI/s6PHW+qtBXIU7TbVQxwgLUZz8tFa6TjR+zGFmr/8CwBfR
	YPgzU463t9b8CF3EOrP7T7V0CiPbsZrb9QobqgViv3DXtGPzYFIvJrY03YL2cT6wkui72w3eZ4Y
	FE8D/GyDImIp2y+WSCOEp1Ht0vIV0qX7MwxiM/2acjS56MCwmHlWtXEWfq82zaFpIQ==
X-Received: by 2002:a05:6402:2b8a:b0:6b4:582e:91f0 with SMTP id 4fb4d7f45d1cf-6b4d4a7b14bmr6955682a12.4.1793635403092;
        Mon, 02 Nov 2026 08:03:23 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee975sm3473270a12.13.2026.11.02.08.03.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:03:21 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso6816626a12.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 08:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymmYfw2Mj5xpHZEBPqCYZk1negSfZBh1G5wxrem0dsahoqmgvHkJWyUtjK/ZFSYY5RTDHLoq0lLWM=@vger.kernel.org
X-Received: by 2002:a05:6402:234a:b0:6b1:a67b:d378 with SMTP id
 4fb4d7f45d1cf-6b4d6d83607mr7493394a12.17.1793635401030; Mon, 02 Nov 2026
 08:03:21 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:03:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
X-Gm-Features: AclHuK9e8kCdmujm3UbBsCP_C2y2QUNK5imSGIGpgUeiTEwk-YufKAJHK9WyYf0
Message-ID: <CAMuHMdVv8JW2fdZ80qw+TUBjG3Rt7o3wKvbbm+T9vQCzd_mMYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Forward PLLDSI mux rate requests
 to the parent
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The PLLDSI mux determines rates itself, and on the LVDS path it reads the
> PLL instance from a parent that is not the PLL, addressing the per instance
> parameters past their end.
>
> Forward both inputs to clk_mux_ops.determine_rate() and let the parents
> carry the request up to the PLL. The parent encodes the output type and is
> selected through .set_duty_cycle(), hence CLK_SET_RATE_NO_REPARENT.
>
> The mux wrapper is left unused, so register a plain struct clk_mux.
>
> Fixes: 3afccee4a3b8 ("clk: renesas: rzv2h: Add PLLDSI clk mux support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
