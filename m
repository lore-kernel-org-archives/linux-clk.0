Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7330275C
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132035; cv=none; b=aYdRNhX880pQQFAFoSpuqSm3t+8zpqetg6atZHkhguyxk1qakmBIJYpJnHd6Yo+HHQ5kFO+HRrX0agATHDeuVYEGv880zttHnbhMB/YFmhDNkMvHjVM/NP2MdP988b8668Vx0cuxVcYzoxYfs02iTkzkGT/K1cPFeub8vFQJSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132035; c=relaxed/simple;
	bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fywmo4n5DWsWdYWTqSbC95zvMShqXxmMzweKpmmcYI9jaM1J1VF12Pe8qd0unlXNSYHz5kMCs6Hm2UYWizqPKp1PtliovYKhEcqf+vsQAZiGl7FZpvnrKTi5vwCRgPZQp9bVsK1O3OmcaJgjf+VJic5DLMdm3QS9FoKW3g4e8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ngO3Vd07; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ngO3Vd07"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso1079509f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132030; x=1756736830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=ngO3Vd07p8YnksEQNB5GsYMzc6Zee0Pf8MKA34nWuum+2k0KpX+HzIqstkJI5bXSiQ
         lDhDwPxhKa0sn7Jkmd4i5ZRAxZm7Pot5bmSMdpH/3c5aczmXjyne7l7EdOTRCiO9acwC
         Wjn+PnsjeNs1y46GF1qV/vwsdplUFPT4aVoL3T+O1sHTTCPtWVZQbfFgsNumbcIqXMR3
         xPUCF04ZWIbs1gInBniC6ivGskZYb/qoviiGUf/j9rh/RNFRPZVFNPgOibu2+Qcce+nu
         yyJ7Cc7nJ2bsAT46+eHA/nuFu6gnocqfff0jF5+nkzFv3xeLwLLQMKZFDLAtKwkgzP2W
         J6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132030; x=1756736830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=txVg28E/JR0PVmxx/NLw67rBDnOmnl3CWLXY8go/NfViaDSgXqOMrmD9qG97QsXsxK
         I+2zNp1+1xCRIET+MVdbXKoBTOo4io1IaUr/DWNYOenawPvqhNGncRB7gj20cqL+mwE9
         FJr6rED0odmcAW+5LAdK8rzBk8AJfC6sEZWpehaAO3abnyd096dK+mg1NF7WQ9LMBL6i
         sUO9Prx2dEsq3d5x8VtMXZPcZ+kv71HCYBwO71avwXP2AKcOsoywB2Y7AVGP8XNHXjpX
         bVw55MG7LIsEGYn2dVPoEvumTgdY+GGxAQkWWJi9+PKCf7MMj7UCtWFC4Avv7pKk4m/c
         chOg==
X-Forwarded-Encrypted: i=1; AJvYcCWYdwa/4mpjf7RNdvgxsGzC/4gKoPs7YMmN6gfScXHSlYv3sPkWR+tkHjSkvo4P1qwx2nd5JvrW80I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlVF6+6Xb+wyaN7RiUddLI+Go9x5Pq4I/YPZ0iHa+Yje+i8wW
	y6447xSze95JWYBuAMjegYoWbYQriIWSqGBWVPdVj0UQzP+i3PtwHR1in4M8+2eq8Bg=
X-Gm-Gg: ASbGncsp5Vzefj6y/G7m8jc4t8pksKFdfUoTK2tXMeTqhvXkWoXu17vVoGnzijS0wMS
	VgCTOgvBg3SbGxk3HVt6sLbCiGl2y5zMnsRXQZMRNfIdOBbPOCITC+MINwnG36SxVDvQYKeQkGr
	S2i/py63AUCEV05k8fAq+pi9Zk1KPx+xHEN20SPP59ZFE6xXczcIh4Q4vL1t2GGhGBi2ThKm6Lo
	e8R+iCbpxSeawbrEvz+/UXdYN0HlW/nnv7hL3pXZgKEZGh1XWO+T/cTBlxfTVJDmCDvh7QzVMvb
	sGJXtjVPZeh80b61uIurrY3aDfOJHr3p9B8rzuDd0X7E+eEjTHqTJK0SaZerpScE82fs5g84Nhq
	86ocUIw+zH8cnNRmdwWGwNLj1HYHiVIKBQopMZp8wto5WXF0=
X-Google-Smtp-Source: AGHT+IFiPKoRqUt+ns9QGMzAHG5ADHsWD9oCSqbjBX7AALemd/YQHEFsuSaB7N7pDSlpI8XFCAMjJA==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id ffacd0b85a97d-3c5db2dcc73mr10078522f8f.28.1756132030376;
        Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:31 +0200
Subject: [PATCH v2 06/12] clk: amlogic: drop CLK_SET_RATE_PARENT from
 peripheral clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-meson-clk-cleanup-24-v2-6-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKzmtWoqm6bakWO4aKPSmFt40T0qw2eFXNA3
 VSI6WqYcXuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyswAKCRDm/A8cN/La
 hdhKD/kBP+rn+onWFFONaftlxYdK3A/70krVdI9E8Ed4u2qVKwNTK8gYdu+FC++MQR3SyZUdB61
 jq56+0ekWz28V2fZ8FVwaH74fz4eoXQ3Zgme4vQUXSMw25zClzqCEdekFweiMZAkJjXhsrfC0so
 5SrtlSz7jU/EIIW9TTll7tly7/cVkiWdoPF0tBj6y2Y3GOy9+sYhx/CWCQUYvcNvbqIMKQ+oUn0
 NajUZsntJ4TkzY0REthSO/alUHbltx9JzK9mC7O/H9d4fdMm7RDm6YKq+qywCwU5N0uDwmUUmz9
 /dERanMgbXxJF+H/DFcgYrxYpl6oXoXVmb+mbHbXswsikTfoFRjpbj3InOl356uuRYqhhm4nDUo
 I9yJfXxWJkKpUNlYi72srABYcdjCC7RCouxjKNBDnZkDeEABMrx+n8V18+qAgStQlbGEc5HNVxf
 7EjAm+DfazEypaXlfLNuTFr5bXJOBgBDcRxFMXNn3CY709MnOhv+sQF2YECpppMZ5s8rBDu7oQC
 uN499gfY9WIKPtzkgmoIYCjaEVgizqzKNXpAgY4bFv9Plyo1rx8yS01hbj8tO7V6VpCF0SOKZWA
 uGG661IS0XryE9SfHYJJo2nwiOOP8qoNRti+7sL9KCjjkpfqr8GD57B7fvW4nQJAhcy1p9ZMT4F
 nmTT04JV8y9D3dw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Amlogic SoCs, the rate of a peripheral clock should not be changed,
let alone the rate of the parent PLL.

These clocks are meant to be used as provided by the parent PLL. Changing
the rate would be dangerous and would likely break a lot of devices running
from the same PLL.

Don't propagate any rate change request that may come from these clocks and
drop the corresponding flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 0c228a6723bb2bddc0b9a4f92515f05850a5613a..3e1fb7efe6da1f5d8e55993541d12d40464a47f5 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -38,7 +38,7 @@ struct clk_regmap _name = {						\
 		.ops = _ops,						\
 		.parent_hws = (const struct clk_hw *[]) { _pname },	\
 		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
 }
 

-- 
2.47.2

