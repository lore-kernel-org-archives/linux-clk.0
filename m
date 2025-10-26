Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68B3002B5
	for <linux-clk@vger.kernel.org>; Sun, 26 Oct 2025 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520751; cv=none; b=ofv2WWM9XYG2x6ukk8Ao9QqhFvlD0JBSnSIKoUNVHqBE5ZFT3mqjwEYcDDlmXia2lfVeGE/gvRoKpQ6boJBDswHAvAkRoS7qCEzTKn4VZUhbn/4sF9nMKjpmfKqILA2Z2pQMeXyI5Af6ud4qSSHce/05CcSPNOpe+vVRVtmQe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520751; c=relaxed/simple;
	bh=/WJ8idmdTVW0xynvaxgMdxuq6tLbTzgU7ly7Ov4QECY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2sgzPCPiujvf6H5X5LECm7GfUu12buhbPCEyzsYExHd6o9Dy9YRkA5MM2tYxMSfD0eiWFscAlCTMBBJlZQaJU1cbvscooyfBigqd22af77pYG+UTS62k7yR8cV1qNCSMGs/sMXa53nLYEDQXfzExgrW7tWJtoDsltsJrhuTLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4zCOhnf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4zCOhnf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so3002459b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Oct 2025 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761520749; x=1762125549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+4rHLxk6jb9+WTlkBO1/v2Aj724T4zzmauAn+prGgM=;
        b=k4zCOhnfMWdvMNdATvR+lZrelGH029R91TbJIaNm/js/eKlikY0X3I+psUK5F7TnHF
         n0Fsk2zSa+XbPAyzwx/8b4EeNzLyZ2gzUM2xI6kjszRGhkg8mq1vQl+Ys1miM4waLxpR
         jHQEZmVo3+v9gHWEo2QSLBCNMiDz7sVbMpbB47LKU82dfX7xNEV9aQv9XymSBA4RPPNT
         7lodteKLrVpZxvKmF+6KtR4hw6yXuSfVchGrnJPeGmhv4KnXHgBpJOwz+Zm5mDFls9Pw
         o8SVAVibJ2cwGuuKRv82oev8WzK8GYXrKJz7c1AFwcejzVxrGwtvFPcITTVtqHSVDITr
         453A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520749; x=1762125549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+4rHLxk6jb9+WTlkBO1/v2Aj724T4zzmauAn+prGgM=;
        b=TftTsGBiG79PnpW2+Z4f/s4IO+Esqef/szdhcLhSZcc08lfBoe7gLyObVjhQHaWbkK
         n4kr7JmG7UnJqyQ1Jt2gKbqMQ4horfOF5inRLB7x/KuPlQnFh/TeqjsIXnyhhmLxE3kz
         eEouje3mPthLPcso1JICk0xyXHfzMkX70Gc2s79qq6mv8AfKTs14FqEF9Epx4NbLGH+s
         MgrGtE6S41fo2fpKoDFQ1qcJ24pizo3V29jVraY/J+nW2p35cAuL0H/4G82AgpiL01Ux
         t1C13YTg+QyKQJxO4Jye7sff2JqV64kmWGRstJ2g/sLC+du9MX+fR76eHRnnKW5nKffg
         n6ig==
X-Gm-Message-State: AOJu0YzFHmgLzbLcj1VmWYCSivfHR585FXztHZmrY0Lbev2FkoxMQimw
	RorgJZIAC3N0vA+ZKBvI7bdcuIo9sSK11lyrtWSmGAHIbG2ix0gkMAZ2
X-Gm-Gg: ASbGncuEva9aDmvs6pdcPXLHBrJjcgfkhlrFVx5+p3oevlCXYAjawaXTtPnLFGIUa6j
	igJKypq78rL36IQ8f/ve58LveAUhsB+57dxinvb5D/d6zjn8Q+ONre7kZFOKZw88yjYtH6EPdYR
	tqJmIG3mQa4hufUeQEH3j3IE2IYdu+eI09yULtcUKqqEYJj3syvGPsBn5YxgK9aiKdEhN+58odb
	p+nDGTvLiHBT48oumBN/L7SB+kFKQaG890ABHpBwtiA+z2rzkLbLllH61GgQnqEnfYdCJtqVMor
	D+CRHE+VJj7LinIdUKcd3HtQpSWku5DXU3YK4P7A3QnWTfTePgHePrQYSAGV/ZFS8hMxlqVpKfG
	lnDXT1ebM1CdEdr5U8/9MRm7QRSLqZ0EjnbkK35V6a2iPQkWmcH4tqc6PIdNDXCdvvDHihq5ieh
	r9cDjuY+DRhu/7gIa1LsXZww==
X-Google-Smtp-Source: AGHT+IEN4o7iKPho66M4NW9RdMeb44MBPT3fDS+h+9MUllLBI3rDk+XvZ4kv8Y7LCuF6ZJtVcrt2Nw==
X-Received: by 2002:a05:6a21:33a7:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-334a864aa37mr45862799637.54.1761520749111;
        Sun, 26 Oct 2025 16:19:09 -0700 (PDT)
Received: from fedora ([172.59.161.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e9571sm6242596a91.9.2025.10.26.16.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:19:08 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] clk: tegra: clk-dfll: scale force_val with coefficient according to whether cg_scale is set
Date: Sun, 26 Oct 2025 16:18:59 -0700
Message-ID: <20251026231859.823231-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

force_val was hard coded to use a coefficient of 128,
regardless of the cg_scale configuration. This should instead match the
DFLL_PARAMS_CG_SCALE bit, use a coefficient of 128 when
cg_scale is set, or 1 when not set.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/clk/tegra/clk-dfll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 22dc29432eff..3362983eedcf 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -882,7 +882,7 @@ static void dfll_set_frequency_request(struct tegra_dfll *td,
 {
 	u32 val = 0;
 	int force_val;
-	int coef = 128; /* FIXME: td->cg_scale? */
+	int coef = td->cg_scale ? 128 : 1;
 
 	force_val = (req->lut_index - td->lut_safe) * coef / td->cg;
 	force_val = clamp(force_val, FORCE_MIN, FORCE_MAX);
-- 
2.51.0

