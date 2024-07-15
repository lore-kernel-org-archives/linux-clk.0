Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9B18EFDA
	for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721055587; cv=none; b=tA1l9waMEshKEjPxW9zf/px2qNjKEhQXiN1mqQ7Yhp5z9cHfDuigpw88hLeNecvEu1Ibh9mjom20YtxevUnw7mwtEZrflj4FVelK7XozIdH8OM8qsaG6cAos+awH2nH+BvBLBya+ULE8yFEhxstkAxRGVN7tul3KkTLQJ/2xDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721055587; c=relaxed/simple;
	bh=rzHANoUqXG82QQNq7zWwsJk3/CBVzuayepJXbnfYmTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X4jvnUj92FCVzETol54WtE2YmR3XlyHLd7io7I3wrj21SrlADLZ7xWsKPLtk9NsQXIKxJyB90pGUUUHpxNqifT91FvHIG21tOxvh71GVqg9ZztC7dM+0JZJ5etwgLG+cRza0QTaYFJQjh/7XVTwCfHN+G2dMgMRqqpW7obHPX0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nF3Yowwb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nF3Yowwb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36796aee597so2674842f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721055584; x=1721660384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C12lGQoC4O6dCA83BitIObz0vvscmP1VuajGEBqvvq0=;
        b=nF3YowwbFlQoo78IH2LtbW0vYNg/QcsJ1ZdwEFchlq9+Xt/0TScrbRIdT/b3vnoH3V
         toj10IQK0xVWqtalCLq6lBCTKSPp93Jn0KR0RyAY2BXCOzGjEjAmteUjEIyWXHUUCP9t
         lg3GqYBCf7mtwQEL5nfaIC3jL+4+BTb8vu5fEZUboHOeJNrnxjMAp5sAc/R6shxwQiGr
         DdecaQyxE3SjG4hdb1cgeTiSthePvvDsXec22nQ48IwQr4IcR/leQRmoCMZsCK8r2vnl
         it6rWDLYVtdbGtQ+Y3B9IK6TbjPviIK8v2n+sJYH6DliAUdrA8sW7xm2J3tiOAU9MuAR
         Irsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055584; x=1721660384;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C12lGQoC4O6dCA83BitIObz0vvscmP1VuajGEBqvvq0=;
        b=I771zk/Yr86KRCygjkIL1ag0gHLWSERSxcbjLLDSFgZegyQndPAaw4msec9ynbEYlb
         afZXF2S9qfVNdXej/v/S3WEkUscBYZvCC2SwMOzE0OAM1Q6adVvOns/ZnbdxZerKFKfk
         xWKpeXBnPGxyjfhFY16C94RsKTnN6nKx5bPBdwIVjzSg3/WrT8FGan53UUsL1ne15MpK
         lXo4hGU3ofkurB6lACdFDZqd+3Bsh0CSpBt41BVUG/FKDVCKjA3aHNKBOC7jEZZdl0oG
         x4FqeL5CgQdM336W8xaoxFVfgRLmZeL3Rn62m8hPlyfALkGu6xGX/zOSSFY0+ce6AsdS
         gsNA==
X-Forwarded-Encrypted: i=1; AJvYcCVZRPKKiQFR25fRX3HyYXyxuaP5EQyzITt6VcYLAorpTj+toiEjwD2+N/XDNNo3Etv4kv1GLrCSvlNG6iO0wz9ECOvLpY4SWMSG
X-Gm-Message-State: AOJu0YwHNNZDwIqSk18sMRVL8eurE+nQLBoZKc7RbpFUXVcyH5RAzaq7
	Ou6sHNDSrFayIIW68dBOIUkUa0NbyxGPb1LSUJ3lwqCCLcSDSkkSY5QRLMEPDuQ=
X-Google-Smtp-Source: AGHT+IE5W5I4LS+aadPJhSFJp7ycTKcKABcEYy6T4uVw5x69VrvDLqCqxJv/YubQ0h6t6A8Gr3Gw8A==
X-Received: by 2002:adf:ae59:0:b0:366:f994:33c with SMTP id ffacd0b85a97d-367ceacb515mr14464668f8f.56.1721055584197;
        Mon, 15 Jul 2024 07:59:44 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368155f7891sm4373260f8f.52.2024.07.15.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:59:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 15 Jul 2024 15:59:55 +0100
Subject: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGo5lWYC/x3M0QrCMAxA0V8ZeTbQZNVOf2X40MVMA1pHq1IY+
 /cVHw8X7gpFs2mBS7dC1p8Ve6cGOnQgj5juinZrBnbsXaAjPi19KyatH2SPLiD1WGTgwdUFJb5
 EcLaqBTn4mWjqz6co0HZL1n9ot/G6bTsVVZQKegAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, quic_skakitap@quicinc.com, 
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

We have both shared_ops for the Titan Top GDSC and a hard-coded always on
whack the register and forget about it in probe().

@static struct clk_branch camcc_gdsc_clk = {}

Only one representation of the Top GDSC is required. Use the CCF
representation not the hard-coded register write.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo X13s
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 479964f91608..f99cd968459c 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -3031,19 +3031,14 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
-		goto err_disable;
+		goto err_put_rpm;
 
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
 
-err_disable:
-	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
 err_put_rpm:
 	pm_runtime_put_sync(&pdev->dev);
 

---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-274f11b396ac

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

