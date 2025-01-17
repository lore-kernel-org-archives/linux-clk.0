Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC41FF7C1
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122054; cv=none; b=ijqCLyDo/dtm3ydwu1Azr9RDLN1j7rRslKY5JLFefpK2SmEhCpyb5Nd6BlIbGk4zor6zEq6MvlzZz//ppuym1bD4SJh6cSJR0yKBLNW4BlZa48nBDrN0Gb/ZWIgyp1CeS2NTb4D7BRhvSIQHts0wqJUJDrqUhf7jGNWazaYn7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122054; c=relaxed/simple;
	bh=omQ0q5abBpkqFmtYz9fwRWfVIX08QuZYwIw+MD/b79k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bN9BdIiku/r4DV/RZihKnAh0KhSTuxRsMAMcwxHkCCXiUDGkK0uxEyKf4qkVeCH8rpXKnaUK4mdgSqkIZli9uEhUHcOunJLKOsU0Mo3+FnwuvcJDHlET9q67cn+QnCaOF/vRizupSt4KmrPsZ3VdntFHcv3KKJnshhEiJveGBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwrVVWG8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwrVVWG8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385de9f789cso1616633f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 05:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122050; x=1737726850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Ks6wACBMUt+4Fhjb6F/swKHnhyTvT40HtN0zm9yGU=;
        b=mwrVVWG8w/RSivIzMfzqWiK5Qcb3+bwgwMj5kQ6uixnvHpWThQXSYwRvlgf2936N3N
         UlCoDENsk3KKsOgRGEp4RuptBjLEN9ODcIuUDmvH6cHTYvTaJwF/Mjj8MJq3h5FoloA4
         PeRnVgXFpACxnGIOieCtHGoUaT+pPQDmwILSkbRAqnpTx/A61tOrCa7u7lG+uFSfI8bN
         28zA4QFbHfYl5z283A03ZnqiVRlfahQrn0pVE7veTR64DJNMgmQ5zSyg0JAO6ePYm9rX
         2KTjjSxBQGynbesuaHX3b5x7w7M/L3bDvL07gGvWLOTtFHGunDAIu5ckeL7cwLCFLGzZ
         7pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122050; x=1737726850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15Ks6wACBMUt+4Fhjb6F/swKHnhyTvT40HtN0zm9yGU=;
        b=hE3GnngvkHcaIPpqSdHF9J/+rm+aZqGjN/T6mtdsDpunbP9uFFinubLDW2QnzmopsN
         p9Tbvx+kEH7RQC0txIBozbu9Qu0JbFXD8YqwOtKzhMqYxSZ0mTb9Pdd8r8HPpgZES7pu
         U6lO1AQm7Anav1T/jQkN8xUy5i/1jP4Q3fUn3ydCZs7EXvV/uI/KQauD2HsKe8Zh46dn
         yRChwE36VXixdd9YjiD7nx/dYzQKSyRsGX8yLBOq4T5/E3SnWDjbXtQXqcEpKMKAnBUy
         UTU/TnsmmzRCYNO0I/Ygdl5aqcasj8Wdq/bQ9Rm6fUN5PopGb6DzJj2lNnRMNFT+eUQi
         4fHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk+Axv56fVWW8P8pZYlNEnxyCrrFdh8WaSB7utlXo/r+dAeRtprerffmtuLeiODU817tdFwmAvFa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqwc2+OI7ZTMovf+EVkI/y3MYm6wiWkZUWuNuzgS4hsdpBmudh
	M7S2O3qWIgcuK9EJvWRLGqcyL5wdgn1Z5a2fA2Qqgi1rqZottRDnIUh4S08+avI=
X-Gm-Gg: ASbGncuc3el7r/Yslt8ZlrzJjjXXONktLn2m4BCF95LHqR4BDq65cKeVl5kkc7cZXD5
	97HsvaRbiMm67dCEDdZi4BQAAgjVROJFUbT+Ec5nnp/tpPINwzOLrU6b9pTmDrjpmmtgh0dtfRJ
	4LFaCrDdetlWWt7LiLIpa4i2Mex6rztGVNEi6xcHfEsYmXM+hLkc4x1tw/2sSL+ASEhtXOC9sUd
	STSsIGH3NBOSyH2o8OzTILrlVB8UWsFzLM4PtnX7k7lzyBpXZ11WGBeZ+LN+xyY4w==
X-Google-Smtp-Source: AGHT+IHNmLQm1j06TtGNOkJWIFaFS+c+vU1YTf1B5SrEFcW5N5PbHLEVJA/tlx1fts1YuOCHHCZpgQ==
X-Received: by 2002:a05:6000:1faa:b0:38b:f04c:25e6 with SMTP id ffacd0b85a97d-38bf56626d4mr3033027f8f.14.1737122050037;
        Fri, 17 Jan 2025 05:54:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:07 +0000
Subject: [PATCH v10 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-1-13f2bb656dad@linaro.org>
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

gdsc_unregister() should release subdomains in the reverse order to the
order in which those subdomains were added.

I've made this patch a standalone patch because it facilitates a subsequent
fix to stable.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..bc1b1e37bf4222017c172b77603f8dedba961ed5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -571,7 +571,7 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	size_t num = desc->num;
 
 	/* Remove subdomains */
-	for (i = 0; i < num; i++) {
+	for (i = num - 1; i >= 0; i--) {
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)

-- 
2.47.1

