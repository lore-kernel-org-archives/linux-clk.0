Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476229;
	b=Jg1SDmvZ//1YIUSixM+6PS3BpBB6czeDCDUodXj3H7AX4UJG5Y+Sf45mUtmp/wqqLi4K
	 /O51m1U0w3D8yA0FFIHB3dKrHSEbnkf1QHjrjo3W7kd2WorvRNvRGHH45HFodMk5gipcg
	 eW48QRXfUD59cDY8C9Kef4Vg1W+na6F7AecT/923JSSiAiOpr6Ox8EQN138hBpHWtr0YQ
	 2cCf6annOrix0WN/4jhmFCS7VEL5TQvZa1WkL7brMY8iIE49oBaC8iNQvgH9f4ULjULgz
	 37a7W11vojpbq4cAFZAs6wbeiR1SS5U2F+bDghrrzqwsdBp0+UZRi2n1tqqdxTUXo1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
	b=2ecyjzRMnupa7tZb0N8WMGUcWXHn3Hh/dJa7rY65EZLFM69nWH91rh7M5MuUXut5h0ON
	 R9u2UJjsnplYGNIhcAgoEpGskCV1wTTH/fCuB3kX+iKH7hTjjLvt6hX1aWjG/S5/niw1/
	 /o7JccHxxwxPai6B9Wj4DE5qXn88RZaV3k1r8NYQJWnsju08r7AKM6cxMLdhNem176n9W
	 gmN4jHdPNKr5qs/TZUxjo2ElUpJLEZXkfy+/EMenIczDjPsrrFF+BzzNOyXE9Wf3jduB8
	 sWNYf8S2ytLl1XJs2fInXm7Pdjgz+6h5V4Xs1d+p6gJKdvTPICP18wfVRpazrQ0RmJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFDpl0+N;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD0606A880
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FD0606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFDpl0+N
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so37286665e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476227; x=1795081027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
        b=UFDpl0+N5vzWNYV58Ztcil3f2Jd7ypdpRhJeG6e+ALPdPK8ME8T9r08+dT3nLMArxB
         6X/23rwTq+FAC5uAxVniHHe3my5snA8moGZoaORPNSz8WUuud1QHsw2X6OyMkote8cps
         YQ+JZG4jILvcyOHmbvX4JPedYmtxSKKjz4dPhT2SZDxq4tvSgrOzs8zFVF1siDzcJtYs
         lQEyIQan7I+ZN0iEnqcoQF/p0sGKuW4kwSKagvuw6Jiz5RQ3TKkb/YX+zyHT1pSWDvpb
         8oKXIc8vhH9c4R3IA6JA2hjavy4Slh7zR3L6MaDdvrGZjgzrODhaJW+gRVq5OJHKJLEU
         wB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476227; x=1795081027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Mqz6bKf4BoeWY/g45/HIBHowvNZkM1tIZeATMJns=;
        b=xM6WZl3XizjmW4V1dtn0v5ocbgsbJqwqWwZKe+6Ha0kj40NYf8pLyTm/j7i/GtZF4e
         yfccj//o0PaMFq3TSx91V7Rj6HdWoxPTDhtoyiOhDDt9FtpOTcW1G2T04xlxHi/MntvB
         0SQFALZCo0u1Ft3mKXxhPOjtQg2DgviW/vrONE+trYIsw1H9i0tDbCcGT2l160CuK4Q7
         1K9gG1HiCbPm5xLidF/Rx2vAk+3g0X77vk5YiODsGoMWc7T8Pkj+8VodFnY05hfeyIE8
         LXge1uRoxB+e4Fn3+d7Lxy7T+aAVvGxtqzct2jJwjY6E/MCyhmJezpMkQ/cRRxHsybxm
         kpYw==
X-Forwarded-Encrypted: i=1; AL+hErHNXdycP3ZKF2QWz0aRW+L5bAWjvZg5tWY4Au/L6GWpbiWyOhe5GLFfds1X//UlwzRrkxZLc1ts2gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85+LRu1Vn5kQ9QpvOsMdJpSdQnQkbgK2K6SLr43TIVDLtNFuIk
	3I/apu3/V0eLjw/6ViVJkO3x5VZt3YzfFxzcEfiwd2qesHi+4nIvJ8Ee82TCKG/KGgQ=
X-Gm-Gg: AYBFou39PcdZ/Fy9gCCOsTbJF13xiFITnxawuqA6FPfFpqlwyWdT0YN+JdBES8f6lf8
	ychERpZR/LBrd0W3W2Zv7cOM/1xOIqu5sVlO1NeO4iXLWe2DITG6vHuo2y7H+alFwp/7844Xpei
	673ZXCwtWro85Xqo0EfpFGy/ploth0ynHPXAxZKM5L1K3Ff/EvkLu6CjUizoranKEdWs4pfMVTU
	HJGdOc8ipKoE+UivZbbCuQnL2XKkt+pOmBE4su0BevKLTltOFjTlyn1kRabAm1t2lIGEHDYaAXa
	kiRW1/ns9tiEM3gOVjM2KjXd4OSrEw6GkoJhleE+tatBvnyAcxOyQfuvTN9Mwu8pOl+kVDqRsE5
	UUTAQ2e2aFqEoIT1wJjN2RaZOa/ml32irGBzSS2dKlruXGXN0tJwXW1duKjLp7zr8VP4aUdZVxl
	sEjqFGswpxZBr859lSHnV0PHt/hPlAFz+KgIM3rqdAnpWfajiz7W1FMYtZgcX25GRPLywvyTM0o
	qFRiXg/g+PJl7Ir+H0Qoexo311ZqRo+wopP8Uwr6AIlscTKt5SPnP3ID5sJunmhYmBCUO6sBmcD
	2cAbbOZn42zCLf94kTTcynevaYyf2uvdU8hbUFvyGOgeYKOrD1dL7vR2lO2DLItbLtCML0Ghm4/
	dhGLR/XzcZRLcTF4E6kjq5G1yAX+R/sXZmTy0hF4v/Fl6eA==
X-Received: by 2002:a05:600c:4513:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba0931d928mr83920415e9.3.1794476227449;
        Thu, 12 Nov 2026 01:37:07 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:07 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 12 Nov 2026 10:37:00 +0100
Subject: [PATCH v2 2/3] clk: divider: Fix round-closest for rates above the
 parent rate
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
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

When the requested rate is above the parent rate, _div_round_closest()
computes a down divider of 0 and divides the parent rate by it. Asking a
CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.

No divider goes above the parent rate, so the smallest one is the
closest. Return it before dividing.

Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when rounding to closest")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3f46f9ee451..ed60fa9b04fa 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -254,6 +254,11 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
+	/* No divider goes above the parent rate: the smallest one is the closest */
+	if (rate >= parent_rate)
+		return table && !(flags & CLK_DIVIDER_POWER_OF_TWO) ?
+		       _get_table_mindiv(table) : 1;
+
 	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 

-- 
2.56.0

