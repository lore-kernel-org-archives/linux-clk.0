Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C235E559
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763050539; cv=none; b=FrW99+nv0z3QxRw4PzwMAVdYbBNOkmZnhWoJAKdBWFLcFy6/dh/H0yQPnY2ZkTrWicXDfZiS3UfrF9nOj3q4nqsyi9Vs4nMhi8eJMAI/t7i8EY5ZEkDUPxzgtNMHAk+Mr4CdnJpqyp/pQ3A/ACWSObdSgKsjK/nIt5C/+Q7nOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763050539; c=relaxed/simple;
	bh=TWEkez4qa74/GelrihI7Pr5Km20IEaqU/Sv6EgMpAwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O/bO+r4xqppE8826AmzgJFkVjsYiJztu8e9b7VK7DkLLY1ppIc+qJfuxRDT40ZO+TUxEP5YM3GG5JrEkVM5mO70Q4D6h5L6a8RUnUSelGnI+F4iyUrzlVs1Zrq8CmEmnKPESzSpK4UyZ+LqT6fRHpjoGumx6xXu1+7+5xXxejRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts00Z7qv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts00Z7qv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso7561055e9.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763050536; x=1763655336; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8KjP0K8IuiEFgrTGQMK3BBanWGBPr/IHVcMMlCVe7Q=;
        b=Ts00Z7qvu+ECstOffCDEC6qusMVZolPoT8nUi//+/+U0CtvSoV4+OBYfptrNuimTw5
         q59hl9qNQlGkZyMaWUG+Kjj1uFuEUeYroD8y+sls+otnk6+hKe+CSUbMLJkBNSQR+qsg
         nX8ejlfIrq79sm0BTY5agVWtSOAG9use3IWXxTAwPFsrl25laYualq1FfELGS6q1gp+c
         OkN242zwFgGs4NNBlPoDdIpqVD1/JgO4DbEsAZtiYR/0C2cH8pfvmuoZWgaaXWKSpNtn
         Kxaa7zFdXsi16GkgyuzrmXtyPI1zp/hA583sDJQ+8VsmAscHtLNSAJctdWkklNrSuIgo
         CxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050536; x=1763655336;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8KjP0K8IuiEFgrTGQMK3BBanWGBPr/IHVcMMlCVe7Q=;
        b=wNEqqCtRYU/0X/G9EsQY6a3sVE+IhcRttpMqva5ikHH7fcf5J6g6Wzl3Q41S5PIK+O
         snNnG1lo4aarBXG07FMXoCmtEU4f2ZTpu4IjFTmWAkD+y+EbZaTqmhDbh2d4X6ihqcSV
         y6TXlvSzo0AFkgAJGxUAzgTz0JCPvus5KexY2JCgOUaFLNeQo+Pc+WgJVfiuKKYsYQCl
         jImeR1WcKGba5h2Pdqkj0I1AqgJM13oAMeVYzTafW5Id12rQiHyjWaSUEC2esz9qreyR
         5VqcNPcJEgR9waQU4oxCLubtkwgwm/ZAWdWrhD67e20kQPfkpe9+3z11oQq07MP2xEWu
         9mQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdIDg8+JHKyAGV8DH/O9k9xor+kxUvVV96p0ErATVtviVP0cKiTami4Wng5/DKTY5eUTcxmlrhbXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YymT3VipGqBq/MTvbVTXGBtpzCoyv02/ua9UF2BpTMc8voGdUtP
	s/WQWllnQ+z/jb3SxlUHvtIrySyBxqvoAQzJgRCwCHmBUTKVyNgfMqBqnh9ifQ==
X-Gm-Gg: ASbGncvHensURo4CvGXG0H6R9PmiU7XeQBcfjcXm5Xj3z+x+MhDZihvSXDo6X3n4q1m
	Ms8aqfv1H3SefiCgporG6fAbWCMibSNBDX9E3DVfFLb9g/c/9JW+f0MXp1NdRUHb0G0BCObRE2T
	5RObN+XU5nE3sYsTI/GUBBU0cgFIuSxwkV+2a9wU0NKO5EpxpZvzdvoAIdlrWcl5tZdkGFkvbdl
	nRYWuo9O+nF9LDGpVuI7z4Cj236BDOL1INIy+aD5WDtxNfHN6YWy/fxGsuvnI0CMgy7KclRnYZ9
	UsW+iCw004To0WTugpulvI1+jaJ0dP/JCuMYQm37E9Hg+Z3gmzyMuRV0hhUp2Yd5LXTPzoJBuRi
	r07Se4G8Pz293CAEr+cOXH4TzK0zkPPMvuWmhe+F898IOEWDDSBKVMj4tKmPeflmsZFuXNhjCGA
	gpLp71i71joSXeIhI+10dfFKHyCMxIqw==
X-Google-Smtp-Source: AGHT+IEQBr7kyonNOCf+6/ITah462rsUm/fMGQESxqAsjgQp5o7DXD/7On9C9thqMTrE8oLwe3DOSA==
X-Received: by 2002:a05:600c:1d0b:b0:477:7975:30f2 with SMTP id 5b1f17b1804b1-4778fe5ee38mr587435e9.10.1763050535961;
        Thu, 13 Nov 2025 08:15:35 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4778f4bc9c6sm11445025e9.14.2025.11.13.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:15:35 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 13 Nov 2025 17:15:25 +0100
Subject: [PATCH] clk: qcom: apss-ipq5424: remove unused 'apss_clk'
 structure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
X-B4-Tracking: v=1; b=H4sIABwEFmkC/x3MQQqDMBBG4avIrB0w0VjqVaRI0D/t0KppBkQQ7
 25w+S3eO0iRBEpdcVDCJirrkmHKgsaPX95gmbLJVtYZY2qW+HeNbThhXjewj6rD+Pvy4zkhuLZ
 qEWrKdUwIst/n/nWeF07T1OBpAAAA
X-Change-ID: 20251113-ipq5424-remove-apss_clk-79def5606ef3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The locally defined 'apss_clk' structure is not used in the code, so
remove that.

Compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 4c67f722e009af2889ff7435535d7bc156192c47..2d622c1fe5d0522f00d7acb4614ebe4381e066c0 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -35,13 +35,6 @@ enum {
 	P_L3_PLL,
 };
 
-struct apss_clk {
-	struct notifier_block cpu_clk_notifier;
-	struct clk_hw *hw;
-	struct device *dev;
-	struct clk *l3_clk;
-};
-
 static const struct alpha_pll_config apss_pll_config = {
 	.l = 0x3b,
 	.config_ctl_val = 0x08200920,

---
base-commit: 682921ab33129ec46392b27e9dafcb206c2a08dd
change-id: 20251113-ipq5424-remove-apss_clk-79def5606ef3

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

