Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FE406818
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736955; cv=none; b=AONLJQ7qZEkLnV+pIqMUbC5kbCN0AiNuNzfrfgrJYaiqqotxvPU5Iy2Vbo+FpT0JaNyFH7Juj8u7hGqsvxluKZh5zrFz1UEPL0ndovNgrJU34TWecxATXnLCUX80qghQfqdfYdcI5RpwRIuGhsR2gzu96X1WmZU2x1BKWjH3iZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736955; c=relaxed/simple;
	bh=VJAHuue9pm1FiRZUd8IJhSgHvJF2qQrN+3NPC5/4llk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnnoEUSrrHmc6mLQKJ69H4Yxw50OApD3BpVkLmGcJ82nopRiPCP8r8NcLLbijkNWVFrbxWr2JV5j1fdAkUibsqJRMthzdFBsQkvR4IksYKhDc/Fz2X6hTP6Lt9Kiks0Fd87XFMKf708osj2G4bK6zUZP6UgrBkwP8gNqoMV+Ypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A020oAqG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A020oAqG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46db1eb3100so338539f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736951; x=1783341751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=A020oAqGgegFwxEnN91E7KAUxzYTx9izH8BnPrlKj4CEXNMxHHRQ+lD1G30vflQBos
         HYQOMce+mO5YDeGXhoIvdNKI4GmJbjDlodOlYC1qVw2Fj1j/JzaFv8F4NilgqEkHELiG
         njfT27MHaE4oDE6MNhdz+GkJ21/Qj4WiWQpxxymKvE47rl5m95jcXOmly+v4eQBy1gQw
         qusMkApJUU3C45+m3vXNKXpYbv9mpegj/FvzxxcMREhDfkckbpT5AdyN6cb86f6Hr5rH
         BOu+bqFTMTEIjRZROfIDrr5v+uCKQmM3j3b0g04aqEPEGOs10EwLp2jJDtBH2RISVxwU
         cXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736951; x=1783341751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=ohVQc4JMX9LS2lVwobeHNmWu92AS/UZArR7jrP3QfCpLJmUlT/Yh0ybE2wW0GgHL2/
         +ZVp98tTbZkRBflOmE+Lat/vf7Jsz2PMMerMe/LoAMvT4BUVMADhnbt2ILrZshl/CvIb
         /TjHyTJ3M/TuE4G+wVDII/rteD1ZiOwiWAdlMhUn30Pdd7dYeZLzU1R3Q0d9XDWCBu1U
         qiTrUyHNou4215zNbf0vRBSnYfszdHvIl5iaqLdC5KEG5g7qu0II9nPsyeAgmMkHlnGJ
         E6aBoD5UmFl3i5tMSw4PM1k/9yCMj+sMZ+kVZ+ZXzhlIG3bjhlYn04xMlgjaHWS/tooz
         p+nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IEK1V1PDonRoQM6Y1eKfDiCHyszOkeALM7NE1EJm/SxGvos790M3WQZLTVBhDSYdAL9CsaEVmOmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxAyhyYXBJudzyyTJUzxuFeq4fVns7h3NrpD0N/eiLHwM7ucG
	Ys0Ldwm5m5XHz9SX/gO6Tb/1855i2/OgrSxiLsqsK3cOMsbsPRO7SBpXa1S/on7EY2VRvQ3TIPy
	8cGDb
X-Gm-Gg: AfdE7cl0nyW6qwfCs0l+O6QPt1QjRUy+hrJy/XuDQSeRNrd9pU1abWlP3rRu3n+pSNQ
	OwKy5C7wavJGPvr4yhHNipSswseh8RtEebPWflHV5/H9cwE1HemVpM9Go9tujjwkf12mvleLzoO
	MpaG959z9WWlGnALrsKiuQaJe1sqcgp2Wu3WbLaWCZKRWTnlWgbd8X0qarPiBzukeYgk9EtMS0m
	J/gBl7HdcgjAqXlYZ27F3SGuX3mUYFA7yPSEsjIE93p0qLX8ItgoR9BsXTVMt/+x4NM3wgtxqa/
	KXL62EjVvWUURbysZWcE98WlDR8RA95c3TkPCLTx8QknKIjGhOvPfJfBfyg17BJXMn8V0C/NzgS
	Op4fT6dmytddcUKzg8kYCMWAtnE9e454ItTARIinYdLbILrUcJlhLHrq8E78qjcXu39R76jTm
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr249806255e9.27.1782736950484;
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493adf3d98fsm80822085e9.8.2026.06.29.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:05 +0200
Subject: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VJAHuue9pm1FiRZUd8IJhSgHvJF2qQrN+3NPC5/4llk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgtW52pl9ymFcc6wjZ4sTtM/p/LNN9ZtDgRc
 WKlUartlpaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLQAKCRDm/A8cN/La
 hbtuD/9w9j2Osb71WII1hjlD5NY7YjH4OtroF8D36BpXiVm1yn4a+2So1WGl3c1Ng6kXeswAdqi
 Voc7emUXjLwvfHsTqWpaWdw7nYDMRwFYL0z8vQEVAPFqOWNOnqe2q84vAcN7lXe3H/0MR6Dipw4
 g0g0wS+fNOAkq47suPO8WtnqTcDxTCb1xQB5oXHSoioI2Wuy9HdnQDzKFd6UrvrHxq9CQAOtQJ7
 MMcdfmPkKBjxgCm7o0VOlJQfv4b1A66MTB+YyvJwwfzNM66Wl2iNYAK0UhaDFOakyIAMN4C1d2A
 /P1q/fSXLrE3bnpqILA0uwSphLEnN5RHT2zXBej3qW0ksFQDe+9aCDLB2Lw0Ylnu/nD+NGqZtIh
 XcMVHEJrtK/nEL+wBQwzZZ2ge+MajYiUNiki01R4uTA0degnUSWthT0cZX+Uf72BplztqN+YrzK
 ntskS7l4EhTj0lQ52MUTSv7tOptAZwGgpvuggGeUj1rSkh2OKdVAMNlCsOAC/ow6qrfq5sba6qY
 /70T8N708Ii+ljhUX8CDE49RJPF1KvZn1l1F3yMdmpEM5IZEVMcDEISSUcUNDBMz20QbEp49Ejq
 9xcudU3c6XaQn42dv4yVj9Ff1l3plINHqKVyShMj0fg+2j55Ft7u9mPtoRK3RLkDLruVp8Cl8Vx
 sJZ80FAnPrdMTiQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..197a6f67b180 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

