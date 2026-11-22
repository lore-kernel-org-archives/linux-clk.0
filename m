Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364887;
	b=cfO3UGSege3dkWcRpzZXep+VjIxUZXGMSIfINvsrr1ycBc9iWPon8zvOPakVWTIDYx8e
	 xCkj9TElgGZTXLKV03jJP0fHvM4hvFQisUlvRUz+R+9rKafKRuoef+OyMQvIQD8BUjkFo
	 D/jWSsf86lCQ6aTSvdU2u+cBPCuBGM0PL8Ut5Ot5nYsj43MlmlrpE7A8rh0H57DgE/tur
	 E0jgb4knaodMaXCoXugG5BBp6CN+DemaKplf571NWOL7219hJzhizpoAuq8Q4pf914+jD
	 vi+yBHQR+NtjcmSnxevvpmqRXGcLXoXPrE+tu9mVYEH1MQEvL5FO/7qOBy1AL8JIVrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
	b=q2DDOgEpolPE6ZhexV1t3uqts8126I61BnZCnPfT1KxkoElJ7mvSXthrClaHpvDtJMkI
	 qjymvsQDaMn+UxhVIzEwIpDa3LFm5apRoWM+b5jACMVpjA2SPB6wV2FZ9B47IbwEib/A1
	 8W3V5W2g2A+CPobo+5Lpp6U4ICbDLPL/tJM0Mb7xObelUDjG+uVrO6Z300+smbBLB460w
	 7s3IALA3BwD10cD1vZP5Y4wdJ+g5zuV+eXQvz7KCdaBs89SZRb2eNQ8lF73yuMu3qNf4j
	 ktEnCINblHmHDF0t1LPottPyKTP1oaD2TY/W2XfGKL8Bo3m9Ll4ZG98HztrMqx36AmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GAl1Ng02;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199A606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 16:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D199A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GAl1Ng02
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2078873f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364885; x=1795969685; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
        b=GAl1Ng02U0lZ/BOAyVR9esrJJalYpD6MAHcQ080WrV4nSsX4BPg7gAW9nCSibDtuXv
         67r7hgP/tnpSzgJNuGUsVX6UfckzI5QDXfqsLikZTBUvsRwsERjn24WvZJSKLsMAbpJB
         +SlvxJAIiLyAafb+jpZLHs9uarB2nYfIMtihwTEduAfW8sJ+SVQrgXEjHrhoOFnjr3oU
         IXL7WIvCXlwte5iMWVr5O0M8HqqnwkpZfjsS21Rd/CGNHTKAcJkJgxkWPnrBdo9ECJpA
         ydoW792lNzK0d6Q6m4QGCP9Cvrkrs3wX8H632OlFeHGp1QQbDktvCRgws+huU8H/hJrJ
         GLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364885; x=1795969685;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
        b=ut96x0vO+cEKUVHv2ImD9ilUkauGMCXPtrfMtgOAKRQEpJLFkVBnoZLjjp3GM4BRZs
         O/9QymXAE1o/4M26sP2sbKcM7+7zSDEIwEPLGTpNcW0zRrPPrS5eWmkC0ZqL/p/B9sUH
         6vv2DV/AeVMXk5Fp0BHEWqtxsZU0h5QW51/jiNWhixoUhbzXidwaUmzgTNe1VtA54BWm
         vFstjJ5qVkhrIRyyqpiKXG9LykQ11MR+sC1wFj4sWQ9Lf8Cs/JP8kmQxh55pZPyTcNqA
         gmJ1DEHhxNQCOdBxE7M9ujYI1/Ey1rsEvgfuknv/ZPONYv3UENKh+/qhrMx+tzUMx2Gy
         9UYQ==
X-Forwarded-Encrypted: i=1; AL+hErEaEW+PDEcZzuZOSUyIFmNTSuwpPfz3l6tPSjGWWMbpT7S3/y607a6v2VDCLL6wSq+FfesHAvBSw/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wSyJedPpqNzAAry59woRzszJneJn6roNL9VCj4Yc4MCE9PFtZ
	9xVE9+KSYnhEy9LFg9XH7pVQXB5jNXQAXSFHauxZjmqCMyfUqh35p4gxWOvAoT1Tb9I=
X-Gm-Gg: AZFdTZcxsu8/yudWHw7FnbZJF09VdAn8f/wITVvJ7k7eO5Q42x+ys18Sle7HSZzoOId
	Tfxigt+WzhW/lk9KthkgCLC0q1UEG38maajbhpufi/ublhaFOGr+hIb4jqy6wgoCDEmp8NI4Pir
	/dcuEtrqE+0pe4YWFEpsEyQRPUKhJMF0utQ/kKdzNYFRgxMPcWVGmTdPOVTPi7/st7+lvEZNAOH
	3RekUDicf8CyRIYO6+97cllIEZTRCnddsfiXFazRLDNeXSpjhLozTy0SII7pECI4QZfb7alSqp3
	ZI0MeC7jRdNn2Se4YBm8iIPW1UEFNbcvTiGTb3Rnn/hCX39bK8j/L0xg9j/qjDzCJmC77OWfx7Y
	Iw+j+JvNdBe15GZ4b2RFORunbUahwOQEMnsgnXxrh7d3PurI+PKdHWSOYRTS2V0o4RihGvuRERC
	DtQms918NZvnRD0BQ/mFwytPDdq6QMhHykIt5rWZry9c1iQFBB4+4wR+HhRiwO+REg0PYtMh1hD
	8fV/EvwKrS8ArrOsp+W524hrOL9lFdkhY4MNoJuLMrlW6JxIcFEcq3qvb9pUDyqu0YOXSWaQy4d
	WX0gY6OID8cowmkS/rNgaKtF0oXyNrQE4SsdgUDbxWEJc3zeb5fnc+GCjceNqvXTwxHDzw==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr188625935e9.31.1795364885287;
        Sun, 22 Nov 2026 08:28:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm17362811f8f.51.2026.11.22.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:28:04 -0800 (PST)
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
Subject: Re: [PATCH] clk: vc5: Enable PFD frequency doubler for VersaClock
 6E
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Adam Ford <aford173@gmail.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261117-vc5-6975-dbl-v1-1-d332b89964dc@zanders.be>
References: <20261117-vc5-6975-dbl-v1-1-d332b89964dc@zanders.be>
Date: Sun, 22 Nov 2026 17:27:59 +0100
Message-Id: <179536487990.2728475.4863245677002258982.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZJo1a9C/BXLQoHwq5QdRmDm3Dr2nuwnbw9QvlGUmVRk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMEkIprPauS8KnPmNqDMjIjI88ePDr3+Mfb/FWbyliP
 u/N71nZUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgInwejP8d5X+seNuku//lStL
 T6+5JXjxrSZfndPHrHkML8NvRxs96WFkOLIrofvAhoMF3V8UmQ2CzznGqURMLTgV9/632fmpk93
 4GAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The VersaClock 6E family (5P49V6965, 5P49V6975) supports the
> reference frequency doubler, but VC5_HAS_PFD_FREQ_DBL is not set for
> these devices. As a result, the doubler setting is ignored and all
> PLL and output rates are reported at half their actual value when it
> is enabled.
> 
> Set VC5_HAS_PFD_FREQ_DBL for the 5P49V6965 and 5P49V6975. Tested on
> 5P49V6975 only.
> 
> Fixes: 2bda748e6ad8 ("clk: vc5: Add support for IDT VersaClock 5P49V6965")
> Fixes: d8473831066b ("clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975")
> Signed-off-by: Maarten Zanders <maarten@zanders.be>

Could please split the 2 fixes so it backports cleanly and make the life of
the stable folks easy ?

With that:

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

