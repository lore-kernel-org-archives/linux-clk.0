Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CCB1DDC1B
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936079; cv=none; b=HokAIJn8EwL7jSuvVptconbd0B8Ogk1EtofqAKFBq0E09G4saiHvZMf7C6RKtnTlbjDC7ixP3TM7gs11kbq9zoobeVN5I4Qv9xEIoPX84zDrfX3lnPijRekMu1Dua7cDTsnOrZa8ToBBKGdoEQTWgaWKyEmNwAXCWj+v0IYdmUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936079; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/6Y4TvWgn91GZWTV33frKz5RXN5KcuXqOXQl7BHQpEKvCkmT3ro4TtJdIs6fNwQm5XX/yHDauP1R/pq3/fd72IZM39NHNgMfK166UB7m1DMGQu5NeIgmc1eFsYT0Q9KxOGcUMciP5xe6XYCcP4Rk1S67Rq6Gb+ykLR+y2MpiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tC3XrN6N; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC3XrN6N"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa670ffe302so703156066b.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 08:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936075; x=1734540875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=tC3XrN6NwnJEzhQl00utYZrObhor26u41cLUk7Fo62iUelX3UZtX6pzBqzSGq5Frah
         JJop4cZaLWsjpTJwCDgCtiPxVw7U0lUZi4xFq6g/gj+FPjoCXoI2S1QZFDG5zuDpYUfd
         bZdYOvCn9iT//H2+2THybZdam1vNs3gA36TeSQNMjm1qCctzrALYOExTuS6gzMHKRqpp
         DUM37c0cWRj0WI27QiJHvffzOAmeWU0XAaRDDmctxy/lP4WdGqzlWPs6xeLPtwo/WFvU
         y/6ILyZ5F1tJBM8vdLyLiOdexPY7aBJ7W5ryIrPUgcmwuPFp1C4e12lJhOh6ydvNylKc
         nxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936075; x=1734540875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=M/6vWi7vUpJqstEjXk3kH6YxyTRTj6GKpxAlQtXNlS3DPFp4GbDFCCgQINxUo0mqOC
         md6eRG0TGzRnMK1ETx8Jee3Oa8kxkTHjH3vVydcETKeo3lNdz4OOazq0WWdRr2Fhflf+
         +ArYp9IIVBG5vVv/wspYUD2kvDwEH62WqmlNCXs4evOSqz/8Pt8bKEnDkdpWWhG0BKTM
         7GvMIIs7SM5KGAswOeGhK9ktXYaZhglvCIf9ISGfHgcRZP+VktXERYn3f9PCAydRoufQ
         0WbySIGqD3vDDeAkS0GjWJqTbkaM8QS9aS7HUXjW3dhaxJkPyBRKlcos5WKtpkk235Bi
         q2lg==
X-Forwarded-Encrypted: i=1; AJvYcCUUW8Wq1htZJEa2XqMBuXhc6gKDaVgtQOkUhjyOVxhRLlRVw/ob3MbrOGHKBvwUq5obPaIBYGW8QYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAZWqrnx0MpBHHbwI7t71US7VyNYfjphncRDq+yCOxwB6vx6v
	xISqPpPL+HvcWXInceFl3YFnDY+9dfAH9XLtWlJ3s6RDGCt24Ol3wCwg9FQwDg5tGTjI09Jx85y
	5
X-Gm-Gg: ASbGncvjCOBLzqwxlGo1v9D0A6kAkZxZFM+BdQfTwZ/ZAu8Sx4np1MTfixMM8QCuQ3k
	KCN+3RabUGslmLVyQ8kY1YOpDeg+nXAQ0sWlWYaOOznMn0AsRLJHbvfeeJMjnpBGho2ouvj61xS
	tukMQm4xGccoI9K1VUO9oU6L6FqHyx2x8OX/xA4ryS2KzwohF7HVk7CNToiZO3E6PaK4Gtw0mrq
	uHhc8S8eVu6aEqSPiUHvCkKRthGYQMRE3hDy/d4CKM/PY36meyt9vpxepj93Lk=
X-Google-Smtp-Source: AGHT+IGwueC9pvbwJZHuJYb+mS/4YZvMH5+SuK3PdaZwf4O36I3sCcLiX8mfNLPMNDkWhsXmFfYC/A==
X-Received: by 2002:a17:907:9145:b0:aa6:966d:3f93 with SMTP id a640c23a62f3a-aa6c1b0a214mr45781766b.23.1733936075518;
        Wed, 11 Dec 2024 08:54:35 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:35 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 16:54:32 +0000
Subject: [PATCH v8 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);

-- 
2.45.2

