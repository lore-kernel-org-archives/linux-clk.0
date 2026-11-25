Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605460;
	b=BLSg8N8/bzvAxcsVYRxH1bngQVANqegt+18/vHTEcjWhY48cxo9ySRIuaVykrTzWJCCH
	 xT2Ex8X9DUATW1j1iepzTcXMCLhFZ3gi8SvARubY5bqR437aejLbaS3NwiFJhER51DnM2
	 RPv5uaIhy8NSJdIRzACRzZBguvx0/Xezli1Be9coIa0796cvWvNZwhqavfVH5ugRgpjy6
	 A/mfiwJhRK9SwHz7eefiphyQxIup02xpd2wnP35vevxw38DYdWnA4BOp2c7Hur6AthXd+
	 zOCc/+HyAtXwqmWnn02jioENPRSFB3wSP0LOsU3hnAF0dpZ0SXd9v+IF+tQT92Ln1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
	b=dtYjkC5gkacC8FB81pUk8705OEEqKhHIJKfFyAvWllpQXUMimnAU1ltHcH0/Z/aOHYDF
	 5B7stBF35eAVhKt276NodygwjdZVGaEn2YZJBgLTqikuRIS05ItsSX83PhY9bF7Y+/LJv
	 pLRe63P2xbjzyPad03OX8/9/0YGEExxUCnCueiT8pNTZQ85E7Xf+TJCqyGEgnvSbbL7ri
	 VoAWq4n+YAeRaxfYGmH06krx38yhMD5BvnneRBRLzuTJ+4ZJ93jFH8HbYwv+xEfZimok+
	 6d7Ts+TMYQ+lmX07wfEkDwwZcp1Xi5IPi4gYBfIRQIWn+8G4rVWhx7I1as2N3HhJNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C83606A32A
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C83606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3215783f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605458; x=1796210258; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=KYdOc0fw0XfpgWsOReTkFfKlAQWYh5bjBxSLc6c+GDe/HrXiZr1FoXzYrJn0x5py9p
         AroMR5c/ME3gJGrcz0A5Oy90P/yN1qKQf+pJgegmVWq0JBN7WgoskahOmvdspM7u/oN1
         2shHaODP3Gfc4taLmjHi8c7MKuvFK8/8mNcmZAh7rEmYK42dXcpRftLiZepXPNOOJIcM
         Ss1S590je9bVFOygYEZLwpCpT8h5UZWjrPmKx5x9AjgmJQUJoiDb2jUFfi2B3pQjFlGq
         ECu+PVX0diYk0dQl4mCVLw+KOT60043XRMvLPRiIOVD0+UN99u8rQbIZ9Xh4AsM6/7q7
         T+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605458; x=1796210258;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=pBNHzIwHjRLMYSgGzulFN7m88Q5vOiIj2YDtuy6/MNroYWLheS/ZfexzR1BqeomZtc
         9jK33oQ52V/3jxY+rTlGUxMkUPcSseFt1sjn2IUxgBAf5eXZgKPJ57uwg1G/jHI+NZuJ
         5B7tYHQAt0LBUYUF/Z0hF7DEaaQVe+s7IcsoQrSi482ZTPBirbGWUgYN21OM/StOXy8C
         FhweeZlNPMK/q1+xvyQkHZNlEdj9d3yTvswwMf1A7yUt5CjASC9ZIr1cfvSL1QtFXejK
         xBW5BDp+DO5DYC8o8hTYXc4J61PT2gX7EmkLgX9swR5G8FT2z3YSjZufoLNMmvUt/wVR
         aqBg==
X-Forwarded-Encrypted: i=1; AL+hErFX5inBoKpb503/8tQ5JK6AhHZhmxZT52hLO2LOY6IxTXFvJmbE2xKAcA71baF/7kdRjtW7k4ziVfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z881woay0cObncwG33v8flp03AHoyPmYexYUykCqXEqpJ/bolfI
	3/mZcca3dRU1/4QEZcvrh3hr1/nHZhO1Gl47pVgZlSy8ljOIm06hdXHlbVqIy3e/3ynstA==
X-Gm-Gg: AZFdTZd0HBK1wcHRMA3hyBPmffNJoskL1Lh05zLldBU37skYm0tdHvuErUAQu8FyPZU
	PNz39j9oToCE54uL+XHktgKpH3MYQ8e7w1dlluh/vK9MKQXGSORtIA+cHtezMM2BrdNEpEWqvnL
	zLa4zg9WuN+1FvhIAdoXxpuVNqok8EJYLpowYR/4KF+UYP3cfKajHqiQzfvzPqDiUzFsvt/JU5e
	+fqtjEXayFEqGpMSl7lDsePekESs+2gSVp2yTj3leMcVGsbcbmrFCmOAlGA3vS2jHESree7GJ1r
	5DarHsvIx4hTwmjulwNJ9Wu6SdpF4OGaFrGdN52Nd2+rSztdTbzhNGbzzh6WXeZQMU9O3kznRXL
	UMAW7qzUirrc461u2McYp4CrxdWGtUWK5cs9KvP/gpVn4cjrICSdjx2bq+udJ7TDDSHZyxLQ4mz
	m3nCQ88u7BISuiGO8l9WsNcvRlMTlXdy8fjw3MLFtI9MY3Tv/Bw/o8k4tPIluORT8qDuYw9877k
	wCIh4elxVpDSpQMUEd0N18cXgiTBFN6OrtOqjqbYdgJ65iCcrNJTFxLW+u8GUgPI9RHV1Kmeljt
	B9lzFByYIz8w0zS7k2MCOegvqhG7z5zBLDQ4DNMzERYqHr45iYUI8j0=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr378366175e9.13.1795605458098;
        Wed, 25 Nov 2026 03:17:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm579874685e9.14.2026.11.25.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:17:37 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 3/6] clk: Add Cortina Systems CS7542 clocks
In-Reply-To: <sashiko-outbox-233158@kernel.org>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
 <sashiko-outbox-233158@kernel.org>
Date: Wed, 25 Nov 2026 14:17:21 +0300
Message-ID: <179560544103.3.15793449705570350216@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, confirmed. clk_core_is_prepared() stores this callback's result
in a bool, so a negative regmap error is treated as prepared.

I have changed cs7542_gate_is_prepared() to return
regmap_test_bits(...) > 0. The actual callback failed with the posted
code and passed with the fix for all negative Linux errnos, zero and
one under GCC and Clang. Both ARM compiler builds passed as well.

The fix is queued for v5 while the combined v4 review continues.

Thanks,
Fil
