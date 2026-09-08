Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6DC59B691
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889678; cv=none; b=qJ3Ii1+aGFsf3EVY9cjI6nTT9xmE5n6Zcl+dXMh1/cJCY5iCycYMIbAP+8AM7/W/1QfI/qY4sKhjId7JLrJ0s39/roqJkAtqhG2lml/b2RI+d3OATMP+SFKrX9MmbjKzJUDPWW0RbvEPRzphd/rNIB/jdFT162jw+doVXq9ATUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889678; c=relaxed/simple;
	bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdmY2q0EeoZDTlIBFuWe38JkASJaHjXL1xxXqnS12kDfLidTy54g0qFoI3aYiB/fSdHj/njs2v6ss+d247VeUDPclY+7Nu/rkxbeLTKLx4r+DJrGROaz8/LQxQs2r6hF8xQ8+M+BlFm+Uv9BMATl9eRRO4hdrHD+jbnjcduANWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0JyWmFQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aqzEd+HK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0JyWmFQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aqzEd+HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
	b=R0JyWmFQKJkZon5nY6ckSUWQnnCIhGlPw0Baoms49+Nbf7lPDPxRHHU2/x4UawgSTo4NE2
	81MeJeuS43rACk3HF8rg3bBW2Sk5iPxBlwi+3J/XLDXVxSygPlD6mkxFabXjkitjeJCfHY
	az2WVRjzHJxlQCg3yA7fnPLUdGpFSc8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-GJkCe-u6OO6sszJCnR0Jig-1; Tue, 08 Sep 2026 13:47:52 -0400
X-MC-Unique: GJkCe-u6OO6sszJCnR0Jig-1
X-Mimecast-MFC-AGG-ID: GJkCe-u6OO6sszJCnR0Jig_1788889672
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93915f50a5cso1163936585a.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889672; x=1789494472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=aqzEd+HKXnfwVLgp+JQ13AYRiNrSGq5HLSkoXyH0ftgeECn31om9OdrtzZi4lfSr04
         WWyEw00N0cEG6Mc8zawCijcu0Fp5zDh05ZZZrZpDRwhTticRZNXJzbSWfTxKoRg80dl6
         hqaGv4NTGFIj7Ys7prwaV4wR5ZX6oaFo2xnM5YaUANAN765lZD9CgQ+nFfqddDJBnIDJ
         uppBNlvAo0hfa/7PJ1S03OThkxdCDWeU43dTR8mijgikRnuz/l/yzfHRDJ6ElL8S4FUd
         JTYa7HWZWmT+Ecv5dxojgWkiVji6EOyWRG7rS/NPpeExZyJKnh9VTYlvx1cPGW40SsXF
         TG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889672; x=1789494472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS/10M/g4Wr/wq9hJUaikpGp/lR/pIXDB913LdXZJIU=;
        b=qOfe1dsDB8Vm/PMRmKl/ZtGXitmM3XoUSQVyZLYulMxQ0ASA/DtU1R7ER/SR10Vzg3
         KImODkj9h1KYB1lTEjsvAbB4AuyZhyArhxPxktGMvKV20g/Pj6d2b9QnWHaYSJSA6UL8
         ZJXTIPODSb3XLZ4NNuU5bIzXbI9oQk9WA7uNVPbYi9SXmB46v4c0P7j/v7oRaNMOoe3z
         dOzqM4L4iAV7ZSQh6RewKFOi8uKQrQLUI/g/pfMCcq/XzF7BaXVQPx+9um2HHYhS5lfe
         QvqFCgS6iP/ftpglqr/Iq7hRCfnkrRnZ3ODkA3KbIi0i5jH5qKQkvxUV4v0Q9Pm8D6uS
         wJSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhKxZg87rwQwJiY/HwT4uIwYhhTxULRdVoFXwM4kzn4GmkPoD2+a3QNOPEJuJq7RjS3qTE7Q4q9+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mpB/EtpfPTquiRyWDXU43F+ZXRYLmroObRPIDpLcKc6IBkIzvK
	/2OYEOIqsejwWMRkkKbPM+SzPDnu9V0V3kkpyKn6QLwOFHstGRp5PMwzHgQlyaWH38boJVBaDvS
	Z3udqFirlbkJiOmt7HrpV5Aq0W1vcETcv+3obHZTeh7FABu8LpwKMY4JdhCAcnw==
X-Gm-Gg: AYBFou3qGaqVkTnRCdZnLEypW+s0gD9hSdci9i7bGxxQ9+xCutLtMUCRyfDmZm+Ekvz
	7pZRvUFlDWuumdNmBxWaq5hw6Ikbyo5jsxHNCflrqymdhrdzCTLkzEbz11Nrhovq9AkjnBk+x4d
	aIvSWoaZA5fDf3vQc0Q4vz3G/GgBdjKWU+bqA9+3bs09M71Vb120AS5FImdkWzkqp7FhvgzxoZU
	T/2/uJo3oMNOi36s0o3D9dqSf90ztmPrcMIScJGA5HyT+1W8dVj66ariyLuRGvnf7agDaTO+NtC
	FixkxqVIdl/xFU9+bsHyFkNLyzpoHGXS86jM6vUPY+KwJR6CbfMSRzIqqU1PvG2cMD8mR9tX0YQ
	huhCScqV/IEDOyWAvezR0mb0VJUsB1sjgcWBlSuo=
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833249985a.34.1788889672094;
        Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:939:72cb:baeb with SMTP id af79cd13be357-93972cbbcabmr2833244485a.34.1788889671455;
        Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:21 -0400
Subject: [PATCH 4/4] clk: renesas: convert drivers over to use
 subsys_platform_driver()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rrY1owvxS07jbIpCbpLvTgnzot37t+bLysMBqFgi+Qo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNl/XMezhn1zYsGtX80ei091LkxnfKvOcIY9mvH5O
 auzVZ6eHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRjAjw8w1per1JTesE1OS
 lj27piPfMPvGTsNPXX8nB0r//p46/yXD/4RZf9ZskF6m2PKfMWbh093KwmY9CS78O+6I73h+enE
 TMysA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in the drivers and convert them over to use
subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/clk/renesas/r9a06g032-clocks.c | 8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c | 7 +------
 drivers/clk/renesas/rzg2l-cpg.c        | 7 +------
 drivers/clk/renesas/rzv2h-cpg.c        | 7 +------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1da25e4fb4d7..3df3f2b2c6de 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1419,10 +1419,4 @@ static struct platform_driver r9a06g032_clock_driver = {
 	},
 };
 
-static int __init r9a06g032_clocks_init(void)
-{
-	return platform_driver_probe(&r9a06g032_clock_driver,
-			r9a06g032_clocks_probe);
-}
-
-subsys_initcall(r9a06g032_clocks_init);
+subsys_platform_driver_probe(r9a06g032_clock_driver, r9a06g032_clocks_probe);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 80f4403ea2ba..87b555e38980 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1428,12 +1428,7 @@ static struct platform_driver cpg_mssr_driver = {
 	},
 };
 
-static int __init cpg_mssr_init(void)
-{
-	return platform_driver_probe(&cpg_mssr_driver, cpg_mssr_probe);
-}
-
-subsys_initcall(cpg_mssr_init);
+subsys_platform_driver_probe(cpg_mssr_driver, cpg_mssr_probe);
 
 void __init mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
 			     unsigned int num_mod_clks,
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7f8decef92fd..f6293c968bcf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2758,11 +2758,6 @@ static struct platform_driver rzg2l_cpg_driver = {
 	},
 };
 
-static int __init rzg2l_cpg_init(void)
-{
-	return platform_driver_probe(&rzg2l_cpg_driver, rzg2l_cpg_probe);
-}
-
-subsys_initcall(rzg2l_cpg_init);
+subsys_platform_driver_probe(rzg2l_cpg_driver, rzg2l_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/G2L CPG Driver");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 63f13fe4e4b0..7ce94680c79a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1643,11 +1643,6 @@ static struct platform_driver rzv2h_cpg_driver = {
 	},
 };
 
-static int __init rzv2h_cpg_init(void)
-{
-	return platform_driver_probe(&rzv2h_cpg_driver, rzv2h_cpg_probe);
-}
-
-subsys_initcall(rzv2h_cpg_init);
+subsys_platform_driver_probe(rzv2h_cpg_driver, rzv2h_cpg_probe);
 
 MODULE_DESCRIPTION("Renesas RZ/V2H CPG Driver");

-- 
2.55.0

