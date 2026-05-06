Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF435276038
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028666; cv=none; b=ud2ptiPQrXfo4bZ6PdeThZy3NfqydS8FJgUBiSpJwhtJq7f4P0aPXx9GuleCf3NBBdNXlpdQZa+08i0cD4TtSpcXjxo0ON50k+hVLMrvnsap87CV2kADcSaoRt98a8sVg8vDEmrTRBl1643IrmenZIUMXhL5VjBKLslLan39yzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028666; c=relaxed/simple;
	bh=Plh6jLnyb5HRCGfMAFTPcmpUH7qp8GtHhHTUy3setgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bj27JbZ6T4VBb0CJU5bwd4JyXnwF+slvw2kf//Z2A2Erf8EQQbGHXCi6r8Fe0ja9vXH7CXz5RgqHM/D4sTe2MnWUG1euuGllpjpTWl03L1OH9zuFFAujLNV6KyGDu5E1f4aAU4QcCnIHFVWeoUipaWARjvc4eUgHS+5UgSnrYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTbxIIWp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nB96vgxV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTbxIIWp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nB96vgxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
	b=JTbxIIWpUdwYjAtJsV1dz5uEHh5c6oyL33tsKe/Yo3GljpFcMc4OWuEDUhtGTtCVoQntyy
	QAOjU8JeauxmvnSBoBoNdyDuSKk7ZL66Niy3mw8x+OCuPljhPDzXKp49k3sJVEWnBFMIjP
	r6wIO2pPBpDTlG1hPk2PaI+hbuDaX5g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-O91sGg5LOTWtw3pa6tocqQ-1; Tue, 05 May 2026 20:50:58 -0400
X-MC-Unique: O91sGg5LOTWtw3pa6tocqQ-1
X-Mimecast-MFC-AGG-ID: O91sGg5LOTWtw3pa6tocqQ_1778028658
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb21daf7ddso1209084885a.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028658; x=1778633458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
        b=nB96vgxVXxSZ0I/qJyiW2VLontqxNBuKbQnb8eSj77EOcAHzQAfZ2a27aqetvGIx2r
         Qlr6l++yMVdAJ//Hl8EswkwUeQnDdfMG2ECjP7Zl1wZkKk6HI7JngefrXhYVUQKOYYZ/
         0482Cr9qy7jwg8mEwFwVq7ZGh0wJut35Vd8iFFRZvCz/BZwas31Bzq+egYCfLAQASPdC
         xz/YrIZVXhpVkd3a5hju4DsjcI8qjwm9kOKhLeMSFwty6fB5kyq03rcDsncBT189HkJp
         +Cyd5ELwaHuUucCm8+/+bdJ6dNcVURZDYPrMOsbSzxoXatKwWBjA4RxlScMK/msd1Wx0
         kdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028658; x=1778633458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
        b=Uh9dbnxCtgXS13NZ+z+ZPxOn2GYN9YhQhVnmfS0WGgyvemjvUNGT6GufyKEvvcCGQC
         tiktnPEBHK2DU2OTLm9GAnw8KiaOhWhA5WAmtzdR1ZTnHvmEcpv4A8H1CX7JXWnhy/Au
         /2iOjezEvxSpKurRkE+FFIzlVU1OG0Sx0aK8mEMjLtcTW1EE5lfyffp+FeFyr1OGbI2O
         jSAitP51q2wS1SwbbDEBGod2YzzPU65aLMUD3rYZfbxMRNgG2K0stPslwuUAqtacJ+a7
         f8jKY0j9LwHgjrngpUPH560Y99TUj4TfWtfp7+rOuhdI36fA30KiOZ+C7bIJ1ussW7k3
         q90Q==
X-Gm-Message-State: AOJu0YxtorF43kZqwtrjBFAy5eOewczx45pDYOdWYWrUuoVweL7XA6gj
	LOqwTFlutlN6R1BERImqRV6lxWGQ36Ky8vU4557qQw9DSBU+fLa8w8OzqjlaRH2Gm/ZEFevlGsh
	zUho43W8bL1ISt80iaG7U/7Yi0f1/5YMk2FH61JBz2p7hcYZDuAyaZ0EYgDQDnQVZHnTRag==
X-Gm-Gg: AeBDievQLpQTT5zHqvjY5gS0HWmlvsAYF+kJkZRB5yeaOyur+WrjSAXU2LRErkq/QFs
	/lcFb+yXC4SlDj5tNIGjMTvvsnai1o87Z3a3uQ2YcH7rIsQdKzSqRv9XCYA8pD2Zl+UTLt56Q9z
	SGV8DDGMF9EY9Ef3/TeMyyIIs3VMVIUzwGprwRNr29s9jPlca4yDxq+Mi9wByJNqw5ocvFSfs7O
	7rOw4Bm0XRbAjGg6whtAqBxXvfniMBC8BqND4x0p/uK12Lq6z+CFBIsQXHwESarxrljgzP3KOLT
	qBrcs3qt9BcH6ubLwBt3teDS97hxI1Sl/LrtvmxCtKxRXHnsHSGhK/qjnlDE7P2NpD3hc0+2giu
	Q0DXUkIivt3/RJAu08/pgbGpVfAg3HYwyiJZdh5xjmj2lo/DB9TsBPjwb1rkKfO9Tpi0iplWU
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237796485a.19.1778028658195;
        Tue, 05 May 2026 17:50:58 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237794185a.19.1778028657825;
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:10 -0400
Subject: [PATCH v3 14/15] pmdomain: mediatek: airoha: use
 clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Plh6jLnyb5HRCGfMAFTPcmpUH7qp8GtHhHTUy3setgI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC79mKWzcFFEvubdgnc2iO7/J7kEsfk+WtOMl1ap
 2Mk+yr9cUcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATSZ7IyLBs3fxvN1L+pLnM
 vLLFseeCwpsdgpUSQda2OW92ta9Tv1fO8Jv19CT98o3n2UuPedrfzXz8JXWS3L6au189Jhk75c8
 0fsELAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Ulf Hansson <ulfh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
index 3b1d202f89dc..5efd7a38f4da 100644
--- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
 	struct generic_pm_domain pd;
 };
 
-static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
-						  struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
 						 unsigned long parent_rate)
 {
@@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct clk_hw *hw)
 static const struct clk_ops airoha_cpu_pmdomain_clk_ops = {
 	.recalc_rate = airoha_cpu_pmdomain_clk_get,
 	.is_enabled = airoha_cpu_pmdomain_clk_is_enabled,
-	.determine_rate = airoha_cpu_pmdomain_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,

-- 
2.54.0

