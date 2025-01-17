Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A631FFC4C
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122054; cv=none; b=DMK4axNUGocRUtSONvMfwOe5gqmEPQYnkSUM+XKCQ9/mJD5Ijcl7iZQJVb1p+JoCtRafq6CbwzgV3O5Zfx3FGfBqyjoxz+7liLfpBvbOIsM6kX8MftxNd0VLKaIz9jdyIYb5zfICsoYsMVU/QOR5az4F8EvXe+h2SqXeHZbaM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122054; c=relaxed/simple;
	bh=MAgPHU1Bz2sNDNZOkc4tcdXK0ulAsoRdPInzeOCBuFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlnrLC5j1yQNBoZv6BGWMHztCsb0pVF2GWObnjFzgwj6yA0esR72TtNyDSjHptXh70BZKKEpDwGMUAmyitIyXVk/uuzVJ6sVtIH/MGaj/65jWBZe7VItPrDxrZ0cDfPdx7Mj9ATty9K4WJHA9Z1rb3dCrB+IeHqI1WCh3tOWKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olwd0Whf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olwd0Whf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1716971f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122051; x=1737726851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTx7trlO+qhAIZBVr4sCxA6UgBBZ6iW+pqhCeQ0jUHA=;
        b=olwd0WhfJHs1nlCt7ZFpe26jJ5Fkc0+UG1ZoPVuauVKFqw614ula0o2e8kqa05C8GK
         lTkjqnUWlff1TFbBcl5ijSIQGM/DeEqbAsZKbtBCoc4F1yoFr46Qe5MGhLpoedtZZDPf
         yd4S3oBpjHl3ft6NZAMIdoEn5FdNjuxbtEL0MyHyHF86YjyOtX9hU5dwAuvv2LNTsLLZ
         c2WSMtUkqFwoYlXjGcekGE0WNDADEWJlvdZM2sUFliy8XQFfCQXe4my2wXpbzk6g/qOT
         gHwVXPV5HCF6RTZdA0gaJu8gQNFm4leIgxf6bBgIkDgwqoTAFGRHe31x7KOjvz8FZOlP
         ArFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122051; x=1737726851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTx7trlO+qhAIZBVr4sCxA6UgBBZ6iW+pqhCeQ0jUHA=;
        b=fDkvelExF5SUK0SgbRWsutdX5JaAdQ3Jz+GLjPx/10Un4JRQyjq9Y4Pa7AJV9dk4lL
         RfuaAu3hOFhkmu5s1BeCsJ6QrN1qwMcBGrr8GKY0YR8MZT1es4C3UmjYoRguXbx41hdm
         a6H6dR5FGlfC0eg8mQDyNHvp8k4kO7dEjnAo5M14lqyr4uJsd2vGaaTHO45v8iiL5etf
         P5dPRYvySn1q0sXRTP5VEz94+DUqqkT+geHEGr3Ll9MbIVYrVOf0FwF60Djh3i/Hkjf7
         aBHky8q38/3txfzh8mYuSs3WWIS6crBEB6e5d6HtfjHws+aNEcuf3+J4yv/wD3joGtN2
         53qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZlgiBMztLmwlimjemFpc2pwkLyVtwlJ+3NzPOyAPBR8oOhjubN6SUcoHMR+1MXll6/Es6O8ezvSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5KFpETPUoiiz1pd3qcdLh3m6EeUEXFwvv69X/yt/8qn3Q/NXG
	Mw//RFMstY/qVGGYNVdX84Hh8xD/i2RNlvk7es3gh/rLwqwDm+vLQb8Zmyzl8kI=
X-Gm-Gg: ASbGnctIhkU/01WksvlT3SR1yGrkEnnVkgZXw+yUHZOUVoRvV9NoxARlFtbovKN1w2h
	EL3tk69RyX4AgGd8iFwaMjlIYtBBLlp6/XpedHaRh2qfRbD/Y7Dvfw6YGrAFop7XX3kIieAyEGN
	kXycjE4qwyWsAJi3iglMjG63a7Q60mgF8rjxqFSelsX3vXIY3nwacQjunCZPfzp6yC5d/qK7IQV
	+t/iOVPseDENclOC6IMaJrBs5ajLi8IBwt+zfw2jSt2COWcdfolWoXzbNXLAKJn+Q==
X-Google-Smtp-Source: AGHT+IEDPXdDbnFx8QRaTJCrevmOYsul85rv9RHdhHqFBMauSQzaP+fCqw7xsorGDbZRjoKdq/HThQ==
X-Received: by 2002:a05:6000:4021:b0:38a:a055:8498 with SMTP id ffacd0b85a97d-38bf57a9436mr2476005f8f.42.1737122050978;
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:08 +0000
Subject: [PATCH v10 2/4] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-2-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index bc1b1e37bf4222017c172b77603f8dedba961ed5..fdedf6dfe7b90c074b200353fc0c2b897863c79f 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,23 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
+{
+	struct device *dev = desc->dev;
+	struct gdsc **scs = desc->scs;
+	int i;
+
+	/* Remove subdomains */
+	for (i = num - 1; i >= 0; i--) {
+		if (!scs[i])
+			continue;
+		if (scs[i]->parent)
+			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+	}
+}
+
 int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
@@ -555,30 +572,27 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			goto err_pm_subdomain_remove;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
+
+err_pm_subdomain_remove:
+	gdsc_pm_subdomain_remove(desc, i);
+
+	return ret;
 }
 
 void gdsc_unregister(struct gdsc_desc *desc)
 {
-	int i;
 	struct device *dev = desc->dev;
-	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
-	/* Remove subdomains */
-	for (i = num - 1; i >= 0; i--) {
-		if (!scs[i])
-			continue;
-		if (scs[i]->parent)
-			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
-		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
-	}
+	gdsc_pm_subdomain_remove(desc, num);
 	of_genpd_del_provider(dev->of_node);
 }
 

-- 
2.47.1

