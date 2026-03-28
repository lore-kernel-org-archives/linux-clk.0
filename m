Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE131319859
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661185; cv=none; b=BlRDAOv6wcVzgueOAMbao6fExTlc/ayc5IJtVw8rrOHY2a9LogKUDQC+3PHHzQbwAKldzg9Txa5RC90YL5vsc0TZl9/Zbdcr01EPkYYQBXD+jsjWh8yqKakXbOvQAOiUE0ra+gnYRRqDOPYu6aRmpGcpjXaXwekGRossLiwSp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661185; c=relaxed/simple;
	bh=IX3C4pIMJ8k9u4+4vziha/Y/uIGiYvafzFLAaw79hKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYWrgD9bGSZaF0UbYJu75QhV+cpbC0qD/kakBygRE4WaebP58YfNPKEZcpvzZPWbOpt3nVhnvWFlt9hKAnNsX7nJiV+JNQAiNe1SK5v34oAxoaEPnNUNtKwRAOWCqVXykBCOeslPmmsa2dAgijpeZuzRsX6y3KcwE0SQfOZ39Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtVxiXdw; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtVxiXdw"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a33933e99so2006351fa.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 18:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661182; x=1775265982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xR8gHqnNIiEnxM6fE1y2q/Bl9VFmaIbjQc2osrqR4us=;
        b=VtVxiXdw5inbK3vw3p3qyL7tbdCvr/knUcrlTChdphADc8h8ceuTPriVMHFlBnDgfT
         RDhqa+rZ031tniQ683eNE6stbG29OpGKH//itUuVTP0q9GEodVhrFHPk6s8qwpRrbZK9
         ijrwZBtibitEQBsNvPcN5gHAe/pEClWX4jVIpzjjIiPqQDASs6k5VBN4ncBSLFbb6F1N
         7BPg5nXcJmgh203kDj8+Ly2EMQxTSQXWjjjUlCT6Nhd6JKoC1FvaDUEZc9FlMHNstvAn
         Kae1b+QH+5JKMzAxuID5Vyzb7aeefAkRLK8+F+L+AyM8XbaJVG4rs+oIABXOlGd4VF6Y
         Dwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661182; x=1775265982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR8gHqnNIiEnxM6fE1y2q/Bl9VFmaIbjQc2osrqR4us=;
        b=ncCKE9HkcxnWAJrAiiEU6+wlq5Hza6OG3lSsPurw+D1XM3EFgIImGnu1cMLZtpfPxQ
         v6lHndFQLXO/vCXvusvE3wLSxxTbOTrwe9aci2JfeCp1IyuK0GWeiu9zHwB/IlJLp8m8
         cFSEqi6MU0q6UQ+/qCAMWWPFDBH4N9XfpPEF1FAPD92Tlg4j6SgLtN7FEY/Zw10V00l8
         Pxl2eROxTjhwrMM2fCt8KhEwSPdBKxC3QGF0RyhnjO3XLVb8UZ+WH9yKBoUTd5KZjp1f
         xAxmV1afmUFPYFUm5AKwm0RKGZpQbeeniiHKtLJDYLKUSjervVM64xzHFZ7YwAesgr3d
         /Gbw==
X-Forwarded-Encrypted: i=1; AJvYcCV8QvQ8mjo17+ZXZFQQLr1PnVyNvXvcysSAGwXy4CytYihCbR8Q9IzeOWFg1je21wD8N7Ckuo7fOQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygn4Vh++Dw1RzQLD9qKPHPcsQpM46KgZeTevtdjxqot5dEDuBd
	jqNBWBiWBe7LwgVKDegi61GY+wkDyHO2I8Bc8wZzEg0Ym8HrwUgSRG1T2qCogigptlK9Zz2zv4h
	CUeTR
X-Gm-Gg: ATEYQzyDhsbh9T35hyAz4cOrL7QFHmaG5LPxIPi3UJsHzgFJNG89P/5HaXW7YyyP6KZ
	87NxCxcRU8x5proEfcauPlKCKtGEBdfO5UFnNLXu9w1xsrfApYLGepZ6LIVr6M73mMLVMMGds0f
	kmtdJyWWxR+NDTqejZ3cWT1mPXnjiFi0ktmnFIQ9PL/M8IFWUdFpM+I9OnPUaFm0POIUTbTW6L+
	XEoh7ZeHlmJGMblKn5F8TzCY9ysURux07O5lROKxka0XuYw4zYP88kORR9hXQn6tN6qOF+iHBhm
	Tr5ocFtarBFss4PGsqw3Ngkb0Y9sRZx1LXxzLjGZF9Xtsp/Wfn2mGRy/ikIggWmN8Fx6KCGxUmZ
	9AY0hWECW9ZJpwNt8YOwxr3jlpPIKbTJSPosfm8Di8WDm9VIgjww3djsw3RspX4Ysobu+ykxmcP
	LjeUB9FdQOrKAhH0H0q00pgLOJCu0PJnzCC4dOOrWHq+UQl07tTA1KQwwrk3uVaZKXwKaGgYclR
	fwr
X-Received: by 2002:a2e:bcc1:0:b0:380:a1c:7031 with SMTP id 38308e7fff4ca-38c730d38b2mr6254411fa.1.1774661181970;
        Fri, 27 Mar 2026 18:26:21 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm1562201fa.12.2026.03.27.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:26:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains
Date: Sat, 28 Mar 2026 03:26:19 +0200
Message-ID: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some pm subdomains may be left in added to a parent domain state, if
gdsc_add_subdomain_list() function fails in the middle and bails from
a GDSC power domain controller registration out.

Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7deabf8400cf..95aa07120245 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -518,10 +518,20 @@ static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
 
 		ret = pm_genpd_add_subdomain(genpd, subdomain);
 		if (ret)
-			return ret;
+			goto remove_added_subdomains;
 	}
 
 	return 0;
+
+remove_added_subdomains:
+	for (i--; i >= 0; i--) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+
+	return ret;
 }
 
 static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
-- 
2.49.0

