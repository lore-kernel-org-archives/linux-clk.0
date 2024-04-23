Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD1146D4C
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905435; cv=none; b=ilL8uyR+dcP9sAxLi3UJbkNtI6DZVTcJxQds+rdGlUwVZ8W6sf5qMUq37g4mD0qIxjRoTb/zy100Lnc9Vekwwuz1aTXVo4YFE88YXEA6R+keWRM3RcFqkqctupTVWNRFpTmJFtuI5S1+XL3G8Azo4NFzeD+fOpdIyD4+ya9FbNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905435; c=relaxed/simple;
	bh=PMGdNnxS+u6EuMG3EBK442Fl1ePQX3CaF6GlOMeIhVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqCaR+eHr9id8nYNIrBrerubsmpfjDLp9+V0O+wfBhNxei2dS9/Rk/Wl2ScXLe7+Wv2x3eCiAFFtfGTzyrddr7jLqRGFhfEt3uwr106Rg2VWesNw4X86jcdbOtEmAQQcbS7cnrPSKp/T2w8IS+WSl0lLnYc7K/qc96ouoK0OspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+ha/ERu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+ha/ERu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41a72f3a1edso20061375e9.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905432; x=1714510232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/GoVzExBpe8QxX9A9OVe1Uavi5SgYLv/AxKVNUl0KE=;
        b=D+ha/ERuZPze70axK+sIkgjvR2RQnq886MFd5toHxCObFk5521BzLv3dedKHxmIBkJ
         5o7Be0dzbDoIKoWL/mvrKwc4Hd9gsrnCmMTn29ossR1F6+TcvRx2w4KG5BGYB/rZRd3s
         +t2N2N2WB3IZpO2mOzIX7I92LUgSN6A/nJ1l7rW8FaEB8qGov03UbjZkpPEyy7q8OA63
         AlVF/xLAuWThWIRtLJo6cCAtAsRGaJP0elhUEqOEvxcaylIPLLqDvKFn/cqUavU4ZF9V
         Zu6BNQam9ZHm8ZyaKA5h5g5XN8f5LB1/gqOJVeCvO0jTcau17xvgCMnQh7zE4+OrIZQT
         yuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905432; x=1714510232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/GoVzExBpe8QxX9A9OVe1Uavi5SgYLv/AxKVNUl0KE=;
        b=pu8VqXJPZKCQlZi1h5w8FCOA2mhcsG5JLIbF7PBU8hs1VVKoWivIiv7f7aLFd9ZNa1
         hpCGVb5yJiuTVb17RGwIYPXsNEqbbJ5z37ecLZ5TEWHas88AVpFflOIf01R9FObEqbJc
         +wpu/BZR0UobPv673Ir/8sK2HuyB9a/u+GSVvA3fmUpmuHlMQSDn99SHmYQlIHHmniZg
         VcM2P5OINrEMT6zVvQBUzWeGTm7C4x0QTYHlgtRvZehcQUyx8AE7WmmoDJX0IiEDuhiJ
         nXM1pc4AXHTBDfaEGgTq8ck4VckRVMvw4wcmtM6SG9TYMobcFEHdWyktiLWYa8TBq567
         7LTg==
X-Forwarded-Encrypted: i=1; AJvYcCVzpksKeBXbY9FpGuBvpziPc8GF67QpM21dW/Hjnzvu6Ytf32+nE1lZpHTBAKz8J5uwvTJ1eBz/b4H4BSpoQkU5klxcweI8UNGR
X-Gm-Message-State: AOJu0YzsG6qetqTm3hGHGr/dBSPlPBYpcZ8ntygp0D3v3qDq/zV7qwIT
	Iiq8BGCJT0J19eB+tq2hODQCD83/S6Upy06GZiEv84OGjEHcbqdB77RQziZ6hO4=
X-Google-Smtp-Source: AGHT+IH6z+0zlU25050wMvD0vuxotNnh43coyHQIMqF5YmCpBQNXBCfzRnt18Ll4b9pvC+KY+bIGQA==
X-Received: by 2002:a05:600c:4590:b0:418:f991:713f with SMTP id r16-20020a05600c459000b00418f991713fmr263623wmo.23.1713905431899;
        Tue, 23 Apr 2024 13:50:31 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:31 -0700 (PDT)
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
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 10/14] scsi: ufs: host: ufs-exynos: allow max frequencies up to 267Mhz
Date: Tue, 23 Apr 2024 21:50:02 +0100
Message-ID: <20240423205006.1785138-11-peter.griffin@linaro.org>
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

Platforms such as Tensor gs101 the pclk frequency is 267Mhz.
Increase PCLK_AVAIL_MAX so we don't fail the frequency check.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Will McVicker <willmcvicker@google.com>
---
 drivers/ufs/host/ufs-exynos.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index acf07cc54684..7acc13914100 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -116,7 +116,7 @@ struct exynos_ufs;
 #define PA_HIBERN8TIME_VAL	0x20
 
 #define PCLK_AVAIL_MIN	70000000
-#define PCLK_AVAIL_MAX	167000000
+#define PCLK_AVAIL_MAX	267000000
 
 struct exynos_ufs_uic_attr {
 	/* TX Attributes */
-- 
2.44.0.769.g3c40516874-goog

