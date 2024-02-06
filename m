Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6351350EC
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233123; cv=none; b=Q0IFMG8UYnWzIBRHShtWC84yHBI1AQ9VGnpPfu8PPxNuLhagXCQtuOVTwc0DNfiMkyai3gvGRVcSuA4hCz1/zL8ngmpRAifQoBw/4P0BXkjVOhX8hiUwSrxpXgWsVg9kdR81VGW44TGo8PDfzPM1H1/kn6EFqQlpXOmT03m5pkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233123; c=relaxed/simple;
	bh=ZbnYWOWGvK/ES3S9eMzDXjdwxf8rQeCcOIBgJpBO860=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mLPOE8GFUdRB5kg6wG4yXvdJi4/J25gsRwpEb5xb+zfhwV+rlg7FtafwEU8eZ8xNj7im4D78/tXB4ArJSl/8OC7NVOe9Z+mVJEeetgyEWpAWz6kgQWfTZSwyEMGfTOzFV7MnQBLNpaTkB4saAjHcHAU4pjf43NNpXvKkiT/iyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGs6ZWMr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGs6ZWMr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51032058f17so1204619e87.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707233118; x=1707837918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhLhbWyNSAgVaEka1oBuIOHQq9gF/Km+IN/mo3o84+Q=;
        b=GGs6ZWMrFVCtp7i6a+ioFSOf54AkzcWF7TqtxrsTzwLpg73g1QrSJKjk2rmITUgeBk
         HCbuckMdWBzzUzvtmd95MXCCC/OFIhtrlXVCMlmVH8wjIAi8a/SS++KrLU6d870wywvL
         asUwHEa5L1n4v0Fh7K4DiY98AmLjmP1TmY2jjRWoptk7D0YBzhP9GFLulYEdhe9yA65G
         sLZuNjLz6thK/3KX2dB8fomKFLbNATeN48Nr2hR+nr4liDhTVuv/FHWbf9o+5SQ0h1ZM
         ryVoW/XrrVNMnH63JEVFlyne8Q6XPxmaN98AxGCzSPKSrVDCEGOnDhPq5LJDIWY4idnl
         gAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233118; x=1707837918;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhLhbWyNSAgVaEka1oBuIOHQq9gF/Km+IN/mo3o84+Q=;
        b=oj3q+IVmr5hojQFNcN2sXaIYrIXgW9wfkHfDlVU7L4ro358XcyCe/GHVtfFwwbDj24
         u0aogBywoR9GjqKPj44u8MAoMe42tgokTzc1gZCalwxbRdCCRlTHv4/QKkcB970HVHuK
         DJqlYUasGsLgAKqTIq+RqtAfNRSy+QAkwHVv1syZ8gSC/r5H2tA3Y7hjHnm/VRY+st8+
         SFlLrDg7Vi1wgbBFj4JjI6JHpOOCWRW64vLK5YmP49m6W6A6odYZi9YCnlOjo2lo4Gop
         vaD+40d1DMzhD7VB/w1yVYQN5DEqr8ixyZRDQcVBV1144fc+4ULXMYBbC8siFIBtnln3
         oiEg==
X-Gm-Message-State: AOJu0YwDIDMGJwl1wQxyWP1lx4srRdbv1U8in/vSmKHtjIbefcHxmvK/
	ZPEFIyBPZ6cPl7HA72sUfo4JCBQMT1XWvt2JS6Pq//+BaRIlFaDVSRPHQcK2D/Q=
X-Google-Smtp-Source: AGHT+IHgrme5l0a/6VoHEUQnA81swpwwVPX0/BHOx9r0lbFWIl7y4qjYTCnDIpiLA8VPo2TpTdLKSg==
X-Received: by 2002:ac2:5585:0:b0:511:49ab:6aa9 with SMTP id v5-20020ac25585000000b0051149ab6aa9mr2166152lfg.16.1707233117732;
        Tue, 06 Feb 2024 07:25:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVaNqmv5xntVoJqJvdiFyzjbIMqBbtjBauhTuAIG+Azhd5qaBkl586H0tKGP+b8Ny0B0vrkRpTq+llIy0OY3IWV9E+uvaRqjOJ1H41muJ/+RhM70NFU9yAD971NAMU/gUY35mz4wPrD78bY/9pk1Ctm7OlGuIizgz8NXnOYCycqu7f50jhtozTB/OKp1AMub+T3uVWWsmOIbszQ39n9H+2RBfYnZBtbhgc/rWwpC9muQNIkpyRXF4KBVw1WrYNbfbcTDg==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b005114a6cbc57sm264624lfs.46.2024.02.06.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:25:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] clk: qcom: use module_platform_driver() to register
 drivers
Date: Tue, 06 Feb 2024 17:25:11 +0200
Message-Id: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdPwmUC/x3MQQqDMBAF0KvIrDuQBLHaq5QugvnWwWhkYqUg3
 t3g8m3eQRkqyPSqDlLskiUtBfZRUT/65QuWUEzOuNo403AfJ55T+EXwGv02JJ05qOxQrm1jPdA
 G2z2pBKtikP+dvz/neQEX/kW4bAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZbnYWOWGvK/ES3S9eMzDXjdwxf8rQeCcOIBgJpBO860=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlwk9cS0FIsiOLgd0aPKirfJBqrshOur7JuNpoe
 bA6pu8/DcqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcJPXAAKCRCLPIo+Aiko
 1ZmdCACp1oQfDTRyFlFNZkJOtC/vZrRoVx9aAJW9Dh832c6zfzx4T8r2UurAedVfzFx1e5cw4KJ
 51rMKlF4mOLYtH8JegGzFFilDzc87BpBfirm+8oiqEDEqVlozzKqRBKVuOrnGgIDR4aSiOh8EWO
 wLemFtzDA/0vcoch7Irx7nQH5+mhfYeE0gbxj2CChh5xJ+1dIoObcpyhck/m3nWgOZdLmL3DnkH
 0jDiN8RBpFpO66XIM/OSq046uKnILxk73/JAeoq8xC6KNld9IqSHHzyWEe1eagGKycqlWSg/ejL
 tXuytMKEyNpt/gMm69X9s0KUbfiU9E1Lvffh3uTvm2+oScjr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Several Qualcomm clock controller drivers use subsys_initcall to
register the driver early. This makes sense for GCC or TCSRcc. However
there is no need to register camera, display, GPU or venus clocks
earlier. Shift registration to driver init level, where they belong.

Note, I didn't touch lpass clock drivers, they need to be analysed
separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      clk: qcom: camcc-*: switch to module_platform_driver
      clk: qcom: dispcc-*: switch to module_platform_driver
      clk: qcom: gpucc-*: switch to module_platform_driver
      clk: qcom: videocc-*: switch to module_platform_driver

 drivers/clk/qcom/camcc-sc7180.c    | 12 +-----------
 drivers/clk/qcom/camcc-sc7280.c    | 12 +-----------
 drivers/clk/qcom/camcc-sdm845.c    | 12 +-----------
 drivers/clk/qcom/camcc-sm6350.c    | 12 +-----------
 drivers/clk/qcom/dispcc-qcm2290.c  | 12 +-----------
 drivers/clk/qcom/dispcc-sc7180.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sc7280.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sc8280xp.c | 12 +-----------
 drivers/clk/qcom/dispcc-sdm845.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6125.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6350.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm6375.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8250.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8450.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8550.c   | 12 +-----------
 drivers/clk/qcom/dispcc-sm8650.c   | 12 +-----------
 drivers/clk/qcom/gpucc-sa8775p.c   | 12 +-----------
 drivers/clk/qcom/gpucc-sc7180.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sc7280.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sdm845.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sm8150.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sm8250.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sm8350.c    | 12 +-----------
 drivers/clk/qcom/gpucc-sm8550.c    | 12 +-----------
 drivers/clk/qcom/videocc-sc7180.c  | 12 +-----------
 drivers/clk/qcom/videocc-sc7280.c  | 12 +-----------
 drivers/clk/qcom/videocc-sdm845.c  | 12 +-----------
 drivers/clk/qcom/videocc-sm8150.c  | 12 +-----------
 drivers/clk/qcom/videocc-sm8250.c  | 12 +-----------
 drivers/clk/qcom/videocc-sm8450.c  | 12 +-----------
 drivers/clk/qcom/videocc-sm8550.c  | 12 +-----------
 31 files changed, 31 insertions(+), 341 deletions(-)
---
base-commit: 076d56d74f17e625b3d63cf4743b3d7d02180379
change-id: 20240206-clk-module-platform-driver-4161aee8d197

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

