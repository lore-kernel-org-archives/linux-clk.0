Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BEA39934C
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876263; cv=none; b=Dl+C9goNWOCjgrDRw0p72/5G5oKCeQwpz4Jnu18XDHZQUR8FNc2MR75elS7ufEk4hnXrHvpmkUx+LDaVG6/tMTomEsoh9DkeLWpEH0BtPXQBefaUTxiL4X3ewQHR7JPgfwuYL/dzsjksJ3KIXzLrNJ2CyvNvyEQTylY/Vj1YWIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876263; c=relaxed/simple;
	bh=8Rh/zu+0J4RAEvHq34N6psFLh7K+nx8+OCh5rfOP99o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRxg2Y+Bg6m8CWHkiXvutEF9jTyyh8xZF/eM/zi87Behr9V1p+MOLW28Iw9C8uAD3A6ANIPrFn76OZxT9k+bKGkkalmy62ijkxY6A/mBR/eIXTsFSMF3jL6Lxj6yOTpxBRgojepoqIgryu5EDtum+BgtmryMGdt7AyCrLzxk6RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XslaysCX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XslaysCX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso1577685ad.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784876262; x=1785481062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFWh6ew/pydJFdsFyG7aVZo1Pmk60G2LsADk/y6fmbQ=;
        b=XslaysCXHOdySvXayrqlUBqaGIq9zVQFsSZOGyszQbByxP9839fFsqJiUv2xviHy3l
         zxotGaaWM/Q9ZXJLLaVzusHY5jWloW7EiOfjf/A1F7+5Iah/leI6fBOb8CNBGktQbQF1
         i5yQufoBrE0Bigk2uPIlqtql6sgvrNNOarlE5J9hsVZmVpRmhJpqtr2XMRHkALKgsYp+
         /ESOZzlRjJszxxrT9oalEdCcNx4iCmXfUq6Rmy+rmaMREVyRqWAWk2u+nf6KKkH8vBC+
         BIbHfnMfzbMx77Ro2f9HyTGInDdrrrYQYjfboEdzipRH9z/17N3lI3kKagXrvEMbYSlt
         Wtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784876262; x=1785481062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFWh6ew/pydJFdsFyG7aVZo1Pmk60G2LsADk/y6fmbQ=;
        b=QMyuxHU0bqj1P8jXwUDZ2hCgzaYaFK5jqd/Se4PdoqrjOHKEuIfN5NG4JA10tKlV9z
         pEMyaqDjAgdAG5sFbOvmqEX/Yr9azbB7ahHeviHJOfRBUK/8wPLgYY0dXiLksTTLoO5e
         5cp1rbJIA7sM+JiV4PG8VOsIi+A5sRXbt7MQsjxIQpCZL6GlpucKq2Rb7SXXYQqZXmwz
         V3VVBi/IFPZxG3fEHeo94H3uobsUlFl1zBeNmtKVP+l0Nm2cAcvdiJDJx39+fYRHt4r+
         Q2twlKmHqi++2qP1egd2HGncgQ4+Pksgagf46oHty/XnTJA9PQXzgCwsjk8Kzni1V9D/
         eDWw==
X-Forwarded-Encrypted: i=1; AHgh+RrTEx0o4zNfY1gBhF30WjGs1z9Y4pT6qg68/qhG2OMNXWdpxcl2UUqJf43a8/ueWYeHNIjxahCDIn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfp/GEfy2Xbsqvawuf2424iEWCkrB14u4/4hdm3f1npStQTi0Z
	MsSvAR486Ll1M78Z2GqXnTuhZ5YGxbgVHvU5bRuqsga0TqvvV4EtihSMNB+hAA==
X-Gm-Gg: AR+sD13NBImIKNMBO/Yr3fdG1KprhzMLtfPLcYz95S0R8yBQp1zmHmhR9RTbQUCD+21
	aQeSwblz8AEsDxTNqZMKl/XUtjOt/Folc0EajKkhGrFZ52s0tUN38NpDv+JuszsZdl3Jm2bPLsj
	N6JNLiK9toBnrydRRHlVtibRzuXv1ocXKLkuJaGDF8bsTCJqow8iEGgUFbGB1UZcQgn+pPnlzkD
	RkCOIBonyF2hiCgbyabPi/zYiiYALFaz5q6RquMLCXNyyGLO0rs45/SbdjfbIb5YR1B2DHlFo3P
	pJBVWoxBq4zvIcTV4bKIH0mfn/hJIaL5F3BzJXXNC5mgfd3YJrteAmRGP50lnBw5F61J/qdIABN
	ugru8JS2UURxXmNG4psqQvrsbirfqGKKR9FcysEAcmiIcpBnDCnb7lZVTbEkQzGYi6hAmxaBYF4
	bHIHoL/mHkyGExrpIuEAQQJFGmWozs8jHwmi46xTwr+4SBCBcJFhYlfB02aBjf/cLBl07UOpwjh
	YhiOPLlE6oIbYC0MTD3VA==
X-Received: by 2002:a17:903:1b24:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2cfa6c51773mr68789715ad.24.1784876261697;
        Thu, 23 Jul 2026 23:57:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e5f17sm47985635ad.41.2026.07.23.23.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 23:57:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: rs9: restore cache_only on regcache_sync() failure in resume
Date: Fri, 24 Jul 2026 13:56:58 +0700
Message-ID: <20260724065658.20405-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If regcache_sync() fails in rs9_resume(), the function only logs the
error, leaving regmap with cache_only disabled even though the register
cache has not been synchronized with the hardware.
Re-enable cache_only on failure to restore the state established by
rs9_suspend().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/clk-renesas-pcie.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 2f6d80ee77cc..a2d7417e05ef 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -370,8 +370,10 @@ static int rs9_resume(struct device *dev)
 
 	regcache_cache_only(rs9->regmap, false);
 	ret = regcache_sync(rs9->regmap);
-	if (ret)
+	if (ret) {
+		regcache_cache_only(rs9->regmap, true);
 		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	}
 	return ret;
 }
 
-- 
2.43.0

