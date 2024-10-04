Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AD148318
	for <linux-clk@vger.kernel.org>; Fri,  4 Oct 2024 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034880; cv=none; b=qFEORHOLQfP5vDltDxJh8+RwPPLY+/CkdvUONjfX1WIVpcndP7RaORYUt/OAzHtSmfrD/f5Z5npThrd5mx7IGmwP0v5R/YjgzXN/1CYBnpOQLkLL/LY/Ez6Jhze7HGOfAbmEjVgngcNxh3P9XvSjS7tY9u4NIvbfiXc7/5L7jbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034880; c=relaxed/simple;
	bh=lZo8fHFMFy5jAJqjKs5OEoJm93DVPKI6UUPQWyMIZUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GA4myVOJr7eFpdI2j4IB5JAoqAVL80Hok92LzvZlqupkG26WA6el4lacr4U2/daTBlGYheMNQipetiHX3bOkQcaxDU70FlYHG5X0HQN+A7ksw84HQCJ/uQ0IE3pSideyqYbnq/V+gh4g7+9WKt85J7H8pRF3zfpv2F+JTfdf7aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDLyoRy3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDLyoRy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034879; x=1759570879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZo8fHFMFy5jAJqjKs5OEoJm93DVPKI6UUPQWyMIZUQ=;
  b=KDLyoRy3f23lJjG/YCXeBos26CLYK2ozCWNSsgmQKIEXq9L+GzQg8PCs
   71asUEAVnXQMYafO6uzE8FXPUFw2fDlkXN4hSUYXC1aTc37MuiUTvNaFi
   nAh9zwsWMtB4oiI6OTycfQlwqHj/31YrRF/6RDPapVuHvrWg4Qbd4zOE1
   Qt3hRA0MPq4EM2FZtkozGdNvPKKvw8bgk335SDg4+oxOJtAd28i9JXwf6
   wzbIS88MIQIhDJNtkybL4t7dkyjMTKi6dCxImfbLScaT8POv1/6EF7h+5
   WEIx+10Nk0LAx/h/ElSiGL65Q+J/3LgVtXy0ujyuqi2+TKTw+acKGYl+7
   g==;
X-CSE-ConnectionGUID: Bnn1ULKkT9WxkibzqFF1VQ==
X-CSE-MsgGUID: NGHZ7lNmSjex7GQcL/aK5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856183"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:18 -0700
X-CSE-ConnectionGUID: fPKYe/+7RV6LZEa5HFRS0A==
X-CSE-MsgGUID: VbnF3bdRRFGEaDdckqwcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331921"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E8C66120C57;
	Fri,  4 Oct 2024 12:41:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoB-000TVq-32;
	Fri, 04 Oct 2024 12:41:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH 05/51] clk: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:11 +0300
Message-Id: <20241004094111.113436-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c     | 2 +-
 drivers/clk/imx/clk-scu.c              | 2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 4 ++--
 drivers/clk/qcom/lpasscorecc-sc7180.c  | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index d0ccaa040225..3916381ba158 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -268,7 +268,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		goto unreg;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b1dd0c08e091..a8f08ab2539b 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -568,7 +568,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
 	    (clk->rsrc == IMX_SC_R_A72))) {
 		pm_runtime_mark_last_busy(&pdev->dev);
-		pm_runtime_put_autosuspend(&pdev->dev);
+		__pm_runtime_put_autosuspend(&pdev->dev);
 	}
 
 	dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 45e726477086..d2093b15a02c 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -786,7 +786,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -855,7 +855,7 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
 }
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 726c6378752f..402b012a6ea5 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -415,7 +415,7 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -435,7 +435,7 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
 	ret = qcom_cc_probe_by_index(pdev, 0, desc);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
 }
-- 
2.39.5

