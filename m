Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wL7NKYut"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1472CE8
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 01:21:57 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1e35c2807fso717013566b.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702372915; x=1702977715; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WetTXBUl72Q01XYe8AA+lX+N1/D5pV5jOGYBEHn+qvo=;
        b=wL7NKYutLixh9KeSvo7L5qtZ1qjNxGqJM6yMHGnCeJDfRcXWNwOZujiN+bfr+sGlmg
         oteSGQP0J0fKJ422ahP4nVlrtMqTwBwBRu5Pkb61HR5r9y+KTve9HnfMjPQpIZQNaHAI
         AWmtRYzTil5h3seh64nRPT0LeGL7F+6137jT8vyj1ULbhTy4frQm3ZitAtxPPrnsOxs3
         1HMF/xsKaqvBcbvYjpWUB3JcR6j4KELCVvEFWCPf8q3jqcbiKnM44aw5hCzP5dQL0osf
         Ga9e32Bdj090PBbawFVbMSaSSh1TNruLHI2zktKLCZW84XSGJ/CYJ8IsxNkXt+Emqb3L
         SqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372915; x=1702977715;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WetTXBUl72Q01XYe8AA+lX+N1/D5pV5jOGYBEHn+qvo=;
        b=rvhaO3HM8vFdJPYVL89rGb23X6s3mPZXoVcLNuw0kLOgFExZldzZdHrjcYFBJSo691
         s3iqq8NXaGVwo10IB9qSK/xJ7YzgQKq8BbB9qZJRKqZfPvj16FguordWTEvVvuOYQd6m
         QZoaw4SLxfslVaet8UPZmQnD+d1jkUNMg10hMDkMQJYLVHWLNax/lngcrCcl+rMYybiZ
         ECEE9fOKlzYP6QqD4d9tyBR6LfJ8Yv/BtEnYFaaBLRzbXsoYWXaaE9y+rMfUtvF3D6Zr
         d1PpBw5T63U/cTzdq0rhcbcWenTktCkEedNd1cp2RHAJKVOTdnq8FGNvGZ1x5kN4ZUFs
         J1mw==
X-Gm-Message-State: AOJu0Ywo9ZO+QeBvN+lzovKdf6QBNTwU+F3azu3iQsaAUVES7X71N760
	qRiQHsDaVbrqitFaP9WkydouHQ==
X-Google-Smtp-Source: AGHT+IF5iA84XcT5Ni9+pYmDM1Z2HuTTSYhDAmBvQ6rihDHakMradiYeSssd2FvL585miIK7lIwz2w==
X-Received: by 2002:a17:906:b39a:b0:a19:a1ba:da61 with SMTP id uh26-20020a170906b39a00b00a19a1bada61mr2692634ejc.136.1702372915526;
        Tue, 12 Dec 2023 01:21:55 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id vc12-20020a170907d08c00b00a1d4a920dffsm5906962ejc.88.2023.12.12.01.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:21:55 -0800 (PST)
Date: Tue, 12 Dec 2023 12:21:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: qcom: camcc-sc8280xp: Prevent error pointer dereference
Message-ID: <210d48ce-6ebc-4a6b-b30f-866d10d41a16@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If "regmap" is an error pointer then calling regmap_update_bits() will
crash.  We only need to call regmap_update_bits() if we had written to
it earlier.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 877341e7327e..3dcd79b01515 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -3017,14 +3017,15 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 
 	ret = qcom_cc_really_probe(pdev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
-		goto err_put_rpm;
+		goto err_disable;
 
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
 
-err_put_rpm:
+err_disable:
 	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
+err_put_rpm:
 	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
-- 
2.42.0

