Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F36155726
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951260; cv=none; b=JH0hIfUdvuLKxiLAyn0ue+hKlYlwQ2nrh/xbjngkruzTNbw4Fdy09uCUYP1Va94KEa50yTlzcCNdD3QFaFZ3J96cbvTGWZACKzdGuYyEsABJrSrGQPO0pWIgDrF7DcVB7/VsZHYvoFhed/D8aQVAYRUx/5spokmQZaiGIkTfg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951260; c=relaxed/simple;
	bh=IwilEpxoWBhCfcRwNi6IPFn8TUid8ReCw/G+eRzc3ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u4KUrp1cJKtK8BKLoPCortMy5nfG8oOmBTb0ksxerMpb0YI/yH1mjBrpCJLBrL5ZLOxQNuTydLdvwuPvFjDsZq1THcems/pxUhaLhp4FZXxBcU+C0CGZHE3hWoiPW1AIwsVC96fTxf4mpFD25vVcigzzgdKdRaMmXJAFX2SIWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkmHfFN+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkmHfFN+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so1208255f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951257; x=1719556057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmm2AP8HdLA0xcCQlwNYSdjRGs2bIdgqgz6HJe1wJBM=;
        b=IkmHfFN+ADXq9qvqUw8OyUQ4z101LNTLH5D057olDgsaT0yq7vC0fKY2jtxZO16D/O
         tGxVrolbUC1i66hqwKR9CXuHvRV4x748e5NSmaJ0Ee/KUw2YqUt7H3aQI5hQm+05zg7F
         92VMS/hevpzc/uEGWZmphqM2QkjcH2VzFjfvEdLKZtFdL8Q6D82K/YG/mbZHSekC+rof
         2X8zlWDvVHxGpev7sbh7d1caWEZwosOJd7lYNNhCIO/FuRz88EU1B0odISwfIcxvryp7
         0MXuw8nTQp60GmaZpUYPv4GTod9VWfnoUv22N0P87Xs5ydsV6pM/4rq8MkmoFrAtorA9
         V1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951257; x=1719556057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmm2AP8HdLA0xcCQlwNYSdjRGs2bIdgqgz6HJe1wJBM=;
        b=B5aVd1pv25ECBaaUwTG4BYYqbko06ZUZQdbBM6+I10TqGuFium5mwS+t50Tr4Miu27
         BGgodFF0hE2Zez81UTrEp0O/Lf2pQm/roXiidmLLM0n99gkyqvjGsbGKn5bx7KH4mL6E
         H6zijfXuBsW7sWq+LTq1x7cYd0kIUeq+/72MLjly4rAvu0om0QbnHUAgHuQ+oLd5cByD
         O1fwFtWvAu9b7pbmYyXlOQnFNceST6f+aDoHaNrHNz+FaDbDkPmgIcrgT4yGa20GTRXo
         wnzQxJ1bD9fkCGhdoDwRXTesjJVBJumU9aZZRpQwu/r2/s51JL5DyV2D/PVyJKtEKFPD
         mRVg==
X-Gm-Message-State: AOJu0Yzpt4BgebjzgqIy08Vplz38MJ4DUBGGDWL/uFHw/Gc/zSKOHTkW
	CWgUCr29DWskxLpuiNX2yW2pwF470yje6FUmOH12scTlGqoGW3z5NcNHWk/QMao=
X-Google-Smtp-Source: AGHT+IGNuPtTUWoR/fyqtIISKh2Cu4R7v9ETKaekvIPXTadAHe0SolPNV0MLSDlmZ8gtZV4ZTWZwZw==
X-Received: by 2002:a5d:4e87:0:b0:360:89a3:5293 with SMTP id ffacd0b85a97d-36313fd379amr4629579f8f.0.1718951256942;
        Thu, 20 Jun 2024 23:27:36 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm814013f8f.2.2024.06.20.23.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:27:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1713848917-13380-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713848917-13380-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Use modern pm_ops
Message-Id: <171895125570.3618049.5200843914649548447.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:27:35 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 23 Apr 2024 13:08:37 +0800, Shengjiu Wang wrote:
> Without CONFIG_PM, the driver warns about unused functions
> 
> ../drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: warning: 'clk_imx8mp_audiomix_runtime_resume' defined but not used [-Wunused-function]
>   363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: warning: 'clk_imx8mp_audiomix_runtime_suspend' defined but not used [-Wunused-function]
>   356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Use modern pm_ops
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

