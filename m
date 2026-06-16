Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0F3A6B65
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644232; cv=none; b=YkqLySWk7iepD0h5d88joqc/mrU203C0cGEgBv5chm9wJPrXHd+yGNIKP2wtB6KLFUH1vRdS85w/w2Q4c1JbkwLm4KtqdJDzNqYB16dsVBiVdyAodxatSaQNrDVWY1L/m0UU7RJ8zOoXbIMvVXR6bRkUN8LqbAWf6xIB/lSa2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644232; c=relaxed/simple;
	bh=taSF5g+TYPmZ3BTF82P0LBh5qfQ8aapUDFKnR5l8sjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eB0AfqRQEphuRa93pxb8AVs8pV4LJ0r1+H6EOUzDVcAKerk7TiiphDTi5arzoKD+1x0fhAt5johPyR3Wq28bS74HwCOEq4npxwZD9PD5ONqy8we64Xhja2kSoZJDWbrshbX0TykVxey4h6FmhqERqwtBOH/JaufVV6jxhL4Be/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGDZvhDI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lix9icTE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGDZvhDI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lix9icTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
	b=iGDZvhDI+YpfZJJmPVwc5TcjQr/2elm8ACte1zjdIs0hr4BXDZxil9gyVMGWNXX+3/Fz81
	P+nYUpBHPiI+a7Q5oBsmMeFHLe6gMcHs817X33qhinN7RHZT8NdCr5aCtLLsJuvSibwezv
	QmdcDN3j75qOgSoDN7IXIRUWIqOuEZA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-1bBaZsdfNYOKHpgzv52b-w-1; Tue, 16 Jun 2026 17:10:25 -0400
X-MC-Unique: 1bBaZsdfNYOKHpgzv52b-w-1
X-Mimecast-MFC-AGG-ID: 1bBaZsdfNYOKHpgzv52b-w_1781644225
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cce230de8bso53847026d6.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644225; x=1782249025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
        b=lix9icTEaxjn+/oW28dkiuOLHduh9lQ4OwQAPBl/ZVJaF5ohtzHhCBothpXDVnYVlE
         IT/A+vAW7y7ZDNfn9k2b6JALpYmqtY00L5//64X29vHHvxrs3xJO4EJaJA6w7vZKou/E
         4fTJHCHm1Jw8/wZWN3ARQO/ow+orbSvVDtXxkUUhfCFcWu6Y+o+RUYbv4gbQ0AXx0i/p
         M7VKXORo9jX1Kb6kJOJMXeRGxNRm1YvdRlbR0vhX0uLwSy5ryzTbAOOf397NVL315hyA
         rc4qpEnASETEIG2kRmXRF4wPaABflm0TVQiptXzNoUqhp8gLMo9Bpg+KNfgAEB61WHmk
         Xzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644225; x=1782249025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
        b=Fo7MmQLYRqU9kZ6tZm//aZQZ5xC4ILNP3a4H+qRpNAFmjLh0zNYXAM8dmIY67gWSTj
         F1NwUo73BP75IrqmqQL/kPqURezVVtX9wN72UXNRSuKTH6MEhj4bZObGuy1BHs9oGYiu
         cVEVZ4oyklkmj18FudKV7pIPGzWE+MA1m19Bf5RnH77wt1Q9AGDim06FB/9BiPG5nQeG
         jgezdT/4r5w4mynOigwV08vTryQ2FBm2q8Pw+eNnS+aprqitw1JooHVzc4rJI0f5LtpG
         THPCmE64cEJdEQdI0EWqaa1kyeXjO+QPLzjtZeSiDLmEarLQIpsHsXGzG35DUs0E6J4j
         31+Q==
X-Gm-Message-State: AOJu0YyStJ0R+M9fR83s/SXPobIZrIJobulqGM7oE8ELoQWJAHLyCTsl
	9rH5Tk9eoDP7FpFpq7AxYgLoiGj3QeZ0uuKsSzCdIldLGPxSYCeJ1Z2TT1sg7alYB5LnLfZCeyY
	uTsDLHBCIczoCmzcAk0r2sf3vBikCQ1CYcxy3jdbf06imBp2jmDMapbqzfCg3Ag==
X-Gm-Gg: AfdE7cm9a44nu9i3nY5XDMLOLztQd/vVD3z9onSaKMm8jsyTlMz3OTedWUX3iycTeDr
	lbU16xZwi7oTqOileIoZ2HkFoHH537bRIShacmSUbrVtNLUC7L1EkZtwpI2GtR4uJGYYrZdOfgt
	F+sAknTwAJbUfn7ArFEGTfjgvsjdpovzleZ4TJ9qB7qQD/TvNKIIcPJBF3+1WSV7pZIqwDxpplD
	sAYVn/NXqFtMox/Dg2onIAqMSgD8CONcUSBQV2p7k1BZ86YHRuzv2AV9vkM65r7pp3BZhsRXGAd
	S+yEoqaQDw83iMO7qex4HzqQGjUM1sGIHnRqfR0vui00dWx7+8A1Ak0V1a60LcLBbT/NsPDf52v
	erzdqqiwml4tRr/UU4KVgXCWIA7r7epeiYHu+FtajtiWhmplQHvt6jzlKde82Tw==
X-Received: by 2002:a05:6214:494c:b0:8cf:de18:929c with SMTP id 6a1803df08f44-8db5a8256c2mr15971956d6.1.1781644225196;
        Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
X-Received: by 2002:a05:6214:494c:b0:8cf:de18:929c with SMTP id 6a1803df08f44-8db5a8256c2mr15971606d6.1.1781644224738;
        Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:43 -0400
Subject: [PATCH v2 1/5] clk: introduce stub clk_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-1-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=taSF5g+TYPmZ3BTF82P0LBh5qfQ8aapUDFKnR5l8sjU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8oi127i4G5q8JJdLql2Mb1M0U+imx9ZKbgN+ev/
 stkD4ZdHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkkirD/+CHOq9iVxy0qnnf
 22hUzjTBY9aZx4/fVTF9jlc6pHHqCD/DL+ZuwVX/ni0OZvKsz8h4mfeu0y5/cVLB2y6mNQeva6R
 N4AUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a stub clk_sync_state() since this will be needed for some clk
drivers that already have a sync_state callback. This allows introducing
all of the necessary changes into the drivers before actually adding the
real clk_sync_state() implementation. Doing it this way ensures that the
tree stays bisectable, and the individual changes are small patches.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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

