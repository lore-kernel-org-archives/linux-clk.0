Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45E1E8359
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769583; cv=none; b=vBRneuSR4T9An7ekhqY5/r3VQ8yAFXxK54T9XB8p9Fjyr6oIIxXqIweIo/epbYPtHzxGdBMvFEFC1AqLh6v5bN9in8k/4SAl8sIOC4FWox4DmgHCGhTcePJXtaxXC+zFLaNEHiIGp0ZWfsDh9kLjRLO/g9Fo01GlucwjGTVYugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769583; c=relaxed/simple;
	bh=oiNyTv54VHVM6a4w1mLQcnbnflOdyihzpGBxsT78Cis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae1+2FOTNsX39ABQQtpqI3JLXFF909+4MIn9EDBtF2KPfHWal7fF7WhWMvQSxpV8pvQ+00lFPSGo9QxO7YG8QCfHi3Hhu1Ja6Bv3JD+qqTAO66HsjdNYd8f7+OYAGp1sAb050nlT0itVXsZTdES5ikUtIPPDuvUOA8htym6UMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9mCHJK0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9mCHJK0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so552638266b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769575; x=1743374375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8z5p12enI9RZw66rCmwLiYXfJvqOoZz3UAG+lMt/bw=;
        b=J9mCHJK0F3b8WF6ZmLLg7q5hyFgPf6zbS7q16BOzZDU+pAwZ3GlhbJLSOWlnZ6Ebmg
         +uqjhSOaWBq5ivQCShINdIRk20HL+oZ1+qyRFMLE6ONHP2Q/qzeHrF61SdcI5z2wnwIG
         b193A0osJPN+//5l5D/uMDu+vpM2x8N/46xFyw9cjI/DJZncsPzWIZurGwQt9Ba4m71a
         C9kCAkW7fCWrG6jr0sPO3LjK8rzJCn5UD5sS2/qw4/d6qXWA/Vpm8UxX/27uxj5XguyX
         mCZDrUKbE3gl1ihzh7P3bmj2GCM0eUevK1zbErEo3EGIOt3NKoO8Ck7mMGHV49KbCPxU
         5hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769575; x=1743374375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8z5p12enI9RZw66rCmwLiYXfJvqOoZz3UAG+lMt/bw=;
        b=CHffUFvNAhUfNtypV+kAazhKhrt7GMuC0qfBK78LpbCVdBmztayO2o+WGLHXIWd8eN
         HWbQxqr3yTT+o26oHMusy3dgVkAaJciJA3EjD1JdCV8Keg1+p+QClnlvh46U1g34p+fj
         cx3HZglb1ufE2qOQT0njmAeRSn17QERC5Qr41rC+sZT3ui1XfRz7gXeQmcTi44PYOtnf
         WU8AFTl9qRW3XaRASBMz/XBn3HYj9djCLgwEdflcvbCh/a53A634Hk6iLSzCht9T5eCG
         ao1IKHr6wzFwP7Hjrcju67AdzWIwgSCZ58gMxiT4PWZ3tzyDvhkqEsMDlsIhC5x0h+nZ
         N4og==
X-Forwarded-Encrypted: i=1; AJvYcCU1zl4PkYYU3RHD+Wj6B8GGHR20JdyJm1ERW9z6LNcqb4ydhnBU+VJn4Irovt5V7Fe0I0hHmR27qpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW0E5viTFziZBjwkaCZ46XifLyDNTU/IG+lAYEk4CMK8TdabFj
	WE1R3HXCQkT0vu8FmixDvTsUZxMyvpxe3g46wcpEyK8mYojmUpCqOADCr4X9ukE=
X-Gm-Gg: ASbGncuzW3qwujtfCB4t6u6HeBRR6fBmYiEKbWYzC2WfegS1TtM+xGdKQWJRXJgUdYR
	UifAixXw3bfnbMgMgSg3VeHWHFv+kBcS7r6eu54/iogfAYglUT0b4vzcJBP5i71o/N6cGsq+J7p
	DpVm4wV1VwW+0WQeTA7DIUvJQ81DRVQhpHFbX3SNKJPwptrmZy76Cg8e5IEUrfxo+NK9we5aAvq
	69vOmuZUaCNHFwwX8s1XpzgYmK2BjV13bKyDpf9pGPHP+6B0VbaQgHmZ7jSVlj2WIRKJV14jQKK
	16FLld5t6EgaAxtobybAwyQ0NPFP6DnY7MLTWxmUIDRns5T7XebqJKouMGVxksvLeBT5C5xTTNL
	2hPFd9tRxLt0RHfq7kTjYfpfrUYxw
X-Google-Smtp-Source: AGHT+IGe5qmoAcXMWbaWHDRmab3UauFteJoVt09a7sGbTlNJP0cYBqQFxBHjhU8bkTv1Ztr/PWxw0A==
X-Received: by 2002:a17:907:bac2:b0:ac2:e059:dc03 with SMTP id a640c23a62f3a-ac3f26aee3dmr1087374966b.38.1742769574917;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:35 +0000
Subject: [PATCH 19/34] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-19-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 5e084e2c389ea6d509393be93f7e2d39a795a60c..bec8f93a03f7fd794beade563d73610534cb96b2 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -165,7 +165,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		pdata->disable_wrstbi = probedata->disable_wrstbi;
 	}
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.395.g12beb8f557-goog

