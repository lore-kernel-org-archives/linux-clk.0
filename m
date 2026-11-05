Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886001;
	b=ZHjpRWdTql3ivlLEOZxI1Vf0hyJ1yn5gUpzhjjZ84NPYJaBZPZjKa2DF6hXO/SUIDuN7
	 gP+b2C/u4yOs3OnzS/N/BiTEuFcg/vYjSuHRBqGOXrR9WGwuPmn1C8k536efhj358OXWQ
	 RR1irHBWpiomB+kEGfpsFdz1T85Mm4T0qQrplktI5aukgHVYHGrO6kkc3DAcH83wn2yrj
	 PHFgvvtptTLb95HqjSWqxlF5zvmXt6mFNJT+3F582Q2njY1MgOz5cAAwexw0P/VTOdoQT
	 udcPXRGVTk9LKgZXxSM4gdcLqc4YdIodtIKJrmmGEZBnjVTydCL6++TKDAezWTQhG1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
	b=gHfBKVb8OKMr7ZdySmjxD3UKgGRYW0CXcIDX3wyVYuvyDzqzOF4X9EyOeH23S0SwX5hr
	 5GqpJQ8rkUlqG88476gxRclC8Uqh/URX9bZC2m4GdVeI3DV4faJkwGOTmdaSRzHVWEh0J
	 vE+JupxpJTrd6c6tV/09SJGbSY2mLjNGRBdqNIA++EfwpW9rBAPuWfA3gE804s/1K3IMV
	 etD4LO4RegdT3lr7idYMNRxHFiBC3C9O2sbW8QA9GQi3k5jUsP4/DgM6xwzXg7lJuOo1s
	 1GDs2TPk1bxHKMVhLGCosZHOJ0yIHtvrESMrEum3PcdCZsCiCGWApeelj+i64oh+cTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="c0I/AgFi";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1C606A328
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C1C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c0I/AgFi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12906835e9.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793885999; x=1794490799; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=c0I/AgFiN03ahU6GZCs1367oOlFtvqtGWOmOreL+helVxrrmMeS/2mnp62I40u130t
         z7NFKbJ6IOV6LD/KmLHQSVkaEZeXkxgY6UCxvcLaaGaKBsvlGgq4RnKnSc5EYrKXvhTp
         wBC4onNHoDxjlFYuvofYuefFuFfLf7kOOc+uhtA9uiHTHqKDtXzb5+apZ+5590Tc6aWG
         3gSX1gRUWSh1NNdOKvkn9fdgMoFtmPc2TfmXQKa3ECGVJWQ69d+rRnZME7XYM2t2pjrg
         YSOmEnKWtuHh5qwN96YU+lwFVTMGpGzzG8nAjlEOwIGtKtQigL7y9oDkVDBMCbR3crP9
         fRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885999; x=1794490799;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=oVBk/tmyzdXiYsesZQkBuDxE5ZC/mN0erGV8fxNiw/uE0x1w4GQGK9vdwZIQZ0AdEu
         7Z811DTomXrgC1y5GItPDtEN7NMImo2474zYwZc7pvgT0MqGTcEoyOMADzyf1r1WEU1f
         BFD0X+cxX1ez0bfHdfZOx1xnHpB6DzV3Tu7bwukcLG9xY91PcUcF6sSibUIRldiFXObw
         V1eFhSZ+5Qu4wsecQmUJviRlgJrvo9ObZ3n6P/t4+M2urmTKkiv8yIVxaHSzpax0RmB3
         KjgI+0YAAbhx4WiZ14VW7kdusxO23n91Y9yvifNqwzdu6lCIdb2LAEO20suMowc+0f75
         1K7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrT6QGrJ73zDGeXkSKg9gYr4HpzVKLj4ndbj+fS3KoYxcs5ZljaUzHOn/aDP4sy/p2qxnRRsMlEtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D7vX/qm4zRKR4RmFRAlS3j8KFJifCPUbgLB0iGR2eqqL/DYUg
	meRqAMwVBtJjUXeAE3ie4EXyu4FLOWdheiWpKgHfMtK83NTwyVH9r/X+6CsB+Eovw8I=
X-Gm-Gg: AYBFou1oKPGYWw8QPHFNZ0z12vkT2bfYjJSUilT7XJgGvi8ahby/I84ZuVfAHV6+QYV
	Uq5elAfwPI+5yByxuPZk/v3f1doAAHJLDpmTdcJvZHPuEyVYHOB2UUpRnzhgTyySsG0xkK3WYLq
	HCvy6oW4KHTJtw4e5P25mPp60r9rtSE5jVMldco/PNz7k8KGNgd+z6AczvD2/bzfRcSkMRqUnta
	oAOSlW9guHNe1ynyr0AwfSrTkSrkRooe3BMfjkoNGV0/rEtxuOTr8BR0gqt1X547bHTMWJEjlMs
	IH0LBW+wOLFRrgfEbaH9IzRYU0rGuhgPhxPB4DDjQ2AOpaYNOCag1HWDH1OcYsCMYAax/S9rMK2
	+/T89shBaUpPXIEgHgpbzAiJvL9b1Gg0LSzh1sW1boIeu4lLBgiv1IuAJKVG8IDyd+WkbOAPsR8
	NLao4d2lWVZwBTUP92DTEIOC/PtSvz2dQKZX1M1b+WtIsAWd3RfXie4sf0EJ2BwXs/yQT4VqhVS
	2NuVcY+hQa3sHwmaDXF0WVSr/mZkvXQIsg11zL7nTzxbqPndy4D2kKnkjeIvWrS0sV8zfCkJpF6
	MeSQ1HFRqGwNbQvArIK0ajy5qlwhvMlOl7KkcMfnnbir1ePI
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr407422615e9.18.1793885998746;
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm64630215e9.0.2026.11.05.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
 <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Thu, 05 Nov 2026 14:39:56 +0100
Message-Id: <179388599696.2573818.3573650064673131943.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=jY1a/cgO/AsaKMem8B+RlbZOedbhgH1XS158DQz6dbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlv2nXPrdC+L/KnMu9R1D1tRzX9vYd/SKduvDY96+S2Z
 Tdu393N11HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJTN/N8L/a3f2p9Iup1qle
 KoeWqkfJv4jpybA4dudj29W9U+WudrgwMpy/8nfisn7WmB+KC1myC7YbqbNEOAjPtn3JYzfjRZr
 FGTYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-04 17:07:10+08:00, Jian Hu wrote:
> On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
> > --
> >
> > commit 5ec3118aee2f03855552c58a4a8533e035b565bc
> > Author: Jian Hu <jian.hu@amlogic.com>
> >
> > clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
> >
> > This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
> > a zero divisor value represents an invalid hardware state rather than a
> > pass-through. When this flag is set and the divisor evaluates to zero,
> > divider_recalc_rate() returns 0 without emitting a warning.
> >
> > [Severity: High]
> > Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
> > a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
> > set?
> >
> > When a read-only divider has a register value val that maps to div == 0 via
> > _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
> > CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
> > CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
> > clk_divider_determine_rate()->divider_ro_determine_rate():
> >
> > drivers/clk/clk-divider.c:divider_ro_determine_rate() {
> >          int div;
> >
> >          div = _get_div(table, val, flags, width);
> >
> >          /* Even a read-only clock can propagate a rate change */
> >          if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> >                  if (!req->best_parent_hw)
> >                          return -EINVAL;
> >
> >                  req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> >                                                            req->rate * div);
> >          }
> >
> >          req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> >
> >          return 0;
> > }
> >
> > Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
> > !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
> > in the kernel when div is 0.
> 
> In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use 
> divider_determine_rate(),
> 
> not divider_ro_determine_rate().

Yet the point raised is valid. The change must work for everyone, not just you.

-- 
Jerome

