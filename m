Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9F481257
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496545; cv=none; b=VruZWqlCDOltcLimZqDoe3KSCGhFpGqwJiZwxuxcO7Tsb2BCFePRY+OHUFRNqUION+e/LTncY+K0OJEjGh/wFW4IBEtYhK2HViwlHkKR5g+JCmXLajvAIRgXACTWrf1KsmBTUym5h8RER2RPPjSa36Lvp8ePABSu2v6D65FTxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496545; c=relaxed/simple;
	bh=KhCbpgV6AqhdwmwMlKi4yi2ia3rmtjcamegp0BrEsrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc6wHF2QfD5oUBcSP3c1Xg9N/rfSXixUSqcvpDBprRLqqsvR6Gusv6lqhXQjRua9yaPeuFgtjwR82yuU4MQrvgFQW7CXhmPszmif/2yt6Li1MUlYF2E/jG72u7qmOSaPEerm6ZvFWWGbSrJ9RFDZzhNuyXaV5YUQI0o5CwFdcso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNABRc1i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikghDgM/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNABRc1i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikghDgM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
	b=gNABRc1izLwADxlVq+NaPfjRAvdTkH2svyQkI427WZBchBvGHCbJl8v06WIwB56QwWzq+a
	F45xHRhzHqMEKFd/vl1df2J9AZS4YQPtH4Ya45yn69Vdn5AD9ni4SVL4S9HAfPLXawVSE9
	0tznDarHagm3dFL0/HOi5K1e7xwydJI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-q_KT_xbEP26y05bQzsmOvA-1; Wed, 03 Jun 2026 10:22:21 -0400
X-MC-Unique: q_KT_xbEP26y05bQzsmOvA-1
X-Mimecast-MFC-AGG-ID: q_KT_xbEP26y05bQzsmOvA_1780496541
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91578c374easo526220585a.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496541; x=1781101341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
        b=ikghDgM/jDJyNVfummPp4tEtuF7ypOI+4O9XprVKiLqL7uOV8l6aHtvKhIbtsM3X4C
         heXDxm/1Kl93b5mNyvssYr2RtEkuYUkuC4yq08IKRU3Qo6zDZVIWFt4iz2NEfgAImGbN
         puEVgJIEtJg503GYtLBO3yYKdr/HCdpj6qOoJTzqAIYvpkEFJBQGVLeqT/wjg1hyvID/
         FuFI9PO/QcWnxIuC/bHP7GB+7BH512k1ig8EXiGEQxEYjN+HEE2KNaOu8a+CAcb8DFNF
         V7boHEqorOkaPOVoPTnlqcgFkziHrdNbVWjNklY4SJQnhXvCICDA/7adW+bepr4c+WmP
         ujgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496541; x=1781101341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
        b=FCJXGOUOvJZKRRagwsXDYpHWZsO3IK7/cV5iqEoVc0zJXcagXVZ9YCu6vZrEBl7tE6
         fYP2t9sBqPnwWSZ3t5ZIqZSZWSpdUT14FYWFf+qLLiEPPYg4T4SPZGDkMcvy5NryPLrz
         /YDcvjphfU7/YKuK6H+FvxB3EbwXx9t7B9yj8ckVvcpsEQx6YodP8IG/a5X0rJKy1vIj
         DQ3IUrcEecQFdEupqVIFlqNinJMGQCX68ljLKTDgyxHCee3OtDBqbIFYhwJ+XlCsMjRb
         OvQKV230skimlUDhman6a47f18gZky8+crkgRxe+LP/6Gxzixetpm9JwYkS5ltXOJ/R+
         fG+g==
X-Gm-Message-State: AOJu0YxqkP793bK11qlgAa41QiEKCyU7SJ0PVo0H6954kUS4AB1ZSIj4
	OxTsYdgCUvCnorD/eNA57uRWnvQC7QacEAPXpSuGJ+2Aa5QKqAY8jyCB5h65ng6nfdSeajr1H8R
	cG432Y6KedU1x52RWk1LcKZ9zqC6GKmGUi9fvafeNPaFt17mWZ45Zk4FWhdYfv0M3RgLlww==
X-Gm-Gg: Acq92OGV1l5vUKNZo/JZU75cAqeWZzDPyet6PDlU5vHvKk/AHPpHDwqRamfniAl9Zhj
	p69jmfMxkkMMdf7dP3EUGtO0sbd6OLCTalsKCRYmpBsZKtq7HqWUO75Nv/iwJfI1PukfrZa3qpg
	g1GW3hDz3EOzX1eAIbOu7JECkc0ViBFp0XN91GmbnrCCMScUyPVWYYsuMXmxXYao5PpVCqChx+C
	/+35wU3xfx7KYcY32IeKEM7lSAIrDC06b0fWN1t67qd4MfWBecy1/l409WWkb2/su36LYg5IlDf
	+iVdcs+Ge7mz2tbt8lUOgPK890m86eoe9IJ8KzhFA+DkmDpfZWrCzJCiXMll36WWzNB/S2DgyS/
	LzhEXSmkTR61bHL7TKEz5rQFbBzdj6IumgcZRkgtleW1COj+kf/baKUI6nr+azkaJ/TcRsmo=
X-Received: by 2002:a05:620a:6403:b0:914:c226:ecbb with SMTP id af79cd13be357-9158a70ae5amr640309485a.23.1780496540923;
        Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:914:c226:ecbb with SMTP id af79cd13be357-9158a70ae5amr640304185a.23.1780496540504;
        Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:46 -0400
Subject: [PATCH 1/4] clk: introduce stub clk_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-1-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KhCbpgV6AqhdwmwMlKi4yi2ia3rmtjcamegp0BrEsrg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKbMV7q2I9Wyj6Nk7o6tCoV/u9azlzxQKt2ekH0rw
 Ev4j0N4RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOpWcfI8E9nld7atKsKNV+D
 72neYlBaam3ccfieKrf3Kkv17SxcoowMMx8+vnx/h/X8A5z78k0a65Y5fIo21f14f/rRWzzyMpZ
 tzAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a stub clk_sync_state() since this will be needed for some clk
drivers that already have a sync_state callback. This allows introducing
all of the necessary changes into the drivers before actually adding the
real clk_sync_state() implementation. Doing it this way ensures that the
tree stays bisectable, and the individual changes are small patches.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c   |  6 ++++++
 include/linux/clk.h | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..9cb2b42d1be4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1557,6 +1557,12 @@ static int __init clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state(struct device *dev)
+{
+	/* Will fill in */
+}
+EXPORT_SYMBOL_GPL(clk_sync_state);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..31a0c9224c46 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -846,6 +846,20 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 
 
+/*
+ * clk_sync_state - sync_state callback to disable unused clocks
+ * @dev: the clock provider device whose unused clocks should be disabled
+ *
+ * It is called by the driver core once all consumers of @dev have probed,
+ * and disables any clocks belonging to @dev that are unused at that point.
+ *
+ * If a clock provider doesn't have a sync_state callback, then the framework
+ * will set up clk_sync_state() on your drivers behalf. If your driver needs
+ * a sync_state callback, then that callback also needs to call
+ * clk_sync_state().
+ */
+void clk_sync_state(struct device *dev);
+
 /**
  * clk_round_rate - adjust a rate to the exact rate a clock can provide
  * @clk: clock source

-- 
2.54.0

