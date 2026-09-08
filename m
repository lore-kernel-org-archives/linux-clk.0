Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C2311C2C
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889678; cv=none; b=c30aMWVtRcpUrod36qiNQYGsIl36X2o7+4CgV3d9LU8NII0CKcoXrewBt5FzJ3R6TfkiU0lzoqcuL2DNl3MZqc9wC9zmZ2M6BVoThMGDKyQ2l11vBCJrD2xcKe3CMEWDcMXggh7uc0aMQp5Z1tvHdb7kWt99d4QXieH1d+1Zvwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889678; c=relaxed/simple;
	bh=tacI9m1MslX9y61QR1VhLpeyfq84AgyzmglYCONMaCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDIlRg4UrbmNMwqzcgeqavEHo6e2hth2VW1r2wX18XN6Li69/IR7XAlNnuahABuVJ6M1t+HsfI0TdiVKtKFQfMktbC0KJOnjPRIq1CQhCqWkdGKJtKFkrBgYtEXwf9bT2sUM1xtzParSUN+AtSlJCutcHaHasldiBU0iNcEffy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iaPahV4K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pt4hjYW+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iaPahV4K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pt4hjYW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPKIqdvvTIVk8Ctx84tr0wEUgwsrKq1F194NqBriiB4=;
	b=iaPahV4KSl4FkeU9t6rZMNXp8xatqfg/Y6a4aCDxgrcmchCX2rxeuYF3R+9Y91yqQPnjI9
	0lAcpg67ok0xqOAcEeSvVB9GYf2cenB6t7FV0lTy+rid5B/iL8lfQpMrRbZV+AVXY+3W/r
	C7MFr/AT0xm3tWGWHB3aTaEbsIizmUE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-OOKNYsdcNTaASEs75bB4nQ-1; Tue, 08 Sep 2026 13:47:51 -0400
X-MC-Unique: OOKNYsdcNTaASEs75bB4nQ-1
X-Mimecast-MFC-AGG-ID: OOKNYsdcNTaASEs75bB4nQ_1788889671
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5308af39ab3so28188301cf.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889671; x=1789494471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPKIqdvvTIVk8Ctx84tr0wEUgwsrKq1F194NqBriiB4=;
        b=Pt4hjYW+/G7jQ+ZP9UNo+ncr+MPVsIHjc9Odm8OQuKDL1H8LjnGpchJoxsHzwHIb2R
         fyRc1Od2iYCAolmJSy//AZg6kboI+2Xvh3qiw51dCyUVOwXGiX3aD2M7+06JFJLrY3PY
         Sr+0GNG4N9eryXwXXYunw6Ifc6J122pkVZ9Vb2XUhutvRB/zljlno2+CuzXta5/yCSSw
         wK6g+Cac15ni7MYscE7asAMyV6YFPXhsV3PYdb3hK6HT1CsRX5PuymScHZ+cotH5HDTs
         BHAU8o8loHpK27b1v+QsepCJWhEZKM/FFPVdDvXZiPxLjsrcNECShgkPm/Z7s/K7iC4m
         SK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889671; x=1789494471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPKIqdvvTIVk8Ctx84tr0wEUgwsrKq1F194NqBriiB4=;
        b=CVAhiymxqeNN46oi1hz7zHmgd9Q0iQ+mR/Qe8+7LSlsim4+ZMOshdVIYIL+eQe/6kU
         og8bvNq4uPtUaOztP+ZxCoYMuCSlCRmaoDmM8puEAg+aHOEnQwTpzJEsnnQT+tLIrb+k
         xYAeI+T2wa1bHiHXhE1Y6t6wjndfdX8ErOsGFObtLU3dVSED+KuINgoiRsWslj2qrQLG
         ZcWU1Hfg1pwUKDNplXF6zwqLJlb5cxvoZHctPx6RBVJxUwWTIirpYc/K399jPeeqzn37
         OEpRnUsfXmnlFG2NsEYHmlOOPT5NlK63xYNfSbAcXTYx5GXorLmf9zBk92k/p+G+/mwE
         Q64A==
X-Forwarded-Encrypted: i=1; AKwUvBzfp0Nxe/YV+SGNc/9yQuPBJCVo9kX77vw5yR4GK8peyvLBIGQP9pXbEcn5ovrLe+XLslIshbtcIms=@vger.kernel.org
X-Gm-Message-State: AFuF++nXTN/JII3RHml9rz7HkXmobmvY1iSAvoe4k2Xo0auh7cGTSnbV
	IXQPZGyb0C5ehf5/uJCm5bQQ1MSaS7oliqj9nfr6peojS7o/6ykJrtoWMYp5m4dbhKz2ePPz7VS
	5EN64MFBGN3USS83S5d+7+9C9EWWWktl8drvAN/PQQimILx+eZxp72W1e9CmB6A==
X-Gm-Gg: AYBFou21pAbr91YsqUnW16OUnth9l+nF3M2BOSLG17fyeMKpbW6A+EbPM09lEl9L65w
	7obN4fXv3rQSJDQv16JIkw7TJj237P5Yly9Ryv9AHAXT9Ao3YyWFAgi4qEUfGSW3PyhngxzIcfR
	Zfa0S0ptJiuKyhODuIXnIhOA+Fi6pTftM8fUT5KNVWYpvVnBrR7ny7Ei9/0+nc9hj+6QvSAy4mx
	T0oebAw67mcKg6PhJpEfYuMHxyhfmDheMm17CLfI6/o9woQ2GvIPVXGcNYl1T32CnizbkULtldP
	tjTq63AtH1ohxtSgDUnxfP1/vwjIU+CWcvszbsh2+9Ii3fWcDkcwZvK6thuW39Vb/yepLWoH1E1
	gqzuOedQfqyQxdWWWwodN9kBTTnE+Qs0d6xlt6bI=
X-Received: by 2002:a05:620a:1982:b0:933:aa0:bb83 with SMTP id af79cd13be357-93980400a22mr3419680285a.34.1788889670660;
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1982:b0:933:aa0:bb83 with SMTP id af79cd13be357-93980400a22mr3419673685a.34.1788889670067;
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:20 -0400
Subject: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=31919; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tacI9m1MslX9y61QR1VhLpeyfq84AgyzmglYCONMaCY=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGqgSj7IDYiWKxmxdkfNfcWEWMkMGAY6ZIsvvSm5yVOdwmFiv
 Yh1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmqgSj4ACgkQt9LdJ11+wIdEyAEAyoi+
 xjlnOw08stYMFdEyQ7F81bMKfeinPXAGot+qh3EBALVPBlp0ANCD1TMGDbkkORyVbiPy88uwlbW
 sy0cb3eIF
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in the drivers and convert them over to use
subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/clk/qcom/dispcc-x1e80100.c  | 12 +-----------
 drivers/clk/qcom/gcc-eliza.c        | 12 +-----------
 drivers/clk/qcom/gcc-glymur.c       | 12 +-----------
 drivers/clk/qcom/gcc-hawi.c         | 12 +-----------
 drivers/clk/qcom/gcc-kaanapali.c    | 12 +-----------
 drivers/clk/qcom/gcc-kuno.c         | 12 +-----------
 drivers/clk/qcom/gcc-milos.c        | 12 +-----------
 drivers/clk/qcom/gcc-nord.c         | 12 +-----------
 drivers/clk/qcom/gcc-qcm2290.c      | 12 +-----------
 drivers/clk/qcom/gcc-qcs615.c       | 12 +-----------
 drivers/clk/qcom/gcc-qcs8300.c      | 12 +-----------
 drivers/clk/qcom/gcc-qdu1000.c      | 12 +-----------
 drivers/clk/qcom/gcc-sar2130p.c     | 12 +-----------
 drivers/clk/qcom/gcc-sc7280.c       | 12 +-----------
 drivers/clk/qcom/gcc-sc8280xp.c     | 12 +-----------
 drivers/clk/qcom/gcc-sdx55.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx65.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx75.c        | 12 +-----------
 drivers/clk/qcom/gcc-shikra.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm4450.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm6115.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm6125.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm6375.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm7150.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8150.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8250.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8350.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8450.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8550.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8650.c       | 12 +-----------
 drivers/clk/qcom/gcc-sm8750.c       | 12 +-----------
 drivers/clk/qcom/gcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/lpasscc-sc7280.c   | 12 +-----------
 drivers/clk/qcom/lpasscc-sdm845.c   | 12 +-----------
 drivers/clk/qcom/tcsrcc-eliza.c     | 12 +-----------
 drivers/clk/qcom/tcsrcc-glymur.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-kaanapali.c | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8550.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8650.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8750.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-x1e80100.c  | 12 +-----------
 drivers/clk/qcom/videocc-sm8750.c   | 12 +-----------
 42 files changed, 42 insertions(+), 462 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 795279609c0b..d3dc678a298d 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1704,17 +1704,7 @@ static struct platform_driver disp_cc_x1e80100_driver = {
 	},
 };
 
-static int __init disp_cc_x1e80100_init(void)
-{
-	return platform_driver_register(&disp_cc_x1e80100_driver);
-}
-subsys_initcall(disp_cc_x1e80100_init);
-
-static void __exit disp_cc_x1e80100_exit(void)
-{
-	platform_driver_unregister(&disp_cc_x1e80100_driver);
-}
-module_exit(disp_cc_x1e80100_exit);
+subsys_platform_driver(disp_cc_x1e80100_driver);
 
 MODULE_DESCRIPTION("QTI Display Clock Controller X1E80100 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index fe18942a59ac..ee486c24fe66 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3090,17 +3090,7 @@ static struct platform_driver gcc_eliza_driver = {
 	},
 };
 
-static int __init gcc_eliza_init(void)
-{
-	return platform_driver_register(&gcc_eliza_driver);
-}
-subsys_initcall(gcc_eliza_init);
-
-static void __exit gcc_eliza_exit(void)
-{
-	platform_driver_unregister(&gcc_eliza_driver);
-}
-module_exit(gcc_eliza_exit);
+subsys_platform_driver(gcc_eliza_driver);
 
 MODULE_DESCRIPTION("QTI GCC Eliza Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2ee4820b6fdf..9fdf76d0f692 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8571,17 +8571,7 @@ static struct platform_driver gcc_glymur_driver = {
 	},
 };
 
-static int __init gcc_glymur_init(void)
-{
-	return platform_driver_register(&gcc_glymur_driver);
-}
-subsys_initcall(gcc_glymur_init);
-
-static void __exit gcc_glymur_exit(void)
-{
-	platform_driver_unregister(&gcc_glymur_driver);
-}
-module_exit(gcc_glymur_exit);
+subsys_platform_driver(gcc_glymur_driver);
 
 MODULE_DESCRIPTION("QTI GCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index f1b95753c3a3..39fd5f56ca61 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -3843,17 +3843,7 @@ static struct platform_driver gcc_hawi_driver = {
 	},
 };
 
-static int __init gcc_hawi_init(void)
-{
-	return platform_driver_register(&gcc_hawi_driver);
-}
-subsys_initcall(gcc_hawi_init);
-
-static void __exit gcc_hawi_exit(void)
-{
-	platform_driver_unregister(&gcc_hawi_driver);
-}
-module_exit(gcc_hawi_exit);
+subsys_platform_driver(gcc_hawi_driver);
 
 MODULE_DESCRIPTION("QTI GCC HAWI Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..e310b5c9b5c7 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3524,17 +3524,7 @@ static struct platform_driver gcc_kaanapali_driver = {
 	},
 };
 
-static int __init gcc_kaanapali_init(void)
-{
-	return platform_driver_register(&gcc_kaanapali_driver);
-}
-subsys_initcall(gcc_kaanapali_init);
-
-static void __exit gcc_kaanapali_exit(void)
-{
-	platform_driver_unregister(&gcc_kaanapali_driver);
-}
-module_exit(gcc_kaanapali_exit);
+subsys_platform_driver(gcc_kaanapali_driver);
 
 MODULE_DESCRIPTION("QTI GCC Kaanapali Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-kuno.c b/drivers/clk/qcom/gcc-kuno.c
index 787111397df9..55a2fbc74268 100644
--- a/drivers/clk/qcom/gcc-kuno.c
+++ b/drivers/clk/qcom/gcc-kuno.c
@@ -1467,17 +1467,7 @@ static struct platform_driver gcc_kuno_driver = {
 	},
 };
 
-static int __init gcc_kuno_init(void)
-{
-	return platform_driver_register(&gcc_kuno_driver);
-}
-subsys_initcall(gcc_kuno_init);
-
-static void __exit gcc_kuno_exit(void)
-{
-	platform_driver_unregister(&gcc_kuno_driver);
-}
-module_exit(gcc_kuno_exit);
+subsys_platform_driver(gcc_kuno_driver);
 
 MODULE_DESCRIPTION("QTI GCC Kuno Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index 4219af2879d9..10a5f3ab0d42 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -3208,17 +3208,7 @@ static struct platform_driver gcc_milos_driver = {
 	},
 };
 
-static int __init gcc_milos_init(void)
-{
-	return platform_driver_register(&gcc_milos_driver);
-}
-subsys_initcall(gcc_milos_init);
-
-static void __exit gcc_milos_exit(void)
-{
-	platform_driver_unregister(&gcc_milos_driver);
-}
-module_exit(gcc_milos_exit);
+subsys_platform_driver(gcc_milos_driver);
 
 MODULE_DESCRIPTION("QTI GCC Milos Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 5c9d25f53a6d..4f87e06b33ab 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1862,17 +1862,7 @@ static struct platform_driver gcc_nord_driver = {
 	},
 };
 
-static int __init gcc_nord_init(void)
-{
-	return platform_driver_register(&gcc_nord_driver);
-}
-subsys_initcall(gcc_nord_init);
-
-static void __exit gcc_nord_exit(void)
-{
-	platform_driver_unregister(&gcc_nord_driver);
-}
-module_exit(gcc_nord_exit);
+subsys_platform_driver(gcc_nord_driver);
 
 MODULE_DESCRIPTION("QTI GCC NORD Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 2532c0b36bc5..cf7d05558be9 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -2923,17 +2923,7 @@ static struct platform_driver gcc_qcm2290_driver = {
 	},
 };
 
-static int __init gcc_qcm2290_init(void)
-{
-	return platform_driver_register(&gcc_qcm2290_driver);
-}
-subsys_initcall(gcc_qcm2290_init);
-
-static void __exit gcc_qcm2290_exit(void)
-{
-	platform_driver_unregister(&gcc_qcm2290_driver);
-}
-module_exit(gcc_qcm2290_exit);
+subsys_platform_driver(gcc_qcm2290_driver);
 
 MODULE_DESCRIPTION("QTI GCC QCM2290 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..d19792027cd9 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -3017,17 +3017,7 @@ static struct platform_driver gcc_qcs615_driver = {
 	},
 };
 
-static int __init gcc_qcs615_init(void)
-{
-	return platform_driver_register(&gcc_qcs615_driver);
-}
-subsys_initcall(gcc_qcs615_init);
-
-static void __exit gcc_qcs615_exit(void)
-{
-	platform_driver_unregister(&gcc_qcs615_driver);
-}
-module_exit(gcc_qcs615_exit);
+subsys_platform_driver(gcc_qcs615_driver);
 
 MODULE_DESCRIPTION("QTI GCC QCS615 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..57014c4f8c6d 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3726,17 +3726,7 @@ static struct platform_driver gcc_qcs8300_driver = {
 	},
 };
 
-static int __init gcc_qcs8300_init(void)
-{
-	return platform_driver_register(&gcc_qcs8300_driver);
-}
-subsys_initcall(gcc_qcs8300_init);
-
-static void __exit gcc_qcs8300_exit(void)
-{
-	platform_driver_unregister(&gcc_qcs8300_driver);
-}
-module_exit(gcc_qcs8300_exit);
+subsys_platform_driver(gcc_qcs8300_driver);
 
 MODULE_DESCRIPTION("QTI GCC QCS8300 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..a139fd8f722d 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2689,17 +2689,7 @@ static struct platform_driver gcc_qdu1000_driver = {
 	},
 };
 
-static int __init gcc_qdu1000_init(void)
-{
-	return platform_driver_register(&gcc_qdu1000_driver);
-}
-subsys_initcall(gcc_qdu1000_init);
-
-static void __exit gcc_qdu1000_exit(void)
-{
-	platform_driver_unregister(&gcc_qdu1000_driver);
-}
-module_exit(gcc_qdu1000_exit);
+subsys_platform_driver(gcc_qdu1000_driver);
 
 MODULE_DESCRIPTION("QTI GCC QDU1000 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 475e2cda3618..7456001cf25e 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2350,17 +2350,7 @@ static struct platform_driver gcc_sar2130p_driver = {
 	},
 };
 
-static int __init gcc_sar2130p_init(void)
-{
-	return platform_driver_register(&gcc_sar2130p_driver);
-}
-subsys_initcall(gcc_sar2130p_init);
-
-static void __exit gcc_sar2130p_exit(void)
-{
-	platform_driver_unregister(&gcc_sar2130p_driver);
-}
-module_exit(gcc_sar2130p_exit);
+subsys_platform_driver(gcc_sar2130p_driver);
 
 MODULE_DESCRIPTION("QTI GCC SAR2130P Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..e1fe64463de6 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3492,17 +3492,7 @@ static struct platform_driver gcc_sc7280_driver = {
 	},
 };
 
-static int __init gcc_sc7280_init(void)
-{
-	return platform_driver_register(&gcc_sc7280_driver);
-}
-subsys_initcall(gcc_sc7280_init);
-
-static void __exit gcc_sc7280_exit(void)
-{
-	platform_driver_unregister(&gcc_sc7280_driver);
-}
-module_exit(gcc_sc7280_exit);
+subsys_platform_driver(gcc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI GCC SC7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 2ab111585d7f..81533e71e7ef 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7581,17 +7581,7 @@ static struct platform_driver gcc_sc8280xp_driver = {
 	},
 };
 
-static int __init gcc_sc8280xp_init(void)
-{
-	return platform_driver_register(&gcc_sc8280xp_driver);
-}
-subsys_initcall(gcc_sc8280xp_init);
-
-static void __exit gcc_sc8280xp_exit(void)
-{
-	platform_driver_unregister(&gcc_sc8280xp_driver);
-}
-module_exit(gcc_sc8280xp_exit);
+subsys_platform_driver(gcc_sc8280xp_driver);
 
 MODULE_DESCRIPTION("Qualcomm SC8280XP GCC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 84c507656e8f..13d6c9e8183b 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1627,17 +1627,7 @@ static struct platform_driver gcc_sdx55_driver = {
 	},
 };
 
-static int __init gcc_sdx55_init(void)
-{
-	return platform_driver_register(&gcc_sdx55_driver);
-}
-subsys_initcall(gcc_sdx55_init);
-
-static void __exit gcc_sdx55_exit(void)
-{
-	platform_driver_unregister(&gcc_sdx55_driver);
-}
-module_exit(gcc_sdx55_exit);
+subsys_platform_driver(gcc_sdx55_driver);
 
 MODULE_DESCRIPTION("QTI GCC SDX55 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index fe297c606f97..8cae11a0b2c0 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -1591,17 +1591,7 @@ static struct platform_driver gcc_sdx65_driver = {
 	},
 };
 
-static int __init gcc_sdx65_init(void)
-{
-	return platform_driver_register(&gcc_sdx65_driver);
-}
-subsys_initcall(gcc_sdx65_init);
-
-static void __exit gcc_sdx65_exit(void)
-{
-	platform_driver_unregister(&gcc_sdx65_driver);
-}
-module_exit(gcc_sdx65_exit);
+subsys_platform_driver(gcc_sdx65_driver);
 
 MODULE_DESCRIPTION("QTI GCC SDX65 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 6712e76f875c..ce9f19655d6d 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2950,17 +2950,7 @@ static struct platform_driver gcc_sdx75_driver = {
 	},
 };
 
-static int __init gcc_sdx75_init(void)
-{
-	return platform_driver_register(&gcc_sdx75_driver);
-}
-subsys_initcall(gcc_sdx75_init);
-
-static void __exit gcc_sdx75_exit(void)
-{
-	platform_driver_unregister(&gcc_sdx75_driver);
-}
-module_exit(gcc_sdx75_exit);
+subsys_platform_driver(gcc_sdx75_driver);
 
 MODULE_DESCRIPTION("QTI GCC SDX75 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 2a1c1fc253aa..13c99a883e29 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4416,17 +4416,7 @@ static struct platform_driver gcc_shikra_driver = {
 	},
 };
 
-static int __init gcc_shikra_init(void)
-{
-	return platform_driver_register(&gcc_shikra_driver);
-}
-subsys_initcall(gcc_shikra_init);
-
-static void __exit gcc_shikra_exit(void)
-{
-	platform_driver_unregister(&gcc_shikra_driver);
-}
-module_exit(gcc_shikra_exit);
+subsys_platform_driver(gcc_shikra_driver);
 
 MODULE_DESCRIPTION("QTI GCC Shikra Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 30fc7af09930..4fb4d43e8582 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2871,17 +2871,7 @@ static struct platform_driver gcc_sm4450_driver = {
 	},
 };
 
-static int __init gcc_sm4450_init(void)
-{
-	return platform_driver_register(&gcc_sm4450_driver);
-}
-subsys_initcall(gcc_sm4450_init);
-
-static void __exit gcc_sm4450_exit(void)
-{
-	platform_driver_unregister(&gcc_sm4450_driver);
-}
-module_exit(gcc_sm4450_exit);
+subsys_platform_driver(gcc_sm4450_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM4450 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index a3c9dbe3a48a..5736e59d76ce 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3525,17 +3525,7 @@ static struct platform_driver gcc_sm6115_driver = {
 	},
 };
 
-static int __init gcc_sm6115_init(void)
-{
-	return platform_driver_register(&gcc_sm6115_driver);
-}
-subsys_initcall(gcc_sm6115_init);
-
-static void __exit gcc_sm6115_exit(void)
-{
-	platform_driver_unregister(&gcc_sm6115_driver);
-}
-module_exit(gcc_sm6115_exit);
+subsys_platform_driver(gcc_sm6115_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM6115 and SM4250 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm6125.c b/drivers/clk/qcom/gcc-sm6125.c
index 07bb1e5c4a30..ee3cd0b00fc5 100644
--- a/drivers/clk/qcom/gcc-sm6125.c
+++ b/drivers/clk/qcom/gcc-sm6125.c
@@ -4172,17 +4172,7 @@ static struct platform_driver gcc_sm6125_driver = {
 	},
 };
 
-static int __init gcc_sm6125_init(void)
-{
-	return platform_driver_register(&gcc_sm6125_driver);
-}
-subsys_initcall(gcc_sm6125_init);
-
-static void __exit gcc_sm6125_exit(void)
-{
-	platform_driver_unregister(&gcc_sm6125_driver);
-}
-module_exit(gcc_sm6125_exit);
+subsys_platform_driver(gcc_sm6125_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM6125 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index f47dc2808095..9c2acf8dc4b7 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3903,17 +3903,7 @@ static struct platform_driver gcc_sm6375_driver = {
 	},
 };
 
-static int __init gcc_sm6375_init(void)
-{
-	return platform_driver_register(&gcc_sm6375_driver);
-}
-subsys_initcall(gcc_sm6375_init);
-
-static void __exit gcc_sm6375_exit(void)
-{
-	platform_driver_unregister(&gcc_sm6375_driver);
-}
-module_exit(gcc_sm6375_exit);
+subsys_platform_driver(gcc_sm6375_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM6375 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index dcb5d82a1a31..2ab3e92eb3c7 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -3027,17 +3027,7 @@ static struct platform_driver gcc_sm7150_driver = {
 	},
 };
 
-static int __init gcc_sm7150_init(void)
-{
-	return platform_driver_register(&gcc_sm7150_driver);
-}
-subsys_initcall(gcc_sm7150_init);
-
-static void __exit gcc_sm7150_exit(void)
-{
-	platform_driver_unregister(&gcc_sm7150_driver);
-}
-module_exit(gcc_sm7150_exit);
+subsys_platform_driver(gcc_sm7150_driver);
 
 MODULE_DESCRIPTION("Qualcomm SM7150 Global Clock Controller");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index a93d1f412a7b..b38a44842686 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3808,17 +3808,7 @@ static struct platform_driver gcc_sm8150_driver = {
 	},
 };
 
-static int __init gcc_sm8150_init(void)
-{
-	return platform_driver_register(&gcc_sm8150_driver);
-}
-subsys_initcall(gcc_sm8150_init);
-
-static void __exit gcc_sm8150_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8150_driver);
-}
-module_exit(gcc_sm8150_exit);
+subsys_platform_driver(gcc_sm8150_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8150 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..93c1beacee01 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3667,17 +3667,7 @@ static struct platform_driver gcc_sm8250_driver = {
 	},
 };
 
-static int __init gcc_sm8250_init(void)
-{
-	return platform_driver_register(&gcc_sm8250_driver);
-}
-subsys_initcall(gcc_sm8250_init);
-
-static void __exit gcc_sm8250_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8250_driver);
-}
-module_exit(gcc_sm8250_exit);
+subsys_platform_driver(gcc_sm8250_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8250 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..cc6eb7ca9c03 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3833,17 +3833,7 @@ static struct platform_driver gcc_sm8350_driver = {
 	},
 };
 
-static int __init gcc_sm8350_init(void)
-{
-	return platform_driver_register(&gcc_sm8350_driver);
-}
-subsys_initcall(gcc_sm8350_init);
-
-static void __exit gcc_sm8350_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8350_driver);
-}
-module_exit(gcc_sm8350_exit);
+subsys_platform_driver(gcc_sm8350_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8350 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..d473a95bef92 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3479,17 +3479,7 @@ static struct platform_driver gcc_sm8450_driver = {
 	},
 };
 
-static int __init gcc_sm8450_init(void)
-{
-	return platform_driver_register(&gcc_sm8450_driver);
-}
-subsys_initcall(gcc_sm8450_init);
-
-static void __exit gcc_sm8450_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8450_driver);
-}
-module_exit(gcc_sm8450_exit);
+subsys_platform_driver(gcc_sm8450_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..d83a7bb5356b 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3375,17 +3375,7 @@ static struct platform_driver gcc_sm8550_driver = {
 	},
 };
 
-static int __init gcc_sm8550_init(void)
-{
-	return platform_driver_register(&gcc_sm8550_driver);
-}
-subsys_initcall(gcc_sm8550_init);
-
-static void __exit gcc_sm8550_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8550_driver);
-}
-module_exit(gcc_sm8550_exit);
+subsys_platform_driver(gcc_sm8550_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8550 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..9fa362f0c447 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3834,17 +3834,7 @@ static struct platform_driver gcc_sm8650_driver = {
 	},
 };
 
-static int __init gcc_sm8650_init(void)
-{
-	return platform_driver_register(&gcc_sm8650_driver);
-}
-subsys_initcall(gcc_sm8650_init);
-
-static void __exit gcc_sm8650_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8650_driver);
-}
-module_exit(gcc_sm8650_exit);
+subsys_platform_driver(gcc_sm8650_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8650 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..c08130218efe 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3259,17 +3259,7 @@ static struct platform_driver gcc_sm8750_driver = {
 	},
 };
 
-static int __init gcc_sm8750_init(void)
-{
-	return platform_driver_register(&gcc_sm8750_driver);
-}
-subsys_initcall(gcc_sm8750_init);
-
-static void __exit gcc_sm8750_exit(void)
-{
-	platform_driver_unregister(&gcc_sm8750_driver);
-}
-module_exit(gcc_sm8750_exit);
+subsys_platform_driver(gcc_sm8750_driver);
 
 MODULE_DESCRIPTION("QTI GCC SM8750 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..9402fd7fddb8 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7499,17 +7499,7 @@ static struct platform_driver gcc_x1e80100_driver = {
 	},
 };
 
-static int __init gcc_x1e80100_init(void)
-{
-	return platform_driver_register(&gcc_x1e80100_driver);
-}
-subsys_initcall(gcc_x1e80100_init);
-
-static void __exit gcc_x1e80100_exit(void)
-{
-	platform_driver_unregister(&gcc_x1e80100_driver);
-}
-module_exit(gcc_x1e80100_exit);
+subsys_platform_driver(gcc_x1e80100_driver);
 
 MODULE_DESCRIPTION("QTI GCC X1E80100 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
index e6b815aec46a..3789a7b37bdd 100644
--- a/drivers/clk/qcom/lpasscc-sc7280.c
+++ b/drivers/clk/qcom/lpasscc-sc7280.c
@@ -169,17 +169,7 @@ static struct platform_driver lpass_cc_sc7280_driver = {
 	},
 };
 
-static int __init lpass_cc_sc7280_init(void)
-{
-	return platform_driver_register(&lpass_cc_sc7280_driver);
-}
-subsys_initcall(lpass_cc_sc7280_init);
-
-static void __exit lpass_cc_sc7280_exit(void)
-{
-	platform_driver_unregister(&lpass_cc_sc7280_driver);
-}
-module_exit(lpass_cc_sc7280_exit);
+subsys_platform_driver(lpass_cc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI LPASS_CC SC7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index 5c1ea75f9ba8..1d7e78dd6015 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -144,17 +144,7 @@ static struct platform_driver lpass_cc_sdm845_driver = {
 	},
 };
 
-static int __init lpass_cc_sdm845_init(void)
-{
-	return platform_driver_register(&lpass_cc_sdm845_driver);
-}
-subsys_initcall(lpass_cc_sdm845_init);
-
-static void __exit lpass_cc_sdm845_exit(void)
-{
-	platform_driver_unregister(&lpass_cc_sdm845_driver);
-}
-module_exit(lpass_cc_sdm845_exit);
+subsys_platform_driver(lpass_cc_sdm845_driver);
 
 MODULE_DESCRIPTION("QTI LPASS_CC SDM845 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
index 127d1f0a1442..daab9a620490 100644
--- a/drivers/clk/qcom/tcsrcc-eliza.c
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -162,17 +162,7 @@ static struct platform_driver tcsr_cc_eliza_driver = {
 	},
 };
 
-static int __init tcsr_cc_eliza_init(void)
-{
-	return platform_driver_register(&tcsr_cc_eliza_driver);
-}
-subsys_initcall(tcsr_cc_eliza_init);
-
-static void __exit tcsr_cc_eliza_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_eliza_driver);
-}
-module_exit(tcsr_cc_eliza_exit);
+subsys_platform_driver(tcsr_cc_eliza_driver);
 
 MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 1791e23739ed..8ac60052fb14 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -296,17 +296,7 @@ static struct platform_driver tcsr_cc_glymur_driver = {
 	},
 };
 
-static int __init tcsr_cc_glymur_init(void)
-{
-	return platform_driver_register(&tcsr_cc_glymur_driver);
-}
-subsys_initcall(tcsr_cc_glymur_init);
-
-static void __exit tcsr_cc_glymur_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_glymur_driver);
-}
-module_exit(tcsr_cc_glymur_exit);
+subsys_platform_driver(tcsr_cc_glymur_driver);
 
 MODULE_DESCRIPTION("QTI TCSRCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
index db46d639edb8..78b77e7cd396 100644
--- a/drivers/clk/qcom/tcsrcc-kaanapali.c
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -124,17 +124,7 @@ static struct platform_driver tcsr_cc_kaanapali_driver = {
 	},
 };
 
-static int __init tcsr_cc_kaanapali_init(void)
-{
-	return platform_driver_register(&tcsr_cc_kaanapali_driver);
-}
-subsys_initcall(tcsr_cc_kaanapali_init);
-
-static void __exit tcsr_cc_kaanapali_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_kaanapali_driver);
-}
-module_exit(tcsr_cc_kaanapali_exit);
+subsys_platform_driver(tcsr_cc_kaanapali_driver);
 
 MODULE_DESCRIPTION("QTI TCSR_CC Kaanapali Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-sm8550.c b/drivers/clk/qcom/tcsrcc-sm8550.c
index 41d73f92a000..6cac619dd959 100644
--- a/drivers/clk/qcom/tcsrcc-sm8550.c
+++ b/drivers/clk/qcom/tcsrcc-sm8550.c
@@ -191,17 +191,7 @@ static struct platform_driver tcsr_cc_sm8550_driver = {
 	},
 };
 
-static int __init tcsr_cc_sm8550_init(void)
-{
-	return platform_driver_register(&tcsr_cc_sm8550_driver);
-}
-subsys_initcall(tcsr_cc_sm8550_init);
-
-static void __exit tcsr_cc_sm8550_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_sm8550_driver);
-}
-module_exit(tcsr_cc_sm8550_exit);
+subsys_platform_driver(tcsr_cc_sm8550_driver);
 
 MODULE_DESCRIPTION("QTI TCSRCC SM8550 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-sm8650.c b/drivers/clk/qcom/tcsrcc-sm8650.c
index 651e28067954..194aea6ec43a 100644
--- a/drivers/clk/qcom/tcsrcc-sm8650.c
+++ b/drivers/clk/qcom/tcsrcc-sm8650.c
@@ -173,17 +173,7 @@ static struct platform_driver tcsr_cc_sm8650_driver = {
 	},
 };
 
-static int __init tcsr_cc_sm8650_init(void)
-{
-	return platform_driver_register(&tcsr_cc_sm8650_driver);
-}
-subsys_initcall(tcsr_cc_sm8650_init);
-
-static void __exit tcsr_cc_sm8650_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_sm8650_driver);
-}
-module_exit(tcsr_cc_sm8650_exit);
+subsys_platform_driver(tcsr_cc_sm8650_driver);
 
 MODULE_DESCRIPTION("QTI TCSRCC SM8650 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
index 9fe840a448bf..b11ec403bb32 100644
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -124,17 +124,7 @@ static struct platform_driver tcsr_cc_sm8750_driver = {
 	},
 };
 
-static int __init tcsr_cc_sm8750_init(void)
-{
-	return platform_driver_register(&tcsr_cc_sm8750_driver);
-}
-subsys_initcall(tcsr_cc_sm8750_init);
-
-static void __exit tcsr_cc_sm8750_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_sm8750_driver);
-}
-module_exit(tcsr_cc_sm8750_exit);
+subsys_platform_driver(tcsr_cc_sm8750_driver);
 
 MODULE_DESCRIPTION("QTI TCSR_CC SM8750 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index ad1f6be83a53..7dbeff419f99 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -163,17 +163,7 @@ static struct platform_driver tcsr_cc_x1e80100_driver = {
 	},
 };
 
-static int __init tcsr_cc_x1e80100_init(void)
-{
-	return platform_driver_register(&tcsr_cc_x1e80100_driver);
-}
-subsys_initcall(tcsr_cc_x1e80100_init);
-
-static void __exit tcsr_cc_x1e80100_exit(void)
-{
-	platform_driver_unregister(&tcsr_cc_x1e80100_driver);
-}
-module_exit(tcsr_cc_x1e80100_exit);
+subsys_platform_driver(tcsr_cc_x1e80100_driver);
 
 MODULE_DESCRIPTION("QTI TCSR Clock Controller X1E80100 Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index b62271a7dac6..91d18a90b84f 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -445,17 +445,7 @@ static struct platform_driver video_cc_sm8750_driver = {
 	},
 };
 
-static int __init video_cc_sm8750_init(void)
-{
-	return platform_driver_register(&video_cc_sm8750_driver);
-}
-subsys_initcall(video_cc_sm8750_init);
-
-static void __exit video_cc_sm8750_exit(void)
-{
-	platform_driver_unregister(&video_cc_sm8750_driver);
-}
-module_exit(video_cc_sm8750_exit);
+subsys_platform_driver(video_cc_sm8750_driver);
 
 MODULE_DESCRIPTION("QTI VIDEO_CC SM8750 Driver");
 MODULE_LICENSE("GPL");

-- 
2.55.0

