Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202859;
	b=ffaUfS9lLFBPh9MaQkHKs6lXtZfmH5GGslcKoChTqZF0+pJ1n4dJ6ahe/D8GFmR8dq1l
	 Mqdo66ajc2pB9LnXLmOwIKR7ivdFx8vGcc8Ipq5LtuW8HtTX7st4GteHN6udl5l+JlhoD
	 4ooeHzPe0c6Y89IJMQSMII9U5etyNo4xYszq+dO6dvRFpU4kAiGdPTBqK9ibNlbjcZpqm
	 TPjGARGyUHCcZizXZoIzj0Rt1CBACqT9swkN31cVchlKcfp0PTncF07OfnYptIv2pXyTX
	 tqvTPa6JvPsYN4PEOfU3E0wn51XGX9bmFRqgCSGlbCx5O3nwx5nKe8ARZhyXqQAZGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
	b=wFoh5yIV1IhEIv9eLHKNEuoW/nLVC61ANdbgVYO+GKYg8nE5S8FpUoOgh05nsaLIOpg7
	 HeXL3tNjr59R2n1KTrZIkf+JX7dRXqMzVjMSt7/tOcocxM4I56h/7IytvG0DI8jb4j+LE
	 e+nKmnr03rp0Gezqfcv6TbSFk1bgV454PZ5LVRgMpI9HFBHrcLnjfpJ5Np6v/R6j48Lcj
	 2xGYWkzaLbr4nnQIVKgIU/TOtr+jJHJGWhnDlUnvqNDw8e78FvuSCrQsNMvhywb4DAmMS
	 vh1hwj4Kr3PxqKW5hRIC17pciI5a/tKF6UG/mjybis5ufc9/7ZKZi00NKCz3+NwR+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkTDrLIs;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F8606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkTDrLIs
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10336025e9.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202853; x=1793807653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
        b=GkTDrLIsrm1vtvQLBsXeNrwfCa3oJVly33MOEkh+K9cKm/r1BqduL9IJs5nJCOwLBS
         7WcwizkEQ3VynNSnJnAEP8q4O7SWxFpkBVzMW7Akb5C6oM3Sm3tnH1/zwTmmQ/uaolR3
         1Ydtbvxoyig0vZiwZwfNuy4UZ8mY0+urDngIaLsVGXxWs2br7VubefsYe2sJmzjPBzR/
         m5tEaMRyCegh54VaMe4X8UeMlBNWOPvIzwuzlvhsgIUirqcD6Tl0EMBpnrjWHoU8tFyh
         OsRBpO5I8XmuVcea6sQKYtZR5M6RznNM9dXylb8ER4djsM6F1THF/ODKZEF53U1/wIYa
         3SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202853; x=1793807653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
        b=1meHXL15Szo6MGch4UsR098eVTOhJOAOaESwwrakO5wHdfHv5yPvMXVAb8q+Dcmljd
         bQwnh4PNwm5HzJCbxNkmoj0rXH7BTdEIr89oNfETCp10hSDBwcPgLZY5C109KTwinzHD
         u2RmdC43SztX8X6Sx9YLuQgaCjwN1tAwzDP/a3Cpi/AU98X/mgrw7+agq081lzu1b0J2
         VD2z8tCS93Goq/bsV2kH9uGrx0o4i/5W2GjINEoj2O3IIRqeWAZe9B2x7TRC2L+znLQy
         ZmRM6kVriRJwrRBedYdoriSuhofoNdltXs4TqBH/03c06qZuPVpw3mLJwzZG70UC5emz
         27wg==
X-Forwarded-Encrypted: i=1; AKwUvBzWlhDelwrMhcMTnhIb6aR9t/zfCSnkXFiBRpqhb4JYwZ1M5zXNSqQ9ayhteuQKwrdDjv58mSk9FQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJavq9zgFGArPatG1NW8Lb+xjigiVQeZylzhRf8/XuRKPFS8dKm
	n2EsOroee+qMvMCaf3Fss/Up6hD91Oobzy4g8iKf5q6PpTF2cGmToM17nyyd6L6W1fU=
X-Gm-Gg: AYBFou0Jjqrjvi9wy0jiiEmSGtjX6td61QBOT+7YxOCG4kRT3nlY01v9SC2ixkRzkIj
	hORMNMHY0VuoiLJO5MkzqPRVsREBuHnsleEnAR8flmDakrQ3bM6WBuHekzDVNIon0BRefNyVGkr
	nGL2M1ooCHzb13jzd48NHKZTOxH9fCK38seqmV/eeis1AyweivGdXMBF/qjuw757QYLgANsppYM
	FhAhGz3PJyiLVoNUQTKvlMzlarySR8UPmDFPgEZzEW7Ta+0N6fgFVzbcTy/ky9V1mh9al0zWUP8
	d2xuZxFfSahEg0LaEVQG1qCQOxUtjAczj9UtewQCp7o+u2mqiO3CGjs6Btn2Jo58pB1UkNGJkyG
	sU6/sP2KdowjZVmb8AYabBBJa84rL1Zpy4drpdXEXjRtlNCJB4+VrFfZWMrkAU4hyfEjgZYD8Os
	yt9Dmi10bJpg619VO952ueHUMon+XmRqTSpZ3hJ6n7IbJvcnlmN2fJ8Ey6uZ2vrk7/mWct41nqd
	Z71dAThmL1EKIk9hNlsp3alT8QUgAnJ++eUiyYbgku0Fjw1u4NiI/ayU4wAALm8XWXXk8NiOPvL
	8YRP3VtQZRm5XHQndoGPLKmbdT77DC9u3waySywRSMH+q/x6/xGEqX7YgCVozPB6NhomQE+xUcT
	DNU5GG+meN5iCzWTqNc5dERoHCw==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4a9678c28ffmr61407455e9.22.1793202852789;
        Wed, 28 Oct 2026 08:54:12 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:12 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:51 +0100
Subject: [PATCH v2 3/4] clk: ti: fapll: print clock name that fails to
 register
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
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-3-dc6bf0fabae4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Slbv+1YP2F1a+aBq2BJ9DLP7Wji77v+hSEpGjiXeytg=;
 b=O5OWEnIaLu4SaaALVpToqLuve4ADF6Pi4kM+qtBiKp67uCZLvnY7K6PnWC1gqUsH3oIg/uxU3
 Ariczt9c58VAr4RVCBk7U4KvTD2dOQs6lR0U7IniniqERExBUAerwfS
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Improve the error message when a clock fails to register by including
the clock's name and its parent's name for better debugging.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index 8ab9acd57b60..d360e9d986c3 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -520,7 +520,7 @@ static struct clk * __init ti_fapll_synth_setup(struct fapll_data *fd,
 
 	clk = clk_register(NULL, &synth->hw);
 	if (IS_ERR(clk)) {
-		pr_err("failed to register clock\n");
+		pr_err("failed to register clock '%s' for parent '%s'\n", name, parent);
 		goto free;
 	}
 

-- 
2.56.0

