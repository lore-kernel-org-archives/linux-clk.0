Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636879;
	b=iDbfYBA1flSzXgGkiuGbwbuWIyi2PuL8ErVfzUr8e7/Rt1I2GPxynpuSCddbgCTm5fvZ
	 cgXpmv8/SJ9ABCkoyN1a1lcwa41sF8k3Ltu50hps7gMT/ZDKpD3v3oPZFgU7L3mSDCZHp
	 fTSY3YygLZSEroVtcOOyNinIdtwFKIfS+mfUQZGToNlw2nlt3LheS7WtzKfcOy1LlIVfj
	 MsT5atQYZEJYlqnlb6Jvz8D9oVGYftut+jMKqY1Xpdhi/wAUSZhHwr7Etu4CYyfeqoiCt
	 emsbFELx4nkYIW29bHPFvNHMlzDsVtOZ4ngrNGqQyu0Xue6/77P9+X+oauNQM3HYvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
	b=qoiB1E5Ojo3AIbZPxMRBAj7CjlCKvGEHT8FZYG9IorF56zvN6Pph9yro3j+ntp2gDQ8x
	 nOGjhWEJt5rh5DZyXMCz3e0kUcfw/cOz+G6hWpmH1Pe4yvDHX/gPU8gR8ssrtGN5b76YM
	 cHhLj53djdFL6GBGrIaHn4+5XKiJnIoM3+oCdaH7Kdxc4UgBRX6IGWZRpex3YwhHoLvq6
	 T8a8oHyScoPxdijuogb0lPukPjGJLmLzmUUU7jQtCpVIlH8WdCfqJbQEBs5b+fuSEw+Vk
	 P64cmYUjcloBKGCcx7ifCEPZ8DgKli6LyBRevWd4z5q93qtizyJDgAFVLJiGd4ekF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="N/JdCmfo";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD19609EE70
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 16:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD19609EE70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N/JdCmfo
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b042c0759so1676402f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793636876; x=1794241676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=N/JdCmfoOQK7c/GlMh6ZWjDCLLUajzBzjn9fBpsmB2HQvN6puxJw/UkqIE7QPHlIoW
         6K4m2yWk+nOk0+Kpdqxy5DIFfGmfpa5iCOJSQsL/lf6IuhXBPyzUIAgbNDgr+QvlRXEd
         2Fmhluv+O62pXpzWu3XwgrWs4FPPga0Zy8OwSH0JcuHNWRKoSMcdxuKftMW7KerTEQ/P
         gbIFOi+mBMM1Pl8qPZmEM8x8LRimJvlhMxDo2kkKoPldlJEdglHFuYzCyKVDrAgVIS3x
         hdBHEPyglDigrWnysmsToQwL4mR0MWyhWNBlIYW0sIsTsfoxIpBNgQyarKxekqle1GWB
         0AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636876; x=1794241676;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=hmRP1l/l6bfRdxbKWr/4FEwvGKK3YXjnNwLSVXoHlKwscNefoHfbgT81FSMDziJqzC
         FWuEekv98JK/z1dYtnK7w9LD87oRg77g/xUtvcAocvjiE4/EumIVNsDvn8tBuMTEc8hf
         pdtj0fY9k486WKMF64JviclUJSQRai1VHNfUTNRulEX8HuAjQc4FL7I1EZUu56K4uQ4Z
         t4UcZDvJIA5RaDjzrQcm/B5syh2ldaRAw97aCqveOs6J4GLsXVq6TovudlGwGlLmgLkK
         JGKpVO0F93/5S+1lQdasL1SfN2YqvYFPB+Zr4OkbJjkF29WgG5QpNn2TTFYpaftw6BZN
         1XwA==
X-Forwarded-Encrypted: i=1; AKwUvBwSlZvq6Cm3j3xOaHdvmAtosvb9Q/EQPETa0CA0FjpFNeyMs69DfgZieVHHgJY0w4cuOG9xtnfu+XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ho5HE+TXjcnsj7Vrg1axeKMszVnrJSiO86zDxGm17kB8k0sRa
	fMJklyEScSTbIQJeESwrL05VzK9BnSEgt4+PneA+MW2uNEOFXt3t8HBIyfgm6ALog1gdqiDsR9h
	tYZPSy24=
X-Gm-Gg: AYBFou3qABv9D6FTKmA5tsuEZi4ECFxm2IVIoEdwxo76UQTV5zfjLuGHSIHmR/49A2E
	19iOL0lUQwbLLifWzMcqPUtg/sK0COYk2/LnSDMkl2esccZUH0vdNGYBYclAyL2O6go+p5Mtk+T
	VLr0z/lXLqTEcLZXYhWXlYBwUrHy0iSApQX+afRbIBCSrD8w1xkJMr54ht74LNaHsEqW1gycj0J
	exwUdnJxk+1QaD6bbm5TMxNpCrKMa3q8IUrALf+mihGJxZL5W9HpAM1NEo2ocj7E5tr+D75GUK3
	t7bEitnFFC48p6+jyMiiThOKZj9qep26u1xEzULdfHzwtbhXC280E4coQ3NnJ3ot/Dimh4htLTC
	bJ//PRX55A6YFessyngpjdNpHbZl/wRivd9jhXYQBwTezCp6wRNVok6S13Cmr6mgTTw4notRRvZ
	j2v27HF0mzZ9ZzbILwdktKCU5mQ2AiFfkcsA7UlTwCb0fnUH8dxwVGcpF/SoFpnm/4Q+rVjOcwH
	JoI+L9nSU/Ab0VltK77lDVicJILF20bpYtohKdz5NUvh9B1oXjdzHcORgmJJ2BwmNlHP+9uBcFS
	OGhWhgIyFXbNtGuN4UdMfy+emiVv/8AB0zX9UyGpLkJ4MuuiCA==
X-Received: by 2002:a05:6000:22c3:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-48e6e505515mr22460208f8f.32.1793636875388;
        Mon, 02 Nov 2026 08:27:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm21327567f8f.1.2026.11.02.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Message-Id: <179363686177.2573818.9840227299008811238.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:27:41 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=78; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvdnHpxHrPXvaH9XIH+4SEyWdKTjDzFkYtFOY7YbPEt
 ljWNNW4o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5dZ/hD0+n5LxFfV82ZzPZ
 LpyvGbFFh8d2+Z7r0yJVltn8e3RUezHDP9Oft5buYvW7J6K6Z1Hb+ym/t6j/8G1lnzSlRvlYf7X
 6Ri4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

Best regards,
--
Jerome

