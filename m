Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852398;
	b=HEr53MUCyKDay9f9zjyWJsZvPyCGIlXut/Qobi2y0ovlo5lwVyKc+HjwKIYrTTdK/WOg
	 7ZVpXcnW1dzicxw1wi6eaFPf86STvmhoptlkjJanXlhxpbJ7kApWDsLNXsBrVapPmrjB6
	 zPs/K6r+snjtWAj9Zh8Ok2HPPFXUMdFi1fNPlqbDGX6Vk8mupKhXcx2wkr/P0JvbHuOMb
	 jAFE3YaGB6GJji3YNk7S9oryReDhgjNhymmdwroJg40417QaMTg8GgTThYWPCArnmUD1t
	 +589kjNg6mgzq/oKIp8mdFr3jo2PZhmNuNUBR4NeSuGNReS0EnLtqO3R1GOPewuqTLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
	b=O1mSihLclmNJ3nCtMYdVyt5XOpygyGvgXYcWmU/gA6AGZYqHadF3evHTPGOn5JeRGPAM
	 InerF+04Hcw1YgD3Sye40p+1xK6XkNTRe5INh/IaKwtLQJOSgK33DCy4N9F3GMhaLprG5
	 AwbOsY7kStxvg9Lvmkib0B3N2+NVTJGEwxEA5Bfked+OJ6ZdVlX3qxyJ63gTsxYK0hiwv
	 XOHGLRneXwXaxsTNdd1YCzWzTc8EFD3LMpCQ2j+GWsS2HfmSAasFS8ZRc73m3asGfDYZu
	 yWWdyjHPz9hudlqnzFdqTNdFCn/0CX7nF04Tlb3YH1rRmdskllR96T24wfS5qiJjFPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A353606A329
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A353606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kmfEtmJS
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso3794140a12.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 10:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852396; cv=none;
        d=google.com; s=arc-20260327;
        b=gsGN6XpI2vjHlNUF1zNE+C43mZGoNRVh+kDuxhcs2FOLmnFWjoBFHSiV1M+s6/yI5C
         xWdMDIYABeBM5k467/JOVm2IgaJieRJmOq9Wb07KBMN6cm3kwfM3pyWDDznM964Lk7Fp
         gauscdssjd2kq6xt8PN+tZUs3FUyQTmxPJFgNvKKQojXzol+fidr+R/gG+WNJUujWYE+
         PuAKH+/PDT5VroRY60M3p2XFHNPFYy7CNVHMQ+SSVqMU8HdA8lhWZTvkA586ylSfuxMs
         9L7RRGH5TtO7Fb8sIFRK+1f027fSpCbJzuAJwZnJenT30KaijagMmaSh7b/oWqIVhINA
         x2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        fh=9YCFVzVIYXWt23tskLypdBEqE6OQLqKBbwFC/DMpVIE=;
        b=ck1IO6eaFsl19+fKgQu2qOZx5/OcQxvigaKq5REz4+/dj5DMfbuWuNB92hyXcLH71T
         j4yXkbEhJaiIt5BWxFp7nDA74k3MPoze5MlGo5KlWjntQkQJ+GeQSGDiYnQAWLltMZiS
         FY3NTBFr/7Nv8OnBLetjMp6bEqcGu5rad4JF8Xqgfx6EOz66+Vl3vQ+zWMaB9kz+IicL
         0QmxkG7Z1WLwC59ne4D5dP7ElOlhVZbg/zoiwqG/QjipWX1eSjIttfc2SzQ2o+MUUqwj
         2NWubrwMOS/VbWJuNzxbrVhg1rPign1xuj3XYjWbW2i66hvt0b2COXikM9grzoA0SBfZ
         0XQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794852396; x=1795457196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=kmfEtmJSUQOj12O65RS6VbY1Mw683v1ljPvF36Xaq8xyWwxLcE7Rgpv+P0xUSOOzWS
         CBohX4JEJNdoeAcC6jydgpFDt1yU41+HXutDjQAdyI8vLLYBoI/h4Emm3DiFQfqcNQUR
         ypxdcXFHdYJd6ZaX146We7oygm0fSjC2yeM8PoUbco8QbD2GyNZxH/fdgbsFR/SwJvJ0
         YDxEGIMYJYTUooX4Xp5OmSdS+fQ41EkMyu65zgulLxKykbDLEkMOPCpoBmrMKZQrTqxO
         KU7rr9M7eUtWKa9Fv0ia4lwZPdGN45eJodeXwq8zBsEC1Ei5SPQXIPFCGxuJR4mijPDa
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852396; x=1795457196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MVQsk47kw1zX3SrceBrKkf0gFD1EshqJX1nVwLz5v/w=;
        b=DZStebAHjZh82iiJdK5uXt9JHlQkJZZVGfPLbRPu4TQqUlLJBH4Q9igxiQ2BIc/xDS
         +KG8Th996IJF+CMZQAegiSWtGV01CTp8XAxXhrL7FOd56wMkjwGXSg/pgW3DXhk00KxA
         nIb7wyI94DXHuTAG/waz5jIOQ61EmINEloor23NnsWIfxl0p+Bvk4NDYpXcwIwTvovpD
         zEvkAeL5XWdohJSVaxrnSPvQmj6V1NwGv2Q7cweFUoHW8q+RSPCDD+U4BeceMUaozdEq
         Bifuev2QsH2opOLMHB5ofckJDuF+6LcEwwZqSE8sfY8vn9i9HKfhtDQdc91y9TRgptE4
         jZ3g==
X-Forwarded-Encrypted: i=1; AL+hErEQEZ6hJ7yvb5EaVqFflTv2at70jLSfu0sZRJzL26CV0gR98gAIwcdP8ikq2lidpUQJu3epVf3tFQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z//qpR9805OWtgJ3ELL4C4iJi9/Brqi51ZHeZuYHx91kNVgiAAZ
	GXDyCkxgka3ReMm4SQwdi6QGJKHzlaCJ6x4+kdR3r4vu6wajZzNL9Wh/yI8Yos7cH6igl1AIx6l
	4TFfyRxOXhxzFAtYGx8sVuv5pxqBzplAGpOmmX49WkA==
X-Gm-Gg: AYBFou2aF1S6pHFbBYUOIpMNxqyoxhz7Mlq1OjZpY41CdzM3DxRuBxDMBiFqIGCly3r
	c2CJnIzdG6uU/vpVxUNLXYIphyY3HwF5WhcROEGehWELUu6kajgz69W512P+OHUozcvqEyul+RN
	SPpv+zYBrnRK7S2idLSYupJe6x9kTNFgnGnz4ZEdavVdqBsWPpqQTxZtHqXzABezszrcpILxrmM
	HyfYkkLwoho+J3hg8NQbTsd0s381AMAtS30gll23M5RgwG9c17cXlutG+8lz2QsKrgAbE17pSiR
	19kSKPiRH0WdHVodFV/oz7REkub2ZajZ94Hhfxkesuxs7nLso/dWYd6nrFhgSnd1gnT04EPm1I5
	D2tSFiw9z6DYfX5LKCSbp5gKHJVvEPbD79zioItYu+iKZL4o9J0Wk66SpPrYw5l6YoVKuOb0R
X-Received: by 2002:a05:6402:1389:b0:6b7:d672:7834 with SMTP id
 4fb4d7f45d1cf-6b7d6727942mr5514347a12.36.1794852396101; Mon, 16 Nov 2026
 10:06:36 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
In-Reply-To: <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 18:06:24 +0000
X-Gm-Features: AclHuK-FFknY5syd2Sq_iB3mSD9v2WzoQZ6qZmiqFZ7TfMDgzML0F8GxXx83h_c
Message-ID: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/11/2026 12:05, Raghav Sharma wrote:
> > This patch series adds clock support for below blocks
> > found in Exynos8855 SoC
> > TOP & PERIC
> > PERIS
> > HSI
> > USB
> > There are many other blocks, for which the support will be
> > added in a forthcoming patch series.
> > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > ---
>
>
> Thanks, entire set applied (even if b4 thank-you letters show partial).
> for-next will be updated later today after builds.
>

Just FYI, there were a couple of outstanding review points on this series.
https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/

I guess the main thing that would be intrusive to fix in a follow up
patch was introducing a slightly different naming scheme (compared to
most existing Exynos SoCs). The clock names being
"gout_<IP-clock_name>-<block-name>" as opposed to
"gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
"CLK_GOUT_PERIS_WDT0" etc.

Thanks,

Peter
