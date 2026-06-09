Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99933EB0E
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014518; cv=none; b=j3ygJLcbQvxbY0Q+czzzQtwjyPnMG9ahn7t8pA7gVvj+zRJKtwy8OO2RlSoM8tGi0hye4mSibo0X3tFOak3LDHqV+lY8moSJqhQST+giKZHQUKtyD9Fbt8xIvSP/4bv5Xk9IY3SCJxO8/stsVfIqjlupC7x2oltNB0DV0GvCDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014518; c=relaxed/simple;
	bh=SJ0VcFqN8szreATMoSEelucjmskHHU4MjIq5rUz7iwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DzZmwgZWdgDssg2/K73LpBxvdbsdUbHRQQFZlOvWEX0GkFUBKeCN3eroFIdbtz4ErWxBG8HseFj4XTV5U3aiI2QCU4PvT212dwMOb30qv9rjYBQDcqBbd4n8Vu2O+lmcKeP4QF6/PmyUnVUBffUtEU6UtPblo1obeOHIovQY8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UD1H84L1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UD1H84L1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4908b92904fso64126495e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014515; x=1781619315; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6sDl5vRDu86DoXVi7plLZ61XDM9mssebUL28OXdvE4=;
        b=UD1H84L1hJbLHb62kokiLsUQmjZ2UMu7S3DbXCEK86IviNL3vadaarVAjwDsG0vpGn
         N2DxfU6vMxrfw+/OTPHmf+7enIp97WNXFwTZAyBCP80I80z/iBmeiNGeKuucvrsvbyGj
         sLUzvBBZTbHDzaTyeoce+9GW8DOcDBItQd8M9JycnfdK0+O+CEFMD8kZyZyh6Isv6vIU
         QIWu2o2VlZDqCFb7VBGJo3dyGGIGaljvKdL2Igib8LCNPUGj1pnXS2Jc0S8TOXBCdMJ0
         EZ25FJfoFBOuARrIcs3l7EOP6gw/V8WuPBrZi3D2C+n0oFIeC8HB8sf8FSqLsdh6tOAw
         hARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014515; x=1781619315;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6sDl5vRDu86DoXVi7plLZ61XDM9mssebUL28OXdvE4=;
        b=D1hNdSeQdLXIUqEK8LeTCZ8FjVNSOOJBhweeG4evFYz5DrZCNxjYXqIMaeJz2oRwhg
         PAiCf5hrBlj9sxazdec52BRal0ySucuDv5w1sfEpt8IavRzYlpATevZzE4XG9oWV33Dn
         btMe7McAbOw+k6uRMtgSEZl/2KlFVP/R4wY8Ec3gpjAL5Qtp0gc0Fa5Jkh+CKylR5l+s
         HCffeq+OFwhjDTdibOlZaDyj+mbVpvlptUWKqDhEbPcRUbXRS1+ioSsnlxaHqvUQkAUN
         I59tjpT5ArVhBrVEpg8sTaLLkt5dabXsBm4AJQo8yvQuDoF28jazrpq74WeFPsv9pblQ
         ed9A==
X-Forwarded-Encrypted: i=1; AFNElJ/NWvapjRYSLbnr8Zg3xp7GgYYDtcrl57+Ed69Ptt0tGdmvQmXFR702zBiMsuf/F07N494GbnPHJl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs1YPTfUJWPpnzgrgPdIvGDQmyBnb85Bya41nWxrlF0WBRlmEf
	7nVaYYLHYPZ8MJykagJAL7CDEvM0gxiKmI1lWCiyoVheJdfLDJ3phivJQOXQMWSjjvQ=
X-Gm-Gg: Acq92OEfuAVJC6Y9IKSbnVL4w0o3bhgYfFEIyXeEetOSf9IMlXgUVG+w/DyKf09smss
	EyJ2N8uPUkaFVTT5pu0UtkpPeU856J+pQTQ8SKUAiQOIwcxLgIPIeWbDlCLgxEfncUEORHCXdWg
	4omPny/LCywXfoajqmxkSHS/7iVpeT5+3MV2s2+recX8t+23uqiIFFSjFx05mY91AayIv2J7Mtg
	6S1vPjKD3SmU0q2YrqLjLbK14U3W4wryzWSaMSlnQhSY5dDV162AVdSsdPOQ5+wif01CXT4Xl3I
	Qbaly124Jd/+zMTjP2LJKYZIKsUgwXjA7u3/3T+t1eRgCEStuVj7SEExbVU7G5qrxMEWnhRLpVJ
	5GPmLr2sOH9klu8/t2jsG7+A//G1AF3iHsVhusuUURUQ8gUCPeMP+ndg1cef1xnFlidamiLUtWp
	OMj8KdN4B0UNufD9dDaNaBJ3CoiJ9N7cOFQA9HfvwnUFMUtiI=
X-Received: by 2002:a05:600c:c16e:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-490c2622d03mr350451545e9.19.1781014515087;
        Tue, 09 Jun 2026 07:15:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:14 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 00/12] clk: qcom: Assorted fixes for gcc-mdm9607 (and
 gcc-msm8916/39)
Date: Tue, 09 Jun 2026 16:14:36 +0200
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMwfKGoC/yXMQQ6CQAyF4auQrm3SYTEOXsW4gGmVogM6BWJCu
 LujLr+8/G8Dk6xicKo2yLKq6TQWuEMFsW/Hm6ByMdRUe/LU4CtOCePjjolT4+mIV32LYXBtYOe
 440BQ4meW31Da8+VvW7pB4vx9g33/AJq/soZ6AAAA
X-Change-ID: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The gcc-mdm9607 driver was originally based on gcc-msm8916, with register
addresses/frequency tables - where available - replaced with the values
from the downstream clock-gcc-mdm9607 driver. Nowadays, gcc-msm8909 is a
much closer match, so comparing the two drivers revealed quite a few
mistakes inside the gcc-mdm9607 driver.

This series fixes them, together with a few other related bug fixes in
gcc-msm8916, gcc-msm8939 and the dt-bindings for qcom,gcc-mdm9607.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (12):
      clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
      clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
      clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
      clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
      dt-bindings: clock: qcom: gcc-mdm9607: Drop incorrect clocks
      dt-bindings: clock: qcom,gcc-mdm9607: Add missing "clocks" property
      dt-bindings: clock: qcom,gcc-mdm9607: Use proper address in example
      clk: qcom: gcc-mdm9607: Drop redundant register update during probe

 .../bindings/clock/qcom,gcc-mdm9607.yaml           |  18 +++-
 drivers/clk/qcom/gcc-mdm9607.c                     | 105 +++++++--------------
 drivers/clk/qcom/gcc-msm8916.c                     |   5 +-
 drivers/clk/qcom/gcc-msm8939.c                     |   5 +-
 include/dt-bindings/clock/qcom,gcc-mdm9607.h       |   6 +-
 5 files changed, 57 insertions(+), 82 deletions(-)
---
base-commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
change-id: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>

