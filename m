Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BA2C21EA
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109270; cv=none; b=RM5UNCe/gmaRRkwW1nG/xNCKVEYITq0kXVh003sBM7SvsYwdGiQ202Zt23uMPMqmHc4+aP+Bf5QaC8Jbvxx5/NkuExxBozTaAMcF7zrRjfrt78mrnnylbezGfYYx+qo99BqyWiuv6CUya1fWM0teKYQF80FN3LI5fLzQOY0vTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109270; c=relaxed/simple;
	bh=HQZAdepWAAG05MGOKGf2DOLqH7+vCZeV4b/mfyGkkQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RygRojnXAnCMn7KKdVONDeVAJ1Qwnwc8jJwGptWJ6xy/1CQVjDi7QAcY8JrVCPBm+ueDUi3mDizBmp1x3MKTXj/7BFPTjRQgyjJP8xr7PfFNG8kPmJEQx50F1qou4TgFcJcu1TYvcS4najUzmziX/LQL9nHoM6ZcvYRXDDIMklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fypj3eF0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7yh4sgK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fypj3eF0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7yh4sgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770109267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
	b=Fypj3eF0ks2fTaLtBo2EUSea29fLBrysPX6IGY3TKvTY9duOQcoUr9cExEeHy8VJWwP2bE
	QtD3AKwE3ppSlTsKoOeFApXP/z9CkFzld+XN5RdfkLhT0VjColYCDSE9Gnxi2l5SQ6Njtx
	GdoJ+hFsXnrt4Qgj8dUhXOoifWamoGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-lC1xFqTGMHu1TSrLXkKlMw-1; Tue, 03 Feb 2026 04:01:05 -0500
X-MC-Unique: lC1xFqTGMHu1TSrLXkKlMw-1
X-Mimecast-MFC-AGG-ID: lC1xFqTGMHu1TSrLXkKlMw_1770109265
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477c49f273fso51869105e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 01:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770109264; x=1770714064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=c7yh4sgKe21nE6sRv3xBmTeMiCHks4jzN+lHCDa9Q0eGuhBSYWkTg8xopJ+dlizDFB
         YVegHVQYG4BNKz1aMbxRWvhvffMJGpDQAU9D1n/kMsTMzPuypmJjqxblkEmiBfWh9lgl
         fhnXh2HnSTN4ItWjTmkzAEAeM5kU99/lK4ddGTUQaFNWQIkPKs/vfjBCKtI2UoGeFGT2
         ZTHNFNjISJwpe/wKBJg1VF71hcZEQ7hGuqOehIi5p12SDVTdKBw93MzQGC/LdTmBaq8P
         WC3SbdwI2l8b6oAlQAwUGItxdUFZrzTUk660l3EZ8ODklQRrLZ/Sp+ieJaQQ41uIN6w8
         jURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109264; x=1770714064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=H0yVWLnqc/Z1mp6619VWXtWbz27ylS3FW5r/G83DMxCwUS8xPhGmC/Y9Xi27c9w40L
         Xo76/IvRbDW0v6s+D+mZppaD0yir2HOgacV+0aLmBl/s83YKyAg7eiCDppqFXhh9wRn4
         xITPJRHfhVozevPfI4XzWGzPIbudq1s/v2vbq/oDMQb4OIDkwYJ6upxzdR9KFjsnrXAm
         KXpXF9rgmlTYQZaAq9WvsELmD+VTAMz2PTwzdcezKo08feFD8ytEOEPm6hjq7d8KXw+J
         ff6BCb6cRB91Fll+IQEpWoisbAmPTXuX+YKgxSN/edCbHOaZha1ZvAyL2C0rhPlzIXEP
         hYEg==
X-Forwarded-Encrypted: i=1; AJvYcCVh17onrIU4H5Q2HsJBIu5N5ZpJD93QTKGYaRS4cOvtt8+Vv5BKpZjhcfyExvRwFAyhs0XGd/BMIlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNeoF+C7hLxvB5B4xy/YbHv2MGdBdZMetmzHW+3xFVCKYojNKa
	jmcL61AgVdP4dLGBK5weTtpN7UlK5x4F0BB9pt3b/ALlnL2HAeiImYbw7vSgD1nUL4W1FiyPVbD
	BwrqKE65RB1jgz2W4qPqT6qUi1EFA6MwcSQaS4I4ncAMkP60/95farpguyKw75g==
X-Gm-Gg: AZuq6aLqab8NuVZpOrfmJMGnyrH2YxJlJ37NICtjLdWzGLMtlrzpu4ClpP1m9NelGLj
	nX2gRSendYS4jHtPPCC1fAQzAC549WspAIb7/zefBZxlseNJidVyofqP1MRTYi8R/ZRO94PAj/C
	jrRnhyilN3G1ZBVKcf/FoALiWYjIg4fW8SOvAA/bKNkZQC4DLJ8DK/826q7jnRd+wxR/9/NDiWR
	eWr2fTSBIUJhiPfXnz8gRuGL5VNtpGSRqrRxHWHQkXyg5NqGD3eLBIthAr0L+0wX6ZNyYEBTD9X
	ki4PTABaPsu8TBdDeMDWHcF1fKZDI6cvOpK7JKVmsVxigegfisQSfhqX7IlGZ0kqJ+4YD30Vr14
	gamHdCbo11XRAtbAqSI738+TXhfygWWdbfS4q32k4/tJcVSb98syTXfna2XE=
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202564155e9.17.1770109264459;
        Tue, 03 Feb 2026 01:01:04 -0800 (PST)
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202563795e9.17.1770109263990;
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132368csm46856093f8f.31.2026.02.03.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Brian Masney <bmasney@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: microchip: fix typo in reference to a config option
Date: Tue,  3 Feb 2026 10:01:01 +0100
Message-ID: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
with COMPILE_TEST") introduces a typo when referring to a config option in
an ifdef directive.

Fix this typo.

Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 509cdc060c34..b764ca059e68 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -74,7 +74,7 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
-#ifdef CONFIG_MATCH_PIC32
+#ifdef CONFIG_MACH_PIC32
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
-- 
2.52.0

