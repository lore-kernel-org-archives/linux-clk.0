Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F931B59C
	for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708765967; cv=none; b=NIM+kFSxGv3VfbWIQ5Ciqr5ecaJXHfwc4OnUtn2zwYtdQy9vUKReTNBpIgKbBSK49iozk9KLMy0L1ZlvShZe2Sn5QZv7nrLhM/8PBfros9I7ID1b0Cbd8MKI/7Egx9ikwBCRHhv3qMpENL9s23sl3v4xZSRvymQUG171VwcEaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708765967; c=relaxed/simple;
	bh=d0VFOfOH3/XDFGCEN39cKeYLTeNfespjyWL1U0WSFPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LDuRNv/AM8AiNn2gepOHkpXdwqm+zqFRzjsZGBRcMUppmMHUvnkDwvotenHgneOzeiZhNhDKbuhSR22ldf9nMPZ6QvAxPQTObnnM39XuK4cLuH3I+IBXbY5z2cbMclhjWLXUPqPiPbNV3WcBz/4OdUTTJewYlWo81d1O8K2nvjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAUcGtyA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAUcGtyA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so1397778a12.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708765964; x=1709370764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbUWmxXPQmtEJUwryo3H5edvLFU7yMZad6wo2IXtDvs=;
        b=YAUcGtyAaij2RoTYdOUTqz/OtYEeuofW6E7dLHzn0xrM2/4X9IXkaku49WvUqjKn6c
         QxlLzgLjJSO1bbIsvwfC03WWc1HNEDJdxdvQA8n5t0gTeA8wlvLRNkUv43xvmGo1EAUJ
         VQkI0BQCg8UHwFNmqzmEJNRFquVl+sAVei0h61YxHDTUwtq+oHBErpdVSANxskDpVrjt
         enPiIGWpbVqUpodto8ELaavuGzNlWIW71XGEO0gA87a22bjSmh0+1W47ogfka43DhlQM
         LQi+a59u4QOWx1htbffFDjONFn3TnclW9MNEfigP0z2CTEMx3uJyDOPq4d8AFKaNY80T
         rG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708765964; x=1709370764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbUWmxXPQmtEJUwryo3H5edvLFU7yMZad6wo2IXtDvs=;
        b=OGkYcN+WYnW0ifmj/mO5GiGnsDvyrqjlQOOZ6le4UWbQXTts3Xah1LXWTJeGvDqfgx
         0M19ZaBTovvxAMiIP5NvTXTWvcrAdZ75dd003GSQCy5B3H0clc9UnX+ga6VYDSJ2UJAe
         /W+EM9AwJiXQ0YgsHjTQTLQ8/CBq1ynrepGfG8LUKSFuPGaBK3prOzZJDP4Khes1y+Df
         uueiuR7+T/RSx9+xoRlPSclkTJj1qrGBkQfR5eDVQPWXfUvgcjUYzZloqOpwzJ7aj+8W
         MSszSoHvAI2Iwc8jjv+nPHRgyiwMs67NPih7Rcq2mSbmhH4KvkKap1SthZSuJjWCHQvA
         OVBw==
X-Forwarded-Encrypted: i=1; AJvYcCWxOri7UUtvLmbJvwKe6ruWKOdPNCCoH5ws4GaADvoYtVCXMun2XRYvWtu50No2SGIv6hMDvHl66EXE0D13i/BwD1P4etIBE+ZV
X-Gm-Message-State: AOJu0YzNxwdy0qxFqO17hdCAn2/Vgg6hc6Vw1u9qxDkOGChpdyuK45Aj
	kjVNF8FApNkZo4Fia9Gh1BWWaO3yCaO6+779jZY3Q6alNBhlbrUAdEhZDEPMAr0=
X-Google-Smtp-Source: AGHT+IHPkmdY/2JX+2DxbAffRxrLnVnrTav9C+myuLjv86tAmwyJIFeyB4pKDfYDM9Pizs0gbNasYQ==
X-Received: by 2002:aa7:d0c9:0:b0:565:7d4a:1d4a with SMTP id u9-20020aa7d0c9000000b005657d4a1d4amr1230145edo.8.1708765964241;
        Sat, 24 Feb 2024 01:12:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402164800b005652f6a9533sm363120edx.74.2024.02.24.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 01:12:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: remoteproc: ti,davinci: remove unstable remark
Date: Sat, 24 Feb 2024 10:12:36 +0100
Message-Id: <20240224091236.10146-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240224091236.10146-1-krzysztof.kozlowski@linaro.org>
References: <20240224091236.10146-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TI Davinci remoteproc bindings were marked as work-in-progress /
unstable in 2017 in commit ae67b8007816 ("dt-bindings: remoteproc: Add
bindings for Davinci DSP processors"). Almost seven years is enough, so
drop the "unstable" remark and expect usual ABI rules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/ti,davinci-rproc.txt        | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
index 25f8658e216f..48a49c516b62 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
@@ -1,9 +1,6 @@
 TI Davinci DSP devices
 =======================
 
-Binding status: Unstable - Subject to changes for DT representation of clocks
-			   and resets
-
 The TI Davinci family of SoCs usually contains a TI DSP Core sub-system that
 is used to offload some of the processor-intensive tasks or algorithms, for
 achieving various system level goals.
-- 
2.34.1

