Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA735505F
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459190; cv=none; b=HaA8hq9EcaYajgIcz/SWqwmPh71iAxPTRW3tIpwxCMhgkqlJS9+I6nojZIaAmr10fDYyn2g1NXjjsm6scYc4y5RJ2nPLq+UcNiW/VDh1tj1ZI7LpwaDlA/+A/YF563B4BYzTPZHevl0GWVjTXJfG9wwoC2MN3PQUBaa3pRygUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459190; c=relaxed/simple;
	bh=I8gVSNxw2aOO4ZdP0s2HcOB6Vs9l7ZVMP8y4tYKEw8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9xtj/eYmyHATK6Ara/GIlSGcKgB/zpUxuH1uM4yJRjrFnk7HLxOdRKV17Pcft9F83uiCsfipO/Qc0wbadt73Cq5PjNf45yi+c4DSKW+dV+48sNPiLNd2nQ6ulkWVGF3goYN9qdOYslTUPkO+rNHjKjxDSRF11ms72Tm4lmoaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifE25RUs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifE25RUs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee130237a8so12799f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762459186; x=1763063986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l76VTWaL5JNJWQVkhMGxzjJJc96x+kz2NkszPplq7c0=;
        b=ifE25RUsMNw2vSR1pkbyhbaCC+gNIB8zeoK9vS8CtQIO+ImDGdPwZXuQ/8RPkfn9BR
         Ax+lEW4D/Lx8KxQwPuas2VkiZW3+fEmb45psvAtKNQpqTFXx/+G50mtg8CXsz684mzC+
         CvS2yiZO8BRhLBiegs/aYQbrAibQ0SUjLMkQjPzPlLdcauh5SpGqqyl2dPVUmhfmDy6F
         hPpWQo98NAFTcEjidenKEclGZSZZrWOo8Fj+mVmpKEpIOJkKLmpLuEVI7LGUJxvLCZ2q
         V2HMPs042r8HTTsPzpVBB2AxLM9n7fiLgLe4m+/QtUpGPZc5gafU8JgoMAxxZoHB+HzE
         t8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762459186; x=1763063986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l76VTWaL5JNJWQVkhMGxzjJJc96x+kz2NkszPplq7c0=;
        b=Qq4rxueGQ385e2L3VhKCYZIwcDhCESHXQnlLsVyxiL60ABggSdOAp1Qrjds+M1uMh4
         V2kXDk9E/BIpnv4M/flAmod7FuaOLVjOb3KRx5CFihOZRf5CeXcwv9zizNprVALOec4U
         YccxSyV7e4b929cB38xH/8r5ZJ1oNYdaURiXE2+P0vT0JBIhJl3PS5jZKGVHyLzPK1v4
         3OnRUPfFkSQfiNDr806fCCXuli8OOiOJfKZGlhEDz/QWw0/1eUlxAYoes242YfZ5zxi+
         vArY8+f4lLUgmKPw5TP+sp0LDEVVTAh8MjeUathPovsL/NHddH34Zufh0F65ecqW+Qe6
         GIHg==
X-Forwarded-Encrypted: i=1; AJvYcCVOEShX+1GURQms5EXO8oXXwPBqglFr/ZTMBtYk4ETmrQJq8rdsvK+S4CNAbnvVodr3LnJ623y4SS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDQWr8fuv7afRP4BXCi2gHhYANL5Swbym/kWoF2OvWkMWMID3
	0vAFZnXAOpPddEffB2gBeFeiwcjuxSSxNr1IjmClGS0yAymq2Jg2xa4U
X-Gm-Gg: ASbGncuN2wRSMipUxO0L4ew6Pgk0GtTc3XTAL14Vi+jPjilGI+mFdwnoadvy0Vmr3eZ
	EDZrUrdAFu1PnHUzXkuKVJK40Uv0h8NXZqdruVXCVdcxloW5+v5NkivVPaAskJMXBNwxuopnNbS
	E9gJ+xfpWej027uxfXSSFZvMix+9BhvEWFxqhfppi+I4ufFVK3NZ9DVCsmlT8sFzo/k5j1MCmn7
	MJJ6I2N3pbyufR+BnaB5ucwly8WabxSMrypMAg4PRUJqlnWQS4CGuiqDpSTXiPC0dV549k6R5yZ
	NZ0n0628GjnOsBq5pI87i0/5mqpBTrW8BHxzk52h0sguZvPEOvfW90U3wIi8+9CPNn++u/0dRVc
	1U95oCqBeJVnZLE3pA+qHYonGrItJXz2DXX85r+nh/HFRxiyz6gFi9tu45dKAOgaNJqxfnkn63f
	H+EhFTbIsEoFoZYe/gG9tDoimv8DpZbQ==
X-Google-Smtp-Source: AGHT+IGybaf/NHxxtkPxDjDcb06HnUaaOs9P0uCx6jOwYau+YGwUCltbbYeXhcnTI89446yRK7nF1g==
X-Received: by 2002:a05:6000:4186:b0:429:ce0c:e661 with SMTP id ffacd0b85a97d-42aefb487b9mr302347f8f.54.1762459185944;
        Thu, 06 Nov 2025 11:59:45 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe62bfa0sm990037f8f.5.2025.11.06.11.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:59:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 3/5] clk: en7523: reword and clean clk_probe variables
Date: Thu,  6 Nov 2025 20:59:30 +0100
Message-ID: <20251106195935.1767696-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106195935.1767696-1-ansuelsmth@gmail.com>
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework and clean en7523_clk_probe variables to make them consistent with
the rest of the source. Also apply some minor cleanup for pdev
variables.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b040f0f0d727..d98990a157d3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -700,25 +700,27 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 static int en7523_clk_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
-	int r;
+	struct device *dev = &pdev->dev;
+	int err;
 
-	soc_data = device_get_match_data(&pdev->dev);
+	soc_data = device_get_match_data(dev);
 
-	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, soc_data->num_clocks),
+	clk_data = devm_kzalloc(dev,
+				struct_size(clk_data, hws,
+					    soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, soc_data, clk_data);
-	if (r)
-		return r;
+	err = soc_data->hw_init(pdev, soc_data, clk_data);
+	if (err)
+		return err;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				      clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
-- 
2.51.0

