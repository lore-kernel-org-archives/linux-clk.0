Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E84EFFDA
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563749; cv=none; b=Q0GQDYTP0FdY6ZOkHlvWUU7Od5jqGfDfEs+ZnS3uRK4Tam49wy6HTun1MhDXmeRFPKoN3KU4MUbq0ZawPjWlmxwQBd7G6H7c4xyhitarRfj6yPtyF1m70/qZs/PQz7GrjTC63edH1WztTfUvPXzBJUHUfDsSFtyec2Tqy450zEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563749; c=relaxed/simple;
	bh=hXThr6zhVSCw7eyzumaxd3t+XIOLHCoMx09cTROxa1I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EQaC7UlZs8OqHlchD9RCxEAFKAuq45/U82nXUWKePk+bSp59rJgPG11mwJ1QR4Sxr3p+cpUw5l3JrShfbctUpGT0Lt0b2XLEklsIhDRc/NJaYvFAHh2Z86gimzsUpKIq+lnixuDTXaydiuHPmGQyR1tcgnAAoDLLn078vB5Nsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FOTwTALq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FOTwTALq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso297805e9.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563743; x=1792168543; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=FOTwTALqzVIKwAUtLI0o5un7ZgtMshMr5eUC0kSYb0ZXPIKugYCEfjrYSbU/Eh3XEd
         Kr6SEt0eDWCFSTwbeqImhMNeMLXpgJYGnNZEoGnYHEnhpw/0idrcAPBhv4rXJ2D8LY+C
         CogvvTaBrD8uoUhL+bMyqteuRFqcTWVUNb0j9CLxabfN6STy3kpn5fEFY18knsnPLVkz
         udfrR4eb7BJSw/EbJG+V9FIrzdQLb0S9CCPIr22iU0MuIQ4vxe0jEypB9GCTiLosdoZ4
         d7CJa+EbpwsgHZl2H4142nwmkAKOP+muUBug8cOmLTlqNXFkGp5hi3tk79TTFFAaD3Hl
         C/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563743; x=1792168543;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdgP+LEBhWdZ6XqNXqiPHmxSydOTb01rv311lK+N6t4=;
        b=HsTy2LPosi2PnBcVxZe/ZLUeBsYtl6M56vHMefXmDx/AI8HKqHYoALIJa2bspQ9uqk
         6FxMBPv2NLAQSehOrUpaDnsmcFgc3TkfezxOFQTvk1NgGYqNYDlSp5Klx88XE0vzh++F
         KnysIxQTZRDl2yJt4ctqYuQWBwHCo1ben+1N+eP5r4XDIEjhCGM2t0S6IBH9zee2+/QD
         TqeLwfSeC5l0vnXErYlyk2VsVugjreJKO8KXhrt/0ABu0VedO4a8LLVec/FG+v9wbhAe
         7vVj9gP2fVxoZUWAKEqcjKUEKzwtfqocLOb1GbR0GJOazRHRmMxRvw/f/LoeUOAwZm0Y
         YQFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8zb7KERXy5/RdNXLZgcaxmAx11f9UEpcVP3tFv1LH329GT9FdBrvwtoyxbYXQXuVYMvaALgXk3xY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYyreEr2aykT35Z3vhelZmHsxxKdqquhjzfbPL8LhFdW2H5tTq
	Kxc6kA34Vm7YSe6vr3ZUtkBiwmu83053IyG4niIY9A8ddSyFiqIoM0kgRJPMig2/VdVXIolulkk
	KhwH05AVDuA==
X-Gm-Gg: AYBFou2fZXFBq4kLbjMjZK6Z+UqjgSq8DOWSmVtjK3g04YE8Tkm5cyxdPZeTIQHVg1D
	hyk5egr6zHgtY1toiyP+pPBx6+Ee4xcdI1wEgRxqWpbfhj/8EttwvAZe++rjIXmcGnQoOnsi1w8
	stYyWWEBR9OQ27AQxl2grA4003QEEym4neHxCQu6WsobKNdCVD6d+W0wqN6+ohYbElJ3NVK7/9x
	UJXfsqU1vRyX/CtdLdZc54bt/YqJw5fUg3N0dO+qkeluQ3CBoLWzVkwI4pOiw6g3AaSOrKW/lbh
	CMynYO9MINKaFI+BvEMglJCLP639LC2abJNsttYAbyuqhM4XySFT5enlDvi/M5yffhMz/w6rvZA
	kIckkyor09GvW/fRD9WBpCms7rVd/F1w9rYrFVgB8f1jFddLtlYbk6NH7cKoNpcmFJd++nKvHBU
	OnDT0eeSzCd5BC4OCFva/wuBtX2VUBXBUTZkhxRJ/LlBhIq9oiJ0ZJJ1/d3Hvyn2JsROZt3GYR7
	Dwk1gO1nzOVNvayfg==
X-Received: by 2002:a05:600c:154c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18e4aa310mr46374285e9.17.1791563742740;
        Fri, 09 Oct 2026 09:35:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf0abcesm77676145e9.1.2026.10.09.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.9518640684856472728.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hXThr6zhVSCw7eyzumaxd3t+XIOLHCoMx09cTROxa1I=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9c4Xp3chEv912jdY0Lyx62bFlyooVrXsa0g8q7m
 R3Utq3p7ihlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE/mQz/A+f+3KnCVfj+dMr
 2jxPsrd8Ldkcxnt+f4NZrfZUgRUe8U4M/1PyMo7YLTddV/+/96D5CjnH+z26cqflddy9lhuyyxX
 msgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The MA35D1 ADC clock divider register implements a simple closed-form
> relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
> by building a clk_div_table with one entry per possible divider value
> (up to 2^width entries) and feeding it through the generic
> divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
> Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
> set_rate(), and drop the unused mask_bit mechanism, whose only call site
> passed a bitmask instead of a bit index, causing an out-of-range BIT()
> shift.
> 
> Changes in v2 (addressing the Sashiko AI review of v1):
> - Fix a possible division by zero: 2 * rate in determine_rate() and
>   set_rate() could overflow for very large requested rates, making the
>   divisor zero. Rates above parent_rate / 2 now short-circuit to a
>   divider of 1 before the multiplication.
> - Fix the mismatch between determine_rate() and set_rate(): both used
>   a ceiling to pick the divider, yet determine_rate() reported a
>   closest-rounded rate, so set_rate() could program a different divider
>   than the one promised. Both now use closest rounding, as the original
>   CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
>   (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
>   range.
> - Not changed: min_rate/max_rate are not checked in the driver, since
>   the clk core already applies them and the previous
>   divider_determine_rate() based code did not either.
>

A cover letter is not strictly necessary for a single patch,
if you have text or changelog, you can add it after the commit description,
after ---

-- 
Jerome

