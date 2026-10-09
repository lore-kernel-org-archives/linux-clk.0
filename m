Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA0509F11
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570597; cv=none; b=g6GcHdBiwvOt9kBGsmNERiQD2c8qAVqrHy7GT6lI5nsFjqffG53CqZtQMMvSc0+rwB6TiuSwSDBPxlHsz/r8IddVL1KN4IaHRjmBQMeVUhgf1qFcQzOQljtfs8uqdcE7/ids+pixXYQoAlLmK8n8yIOODRSTnkXJ/sugARr+2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570597; c=relaxed/simple;
	bh=I/1PyQTs9JiOymPOiuzFhvwhZ7XqmQsZMTD56HnUL+U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iOmXdLT7ddL4+ZfmvC/qyHGyDI+Rl3oddkRn/VolukCS+VydcO3uo8g4VZWllc6BLInCjfmV27qCZufisRX1a2id6ClPvYsQbhFch5mgV+waJ0ZIdXeN7QwpNWB4TiO7ObHCj5dhgo5Vp9GYqzO8ZJaiehwhVy2tbzbzaHgIRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fq+rJ0PU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fq+rJ0PU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso12763035e9.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570588; x=1792175388; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=fq+rJ0PUlWlOWB4iC0dwXZptaajulIkFu6QKtycdSqqlImipv3M8/wFuulbWaruG7A
         PU5fhjqIm7VfsuJVNXP4D88exrObvRvyuiu6dQIjR8uRJCyuw5sPOfjAL+e0rCJ4181H
         T6jy3+04ar7xE5YnW3NATjif5BaGRzwpEwEXvAo32JjTlwZY6eHY0YqS2XVbzDCQC6p4
         W1KaDwYw66fhpSUU7xvvgzraiQ+gO6rYTgOyROu0x54+ZYIAyRtxS2eGOttlJPe+mxE4
         chYr5ZRolaLR9tZHTnj775qztB4WiOQ8wDsu2g/XiIkd81PQjKENIps8yT4I2aqc5BAO
         /Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570588; x=1792175388;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=SeVOwlk1fwV0wna/H8ajXKriQqbXpFFwmU/SnuuDdzX+xlcJUIBfmPVRGqf74+QRCV
         mcO/51U7UI7ynno1UicN3iMGzyzWU8fH7XKHPecZcRjlfP7bmkqc/m8i8FYQT9sxnMF4
         5EfenXYiv3CV52P1H+DQdnnxiOhee1525QaIcmKR0lsaxdKBmwWeaK0dDgHT/B/gVBFp
         wsbHqdZONVge3n4ARTClBLsIGGw9jDiP5VG5cgUWsH4PSdR5O3vLfSDb/5iKrItL0X33
         c0xtBOchW0fvLg5QKzejfOaKoIlZmjxsi9YShesTkqbONGyM6XuEgZN4Hb5xx1+KtnpW
         tt1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjcQW+4glnVi16rlBQFSXeyvwsLA9ROumExDR4XHb1SG4OvnCzbeiMtO2eUpVpFS/zXErzRjTPkY8=@vger.kernel.org
X-Gm-Message-State: AFuF++kphlWGGZLd1grlq7vcOjb/4CrSsIgPMKxoYY3f+nD7mPz6Xb8n
	RC7+p2PeFWxdIJMFkyd2yCarvKHJLACc3r2jLWPk2oietmGTrX7h9V6P4qvcXuu5kZs=
X-Gm-Gg: AYBFou08icnAQFSMTtKjXsvwsCeWQdYJjWoeijZBnrO3IDwyIYKhS25ityxjNJtKNa3
	kdVZfACzjK1T1SFZv/BBczeeyjq7vFSb0nOUTWVy0Uh8H22c7rMGARB74JPjLjyofMxMMX7aFbK
	Al6TgZXhj4rvL7njTPkwb27Ovpu0pPCfVEtrIpzaGSau7T4JZNBHCd28Q22nzP5iT60BHjdRJs1
	0FM1HEyH6LZS7PytInu03YhxBjbw7KXpS74H/Mqt/ClEVOps/0AcG6WppbjbHFKxmM80kbAg12m
	4RTjS2k+rzJSqUjhEPGlbHhTFp3dWYMc/Ko5GD9OQGbr7CFIPhTthqIsjWOHS3i7jh5emJkkh22
	D13beaQRqWungwTywlzAb8YPLDwaH1Axw7owENrWoYwTHEDSgw6B9cTwhv36/+5FMiNNny1alLs
	AtuSR1n3i0bZqlBAENh5NyA9luoGYT3wSEEoCLqGX6Oksfn8/VjndQq1+kyRMAIWzht4I1OS904
	joV/YTWcZZR4fyWNw==
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr54978795e9.14.1791570588129;
        Fri, 09 Oct 2026 11:29:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm111362245e9.8.2026.10.09.11.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-10-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.2343186062671086748.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I/1PyQTs9JiOymPOiuzFhvwhZ7XqmQsZMTD56HnUL+U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaY+v5c248QzibkLb21kunR8D1/LituXzsQ2tD9P/
 iV/+gZPXEcpC4MYF4OsmCJLDXe1+DtJrS+zpuvchpnDygQyhIGLUwAm4m/M8N83YEvPuYu5lRa9
 ehNe/CzZ+37h77KfreL6/8P4p29eEnaHkeEn7y8J9Q2/r2i8u3L2os2d9b8eB5n3+86QuZjLJtM
 +fycfAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> +static const char * const clk_gpu_parents[] = {"pll_gpu", "clk_sys"};
> +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x28, 12, 0x1);
> +static const char * const clk_ve_parents[] = {"pll_vodma", "clk_sysh", "pll_ve1", "pll_ve2"};
> +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 0, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 3, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 6, 0x3);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc, "clk_sys", CLK_IS_CRITICAL, 0x50, 0, 1);

You are using the using the old global names but there does not seem
to be a good reason for this. Your driver is entirely static so the hw are known at compile time
and you can use them. Use .parent_hws or parent_data when appropriate. Not parent_names please.

-- 
Jerome

