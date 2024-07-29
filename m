Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA815DBA3
	for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722272626; cv=none; b=JzrOolmDc8fdoz4qyoB3HzBVC2srEm1sJUdgGymZysANLyPVVvnPzioTSxxovhHDrhqjoUIPzxqafrGSlm+JzAHoIP4fZcnPOiXwVUcN1AaYGFbrmAJIdL76QKcXRaVuXegPZWOsJ0z3c+ZhrnwKwzqinjiPb6HA1aVg5YZ92tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722272626; c=relaxed/simple;
	bh=9DITD1sQ0c/mffmy0n+p+R7L3gsOgO/klKURj2MHIRY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iRayiwLqWjE9g3vEtdkeROfSv80hhgW+ZRyjBss+J2JbsYWoJCZNSG0vPIXoMoC0ZgQg3ZevTZ9GWYHNlgSmvu6NQlXlqt+IolFbcj4igWGtAUnylybHXkm1n+M0yEje/fwSfN0m9UkroMgzBPX4dvlIUJg/iwLqpj0KeeV5DCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=do2ZnoLZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="do2ZnoLZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-368440b073bso1324056f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722272623; x=1722877423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4QMJ2vu32awVFR08ex54N/5/opw4a1ucxK32751hSU=;
        b=do2ZnoLZwmJWdlwQoKT41ukemzPDQdWpb9Q1sD+QfAKgh/u/nH8UhzTQ0A5MQg4sNy
         yskuQ1VirCeYlS5b/pTjwyp45V8E01ZRQ7zVfrrF/jxp6J/eDc9+gqV8ejGRPr+ow+yw
         WRjAq7tVHdujs6elRPvMD2UDEmZDfOyAlX21Z2ylqNpMed4oLwEN7Fb4nJmnttaT+/uS
         NkDZoQ2HrAA7o56r1NMUFvtO/YPadV+onCoJBHuQioQyvjIIu2SZKLN9tKc/dzqVgMI9
         o5wqErXxPPpgILCGyQ2IBrWN0NToX7G5wt8Hdhlq3PCMK/pWirsJ4zjsKXjY0SbJzbGN
         x+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272623; x=1722877423;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4QMJ2vu32awVFR08ex54N/5/opw4a1ucxK32751hSU=;
        b=F339Kv06VW4gS2nhePAHeBylKyroKqh2mdA9roI0nD3EdDZuVrRZnye1hToniENoWO
         5O+9S2VvpHhcNM8rKvyurYFJn3K4pfTJLEu6npno49G20LhigTWj1joUXx46PWIj5Xn0
         KMlizcJCI/pnQBZHvglZhOqLwUbcWq6SVbPgpRrVqH4VSOyMZS516fEvjzhfbpuk8Jqv
         R5dnJuJ9ODh/ag4OMYs9zyM+rSAGruTaBdOY+8Ff/PoF9AzEMQ8PwNfDIWKuCv9rno1p
         UC7jSZPnFnkDvG1wHmR9jXL6g7Hj1pG4bRR0Wo+uQkU4ZEdZWl2vJBfn8z6cMsNlWOk2
         9uRw==
X-Forwarded-Encrypted: i=1; AJvYcCVz48ob6pI7Szujp7rITj6gFKSPTQQy0iVADJbnU5bgQf1nEXXBFt4TLOXBJlsIWUE+vav528qt+2GG57XCvK679xp8I3qXY0JN
X-Gm-Message-State: AOJu0YwQ7OPbBNerxwpa1f/5QlvdtpSNuuCiW1VeZ/dkcG9Sb9FEF7wJ
	RCjGYzAsDAOdhB5AA3Te5Lhy0NA484lXZy6kuUyjod9hYLGv1wGYGPQzLQbuGhZWn4LOvOxxlbW
	lQrg=
X-Google-Smtp-Source: AGHT+IFDDBwmSOgvzrJlt7lNEcKvYu9x6l09Cch+NOr9qiXQtZC+LH7RjBJs+0BzIHEp5aK7b/y8YA==
X-Received: by 2002:a5d:5710:0:b0:36b:33eb:f0d6 with SMTP id ffacd0b85a97d-36b5d7beea6mr6206706f8f.2.1722272623164;
        Mon, 29 Jul 2024 10:03:43 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36b367c0668sm12712416f8f.10.2024.07.29.10.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:03:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20240719094228.3985595-1-jbrunet@baylibre.com>
References: <20240719094228.3985595-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: introduce symbol namespace for amlogic
 clocks
Message-Id: <172227262256.349016.9112945226896279160.b4-ty@baylibre.com>
Date: Mon, 29 Jul 2024 19:03:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson: introduce symbol namespace for amlogic clocks
      https://github.com/BayLibre/clk-meson/commit/adac147c6a32

Best regards,
--
Jerome

