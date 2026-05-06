Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E620258EF9
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028656; cv=none; b=lk9lf8p5sRM20xgr4Fv3ZZIBgmjuxcOcwc6ZxDfsvBSzajnqc6uUm4sWdzrlscwjR97H+z/Irqwfh5UHNZhGyMnC5mZGwb3ihyTyjPi65UUVfp4bhnB2FsypXLj1a2voiyxWKDAnBHHfBJ/QcFOIZEPbyyejWQrf+Zy8aetJrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028656; c=relaxed/simple;
	bh=cl/5xHkKUUmtWgmboo2jHQA31hfrNhEgPO90jwcHUzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOt95YceTNGDLkdjiuTvlkfnYwFFCI1CGwX5Vk2AO/MoaokWDgq/kVE/rd4cR9YOv+iv+W6KQJgj1qNHpZFycb4kA3VmVMJjYluQLcgcmzEK0uWGgjhBr8pbu4+/KRqRrahQM5Q4KkGORcuupaJVGYx4ezzbEZJPswRTzOIKNPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NH8mmSpJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FkFENyYp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NH8mmSpJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FkFENyYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
	b=NH8mmSpJPtgBHI6R2w0TZDZyYbwVRsEEYYZ+vnVN9aD9TiKhs6FPh3///pNG4qH/ViBbRs
	DUJ7ruAE+pWXUkpemk7OG/q+yRP7U4E8hEWMxi8h/eerKilEXgP6FmRnPbHWqngz7GZlml
	7GS+suApYmg4audcIy2YSxi4er2ok/I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-c8CLD1jyMZiRPQeqWGctow-1; Tue, 05 May 2026 20:50:47 -0400
X-MC-Unique: c8CLD1jyMZiRPQeqWGctow-1
X-Mimecast-MFC-AGG-ID: c8CLD1jyMZiRPQeqWGctow_1778028647
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ece46c4ba9so1140720285a.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028647; x=1778633447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
        b=FkFENyYpgQYZz7osvK2TplnHXpQsoShMUtI/36HLAQ81E2yxqtHxuWnCFNQj2PqGjz
         iu2Y+Fvufk99X/B9DviPPTs1aL5g7KuIPKGKvD0tFtsNbJFeL6IJoLZaE54dYthZrgDL
         Y0WBBZRhxebDfeTxQg4kD5TkjSIeKb3YYO82/9AlI3NIAA5qVBESp7hoLpuhXvhgv8EK
         tyMtbQfOnfFnpEXjREAJ3+Dy+LBafANH89LAH5AdbIXu49+ZmSfhJJfNBuodTJbWCBeF
         rRLxscpJj86FkvDsKOcTr/i+jrm3SIIz/xrReWASF3QZYPrFYxCbzSxsdwqT36fNTp9S
         XfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028647; x=1778633447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVozEQpTA46Z4ygyC26TpyTSMlFWlTRg+ghgCPQsNOQ=;
        b=SacQKVIT8ABQxY4YtKXUlzxqldpdXTMXMjz+79BVmbhWS72rrmYh9oHUksWCVBaB7W
         cHPm/KK36O+hlA0D1JsRcT8fdyI4uhCfySrg0OdI7CCjW9j10GPBwZfDQlW3vsRgkIOo
         C5Jimo4guRIw6v+fuAo+sz2XZd4n5p7wnHGRValoJBVJPEBBejZC/7dORnC1yCW7RtmA
         B4P37bL0CidZPR3/3ZbiF1vI0C8HL81wgXit68K9hJpr6Fy6rUw5s4D8nwexQDNMmlfN
         nfI4k3Yl45XMmveG+ZjMAamAH0Vt6811rsEdyyDSWJuiceWcqcnSh/Hq9Xr5W5+T/bIo
         E1KA==
X-Gm-Message-State: AOJu0YyrZ7vimBp5RVlmNTmE4447w0C0Uqj/WjniaPOuGTSHf2RpxXJW
	slMIJdVR7ZL9BUMm9g5Gq3zXm6LTWPvg+B+PqKChE6wfPQRKzO1MXTq+P7UQN2lch0Pk0WyraGE
	eKgUs1JNfDxGAmsAIUm/FkHW3Vqc7q9BJLJj2A+jQtdsAh/86XDjBY2S0xQqY+scnN+mdHpvKhO
	EHvxplc+bfJZ9M0p4NI82HXJVKu5znXoWlU2wxXibVVU5W
X-Gm-Gg: AeBDiesRrKXoN4mes4eWDaYXsMqbGeqDQqiH6aytqpg1pJCxXRBlQmCUvGfdjXH1EkK
	KDInJGgs5P58lo1vQZc5Wp5XxMry/2gbpNVEsqkL9DUI7aVBF39y4ecAx0zyCx6Ynd1fF1y0+jN
	5LITg8F6vWnFF2z/1yPzi4ro7gbxN0O5GbFpwR17Gb/beCe+HAValKxoQ4FSTuFLbXa3TlAcfIy
	goj23Ym/91k2kyWUDg/T35igi7qr9B79dvnmG96y8V2UQAxMcE486+m1X1Zsp0vvXsOtR1axxNq
	bm2in7kRjOxULxAO5SbnPJIChAoKfLovlNA6GktrUp8OitjPHOTI++c32uHrsJF49i9Vfz72Yj6
	3u/RbG4U7pNFDlmGTTpPM7o9HwcNGArIqA7AOGa20RY09xlhnkUmefqso6S37Gby/jpTmK8F1
X-Received: by 2002:a05:620a:318f:b0:8da:e62d:888f with SMTP id af79cd13be357-904d6cd680dmr233113785a.53.1778028647307;
        Tue, 05 May 2026 17:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:8da:e62d:888f with SMTP id af79cd13be357-904d6cd680dmr233110185a.53.1778028646771;
        Tue, 05 May 2026 17:50:46 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:04 -0400
Subject: [PATCH v3 08/15] clk: renesas: rzg2l-cpg: use
 clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-8-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cl/5xHkKUUmtWgmboo2jHQA31hfrNhEgPO90jwcHUzs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDauTy2kvU926EAy6tGlz1+GJamsa6+0Cbq/8zma
 GB9++/MjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaiZs3I8FjejFO3eFFvq21z
 5nK9i32h01KWRW58oZnKKRW2ebHza0aGi6rW/7mndf62OL7yvMwknZyTXz82S4RavGix7NeLqEr
 hAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/renesas/rzg2l-cpg.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f98b6eb4f501..2d2d792859be 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -945,12 +945,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 	return pll5_rate;
 }
 
-static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
-					   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 				     unsigned long rate,
 				     unsigned long parent_rate)
@@ -1022,7 +1016,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
-	.determine_rate = rzg2l_cpg_sipll5_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = rzg2l_cpg_sipll5_set_rate,
 };
 

-- 
2.54.0

