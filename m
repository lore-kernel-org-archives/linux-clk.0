Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D9D41A87
	for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552030; cv=none; b=JnbRTyucZpkh3xSZ0qUBqtwz7RCYJ7QWBc7PHToeh7xGrpSsMVBgTOnTkrUJinK8TsM1DN5K6j6YTgtcRE7Iqw0FqMBJBmg7gOpa7gIxW/vfMt0NGEw4bwWsPshIQ58mvOD5RzN3djwfNLyir/V+UlCok0azG6E9XYm6MmOPY2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552030; c=relaxed/simple;
	bh=nozoIUcXI4qDBNkbxpqvRvoom0g8ypFap+QSsXv/xZs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ltAm/pV3Zub8GYdXyX4IlV7H9mqJAC2nYVa4CTGfiSZHSxy91MS9XyK/KxiaFuQA/qdvHwsikTpS4wuliHzZTnojV7eYbfmSlEsCIH5JNbx1kLydopheHAfVESJ8GeNqKaA1Qklp6A+EwcMZ79ASAQPbBfx12AtUpisV2SvA5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA0AB05C; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA0AB05C"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52caebc6137so169863e87.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719552027; x=1720156827; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
        b=jA0AB05CeMDAx1oQb8NBTtAuKbiI887UGYs7wzeops1nRb5GDdHwnEcsp/KAvU3yqv
         4X5b11bnn+dQwxiWbK+Ko6+j3X5u+lOkiW5wXfzzqYeZZMyRCaX9tH+Hzmy/FEJyyHWN
         HXvzAX39B4gaTKHDZQnZoHZ0CDt72BJNZLI1XYT2nRkhXHn5lnoxd7zzjIhXswXInriI
         7+8Xpgw0+60QTc7eYfIdRURhT1fDgjFSobI21/uo0Cn9fc7xRBJY1p8ZS96Wg7UCPb/5
         UcmJStzLlw5HcSiKDUUuJAJmUT0uodjvLiQ4ABSU7lIXl7bk6wh9bjZijQa3UfUrOOzM
         PfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719552027; x=1720156827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
        b=n/kcpT19cFb+mFcfOsbQS0wexgxm0ltK86URJQU++XcVPQAOXDinPSplq0Wy8irBH2
         2oYJwkZSBGiSxDe3aAmRnV/+e8JafukM4rZf+jMVJ2svBl7zAZjTGnVoYZfES3znQtOZ
         lDV2pHhuvayOH8BQuNOIO80qPJ3cK1roZTG43f9K+W7kdFqb5Ol4QubvRC/cfQdu5YxH
         Ha/7EXEEZRRGv75tuS30BHxZWmBxjb+f7druy3YnZ625gfhobt3DLCsIRu8RzHdhimli
         /benVy8ULj6UyXzD9CaAb4DxIeJlHpz8xEFaGcXHKQIqxeTThZV2bEVASgngduaMGPxH
         9alw==
X-Forwarded-Encrypted: i=1; AJvYcCWjhPk6e9TxlOhnmrHpsMtDH56eBYiAhlX4f6+DHI/ZiAKZewm3F9qW2Y2g9LF4tnYrHzUPp0H3A/Y2B4VxTaahjX1nMQd+vj8J
X-Gm-Message-State: AOJu0Yxv27Wd8CfWbvu0LlDePOU2J9KbgZZeEQH3MBsLo+2GPJlWPQgr
	nzO4VOxxOvtxOn9uyJ8wXwQASNCwO51zy5TP/CLOoBhxRxQeqg00YwU3RhcXhAQ=
X-Google-Smtp-Source: AGHT+IFxae/ZOWmakYzI1aE7tdFOnmCfK6pLehwC0xpC1CEJL44IXUw0l2cwjQo8TT3azIyHySknEA==
X-Received: by 2002:a05:6512:220c:b0:52c:ddce:4fda with SMTP id 2adb3069b0e04-52ce183250emr11796358e87.2.1719552026893;
        Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] clk: qcom: gpucc-*: stop requesting register resource
Date: Fri, 28 Jun 2024 08:20:21 +0300
Message-Id: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVIfmYC/x3MQQqAIBBA0avIrBsoKYuuEi3MRpuNlVYE4t2Tl
 m/xf4JIgSnCKBIEejjy7guaSoDZtHeEvBaDrGVbK9mjO25j0O8Y6LwpXmgWtXS2lzSsGkp2BLL
 8/stpzvkDURVnzWIAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nozoIUcXI4qDBNkbxpqvRvoom0g8ypFap+QSsXv/xZs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfkgZCO1i8MgCYMFMkelu5PazNJg+YyIXN7oPT
 6Jo+hBxdRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn5IGQAKCRCLPIo+Aiko
 1Qu+B/977z/5JNUU8bWElQL0CjlvFvUdulyiVMSBTJrs0GiUb+G2RUlPm6Jl6I82DlbMOcj5rv2
 nurFFvlR3i9LkQqpC+VWYznTq/5Iu1R3XM7Ss5e4twHFkwZXD3fiaDqK+/9f2jB1OAVYT2MMkSA
 hsRxYxev+GUNbn7HuJ9YVDJScUO8azF4iUEn5KOSbETc1AM/paaeVXS1OkDrT56wpmv079cgQxI
 D86NIsaljIOBks0ADHdAkgbuDF9ut23aufyeRNtt77c/R18/a8wEii48qn803Bl5tFmMwbiVOYv
 BnuawaTtmdeXMKVptadsyUHxRH8zv1a/Smw4qHuGN54BuF7p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Testing of [1] pointed out that on all modern Qualcomm platforms GPU
clock controller shares regiser space with the GMU. All gpucc drivers
use (internally) devm_platform_ioremap_resource(), preventing the GPU
driver from using devm_ioremap_resource() on its own. As GMU register
space includes gpucc's one, make gpucc drivers use non-requesting
helper, allowing GPU to take over the bigger memory region.

[1] https://patchwork.freedesktop.org/series/134401/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      clk: qocm: add qcom_cc_map_norequest
      clk: qcom: gpucc-*: use qcom_cc_map_norequest

 drivers/clk/qcom/common.c         | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 drivers/clk/qcom/gpucc-qcm2290.c  |  2 +-
 drivers/clk/qcom/gpucc-sa8775p.c  |  2 +-
 drivers/clk/qcom/gpucc-sc7180.c   |  2 +-
 drivers/clk/qcom/gpucc-sc7280.c   |  2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c |  2 +-
 drivers/clk/qcom/gpucc-sdm845.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6115.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6125.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6375.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8150.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8250.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8450.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8550.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8650.c   |  2 +-
 drivers/clk/qcom/gpucc-x1e80100.c |  2 +-
 19 files changed, 39 insertions(+), 17 deletions(-)
---
base-commit: 5d98d5e70f505b7278336de493eba94cde5526b3
change-id: 20240627-gpucc-no-request-cb6b5f72e8da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

