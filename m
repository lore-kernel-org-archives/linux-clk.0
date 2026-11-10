Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317944;
	b=VsO6rvekA4UspXyi8u6Qpe6p75kAvnLp3a34oaPyk1x7NZxX3W4UUkBb1OOq2EIrpUa1
	 u58zzMLR8IXfdE7hu1mssg0U9qThHrKjhncQldpr7PPyHpBWEV509yKv1hFVRqcQ5yAiB
	 gE4x0/A6Sbh++/2gtZezSrXJUyuw2w2eQQqOrc6zVIjyTM+J1ogKcH1Xq1bhnY1lPWkON
	 RnWo2uoKargxOn8KT/srAefn3hCezrVUPD5T0lzPCl9ar26w/SWKzoJQUGdyCEWyEEORj
	 a66AY2BfRthMYCFDxYmzBMwUoEZKqnEEpT891fBzaYDlxhSSF78/+hBrm+V7aXul+0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
	b=gEZ/Qo/UQczO3Hjs/528IuPxWBt8vcwcJHfzGRtATQqUJWntpXlEMf664bHO326+shYW
	 KX4c1wwE6KqiD7pF0ZOMFLTouj9y/Et7C4WL71lPwZJBhNIuiElvVmBlx76ddWk8tfH30
	 rnalO6L7NoWmT/NtO3mzH6hgRgm2AUbFSFrLaOaUEOiJCkMHAqASVPaPwbSd1K3cxKOKv
	 qhN0zmityp0lbQjIwluHJ3MaFgu0ih6Zk9Tp89BFiqnZLDUk4wyOQCuvSsTq9OyfkO5s7
	 8r+DS2mJwQWBlBEF/gy+P3ZJoVxFcPd6T+v4jNSltL4G/PyyifsnpImeVzDSpqf5XDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8D606A334
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 13:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA8D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2289206a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317942; x=1794922742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZMeMfQvmt78dPYrMMtAW9VPm9Yugc+D1ue2Bsz1Cqzg=;
        b=KW6EomabGGi7XaC8DUPZZdXP0UJ4tNirfIup8wQKiYxC2nJQFjUr/Ea9h+4HkkZNj5
         Aiae/X3cYZ1JxtHS/4WDqyEKDVonQf0tw63De0M2vZeaxBUMfWKbJiI6Xcl//70rpeU9
         iBs1SejNKehiUewnveusSiC5tmBPg+gmlRberfv9SOeVzYqSGS95+WINeUSPtLNlYMBL
         UpqC9EYYuQaFaW7sSU4pBYkk5udDD+iBMnIunbbvHwmit5PK1jAxLMVAqbuJCk1ScPQm
         FykU7ZZ/Ju2CPmyBgn/bXYQJpG6U57cx2iJWED0lnRI9mzTk8bAx9X7gTFF4bbRHwqIe
         tQeA==
X-Forwarded-Encrypted: i=1; AL+hErHkel3sr6wDx5ln8IHq4SlKO50l595hhsU9i3qy0cFsvnU9asb0JedT9JW2N8h1CSqOCThUJgxIoPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0aFJkTj0vwNHRY31g3a0CAIESSeMyBQfaEBaIf5BXm9okjsc5
	L9mRu7itWtte1ya1dXm6dvWAQWxXIiUotHYyQNkDy4NVjDDh/laxykaQgmAn04lPoIE=
X-Gm-Gg: AYBFou1PmxkXCQBKU2fpWMmid6HQQuKtT67tD0y0wMcXLyB18h3aaUIrNQ69UqbQeZd
	lLvGfdFpjgDVNM4sGySwgHEE+wLxi5CmPtnKFyQMXNcsOgifvtxNKLNFfLkb6KT14fDt6kk9bCi
	BIhkSpmXdzntvvi4L+8NFYxvsSfPNW96odJYYm0nzpA8Ty+fdKLtNhz1hydNl+hquDLLCOot+6O
	tTWsTKV88c6CdUP1zTO4T+vnL06ehq5RBEQ0aOX7OVoAKSd5k3lhaT/tAsCOyr5am7CR44LSV+h
	V/Zg00IVjpQFVNSxAH7X+QxJdYSMOQ8KiLjAdL+ii9Njgss/IlXIy3W3cqxPrJhJ5K9ZA3js/oF
	YetuUafM/gAC3jmbHMkTAGHjoHZ2OMI/Uw+FGapGLwNapQNWmsWmU2Jv4Pq1yut09UTrYhbVxGI
	SSsMiq4lofzyE1aJzaZGDsE/Fals/jCf6sxMJbTNyYqmFIo8qQLT1g42I4KqhnHlgOfJnc5Fgwy
	+Ri5Ked1qY6yNi32QG9yJZl+en0tyRCwtQTav+ydGau26MglvS5cNEZImJAEbdhGJ4KDIgHDFXe
	xcMNAh+L2RdqQeYuovKv4i9uKWJTFKiRUQ3WgjUz1YcNPjSy/BB2bVatY1qaD284A6GglwwCfR5
	qwJ8urjy0thci
X-Received: by 2002:a05:6402:2422:b0:6b7:dc8:c824 with SMTP id 4fb4d7f45d1cf-6b756b08c35mr2175674a12.42.1794317941966;
        Tue, 10 Nov 2026 05:39:01 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578bdb1bsm1152958a12.11.2026.11.10.05.39.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:01 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2289166a12.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 05:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErELedSGoJJklck+djAqURSAblqKYDus7hXgfVu5uAwiYqaOkxb81S/zFPVq7oE79ddNigljUdaRPKQ=@vger.kernel.org
X-Received: by 2002:a05:6402:22d0:b0:6b6:f429:47fa with SMTP id
 4fb4d7f45d1cf-6b7564ea318mr1526088a12.9.1794317940664; Tue, 10 Nov 2026
 05:39:00 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106110923.164090-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261106110923.164090-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:38:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
X-Gm-Features: AclHuK8Uhzs21jwItIeAcI6lu6EJ0iz-5HN7a0XG0Ev7COfmQG9EuJKsPYXnOHI
Message-ID: <CAMuHMdVQxTK6R17jxbiMH2ZxbH5j6B8x8h2XeysJHFXsskS0rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed adc_pclk_gear to pllcm33_adc_pclk_gear
> - Renamed adc_pclk_gear_div2 to pllcm33_adc_pclk_gear_div2
> - Renamed adc_adclk_gear to pllcm33_adc_adclk_gear
> - Renamed ADC_ADRST_N to ADC_0_ADRST_N

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
