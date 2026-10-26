Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016573;
	b=Qw3YK9N8qtIck+pXhwLRWYe26yIizwbmdUO4Vn33ow5f4qKMnMy9a2HxzA9ELxYxbZ/e
	 Hv8hYdCucr0X6N7ZgChPq0dBo6o0rP8DKAFgrhOjOENiYUjdLf5dZ5PQA61HW0xmhXtZ5
	 tQPsJ3EAdsuxTYbPCWOgP5nWt0BblaUw+R5cZ3JUT0m0BjTeaYS6udp3XnBdifJt+lPg7
	 3K6mcBmN91j3mhsGdcbXXGjbzRVAnNnyEPvk0be2mKguqIXKCBoNdThH7GY+NhZcreIEG
	 TKLflk63uzMjxqYI7Melxl1ql9qe/Q3hCkWO2IzsMmhQYHru7Vd5/1t56DbQCR0XtHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
	b=xZdKnwQmpv8eS8T9HYq2CtPR1MiYQ8Fo3ZdgHP+E0if+c88rFzzdhsF0WxLw4bP9qw/H
	 JoU+lfqSZQnL09331do+Nwo4IxaisRKYyMAbtcpickkzlqE7T4xWW3DzUeDdmXpfIz4LL
	 8FK0+yEslLzbZz7p5Cd9cJCBHWMwc3r1vA+wVbdEcCMTF37QzyxoJT4yGZJYMgl/CRaaB
	 lxt1yztFxCazqQubkHxoENg+Pdfw4l/UJ/BZI+sku65glaOcGYYHvpPPWSE0eVM8XQe/d
	 vAOnE7ivmeBHznKhdz9sSJ5q9WGTJP9cftMou+lLc/7Ee3OovIIJc5bPNYhcpj9WpZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC28606A31E
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 12:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so17420615e9.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016571; x=1793621371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=IOOm4Ef4YDTqKiGToDXLmbxqjqQL1TIvvhk4ERP/ch8VUtWXD3OyfF8p+pG1NnZ5es
         1JHByO622WHqoByvRR3qc0KFrjoNSLhPEtS/e6kyE2qtkHRZz+YN2uKJHltG52/MjNXm
         S2Xp1R+AzbvgHiV1DFxRvyUasvOfVknS+PARmwyTg1YfamwiJqi8gNiAv8JQkVbHaD2d
         nSgxiGBhnWjdv/Fh0lRfRyOzDgRES19kECggb9GYwIDWimthSxLb/PxGfdWNh94HkxiM
         Ft3YgjyPk//uVZ32BqWrkLlgSF6k8mLAXe+x4dTxhU3cibtdeFvxARYLlkOUJFBfKfN8
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016571; x=1793621371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=116BhAtI3RCag9ZlC+K1vkD/BpO5rYzWEee/huDsBEJOrfGgvwhKqZAP1Dp2EWCKue
         +IEeoIXWLx2pf3vpRWycT25gY18wVEzhBvnuy20QzIO81xORCTr32D0v0SX9bfWXCi2b
         oRUziGxN7D3yDT57MQJSVrM0XNkEzLu5KajT9Kd0jCJHlzq6rhRkfUC4g/F2O0fEhW+h
         c/EVmGYOHZYtkKm59M6vZnoSwZCaGGa59Q3GRdy5CafZ4NMGwWsBoEFIL4GI123fjVfI
         geaOvTBzytAUCf93shVOVOpn4+sTIm1egYuVN7dPhhxAVkqSWXx3znMeLoCinaEM6U/R
         2kew==
X-Forwarded-Encrypted: i=1; AKwUvByKVIi7xRH9kKwrtyjKwrJXzhJZE9AHjbQFtnqhwJB+mwgB7iY12SmHBGotbR3Lero0djiw6ciFLs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZA/MzD0G/pSNdh/fOE1D//apwI+t7NlzhFdN1Hhkpfpwcwllp
	9N8HDgvqhzz8TS1dXk6mEz6s8VlGR2WEAgTxN80uMfyWoWTpsRvOqeD/
X-Gm-Gg: AYBFou0sEHayn7kGUk2jXT1Axaz8CrT7+LUEdvJwrgbeIThC1ylANkSbKLaBKqqMYjK
	7hGlz9MRhKTMSoKarScO6t+scPa14kCj3pxia12hpv8UTGkETh3th26LsHZeSKdF9ViMVPdjQ7X
	ZgwM5ErafrTltOQt/hCaH2liaooTRhLskUdTIfQ70bs4AOvo1cRDRTTHhyvz6KkkbLq6sti6+jX
	yTPtH0hsk6o7c0dv1bTgQs7/xzoaKR/5nptdPrJtp0me4s3jxAjJzGVqp/rFGbHlHd9Oqbeg2lh
	kfSi1MXekknpvMgAq3CNBMujV+SPwFfx2swN0zoswPUPS7ENHtI7TFcPsNjoTUgbqQtHva0HOno
	P53RVPWJhn8m1i90CFT1en99pHxntPBBoyc8VfuQwwu+cHfIaP/VNdN9355gR6D6CDbFPyMlXdM
	8JOZR60x3yRjazC+O8VzotNVFq8/NIL/17e/YwW35A+ZzzORgrVqSmzTz/ABpMc0jF/07cYqFNi
	hBzxjpQ5W60J4gIaEIzVZ5DgtjPHNmUJFwzE5OgLwbLVu6JQG7vEJu4hNWn4F/wC6d7A5FA9a1L
	1pIqK23WyCl6CZKUO+oT0QEAQbszB8haBl0y9eG5rwBI9W9qyvtRJBqbQWHF262/4E7SpMlMKsO
	8ycZU
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr117309135e9.22.1793016571251;
        Mon, 26 Oct 2026 05:09:31 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:30 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Mon, 26 Oct 2026 13:08:12 +0100
Message-ID: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
a divider.

GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
clock for 461.5 MHz, while the CMN PLL driver reports its parent at
416.5 MHz.

Report the 461.5 MHz output rate so consumers see the correct rate.

Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to correct the IPQ8074 NSS NoC bias clock rate.

 drivers/clk/qcom/ipq-cmn-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 74a2043632b7..76678a4d6b7d 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -237,7 +237,7 @@ static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 
 static const struct cmn_pll_fixed_output_clk ipq8074_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
-	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 461500000UL),
 	{ /* Sentinel */ }
 };
 
-- 
2.56.0

