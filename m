Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FF14884C
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905443; cv=none; b=ihKKLwEMJv9OFcwe524YymkKDQVKsRKZE/3QDY7OdpelEsydBas/kq7gQveJMBxs61Mm45lY96Q4G7ckCt9Do7Cf8h9eyteTsETaf7/9jD0jFe1YBV3ylmJK3bGTBFxzf8QuB8n8Z1LEXhjNGsntrvsNVJEn7VK8T1rRH4tfQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905443; c=relaxed/simple;
	bh=n9yKBX8qjigC7/F1M8bGWOMSsRVeFv1nqroVB06gU6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V37euGJmUfEpAbBea1d7afP2xsvzFTYGeM28LEMPnIoql8vtDh4n791bFz1XlcT27IHIHHCg5IxMyVtQtQnVVD9fwUf8rCp/klODWTUi3oSxmzoZMZBKBO06PGcmuqguIVGuy9kX7qZIYpkpd91tOfgSdy4wsSSrqw8gK3TBKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrnYyhEn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrnYyhEn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41a72f3a1edso20063015e9.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905440; x=1714510240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbXwx/HNBBmagZEhDQ/BaLCRVM/2fRQKE1iroB24Qwo=;
        b=yrnYyhEnOKtUI5APqUrLIGkdaBVwqLwltxjoo3rEiYHgDy3vtzPGG1JIAcv/jCkHHX
         Y1JqXXX1hARwF4/LAlhpQxGFsEQMtlE2RFyDr3Hkhg7e0BF5bmT2f3eqUrCb9aXzYjZv
         XwPaefIT5P3cJ2XRUMXZGoxTht1r9dTIDiocRCavryAE0CU+gAEM879+Qh9lFYlLkFUA
         cmae8l/0gwlfmP8b/W34RHnNRqp6qofVyOnd1BiVULbsFxijJCzR2qsusSjiyYizaC04
         xc2vViHYI5+YPGqlp3QQEteAeqHsO+spp8M0nJKvQEtmaynBPagEOeTNqU5m30RQljNz
         0pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905440; x=1714510240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbXwx/HNBBmagZEhDQ/BaLCRVM/2fRQKE1iroB24Qwo=;
        b=PRq7XZZ/RSASG3Br3SOc7IOoQypDhxpNFwnYMbgcOtK4PMLJ/JY2+fsra/Oc3q0+Xp
         0hOQeJtkXDew2I2YEhQa8B2vw2eMK986TBna3wpCpemX3UqTmMfPlinzblWbNaacvXdc
         /qMMx/uhbOSNtTndt8DnHlHkcUfCF5En3TF6VmYMHK+tjHPrarET+Olp32KuP3rv3jOp
         nkGsmm1TJ0DvORBGn4zaECFXWKpQ5pw5blhKs3ckqSnuABgFMc8zpNlGUmRh2KpW7mab
         Iu1H0AP5P+b60OYK68sYuiA04gcniVCitQIK7SilC7Zjrgmv5NbMBH9YFr+j5DpD9Mz4
         D2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWeicLxVuA4HOE8W3pGLGSSO7WRyZtukXn7at+MqpIn+0/OwVZAdR0eB5dyuCOlxan3mSLuAVkS1x9nukF3N+cBjLyQpGjG/SEW
X-Gm-Message-State: AOJu0YxXM439NOPpBrmhPKKfjWcHk7u97PwHmyVRbG995ruyaItmA9OU
	45TbzgU3yTXtfz0wSJvpZkRGOORb+Zmte2zbo+26u+PLCIMIYhwyJXJRtLezm7c=
X-Google-Smtp-Source: AGHT+IHSIqtxInKq6iiYNFNJ3kqmhV16rsXVp7brkjqIWHMJnipiSbohaGIAsxP3Imlg1RbkqgCLdA==
X-Received: by 2002:a05:600c:35c4:b0:417:ee98:dfac with SMTP id r4-20020a05600c35c400b00417ee98dfacmr271852wmq.34.1713905440049;
        Tue, 23 Apr 2024 13:50:40 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:39 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 14/14] phy: samsung-ufs: ufs: exit on first reported error
Date: Tue, 23 Apr 2024 21:50:06 +0100
Message-ID: <20240423205006.1785138-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To preserve the err value, exit the loop immediately if an error
is returned.

Fixes: f2c6d0fa197a ("phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle() to obtain PMU regmap")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index ffc46c953ed6..6c5d41552649 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -99,12 +99,18 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 
 	for_each_phy_lane(ufs_phy, i) {
 		if (ufs_phy->ufs_phy_state == CFG_PRE_INIT &&
-		    ufs_phy->drvdata->wait_for_cal)
+		    ufs_phy->drvdata->wait_for_cal) {
 			err = ufs_phy->drvdata->wait_for_cal(phy, i);
+			if (err)
+				goto out;
+		}
 
 		if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS &&
-		    ufs_phy->drvdata->wait_for_cdr)
+		    ufs_phy->drvdata->wait_for_cdr) {
 			err = ufs_phy->drvdata->wait_for_cdr(phy, i);
+			if (err)
+				goto out;
+		}
 	}
 
 	/**
-- 
2.44.0.769.g3c40516874-goog

