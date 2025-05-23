Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B7213236
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987245; cv=none; b=GagW6ti2mjSXqyZpO3cjNtUf86D+kB6/WIc/xDHNFbSkzRvD9GX1ONXfXUT/8iTEo4FbyeOog770RXt0w3LBbLcqKlouZyBR5Irr5mQk9KQCJdjoXN+u99zvYutkW6PLcHVbeNMdoWPuA+nSUL9x9ALHxptkbZAEetNQsBlFSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987245; c=relaxed/simple;
	bh=kHU4mb+OhegFGGjVHi9Ya6sJzUPzHp+5/q5/1wQcCJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mi1Zmw8Cq9RJg+EeSbOrsLI/qMxSbNh5hrVFmQX8Pt1OFNaUX2LwlWm7yI9dkArdQ3WTt2FR6qTWM1VfXVhtIXLRuezPKO96xCO/dyoqUWdEqEGiUrQ+qRYprlF6iMwLaU9AkpxyZ8/TCuG86wcXHhF6ilue3iAyvetOwUX9GFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KydRJQw5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KydRJQw5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so1451594266b.0
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747987242; x=1748592042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiOgEMrmn2U7xW4tTEzdOiPioV8Bcrr2XK1Z5C0tcV0=;
        b=KydRJQw5XWLhtrhb0iHtE4BN9tgZFBQXcSLBoa2KWw9VNrRtfAlmD29a3Niyz1GjRI
         sewnotKwJWfDO31pfNjUdmtbedkOoAHjl0LzffiZPTCCDogvgwrGDkBpEvmcqQ9NdCVk
         CdRY8FudHKvk2Iwueovw/Okug4UJI64pgNPf8ZOMkegXRdbwF5dhxht/dGNDS7p3tUUE
         Wy6qVfHqJkCzv3VXMe1V9ahDrX8/tdp9sdTwEG8/rIn1s4Si0VY9EzE8R2AF3s1SmHC9
         E8J/+yyRxfsEJNylqVd3GkyDyppOJPlsqyjFt1vc27/2rj3KcwBH+a+eAEYmXgHB6jNk
         Pp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987242; x=1748592042;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiOgEMrmn2U7xW4tTEzdOiPioV8Bcrr2XK1Z5C0tcV0=;
        b=E71KWQ90NZ98S0+4gnYxiY6djoxJWDaJNNqOSTaUIRZJurNQ6rNFx0PrJFE368E7fW
         ZP0xsQ92VD2wGjKpTxm/3V7v85waMeJSGepeEpikpjGlDZG1cwDMqQsOlV4pbfI/IQ9X
         zGYiVpcMxpczS79ZiCxIkd0j3FdwcWJnG40b0BEAkOCAu3/2ogEurYnt/Ivv1/jWnzWc
         l9a8g3KxIurxOlloIF6ONeOxCHXlpW1clriZFjEOGhRU5+CpurS3pE3tKGdkq1e6Yfgi
         bVsbZ8SmLJpzYJQpPhEqeywy5aC3H5pD6B6xqWhs3yZeqLT1rl8KColTw2lc4sn5hpaS
         zbBw==
X-Forwarded-Encrypted: i=1; AJvYcCUc1jjHzTC0/JNkqdrwmpNsP17fsEAmwxJbtUVxkc9Y6YUbtwMixJBYbJdFcXuxd/GP5S8rZa1zJ2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYppKVixCSf9bGuJJZbOCUFftvY2e8r5WKncJuQ/9ldJUcKfIt
	ngnS9v1NW42u7Tls9jgVXVfIxWi8JDu0bmqIbJf0QCSmU8Tgkw7UKmjlhvKcQOZ2PiM=
X-Gm-Gg: ASbGncsb9pAz1h+T910YYtbI4QKOG0oXxkKC2gxeztSyKUNGEhA/qItIziQbSaBC61p
	JPwoSdMMI5JrKVcgvN12Z1oVxLTQBYBH/L/R4wZ4f3B/eV8YsGxnvxVD5OIKZlUejZtsnXlmrvi
	4hxD85zSsWAvTa5Rmwbo0zrV3y6A9XUfBhtZ+NOIu/wV98LPM20UIxJ28S1Mq6EnUY7WghYCFJN
	5hem9N+Fq9lxPFUB3/7PDpAE5w0B+LYBFubDCf26tLSn+2b4ivuqv0wllV0aJemTznUro0ybl8C
	CGZYRDlEyz7cg6ZtSMZfHTYGHv1Jk+7ZjA33OiORhDvNVezH8TtlWeTgx5U=
X-Google-Smtp-Source: AGHT+IEvbKW254MsUR40tUY/6Hc7LpZqfJq52xNDBovshdfXXC0YZdAW7vXEzmN73f34vZoINkwAug==
X-Received: by 2002:a17:907:3fa2:b0:ad2:3577:38fb with SMTP id a640c23a62f3a-ad536bbf0fbmr2471893966b.30.1747987241746;
        Fri, 23 May 2025 01:00:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4c516dsm1183741766b.154.2025.05.23.01.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:00:41 -0700 (PDT)
Message-ID: <3e8f1df2-5da3-4db1-9fca-2cc9b4d0c0f9@tuxon.dev>
Date: Fri, 23 May 2025 11:00:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l: Rename to_mod_clock() to
 to_mstp_clock()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 22.05.2025 18:26, Geert Uytterhoeven wrote:
> Rename the to_mod_clock() helper macro to to_mstp_clock(), to match the
> type of the returned structure.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH v2 3/8] clk: renesas: rzg2l-cpg: Add macro to
> loop through module clocks"
> https://lore.kernel.org/20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.co,
> 
> To be queued in renesas-clk for v6.17.
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index dc92f09d5616223b..9449a5a5714302f8 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1200,18 +1200,18 @@ struct mstp_clock {
>  	bool enabled;
>  };
>  
> -#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
> +#define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)

I don't know the history behind this, but, I think it should be the other
way around for this driver, I mean change "mstp" strings with "mod"/"module".

The RZ/G3S, RZ/G2L HW manuals mention "MSTP" string only as an abbreviation
for "Module stop state". You can find "Module stop state (MSTP)" string on
sections describing the MSTOP bits for individual modules.

Instead, those manual refers to the clocks of individual IPs as "module
clocks".

The rzg2l-cpg.c is using "mod" for different module clock operations, e.g:
- struct rzg2l_cpg_priv::num_mod_clks
- rzg2l_mod_clock_endisable()
- rzg2l_mod_clock_enable()
- rzg2l_mod_clock_disable()
- rzg2l_mod_clock_is_enabled()
- static const struct clk_ops rzg2l_mod_clock_ops
- rzg2l_mod_clock_get_sibling()
- rzg2l_cpg_register_mod_clk()


Also, the SoC specific drivers use "mod":
- struct rzg2l_mod_clk
- struct rzg2l_cpg_info::crit_mod_clks
- struct rzg2l_cpg_info::num_crit_mod_clks
- struct rzg2l_cpg_info::mod_clks
- struct rzg2l_cpg_info::num_mod_clks
- struct rzg2l_cpg_info::num_hw_mod_clks

Other than this, if it "mstp" should remain, changes looks good to me and
you can add my:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu
