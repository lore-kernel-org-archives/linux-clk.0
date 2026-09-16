Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190843F4AB
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543754; cv=none; b=om7OOMWAD6m/RNRRWb9I1hX2NBgHIQAVG5Cs9rHWJTsIZpSyQb0O8VjjsvgIWbjVg1lUA++y9zvlWUY59/kKFGfGd+5DuTGUSnx9WtgjvYXW+LHYcjI9dIXycYnWpa7g41aPNB2skD0MmSJH9MqsVF4kAnk+EOIis5W0g0usmfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543754; c=relaxed/simple;
	bh=pilzREsNIZ1G0lYCS0dSTmxnisyBU8U1x4zAL6KG8dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TcCmqpaEUaJtF5NL47/soKofLU+8pC2mnTiBfpj+ULOhtphmIHKsNoRKM1rJX4hAtcdWaZErEIpRBGlxF/aeIli/j4AvbFuUOq/yETtFZ2doRZaNS+0RdL8p7DV3AZj6oEY+S+u1kVUMdZZTcmdf+qI6HgsrR2GT/tJz0JKXTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X+4DrZXl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X+4DrZXl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1741835e9.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789543742; x=1790148542; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxCgt40wED/Mb/f0Kzm7IXN9qFkw/Cys5WGiW3j9fpw=;
        b=X+4DrZXlo4oy6Hf9p8JO8mfRvuhs2k6t7ZrPwyrL8Luz8OMd1st9yz2wu5nXSof/Lt
         HkvsU583aBs8F5jrxHSpeByrfrwDin4d0NMiTgqunCrys2Wkl1LBgXbZp80QPShCMPBV
         CdfWnlP1rcxDrUf0dR+Mp6ykWsc8DyzZpzuHavQhH5Cqh1vHXws4ncBFAGqpgcIBXopC
         AYjp68hYmRPV0GGWoSAAqZkQ3BpZwsBwX1n5V18F1JvLb/6FAoxR9NXcyqAKKY2+YPOt
         G2Z7myK690SRqgNGGd3ft4q6Qixu9KIksLROWEqBk/jlOw16ZVN6kqTtxWh0irk+RNkj
         vdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543742; x=1790148542;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VxCgt40wED/Mb/f0Kzm7IXN9qFkw/Cys5WGiW3j9fpw=;
        b=zjVjnVrGObW1J1XiecJ5sPq8xp7aj57gEBtsuzSOFC5ZKetZyGjfbp12K6oSTJkHiw
         mbH5rmFTaZyVEmpPrcFLP6L5cPtWYi/Hhj2KHkSoPD2LiUtjXNk4IlHmmOxtpqUdUu3s
         19SoWeTnC/n85rmf6TnETX1sW4NnWQsa5E2nTQeVc24DQwCTt9Lyvm50RH3TUwB00Eva
         PHEO1bqu/UXokDfKFr0s6KUImVIurnwtCiN4ISmeOhBQVLJ5Rp4VCl12WpdpA4kJrGOs
         5P/YTpn6ey6YyMAhhbSjIYhyzTTiKWq7AqRfzWp4AFnDoL6r5VdqBpWH1GHN7rh+Us1S
         tRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFQzV80V7OIcA3jeUFE5QazB8NWtLSvCysX6yNawHmld7kzhAD0np+aL9aMkR9O+nf4mAiLzsJ2I8=@vger.kernel.org
X-Gm-Message-State: AFuF++mvrbpKbmIxB8qBSYshDHLAXTf0/hkP5dyzsRh9xOrXh1MTEH2p
	X3rCFu83ctTUig+nefZXx7MfRUS70OScmbEHLyUPvug5gtcaaKn0rWgd5IYL8d1hAkA=
X-Gm-Gg: AYBFou3wsrk4gsSiK+9xgKANiQTTb23yiaxjE+4JJkI+p12EMAqLq9CpPYssgTE15mS
	/G7Namdtdr/MQab9h2D7UfYDhqkk/qICCUxUFoyH9iRRcy4JcwGESNUwSJj/hXX7dC4IV4wn23c
	tHKdckSB8nWxx85RrzB5810D1GUC8OQ2avfAXY8/vIj4TG8QbDUuHIUJTtH/4bAAQpii51Gu0LJ
	PyxwatQBTSDufcuFiVDXMczJuYoklDiM3ov2THHTiUZ19K7Lkqeh0QmJwkXfJ9Vu9o5liZ9gwxw
	gQ6OBRH1Ol5Ocapoe0TY0pAzKQQmV8RCHFdyI7KMcA2CH0CHho3RlyIn2wIqQWYt7577agyGNO+
	BHzhEOEmqE7DW1dvxDr3hnPUl99ID4WlAaWyCyrjvx17uyu3TL3b6MuYkmMSr+3wmsSt94Iz7sn
	zRE8LbOtopd6FARmUEO3di9/Y7GOe73IRw2we8a3J2MbAVFuBrpmNemt+nrZzs3hkjyftjc0Ikz
	8TMAqZFBtIHszqv9w==
X-Received: by 2002:a05:600c:3507:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49ea20b48c2mr16037415e9.15.1789543742232;
        Wed, 16 Sep 2026 00:29:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aeae01sm61474455e9.6.2026.09.16.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:29:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <error27@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
In-Reply-To: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
Date: Wed, 16 Sep 2026 09:28:56 +0200
Message-ID: <1jzexhd58n.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 15 sept. 2026 at 19:38, Dan Carpenter <error27@gmail.com> wrote:

> Callers should test the return from of_clk_get_by_name() with IS_ERR().
> The function returns a valid clock on success and an error pointer on
> failure; NULL is not a valid return value.
>
> Document this explicitly to prevent callers from treating NULL as a
> separate failure case.
>
> Assisted-by: ChatGPT:gpt-5
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> There are a few other functions which look like they return NULL but
> never actually do.  This is one which has caused some confusion in
> the past.
>
>  drivers/clk/clk.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f1756fe59372..a71bcf780de4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5430,6 +5430,9 @@ EXPORT_SYMBOL(of_clk_get);
>   * This function parses the clocks and clock-names properties,
>   * and uses them to look up the struct clk from the registered list of clock
>   * providers.
> + *
> + * Returns: A clock pointer on success or an error pointer on failure.  This
> + * function never returns NULL.

Thanks Dan. I was about to apply the change but it feels a bit strange
to document what a function never does.

Is this a documentation that should be added everywhere the return value
is to be tested with IS_ERR() ?

What about being more direct then:

"Returns: A clock pointer on success or an error pointer on failure.
 Caller should test the return value with IS_ERR()"

?

>   */
>  struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
>  {
> -- 
> 2.53.0
>

-- 
Jerome
