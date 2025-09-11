Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51A1DEFE0
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 01:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553149; cv=none; b=sdp0STIhtxyOyR2VVks9PKL3Oke6a3TPsEtYSO1pwVdNqSTa8SX38tJIg92Njwqim04olxrXMVDbaliBSgqn8CZp6ToV0JnV/map50syl4NhLd/TVtAmohEvmd1/7+qVLySQWu2MebRnRV5C3XMCZ8BqJI1w1IqgQVc6Tls5HR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553149; c=relaxed/simple;
	bh=cu8iAZHj+6qkt386SMbUZdsdGoa0y3ICoc1L/S+KRTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIZ0dgrxOlEesX2+Va9aVNbYj/PQ1Fmdo0fN6Kgpejj8BbitYxdW0v0cqpSoSXbUKc8RPyXXTCp3BhQCD1MJrEmtF0/A9l4oHiozypMGyNE5KOxQU+pH3tGGVlqT8d6MX1VYZI+vBBJrLUTao3cH6e/MjzU5vG2de1Fv2ZzXB+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erzMcrMU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erzMcrMU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-567d9cfe7a1so22756e87.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 18:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553146; x=1758157946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMNmnJ10e0LO0vt2oBnZUmZ41g9uNaKIbmtY1QUxYIo=;
        b=erzMcrMUx4Tv7DK40KIyfWsdL49t9+xsZusFH5ROuS67CpuKK43Kn3/xvj+4LcYoEY
         IZqFu2wVuxu7Y4at3ruc9CWeeTGLaDNareT8+3i6uDC5Qx6GTbio6FO+c0w6D5TMqDwz
         RNXwJj6MKokvzIp2v//seQjNvb6CBnrP4S+oQHxKYH2DwHK+Qfps/vCdLAMXYoyr1//7
         UlZvMCeuAMv/LbmYsN7zbzRnpZ/AEFf+UjyNu8SxyFyoz3zVy/ELDCw3miU1Y1YxxLUj
         3tPsucBo4aqId6MQfRFTFNYNr9zRqie8r9O07GOius6eJy+aFN2jZsN35HelZtmhz9sA
         e/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553146; x=1758157946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMNmnJ10e0LO0vt2oBnZUmZ41g9uNaKIbmtY1QUxYIo=;
        b=G92gsVht4winbiN6LBvtjN+bqGNX6s7iermqXd+cV9J4DLbcIV8K3DsCvZ9k7N3+ZW
         m16o2NfMI0uHHUTvFjUJGL2gp7vXZNGcuCuX5FUMQlV8o8/o89dwZ5IjHicBVtpEWSAY
         w+K8Ic1QieHUgErL2jKQu9Tv6toqHlGE2DrsPGACmgfYFctOiwKw5I9NRyp6TuARLKnE
         okz+MOgP/q1byDJDCeGzi9hkAaO5Xsj5cEDdU9x+8fFk2vC2n457NAjOeentGj9FFVow
         U8duA7JixXTiFLV9bDROSWwCWY6qOh0iAJtcxzU1V8ESzk3nUgiYr/ejdbgwYP3aBxKB
         7ong==
X-Forwarded-Encrypted: i=1; AJvYcCW9yW9Y8QSgIa4LDYskRM57mX7tnphyPipws1BHAJTt0BgKaawbOIHDldzfGiFoagN1iNQxO5IfNJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLh6EEUBDoE9xfJ5tX44lXVFrhhV0tSmZyTynyUrOhCm44Mun
	xrznLPODc3+kNPZcG0RuoP+fT24//2mB67IrZasccTaRb63XoNxYdt6Z/NuU75Fqhhs=
X-Gm-Gg: ASbGncvq03nu3ED9LUaYTvET24cxrqi+WYflQGZ5FFLHvxHHBFJSoonK7+hp1NpEHd9
	KprHX5UOfDy+HweyVZJi4ZWV53dVwmO7hpAfgPd55sDbmMX9j/DqVvkQ6uuPt2j6h7kgSSxzOxU
	k04EthHzjynOhRqVnZ8V+aZO+QB1R5eEMX6pwMqtB3kUab6VhyrEOYq6ytHwsSMI73mH409SnOQ
	cbQKRTbOecby3X5+BxbW8KV9g9KRQpiEj7jSIenRsITxlkh2zSh9/5edUjXKw/Cj0E+39zH7zq6
	ihStDB3t71YCGtbewkXQHyn0yB8nM2oEf5wJLZYBzsYEfZlt07DAMwITk70Ogv6BrrRRsvZBqOZ
	4w1vPFlHcnLmshWxT4Wxe3gits/EJtax/ioYqvjvFD5ZI6vXbDR+wYPkWzMOqzEhcMsp3Lag=
X-Google-Smtp-Source: AGHT+IHl1UVlJE98JqIYihLtl7Y+krBO7EyUtFwQK9Syxwl7imCVLs5qu+VriWXxkVFZJzXgzqLolg==
X-Received: by 2002:a05:6512:b91:b0:55f:4bf6:eff7 with SMTP id 2adb3069b0e04-56262b36244mr3029452e87.6.1757553146001;
        Wed, 10 Sep 2025 18:12:26 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:25 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:15 +0300
Message-ID: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
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
provided by the SDM845 camera clock controller, and it should include
IPE0/1 and BPS ones, even if there are no users of them currently.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index cf60e8dd292a..fb313da7165b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
 		.name = "ipe_1_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

