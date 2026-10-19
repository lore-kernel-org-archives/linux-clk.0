Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99D4B826B
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403732; cv=none; b=s37DRnoXB88AmyKX3jx70PITTneYU8c5MvUs+sZoDII6qPnhVP1w55dE/PiSrseOEk62MbCrFA7dOWF7AwgiNea0BzlpnU9wByxA1WEXHbzph4UP9kLN9G2J2MWF/QRMSWIBWaC29eHzQn6fUYr1CIuEqjb3N/V+Jy4lStemnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403732; c=relaxed/simple;
	bh=j15NZBr9gmJFKjFiA+o1T4SJq+ce59GySu+ndbBbdFI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XrUz3m8PWE5z9xeTEsco93hbrbJ1A1ecjk9QNgGebOo2+VaEN2j0tZxPbWw2/l0ncwFhVtv10abWDGFgd0sos7UEiwUheQjRxX0n38stYoL8LC8RrInyDRK3+PfKYXKD37zHjhSL2NGq+16hfJ7RIUgMtwIbYaPFhbXsNOTJ+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Wu0pMyi/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Wu0pMyi/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1df146015so9496735e9.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792403728; x=1793008528; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/mV3QLBtc235SSF0yEhuYpNqjTPPn1gF9CIeniWG8O4=;
        b=Wu0pMyi/lau4nMEPPmah6Ri4a2w5QzLW8f86GWx0T3njqo5vzHZaHyq12Uf6OHqOVE
         AcThV+l3d0oZ+y+HIM/onAje2+1XyDgi/l4MdJFra67te7T6/os24sgPCmaleK62FLnP
         ZpAexp8P+WP801t+pP5M1+foNyPLJC8z3iJ77FQMwdf/ByckEY5l7+2HczRtApHi4DRN
         eGOoUxp8iJJxLkTsSlNVsLGh7slXyNXmaAXcZAgCm3EsqgW15FUu1c9S25TjnLxQ/aDf
         cV7irLtNh0LjQnZxzjfExZ+ZwfuZzKSVJaheedWG7+cuNYrDWWY2JmwVtRkQQekr5sPO
         jyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403728; x=1793008528;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mV3QLBtc235SSF0yEhuYpNqjTPPn1gF9CIeniWG8O4=;
        b=xsKQV3wWNIcilexqFoKGtvDsISG6QBEWlRE7Z5zx6IZZFbY3fbFt1FNq8kqLoo1DDV
         bQjfAbuusv3E5pg9XnKAFaRpUiV74Q+olSJGiyGpYbA17HHq441xQQpRhlrNckx1JtZ/
         AzrgTxDCThPVtZM/Yfj5RO4Cs7NDf03/z5nbothZrbWcRQEEP/xbGVfLVMVROGBRq1Ti
         68RRTxUi3T3lSIzQ7wQqS14CSbuutnNGwAns04XAyXxWS5ujScpJlJvB7R/NJHb1xVSN
         xu/DEMNhQYLpZ+ARTAX5OpBWQ4ty2ziHyrljnOkQgX9qZ591obeO/WaK577TGCrwV/rJ
         Av2w==
X-Forwarded-Encrypted: i=1; AKwUvBzpqo7V7QD2XksqnAzVzdKEUNLafcOE3Z2FonLIcB78rIaOoRbRQsGu0lkF2RoE8jBPJcsN+P9DLR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmQQhloCEMiOmtseaHAgu7cxQE05rg1AJ5vCxRI982pukXk9ob
	/UUMXnr8UQbswC/GxbIfAyg/dvlNyCo1uBw9iiXryz0cxjnG7ywt1S6HDZz8SCbcKj36bFa1+E+
	tCIKkyc8=
X-Gm-Gg: AYBFou0kAbGKRl6VPMAz49UEMQvJSylAIUHsfrRHxXYeE2bFhWe1204HsJt1yrrPpxK
	SPe2jMBu2HnejI7lX9lF/cFdOmTCkNDN+tJiEgZsT4tYa0Z4oVVAimV2wBpEFlxJUVxUGbXFgpK
	Lzmrnv6Fggs2xWzUwwsUWUff1lhBeDSsZSxSTcA4kCs8PVO/vHm9zH2tJZKNzTY3eEIP4RmTxhV
	AGNgSLEg6n+Qk5DOEvV7SvMpDNDjz2xTasvFhVdNYIhtR2ALX7mBuBNqXrDfmu7mzarwy/SDaHf
	fWzrAa6YAvQTLf22vqRle8vx0OxEayx9vMcZXfMrxyBgONB04FMGGbvxHGBKc6xylX7y8S87GRE
	aIoCXiEnXKRHcmB2d62rh0eCrfZ1GchlHCkDHX6W5E1ijxMJOgSuIUG1zUXlx+d8JzUXEE48N3w
	tzN0TNvK1cx2tlxo/xSrm/7c9Z7n/+hOYBQ5e63k9sjLUi0JXv7hspqfnlxXuyd20LOpbFIwqGE
	PuohStGIS5au4N8ng==
X-Received: by 2002:a05:600c:628e:b0:4a1:df70:b4a5 with SMTP id 5b1f17b1804b1-4a1df70b5c0mr122511225e9.7.1792403728536;
        Mon, 19 Oct 2026 02:55:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm324919775e9.12.2026.10.19.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: devres: Skip cleanup action for absent optional
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
References: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
Date: Mon, 19 Oct 2026 11:55:25 +0200
Message-Id: <179240372505.859276.1184439049776215030.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=610; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=j15NZBr9gmJFKjFiA+o1T4SJq+ce59GySu+ndbBbdFI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlXX/J/al5WFWzgFHunyGih9eXy6Ttz/q7QWSBjVDvLb
 7bckV7ljlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkQhQjw9L05XXGaTwrfP5u
 iy5cu77y904rTaM9pyf+XmVs3GJyL5Phn93+w5mPH8+ZZSKfOv2O+uSf7Im/bWd+EHwx/d/JXb9
 nd7MDAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Sun, 18 Oct 2026 15:30:09 +0900, Baek Kyu, Kim <pocj8ur4in@gmail.com> wrote:
> devm_clk_get_optional_enabled_with_rate() registers a disable/unprepare
> action even when the optional lookup returns NULL. If allocating the
> action fails, the error path calls devm_clk_put(dev, NULL), triggering
> warnings in devm_clk_match() and devm_clk_put().
> 
> Return NULL after the lookup to skip the unnecessary action registration.
> The state allocated by devm_clk_get_optional() is released when the
> device is detached.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

