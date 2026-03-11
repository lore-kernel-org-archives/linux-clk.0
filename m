Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7BA3E7152
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253318; cv=none; b=WNbR0ZmXV/bhLLBCAQQuzTUjidI029Y0e5Wt40oYqAOCRE93FBISWaur6IytE6w9ie/k7fVW4lhGyoRYLELb1xD/xdEs1DP20cQd16LIMg6DM/YtugE1+DIkZLMeoLMyjIuZEh5zH61kBuyR5Y1fBAygVg1aCMXGggg+cdkkb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253318; c=relaxed/simple;
	bh=MFgYY7643GUWuqoTdmop0Qb/gEDZtoEx/qcVezAWPvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJLanG/Nrg6AK6pidvsvmIo6alxtSdyLG6kpidtUBRu8BMjJFHpLxuTk+fI/FMCMFIgyBBLU3noPi2FPllhuPWX6HAfR+rMBAUc5LLoTx7AA7rkJYq/y3w/Uq5ONdqtSSagZ0kKZacsfQJ2r7DV1RCLnfng+Jgrttnj7H5KSD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERezV393; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERezV393"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48534e9076fso1487215e9.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773253316; x=1773858116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8pjK+lITqFvqVmVlowmWtOmjb1H8Ha6m3w9r5dFPrI=;
        b=ERezV393wWn0KJLxNOjLJsU5JlexAeu+RgemxuJ9W7BEBlGxTKLcM7Z2JTy8/i56G3
         5t1Kn8KTZs4p+T5V9rSxJlMRmDb6BTOgexNNlWCrR4RhElOD+HBaNbTpD0rFg3PRQtHz
         enmSGqOnbuLMpd8BcJS67H5bOaj8X/yR4SuBftiYv+xsgNAiD95JzNhnXRJCPfgzx5E6
         nAFdutA1dG5uUTo782l1IqoADJTVv7sXr1RmvqtUCTkF7vy+6YHOCp922vO7mAO8J2CY
         uOYknfu++Vf/fPFp8DN+u+QVornNttzQ3FpgtPsT2f6Tj2p4/SHftA0O9G8FSDmXTMDv
         vk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773253316; x=1773858116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8pjK+lITqFvqVmVlowmWtOmjb1H8Ha6m3w9r5dFPrI=;
        b=RuyhD0s7ONtx1D7R/86KoVFFcdjFJUkHEsNmkUfV9rCPINyrduF/ZBpgoB75/68jVR
         qo0icuWkPgXLcqgDamZc6sTNq5fq9soi9F3K+VrRHQ8WzlXvjcIZDuch2NUl1/aLuQBL
         Iqtjt4qtwKsIJqHzMdWjQq/sXBdT1foSO1w1X9VC7wGrlSrzGzgoA9iqhk48Aqwp7puw
         z/CYMqp0ahI/WZXFn+XJ11qLLhOLePfBAYaOiJsyX4Yu+M1Wynr9oPiflzaPc07wVVzS
         /oozWk5yszpmQST3o21D42XCCvYOVHrnU2PhdJ/Ywoz2x2RYbsZh1aoOnXm9L91Q/lu/
         K8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVSlg0C3c7jMAafMsxkLkNsmIk6Vuf01KuV04n7GbAFFBkRlCtTm5MHEKjNcBQRJmpAlzBxRJ0liwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbS7LuQ4AcejfykIc+iut5eILzPHJoqU4jLTYWXpjjVahUxjU
	wKHrVvQoidc6WBdwG8CLnCAwqAUe3DcB3HFqRsYw16wh6I4taC4NFFrB
X-Gm-Gg: ATEYQzy4cKyx1UzdI+YuXuABBJAY+f2g9zYXwP8/qmKRoVl43VgXM2HfvFqwO4rxu9r
	rekownF9yCE5d4JRLdV5AISPujBv/BbiUaDLMY0GI+KEonfgH6PK+eO/S/WTo9dhexUvIYEV1hz
	KqwqhvIzPH0vsg3G4KDvroV7q4PMXzWHoPx8+dzF04MjbHiUVPD19jMjWy0UZdoTCu69kMc+Ut8
	oMJn47St0neOKAWU4YugynF8Ep3+bbrpe3Yl4NTdLReT9jiS3xbuSJke1Vpvp2wHpmQvkTiAyu1
	XEmoCXBToBedKOuMR9IoUcKUtI1szMuf5v1tL2MbFdhpxTJ3u2h/qBqtmFWC+Vp5hxirbipbpJk
	DUoyYmSbDsISYNgmgXYAdqkHZrSVXos9/hff6x5HoomhD3qy65ynCNpjyhb2Ssa5D/bBUa3Hqte
	ZlNdh+KSh/bj31YNwjd16XczFqEdvglHic1LGF8HIb0m9wUFzLM7kDJCs=
X-Received: by 2002:a05:600c:8b38:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4854b0be1b5mr63417565e9.12.1773253315564;
        Wed, 11 Mar 2026 11:21:55 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4854b0b95f4sm39063925e9.5.2026.03.11.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:21:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
Date: Wed, 11 Mar 2026 19:21:42 +0100
Message-ID: <20260311182147.30266-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

The XO clock source is always-on in hardware and cannot be gated.
Without CLK_IS_CRITICAL, runtime PM of downstream consumers (such as
the CMN PLL driver) cascades a disable up to gcc_xo_clk_src, causing
a branch status timeout warning.

The IPQ8074 GCC driver already marks this clock as CLK_IS_CRITICAL.
Apply the same fix to IPQ6018.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/gcc-ipq6018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index d4fc491a18b2..6943dc511534 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -400,7 +400,7 @@ static struct clk_branch gcc_xo_clk_src = {
 				.fw_name = "xo",
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.53.0

