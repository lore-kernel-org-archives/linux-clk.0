Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81141D4E6
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330369; cv=none; b=IsVDMqoY6+SwS+C7zOO9OlSJBvumH0gfkjvkNdvQlJzkClg9WTQbPntQ64uGy754bfeeBDCP8QPTe1xQwqtfBaIXp6qfx5htSEdWmW8NDcDc8uA/tG7W+AntU3sHVq68bNJhourJc17xJX1Wkh1QXrgd9hxIM9/tE/uMWhuNY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330369; c=relaxed/simple;
	bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieViOx7SKh9fyAwKEFPNbjMvPt9xQF9Io57MCaqdAgkUWWITeFaTKpUWP2TzjQ2HaGUqE0AvrfUW0kFSu+CmK4uJ4WSL491dGvOlyW7l27koByi9XHDhwfnX1DYK1LgyG39ZvV8RV79olHnL3y4+SlzuDDeHGUbVTvK94piuBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=etYY2VEh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="etYY2VEh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c00f74baso16899825e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330361; x=1783935161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=etYY2VEhxV0DUuy4HJmkTbcG48wwQKwpPDHdQM72HvfDsN/Tah5uU/0Wh1FB+J599t
         zr+Nb5v5GgRD/CrZaXRWS6mFfCLRC8Ax2qG95n0dDewg/VRDv6HYaDNUHC8QST6TCkIY
         VIowNpgsPzpSrsW6VNskMrUU1Do02DDH0ESH0scHtv4yCPmO6MaiNtgWmbB5QvTSv2Iw
         +MxIY+nUT0FcfIYw9ZY5Qkq6SSiIQmCQi6xbZm2CvjGnFCSviicAgUPonCI0BjDccJ8T
         2nof1/YocOZ25zHV7Tqi367snYX7+16gN+WtWVcX6T8YgsPuG3NwhGwBLhWePqBBm51D
         LzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330361; x=1783935161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=U/f5Yalcdv/MDDfqTsU91nvEf7yUL6iNDmOAU5L8uAlY+Cc3QHt01mkgb6cM4bv55U
         dwItaiqFAyV1rjl5255oRGLZmwY5D39mR2qJTolTykmpOn63BzNBLXF/U2Mh1jD4i1UH
         P/HNQZUpGfda84BESjHrlnMGHMvOI0niOo+SMURnF1Yxbg3xppxRqK8Pynf3j2BKnTDI
         LuNQjj80eozbnHYvav4j+5Tc8+5wxhFwWESvMiWBklWKS8jh5ipIvFKQQyPBe/a4ecz6
         lrooaObJMSyTn5332/H3Tqzl8Py1tHD21iwxT0DFeCgvXeFqWdvK41r2nFGO/M+K4D+u
         Vkdg==
X-Forwarded-Encrypted: i=1; AHgh+Rri4iICtiXObtSXLNUgy2rLRzsrG9wK2NVPZmmsV2ipSfK+MSJuxZtIrFlgSF2zmDmvA87VYH4gIWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Vn5ka8JLBONj0sYaaV8gQ4Y2SfVnHjqHBCmTHg197SLqsYY4
	wGjA8ZHqwIEX52hj20mf1eB/+5pB/TwHgExvt39KmTdn4+ao2c4sLFaZvC0HUDbbahk=
X-Gm-Gg: AfdE7cmmYUL4g4UN5DYzuguGk97AOvbg/Tw4W348hEXH4+XwcLsYiIp/qiYuZeDbc8J
	Yr+X19+7MjqSg+kBrO/3WVpwI28XdNorYPEcOVT/uItR/jJh73rHKyR31gMk97r1z18TbfrlGJR
	DGrsPQLXMDHqmbsuTY8O+EoVk0srFe/L/GBnzL90s8RUTJZ1DxevT0x6c7dnLK4BSn8tRvOhnMi
	GUZKzG2wyocRMg5lRjTrchGTCp/8FxWx4oAqKY+SiKzkwYWaSvmXrhq3/6VIs3vXasv4Bvpcfvw
	ga5ONqOeZdAQrMWrRpt1RjybAi+ns6zxf+wsgjhhDpXIU/MH1AsJbgW5TJuwNOdUHgNKFzlMu3V
	Wv+6JSGyppUjwPCnJHkS1PmxALPU53TwSnw8V400qtvIgpm3J9YPB/ce7IlgxQ9K/kIV/TvL8ku
	++BRj/BLLjQno=
X-Received: by 2002:a05:600c:154b:b0:493:b6c2:cd96 with SMTP id 5b1f17b1804b1-493d11d9d42mr108969265e9.12.1783330361468;
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm313598145e9.1.2026.07.06.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:15 +0200
Subject: [PATCH v4 7/9] clk: sunxi-ng: mux: remove unneeded export
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmfyJmVNfRc9dDNX3FlRKXkCm2eEX+2FSO9
 mfy8XRdF/mJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hdH3EACDjsiUBV1SbTRjs1G5s78KTZ7oS6GSWyf2BTTtMn2V+5Nd2ocIN7/1OTU7qHO4E9aL3rN
 IMb4bcM6XqK+z8uxaQbFr0DrRbOlRiKi/XmUhyDUiIWESP6KvjBz4nHc3tmADEMTfUurLk4i8ZC
 jJI5yXP5XGOJnxN5gv6H/ys6bWkTwHvLwjtiQ2pt7JhjX9iygJIpSePXEJnUIU+Pqb+NX3VRZ+P
 DIbcyijahmDuqlXmLX9kEGF1ERLFAgkKu/NZxY2mlpYaii62SDIeSyTU08c6lU6dNgBjkQrxDSd
 lIaWjbHZ/aodMn8hJ3rR4fQQsQxH4qHroEo3j04r1zV1EblJSAzxUEZoszz6lVI1Fr7uwVWgauq
 mOvMReWiwP9yClUSeooOR7ImTXwXBAQomS3AymvWdRLuVg8E54+rxShJLJO4bU2mcX8JQbb3sZG
 fNMmPCK3wUYK5T//1e/Zz+UBYDuzWKPCkp+IHcyKZ6S01hoSp0BKHyPEpZUenx7vvXGe1NiKvEH
 Gm5iLLR+PbCJYa5t/+jroacHVeaXyBlh0jZEeg/6BhNaxisiSOcBgH/JV9VR3ZX1jeQxjmDb6JV
 0OOwgs/kUxvIwbg7N2dx8FjWocPUJJKqJGP8lCym5w6a9r/kNPszSOSMaUvhWJQaw0NrtpJhxQc
 kUIvmMxZfVwXFxA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The export ccu_mux_helper_apply_prediv() symbol is actually not
necessary. No module other than sunxi-ccu would use it at the moment
so just remove the export.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 775d396ccf31..1a441745e796 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -66,7 +66,6 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 {
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
 unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,

-- 
2.47.3

