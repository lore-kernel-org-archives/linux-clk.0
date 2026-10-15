Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F054B1A0
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083306; cv=none; b=lrdQ5tdWQg9dn6AFU0i/d7TkvKlFVMhcWwSqdykYZP7cfcBesv+hRJcQ3/QAMlsI2WlNFnAn5rAPP7XHZxbsgrKjbDJhyGscUlQKroEs7vseqnO9+4WLo2BGXE6PqbqrzNE0hlPv59HoeJu42yIlM/sUFdNeF4h0PEEo0SqwCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083306; c=relaxed/simple;
	bh=nNl+aWdXmjwtXODSPDByzsezc844pEMLDbyf7xF3pRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSSUuv3/j22seNRNEk2bK3Pcz9HES44NqOfoOxLzZ3p6OScI3GQGlMrHJxm3lZHqGqe7IKvs7TEInnO0036kPplnjWQX0FLZ7rVuIUCkf5as4llrc/Zs15g1CWhuNqjhLzKIcyYXALAwy18Ccg/EUwz+ua8Rqa/1FFAMKptcBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z44DwCIr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z44DwCIr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so147891f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083288; x=1792688088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWFqupga0Da3LDpzfcjDFK8WTaNzOGEEKytPnY4vu9I=;
        b=Z44DwCIreNU6eqKiHLHOOgs4IIZ0CXGhDs3rtB/9bzdm0G+xe+D3HRW+qOG79qMjEv
         qNy51csXQ5ISXG6b0F4DbO031IN4WAYNAWCiBJFYU28cVItexEh9YD35AwiSIUVmwFTf
         Q6TkUw2OwAzh9JWnprCH6PVtsRFZIwkRSYjfqSV1GEWotnw7IJNdv7uqJGXiHtsAlslS
         eEBFsv/XPfIR8UWvJ1A4Ucc6W0znAnqGg7Xcj5CT31nC3kXH1eQ0t1qJ8cFkhyfhGIPF
         beHrUurRUVg9omTMv93rb/DcFP/KZlp54Xnb+n2tnafr9DoJij4U9UKnww9651NJ4JtD
         j3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083288; x=1792688088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWFqupga0Da3LDpzfcjDFK8WTaNzOGEEKytPnY4vu9I=;
        b=rLtX3H1YH2zUdlTg1L0DAknVsg1FNJnZ0Gqm9KMuhnw3ZYdZ+puhhkn1499n9fV5VD
         RFYBFt5+t9O9wWljivtBoFDzClsRsaOMAibr14r2vLs07utZkXfDABpc2x663SEWQoDK
         Ey1trVGPXxghG6qlnB3HnijOTuLTT4jeIfoKyCdp4fpfpILdpoiZjgoLGTCr7hhAA35x
         CovNfjIToPE/sG57dQNcaWGPnoYFIgkTSLJ/SpAvDPlrZOmbLEl4P4hD4JNNtm9uErD0
         jPN6S43ioxr5oxVUSuIUrCqo/tU3UsxmmdEV09HWXRE+p7YleyPkh1XWspx+JSOWXBaj
         o+Og==
X-Forwarded-Encrypted: i=1; AKwUvBy9f/ziyqHoPZmdT0ZnQzaoWGsoH36og/g79ZZMbEyC/YWTFIcltCg8wTFtwdpbiVXPd+OtZjHOP5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8gOfMBpK7gDBu0SZszRaP6c3gTjhgQ0azjO9gN+QY3sILlhLI
	s68hX5aruxdcxWjy85sksu8DYKZkE0Q0BT3iyYKIqpJr0oLNx8y78dIvIRhHi7EngEAfV11Pf9D
	oQemXlR4=
X-Gm-Gg: AYBFou1ekmmHJIjsLY8NOeA5U4+1Gb6LMvzAhnxobQ6ngWe53L76gh2Yb9uQzldqBqe
	+eMn60Rt0dBQmd8+5NJpmc9OsuxvxzTsUq/XmpSE/AcCBGW7BryB5Orm8ynX15LSWQkONspUEKE
	rrEoYJf5ygxaY5gFUK9J6S38LC61uVKcJUhEPQiM5C136mBA1nGXRJDZbpb9ZQzbSqs6XmdZUqD
	iW/Hf9K/SR4PwYo726Tx3AG37gRg3rBA9vZMq8pqDmbNo7ANxworCf7JmX+1X6/4qsG5IH7KS3a
	zNbrfV9bDfQQW3RuQAXrYD3k41IgMKLChXZR/s54PLfi2vFFXEWerw7jB1EoDV1SFMLVRUR60sw
	a1PX2HT3FyDFa3eN4tq0cK6KrhSaUiszEmJg7x4Za5dVWUV8uyr2/IMLLLr3cBnoKRsNoEvLuP9
	SebdY8czd/x8a9MHEXsGrd2tBZWmtgja8wYtuVmI1rSSdIH+LXJEVaPQL+iMd3IQr16N7BkUfnx
	tpoaXkTlTAXERoXaENixN17vNckS2dbnsIOML1ezGXulNNRU9kt1f0M8oww/1o9ZIE3Kg==
X-Received: by 2002:adf:edd1:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48dfae1ee24mr1225054f8f.16.1792083288385;
        Thu, 15 Oct 2026 09:54:48 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:46 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 15 Oct 2026 18:54:32 +0200
Subject: [PATCH 3/4] clk: ti: fapll: print clock name that fails to
 register
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-3-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ja3D73iaM0XrrX8Ixe84Fx5s+9skcP8lleOkVCdvv/o=;
 b=Xci4KTRtILDfRu0hmxsWfO/nunPhLFDznA3uG4T4fWqGPu7dmThhKO+TibQMZrU4q6OC+sp76
 Px5shKBBIpwAhCyVsbdCgTE7utS17Y1mwhPyqi5yN6CFe3LgHYp2L1c
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
index 008a61f45ac1..5aab90cf5438 100644
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

