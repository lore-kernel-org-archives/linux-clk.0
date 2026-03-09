Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE93D6CCD
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067192; cv=none; b=L738v8NDXvaxCquKQqL2Jx1camAL9GhUm/W6OSHzPd2SgnHQBbgCpqLPoIzyjxpRzmhoaiFkAQvZ2nn3uaAFgICMDSEcWkkgvum794WvZFCGvBtoz+EC1/dGfLGvJF/Glh5Mhh4nbrvvDy9MbVIBAp/0Chs5utdJAbOkfIMzdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067192; c=relaxed/simple;
	bh=dMZXmPTgZtLSjZQopWzFPcObiL7raR3roKjSyKaQhog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfwFya8fgMoHJizp8yt75GD3g2PVkE6/YXrU9mKP+VmXE6Jt7lauxwN2Kfw95BoluuhkHxeQWAsQRIZr0SFEqfH+qqB668p8qAw9/36x9HfFWVhnV5oM8CeyW19+wtZRf6kccoo7ozgRsMETBAAdhhByaZBPBwQZBm20ZCcTEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DIe/59Wv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiphL6De; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DIe/59Wv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiphL6De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rHW5JEPBvekQYWrVzvxP7K9yA//ns1eBlmAJkGYVAsY=;
	b=DIe/59Wvc3AzQkRJDR1kwsr5ZOHKRCpvKtZS8SMFkxpPaT06bEDnsqcbUby6nW4VNZonJy
	6YOVHLEbv4fKzq9x48xWe7XEUyp+m3q7xEQ2QHD9JaU9MGdT2U74T1wVfKSPjCp6kx4Si9
	AAc5Hnr22QuAl3A0mRwN6VwkWQ9uQwM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-7JVDAt82O1iy9TiGC4BBDw-1; Mon, 09 Mar 2026 10:39:45 -0400
X-MC-Unique: 7JVDAt82O1iy9TiGC4BBDw-1
X-Mimecast-MFC-AGG-ID: 7JVDAt82O1iy9TiGC4BBDw_1773067185
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso139467481cf.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067185; x=1773671985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHW5JEPBvekQYWrVzvxP7K9yA//ns1eBlmAJkGYVAsY=;
        b=AiphL6DejaXw/PemHvotAL8ZEjtlyCiaq0OFlKow/it2C+F9FZQ07PSdtEXi73ysbZ
         PYrcv8J3Jmo/336c2GrsCYYE8fZuFiHWM/4QGDbOvqWQg0SS1DAIWGGMylCl0rjAzgL0
         OtUz02xTHYVP1BMwztHSp7Wfi0y5IDkgN1VBrc0XHdPPo2I8MQHz7vRwrpqnarDvGzHb
         o38Pk/K4YEUx1UOGESdiRiwiKj3bulGC9OS/mr4GCGgwMuI0ALA80s22YwJthu/bqGDd
         GOooU3e1bqZE+8zjsbiUTvz4YqtzfpXOpmP7YWPqfA1y2CMWr+ed7/0CQjtPTv0a1MP+
         i/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067185; x=1773671985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHW5JEPBvekQYWrVzvxP7K9yA//ns1eBlmAJkGYVAsY=;
        b=HEzW7OAJRedcefWHhNFSeKJ6xzvYel6GRNhkZK3/eCoc9XdLE2e2kzW6NSjRSs+nSS
         6Hp0yvcMiyVlI/dG6S6+QQccBauZ/vVRtM2U7DGBmyLBNMDMX2v4VDwO+aKt1EQ9I5er
         DSmmR1LGV83z6eqU44n/GoAb6Ur90HNR79pf6cq8JTW8MO89DwjQlFKuCDARL1jfxBnq
         yfk6zDPa6dV04D4Ald9zxBka9x2vINJfiODBpBMXE3mHELypZyMw9Ng1/orBgmVYqbZX
         srLLwb+dxMSKExO42LE1yWkQ9rKcqJ9y87sd3bRn62cWQ6kbOFsPatfHjf61xkNcUw48
         jFnw==
X-Gm-Message-State: AOJu0YwztbfBYEPsNZvcl5hv4NpwG90vtNkQnzJeVb2whz4WdjVEaj6/
	2hPhqVPUHMT7CuldGr8YkMkOL1OvB7zPH8fkkYEIHp4bR/0f8ZL4Ft3V9Lt5l1AlnRi4Rzq6UkB
	M+ygnRVNRtdHWxT7JwzYQNeFBX5pSJp+giUKeIVh/TyTh2tG+hm8et4T1JM0nyLBOZCwQPw==
X-Gm-Gg: ATEYQzwIcPmwrei1U6SwzA7RO9IXZrDNEeh3hqORQcUr6Sh2CkaU+hzaH/9/dLpNB8j
	uF314EeVQB5WLgLLo3Lr4mo9dAvQT4aN5dd1rzO5XbiCQsdhkZVi4i2pl5j6cjX8befl5ElX0Li
	TO+S4TxzxTqwgNONJ+tY9Bo7QHjkkLzVUnwy/qil46+BboLwjHU7oXYlfk4EMqZa6qDqKhQQtfH
	SMHnKMG99+vJ7oiBRC9dqtoIppoAHPHkQXoD0TB/sTM06QxI+8j8altvjna4emQl2KKbPdvlYKn
	PlR1S0l+UFRCTjsiSu0D1mBrBH5gZypHrTYERoCbZIgzQ28jNn3CWKuYyOVUqHo0ClHZcvakgPp
	VKIazawRGA79c0Is9FR7wohYzZlZ3azA2ppaCMbf1pffwY7R89vyZWSvHZCBgKw==
X-Received: by 2002:a05:620a:31a0:b0:8cd:9322:d445 with SMTP id af79cd13be357-8cd9322d7f0mr36284885a.27.1773067185322;
        Mon, 09 Mar 2026 07:39:45 -0700 (PDT)
X-Received: by 2002:a05:620a:31a0:b0:8cd:9322:d445 with SMTP id af79cd13be357-8cd9322d7f0mr36281085a.27.1773067184921;
        Mon, 09 Mar 2026 07:39:44 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:51 -0400
Subject: [PATCH v2 12/12] clk: sprd: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-12-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dMZXmPTgZtLSjZQopWzFPcObiL7raR3roKjSyKaQhog=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z6iK/fz5f7Dpsc6Tvy2LGWcKvzuXbDxzYfLW2yv8
 TteviMh1lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEcjIYGV6dFX+4qUz3zQOP
 OUE+C+X5Dff/vVB++PXKXZbWb51kZR0Z/nDf+bZj4TMtJyNj1/Yoz/nve3ZculFXZjF9imSDs2x
 hFh8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/sprd/pll.c | 7 -------
 drivers/clk/sprd/pll.h | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
index bc2db19aec0e9d64bac039260b2fbeacaa61d660..31f016030da371c9fe842eab01f6a1b7043b82f1 100644
--- a/drivers/clk/sprd/pll.c
+++ b/drivers/clk/sprd/pll.c
@@ -254,16 +254,9 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static int sprd_pll_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 const struct clk_ops sprd_pll_ops = {
 	.prepare = sprd_pll_clk_prepare,
 	.recalc_rate = sprd_pll_recalc_rate,
-	.determine_rate = sprd_pll_determine_rate,
 	.set_rate = sprd_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(sprd_pll_ops);
diff --git a/drivers/clk/sprd/pll.h b/drivers/clk/sprd/pll.h
index 6558f50d0296bc2acd43b031e3927c288434fc08..91b20c1f4dda8e64b4ca795caab128036c11a4fa 100644
--- a/drivers/clk/sprd/pll.h
+++ b/drivers/clk/sprd/pll.h
@@ -78,7 +78,7 @@ struct sprd_pll {
 			.regmap		= NULL,			\
 			.reg		= _reg,			\
 			.hw.init	= _fn(_name, _parent,	\
-					      &sprd_pll_ops, 0),\
+					      &sprd_pll_ops, CLK_ROUNDING_NOOP), \
 		},						\
 	}
 

-- 
2.53.0

