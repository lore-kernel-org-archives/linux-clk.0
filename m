Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49A61CF28B
	for <linux-clk@vger.kernel.org>; Sun,  5 Jan 2025 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100942; cv=none; b=eafCqGO54fqMTxeHfHglFbACWwDNp5jSS3koGGfT0kP1tjExWHd7RdAeUZT55BI6ylFSevUx9BanHVmBGjSa2G74iXonzQ2gPkETw3YmnxqjqB/CPi8yWDQlpFjFwkKYy1L6NJSX7MQaZ8DkWvYg0YoPGBvEsnP1V6J96n670cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100942; c=relaxed/simple;
	bh=Se3lRcHtGRPWwwaNRlFMfAK7boLIp7LH1AcyeBrpWOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjJs6k/qOkYMtqi6vZC+1QPgL9bgGR/RBi1wYjbbmLTGnWw9SQwc47wnrXUTtTWG9ckn938T/ZyH8M3UJVeSY57plE0JcGpdlvLgiC9pBg4rUfU+XzdRLNmmYZQNzf6Ikg+lwaMI3C+VO0urCDfVGJoDwpQ+CVB6qkA7JXAnrdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cWfZ/uFe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cWfZ/uFe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so22370985a12.0
        for <linux-clk@vger.kernel.org>; Sun, 05 Jan 2025 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100937; x=1736705737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
        b=cWfZ/uFeICDU2d/sXMHN/dNDs4/eXGx2egMZd1fG5K/l6XltE00PAsu0VN88OiToPH
         OKWpiDJdqF6/ZHSXggVPq6zuz6SMMR4cGUrN/aCJPirXi6puvS+wDlC+pMWjDWuQtwF+
         dM82cDZRvuR433yBveP8tzU1HOfrUD95LkKhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100937; x=1736705737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
        b=rwLbI28ZW/mxu0yBiJkO5w+PC5WZAlXVHbYMHN21OzaquOhiDRjS7vT+1/w+5veVkc
         uUNGKkXuyBiVBZN9lkEVdJ8MF6hy6E71zmEbnZJ2syv+0SSnjz2Q4w3poroWrtAa/R0L
         mNiqVjTG0PyfgqDHKOCofK3F5te3l52ee2xMRnxUX5OY5RW+1wwP2vQFiHxADb48PwC7
         lr9ryf2N5u9LQVmMdNVDOtZakWqXjFoOma92EmJXqMeHVcC+fhK4a02eJRPVTBawt5jb
         FITCAO1nIr8F0CPw04KgtQjm2udIDoM7h9Aj2nUgxQmBotC49yqGVJayQuAKdt57uDqp
         z/9w==
X-Forwarded-Encrypted: i=1; AJvYcCXgh4ErnY2ZPnUAEmzpPWiX0nLWUQWNdGC5fL0P0IpNseh+bFHiNFS3zmoK2XTTuxAY/4eAKL2z/Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxdlXec6n4HqJYEqR1i7N2SfNJ0b0Vp89iR9C1fCs1cflS7bH
	aJ4+W3LMINku3Xzs/FQe8gzR+bCV3ZrGS/rgxfGFn489b1CH8cNeBh7U1Q2ogKA=
X-Gm-Gg: ASbGnct6iOoVxOcfMvxNt6XShW5q2tgeA4sZBtPX56biyxBFH7cIm6wiWKQhpKzIpuI
	30hn7Mxk5MkCiSMGORKf0cTEnPkQk3fr9SULSOAJD0b0bI9v1C2yhp5ORX1qT9vB8TuqLAOHy9e
	XxuXNXwYF6AftR72jt0G8PvRk6oMbOr5jK0RFZpkGsvzBkg9rzGIhLFsjDUKNvfVQ9wHaP8Gv3/
	TFomU7rpN9SHn3Dvc38RV+3q7xNCNC6ZcTrcELuPYzgWTT8aeN7yke3eHDcuTvarsDuhmF1kk6N
	zFIqQUdKRPgvNaKoxfmR2dVm8bVURZsGoE96EvT+PgAJpTgvlOIP4Oj1DDDbcB0wls+uhKL7kZu
	ovjyiusyf3O0djCu+Hg==
X-Google-Smtp-Source: AGHT+IHxEDK9nG2Mi+Pm0wOh++nf130PTCB6/hhMGClugIlI0HI6FjgJGvhFReNL/vJEU6H89u69cA==
X-Received: by 2002:a05:6402:4305:b0:5d0:e014:dee2 with SMTP id 4fb4d7f45d1cf-5d81de160f9mr56356151a12.27.1736100937450;
        Sun, 05 Jan 2025 10:15:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/6] dt-bindings: clock: stm32fx: update reference due to rename
Date: Sun,  5 Jan 2025 19:14:15 +0100
Message-ID: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
let's fix it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32fx-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index e5dad050d518..b6ff9c68cb3f 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -10,7 +10,7 @@
  * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
-- 
2.43.0

