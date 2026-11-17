Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938543;
	b=l4Y37ieEEXnMcQsCrY/8T4EUeimFuC1OlMdAGIReXpP2zYJ3Drawh8VOeMJEnTjEIamL
	 zVWJtzejlCpmw7tM8lHrsmuvxVJopZlCMZGqurEBASiw5Iu0kwoUv1co9iX/nBx3vTWu3
	 i12anFrjDvnn8XCgtP2qO8XL3qPlJvgknxmSuL5nzqV2AXguWGmpoqyIopOCYtK0XrO8s
	 RyoYPr2C2ixUV+mXVDfWdmQ52WBeilLZ46bSVWSCXTTkPuAku9L55aLFjIAkBVz6ndr6u
	 3ZRjccPARnLQ4VB693NmaXI4GAjAesmycrqH0TxxlBh5Er5HQd/KWXqyIPuv9cmgHhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EI7IUMnYzAVr6PPOS/riJnQptaI+ME2COqQuh9tcDvE=;
	b=0lVs6dM/2igNXV6mknuDP8nK7BSJoY3jm0tyJu1QcMTrY+j3DD6TUtlGs7kseohnI8zm
	 sjjTAe52Rm9m2ldEEfY2Lp2LWe7B2+k19Ha7xgujU1+dul3SrENgTEaxGkDu+OqbXdunV
	 CCqaVTZpXPjclQXJzb6NV+SS9/kcXiOCOJ3x7j9XVC0Oa5o/pXeSiHdC1nBC/hALlu9xO
	 gFkCz0sOsdMAdDcdEgzZSk7bPfKK3Xk/zQnQGv7vlP5BsskzhI1+YinCAjiDQiGIoIcXG
	 CStczUoH7qAEZPDBdIcgYnbwrLNU9l/5A3g9lkFzFQUmOdSb5iOa89CeV3HfxDxNlnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ukR9f/UO";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E248606A31C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E248606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukR9f/UO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so1496915e9.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938542; x=1795543342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI7IUMnYzAVr6PPOS/riJnQptaI+ME2COqQuh9tcDvE=;
        b=ukR9f/UO7m5sFwzF7G30Q2MoEXDGeld61/4uRH3iwG5/Ny/2x5Z4D2yxqjUI8fuBGX
         NI4fPglFtWLQ/VtHPbe5V4aGU/LG41Mp3+9/fpkbLLiJhbM6vOdVzxTuhtHtPz2lgqnw
         IVqe28/2M9SNiBqvadxqWyfClJpNOyWq/443GTjyLD/Gv8YSv2mS6hlgs/MZXpg2z0J6
         oeae754UJf5+3biPpluvEcJA0iUcBXgHzppeWnsemECZxu4WN8EiLjFGdWZfeb+SWvxH
         w9oV2ChxCC9lDzrNIhyIsY7PfEJWr01Z8rP2ViNn6buQTCsGzJdqdvUyEM+EF8aKcbCZ
         XJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938542; x=1795543342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI7IUMnYzAVr6PPOS/riJnQptaI+ME2COqQuh9tcDvE=;
        b=QOLTEg6aJUvPHc9MPM4VBeoyLqSAgZwtKqZbolrOwO4iV1pW634vNiZSusUg4HES/L
         ckk+LmuXmXyd6xPkQcgp6oYt9scNoENzrBx6Xby8J1YMEtuJ+j4AFUDCW/czt6m+2Fz0
         q/p65b+0b7zWbJglsLZQwDD5wnPLOuDfguarvbS4Iz8w0tTlR/zDLnV4EMufuKmE+Ikc
         wqmVxomnkMAXnecpSlOFc4yLlCxqSp9rH8OY9wlcPNPxuDqZPCGPxgh/C4rEGUGg8n7i
         xJklPF4sdDz9SZllQwSRchSKqx0KbsTKhaTFjjPXJMyeFeZW0xE/4Y62OlZkySMcl/4i
         pINg==
X-Forwarded-Encrypted: i=1; AL+hErGUrsJ/aq8gGXbScB2vmXvXZp15cNAmVikzNLeJWwXa6GANE+eEyGuLLmx0TY9GJScMjnzGxbDuKR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZzWpGPVssl71SNCUhbjGXnqcgXZIzo1Yknlw8ZqMJ5fpdy11M
	0G//edSo7QmWF9iZnd0FSLQHRaLrqHmVSbJhDgy77Qthr5NkqZAYIPeY
X-Gm-Gg: AYBFou21vEEv5+rVCKGs1bgGI2nMg53xB5xZGu/7A1WBMTxwWz60hY+ccPnZjrYawCr
	hAt2id1QPPn1YMOCLL5ua89FGWHeUBZLUE5zuVfpaAb8yXsX7yp79RIscTdg/L5HIvEtAhgw9N+
	R9Cuw3jezqAQoXkSTt01V1xbH5RY0SzR9UGhE0/ku4fxOcIw6koYBdEbJRt2HwnMWCpcFx6Zb/x
	lprOpzhttRysbicoXK9N3UKR6KERcGY5jjsZ8zMHLjmDLt8BvLemaFeq0DT0lApp7gKDF/1Xk06
	jHwkGSIW/UjJecF6a0KRoS7SbQVQNE2qpPukIqIfN8Zr1j+aC77pholZW9yKbz01YoCCm39w9Mq
	k0V1pByFRbC2YDsL3ILeMIUhXR5tMd88PAXsiG3CsuzydMYCa5IeYT+uKnwWbQMpXSyj8eTogsI
	lA7eMM8Jiuzfz1G7GugE42Kos2OqizwfZI9iQPq5zELnrQZV3k+kGWo3QYxHpzN6iogHb0WATzr
	nPv/H1XK8eZqTPRZGu1ZK5ErIjdh8m8zfiCSvzvp6M66hG47skkO2eIgOB8wLDI8pQUKfhCt/C8
	AXFNPR8kwwyQFYQoOfc1QbMmNZdKz8SBdAeQK6BM61wS1j8duvwVN9KXEhVf7z2u2F3AP3yUweR
	nyWKktMXsCHf3YbHqhMEVF0VYHA9cl0TegA==
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr206714855e9.11.1794938541515;
        Tue, 17 Nov 2026 10:02:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm52567f8f.36.2026.11.17.10.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:02:18 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Tue, 17 Nov 2026 19:02:10 +0100
Message-ID: <20261117180213.88046-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v6:
- Rework to use div_table entirely
- Switch determine_rate to calculate best rate

Changes v5:
- Handle requesting 0 rate

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 395 +++++++++++++++++++++++++++++++++------
 1 file changed, 342 insertions(+), 53 deletions(-)

-- 
2.55.0

