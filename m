Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310D213443E
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233645; cv=none; b=C60Ox5/YDicvcW+QmUvYkoCNrvmRy9u8/I0HDkUD2ZGEZuQjC0MrVg1+cd9NmxE0YCIHrNEOQsgP5iXYZnEdjKiq3zheaWF64jV9VoJrOy2OfmZFh1AlOosldcUz4CaEDaqnRfT9PdLwM+jhmPz8fACQb0nh7lfjSLGQ0WK9Obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233645; c=relaxed/simple;
	bh=ZHKCf97OijWc2VffmsZBpB7qLb+gSrxVQc/YXEeVJNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vnlaz39VYb4YTruq+/nMcHhjjhK3TIV1Eohm5DtEWjryP0YEQUAwnBHIOxu7bynLqdpZgrf+T7DAa5qfnN7g815ecSSZcRXveUKSwLngDN8xq36ngJtxtxd8BXHEnH7DfD9tgn8sgGUfpJCqv7eYxy98gnLr57eYSrybn405LzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hhe3K7Yq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hhe3K7Yq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4162b016168so3160555e9.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233641; x=1712838441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyUUQp6WOxRvluHXSIvI5EfrW3GeehtIyQz6Nkgdpu8=;
        b=Hhe3K7YqTmMEQoghiyRYr/zoAn+h5++tRlrhAsHCzfFkGdmj5HZCeAkqX5Yr5bIK3x
         5lE+aUw/9fRGz1WyaASMmqrYLqolatlpj3JV2N/J1XtVRRMR2QAL4p9hslMeT/JFkphV
         tpMX7f94nQ2zt6YnYPyEvEQDkbigRUgMu1hT7KgzdjeqyWKpUYmja3jV3DoJCAo5Gsgj
         tGz3yb6WASJRZ2QDuBu3S4jSBd9XZjVNOpSF46jvkrSBWVS87lK5qdGa2mOzdqvj44sg
         O2oE1XirsTmQ16+K+sSfQLwbmNC+l8KqZonbogP0FL3SF2e3brWjPKG0TI+iqh43ugjB
         QjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233641; x=1712838441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyUUQp6WOxRvluHXSIvI5EfrW3GeehtIyQz6Nkgdpu8=;
        b=kqEwi2PqVmWmS5R5zI13OequBKhMMsYY9S+YA+UcuPiyqlseDFlDVqc8Wp784GuFUV
         5Ah7/9Kf4MulbgbxRxeIl/OHhRussNAfA9zJKITWK3r46rBbu0jWxu//LaRlj2WchOrP
         1Hx227eY6My50wqmp59u6J7c7YtnwVijre4XfN9JHtctua8PSBEddipusrIV0knCELDf
         irIlpERkICRQhvFwiC9tljOKIpmdMz6Hq/8pC1xk2Xyu+lfECcfHFPPwVrghRv7XzeNV
         CUXxpA7WDclCBxRlchO98q5N7cRHoXjMydX7zrWjwLnURpEKIsZUGkyZZTqmnyXIdGE5
         0tXA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7mIKc1H55BfpuSwG4QcT8EXwqHnU9WD17EZd0kDNIu2YO3/qfQAyG29tOrAB8dKGE2JcCvFQfT5z6+tR6USuCLJjsQcVREGC
X-Gm-Message-State: AOJu0YxVM1j4NRjTmhKhJHxVDZG4/ulviLaiqu7psFVAJrEwE9L8pNoc
	T4BHJsbTayKPTrFQQaRaOiXE+zNeDZm7d8X/zd88WrtqBuYTkfKG1wPBT5/D3f8=
X-Google-Smtp-Source: AGHT+IEMnaWns3sPAMJ91nDBk0kRT98vdLD6EXIhsFu+f4lEueXgTLnJxBfN0OJHTHTi8CWqnrfg8Q==
X-Received: by 2002:a05:600c:1f84:b0:415:6cd7:9967 with SMTP id je4-20020a05600c1f8400b004156cd79967mr4750373wmb.10.1712233641601;
        Thu, 04 Apr 2024 05:27:21 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:20 -0700 (PDT)
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
	chanho61.park@samsung.com,
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
Subject: [PATCH 12/17] scsi: ufs: host: ufs-exynos: Add EXYNOS_UFS_OPT_UFSPR_SECURE option
Date: Thu,  4 Apr 2024 13:25:54 +0100
Message-ID: <20240404122559.898930-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is intended to be set on platforms whose ufspr
registers are only accessible via smc call (such as gs101).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 +++-
 drivers/ufs/host/ufs-exynos.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 734d40f99e31..7b68229f6264 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1186,7 +1186,9 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 	exynos_ufs_specify_phy_time_attr(ufs);
-	exynos_ufs_config_smu(ufs);
+
+	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
+		exynos_ufs_config_smu(ufs);
 	return 0;
 
 out:
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index a4bd6646d7f1..0fc21b6bbfcd 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -221,6 +221,7 @@ struct exynos_ufs {
 #define EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX	BIT(3)
 #define EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER	BIT(4)
 #define EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR	BIT(5)
+#define EXYNOS_UFS_OPT_UFSPR_SECURE		BIT(6)
 };
 
 #define for_each_ufs_rx_lane(ufs, i) \
-- 
2.44.0.478.gd926399ef9-goog

