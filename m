Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB834027C
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141108; cv=none; b=FJkjBSoEaCYjW1ZKA3S9bOu+Zl5qH3hfPt1VeR3PL8YwPZaftIa26MDzW/irzc5NuTA3KDGK7e+ujcMfvXuxu2DYIe6PzWR5/OyyVWJPB/DLeg7gc33WNcBdefpESt0t0zKo5wmjVgpSeRdIuI/aSnQNUc+Z47PoR9kVHSYE9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141108; c=relaxed/simple;
	bh=ahY8cqJej6WQifsWXROQdHcvhwcArd92M4vlAfVPn9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5oSK6vgENnkvf9ITlK06A6vxOzgAHi0uJrTilRdl3hbt5zb5r05HHm7IwLAx0OGiTnJ3My1dHNXGvi3A0i4NuAyGQUmupwn64c/9+Ptnxgeax9IEoplkBrdkISEsy7MJtsCZx0a4WfkmCwOLZJWkBQBGy/N4rIrI0zP5FyqBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XtJc3VQ4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XtJc3VQ4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711810948aso48886605e9.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761141104; x=1761745904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vpqXmEuFVERfrJK4S9HS5UBFe3EstmRsCR0kjyhhN4=;
        b=XtJc3VQ4buam0PEAiMSzB9Od4MuIHNt6op4X3JX/uV9O1MIyCyLw6qw3a2fN7Yn/6t
         t6cvgwCmXQ4qSZDqLTVusuNEHW3ajViBu0TRQIeH+x55FqmOnYhi5/3VJxUvNvL/K1gZ
         RtoKPD4/vUDCdc5uDuSWOp4PcPlfqRZCSxvw7XjY2Fcm5AAM6nncj9uzWiyUO9YRY2hN
         txbSgqALt4gJmB/No2NwnLMOvG+iM7DrGZzFYe/eX71NKgZKMZ2eNO/m58Ze93U8RefY
         ot6PeGSRJ6ggFt9eroqW6OdkAxNAi4ZHFFL4lMVFKe1IYfW6Sy9yB7JeZG2kBEXrXyrW
         wFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141104; x=1761745904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vpqXmEuFVERfrJK4S9HS5UBFe3EstmRsCR0kjyhhN4=;
        b=I3Ro+60A7D5iqq8hfH5RjZxakeWOxzlYzi/AKAc3ajpZjnNQA/pe03xBO42VhVCbbs
         QKD673Eb0U+XiSUkGHyeLh5CreVBUbxca3C3iacT0U9X8tmaJzydlarxCCTYSlbtrFdo
         hti5qaC74VIxrzRq0g6Jl8TzpG6HfDCXcmc5NommeEn2d2IGlqk+10RXZwGGXKgL/DMV
         N8PejrSOD5J53imLdp3kMpvP0LKuS1apR+7DgTnlJJC2knNxOrdinZi2oyRu1K4Kx5xg
         VZ6RwlrAWEbm6JkXuJQx5Ybsrm254WdnHGvGJYN3tYhkD1KjqCyMDfZ0e4gr3WdNiiz9
         VJlg==
X-Gm-Message-State: AOJu0Yy9ytUFhwCSE6ph2G/JoZqTSOSQUhyOnnmsZVuFbWbpvCTzqX54
	8+Cps4GnYjvxkb5EXo1TMrFAaYhTUlz6aUHJEK6E/1+anendFuzgOzVql0MteLpaKB8=
X-Gm-Gg: ASbGncvtRbqSE3GYoh5OeLGdgImtcpXUhJH2PrnTMf1COjaE1MF7PvgU/XGH1nE+NLh
	ZwCdTaG6GK8Gpg1WhNPo6gCq7Iqv5mVedan8si+uGrUl9z3sC/fhYFenI0gXeLNHlCNh4S4TvCY
	IAXhVq7cCDZ4r0ogAsnfud1x0JZR4iHJ7BdmLgs7y5+Woz0aTj7qyBQ2iu7hW0WSSz7iNyUpCKq
	19YKgo8L5++inUJnWixVkfSWb27wpawR2OXaFg4dJfbmESlUvZWYIA+q3fV+49sc9/aminh7ISv
	aGO24bUPGssz0Y3hX1BpqV+EaMJ/BbAyKCfiQNjY3bq4+HTPHxyu6P8B4z65ots1W4E2edO6wlk
	if18nlwsC6sfDHBlfcojmiDVtCFLyNfKwbLJFNNClPI+QAOtIbhojZabshtZeLfT4h52XRSrQUB
	tmj4JXWk4en11ssEk=
X-Google-Smtp-Source: AGHT+IHPzaVKrOun27QTyu8Z61wqMO2ufTRuV5m0h9jH3Uupa5Quc6C1+Oatewc83oC8toYDcSpSSQ==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-47117925db7mr141311515e9.39.1761141104344;
        Wed, 22 Oct 2025 06:51:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c2c9dasm38474625e9.4.2025.10.22.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:51:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:51:31 +0200
Subject: [PATCH v2 1/2] clk: davinci: psc: drop unused reset lookup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-da850-reset-lookup-v2-1-c80f03831f63@linaro.org>
References: <20251022-da850-reset-lookup-v2-0-c80f03831f63@linaro.org>
In-Reply-To: <20251022-da850-reset-lookup-v2-0-c80f03831f63@linaro.org>
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BEFSWjFwHX6uExLjBneDWL7iOS7pXsOG61qh122CNKk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+OFsK51ACOD/ph6HTgR/PWuteV0sKOsHzuDZJ
 rVM/PUWeC2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjhbAAKCRARpy6gFHHX
 cp9qEADhDRVM3pxdk4GAGxN3WTBZRNwRovTMGBVfOIQyAY9cUZZ2Q2RrdObgHEvHzennf4cg358
 YtbRKs7E+NQMSevYJ02nXw/T2RMsySJZLFGmaNkvnLYNzE3xtRf1jmkWyhh1/T/SwKvjqGwCcgw
 XC4jUs8+qzUw9iuTUHyEtgEjtJ8kaG5i8IcPKAYOtrb+P+5H0kFMcpSPSzezYv0tpFGnXWoV2Nv
 a08L/ORJmUolVJpYfz3SMm68LoPKaMAA7kiF0yxG/zOCQ/QFsnLEbIC/IyionhnUGOonHWA1wPH
 NxhhlsVmUo0zQ8fFJuv4hZFz2Bv5mJuX0aBjS//X5D5zTbciEQEGv2maGIPnME5ZMUZEaOe4s65
 8/3wj4lHdnw3+4iJur2DPGLVdJpu31uRY6YMulT8+97TjELp+0HFAD3cVyYsvO2XKy6McfP13Tl
 itYf1fCdWkW93PMjqWKWFvdy/a/S/x9QUiHTFCLjpDSnVGe5+oSspfTtlqsm4d2EBUIXUdcwhK1
 EXjhzXpEKzTVclshLayBYmYFbZxip+thF24vYZEdncfgWoBAGM+gGuyZb3XZfGuejx/a5G/RG3T
 MQVRAGaWPjzquG7LjJzGxHo9iFbuFwmQkJt4YzxrfzgoE+IH8iv5rpLnLVzP/lhcMjCbMqrDj3E
 yLdYS1av28GX5Uw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support any non-DT DaVinci boards so there are no more
users of legacy reset lookup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/clk/davinci/psc-da850.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/davinci/psc-da850.c b/drivers/clk/davinci/psc-da850.c
index 5a18bca464cdaf3a0f3573cf9d70b79ca591cf28..94081ab1e68872d978e4cb162d8f9101de656d3a 100644
--- a/drivers/clk/davinci/psc-da850.c
+++ b/drivers/clk/davinci/psc-da850.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/reset-controller.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/init.h>
@@ -66,14 +65,8 @@ LPSC_CLKDEV3(ecap_clkdev,	"fck",	"ecap.0",
 				"fck",	"ecap.1",
 				"fck",	"ecap.2");
 
-static struct reset_control_lookup da850_psc0_reset_lookup_table[] = {
-	RESET_LOOKUP("da850-psc0", 15, "davinci-rproc.0", NULL),
-};
-
 static int da850_psc0_init(struct device *dev, void __iomem *base)
 {
-	reset_controller_add_lookup(da850_psc0_reset_lookup_table,
-				    ARRAY_SIZE(da850_psc0_reset_lookup_table));
 	return davinci_psc_register_clocks(dev, da850_psc0_info, 16, base);
 }
 

-- 
2.48.1

