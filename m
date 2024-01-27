Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0407395
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 00:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314789; cv=none; b=jU1YUSSdxid43V3w6vqD4iQIqkymeLhQbN1bTTLFmqi9GEA7J3L1ZzuYNbAhsDXhtsua00VQ2fg1UpVRbNxGpe5EzFYN+ha4fSlIo8I4ECgJA4QKEmHOpHNWOsy0Z3HKCxGRZ2ujicbkDJf21saXXGt3aEJKDCkCzOw8yN2thDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314789; c=relaxed/simple;
	bh=uTi26V2MzJtJNZVNk17iXxL86RmaAHxtWr8TzutnTS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJMOqrDg/RlCpJH7gg2xHVhL2vvIq79FKRuTA8MXeC2En16yek5sGn6K0KF5D2/j110y9eDka9QqkSe1E2iTDPK1tQ+eE1YK54Yb97FYnwFKjArdK1yeu0GTZHvk21puP4/oNWYhu/0EWob/49hNnUCfSSeB1hhXsIrCnUxS70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JWk1iTHz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWk1iTHz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5101f2dfd97so1230330e87.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 16:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314784; x=1706919584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RijGLQFZHcqv92gTLyle4UGWg8cGZKgYkgyYQE7GkCw=;
        b=JWk1iTHzJzpglp6l5Ay3dUG9fjksSE5ZItlFnPVNkkwUuzq7y8r5N41VM3RW//NM2n
         690WtqLbGJahlImP19V9N7V85pFjDipX5V1ldh2Rimt2A6jkxobMrUl44hItci0KBRyT
         yI7btL0D+LRv3f62FOvSQk93ZV/EOkyXuZKbh3kbaiMfYWQybltZ65ZxYQnaqqsgb087
         icuffZZHBbzZIr6frqG82Wnk8XdTNTzH5Irid1laafN2YK8ykGtqFFQlVqoutQ9V5U0b
         LdO7Ro+wjd50RsKRAWa/kAvTXpff+l35vwY+ywigo9jh0/DBnQrF++eweihV+ItK0gaB
         S+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314784; x=1706919584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RijGLQFZHcqv92gTLyle4UGWg8cGZKgYkgyYQE7GkCw=;
        b=e1xcb+uiVB2jZT4DJP2yvEerSZIiEsU4OlPEMhOt4qsnOrvnG8E+a6sN8CrWXF531T
         o1GoqD8dybDlSl7peDXl06gfzWj3d69TzBJrBqp414n+wq+JcWumbojBNSX/mTvt8qaR
         eXR0D5Lc9y5iyGeVs39xaXscVhkNzE5LXD4+Y9DNn/Y0vN9e0FOG/2XMKWwwg8ltJBPy
         UqCTrvFq/cCu8t7pDsMHAhwLorxwpNVkQn/LezgRnXEug7HeB0vUzhML0kNc9+P+Zgsv
         uhoVEPXTu//9HqPZUUG3ES5oVw0jp6gRHOu/kfCKvI+umzqhiFlWlh/KbdILkgFwukmg
         5bIA==
X-Gm-Message-State: AOJu0YykehANbJK9qBu99XQTRh0fJ+tgEu4yIOZ1eQWduYB/imZjdI/H
	w6kccRIMQSTlcHYFQK9bV8q81AIRLk8tvzt16oc9t3QA5rjv0QuHDuDYzToCyJo=
X-Google-Smtp-Source: AGHT+IHXhvQ39nd+PSqqSqJd/nBtIFloGi99hX7CfKfchouqertJrL/Z5QqUIu501Bbs0iC6wDC36A==
X-Received: by 2002:a19:4f53:0:b0:510:d4a:d367 with SMTP id a19-20020a194f53000000b005100d4ad367mr270843lfk.2.1706314784131;
        Fri, 26 Jan 2024 16:19:44 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a339d705a10sm1141359ejb.80.2024.01.26.16.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:19:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 9/9] clk: samsung: gs101: don't CLK_IGNORE_UNUSED peric1_sysreg clock
Date: Sat, 27 Jan 2024 00:19:13 +0000
Message-ID: <20240127001926.495769-10-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have hooked it up in the DTS, we can drop the
CLK_IGNORE_UNUSED from here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 7f6c3b52d9ff..d55ed64d0e29 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3393,7 +3393,7 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK,
 	     "gout_peric1_sysreg_peric1_pclk", "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK,
-	     21, CLK_IGNORE_UNUSED, 0),
+	     21, 0, 0),
 };
 
 static const struct samsung_cmu_info peric1_cmu_info __initconst = {
-- 
2.43.0.429.g432eaa2c6b-goog

