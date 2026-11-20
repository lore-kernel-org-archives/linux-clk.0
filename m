Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199129;
	b=slDYey4Y39V+vcOOLuDT5e1jn7HXO4L19ypEqT8gPEnCgOcbCBd5U1QmOoWhSR4eKJsK
	 ZLsZXJ9GqxNtLFI991Zv7ogOZJsKz7WZrq6G7iFy9kDVLwnlie6CPdH2qlXl+ORzo8STs
	 ogurLtvJ2qIvUtW/hScVsQqurFr+79ZLvwiKzef96khpGZIvh9TxFPUrDuqXBTFVGY9j5
	 6wkF4vT1pePuQCigJaa+xPTWXKiWOlLFLJaEWUIZDZLyTBh0od1J5P0ognrlsDAsX3ISI
	 63yq3EYjuO6GGBC+cQQByouHOqNw6PQl68yOXjn25WqFQBg3GKdOUVL+Y4UtlkoIvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
	b=ECsr7oujYIVz1skOQI1H1Qy16FtUxLsrBKVWiLOdyVnXVk41gYG/IrLBxSuZ9N1fcErL
	 qwlYoPExVimKC0CFYp9kdLPRMabtjjTYEg/E4RLSfewQa54PnySaGfJDI61XqWdr4Ej42
	 mHspEuikBmSP6S3oTfvYCMGtOZP0alXVsI9Rg+gJXRJuO79VW1FDnrU2vpTJnDaLuBdqo
	 rKcS9wsFqihzdd7roDvwcqJBgAACzQVHp7aFFTMNhKzDjVcQCImPVfT56GhsCxdbUNpyt
	 2UdA2vIn2XEnRh6EiDMdUOmqmnuZ+H58I41fCyfIQcwEhHxsJ8o7Il8ntAIEehq+7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF1606A33C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 18:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BF1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q09dThmH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so1066019f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795199126; x=1795803926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=Q09dThmH+AfeATpANJTL84Inm6iYWArhWDiibkRE935RvaUta54OpB8h9ocZUlmMrq
         ///onBpV0ngantSEkrqsIVWvU0cQY0/t5H+JqEbch+9tE0vWGfK/GDvZXyf8/Ng6k8Hx
         Gm6UyDSt59Edfky74CyUkF4Ec8m2jwOC7XIRZLhYrI4VsdaSGVyP8FyUGFiJdl28NXFg
         NwQjsOJjt1ShLPXjthsxJo9KOIlOZTjTeFXK+7WdtV6WKMToHolFaSoCx8nGOC3uEXGT
         LZAlbwxbm+BKohETc0ZxaW+59vm6/ExDRfWuR2MYrMnXMbnYz3Xw0M2RJiWPQnJ9xKl2
         XyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199126; x=1795803926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdsl3Fpj96ajho6n1JE8US+G3gvmCNGH4Zwy+J1ofWw=;
        b=UnyuDTFNOwW6xdCVRFjYr4Yg9qcKJTscxRobuWg2XRy6gJxduu5hz6TtzXw1iCatj5
         n96J672J5iOHJ8pF+hUCuFEmvEUvnbBMAS2Uv6BoqMmXPRt1aWqlnG4KjD/EJ5ybrzRg
         3M3Ka37AgeufNvH+ZU3iNQW9QdKH/vQQEwHtZZVM2azbeDv68kbspi1DZ3I5L8ge6VEV
         Eh3uZeWpU0qqRiWaq0m3bW+Na7Xhf5HebR3m4MR1qpVOpIiLTgq6zt/Z3ecXic+UppNu
         9kBgMt4rfgRbQAhoWgGsb02tP5bIrTvJu6mPYs5QmZlvjaZba108Q7znzmiut0G0iccM
         G6Kg==
X-Forwarded-Encrypted: i=1; AL+hErHAvCrpHYkB3mav4ujP3WsuWtwLA1tvAPfUSuNdiOqnIhFGrbikKHxOQYMmduq5fImQ+1/U6fD2LGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R+p46SOZ2L1A/jnApnscBHqe5Dt8SwcppwYJfvqZEtpn4GjED
	hQDmOma9DccvIFtDdxk9J8WYIKBxWNz7gCKs7Y0BxjZamjzmGUrRy+AvlokYhdzQRiM=
X-Gm-Gg: AYBFou22K0wgUuoKTsd0EqALIoO0EKsV733knkjYk982ibom8g2yOlWYnOWedcxZQSE
	6HvTxioJh4X/ufUh0jp2LkK/URDISU51H145oN+pADXb/MjbQRUW/ClQygcGToMDDvqqvHX84BQ
	DMjYP9SExZTHRPXl3tQHDd5p+A7MwHrmc9193YlnJGdm2A9AyjUIQDQcko+TVF40BVHP1v8xnpH
	Cx1njPbuMz6ePVFVC0PB4IpxL7dd38j+A5Y1KW7k04Dd/HnzWQIyfvWBW7Qwy9idmFGqYHt0w7a
	M73BjXo21czUX1cYySMw0xuBHX/yt7rnEFa8T2k69DxV3B6n+FFgR92Ff9s9Nqan0WSqJkT9RqR
	UDqHbPm67VAE0XyBc1DqmoBL0FvosFOml6gnH1+tZnpfxi72y7GzUy/mR14W34yygtUpuWEENUH
	eJ4wCJSuc9DXsSmKFcyN9mypuyKETRUrZeWAFSruj+3WsLDjwNFnrV5yfFowpzVKdStsAczqJc2
	y9xpXzUxOxhrcyeUZZIWHEqPCX4uv0hNT2Oo5hxuKFsaSztAR0433EX3FUCzeoME9ioA8HslDHe
	juSVxpDntE4g7QapCihxzwbehI6JqHEao/Wo1XOdLxRJ2qVU
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr90364855e9.20.1795199126650;
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm150583125e9.11.2026.11.20.10.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:25:26 -0800 (PST)
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
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20261120-oversold-enlighten-48e6c36e74de@spud>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
 <179519084920.3795820.18319787881002052092.b4-review@b4>
 <20261120-oversold-enlighten-48e6c36e74de@spud>
Date: Fri, 20 Nov 2026 19:25:24 +0100
Message-Id: <179519912461.3795820.175908509395869639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TlQ1YVhRz7S/iXBfoIv2gcjj5oVi9Rudwy+CoiFSaI4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkME6bwFoXnX+DeqK4aoN0p2Gxx+cTExA3xGSl60xxL+
 t4nzLPsKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwEQyfjD8j9i87bzj9ZfsxQY6
 TB8/z0ryqrvybO9FRaV1mdbuOwXOHGX4n3f276w/f/99zBWq2zyloKY8/0HCcf7JxdK+p5Zs0FD
 8wwgA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-20 17:18 +0000, Conor Dooley wrote:
> On Fri, Nov 20, 2026 at 05:07:29PM +0100, Jerome Brunet wrote:
> > > Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> > > exposes a clock (can be any type of clock) whose availability depends on
> > > a GPIO status signal.
> > > 
> > > Some hardware designs provide fixed-frequency clocks generated outside
> > > software control, such as by FPGA-resident PLLs. While the clock rate is
> > > fixed, a separate GPIO signal indicates whether the clock source is enabled
> > > and producing a valid output.
> > 
> > On v5 I pointed out that the input is not fixed in general. It might be your
> > specific use-case but it does not generalize.
> 
> Does this mean you are asking for the commit message to be reworded?

I would not have asked for this only but since another version is needed for the
driver side anyway, I'd like that to happen yes.

-- 
Jerome

