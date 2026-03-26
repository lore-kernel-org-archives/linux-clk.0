Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436A37C907
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488494; cv=none; b=T2T0iba115pcrV46gbs01ofAYPtvUTLI4BkdcIZuBKVSiIPK/ZAsB53olvALXfPB0KSR67vcdZMEJxJv16p4cbxxU+O8yhN3B2xt/OHk1ow/Xslx0xfKEOehK1bZe81+Fk5I+/lrA818EWtvwPYcKtcq0s+rbltgha12cAyhlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488494; c=relaxed/simple;
	bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMvW52Lap6hfPGWZl7obxFL2jnjzr9MJ43ssftaRMjcHsio5T6TFdTcmDgHr3ea2oqUs4jrXtl0pmV7L1sGm7LieiRxoMFrgDQKREbkLb2fEs3jLd7+cmJRWRicgtVe/S8kIeHFhDPScSvA0Z3+FhbMkeUg6HocS6wvXchss6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmVPmPML; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmVPmPML"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c56e822eso408424f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488488; x=1775093288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=WmVPmPMLg5cHLA8iedgfnYlvZlnh/EKxSoE/DD0UeeIjOpsf7893oZTwou3ltuyVdq
         TRhHyZDASKyCL6Dk8bHs5tNHImjs0tNstchbNlcnHlPBkri+mpsB7yTYhftiI3Hy0lb7
         YOHzBqZsH0DoiGw2xQAoBhGUGLNlxRPNmIGIG+TUI3Rpog4xNwqIWJQmCEOPIQJ0x02s
         G6F4zUlTnwd/PenIRi120yhYAvmQrA06l0XKPH3s36fR0m0zztEX8TuixjL0MerjGCv8
         PiGcvnJcH+aFzkxMHim9gPhYeHgYhUkMT4Eo513QRs2IuJaJKA4rL6vkqtmyZngv6h/p
         zYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488488; x=1775093288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=RgQePKJGmjdMfYSinYaDf743iieczRuz53X2ldafqBpxVrcW9mkNnt0iocRUiIUq6t
         hvvkAJBkVLKMOY5CjX1/EUH+Pe1gV9iokDK8TsKljEJUPAu21TT8Jvm4KJrHAm3ADRC0
         giDHF7d7w8DMzQ3xZ2CCzTy3+48Tpfe9Y/VrhXWvFg4jINocBFeRUsTB7x6jJJzFNVeB
         Um82OS2v6JTkmUEx1AV+NKWNLUfpiFowyqTpHDLI5QAsepVT0bEBt21JOuTphzBHTcrt
         Kc972/HshgXCkVFbgWJ5G+f0Aoa+LsRFhtts6sWoEuN2340oedl/h/eBR6KgCLEzgRro
         q2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5U6Wt8wI817Y669kiYNUJU+lgyOQDw2TxImnqrqttwwJJliTydGBbDZ0XoHrPNpDvTNpHNUB1aVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/igS/oeB9QPW6Fzdid9xApEmIYgwjkdQ4nqouGeML2Pvbeoxh
	kLkVIJI93Kr8NbOKYRdty9165xYVTiZikpd9nYy1+YKHk9OP9Tll93TVMGs4FHmhezf9rm4tmPA
	2oPSv
X-Gm-Gg: ATEYQzwyuuck/pY2mhav+ATu9wK7lD6EUNrWumfy6Qzwu/Zx0sCyppKViOg25xo+Wnp
	crCSzCgWMF7RJhujazZhSajgf7dllZfC/OAy3d7xgFqszDU4qwYNwaiomOdUHRyz+N5Y5FuvJoo
	ksfIgg3ajuGpsiQRdINKwPkwaLIBTxsXRDd9Z6qRaHSzRajmxVpvpFu8n3gquOqOIn0Sfk8Lnue
	UB6wohyTk2ONs93ibEA/0lKvNbKPUO65NTX16l4/hTQMR1Jx/2Ik+rKAUpAQN/M4Wjgc1/USrcP
	C7k5f3R1RD2HtAdiP7XQaqi2y6p/n53yymvF2xvRu7qUU8VfLRx/9lbGl2xqGJbPhHY9Mrw43AW
	CCx/2stfe/L/UcYmkdyVs31ABE9t29x1oW034fryLNYowFDA9TKYzqHHeuqrZBvI2yLCbGnoYc0
	Qp0xMRGzCNopRDooh9cwkc0Mi1i0g8i5UzQYQ=
X-Received: by 2002:a05:6000:2890:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b88a88baamr8337146f8f.30.1774488488352;
        Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:32 +0000
Subject: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/++z8oXlchbJP/1M16TqvlqfGF301jKf2r
 tvWAN5KfSmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OvDmD/9IeYsBBB79Uzcq2AiGxUn5frbN2yao4rM5EyI5w/zdWIwI8vVhpwVrKUTRnPJ1DrvcovQ
 fb6EwO+HedpbY8CYcPjKLFWRNxM8B9CymD0RJh/GyNimakpmkqsK/ZzjRW0qJyHLMwxzVcKBQgZ
 6STIheHOVMYoCqmuMWC5Q0yDrkia1uCszfyaARyX1V/ZNDwBQ8qX/bcl/g5hxuG+k8VQVzlVNhV
 NOH0xS6kyAALaVifjCjL8z/A8491mvPf4ml//sVj10+4pHu5QrkcQwIRXOvbJHmIjkyz+dGDkX/
 cyjqEiqPQK45U+k7Qwnn2ZwKVfkxiEvvmojLvfQECfFh49JvyPXTo6JvyYlKZ8o/6COYLD2IXAq
 /1uOuMxz/5YTuuZcL/G2jvgkAJl+dVSe+t61zL6HrtGp9dRxdA1/bjwuZ4YKjcI5pVBT8dINs86
 tPjzP5qu8CQWrvgpuuTOf9PGwr0KTMeBILGjMGsYhgI4Rf0+N5OZhoh70uXgU8V+ykJl6eDcTIO
 WH37pYR2LCzoLFH4pKeJmXT7umNMkx9tK009I5PkmZNwM+EhJuaOJQdoISyrEqSBfXhzFdYwdHC
 k7snsqE0XnDaEXLa0ZmLyJeJBkmf8NsFfsTzfwNZi+0N/5N+eoLzp8NVTv/fK9kAhf7NtD1cAHX
 dzKtZJFOLXIw6Jg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..66ea057291f6d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.52.0

