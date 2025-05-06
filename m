Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA628003C
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537029; cv=none; b=IXdrA/w+hTGpbhulkCDIdA+LhOzYOHMLyGojWkuz6oxIGIXCStO9h+Iv4UUzbCA1m0ov+uiu2HC2Ct33ide9Wre+PLBXHIR/n5gbYtpRUac+zUWc7Z4nm986jGPtScc3Fc/PysRONGWTq2jZ6ZM91kDXm79kMycf6WZ07bLxSig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537029; c=relaxed/simple;
	bh=fK59Oou5drgQyhp0Ss+j4VYrMmVw0bDtAiWMF9Ozu5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L37Ym9qij4n/XlMBfspg613UKaeyYEaAJDQ1u7Svq4w0cFzMDJgbeneKSqs7/wF0CltINRuIle0sNLWObAzj19Lm2YhhGw/kxnfM8fW4K/92mtoXoCbqo5TtB+Lbyk2Y59hfeY6Bub5SQU0rQb0MvfbQcZ3LaYtqyun340iSxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgQdvIU8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgQdvIU8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso5098869f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 06 May 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537025; x=1747141825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7hjl3tAkLPYtX6/B2YAWQ6GsOIrYFPOtKZDg5lJipo=;
        b=rgQdvIU8Wgoph89KHmvIdRzGLA46hKnq8YNvFmQU9aFK7mKkcLsmi9PAeaSckyZz9D
         U0kzWXeyKmcv8uh9VdBlXIaF7SvqveE1dV4qWDXOwihJgblTSvxniE3jDMDB01W68lE/
         T4Ts0SRiAKT3nNiSFeKJ3S/ET9iiUV80+tlsqfyWIQpFhspSDeo7I9F3neo0LppTRkbY
         Gapgm2ng1hvYfAYNbh6UVdZ/ejpADcdgtz9VbnFGmWHT12VnjHlvk653SRnEl7ECZ3Pg
         ic521jpizxKEEaMVvlZCCSWOOvpTz4lm3Bkf1pTh+sQd1cKTdpwCC3RWyRtF4LvFi3Bk
         WX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537025; x=1747141825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7hjl3tAkLPYtX6/B2YAWQ6GsOIrYFPOtKZDg5lJipo=;
        b=aXb92xluMaP2P/rUerU6Kfu1C7Xi1Z/v7ZHr9vp7e21hCmAhqwk8ZXMyMelHe01mLD
         cGri0BtKSpGbL3O/lUHI8jtXVcWfdM9t35L/Hk09hxvTTfDRRlgAuPbalM2SYHktzc5j
         VI2WMi0xw4TAM0iy7NNRKT+2zoYEuaVTtCqpjPT0uVzwrECIk1HTOynEw4zfmepa48EC
         Z2Gi0+v6mL3AZsRk0PJgIBBHhWXPREXedyd5fFZE8fvZ41cY6ABqCSJx8rsaxB1ai6kN
         EWGNWhizBjWSyl8KCU5o7s7qZ+FJWDSTKa+RhoVo4ofRv+skxQMzwS/gKw1T29zVBNxc
         kRCA==
X-Forwarded-Encrypted: i=1; AJvYcCUQiPgyka1mpe0kJMI3LCPC+tAf2nmsYuamwbMrgMaV6SJl4AJKQPOWgnen+uXlbnPhxEi+6MA6j+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmH/u4hElNq1ndMcKy5J6BSaUKbcIq/RiaKrUmzcLHDssEjXE
	hfHHBhtx7ZBYUC69KrZFLrJ+SMgbMROBukHYDVCt/moQf6grHbCg0qGjtGIBuDM=
X-Gm-Gg: ASbGncu4xT6xDrhe3l3nrHIro8Ibrhj8WG/6h8guCcXaoUsuMlQYuaDzCi+W4Tkkm5F
	dWPXCKLMeQjE4xM7hJwMr+7r00tXqOkxdSFFIMn1+S4Hkc4Irtx08udyyWnzsYzQFpIqDi7aMiy
	hC1BiIW2sOTVQSx2j0+zMrPO7RRcNpu0oXjXYFXAlizkPugI1TvpsS9Td7o8657gsKyXZ60SgjN
	2iBofQD5MFPEWwXf0kprfoiOAtPWr4HXS9Dp1qHWaHXRioQeQXknnSIMiJkmDBdy+p8zj7Jq6N4
	6mfHIoPP4R1o8kGqJk8XabW74YQnlgCIGnvQy2LEjT12VYkxc4iEJv0=
X-Google-Smtp-Source: AGHT+IEiRsxAkVrXgPCAZV3F4X2CztHeRG9ctQ5zIhdFUM3PU84EJKKoITEP995ACO1Ck8FEqkm68g==
X-Received: by 2002:a05:6000:18a6:b0:39e:cbe3:17c8 with SMTP id ffacd0b85a97d-3a09fd6ce46mr7930291f8f.12.1746537025293;
        Tue, 06 May 2025 06:10:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:24 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:09 +0200
Subject: [PATCH 2/4] mailbox: qcom-apcs-ipc: Assign OF node to clock
 controller child device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-2-b54dddb150a5@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2

Currently, the child device for the clock controller inside the APCS block
is created without any OF node assigned, so the drivers need to rely on the
parent device for obtaining any resources.

Add support for defining the clock controller inside a "clock-controller"
subnode to break up circular dependencies between the mailbox and required
parent clocks of the clock controller. For backwards compatibility, if the
subnode is not defined, reuse the OF node from the parent device.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 11c41e935a3619b74ad0f5e2d82699ca8aa05722..8b24ec0fa191efc975625d9b9270140ad1fe7b9b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -116,10 +116,18 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	}
 
 	if (apcs_data->clk_name) {
-		apcs->clk = platform_device_register_data(&pdev->dev,
-							  apcs_data->clk_name,
-							  PLATFORM_DEVID_AUTO,
-							  NULL, 0);
+		struct device_node *np = of_get_child_by_name(pdev->dev.of_node,
+							      "clock-controller");
+		struct platform_device_info pdevinfo = {
+			.parent = &pdev->dev,
+			.name = apcs_data->clk_name,
+			.id = PLATFORM_DEVID_AUTO,
+			.fwnode = of_fwnode_handle(np) ?: pdev->dev.fwnode,
+			.of_node_reused = !np,
+		};
+
+		apcs->clk = platform_device_register_full(&pdevinfo);
+		of_node_put(np);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}

-- 
2.47.2

