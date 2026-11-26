Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678840;
	b=RXSkcZ+tYnqrH8Hwh7futaKhXf7wimZQQSFr6vd0bOEQ+GyuiPsdnG1uhVX9hP/udi7a
	 qgtNoZWV+KiYJmsENVH4G1UyNqNkQWw2tcOywULIcW4ZKXC9ytqGOozWk4qTzo74pIMS9
	 FCYAGita/y/ZUqlkPtPt+UC9lOd9RfT7G8zW9d7KGN9NSTeFNsZrssq6lvEAL99QDv8OY
	 dM7jw3EablWUEjoLbSDSc6aUXrkepMHiHklAioQTvokzPJABvdiCqCMD0vDW8+jlEjzed
	 y74BngSxvLSAf3b3cSSPIbT+7IRy7OlR+j+fgumBwr+PPLn0XdALbaOmfSbheGZVqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
	b=fzIypIU7gpXHKUYMpUTteEYkXTsA50baDf2GGxTfR4aDmNyt4ga8B4yvV9o5sTMn3x8j
	 rrMmYS/QkZ4F3qbOINAPXFJwGkSM1ze0DXYo/EgV5zJI4rVCsJcgYAQ2mN8LbUIXk35IP
	 04qoB399obrUmN4VpR3pmNLA+gu/OqOk5FghTpC0I2v7+SAq/1hMtu7Cw7OBdu9hnT7Ja
	 z43WJpT9b44XNGayiMsLfZ0EW5tehT628xbqH+lw31/JlLnV0T1E5kt/1aMHP3Sd0BE92
	 4f8CZQu0cdhqHY3r0AJuQQfScOn8OZso5apmXNPULefO34nUMJ1bDchRh+eBldVtd0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="KPRp/q+T";
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE4606A681
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCE4606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KPRp/q+T
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so614117e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 23:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795678838; x=1796283638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
        b=KPRp/q+TLuJ20jc9mdh8lZpNqF2FF88uaWsZYI85sWB2spakz2yRk8BqDRKnbj5BJT
         vswuJXSKNMplSJO+KNTHQUHAP/4F8ErM3jPH10HNhbSgFIIU5tgBJCnBoW/zCz3Bj82V
         vmmOYAiNb/jAR0YQJMOI3l8iQWes8T6spXGFovLFCR5frEvEggA2s/7KHL6wUPg/z285
         txscXjQ9RWogWydQ3TVNOO89LhydDs9CsJ+D0gdXtumGEQ0vO9D8h3zDhevIpZkoXsn+
         0LHQRmWkVLwTUSJ9UJqsQZj6+vAi6iduqOU7/uVIF2BsFlxESIjq9X4uw89vgExeiV4N
         BCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678838; x=1796283638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
        b=GYEbiU9KhjWVJMCJ2UpEXoNHNEzI7ET7HnjrxPqp8oXiYL+pzNpyPe3xjZCX6ThU10
         9qLByKDtjdlA3It0RLTzgFo9tka8YTjhY3pfJLUiLiiQCuAI9VV/5c2aa/nWUcOFugg9
         QajXIHyS974Jc5yDfqZmPxAJ7oYjOKTWG+8MsO72dW5TuMQu3dJnIYy93Pi7FXkiSzRL
         vwZJr2BXV4B91ZToYsaysqTqCJhQaKj+YoPKws6sbwX9rYowx9n1KGs1JD83hFKJ/WEt
         cBZGFAEtf+gRA1ZbvyH5rxMGCb5ds2JJ/NMouB7f96NZN+n+3BSu8FKmJT9z7olTC1N5
         IthA==
X-Forwarded-Encrypted: i=1; AL+hErFpc9lYK2x7f9s/CqjGYyagCOBeF0GtnglNIebnn7ViPaz6scyvGs0T56wM7gBT/hkD9Z4/QvW/acw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c93iyKiMj8iZll0YACS8zeXlaH6h22olZU/g2xmsR5BQjfsQ9
	5+3tfdYMdSgoQLTOqvB0jnk11bt1yPgloNn6L75kfcgl401zB9yLSN8LPtyot8b+lhA=
X-Gm-Gg: AZFdTZdEV+9J84UfGQ/ZdLN5fDiQtfcjd8NkbugqPhht1iO2gR1aH7Z1P+0I5xxOaC4
	6g/u/gOh+8IAYZIViIxA7mRL+aOG4A80xs+Wp4k9kDv2WEk71xcIO8Y1TdARvDjQBlOvwvSrjlj
	AI5rp5jVeDp0/MjgWmCselWSDrYCEMgFXc8xEGWPNmA120l1DdF/rGrRMS5wReXPEFL8TiqYH5P
	EC9g1A7UtfV7SfNHYGt/0P4RgIOD7Gx8boFUh/hWfFq2IZgIuM1LCtTbSH0QYGXxda0ZpxgWG7o
	gp/7E3qOvB4KWaqq54qSnoptRSDo7Wb780UW01u6ItWnAm8Fbr5kAImHrpBQMSufYK8mdlPUvkZ
	gPYsqyXCgRTzo8M7Nb1YFvwXlz1ElyURXRtJ+H28xecIVrnmuqYJD7W7JbIgdSQGnm5ghQqrVHI
	5xEuw4agRDXLUDv0Nrc9W3Rqn7B5c8fL/T4fNFQk1ulCMXinXlBS30+wnyOaKTY3uY+urXsare8
	0tOBPjZ1gjqmRBSse/DVS6wYAqvmLp9FWlol3f0rklviMMclcTsoAgHFAv08dBoEDrv6gK99c/b
	yjXn5ab0Q9mura25zqBsAx1YjHQc9q2WGHCU9XzPKgpyRN7toIytIt214tdPYqnQZ+cPcA==
X-Received: by 2002:a05:6512:65c9:20b0:5c3:17a6:7bb6 with SMTP id 2adb3069b0e04-5c317a67d6emr2319241e87.5.1795678838158;
        Wed, 25 Nov 2026 23:40:38 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm4984521e87.64.2026.11.25.23.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc-sc8280xp: Remove unused PLL2 AUX parent of MCLK RCGs
Date: Thu, 26 Nov 2026 09:40:24 +0200
Message-ID: <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
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

The parent data of camera MCLK RCGs has two entries of the same
camcc_pll2 clock, one is for the PLL2 AUX output at mux input 2 and
another one is for the PLL2 early output at mux input 5. The PLL2 AUX
output is not used in any MCLK RCG frequency table.

Remove the unused PLL2 AUX parent, like it is done in camcc-sm8150 and
camcc-sm8250 drivers for the same MCLK RCGs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..e260b2983e4d 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -33,7 +33,6 @@ enum {
 	P_CAMCC_PLL0_OUT_MAIN,
 	P_CAMCC_PLL0_OUT_ODD,
 	P_CAMCC_PLL1_OUT_EVEN,
-	P_CAMCC_PLL2_OUT_AUX,
 	P_CAMCC_PLL2_OUT_EARLY,
 	P_CAMCC_PLL3_OUT_EVEN,
 	P_CAMCC_PLL4_OUT_EVEN,
@@ -510,14 +509,12 @@ static const struct clk_parent_data camcc_parent_data_0[] = {
 
 static const struct parent_map camcc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CAMCC_PLL2_OUT_AUX, 2 },
 	{ P_CAMCC_PLL2_OUT_EARLY, 5 },
 };
 
 static const struct clk_parent_data camcc_parent_data_1[] = {
 	{ .index = DT_BI_TCXO },
 	{ .hw = &camcc_pll2.clkr.hw },
-	{ .hw = &camcc_pll2.clkr.hw },
 };
 
 static const struct parent_map camcc_parent_map_2[] = {
-- 
2.53.0

