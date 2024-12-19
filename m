Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E372236F6;
	Thu, 19 Dec 2024 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610770; cv=none; b=iomMACFQ1D1fyZaY4RZ6hJofitIbnqsVPV7CVdAynbS/kSJHrgywVjEQN/+s6bIwAUBEfOBjALXscJLNHQim761D879nqJ4voN5j1rCF6E0CQYSkjaO51BY+KtAteSf+WzczBlWVN0k1qVf/tZ8NMHs/AI50MFxPSPEocbEzdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610770; c=relaxed/simple;
	bh=5FOhHDTycJeOHcrOGSiW2NuPDXrXCnxwGdV08mP0t2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRsVDEZIA8ediaYasEgbUZ2v6B7cAPgvtPd2E4cxkYuKiqVO19012/W+Z8PBxYA1s00e2fOdphgShDUfppScH35GXHpyZue4HwG83KxnIbX5RZvCAgd9WCfoPFWHbsMAMRQMJtgI+tOuyBS1OCngkoZnbEfJVndpEOfJ0uzStdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiS9N1wj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiS9N1wj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so8188785e9.0;
        Thu, 19 Dec 2024 04:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734610767; x=1735215567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YuWTrg3kRcWanGUN+vK+mrPdpRKOMw4jVkl0/pfRUA=;
        b=DiS9N1wjPM9dnLQ9ZzQzTh5vWrVkJpMcMnJ+MHD1yKTR+gUUh0LaA0u+30xAp+hPhI
         edr8MNpzopfhMfo2Dx+r8Xw1h9OQpOQJJEIDi6AHatfAnNdsM0kJ4KNUTRravWKsvObh
         vu0oH84TRlfb0vkg4IBy2idhGjZKk2n5rrtLo2nJwZDi8s+nOL5ihjs2JgLpYm3YCZK6
         rvSl9Yp9XRgBTQq1bK+yxhKFnH/wJuf7yXUX6A/twcdzih6AawHjzmVDMkpg+kdkNwle
         nYnBY+MsI5Pjq+b1+Dur9LD+IXgjgMqwKUn44VQ3+zFiQw4utfxs+2dlN/AJrloDWobd
         RzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610767; x=1735215567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YuWTrg3kRcWanGUN+vK+mrPdpRKOMw4jVkl0/pfRUA=;
        b=akOQyLTw17wFc0sW9lT+QEnpdViDvUMgJGFCircYWzMP8ACUqi3pWdu/9kprSq/3Tk
         Jbi5TFK+E0xFhITzXdorla6mw6JLAHmypSZBLS1UDLc1Zr1xg+ERNTYmHh+MZp4pdVLY
         PdAvx8E/o7pP4fvatHI6qh1BeE1XGXK+XgaTAW0kDimAFoBs07rB+DEi3vLlZcB85tIV
         8Uma2yjQ2pRQfuuoXqSXKWUI4MYSycvSGAEPro5IE18rfIe2N2x/s9hM0HJzUFhN+KcB
         Y2ctXXtgiIo/rg76wPcsqDf2MYkCuAtabXB5jzAokdoY/twvs57sglHKFxbVV6f6VTCz
         VEmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Vx6W50Zp3pzHYepbXU4E9jQISVTnon17F8qd121z0ks6f8V7uZp42hkCCy3AdHYAYem3KivveLtK@vger.kernel.org, AJvYcCVGoU7rhXc2lkzgWO01LbII4L1ORgaaTJFpiOaarqX0WE8XJlAqZwGskwJq99GLfM8843Rh8tIQR1Dh@vger.kernel.org, AJvYcCVW/pcK0Kv96fqJgaLeNdlyWeCbwJOsD10aYeriZzAHb8ZsBdpcrfh2H/HimsM7D2LLNwM/cZVGd+bXSq55@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1H8xbmTzt0/zxbW+MuFEH0kZq5ZgW77HhoMilflAN5Ei/FUkz
	+Stv9vww4bO3ZH01J/FHltZIus0pOnc4aLRoegiC/05jBwQ03Em/
X-Gm-Gg: ASbGncvZFLX+VV/Den2t2O4csrLomW4QmfEOppRKsX3ifzOxkwY4az9W6pSn0q9fYpd
	CRfLt5+fqHgp6ZbaRlLYNiOoxgeGXsk6MaQn30l6DJ/UvEti76tw/YpZbYIZG/rlBC9BSKaFlvZ
	Cn/aa6lHTVg56AOpM+KJToXYoI/ppOoX0vnNYZrFxjyS1JL1xpRctkcvvmbHms12/M3hoI5XHEH
	fRifEUQVCoykrZSsiDMKAqWjXSQQTosR6K6F92Ev2G5Hh3d2KYL/phmiL9PF8o54jEO4hhsBanG
	WfNz1lqIFNoQB/80xKuOQVn0+GaBOSvDlAx/z3nP6R0=
X-Google-Smtp-Source: AGHT+IFk/6+yaQ3vOoPTtFUROu8ohClKxvwGEOPmV6Vrn0UaLNXdJWJrQaOUJVnBilMxaes9oEo6uA==
X-Received: by 2002:a05:600c:1d15:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-4365534133cmr62150205e9.4.1734610767002;
        Thu, 19 Dec 2024 04:19:27 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc762sm16679975e9.11.2024.12.19.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:19:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
Date: Thu, 19 Dec 2024 13:18:51 +0100
Message-ID: <20241219121902.16339-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219121902.16339-1-ansuelsmth@gmail.com>
References: <20241219121902.16339-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
should not be placed here. Value is derived internally in the user
driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v3:
- Add this patch

 include/dt-bindings/clock/en7523-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index c4f8a161b981..edfa64045f52 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,6 +14,4 @@
 
 #define EN7581_CLK_EMMC		8
 
-#define EN7523_NUM_CLOCKS	8
-
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

