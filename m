Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641992571A0
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569451; cv=none; b=mgfU5lFqsdhVxBdiqdBYL+KsAb9eUZOz1ahMOCrdEu9m0aW9wW7z4aJZRTbl6ibDk32JjBFXvXwua5JiBRI+/4PT33bClM5UsfTKI76zW3PRAX7Q4rjUC0blOXTGVCBwVWIsMktnk5+yNm0rO2ah1tB90ikmBUcKtB4mtn4ZmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569451; c=relaxed/simple;
	bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP+RbJq3pYN0TX8btgwTxpuRaGJDN4KQLBKkibGaflZggu+fY/HSblkONe76rCUl7xnprWYFji65mylYajSa7Hc2tNvrtMuraG0Tmjaf1H1eHyLrkVeTb0SaDJBkzUa1luGqJp82rFPq6GIkxBTneD72GEeV/ukCkSPPa/OeQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pg6Ka+tU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pg6Ka+tU"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8765be29d6so291705266b.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569446; x=1769174246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=pg6Ka+tU0otA06bz6j664W3d9RAvgCKItczkpyPmZezTBm9CszX45+8U7GzFE0UfT+
         kawBbw2AT5hX8E5Nul/+y0PqIhB0zeBDLP4ONuYIaCa20rj6gAe1mT5jdBDT0hftYBs+
         I6NSA8huxRIocQyDAesfxN0eX5H0S+bBNEw9GDuu1/cjk4xeX/LAHKqW8spBe9HcAktZ
         bE086vkdawczgx6qoB4oT2UFEFABCP/jTlUo59f1l/a8sx7+fbu9mwWdnR7etDR1hMdA
         TGT52dc6FF5i+1SvSeHbab4AzysPxrs/lhSdyYISUX4gOKAjo+f7vzFdIMPbt1D5PMba
         yNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=sQuBHd9JSuYBNstwRqW4PLKvy08Za6JjZ89ofH0gskecdWeJdpbf9A78gU36ByFt62
         AyRy8nXKeEPdZ3pCSNbCdrEKfaEfRgK05JhTcRy3wB0fLPUu/qBL94ZHJoyePdc7SbFC
         7ca9rTsgwFuInEX3sv8Cuohrat0CydKkUq7gliALRm4QhJ20I10I/89Fgm+fY4+7xo0c
         /+AJ3QxFMO/iHGnr4U0/wKyYQt/BqgZC7oxLMY7k2oAs6dfrKhzV925fD+LqnEE9k5cG
         oDxLVSySFSVlAtjtgjTgP5FRRjwhwkSFS/QWgDzELr0VksZHMD475K0d4D8NNEgxYZnl
         k3DA==
X-Forwarded-Encrypted: i=1; AJvYcCUagJGGumcRzu56udHf588gaAnyhp1n0MTjjKMRG3/FSCP0UK/XiJf6O6h3TjDW/0N2z90bAUmVS9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAoeqwrThmrLByi6bofKyj5UVJ8Oq2PMQ6e8P3qblPFHIfnnc
	xzaLOqTA2xF6+GwuO/dqxWQTKoVm0IytoR18alDRtmV+N6eKZTZO+E57tHYXqLu/dlo=
X-Gm-Gg: AY/fxX460+Pggj+LIKVfeTK5PE8t7CCbsaDzXGj1N6hrcRYdt1i8N5GO5nZwFAt7Yg9
	qbebV2psdvyDx/BIKp5ffSeh2Xe+XNUVmOpVtBGQSZ3GHSp5RbwjJ0WSiWbQi4AqK2pMQ0WR0v5
	XCnWpcZZAhxkm63YS05spcxMTdWC+SfvrmRMrcLhDFKY/e6QE1BAj8OGu9/hYZcpJR9/OlajdzY
	OmSPQZbz2LZW9MoWoCym4y1mtwwLHCQytg94T10i3/Zgx19KFR9Jz0lWY6gcTIchHJOqfn+sU1E
	SugxDfsXMP9sV+dkcWRY659bnzO17YV4eYgC6eWI5tDfVFWaxZ1dxva6wsIHfS+v5epXF306Bro
	GhnSspHUk+ONbO/Mj5jIX2iR9fLM7xn1fmEWnkjxe6DueIP63nAVgYUVFYkYNKi9PTUYS4zYrL2
	XkfM02T4ySpLs3jQUvdoDQW/rwoJWNT3fqcdsL6t7+byBCUiJUKJej3xBBUmsyhlP+qcXEmTxRg
	cA=
X-Received: by 2002:a17:907:702:b0:b87:2cf8:f7b2 with SMTP id a640c23a62f3a-b879324c7c0mr293012266b.56.1768569446608;
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:22 +0100
Subject: [PATCH 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-3-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=2630;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
 b=x4GXwqWuo6jrdq33GBtT6tJ+qKr74k1xcIHAngz8zsb5pzHU3zqpcBtB/3sXgYHAwKBDQUV4/
 MCX7Lg5LzliARKzTzK8Eg1nE2qFKjmTiYZqAzcdsWWTMObC+Om+nhzP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On newer SoCs like Milos the CAMSS_TOP_GDSC power domains requires the
enablement of the multimedia NoC, otherwise the GDSC will be stuck on
'off'.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
icc_enable()/icc_disable() seems like a nice API but doesn't work
without setting the bandwidth first, so it's not very useful for this
driver, at least I couldn't figure out how to use it correctly.
---
 drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7deabf8400cf..ff1acaa3e008 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/interconnect.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -261,6 +262,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	icc_set_bw(sc->icc_path, 1, 1);
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);
 
@@ -360,6 +363,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);
 
+	icc_set_bw(sc->icc_path, 0, 0);
+
 	return 0;
 }
 
@@ -574,6 +579,20 @@ int gdsc_register(struct gdsc_desc *desc,
 	if (!data->domains)
 		return -ENOMEM;
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->needs_icc)
+			continue;
+
+		scs[i]->icc_path = devm_of_icc_get_by_index(dev, scs[i]->icc_path_index);
+		if (IS_ERR(scs[i]->icc_path)) {
+			ret = PTR_ERR(scs[i]->icc_path);
+			if (ret != -ENODEV)
+				return ret;
+
+			scs[i]->icc_path = NULL;
+		}
+	}
+
 	for (i = 0; i < num; i++) {
 		if (!scs[i] || !scs[i]->supply)
 			continue;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b..92ff6bcce7b1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/pm_domain.h>
 
+struct icc_path;
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
@@ -74,6 +75,10 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+
+	bool				needs_icc;
+	unsigned int			icc_path_index;
+	struct icc_path			*icc_path;
 };
 
 struct gdsc_desc {

-- 
2.52.0

