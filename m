Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EAD34A3BF
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013102; cv=none; b=BqNLr+ub6nbILZ9+HoquPvgRwKPU+uD/5hQe80KnH1ZkHnfOV03GhHet4peD9HQEEusGE+cRHaDGQoGiOBTzTLGWSsPahx+iHhhjWRBwO8ZCvqMZEdkCZNtld7gMvVk9HoTBPd4Pj0+V2a68oKQexJ3cWCTmHjhBWxYejYUr8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013102; c=relaxed/simple;
	bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxswabM22MqsGEhedzMRUSSDx/daQB6RnqyYwtnAPHA5mYI5pqvwAi1AsB8q7Qpja4EAElp1Y1Qo2PkwzfZK2twQs+ifbQnZLrAQ9YO1xxejAh0TXOoZKmmMdVdlRknDv7Yz6SNYGr9h5kQmaGNDVSlvjRIOVVgwdX2Wz3IjvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbDJUUcA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbDJUUcA"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e6391b114so169151385a.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013101; x=1783617901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=lbDJUUcASoJwiJutICwz8ij3ML+QnftQqwday3upc1aZ+MkcGlcYXIGkeAr0MvnjYU
         h01qd/slnALp6AAXGlkKcWkM3VVJPhR59Z0+rUrOaS0nLjMF0qI9XgXUJlCASRh4saNJ
         c71RkGiYm6PkutNHLMBGBsy7KwFqMdgLzyw+kPGzP1MOpTPkVkYjv0+t3uf7+THkfUDx
         7HzJ8QLlwISfmMrvjxImj9zTQ01FDsuLPjN8oYhhCBjVxHNL7+mTn0RKEOFq4wYMQL/M
         Wf4SvAsev+9AV4WCSxz6gQNftrQj2jC/9T4/jmftvsvoNpT4cjTDnADzmBjqRS7NRtkE
         LLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013101; x=1783617901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=qi3Cm8pfG9084ntgXA6rDNNWZS/HHcbWK0R/M44/X7zesrIJCnDV/b8ngz/r5jwWlZ
         K4W4r71dUk6RuSNQLWQ3l1ASc7Gz6l2mZgrKKahnLJHstmccJcILkISriDisccoM3Ysp
         rrg301+YByxEYnF1DEp2gAT5rN/Ud0Y4lh7R/xwx2OAyl92HdwsEFB9oVnQQvOsQU+Xr
         dkcOXZumyIieC5VEi49Vuf/mXHl32MLl5rhwbTZMz3f3+3Qj9oFTbJIVGd1TpwG07pB2
         iRvRY4iTTcBxYn6noyt45gS+ROaKmBrCVopHApXaGXqwLVvlPgM+o+9tqlTVc3/UV5jn
         O3CA==
X-Forwarded-Encrypted: i=1; AFNElJ96fs0CJwTBzscM8AxwnyjpaEayMswgQppphGFvifqnPuGz9AhUaLkKjEu/QdGFAopVQFE14mOTsms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuElEB2FMVQYW1mLvMwX0I4JHaTgGi3B3h4LFGMBspYi2IbFWR
	//zg3ao39vQBiRy5rNFyOiaUAWeNvIB5C+BmfAK/J+0fNe6m1lt9WssX
X-Gm-Gg: AfdE7clwNiJICAHiRSfL0fQmek5Fe+milzhTGEsO967QLjcFX491bxFMrqThOwxImwZ
	1OpNxiAPuEzuFiH375jpXslX/k8RusRy3EUPLmvTaVOvuylD/XbtOzfqi9GMFVeVRagiw0W823z
	kDjJnMiE0tNLN42cXVyThwx0yEwzsd/A4yy24FdTTrJg2rSracScoj3+HqJiTMiH6yebm0EpTVe
	cmcs1KQrnmmHLfJ8m+Nbv0Rit7RC7ve7i60yJstmxnqh/NZaXqBJbYufJZbsyq5WkIm4IvNyfAr
	hQ6OA2ZAMv8FN3Ph9pN+bN6Yu0gOAJo24uP8uU8Dxo/CBQ1pwyT649GZtp3IQs1aB30EX3n8NF0
	obEAiHcATlp5gPHr1wMhb/5rRAttwW62e2Qy0WZACl7bBDxvTB9e0p3XsjBkyDX395n2lk5rO9i
	UeMV+04Zcgf5hif2b2PrV3kdmCR/ha1M+KuBKj1XI4/PBcA0bjwD51qU0HVFNU3cgq+E1xAXU=
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e7afb2399mr780848785a.9.1783013100344;
        Thu, 02 Jul 2026 10:25:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801948a8sm265545285a.35.2026.07.02.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:24:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Thu,  2 Jul 2026 13:24:56 -0400
Message-ID: <20260702172456.848487-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the mod clocks in this patch against the public A733
User Manual V0.92: 88 of the 94 mod/mux clock entries match the manual's
register offsets, with the documented gating/mux/divider layout at each
offset. The six that have no register in the public manual are the set
already discussed in this thread for provenance notes - avs (0x0880),
spi4 (0x0F28), sgpio (0x1060), lpc (0x1080), gmac1-phy (0x1420) - plus
one more: tcon-lcd2 (0x1510); the manual only documents VO0_TCONLCD0
(0x1500) and VO0_TCONLCD1 (0x1508).

Thanks,
Enzo
