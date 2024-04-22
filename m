Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AF502BD
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773368; cv=none; b=JQDqQgLzhu4YDKpjpOdxC24p2tkc3ougjYyBvhKeeTU4817R/1UUJw+xdo2BM1MfKCvTw/lzsriuR+2nWYcBNqlMJ/5kbsio6oKbqHCv2FSKgGPn5a8axOw3RCATR4F0wSPV+tactWmUfnvRVMQbszksARdE0Qy3RmvW+OJB5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773368; c=relaxed/simple;
	bh=YIO8cDM25qQNZ4cv/ubwGqUQhUGYfoqZi8Ig4uTr/Sk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=p49yXPkyXllh8Ckfs52ycAHGrxMaN6UPOtiW3Zj3CGdZaQBkcmQaI6/JnB0zQMpYfJzZnvR1FRKHM7iSxQq3UqnIGBdsbzrzlTouARxGt+I4J09EDuG8jHoIfR/Nq2pjXzjLXbW12cLkkAYiH27vVW7ImoTbmRaHIP0k/RzROVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rNa/imUB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rNa/imUB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41a0979b9aeso8626505e9.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 01:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713773363; x=1714378163; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=G8Z1W9cBwZwFr+xw5xhgBlfEeDfYZ9v69oNkjrxgbOY=;
        b=rNa/imUBVTrJ1RpiBMNOyDhyno+kdSij38C3WhN3YthESsBc7q1ejUCThwaSIyEA8M
         3jxxiiKSuHzbzLHrqIOJJWAY+GLZYruemAFPOpjojPSRZzliDUjTqOrWJLl14cPyHePk
         y0zxyyM1eq32qzYzgTXxTGfF2twiTDgwY68ri5ImEmreWgaT+FqnLfwRUBtQhFVoteLE
         PfsH33517L17ISJl/wFOZx34R/HuhIERhKKF2NZb2Kn3NmQnlo9ibqdVcQtqVObrLyqU
         RjkCJQ7RKfbUgNRsCvh2Jyn3xx0e7g8U8nQJzXTy7sNFmKOgbWWf6elrzMGf8PupZge/
         69Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773363; x=1714378163;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8Z1W9cBwZwFr+xw5xhgBlfEeDfYZ9v69oNkjrxgbOY=;
        b=fpcZ501xrBc+g+9qwn56GH/yiClw1zU2Cze8cMCr/q3VhqvK2WqBQSUcdg2Up5BeVL
         B6/ce9/jm5+H3fvcoYvUypQiVfBo+9zzueONAEzoq7XoBNmsDpP9g+JeIFzhv9dPD1LR
         s9zjaPu51I107A0coSXF7nRPN22kAM10mvmqGbQQNEuvPtZjYqQ3BNjuWtOOlru9HGih
         u2WifClAowdPHyQ2jeQQ3cGcwzcuos6bTjV02gke+IdjkJs0NpoJ1TVSDfTq8jDdOuaI
         aGTNeObaJ/z5MNSY9Qt/2DyTbZ3F4X9zyjiz7m0/Hf49/grNjDU89GTjLWDU9cIDnASq
         bxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7R9q9QWZ7niCVxkUEp91uEPfFJb3RNFsDVpdruSSBT8VKFKnAN7Am0kXJ2MyUpL+6mx9R89J4gT9/bwshZYMEJ5haqRvdEv1O
X-Gm-Message-State: AOJu0YwQX6E/QxxSnOuUI1bztFzI1Qs13H3bmo+Hr1CzWlgJ/4VwCoWJ
	rmg6JWGIlnLfzwU22BhtVG5foDfWe6tzxhLyPRJ020UO+dfsiIt6Ss8Glp7O3Ig=
X-Google-Smtp-Source: AGHT+IFcBHuQrYYsaNLbUg30qmwUhwRzvle0l0p4jwsnHIaO8PpRDz4ckky8oOJr2gRpkpQzb3NY4A==
X-Received: by 2002:a05:600c:3587:b0:419:5c4:b430 with SMTP id p7-20020a05600c358700b0041905c4b430mr8846265wmq.14.1713773363290;
        Mon, 22 Apr 2024 01:09:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d6445000000b0034659d971a6sm11274074wrw.26.2024.04.22.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:09:22 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-4-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor  Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 3/6] clk: meson: axg: introduce AUD_MUX_TABLE()
 helper macro
Date: Mon, 22 Apr 2024 10:09:04 +0200
In-reply-to: <20240419125812.983409-4-jan.dakinevich@salutedevices.com>
Message-ID: <1jv849akel.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 19 Apr 2024 at 15:58, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This macro takes into account ->table property of
> 'struct clk_regmap_mux_data'.

Useless if the interface of controller is fixed.

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/meson-audio.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson-audio.h b/drivers/clk/meson/meson-audio.h
> index cbcdbd487d4a..1947c6cbf233 100644
> --- a/drivers/clk/meson/meson-audio.h
> +++ b/drivers/clk/meson/meson-audio.h
> @@ -17,9 +17,11 @@
>  	},								\
>  }
>  
> -#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags) {	\
> +#define AUD_MUX_TABLE(_name, _reg, _table, _mask, _shift, _dflags,	\
> +		      _pdata, _iflags) {				\
>  	.data = &(struct clk_regmap_mux_data){				\
>  		.offset = (_reg),					\
> +		.table = (_table),					\
>  		.mask = (_mask),					\
>  		.shift = (_shift),					\
>  		.flags = (_dflags),					\
> @@ -33,6 +35,10 @@
>  	},								\
>  }
>  
> +#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags)	\
> +	AUD_MUX_TABLE(_name, (_reg), NULL, (_mask), (_shift),		\
> +		      (_dflags), (_pdata), (_iflags))
> +
>  #define AUD_DIV(_name, _reg, _shift, _width, _dflags, _pname, _iflags) { \
>  	.data = &(struct clk_regmap_div_data){				\
>  		.offset = (_reg),					\


-- 
Jerome
