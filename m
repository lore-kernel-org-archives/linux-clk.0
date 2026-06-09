Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B73491E1
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=TqscAye8F1iw2TJ8ZXktEYEbUKQg5pcwYWSiDZTNQHvHXgcx2pX1VJRXs0oAj6oOlzmpPRL2ZxSxTEMJCxJIXpKpKHPdtuScvqYFw9J83H+Q+c9vx9/LqAgeWGMnrQVyKQKvIkpd10420P5Z3E4CL80zVVLbJvT4cUj10ExMaj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=A5RQZXdK76lJt2J1ilsEmaYiiIZQId4ou9RP4QENTB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbkbU1efjCmP92E95w/WDC4k1Cm7v6U5IIdHgUoBfNsvRgAXGwRDNSzzPEFxEwnCnwtKrXDXBULfCVo93c/VvJUBX+HpwzZJ7fwfl8ouu3xLYE+5+Gk2aTaVqlXDk9IxX+1Ysx1LNQcVsOgVJ4fTys0yieYH0O0IrCJXBQhZQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRoQKp4J; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRoQKp4J"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4908b92904fso64128015e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014522; x=1781619322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=wRoQKp4JTDBrFgCj1ZAkCfqp7i1ELScQZQ7yJi2uOC1XLCxzF+vnYodKFOTtvrgwUb
         IvczgrMyUcsr2PBjUbh1et0t1bZRRAZPsJezpvsOhKVxz/nz5Ng137vnD4ySAwNpiG4d
         Tyqf64gYfwUxe30vQs0PiGuGd/UXgLZdf0wb/GH7GZWcHXNOdBQ1O8Q4+w8oLiyq4cAY
         oUSc5ilgHrkgID0Nwcf/sF9Y21vwD0aTvVtQD7cVI2eQz3+QM8b7zFErmQHvIG4n+OpY
         D3/yD6ZdkJ49K3LuEXcZfv8AX1BD8Or3PkO8hKC9UWoWezXJ7A6xJp72LspW/z2nJ5dQ
         37/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014522; x=1781619322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rYmYdF49mLEjNdBagNOljeKdmXeXyuwsViyjQ5L+0Dg=;
        b=AwWjmpuB1ePeBY6+7Q00dtogI+nu67XATmX/jPoqDNE92AgZlgjJvt9VQiXbLEej9x
         2RgRJgxDPxTUcuOcjtGFxWJIcTxCItAZeGJCUVjw239VzlzPm3yq3ReL+q5LptQ666fH
         NJwhVCwf8sncYVo2yEvM76oEXmPBY53XVhJ0lPnSi5jXvp4+Z3JT7hLSd5198K44/li+
         b4DGEvjrMzmHjG+S3HCQlunx/dR2t8AUBu8Y5mvQ23U6M+lLBgkCRIeK3gmMZ+hfkl36
         rEcK1zXfobwhy6Tyu0pcl8HzmOIWKw39ayE4JIt6Bs1MLSZxAGcOLCwbkvHad5Uo6cHm
         Ussw==
X-Forwarded-Encrypted: i=1; AFNElJ+OOxe7LU2xL5XQ+KkSizZEufwbQZ8/MtNfr7r3sRWxp/F8tqUVwYnidTXUHAFuhR6aIvW/hYwHsaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUcZfAul/k+tnPHjFBWGPOHHu8KCt4OopS34AKi85uIEwDAYo
	eTNwVQ0R/i1W67xiGp5bDN1k7K6d1i4XEzhsk1C2OZLHeO7Y0/GOYWVq5i3lz8IKLDY=
X-Gm-Gg: Acq92OGSPzX+uA8ZVE3NPEjk4BaAv9eQg4Lm8Zphypalg0RtDCh2VsUXL2cvTiKLuhA
	5nAtAiWx2ZSGRyO62nVBewgrKewzNkH3blfOgTBDXZwOmx+HsEL8iRCSzs+8z/91x0YBz2yjMvL
	dIwiuY+eSXrWQ32VbAsoW4U/bt9bfNur8StQikcXDbtSkTrEAkXSUUywBKh9U4Nr/jjIrr225qT
	C1ZpXbzkehr/lPARxF0VkzcWEnEwB7MTKjOrsuR0mHSeE8qpPxJHQz8k+UdwQfr6hw5QQ5qBKyp
	CgQmZ5WjbrTqo4EqibUKPEXnm/KId9mGAy4lQkrx+ehMTJrSDwOkE24Un5Ek63yZBTkY02bVZe7
	3FpYVOYc+Wwc3k16aN5OSXPjeoA+Hh7a73Z6gBXoFYryvKhhaVY8BmP/e4uTxmtchHBE0o6CMdp
	lFCOxKZSpfqYEkRp8+RTYtJ7A2AmIN73v3KPhwsub8P2sQCEc=
X-Received: by 2002:a05:600c:3b11:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-490d9d05211mr27027635e9.18.1781014522040;
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:42 +0200
Subject: [PATCH 06/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY
 reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-6-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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

From: Stephan Gerhold <stephan@gerhold.net>

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 8fc3ff2559f0..7c1890934fe8 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1571,7 +1571,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0

