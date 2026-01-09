Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA62DC337
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933245; cv=none; b=Enhme1GUOEqh048/0XlLK5OTkrm1I4cs158g0uw2A1nZ5U/Jlnw3dGOkfsLaqRNVjSYMlyfNB42ScxtqvBFXpr70OTENbyWPE6/ubAFahw/53aIzDhEVHVwuibtI8psBYWEB/XvCzIUCFohtK/9Jezad8hEVmJCdxLSroD/YyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933245; c=relaxed/simple;
	bh=5f6p0MjIoVb94q6Yxdkk6cMxfowH7rGbCR5LyjqAQyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiviT9NpKyJ8vkOFHEO/HELPqLXGmS6Iq9N8dFtNqQ9ARnqXrfPriCnQC4PstW7HZU9yya6h77FIRU7H9jofZ03h9XS4POI8YTfVb2J2lUZIQDrkmYS20rXmenh0d3n4kLXO3kYio5+LVVhFQc27auw0UjxRFEfGhztMp13aiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akkoRoVL; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akkoRoVL"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-450b5338459so2434854b6e.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 20:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933240; x=1768538040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=akkoRoVL2ooyD0aS66WYGUlwVjVpI6hifX+HiJliL3WQlvlk9qq5xMIPnRXMSXFdS5
         pfKghQQGsescD1Sx/rzRp6ualLsuhK2Ma+stXU4S78hFHEsmYpRthZmJMCBnlXGCcvuj
         Njxca8mYlMvmhjM/HymVZRyzyUoIm2Ab/CZhn1ENywLk5zzZMFsLNrfyqKwbrmIE0pae
         7P1tmCl5OCq1DbTEjkjrn7XcwC5TnfEhhjSaQm0y34MCAxnP4juK5J8ZWqealSYSJIql
         eIxJyd7wg7BEJoiLKS/X7ZbGdUg4RgpIuqdoHTpiC8f2E0C1nrvL1SLgioy3vPNlhfCb
         +vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933240; x=1768538040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRS9gGAPNZv0m+OPKpcvbvMDMuzC8rP8cL50+cIuJ0c=;
        b=pJo5TYNt0hWYCFNtXcEm0JghHdJm/z32BeSSgmSwN7yi8eBJCZkYsgSpoainRzVqlH
         kMe5IhO3ESJ+NGKrukr3ToOrriAZwBWNM2LHuMr/ognnqp5Mneo2HBwsDRMDrFmVRJQ8
         rLA7BzSrKj/MZKiMEdvmkDlmZWt7oCkikMfhwYE4B7wZJcxPnW5c/pO3YVTNfs2m49uF
         ilUqbemqBGCfn4rzzmvRcqoNpht5QIv1L8iaxSDsvhji+CKvpYEvqcNOoUHiQ1wKoyGV
         bRM2K01nm++VHqtGTAFlAGhnCmRQu8pvcFmmyBvfhJ6QQUeof2AKrb7IsP/HnGRSgdJ8
         Eshg==
X-Forwarded-Encrypted: i=1; AJvYcCV4OpZsWc7k9soAuF2YXpk7HkOslWn4oFnk2aeecsJhaP5dDyj9P7jXrNco8gOFqlNDexXM/QGObAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuE0JAVTIIy8BWJZxJJCn5GYS1PDzYhYve+skypCJWi5jf25tr
	Uf1qSvB0xZsilJXmKpKbMQaC6CgvvoWq79v9D6zPr3bAMiRmFp08S3hv
X-Gm-Gg: AY/fxX7Dsz9GHR0NvNpY7DWpCnsKQ+3tq4JqYMh4Sw78RH4oRPiAxxlKAYvSN71g/KN
	e7ikp+w6f4Y+eI1U4Lecxlnfw0blh37KeeI0fk9t6SMFkiotRZ0OaNHVuV73P5v5AXXJOnSLt6B
	v6gTVBzBodJkBS49vjFRYMvK/wixpxTMlllHsSpWBARKuWJGhvSuZIRry8tTcxcDxy/6SYqSjTG
	n5NkT88tJaxODpoV2fSQXTLT/DkmgC2Zbe2dj6XGrIVLHa8TR+oqicIBYCVGUfh+gmJmxA1RqRY
	F5PcIfIeYwN8TOpn4ZdtacFUwshuf1MEN4DMlF/QZOmkNc7iCyJRVmMtljq7DzEPXwwwgvPzSSy
	XzPUHz/sZQhyMxPbGMcUv7/oxJX2f/LoouaVttNuFLdV18/BjknyOmlHM3zd5kxc9a0UHTr2KPG
	OzqjTPYyqkM6FdLCpeH6bMAbdhba2QzrDM9vJCYGiWC15xLAT3y7BShiefEFDhfFc/qXgfeHD2P
	OoGQx+DDMbJyAffbKosiJm+PLQ+
X-Google-Smtp-Source: AGHT+IH8qFTLvCobTc/CYdKIqn0h+JliChB6LnP/bfX/6ft/VEkThcEwU+4hDQ5PgxrGSgk2Rnoa/w==
X-Received: by 2002:a05:6808:6a89:b0:44f:8b8b:5dcd with SMTP id 5614622812f47-45a6be987admr3631854b6e.50.1767933239894;
        Thu, 08 Jan 2026 20:33:59 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:33:58 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
Date: Thu,  8 Jan 2026 22:33:36 -0600
Message-ID: <20260109043352.3072933-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the clocks from struct q6v5_wcss are not populated, and are
not used. Remove them.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - no changes. Moved patch to the start of series.
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..07bba47eb084 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -123,10 +123,7 @@ struct q6v5_wcss {
 	struct clk *ahbs_cbcr;
 	struct clk *tcm_slave_cbcr;
 	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_sleep_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
-	struct clk *qdsp6ss_xo_cbcr;
-	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
-- 
2.45.1

