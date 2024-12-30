Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF197FBA2
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565437; cv=none; b=d9GXjS14krIZaPGsUWscfsBXQJiRZ1/wvs3hi1iFp934bPE/LT9pwYFSbObA1ooNLnhUuzBx5e0RYZCvqDiQgXSGvQYu3BGUlTmKhVeLefz7KiJvRrUdmdi4IJNkVXMRYNQwkp1WOvt3H+3pNI1ZXK7DTkny1OyxCde4G/Gaarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565437; c=relaxed/simple;
	bh=sNd2EYZIg7l4zPuE7KNVjgjjMpcll492t3gb4SPn5/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqkKdygYIPCHzZw9aSJn+ioIBxphpbbgotCwxh3oEqm3YtVHzem8p7UuWce/UcCMhJHh+JsjifkQlzYS4PkK3GdVw4Uk9rLwz0+CQNcjA0NSIv1dt9voGrUXazPMAv2POoBJLFEk2a//3+5HJi1wbB75QPHAss0LmAIz6XbSuU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWrGG5ID; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWrGG5ID"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so65816055e9.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 05:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565433; x=1736170233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmmcpflYSTdG9DnEC1Lz8/bGJpmwX76Rv9811OTTa/Q=;
        b=EWrGG5IDJZuxm92tfhj3Ag40e0RwXi5VHjBXSRtRoXMq3Ou0bU1YPg8yyt1UvhIpIK
         JA/7YT8MK04czmdMiGvx+hjAi0ZgzD2/2APWhHgv6hlSyGiOam5CaPmiHv+pL0VF2U/p
         27BbnU9yrYKPhKT66LeP16PpbzOuSwZNApxxQ1UvGUmHhoNuwhEpS3qh56qV+Isv445K
         SQfAETCNW2SOK0sB1FStt8ySnF7A8iZLeoRA5X02aur45hD3l+uLloJh/fXOiXdqnEsu
         nlGm0XvYZGiiAqW+KZJIBrsT+7SLzol64TbhmakGXxwV000Gb4trX+JaUOHWtJDGLwq2
         F7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565433; x=1736170233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmmcpflYSTdG9DnEC1Lz8/bGJpmwX76Rv9811OTTa/Q=;
        b=GmMqLTTKa+xVgli9JhenGNsNrcUvtXW7GxBDihggAGHa3w9BSQobU6DJsaCsWIbKkt
         fEqKAa+/PmLD278MOHI3sSqVO4cLOdnCjE/6Oir/9Inn4ijI07cUo+HhZrV7/l0sI7xc
         pUlcHAEUpNB35+d98qXKARHZWf+3BOYLdVR64ghD7kog4B5IrfEHlgUA1zvQIHf0+ll0
         prk0pjj6KUgyL282VNQiw77wwJwllkVj+rHMC/IYH0yXgoEzGdmeyfUy69hmbUfUy+j2
         2xd160IiAmlA1pi2a6T/s437OSKw6p7q3mZQ7+hHgETQPSNMEeDS84la7qNbu4pFHHv5
         XMbg==
X-Forwarded-Encrypted: i=1; AJvYcCV//4Vyw1FH2V+VE6JRFVCOFz8VYEdU3xcy0PvQ65WFlLrlPsF1TWb0iYkhLp6UJ4Evy63FxotOy4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRyUzyfGSJCuxDF2acfAWAVala0OJIeYHy7+NI7c12hMyoG7Ku
	9vN5d3KUrMj+8V2iaBxTyFYA3KX1DwrvQzIWgE2dXeaClHSHJ5MQhT73xuU15lU=
X-Gm-Gg: ASbGncs9GQWj/Fzllakdh7mcRAlcDJfzDqelZJ73hzIaBccsr330bMtq4N4YAD1DvPp
	ocnAgFSF4106QNkmoO6dk8DenfFuEeiMMfwLSFytr5kKxraYk9/gbuUU/SRIoWYARx522ZWf4AF
	XS1wdV6Vyjtr46jKFyUk44GF6K++i0g7vhAL//tiogAJCedRnUN1q4zCjXvAhF+OGrso11YWkDe
	qJp4mUkxD7oyKJvvQXF+3DL/MVTUp4uRrzfo89Wu+PBr2RqbEXLfFR0Yio3hTIu1Q==
X-Google-Smtp-Source: AGHT+IGtqzbMxbz8z4IpV9vofNDhZDNQzchKvO50pMuWuhuqRDt6Nomht67se1WDndXJNBW+wBsc7g==
X-Received: by 2002:a5d:6484:0:b0:388:cacf:24c1 with SMTP id ffacd0b85a97d-38a223ff10bmr30771407f8f.58.1735565432677;
        Mon, 30 Dec 2024 05:30:32 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:32 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:19 +0000
Subject: [PATCH v9 2/4] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-2-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
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
2.45.2

