Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633922;
	b=dCSdsJztVkSLtPL/8SdTzXjug65jYNklHJLeXuf+B6UJjKYTRz5tiHyx6ac7w/4seiVT
	 X+AU9wfKq62WcAv7axes5UyPR3ba/G3enGPWMJIhl7rbCezrDEwqUo30IheBDkcX+QEqU
	 hWIzF3aEXbFsn0r/IVDVLliQj4X1h0GNKkHR8LdTAjupYCISM67btSo2yOLVBwUb3o5Wd
	 cJ7+aV0YDAzhVLXNj38ogDPqVZ/Kd8fIr2919pLig+xkcb9rJPRR3d0QMTnRpW6cOeEhZ
	 q/jnLxPpZ4C0PrDjFLF9b1a2Y8QKRFqyo8LJGbr/SE/9SSo9dMLKJKcVaOVSvNOYcKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
	b=IliXE5GukYdp7ypuKmA/y1zVUGiYWnuDk6KJylu1rB1tnTHEzxiKpHNzBJwNUYw8uFDW
	 bCptdpN/Vl4aqBo9rR6ph7fTOfLAOZxM4sw7yIC/N0Gq3NwKPxPZpJ+yFweYv6YfJ/RSo
	 jCV9h2t7zBrmoNLFQ4CesUZxlR0PAcCWz2agbmQ9O82LDdkOyOuOvjTDu371c0gbY8AlW
	 cfejnyRUqDBsgqe6TOQOjmXxlr9xRNOt7fP7wHBdy8ddznQIRosGHp3fNPS/AMIHgySXz
	 aFRbH6QzVjPE5ptljxvGNz9Qrm33BVsXeCXE4+0WX9cV2l6faQvTNOsJpcwaamN/Maw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ku662CHG;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBD606BA4F
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EBD606BA4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ku662CHG
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20290375e9.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633920; x=1794238720; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
        b=ku662CHG4RZmakqP2WPRkIHeZ9nCsxVH8Qll5GPnWUKjZP98vYEa9sFfnSVJQftPwH
         Jpi1QrR/SWYNH7MbmB014gksTKCyUsneqoOb4gKG9uTmdAMsJhqNzERot6iGlPgf+LG8
         B0VHfSApCXLnBnUx3qle41H9FFkS2CePohtHHN8f4AAAGcdCnoCTCRckYCa7i4yqN9M+
         AzCa6H2wRdCmw3u5EgESAxXDmcEGIg9MFNKKjEuU2972GVtxfIWGNxKAi/xwFHksqWiC
         Cc7OCGKtU8PdZeWveRrwhK8KVCamH3SamhpfqOk9y8k4X4+rFgXm3p/N4KP6kfQxWwYy
         ZjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633920; x=1794238720;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
        b=qJCKVmMm9HCwpSh4nWYRZu9K98ZbEk4YHMJ1mAJGoGCzEY+8Oar3MeaYBIW0tCuA1y
         pRKCoGPe4jro5eUuHgCsz3WSXDKxj8OEVkJz4chRLk8nc6o67mkO3ljFkvOAQTRasSKk
         APr0YxxkCguCb9g5gV9J9+zPdTFTgdNPYhEK+lBNTMvwW9t2TOjQ/0CP5r8OxyHQyrh/
         dTZoCCFyTsfwhRTkfYW5VHitHMOwvvJJAfdAsvk2YWRK3VOjpfaYRbS36LJV4ZL4+XZ5
         hSojnCDBkvC4VLLpUKEFgYL8wmwFYMe9UxO+V1E6KWZwe4dGdUFVA8GRwvJF0tFolioK
         R2xg==
X-Forwarded-Encrypted: i=1; AKwUvBxdUlmEPWWP31cQfc33ay8NoalVh9LzeuJMMHDz+0LpfHwPsRINzZOylk5h+p/VhNxVf0Up8eN3g4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIirqtk9B5WSluMYL0b7Cs84LKcAASfIkfnKQOFD/iPI1HA7jxk
	i+l936mKg/jvTFlDrHYOkfwIm7xYQb4osj5pYmgscD5268WKYCjihI/Md6Prh3JGtm0=
X-Gm-Gg: AYBFou02UaG3YThxcLmS7UWwmRVKk5iPKa+a7hrel+Q8L1dkZwSdgOut7XLPCQ62ZX8
	sHBY1lqzp4qFf0PRp+FYHci3W6qgAb60hb9nGOtUCtNPqkjazpO852FN351fJxKiHbilokjK7nG
	AoliHLOE3kGMY+fb6EWodwVw9nZ56zNKdtPxC4Ky6OQU9LWGQfQaMhlHCinqfYw3xT7cWmSkeTj
	w68kzq/txajCK5CmGk5w0FRrvJn8nOfXcfphQiWVxFl84d7PVEqWJXhrPPQB8eWfAqhnnHG6Lqi
	x5YwYHas6qwgYBKumLPtgKG2qbiTvbSB3zvaknBSL6qBHvBTEwM/br8XBZMnW1MmuvC6xzTHnuP
	hVCOqq56BhGdadvLQeC3mj3Ckmk3H3vMeZ+mfNiC+hZBq+ThiG8itDOwA4arlm6VbRkMsb++xrZ
	dOAMEoThxwKrYg+t07DbJCdKTTLP54cEHfIe6bzICmv20IVURJadDq7g3jR8bzCxU1YUntiIhVz
	wI2pXNqjQy0GOy8HUTBiqO99OUpjNd0R6OVnid94bESDA0VV1LKcjAd1r2rCzEym03Ywuxlf+Q7
	32APh7jR57mDbn4nmUvAdvzNKkDG0KlaHC/Q1DVI1Tz+ZNihdGzzUIaUyjstQsQv4/4qAQ==
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr253064725e9.34.1793633919801;
        Mon, 02 Nov 2026 07:38:39 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm23990642f8f.3.2026.11.02.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:38:38 -0800 (PST)
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
Subject: Re: [PATCH] clk: composite: fix NULL dereference when the parent
 clock is not set
From: Jerome Brunet <jbrunet@baylibre.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008180652.2756849-1-vulab@iscas.ac.cn>
References: <20261008180652.2756849-1-vulab@iscas.ac.cn>
Date: Mon, 02 Nov 2026 16:38:33 +0100
Message-Id: <179363391371.2870673.13540022018309238791.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pMbQRS+qsLwL3CWCPPg6RAglkeE4YUvQlevEoROTazE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkv1tU82aI29dpc8Z5nC5OdbDsKxbyLtx68dDpgivt0v
 bp8CcMjHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiI8lxGhl7BnTuq3tz2+RCm
 EJT0xysk+ZW+MNf8ao+I+LqslDl2Xxn+qUyLOd7CY8qeIyZcu/X5lNKz3O43/e215GMad2U4Mng
 wAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> clk_composite_determine_rate() reads the parent clock with
> clk_hw_get_parent() and hands it to
> clk_composite_determine_rate_for_parent() without checking it.
> clk_hw_get_parent() returns NULL when the clock has no parent yet, for
> example while the parent is still an orphan, and the helper dereferences
> that NULL pointer in clk_hw_get_rate(), which reads parent_hw->core and
> oopses the kernel.
> 
> Return -EINVAL when the parent clock is NULL.
> 
> Fixes: 2f508a955a67 ("clk: Convert basic types to clk_hw based provider APIs")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/clk-composite.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 11842bce5918..40d64ef2d325 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -75,6 +75,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
>  			struct clk_rate_request tmp_req;
>  
>  			parent = clk_hw_get_parent(mux_hw);
> +			if (!parent)
> +				return -EINVAL;

The mux return 0 on orphaned mux, so I don't think returning an error here would be wise.
Considering Krzysztof message, I'll wait a but without a clear answer from
you, I'll probably followup mentioning this message as Reported-by.

-- 
Jerome

