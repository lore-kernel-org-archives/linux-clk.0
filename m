Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE83F9F31
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965724; cv=none; b=bjedQEqlL6hKjlGbz17xD2B0KZcawC8Ye6N/sjToB9Oq5ViAlzAiota+PMQc72eZ0v7Ktb4qoboGF50s/3jhr+V43UH2cCMFsOoXRkJ3Pz35Xr5XExtFjE9ugEmeq+ihU1Om69wxaLDjYG/WUW419oaJ1pHJY0PqrDY0+GkR6cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965724; c=relaxed/simple;
	bh=PDgD9m1sXAG6hNkensMGB8zb+sGnox1Y8gux2vXUMOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKS6JJS+8+AXx0vuVtE/blPtC6n90OEfbIzHfG26hfqM1ldCp57O4WbC4tfgfi0PcoILgR3sgPgTv8R8j7wudcTv8ftCudQkWxerPGQvAWZUgzNREQZxioilRitWEYek2ri+pTRhbiR7Sd4QG21Mv0rg17kN1Tv/C+XAGoSE0X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMSRRxGU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMSRRxGU"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a285840940so754630e87.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965717; x=1775570517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac1ZXKFRDWaQXxMIkrFurE+eC1IYhavMswMXIL5j1GU=;
        b=tMSRRxGUgKePqVYeVnd0uxfAKgZVG6A8ssA35Yv7RC/eRcm2K0jxNkMIIl2TBqUOiP
         YpgpRg7PphuDmCtcSkXHyPOly9iz3U8LURfcMchrC6jzsNZR4yafaNCJCBAaaltm9WlS
         T5gn40FAfRSo6GwAZ77JQgwQ/qluuC6kfMjq4JRm2JAq1iqhlJ+4u28eHxLUXSqToTJI
         49m4cdlDDOkpO7wqOASai6aMGOcqAKRMYOpNpbExPG1ZyqfYdMQgfSiUrcoRkuPv57uZ
         ws2iXOO4vCCekA8vBbMROmFc3d0tNuh2tWCqDy8Kr2K+lRwC/P1zLpOXnToucI9CMIH8
         bRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965717; x=1775570517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ac1ZXKFRDWaQXxMIkrFurE+eC1IYhavMswMXIL5j1GU=;
        b=PW6oMDB6PJS65W8pA5P5aH92Q2m4f7dHsVitVoe1a4PpfCW2C051VC8CG4Tcvtmbsa
         N+tpAj+eEPD+ZLACI0bzAI/OZYS8SvATKmaDhM/IoHvUl4VCdiCqpQdep3Q4nffJUlrX
         8wYpBAekFf5Js6u0zw7kOzVwoleEpj/fvKAUQV9pJjatv0CNIcgz62V/LxEhuhsCnB26
         vsN1Tm6ph5TkPlScUNhRESdT/ZnEOu8phDAEQAH2ld/hgPXuPTbd6uG6bP/rc2jSrpF+
         1PP4pFYHNS3FqDxK8ktWQzZv0KY/e4bq285q0NRyljAJZhuc2W+3WkSRsGlMgDNIMlo9
         Yijg==
X-Forwarded-Encrypted: i=1; AJvYcCUMvEBW1pPSNbhJOIXeIyUvg3G8tpIL0egSMiPWC62rfFK1zcA7joZylXLBbBzxQclCU2ni84wPTjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2yTMMfrRXenHnvTis5+ByPLyQaTzJ97Ez+meTEflxhfrKShbQ
	JXtKSg/YPeLLrkahCDn/WvymYrBzx2wEUGGaYU1+OMZkTfndwhqFuuE3aiW4YA9Fgh0=
X-Gm-Gg: ATEYQzzyIr94MIyS/dh59mKsVmfJ8L/MGbvQA9vGNiTXQ3SWmgoDoOmKqGKns8/GLRC
	FZ2UnKpYoquYfYlvQWsTPzy+lA0pO6JhyE/D//gF9OHe3RXnLcClXmsIVENP86TDzhXC5o89/ZL
	quFEzBVyzv3jqdfb+CID6Nsoi3jm4qKZJZm/6hTIZOrsa0YRY7hqnJJEVknZFMpaJ4OBbVjLVRt
	i4/2YzBkGZnWaInkLF7ljVk7DpKHpjh4T+PJJWHYw7TOCzOuF7BlCTV7Ip+BKObGYCb5iSs72r0
	h/XXwQgvfCHrIx6QVCkfzth5XZNXIjCnaz+bnDsckuq71PfQbHrCXtvnkwq9bOfgJVlLmI/Gng7
	wG5ZWAEORki1CbskE9K9V8SJLegU8JIarsq9thpEAmtWGSFpUpCpJ5+aweviJmkfsvlxJqvQ5py
	D/UyJGdqE5g9OtfAEdh2s5DwmK2/lOK+4jHenSJBszrpCLlQXzphXYeWr6a8HxhC+RmA==
X-Received: by 2002:a05:6512:39d6:b0:5a2:a52a:c69e with SMTP id 2adb3069b0e04-5a2ab913ef4mr3011777e87.4.1774965717147;
        Tue, 31 Mar 2026 07:01:57 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:56 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: common: Add option to link clock controller to power domain
Date: Tue, 31 Mar 2026 17:01:41 +0300
Message-ID: <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting from Snapdragon 845 times CAMCC device serves as both a power
domain provider with a special Titan GDSC as a top power domain in
the hierarchy and as a clock controller, where the clock provider
function of the IP strictly depends on top Titan GDSC being enabled,
thus it makes the CAMCC clock controller to belong to Titan power domain.

Today the formal hardware dependency between CAMCC power domain and clock
controller is managed by runtime PM in every CAMCC consumer device driver
like CAMSS and CCI, however this is terribly scalable to any future
CAMSS IP device drivers, and unfortunately it is not scalable at all
camera sensor drivers, which are also CAMCC clock controller consumers.

The change adds an option to describe CAMCC power domain to CAMCC clock
controller dependency properly, therefore runtime PM management can
be simplified on the CAMCC client's side.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/common.c | 16 ++++++++++++++++
 drivers/clk/qcom/common.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..558823e220a8 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -144,6 +144,11 @@ static void qcom_cc_gdsc_unregister(void *data)
 	gdsc_unregister(data);
 }
 
+static void qcom_cc_pm_genpd_unregister(void *data)
+{
+	pm_genpd_remove_device(data);
+}
+
 /*
  * Backwards compatibility with old DTs. Register a pass-through factor 1/1
  * clock to translate 'path' clk into 'name' clk and register the 'path'
@@ -424,6 +429,17 @@ int qcom_cc_really_probe(struct device *dev,
 	if (ret)
 		goto put_rpm;
 
+	if (desc->use_rpm && desc->cc_gdsc) {
+		ret = pm_genpd_add_device(&desc->cc_gdsc->pd, dev);
+		if (ret)
+			goto put_rpm;
+
+		ret = devm_add_action_or_reset(dev, qcom_cc_pm_genpd_unregister,
+					       dev);
+		if (ret)
+			goto put_rpm;
+	}
+
 	ret = qcom_cc_icc_register(dev, desc);
 
 put_rpm:
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 953c91f7b145..7661a01d8e82 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -48,6 +48,7 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	struct gdsc *cc_gdsc;
 	bool use_rpm;
 	struct qcom_cc_driver_data *driver_data;
 };
-- 
2.49.0

