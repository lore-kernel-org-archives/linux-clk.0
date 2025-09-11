Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C772F1F4C96
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553148; cv=none; b=ke4Excsdft9+rpB/oVR84UkWSMLWlLGzQxaGFPfKcDXUQkT2Mb3IDaAOmR7w9UQXXUgOj8PZTj0w4lybNWtcZJRxbqtDUruB1lzyCzIPHsHMXu5ykoPg1CBfmzr8dy8uacR0cmdEzi65ayNiAkhQV2gec/FXet/qPR1za2bsQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553148; c=relaxed/simple;
	bh=cyqsY+2iBPm0Fr2O/qXayL/1CH7MKN4erIyrBOIDDU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJ2RojesTjEdjckdo8vHbdOMK6ZcEnmqHL++WJi7MO2+2sRKTAdCoqisuz5/yNnhCPkdVfG5wqxsW1d5QdjRnFlvbKy1svH5bUJTV65nzmbrwdIlr4qtseJ60XOv0ntpPsci37K2K6WHUXSHAtLslTXG5SSHgKhoBuaPHpX2Pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INvzT7TR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INvzT7TR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-337e43f9c20so380681fa.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553145; x=1758157945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGYOgwO4nhCryouhrLQk1idBdFzw9ZworlUETk2rTwI=;
        b=INvzT7TROXd6oju1Le4cDOGG3ksLjjG4h5JZ2vDZHffGoMuKd+buNXR5QCx4nFpblV
         BQ9SR6aZMLv12GiWdlJMQo8yT02KFMFhgGsX8KAD4Ax3D6kah8SsBjz+ARaVW76nhIav
         aBSyptq+mwXYOqtzr1CjNMWiK+oBPXt133PpRbdF6zqXXOkMX2f8wOJl0gmzrNlwmAl9
         ju4ssGt6sI4LoJO8nIHCtjSNdZyxkWLVFmYBF4ev4YcTTYGt1rZS1y8sQlKMzMvj2KuL
         RTq8W15gps4JUgcGls6SNOfCH7IkZonD5B5Ci+QJh75RmXnQL6Fp/rzajrP9yOCgWCda
         IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553145; x=1758157945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGYOgwO4nhCryouhrLQk1idBdFzw9ZworlUETk2rTwI=;
        b=whI+L7HI+muSWD4lnOaovEgukjBFg1eefauQpAWN60jxcV7ijbe6zNWoX6dcGPAcJf
         7AY+eEw1mj4gfQbgqht/nFhyhxy2WykUD99puRz4+eRIA6U60kzvtjcs56Sw9jItPxl/
         FtJezA7kjxLzQRq7Z0/Ad6F3G2BY9gO9Qht95cnM+J0SuIP9makaoi+X9gDrJIPqMrMN
         DvdP4xykJJbHRsMFshsEQ90aRRIgZiG0CN3MEF2z/Gn9ibhgu55NjmvFY36sm6p96ECh
         B1BJ869RVXD+EkqGlPG7sV5eyyEmAR5uRKxzLQQ74YQ4twFGz8iERJYYPGgUHYLuAa+K
         MPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGyfZBpIUU4SGHuEaT4vf5BtIfcZ9tyJxeXgRRkCUAsJToYPilH2evXZfnIGg/HsUdbsT8JIWljfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKiN89AxwxblK76Bp27Kh2eqFi9gm/SI9A3nXi0t9NLKW3oyb+
	wGf1GhMsLy7j6W9uUautIsuAZYbxuShovK1rrxLnGON7u0i2u/9G0xTfMdacZNF24m8=
X-Gm-Gg: ASbGncvnRwLzdi8VNq6rKjPsLW9wtqyzrMYEsxiau9KTKUYZiDyEgf9pADI8LdnsFkR
	inH8CLwGKlq/EGMRcAFsuBmLcKBvDwjSCcisRolD2n3lWeJfEi4lcQStQ+j8Y8ucmGZT4pxbFAY
	NI9bqQeKoEPO8uuBEgaHtNoMqNlUOQjUW5jt2gFa7GS4hIti6ie+24Ilx5ioP570KXucts4OKKn
	m/XBbG5ILY1M4M3KbWHBThPK32aVMWnbAOL8pHOyTY94Ydi6v2CW7G+pY+JOZ6f52ZoFH2h0eSU
	cUYs55ZwuUFXPyU4OBnlPnPlyVaX3/paPCK2tb8V2WKbKbp5nqxa8xsLkXXqf4+eYL7Hp/ce7ar
	aJHDnH3hq24ydIMvyenNmwrz/7wH+B9qiXJ6GuiyFN+4NBPAElrNhXM9VrJIAbgSnMJQRLYNLDy
	IAuYEDDg==
X-Google-Smtp-Source: AGHT+IG9b66M0O/XbAvWJOlbcI1Gv1Aqc3qD4A/jWD08WCUA86lnswuNJ6w9zUDcQRoHVhLSmPBvrg==
X-Received: by 2002:a05:6512:6185:b0:553:252f:adf4 with SMTP id 2adb3069b0e04-56263e840e5mr3094976e87.10.1757553144970;
        Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:14 +0300
Message-ID: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SM6350 camera clock controller to enforce a correct
sequence of enabling and disabling power domains by the consumers.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..6c272f7b0721 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.en_rest_wait_val = 0x2,
@@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_1_gdsc = {
@@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_2_gdsc = {
@@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc = {
 		.name = "ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc titan_top_gdsc = {
-- 
2.49.0

