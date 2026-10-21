Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595306;
	b=T7tR38ZdyiSqdEqqzeOONsuSGFcqWaLfwBXVkRDpvez1bPQeZLZKzRMvWAt6xo7XFFBw
	 fke+FL9MhErIUVnFT121YED6+awiXiIyWRYdGzc9BpNM4iH8XTsVJbtEoKJhauFzjUypQ
	 Y/q1c68/ofR8C8P7I+YMSZSe9XdzoYJnTArtGoc8X3WWJ400xA+S7B+W8nxcWIvp9mSt+
	 +9QAFCoQzV7GTs+QOa2omt57hZggza0ZJ6jPInTk3TgfxW+oo1Imqeb9BmewUoQL6usBr
	 7sgMePZNnTyezPQHE3nfY93AIOs4EERSRz5UfW21xf/wNsTO4m83zb9wGtvlC0vYWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
	b=EusTEbX+6ntu7XQnd5hu1Tg5O9NhWsvBmotlz0gm8WXlaGRoNPayLMEiZ17ys8LS+o7w
	 iPELPMZgD9A2NE94hvNRH8zYlmz3VGo344DEe9uKmzj1erz4Sl1LJUf/sb2EsbEThRSjr
	 5pkgD1ACdyIc5FlWVbFZqjIprIXEeTE66VLSUeqvpxFZEJKPfSsGJbJCZ4cEw+syolTr8
	 Ds8/8pFmCgJZ0zINmB29TGaDkOJV23G5AQibxTxpcb/02FsTRsQqQ8xricn74AadYjIvJ
	 TOLe7oY90pJM3UGr8zPYdeb0EThuuMRZ13dmHhqIYihLHSpuX8KVyrWeQ7mw4gYYLOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DA60A4ACF
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0DA60A4ACF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so590742f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595303; x=1793200103; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=piUDd26SiHJsttMQlpJF2RFcZTqVsNgoVjeOxs6QUlmSk2QvOxsnQe8Ezy6yQxygv9
         bp3/hR8JIyALcdkS6SSpS2AHB4HdBi7PdgvYLqbsQRIf17orPMnj4ifgCQk5cHr+sPPm
         tXiTnTTlcltLlPAu+s4rrXOfdiXteziwQdPn8dZSiCLWnzoztKR/MGbNflI0MIE8+Tyd
         Htj0ZF4Jh9LkCr0Cx8FB5KGXm3CipfZl3kU2Ovndgb+u3Vd06mfWkbeZpNEJ/O/06DFM
         e1m8vcZdExPaf4EvuTH9Uuw7fw7NVZXJUGQdVpYUNMMz1bcEHVskDrelamoQClz0Gbjb
         /eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595303; x=1793200103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=ULBjHTACGzDtTQnx4b3qEsMCM/DK8/D3HMAZKowvtQHCzM0Zc3XRCi+hscS/1XgYSX
         YIHGcTCiSDeEv+avBQP7zJeQqfmGX8vr29IXIRIgj8bG7BNNQPlHCcsyL8WtBPlCYbpK
         M8Xq6PEHjxWscXxsGhQn/WBKIE53LlLjoZV99q4rjf3HMEZIMEgbskL3De4YJ2jbaKdX
         R1TEMIHvYSqB5N2ixaxHNpEBjJH93bLufmqz9HREXD6sCvfXtOqFs3+1sZeUF0AeKuGQ
         qSPYKE7/OK5TUis50ZoKKb3YtZAKZFFZGg9bAyfHI21eky2+2iDVgAmNyNNYXw5R/hVo
         HloQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHTauC7XkZL19nCCjnEF0iB2EC9Gy5noYMGJeD5V74GBomLBsz8MtUa+w1QomVGxo4PKGaFyNl5VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYg4nxcCQU07j36g3F0D+GguA6CDVSDHTwrOa+gI+w86yoc9wX
	GwTLUjnh51BbZQtuxcq954JD2MOYLxJNv1BYYD4WeA31fuTJm3y/cVnNbN0qKoYWTGI=
X-Gm-Gg: AYBFou1oOv+8VABF/3Ujhl7x6et6NvGtG2u4uoVVrG99noVT5x0cjj3yG7BzJyf8Jzu
	0ZHifDLF/8PoEOIDZ7mzC5sdqrlt7aDs2wKTdICwhhogJgqP8tahTtHEdi5xQ2OqoNCy4XyR2pJ
	RKlO1PYfak12w+j43sLPdC7EQXp81GDPeZ1jFaTz2QUnxYtwQ3IbwmtVZbKKTRGztMPrbSfXTPf
	vg7sfT24ZlbmoLs+WyheSwLHDXk2FfpfwJSlURLYzdxsmiYbXy/qt0LDLLlH3Fi6UcSH98nWjBZ
	0T3szkwC4xirLkxaCfvgchpugYhAndOM2kKqwfU+3xhEqTzuFmicc9J3WEG4YynUgW0CRQPGPO7
	0nSllescCCIJeCZEyEz11ix15NVnCXj+XSusLo6yjadrgKJDF8wxbeugdTlHBylBMo3QK7D3LqE
	qxgbJ+C2yE6FrTn6j1JtNwbYrlOVNM4aBw9YX/Rb67blh0qg1avrK3M9/xQnJfbnYVeRr/FOfYf
	2GCLgWMDLahA/h7BvK4rxysdqMW+ExtCNlxCVd7MNmDfzdPPcQqbwSyNhejI5DVjbWJC9fUpLk=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

