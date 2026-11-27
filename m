Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793019;
	b=x6Gbed6qAjkIv947W7pVVW9e+0hiVxCP4cORgcE8mD+B3eTcl+Mm1WFIGlDnz1ZYfe31
	 3H5rE8y1GBvYKXTddVOrXxmtUOcSLmfI91BVn5AtiY5b3zOiB1igLPm/cYkNUEpvgyYfm
	 /DmHhZFv/cVwhFZsidaLIXzSxBmFoIK5I7TYZ0Xr868EhRBc9HYLZPi1m9RsFdRWa5lba
	 EedfYbbFH4eadzFfQwIy38z8aFhKP5uwlunW9vrHPUSudnPpvUEer+oKVd9rqu9BouKGC
	 XDATRGOZux786BMBQFADJ/ED7jQM1o0Ctu6mXiAlDsGCwlMJdH8Ut4XypfIWKP+jr4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
	b=A61qvbM26XBtkw7hJ9V1nkiysQ9lv5/YjbBPsZYPJ4zmX39W+gQ22ZYBuecNdUOpOCRg
	 G7Kf8PIhe5J2rl5MN5J9gHtWe7ieFzt37YUbcFsWCcSKWXAxRsQlz5lF4q1nkDG5VIFDO
	 AQMz1lN7WHJnejarYm0ldrcVLMcCRC+e34tuPOzDQHBQJ9qsBd5eL2YXAarcpM1J33vTy
	 /S06z7xTA7kUawtaBB6f7W+8IeqqG+gByKKK9eDwgaGG24IPY3W9tyBCzr4qdbOuD5g84
	 8Q/1y3pjNZw9YcR0gSF1rwH/Gpkf5eu8a+TQdbM56zTiapBSoT+zGWvvDsWPdjc3VaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QboAQD4h;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CFC606A32D
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CFC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QboAQD4h
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so66494145e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793017; x=1796397817; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=QboAQD4h6FlTh638/qbZrEca1ePBYi6iOTg6zCke7lOWUX02RSXg2kC0DTkf0WL/X7
         QuLCFyjBvBQkwvNgg+u+Mp2F3LldzbTRpqZ+vVlZTiR9F4uJAT7/sdATkGx+EVlLnAUK
         UX0d7swOYtyUzViymj1dadNl96yl46ox+3A1u/SNyW55NorFWw8ha2Rp/4vJqoAyTVpf
         Ma2mWvQuQI/EDdpGK6P0tEmrf32JZuVqOvElsl1HnUsekBZeSiDnYoAAYP+gp2A6gVB/
         bVjkNaMrVRt6MQ9xUvw3j0qQkpP796bZPoLKWZTIruGhHH0eOSaG5T2GRg4kZ00e7TtI
         d0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793017; x=1796397817;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=RG2cFn6OnDxn0sDkHQmRjSqOplpTb4vNMme3zPSFFrMTFH+WHdyX1NOe6bb/cdHA7X
         r7Zbr94j2/9ClPrZWupKxaXbU383Dss1uWA8UO/ji3r8NJqytRgi2oDz1g6GHGzbvkwq
         0esS1EIo5leTReDIe3UlAXUcRSoRpPoKbSIlwD7wlJiE4sxb7QfWu6e/PXY1hO9CQmMY
         dRaIJQtEOuIZSAqy5GUmPHS0KRaU0s6cmfMZtoh7lhwZ5tubyrJGqPtBVb7hSVkk9VzJ
         T7IXeX+aY0wfQxIih7O19dR7EgvN4Tzq49XvP6NxPqiEcs136NKqH327OVzRVWcJGr9K
         mBZw==
X-Forwarded-Encrypted: i=1; AL+hErFCXmxqQq0Fyy8l3XcaNZeQQzk+tbcZ4DYY2GIZLgd77zi9rkWOQieAQO25mq0CkqLZOb1ieHx5pZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LSzmSkZfUvn/JGevHwjbr/+SRaUTNvORzQkRg4EQfn1ZGXVhv
	OpD66QFAvzD+sd6Ky//tWvi1QNsHbTS05xQK5OvKbnDMk6l+jsvLx3bedH/ymtUJmIM=
X-Gm-Gg: AZFdTZc5GqQZEglNKugdf7Uwe5tIa+V2M1XnwgbjNfeYx7Utpw9t7QSFmYkz3HBe19w
	gX18+R+C6kkyKRQUaQD4GpPsqqMnPx3cHnaBJoUSxORQAQiAmTvcfT6mQ54CTAEzBMr7MMDuW0Y
	KOtQLKnInamFGYvcrxmbHgqFETGzvVSR6JyB2MjovfGRx1IlrRVmJLwbcrVDRpmtp6UWjlblipa
	PPvkX5moYCV0BY3xvUw5Yw4CaJVw6VLJFisZhLfY16OlJSuwAIHHlm8QIYBSnt7rGSz1fI3aue+
	78xDiteQ0V5A42dN581sRGI3rcDPV3/MTBn0PRtrih6cyNKzlp3nR+di+8yXQHuDY3bYDkQdPiE
	AFwxYeMmOrtt0SkLx/X1vP8CVQUVHMy5mOsyZU8ko4ZgFXd4p7HVtf9LfTFNXj6ppQ9bzrgRxIk
	1jR6QNpy3rwPLbJJxkR5vkEZvVwUQuIVngLHTK4RPSz2w7C2eS1RHrAhzxB+ct7LqHrC/6z6mhw
	Ay1t0NCARserk8VkFHoMjD066/kvJATcGACjrnlXuJH1Ccs+56JOjwWzf9Gyskr7dw9U82/jmTO
	X0jyysKhYnTgEi9LVHkXh1ezLu3m05giyC7llC2msjbNd9AX
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr482584215e9.7.1795793016430;
        Fri, 27 Nov 2026 07:23:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm403008435e9.0.2026.11.27.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:23:35 -0800 (PST)
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
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <179579266081.2809466.15729395589845750540.b4-review@b4>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
 <179579266081.2809466.15729395589845750540.b4-review@b4>
Date: Fri, 27 Nov 2026 16:23:34 +0100
Message-Id: <179579301418.2809466.2771229024752123171.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=581; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Vst0VQm1vcSZ7OfH3CNMLMaYl5sNZoVSXY6fEdIrm0c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC8qOOV6JqahZuVC1YoPfnyUabkl6O6p0QvLXS+2c5
 pa4zXNZRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaybzEjw8GazYsXiQc0lB4L
 cP+a8ElOj3NzsajI3W7Wi+c/FlYf3M/IcCmQ+8aHyZke7Md4fv0MdC5S9PwjXBjd9CTS67x3OyM
 PCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-27 16:17 +0100, Jerome Brunet wrote:
> > auxiliary_device_init() returns an error before device_initialize() is
> > called, so the release callback never runs on this path and the rdev
> > allocated in jh7110_reset_controller_register() is leaked.
> > 
> > Free rdev when auxiliary_device_init() fails.
> > 
> > Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")
> 
> sashiko is right about this tag, this needs fixing
> I'll do it while applying the change

Arf I got confused , you've already fixed it up. Sorry about that

-- 
Jerome

