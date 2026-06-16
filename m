Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DD3A8724
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644234; cv=none; b=sfAe7htHu36RB76zQ7paPVqysXI452OkIIfprERVgWzvjnEIqrvsfvkfi4eW9njKAp3PmuqJ1/FXtuu0fX9D2e61MHz6KI3LlvmMC2G7gFc4E3tFfipswcb71Tst8ajj24Nu4Sq+d4p1TBy7VcwTLqd3iQhVnGM/+o3zp4OohIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644234; c=relaxed/simple;
	bh=vS5ftJZDKf6E1PZnZjiyEQIZ58HjzX2wleY4q85f/58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExL6nG7dDfm/XMu6uP0tHcfhwPlo4ZXFD8/GX+XlgawHS435CWu6G5Oe//G9/rBTKUp5SsqCG0Uj6N8uMvMQcO3d19AOvyRaoDg1Btnq1Br1OFKWV+PWLgVQoTomEFNTw5BGiKrdqd4sSihcGDReZYfOt3sshCevKrtQj7gstJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BEaKW6Hp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrjVw4mL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BEaKW6Hp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrjVw4mL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
	b=BEaKW6Hpyi+USVMTFCEIfxLpsTgs5Wv7IQcJOf45r156kHrEZ5F0P9Tm86iWshEwilhOrg
	m/dzWoR/+Fn+NsyhjkmtYbdNtZoc2Cax6oJyjpEjpHr/8/5Z7lwd5j8v2HOaIJa4Y2tZ34
	VDpM7iGYyvAug9zhp92rOxm53tR4c1A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-1gOQQkKkO9Sstfxb3VaBPw-1; Tue, 16 Jun 2026 17:10:31 -0400
X-MC-Unique: 1gOQQkKkO9Sstfxb3VaBPw-1
X-Mimecast-MFC-AGG-ID: 1gOQQkKkO9Sstfxb3VaBPw_1781644231
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-519602a4a83so68734391cf.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644230; x=1782249030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
        b=hrjVw4mLwc80NhdXCPnBfXlzbRhYGmNQ+Z/x5XoRPVEKU9CdefWGJDyA5gFNnF0K7N
         N4cLmmrBamqoMzGkAddg/TSKkRBxLr4d3uercREp0uvrn0UYVb4cWfirbOSaOv4gEskh
         FIDMfyXb2lWYuiTPi9hHOshJNGnqYQVyoGWhn2QvK0fY7nNtNo0ElwJhA0UPRLL4Tbf1
         OCIIkuMAXEJV4yJyyR0MmI+BDvsv57hA3shy/AT3VefIK7u5ioYZo8npqnfa1OVg+4IR
         I/jKEYevt/lDu/2pNcbcApE96frmo3tcCPCbE52F2OkedZ8mYbpa1XCazaZzJvMsIA4A
         WQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644230; x=1782249030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
        b=NHGhh2XgsDIeLENUAeWGlbgc2jGoB2F+ftO/3p2J72JQya02WSGiJRPV8e6rDnNKtv
         JFy28Vz7AEjyw05xdG+9+Qfkd/VmlZCau7iqDQ7pjMp6eNzSPcRTy+W9+x6nU3xnWV0c
         CmAGbo9Y5uFLBvyMj5r+uTy/3firj9aMsQ91Ee4G616h+L/w76J0PeZ9vxUURDLPt9ow
         hSGLpj0xcjeMPI+0eSoxA0zoeWoLt0GCNWYZkpcm5WzNbhWUWgheNnm/27aQ+X7b4fJY
         w+FzjrE2liJ2ItwObrcbwKTd6IT1U0z0mX/t+XjHt4kF8moE7ekomc36GxW0Qv3RrVy4
         RWfA==
X-Gm-Message-State: AOJu0YwNW64EJzlUwUaHPp49ehScF3ze3Ubb7wDAaFz2+L2jd2ImrJq3
	5fFe15H06cgba2Kz0oadzH0dLxzxD2QgQvt25M6c2W1YWxFo0x2yfyDflWjCZ0FmyPUG6hhklm0
	3wHMiSe8ih/JzIuCJiNm0i1FwbKqMmDtCEQYxSTmcZlb3WJtsfnwUcRGSVCYzLA==
X-Gm-Gg: Acq92OGHX0SF4kguxCYJjDSn95zRizqf7pzeBSLiZacqax+RuO0NKxv297jV0ABg/gs
	l1zlgKI2uPjiBdg0kYQalEtA2gptlczYGEUnEB4JFZM8F3G58ZmgW38yvMXX1BhnU8ZfR4EdqHA
	Pel+RWVOqVsUC/QQUEQHpcLGMlmfagNF1SUvhtO7JUxgXXxDa7fc6JN18eJJsDYHeWJZsVPGKn8
	QABkaxqabg+Yuo5owGUG5pJYFAYihDwcxW49FrkxzeWx8cGYGdI1JGoGtVwq+X5S0w12+1SYnVy
	H+NwBtTcjUSWJA6Wn9V9WvQKSH5ywmusHM0gqTBOc7Ke2XnX6OzoBLc6+jT3NY7wyYoHX9DZkMo
	a1gGMZlL/EI8xltr+1Re1eWZLARq0m7j1wrQf2F7iOCsbzPD8+0MyiEMlmPU7Kg==
X-Received: by 2002:a05:622a:828d:b0:519:8a4c:d32 with SMTP id d75a77b69052e-519a8e5dbc6mr16378211cf.30.1781644230496;
        Tue, 16 Jun 2026 14:10:30 -0700 (PDT)
X-Received: by 2002:a05:622a:828d:b0:519:8a4c:d32 with SMTP id d75a77b69052e-519a8e5dbc6mr16377891cf.30.1781644230110;
        Tue, 16 Jun 2026 14:10:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:46 -0400
Subject: [PATCH v2 4/5] clk: qcom: cbf-8996: add clk_sync_state() call
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
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
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vS5ftJZDKf6E1PZnZjiyEQIZ58HjzX2wleY4q85f/58=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+9OtU4P+222rLs1LSVaSoQt6Ybvo/15xfsT7SKUq
 ++WWM7uKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCIx/Qw/GXcpXGf+n5Yi+fVL
 vsfsqi2M0b0vLJvkn9yQLrq08IJYFSPDdB09oe9L1+39YH/6B/OLd5c+7ZBffi2yv8RwX55XwJV
 5bAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver doesn't use qcom_cc_probe() in qcom/common.c, so it
shouldn't use the newly introduced qcom_cc_sync_state(). Let's go ahead
and add a driver-specific sync state call.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-cbf-8996.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..020d511072e2 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -249,7 +249,11 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
 
 	icc_clk_unregister(provider);
 }
-#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
+static void qcom_msm8996_cbf_icc_sync_state(struct device *dev)
+{
+	icc_sync_state(dev);
+	clk_sync_state(dev);
+}
 #else
 static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
 {
@@ -258,7 +262,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
 	return 0;
 }
 #define qcom_msm8996_cbf_icc_remove(pdev) { }
-#define qcom_msm8996_cbf_icc_sync_state NULL
+#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
 #endif
 
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)

-- 
2.54.0

