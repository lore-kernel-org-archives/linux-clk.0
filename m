Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0EF3803E4
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627123; cv=none; b=fSzPj2HXD4ZDxn0XtwtS5PpuEk3swr9x0Tejw7B812p2CIJVpNOwPa0XYt+CplZv21c2kYjxaSlgJpQVhb7osFXA2ZDdpdmJrbnNcrfjk+Ayxs3uH3YzyGLdVrEAZwA1ChVb0g/9NrMlVo2pmZ8hW2B2jKMd/nwaOtRG6DACuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627123; c=relaxed/simple;
	bh=vBFY+SmJjtC4cED2P3MAEeeRdb2vcanu7b6d3HDV3KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyGz8/ltz/Zza0d71E+JbgoUiXQ222VN3ugMwAemZh9J9WcQip84az06mw70/p6diwieADsYuIWtSxEI9dQKuRRPPQBovuSJDS3jGOx41ZAWIHakERdy6yeqBt4dyUktKVYQ+shtLvnu3FefXQjIxFeIs0iNpDKziTCOTrrGSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OkGJbttg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OkGJbttg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso700458f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627120; x=1778231920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NWZu4H8hGDWhTzeuuLpxUjYIGK3vSOADuGQvxmMAgI=;
        b=OkGJbttg64JsfHR29FtQGErbF+buYxGQi7RjA49TSFM7+P9Z0qlFUUZb6utpBdRjDX
         yevRR/39ff9IiWQz+fw2IRfQ9a94GBOSCoFYjqUfPn0RoiD65JMV1Hu66vv6jdWg0FTW
         9RGYnG/mdHC/I8tDla22xCkw6oMisSNvqcOIz9yXCMBTeWR4Vv1lnmnTW8A3nNMSyofU
         ye3HnJmSKzCK9LDWZ+hm/2uQ3mciJkWF29kF/DyN8WsFPYiEE0nTlioZYvzOFZVaRi3y
         HXaWnvsBKiWpnDNqx6nG6wl/TH2KCFfbaI/8wyis43sBJKqeh2lZrjs+FOgqYhjnffjO
         siTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627120; x=1778231920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+NWZu4H8hGDWhTzeuuLpxUjYIGK3vSOADuGQvxmMAgI=;
        b=aSRXWH33kYyZP8GGQs8PV6MLxSx+AgaLwhEERGp+sIhtB88lbEU6f8G0DK/+GEoiEW
         KETCKBwpizEpQKYk+OBZVFqpO6vL5fZ6ujmquw6EzWWeX89Oq04N0k23RjEgN5BPSZTY
         hGzOoxfHu32JkkJI9Jd7MgBo83dUtGIkNl79wywoWtCraYvb51MO54I367UUBtYLyi34
         j5eUnHEusUl9WyTQ2wJ79CGxANp4wFpK92l3T0vt5u/eKh5aozYR3k7wiRKJHBBIYC10
         mgFPNIy6BQRd2fWnNzSTsTaC08cnlByuAySz6tt6klexZ/Gbqyp44udJZzNh9jf49KGY
         WEiw==
X-Forwarded-Encrypted: i=1; AFNElJ/AFP+0XX/t9vybPkdiOHPjP4cK1N/8m9Fs5/Cqv40K2gClJRT+HX0LywE5raw9dp3+MYRjw9H+ypA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCS/Cuo1my+Fkn8VHIwstFW1Q/s4WV0qSi1W+f1+qjz7mWeLx
	rDWDcsdGe8+7g5x0gkFn1mK1kIGriL8ccwi1QIpjG9K6R3C/42Ol1UBQIBiw0qeeM88=
X-Gm-Gg: AeBDietaR+Cv6fp9M9i5a0g6S5iqDhBSmgAhKreMM4okF6zZkzOOzNR/tByk6P+Ob5g
	6j6+F6El9YFTEjCYC3zjQjfC9EGsIJSCdAk4cn/5GyiX67E6KwBVPiPfGYvofVH5wWAwvVgoRWL
	1h6fU9mRpS2Olh3YD3Djc8aQULOJwh1rbahvfgkU7Bbc/WWJgqsUfp6bInexcx5tR82JaN84xdo
	QbUfpCHagxhQtJKPiBZdQtC7yHHbgxlIZRsX+J7qCW4QgrCX/2Kb62r9OWtPK1+3SBQj6H/nClX
	cD83kMRuq1rLYMice3FZ+T5DFJPZYfb+of2E2OG8myfBW/UvhaqE+Fa42BzG9Tu+L8gwghbLWB+
	z0o0GWHz21bMSfz+nBw3YeSwHn+C8q+2y6smoh4cKSfWnpCXjIC3+LkbKi7smg8fOOK3BOEjWzR
	CUmbwfqjnvfKoT1I/8ooogWXkm+6W0Ncz5Vtft+TOS9pJFiu8Mjj84n8o4iYrOOkj0oFOsZYEld
	WIqE2Tsp+EENDoEi2g=
X-Received: by 2002:a05:6000:26c8:b0:43f:e22f:606 with SMTP id ffacd0b85a97d-4493dbdb55dmr9921190f8f.2.1777627119767;
        Fri, 01 May 2026 02:18:39 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:31 +0200
Subject: [PATCH v2 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-3-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=3296;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vBFY+SmJjtC4cED2P3MAEeeRdb2vcanu7b6d3HDV3KQ=;
 b=CuTWQZHPEoyAXshMVDX/yFOliGYdtzkkaIyHmaARqIg+fK+dPGUD9DrAF/BygWOYwuNS1kwTD
 pY2qmH0nSh6AoW3Hgdksd32nIiZDTh6dxuesD52F6aclCMmxBm7fxhc
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
 drivers/clk/qcom/gdsc.c | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa07120245..ee5f86ca50cb 100644
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
@@ -147,6 +148,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 			return ret;
 	}
 
+	if (status == GDSC_ON) {
+		ret = icc_set_bw(sc->icc_path, 1, 1);
+		if (ret)
+			goto err_disable_supply;
+	}
+
 	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
 
 	/* If disabling votable gdscs, don't poll on status */
@@ -177,6 +184,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
+	if (!ret && status == GDSC_OFF) {
+		ret = icc_set_bw(sc->icc_path, 0, 0);
+		if (ret)
+			return ret;
+	}
+
 	if (!ret && status == GDSC_OFF && sc->rsupply) {
 		ret = regulator_disable(sc->rsupply);
 		if (ret < 0)
@@ -184,6 +197,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 	}
 
 	return ret;
+
+err_disable_supply:
+	if (status == GDSC_ON && sc->rsupply)
+		regulator_disable(sc->rsupply);
+
+	return ret;
 }
 
 static inline int gdsc_deassert_reset(struct gdsc *sc)
@@ -584,6 +603,20 @@ int gdsc_register(struct gdsc_desc *desc,
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
2.54.0

