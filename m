Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202854;
	b=0djzfyGkKCzv1+B/HywLPyaofERrkTnldNdQPhDdbQFbVlUySJVrP+HuvM2NmdeKz3No
	 XwoLZTjaEouFtv3l33QSnr16z8cEl8MdW1Ewpw3vZHpTKmeVjviAogYYleKP5awdmJcsl
	 IzQFBMhgvceBtY2PUkRX5+6P1QiTRrqvJ0YhnicIYwB3scwmCJyGL0ZTeeM5HGyKqBZiK
	 fVcADGUUvDDJu/FicboogCt2Jn1eXgOJSkrlS+NiMJj2W/HxEVAG1iNrcFRlpk7cNygHj
	 UrekfgiLmNmeo77P3IgIvPdSnRQz51NFUqJB2HtMISrnlTuElm7WVgb7rfjnQ6+0WBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nEkCWXmywVasB5aous9cspw5GRt9O+utplNrcCJYuUU=;
	b=HkB79a4hjXi1exXA465BrG8/VXpyY6KtcVBTAVm/h4taCn//x0T5p05Xddf30qKvR03T
	 /a4sDtnqE1J8l5p79bh+aROK+QEWDy80q2NIxhGDXoQpfY5RBeIGXZoSyTOQaFIV7JHNJ
	 5T5H3OfGqeM1IRLN6Cqa+kSavaMoXOnLF0LE0YfvuqV2cOXOdfz4f7kXW1v/lKkabEfiT
	 Z9eOxQhBiZp/o6aN2v6XfgP/NhQ13971kabg7GQxSMfI7tZIbU81ZZ1I1f8YUgNfO+95v
	 yrcCGOK6Cxu+V+OsTMd8OkQtU3BW40HHViNmUNnTGdcyh7zqPz6M69vNk2/p85YjBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yH2pgolx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71961606A331
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71961606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yH2pgolx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9979745e9.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202852; x=1793807652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEkCWXmywVasB5aous9cspw5GRt9O+utplNrcCJYuUU=;
        b=yH2pgolx5MStzUCBLacPP72F8Ww9UXttiyhaOuJhvSv1JaTU9j08Fj70XyCKbGJcfs
         hqFa6adYqMLTpnp+1YDPtQGUPxA5ycTtCibj+e6WmWOfU4cUBOetcL8QSbY5VXMXMdP2
         ihWRaQfsLLRfcY+d9uRWC2L3ZTPOO4EgKfp0Epc1/pK2BEY3Owl9DU5Fwmujqzrm87Md
         lDFjiUfaiLtf2aI96kmiqJvRZ0ahipy7Sl65xQjAouw1eK0ro/KqlXCM83rzrVzcbnln
         EF9Ey7COylaBBIjjLCBnnyvf6xsTxahTPz1UuimuawcVnqnGCwM+3JEWxj1qeTXJnuil
         DweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202852; x=1793807652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEkCWXmywVasB5aous9cspw5GRt9O+utplNrcCJYuUU=;
        b=BlEPxwKZetY3S0oI362y0+JW3nSjFlRRqIFX/No7+RJ21eVO2krgcWwj3gN/XV+Lz+
         xeoCBDp2Szvr3rF0DsVjyZcJxp3cv7BySulwhckq8ov7B0z30vb4wU2p4MseJ8eVGRpj
         wV4sDfewikQrtS94jzQvXOgbO0Nz5UPPCuDDu26kjqDkdu85B2HVwOd7Fb5jhmx77i77
         G1gxi+K2CEhc4M/CNaqNTrUzq7h0i+iWPmy5vdbV10WHkrCHDeE9SQvRpYK3LEqIVMyb
         AuShVkejXnVxxQ3P+rIuhtg0OC69wJaGReOwu3gklSoopsoDmkFDVp7QctUkxPHPdKGk
         LxMA==
X-Forwarded-Encrypted: i=1; AKwUvBzVaDXjdg0jzQHy+lnHPfsb5fViA/mYHt3eoLXJKNLWgvECF/cIfeAsvT6cRGBOOHX0mrJFtNoCY7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKwknWJXanvRxybm9YyjdVqe+XHEvgR1Kn3chpt+cJCrsnE7Ug
	TeFrnf9PjBGEopOjbQY1oUYFRpuPKGleLYqDzEFGYgqO6QmLH4HS0XLfUvtIEfeJx6A=
X-Gm-Gg: AYBFou0fzzq+NfghR8C4PIcOEyR791TA0eC7MTSc7Zz6X75iCoyXyRWXW9+dOG/aQ6K
	kWmBAy0XTpocqRXMOGJPGxVyV3kdSowXLYVVPf35hyFDoP9QylOmeG0RxiOcR2/igJpsWVa4Lwo
	1S2B8F7ulXdlFjKUcxFT02AhIsfKN0ChFw6/AkhZVUIfyPegDareOup6M4vtHYjGdXzgN4kbeHG
	oRvwM09gtqjWaCGrPKnfQOcrgbGBp/bbVNyVycGsHUhi9Svlp0xhzCef1QEqxvhgGiJb1QCU/zM
	8OPZywgz2rpwx3hw8i4evu2XxwdD/3/87bRhdXUann5OlRneTjBN1gY1QwN3B8WEmL8CiVHHNvT
	lphRA9LLdzLelsQDiLYbeGJjkVj3O71s8LDfwbIF0QyXmjSH++CY1X0dOufCaWAEPkog8wuPZOu
	QtXnfPBMqV+J5nrOhs3cNxSKdhNRhigUewt3AVi/8DyXtUM1E0dFGlcl/YnhKyCo1hXpzLwcqbN
	itNt9kWxiPchcuY1xqLBtOJzZvYr0mZjIUIa2o9evhOnzgH6UzdCTYxDvQ5sKYOw0x+dzKxnynq
	E/4sWSSqMOE35hjXYAW/FX3XYgwzeCmzWXCEIW+miq/ouY8qVOLl7LKT9G8VC+5MjLv5sdS4gk/
	sscQGpR2M6dn7QDTy6WmSHf3RYDTWa4JZ9ODctnlLW5Dwl8s=
X-Received: by 2002:a05:600c:37cc:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4a968552939mr60471495e9.34.1793202851830;
        Wed, 28 Oct 2026 08:54:11 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:11 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:50 +0100
Subject: [PATCH v2 2/4] clk: ti: fapll: Fix clock speed calculation
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-2-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=1741;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=x1G4PpmGAOi/+npgUEN5TSnu9K+yHFni2t7wWOonDiM=;
 b=Yjdc0rXTYjFcwSZPaRwYiLsrgSjWu0P53QtnentU54j87UaJVPUIW1thUkot8uN64ac5aOGBa
 K9Elk7a2TEcAmN3v9I9wfdqMAu1wyc9WoZjj+icprs7NJrZ/znzc3x/
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The fractional part of the divider was being treated as 1/10000000
whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
speeds being reported when a fractional divider was in use. Correct it.
As well as fixing the clock speed calculation when read, also update the
calculation on set in a similar manner.

Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f6..8ab9acd57b60 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -336,8 +336,8 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 		v = readl_relaxed(synth->freq);
 		synth_int_div = (v >> 24) & 0xf;
 		synth_frac_div = v & 0xffffff;
-		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
-		rate *= 10000000;
+		synth_div_freq = (synth_int_div * 16777216) + synth_frac_div;
+		rate *= 16777216;
 		do_div(rate, synth_div_freq);
 		rate *= SYNTH_PHASE_K;
 	}
@@ -378,10 +378,10 @@ static u32 ti_fapll_synth_set_frac_rate(struct fapll_synth *synth,
 	for (; post_div_m < SYNTH_MAX_DIV_M; post_div_m++) {
 		synth_int_div = DIV_ROUND_UP_ULL((u64)parent_rate *
 						 SYNTH_PHASE_K *
-						 10000000,
+						 16777216,
 						 rate * post_div_m);
-		synth_frac_div = synth_int_div % 10000000;
-		synth_int_div /= 10000000;
+		synth_frac_div = synth_int_div % 16777216;
+		synth_int_div /= 16777216;
 
 		if (synth_int_div <= SYNTH_MAX_INT_DIV)
 			break;

-- 
2.56.0

