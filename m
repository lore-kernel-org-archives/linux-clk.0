Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FCE1C07E5
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811892; cv=none; b=cta/8T2WUa2TPbSYKw7EF1VmpaR/ckb/8p/xthjSkoVSy4Ql+p8RNkVfm6+wUMj5lTYJItNTWCsVbOnByg3taGf9C9KlQmeEjCvQoXTgpJjYM5IbwSyEOJwlSiv5L5xhmTZXDrwOjh8uTvxURRTG0mG0l3MQ1EdZJ2wzTrbcYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811892; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ux2S3yA5v1Rpw5COlrLe0TjWfS3AT9Jy1AG5mnpY0c04Hg+I/bJE/jUuBSGzAOZBVLzGI0Kd6e413WBobtIgdZOe2KU2Idnjk311dm1RLKO37o8gDHFh1kzohDhwXOnodzM1+6FhPlDCaGDbed85dTs7kdTI1/LtcyrmYMrK8e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpk1cOwp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpk1cOwp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3824a089b2cso663351f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732811888; x=1733416688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=lpk1cOwpdxBjD1Ktil27Zxp5XzPBNhpj8hVSXIvfzY3+10ziCMv0Ec3lRuXkXEhSo5
         6ygS6H5j5fa0eaK09VlZFODDYfGKemCrnFrUjjhrJVqQwjgmuk/u1jcmlduUOIFjCeW2
         hL3MuR4TkBtoVd/jim/oNe6IUKWuIa7rNIGV9IYQeozqicZ+YTkvaUl2P4bhWPIWykGY
         Nezt6ZQLTIGLmbL6gpObPbnxs/plSjhhGAVNyQcs7ReH3NTX9sxZyoWt9Xm24RXhylb4
         N4/OsDxDTnTYN6kwFTxpVtd3jbMnBVztzDms3VmiCQbA2vQ+ntCXne092nkptm377D6Y
         auag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811888; x=1733416688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=hxveJPcSZ3FoDthjVOGGQ6UyDw9FKi0UWqEKVPG+gKb5sKkM7gHv0iVGZcMqWoH+FP
         2ylVIzsYEsvMbkIVLCi5dV/z00PXDznnoHuWs89Hqp21MNqQ6nWKjFScH8UeX0er71Vd
         aTMHIc0+W/UEeG9EEEsPF9BwOwpvDFRFgrE5ln2WAEZ7khyh4kW0mqy3cIQfACY5KjNq
         uq3JaTZ3/cgY1uUcpW9UuKJw76ZgNOLIcF35cPaX6174NvlD9BQ82JS2tlyH5S9c8hHe
         wEE9m/lojR8qV/9ndtcLC4a6CH/FH7vwTAAoBvUtqboeoF6AzbyozzLq2gnaMQ+I1XSW
         +dKw==
X-Forwarded-Encrypted: i=1; AJvYcCWrXjbmplIQGQF9iulZPzMaT4wFKkduU5nzewOaOVh1Qf0il9B2RoOGGH5ljjo7bkCxnVqluyAv++c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqG5t3bOgzkUj8MWa5/QMTT0MKOHcrK+LC/JUEqhW2lRnf1XV1
	gL0fgjRQpLydOz7ro4TGiPHDPBmHx6ajlfWJyl/3wHz2uFBX74I9vxn6fSh/w7M=
X-Gm-Gg: ASbGnct0ukjF18AM4hXPnObZZsb3w3fWgpUNzfP1Ac4d6U9ewZW0fLf9GsVu8tqKz/l
	2S4hHU3ZyShl+IRpngGtP7aeXdw4Jf2+ZyjnstZTgyms1RZBNd4DmgCvUQYeAUvzV0RSRgEVPIU
	WFPo6w4l7f9ACDD0Rm7NmzdOTgkrQ1H04Dd6f3nJbLQot7lRV5Rmpog58VElFjx3r7w23QL1Mu1
	BRJF0UZ0RmYyZzR7jBl7x2KouNLHtuhwSptqpqYcMo7A9RRZ7524cl2b2Q=
X-Google-Smtp-Source: AGHT+IFubuteqggyPtPqePz0DzUO88xCM2UujedDVDd3qIVP0OzH3a8fKyNdLCe9TkJ43xBopue/pQ==
X-Received: by 2002:a05:6000:2ce:b0:385:c8d2:efde with SMTP id ffacd0b85a97d-385c8d2f096mr5146870f8f.48.1732811883199;
        Thu, 28 Nov 2024 08:38:03 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm57990155e9.26.2024.11.28.08.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:38:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:38:00 +0000
Subject: [PATCH v5 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-1-ca2826c46814@linaro.org>
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
In-Reply-To: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
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

