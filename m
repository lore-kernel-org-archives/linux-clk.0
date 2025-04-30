Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE17523BD0E
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009185; cv=none; b=hL0oMUjZPGi4f2cSfWR4f9Sdz8auIq7zMenPoAu9k8E/pf8wzLEv2SJ9Ut5emSOy0t68bL8d16WywCDyP4rCTVDnI8bQ9ovYrtRi96WC+6aehFUouIdzLxJz3eCAoxUCG0E1l60nCrnAes6iDnoegMbKHUGiDQtGEJbJ09tGyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009185; c=relaxed/simple;
	bh=VF5hE6k/MDcqLuREIWpFmNpYxebRlFOo17tVqVOfzy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOFzTULOYc5vD46x/aYelbbjc3+BBOMmT5dUYEeTjfYxUeP7SZO3tscd7oggkHNiX2oKtBNDvKwwA6AaK2AUl0rR0KmscAE6w3d5vdAdSCUMRmnB1YecQozU+XSglwGOt0Y1ZpwORyH7U+ne249ck3OCZO/uLwYNazgj+V1+h3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MmoMXDQp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MmoMXDQp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1414062466b.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009182; x=1746613982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=MmoMXDQpSkwPOL1N3wM5PlpsTXW1hbo6pivRv85iro2MISs7YSPBZnNDrh8B5z/+dS
         ZEW5KB2ecmF6RlXa8qdhJup7dfwZT+OA7PhnEaieQ84nmcCux7bC88CF9m/ChaY/d+IY
         wNoHrsNgpdnStGgWXKKS9mRRWWR1aN6lEH8AMCpyUJJbChfkefqF8ESYkuKbkmh3qoKQ
         Ax3Ob8NTg+ELSoAxDd+cviyQcMup8UowetRfAMIfTbEjFAQKthUOwystrtGVNUYKnId8
         z2DVGvOnYK7Cq/y0fEGwUFZzJl2LzVfUefE8sq7QnMFCR10Upz0iWp14YRoodxND88A8
         crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009182; x=1746613982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=bKh/Kefk/34g1bY3k7FKR5fg7j21GI7HFMktCiOsYM9Lgwr30kRV8itDQkA6MgGss0
         ly4jcGdA0WqQQjY15cv9Pe0zcZHmFsGBfjL3W374g3leNLBUlc1+0Y63UOvLK7CdTSSB
         0rZZ/21IVQAaceF7h5L5xbm9wQTCfhExJcVoYHtLM2Lscp1DVXCyV+OXOfOPa5wSIpRS
         nMD5tdWMYKJtug2TkceiLq3UQ9hGmqqFO/eI1hx63l1PfdeXjFjQ7opEbuQZMuHf1Bqq
         hbsNisgEwHBAN944SlPi9aHP/u+67vIhNnrbHYqIifdHDIip2LNnyrK6LM/brL6qZ0QT
         3Nsw==
X-Forwarded-Encrypted: i=1; AJvYcCWJC4dv7+ufPngrelLbOM/X3HLm3qjGt6e/Gvq+fhyrs8NyTQG75qPq1kLuwUNihXVPF8bn57rCgVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4sdGZAsGKj0mnAzr3RwCBE4jBgpr79r+1IbPfCbffhVwiE9zR
	6+Y+lpv1y/QfIbhWF5ZqkQSySTXP3XpEcbrMSZ68HsNwocnpYpKsUEtVd8xGmLM=
X-Gm-Gg: ASbGncvsIhFhmkzgSWzAJnmn12QQDkkmDhzq54ZJgNkhuEgDYLjLf0c/3095RCnK6T2
	PW4fR08VLbBTE7Dq9bXDjohAkkCPm4hLAqYkhj8pMhLQSVeDEKPJoXS5JFHCZhmLrR7R9dlcjj1
	+8RKJICB09IROm2U9+HK1ShYqGh5mivaoqJGxEcoXBOO9q1jCZNY2I7SOh07Pl/c1FdF++s9Gxi
	ormnJqt22OzhLswUmYRYIkl6xJbakV/NJtvlVwC8vDyWXMttAkw8J1/jNOGvNn6FpeqO2qZICFh
	4vwHR3wpmgo69Z2IzFO4TKq9Tr0WxIEl/+8f6T83RVhOAJI0R6zzhwpdHtpGP02HJAv5sVk=
X-Google-Smtp-Source: AGHT+IH2N+37bdEAp6umDXJ/Tn+PS9iQBAS/tLfvtmUbmUfhbibyBqoqYkGkCT5w9FYdpi9e+fyJqg==
X-Received: by 2002:a17:906:c10d:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acee1f240cfmr179989866b.0.1746009166269;
        Wed, 30 Apr 2025 03:32:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Date: Wed, 30 Apr 2025 13:32:29 +0300
Message-ID: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add max register offset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

This patch depends on https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/


 drivers/soc/renesas/r9a08g045-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..2eea95531290 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -20,4 +20,5 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.max_register_offset = 0xe28,
 };
-- 
2.43.0

