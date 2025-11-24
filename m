Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4B632E74B
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019230; cv=none; b=fJGcuCXlA3rinr+oFXvbtU6qmjvynjfZdRDmBjyklYfmOcCcWHbWG/brkFoshsW/QLIdD7bSw2LG/EWadklGv+VKsTh/qmaOMm2CadM14a2IOddHWs81xjrwn4lqbBIXCIWrdMlBtm9AFDgqJGroQzTcXOnOl2wQHI84OZOu0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019230; c=relaxed/simple;
	bh=fXy8C4BKUXKilUJuH0DdICiVvrxIO84wfvm31AbHSCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmTc1EwBHGVDyzdTjRXI+7/sgkix/gAWYnzOhma+q3qIhrdAMHBXf5C6uLjYEidJwpAvioyU2kiPCvtSRjj8BEGdKsy3tsy32frHIhLSnYd1m3t1GaTk+TL6lZUQbbTBiNy3jFVwRAkrHXTCAeFe+u1OJ7Az/7j9GdRmBo2Cre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GSNNuFlX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSNNuFlX"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59424b0fabcso710030e87.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 13:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019226; x=1764624026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP98YVNXzLKE6D9xDlHQCujjYhOFBxuWqmYVe5I8vWE=;
        b=GSNNuFlX250hM0U/I8ficnRRgs38F6hSrgI+KsFwZWvS+/mp4WAQM78vgcioCYOzwr
         +EL2fZOyjUJNGiBEC7C7ExJGCW2TyQ3hc/qMv+54DZin1HFHCmmjgYLqtMIrjo4IZvdq
         7xLJm07aPQ9LdDes3Dv1pP7EehOqUgU8iS+LFxdjvFOn6yemy+SOI0BwQx4CTqmC3sUZ
         YtU9QRzaz2U9kk1W3EXmcJUu7AbANHgw+OIfLdMmWRCp99SO7YiYMvuO1TeS6QHPrL8Z
         4a/E5Hsgr03NzR4xMXuW3WJ097T1w0ah9JYujoO0EeNibSVOM8ZA5p8Hhcbfr+LZfwiH
         f4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019226; x=1764624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VP98YVNXzLKE6D9xDlHQCujjYhOFBxuWqmYVe5I8vWE=;
        b=DF57xL/4uJaEslpEXVTejZM9stmB5oBGxux3QYyseMvdAnY2GPDtKYr8iEFXwMrSQa
         t8xtUjrG38Sr0WyVkXHRIRbPOPBVFr4LPU3LEsDLcDbI+9EQElib46+EBDOqBKFdqwix
         aiEg97OMdDf2Yr1kmO7K3lBL0HEGiZD38Fe6y/tX5sWWJIl8xcPTOURSzmXOb6H7qvtl
         zga36C8L6AvkItp3fCxS8feBf+oYdoWoOMR9/Hp3gEYH72vdoyslQGj18B9hf6ZSgwP7
         efTntRS+5koL6Pb94tSEBJ2zXtZSQwNzbXkMgWnXICl5mAsjcRqp7d+R2zRmKN1gC0kO
         S/tg==
X-Forwarded-Encrypted: i=1; AJvYcCV77iil/Rctjaoco2dLxq6EKG1jWBNeCrM0TxQDyX/m4GYh5XtRI0Jh/PPZX1pazXVUlQml1zcAocw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhwq0LdrX9Zh5bzsXl13fJ6dRkuAHx8qoi9oDNEiLlIC+jOl0o
	A6KD2LqwAEK+TTRiWq1NRXHl2kGr37C8dHhNlTxwfjX0ZwqeqSFDIIJAQzLKgxqOcRw=
X-Gm-Gg: ASbGncsreOFwZ4tZ13x2UVxYoILOmf8/j+7alSttILCYvoft6lSkpid6jmhCluHJt4E
	VDICx7PoB3wJiGZYjFz6LbQZtVRjwHgSuLKqua5PFVWe8CuXgSMXZJPFkjkzpTa7R47ZUr6pQIz
	8/TtX6794+spPMWz7LO0pj7OGRW9ehWFfEDqAZgdNkI9lkrHLKDKA0eQ1eoE0TkZ0rfbZvvcvC+
	S0rNIgBZEGHpr+zDIneU0f6Sh46xi4aoFlYamq8rGVDDgNY+IlM+5kD3qh7M7A2+qKKw2nzYOFP
	kGxuUfV55iwUXvPvwg20wTnNtFthXzD4MM+L6mg58eqp8/W6XDi76curog6l7OwzEMUH8aN7V90
	jmTjEaC73ScuJMFJ73QHJc+LW0f+VIL53OQlgHeWrrmm47PQYNIscuF/Wsd9La9I+pQhYk5yVNh
	GjYF3wGtrcPkdfd5y5OgXjiCXS3NSlOPSSCuo2objjAot60RvWCrUMLQ==
X-Google-Smtp-Source: AGHT+IH2zT0+iJUF+4oHmEKlQcg8ZxcrYD1uWmymsveMziE1HNeg+bhc9GY/Po6ssTh/DX0+3N7IjA==
X-Received: by 2002:a2e:bc03:0:b0:37b:9b58:dd05 with SMTP id 38308e7fff4ca-37cd928f41fmr20657551fa.7.1764019226277;
        Mon, 24 Nov 2025 13:20:26 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:12 +0200
Message-ID: <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8650.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 24f98062b9dd..2dd6444ce036 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -1257,7 +1257,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_11,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1279,7 +1279,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
-- 
2.49.0

