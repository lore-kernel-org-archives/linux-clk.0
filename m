Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346986;
	b=fSpqKxr2Hp0yNW3GqwG6Rt1BWWmpiT1/hiuI0Fj2+ZbwVYsr98NuLDzfrMtG2UbA0mGV
	 +aQHDQzi8Qlr/5KNhk9vWEgWi+cns1HlCsBxfJQ2KxvDdB7Nrl2RCURBs8KusgMaCV+gP
	 2S9N+4k0WviTfT+TFE6f8l+gK/o99qZ9oOkAimb2ws/4MXq6r5RVNOCzEkLtu70Xeg82s
	 YTJELaTqRxYoyzV51d5lBmrYX4+ctjMrZrufhkmER0JnP+voWoZkT4HVKKBtZkYPBOVwF
	 X2n9Jt0+27f2w4IslxC3Q7PzQe7W4C3Hdj7QdGUOOJLehOIHg2J/+k8BCPQNz1uJ5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
	b=g3Pxh8h/pFb5GRxZPi76pMqlt+fr1WHDtZ43eRhoWp0CEZAcSvS8sGt2sKHT5rwGk7dA
	 FbSSS49741whoYZ98DpmXenhQSwPqCvlVQ7ywIOeVLOdrCl08aB8AKXfT9ZYym1SPNdx6
	 Pwpd0p6AQ0icTEZUTeLEoFp/nVLEQPu1rofIll5Z+pHNMzWUCrxY1cNyRZNvuj3H0UV7X
	 szEmUbDG4HRS3nogPi3peCnUkQ9XObMIe3TCWTbhW6/sMcYh4TnD2t6ZjQZzyu2U8b2nX
	 12WvufJstGg/9XsIy095mPJg8hr7mVjJnbvoVre6MzEY5qGHaaqzLeF9wFMOMdo0p5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHog+Cst;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE9606A31C
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 07:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHog+Cst
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so3849415e9.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793346983; x=1793951783; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=jHog+CstgL/em6hzEfZuOhxSNhw7Dl/PB0lXcq9zxO92od8dSzezBQoBlr23PIOmZr
         1wGJZlHGH6DvzIV+6OHtJUxgfgr7iahGGrqpeiDFYtTH+xHiyyrQsBb8Kak2jL0VSPoC
         Bn2S0Mexg3+v9g5XDmzI/bFDRU5qatpzz4GPqLLNa9O6MgKYCQacz2lBsnLZa9qoNXFR
         X94pOtZDBgN9N1xs/NU1mB9cb33OWpNftDq/GYvi4b52j+CnrY59XhpjRbsbS7SEFRID
         NhP+C5AwBu3VtPT48dX8XX+SJOsaPXUtnAwbuK1V4ra6qeDUdQlKAqGWMl+rbO899q7/
         ZBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346983; x=1793951783;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=DqqaPV9cOGcGDSkSDN5AzzikuOBSxmmeN32IIZiFHxCc4tAzB3sczOkFYm3nBWJ+2V
         mJYcT4zBFCYzSyCTfxxRHFH74bY7rryJXe9/AE0uCno3KQPML1erDMWjWuPsV/Jo8vW5
         6nxErYUg2wBNNhtaoqwMpNa1rE3whlVfl9go3xEfEMmaldGl5bSs7BzMafOQJsEQjGt8
         Ls4HRom2l09uD9ej9ZSjdI0eIkZMdZXyWDiXdzGp9CMm+k94e/DmT+F64NSwROeOnFVU
         Hc7essaSvfigGDMMalmHRGbK8n4R6b18IBZYVFjF2DmPeRkFb6SHdV57m9WHZ9GpjYZ5
         RBQg==
X-Forwarded-Encrypted: i=1; AKwUvBwhmk+CbC0n0/huQsmFKTYLvx7O8czTbnhsknu4hymL5D0PNFHIka7g8teyIGhWy4egeIh/r4c87DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk0oEE6444h3p5Ivfau4JBJ0Apga6zyorMdugS8bGHd8nfIE54
	qrGOLxmki60do0h2CWZIRdis8oyjcYgazb1MlYvDUi3nQbKU9WRYzAly2hWUB80uLu8=
X-Gm-Gg: AYBFou3Ueub3EE7GjipIkdZg+OyKlHaiMeQLRoVYlq2Jds7cr9jw6fmYl2aqUEoU0tN
	r6NA/AmBhCVMyDo7ZIjZu0ZsItgyuaL3pttbo3uouhWbBABc/DuhOUySDEyJiiVsgIhm85hm2iZ
	FWsBoxn2AqvXE/HA4368+0+IutKx59ovW+kxg6UC+XLCgG1tJ0ILw/8GsCwoshKvXJPCG47JEzQ
	G64hQw6L7S9PPW8vs4E0gS/j4Safpx5Y0KfuBk3TBFpJ+IkGFozIVcIvhKwXiqfxTQFpXMDpdpQ
	aneQ2YXe1mEwtgFj9nvUfDxsornVGYtibPCSd7qy4CHhIXmfGB1dWLIVTKgX3KxV8O2XrocnoCN
	tdMldrB+ebwOfuLncw/hsTilG+kcs9Q0ne6XxUxfmPe9yWwRJH8N9xJPHIvFnGzzGhNyA2pXk9d
	ARqFDxK0xn4E3S6INTf620tteLkxivMg8oapi9tGJqcRDTAwIu6XjxXkSjN36HkK+bTGzDtxF+Y
	e/VDgy/UbWo+X+aYeN6I2jzt+prTABifHNH1GUgCgP/ANgT2rdyfFA9hOL5p6ljV0l3raaq28bf
	PR7rYAjmCohg11vl66TnCTwiSfQBEYnztsGE3QUj8ZC2Rgmr
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr27983065e9.18.1793346983717;
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm1896842f8f.12.2026.10.30.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
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
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Date: Fri, 30 Oct 2026 08:56:08 +0100
Message-Id: <179334696866.1865333.15281691536960205924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yU+vJw6/Y9vZBqgM9DPcf9eaGw98kAzxSGCAE0ufIe4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPfOfdXWhmxJXoz+huw7YuS2jSZs/mnjdOR+V//eqXk
 NnIeGhiRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZScZGR4bWVSPUD9laR6frZ
 +yeFNLw65Poo+IMTx407XyyU+JwF+Bj+qbpdOeOS4l3KXKDVuEz8ShR7lmvmhLvGi0rOPhJ0uve
 dBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 29 Oct 2026 19:37:33 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> Fix the ENCP clock select field on GXBB, G12A and S4
> 
> The GXBB, G12A and S4 clock drivers place the ENCP clock select at
> VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

