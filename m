Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2372356C0
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916513; cv=none; b=ZwvTToa2jU5g0vjqpV+0ddQxzRLXUuea+1x/tD9fr+FrgJALmPsZT1/Bc69AHZoNQVForctRz96oQaDn5SILFPx+1a0ZLBb7Apaw16tS45OXfhD+7PyNT6+deARALFPXQRz1XNMphdjyDojAf8RK+vnODiHLSqC+F+xqdMsSRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916513; c=relaxed/simple;
	bh=797B/i7zAYqS3C3fUwjFhBm7v2UlPo/3f5vR7+9WseU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwM5SWi2aMpHGGw63xX+IOpJssRyaxvXIg7Nq/bIBUJFLDDLgKzP2u15GbW+yx9QNmSPNtFKZjoNYGmAt9afetroglZ7rzWZbmWdglBnzawjekK0WebjgZqG/5t4roTv+8sW9u0a8bz3frGczPYGWMD2Ys+vdBnvPB+Fd2qKYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKaVTRNv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKaVTRNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjrMZnWuasomCOeyOdrJf6baH8sgZvlHk16pzYaYGG4=;
	b=DKaVTRNvXCzrZ+rfPqMa2LtjykOeqOSfisXBl3Joo0nqfNiNlA6xhZ5YkOHjq89gYovPtu
	TCnAyKVAdX+/7HQNwqqByytO53AscIMPwFcfR49pV0J6xWsWMmumW9EeC2/xfqjGQP3C7S
	kqTctt+5Mf6gTqhiBbIzjHNqDUawV/0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-TvFh2-eMMk-2oolyZcYN2w-1; Mon, 11 Aug 2025 08:48:29 -0400
X-MC-Unique: TvFh2-eMMk-2oolyZcYN2w-1
X-Mimecast-MFC-AGG-ID: TvFh2-eMMk-2oolyZcYN2w_1754916508
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af2237e4beso98592241cf.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916508; x=1755521308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjrMZnWuasomCOeyOdrJf6baH8sgZvlHk16pzYaYGG4=;
        b=hMUksx2SCI5KiglZ/7+sTas4hB683PYuISd9/zrmDqXGRNg+P9NFgiJbnCLvJvw62/
         utnQroCPNoWGlOHeP+GAly+TfE2odjBZ41O+9cDJkfeZb4HPVnesKmrtczFRv7ARSPjO
         OdBYreMG4jbPYFksma44dDcrqhJelVOGPcCmVHIJIuQ/5lSeLd2I1xL1Mwq2p4JsOdF6
         d2r3+eOlbegeJwyuE0Hj5Z534h5FnV//fRUX8ZDSnM0Cdn/LZHd972I+EUMC7iMk7RDt
         8ERuBdmjIvcpyeHSeVjQhldAr65RrrpO6rp2JnYfwbCzR1Mr/XlCnIHlRGSAnMaUV3mn
         M3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVug/V3JmbhuXwrf/t/u+oXnvFQjQc3fypVofYeBBEKbeCvEp+QmeAUm3VolMwwhdHTRNIuHxkC/90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfUS9QjCCDovEnGnIYncHXRPy/b0lxLVHdv3kXxw/ob6hUDHT
	j9Vh9fvQ0gxo0dRG21vi4QmTYCJhWjULaACHI3EsnnQQ6OQjlYT3UGMOQ7qnyHQvBn+MLcJWR1a
	XR9/my1h9sJ5Av2lDVFUxJ44Vk35Pym85wkc2+IjcbFhDsldl/Gg+n9Wu3xFJbQ==
X-Gm-Gg: ASbGncu1L5ijsPCchLUOOfYVRNUaci41Z6WFkGbOQ4RBbsylD+mtF0HSlcglSVHFXZo
	AgJIG2INW16PHHjd+5aXnWrIQPIPwwXlUNWByH8nUbF06x+p9jm1Sgvz0cWuXN0X/BJHJsf7I+D
	j5jrg7BHwbTR2oK5HXywIHWFnhLQC5N0ezJoV/qIxnJDP2Ir1IlkbWWnrUEGBTvI/cx7JP8UtkU
	EqlRmwbs1LK4vOsXkzDT1vZzOfjcY7fB4etcH8qys3PNl9fx2OxFxai0IBxMx1/azFpv1n1hIOV
	ohtBfaIBnIZBjkJOGXH1WYqbcREOMRRRLXRKqxZA2lkQd3hzOMctTDVx4n8m1QAu6cr0s6RQFHU
	g5gY=
X-Received: by 2002:a05:622a:1347:b0:4b0:62c6:74c3 with SMTP id d75a77b69052e-4b0a081698bmr223865741cf.22.1754916508369;
        Mon, 11 Aug 2025 05:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ6N8H2X/Bvn+Au+kqGnuF5oeyYWPX+3WMtIqSB8DTDsMJq8v6IX3eOUhsgPzL8VhHHDNq8g==
X-Received: by 2002:a05:622a:1347:b0:4b0:62c6:74c3 with SMTP id d75a77b69052e-4b0a081698bmr223865281cf.22.1754916507766;
        Mon, 11 Aug 2025 05:48:27 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:06 -0400
Subject: [PATCH 1/7] clk: ti: dpll: remove round_rate() in favor of
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-1-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=2854;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=797B/i7zAYqS3C3fUwjFhBm7v2UlPo/3f5vR7+9WseU=;
 b=f6AxDfpy+RCAm2k48bLMU6hHsZhiIhyDPP0Xu8DVBbm+SnUO1/phMmAPOVEmJhxdvCZ+PrTeV
 420mVDpwyjfC9nn3pdrhSYEiP3VtgDwWcEOhdEyNFp3IV+ZmVRFc1tT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/dpll.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 3386bd1903df6d6cc443c9e087497167682da8c4..1f55554e0d73ca0323459e8823125b22623ae4a9 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -25,7 +25,6 @@ static const struct clk_ops dpll_m4xen_ck_ops = {
 	.enable		= &omap3_noncore_dpll_enable,
 	.disable	= &omap3_noncore_dpll_disable,
 	.recalc_rate	= &omap4_dpll_regm4xen_recalc,
-	.round_rate	= &omap4_dpll_regm4xen_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -48,7 +47,6 @@ static const struct clk_ops dpll_ck_ops = {
 	.enable		= &omap3_noncore_dpll_enable,
 	.disable	= &omap3_noncore_dpll_disable,
 	.recalc_rate	= &omap3_dpll_recalc,
-	.round_rate	= &omap2_dpll_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -61,7 +59,6 @@ static const struct clk_ops dpll_ck_ops = {
 static const struct clk_ops dpll_no_gate_ck_ops = {
 	.recalc_rate	= &omap3_dpll_recalc,
 	.get_parent	= &omap2_init_dpll_parent,
-	.round_rate	= &omap2_dpll_round_rate,
 	.set_rate	= &omap3_noncore_dpll_set_rate,
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
@@ -103,7 +100,6 @@ static const struct clk_ops omap3_dpll_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 
 static const struct clk_ops omap3_dpll5_ck_ops = {
@@ -115,7 +111,6 @@ static const struct clk_ops omap3_dpll5_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 
 static const struct clk_ops omap3_dpll_per_ck_ops = {
@@ -127,7 +122,6 @@ static const struct clk_ops omap3_dpll_per_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_dpll4_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
-	.round_rate	= &omap2_dpll_round_rate,
 };
 #endif
 

-- 
2.50.1

