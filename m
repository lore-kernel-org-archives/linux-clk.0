Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632528;
	b=gN4/EVURjPSmN81ocfSkGXEwvOg/TczePeaZ3tTfVEA3krsS1kKwnpIYkygYbXU2NN/y
	 SGWWheuj5Y340XVfZmf6DS1x9k5m02HrvB0oP5fMGnVURSyrRx7UDuDh3o7ojfBXZnED+
	 KkrZ1cO4AJI5VX7qLnqpCxxsQlXgDX9qE+K3AoU9SG+scbx6yEB9+gvDtL0+S9CMgP48l
	 esuCM7OzXUko3OKZOzjeM9/d1Ua9d88QDgaUbzvZFg/sl+L7WpnQTiwRR/utOPHiNT3mn
	 G8VTrnFJ/aZBo9npMjpjnDzTLmAfWQ4Zc/JMZs/aAy5/+UnGX5OIADk/XifVqXu3R9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
	b=OrRGN9yNsUyXkUQZ7YCjC/yZZeB719H6C8drY4izxmlekwARS+u+KtIgmCFxF5ARFA9O
	 4oBebvQh0LdzKbUDZU01lqZ2wCDItK1oYwUPjdDb8O/5mH3tg1BQpJ2ODbLx00nt7c+mZ
	 JRgu1HkEFpq2EtxsStPz2mwI73IdA+iKBSX1OQfHZfojKuOvex0Ya+XvQHyzyHwYdHC0V
	 +dzD7/IeZ/nrUcQN45o8sGD+NUqWJLiI+ef0UIZa2vMvRbnFB71iaYJHpDax8WGwLUDbz
	 wrnX1y/X+tX6uOPoP187GVSQkm40OCt+KL+pzkHO77ztP/2k93jN7W8x0iEdHtpp++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDpliHPl;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429656079069
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429656079069
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDpliHPl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1572918f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632526; x=1794237326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=YDpliHPlzfMOH7DTeVoAUubrnY1nqghB8suVIzq+Qng8vGXwBCDqxcDQcCZ3lvyaI7
         WL6QW0UlHxlN2AHvZd3enIPtJkFFy44HhFuJEvlVbtwTpO9szNInf+EUj7IKyjgtvU6C
         /EVgGrNefqpVu96YcwVxwqSoyMH92zXNM7fONzikSumIabvsguMwFE2YKJ42GNRZMz7R
         3E7I3kzLVeVPrXGZyyfG3rKHu046jXu575Mv5Z5SwbGeVc8oa1ChDiYsMpcjQThYaitN
         5QgC4/2OpaS64FtcYPfOT/YT1XJPOADQt+1T7nct7jYKCvQcYEWc8B2sfPjeqCGcWgM/
         SoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632526; x=1794237326;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=NN0ecc0NLlNfcro8k4wgjoqcXJQr6H7b2HFI5uQrS4ceo7RTJlfo3IqdEoyCm5YamG
         rLUHbCxvJ0eONSDmg3QrakDQfGWP8be1sDHf15MugJnCjts4+5e6xdaz+TG7w63kanUj
         IkjUP5fCy3+rHhfp9sU1Anp0u8qYkK0YFVV8orjgl7CEKxVweVnizOcTaoEq71Yi+2U4
         DrIWusp85bpqUZw4fhyMApU11qU32DuHLhEgkUtUOzcWTSXfej29mAXFwrvInh+4h1EB
         e+6t+4oCS3n8kaqVlhTLRCn9UCXectmlRIcMzTJHQo4l5LGfb2RTpHW9wjuXOmjo2IUv
         eKnA==
X-Gm-Message-State: APuU4Z/UWt+vXFJ4xIhNLBovRvWGIceAX/gjiZFcNLCqDVYhFcEG0oqb
	EVOzokQMvHPzVhlhEBD/lehHr3yv2+ZPct9peHpFKwcI3Axe8B5QBoFuR9Q9U8wKorQ=
X-Gm-Gg: AYBFou0cHf8sdU/mQWGm1FUSNgZw6yL5zf6+K2bkuDR5ZoOWbn8vSA1QgcccNBOqa36
	JtAzztPtx7eQk09/JQ5np8BqVnzRXH8pTreGZlzKDRuSTnum0tK0cLO0UHoyhi/ISnEoIhhSVgR
	A8AvBEMXPRM+3fWAZxRn8Aw5GDBwnnhGa2WPNtHvadnfv0Pxnlurd4DDfPaJakQ1hACdxb5f5z0
	MFqs/qgMiDLA9dORZcbixnAfN67K4rO3dsNbSbkLRjMur7lsC2S59H+Pf0fFqFkHF0kB1lRtMFG
	OTaBsbOlkNa7Ne9NBTt5wilgDjqgJQvif7staCCO9ROEoklaGSK3zUW6lD55FjiR0P0SbzubnoT
	QqcBBIHuJBq33IvvLrq3HZwja4oq8U/dj6d1xzGJQ59VDxrfIieAOh6cBZwfbED4iCRDLDfCOB6
	MbB4fOZTj8imXASbrOgVlwtgLn8lOXEvfARGUYOIAICdnAg6Pmf6FzYqwWyFeDJunY3GTI9nQyr
	y8mfAh9Rhmp87swe882dq2nIQUzIAEBpz4RwZW2QjoWZkS+kK82w6eTgXqm2+vb9g5VkePVLE/s
	oz6g28aRwh/d/oawxzXfkowIw9vXoSY8GKr5zwzUuTgPa/dyq7HZbb5+ZWjwAY7uMu47ZQ==
X-Received: by 2002:a5d:5f07:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e6e4f8c4dmr24016067f8f.44.1793632525630;
        Mon, 02 Nov 2026 07:15:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm20278422f8f.46.2026.11.02.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:15:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
Message-Id: <179363251235.2870673.14649605942242408938.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:15:12 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=218; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cdtF+IoyulNvDDWLsBzOlK8XDHbQ0yPEZoN3CHTIrY8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvJ8sVbYu2HF+9xn65XDM1Jd43QWq/2zZOfkVywKe
 OHy52NuRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZi943hf9oOm6dcXHLN/DMf
 PZRJyvlv6rpr2aSsORcCbLstlvzxmM3IcEsluDdb6sybjOPF3/9PyTK768OXKZxZ6ukkVDPlo6Y
 9HwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] MAINTAINERS: cover all the headers in ARM/Amlogic Meson SoC CLOCK FRAMEWORK
      https://git.kernel.org/clk/linux/c/493e4ff653e5

Best regards,
--
Jerome

