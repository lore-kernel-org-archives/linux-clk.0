Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337DF3D0B4
	for <linux-clk@vger.kernel.org>; Mon, 12 Feb 2024 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707754256; cv=none; b=Br7ufzZm2aaYhr8DTC5oEnfKuv69llVk3yx5y0iCVbOf4WE2mwi9uWboATPpgkz6oUkYzm4vIQ+u+Z5XMlrTL0ffC42Ud31404O5hqnK+WB1CUE8UQylnFbE3YhUAKV+WyZtRh/jNwHV65ylFh0I4t5GaggspRTISyVQbcEkyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707754256; c=relaxed/simple;
	bh=eyOTJutJI1wmLY7JN5BD4EoCMWpHkMKGwKJZTeOKvDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cm+7EjU8cRzazoqJIK8Bb5shHwRGoseidP6D7h5c3ycsL6ZIRts+xXeoMiUP5wsJsmre0670C6igQor+kLU6wR0K3qU9qbxG+M787EaW9Q5ghgULGggkHQw2ZCedRBRtBhrXa/WRahS0RMYiBFIkLa+ajr0CAl311BJ+fUypucU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/hn+PBg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/hn+PBg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3cc2f9621aso87993766b.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Feb 2024 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707754252; x=1708359052; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKExcD/PI3rdObcMLW7NUqLhtinMFG0WFr4nResNLx0=;
        b=Z/hn+PBgYICnZJvgFGO50Gz5PvGhqugarfW1AW9lKssbHcX5kruxuwf9+uvmmf8Hmn
         KdquU1wLqeXnviO7vcJyrmkpQrpSYufzZltci2LHZ/XCmRhxkSt46WwulxHo04aTJQ+A
         efHPIrkH4EJBTq0uELLKiVVRQqxdfKBfdexMXfmgKM48fctzgbC8lXDwHg7zoJvOuxhN
         gC9gXELjNOsn6LZGv8alRnl1VrdALBU5TF8mB2KcSgwOg+g51ofoZ53aOOzOAE9gGf0/
         W8ZmSbyu5PC9IcR8isKHpJKUuoJ2MlUEUDje7QisM5EA2HuUBB+ujeU21nRZ4IQiFn8X
         KSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707754252; x=1708359052;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKExcD/PI3rdObcMLW7NUqLhtinMFG0WFr4nResNLx0=;
        b=HuSVtb/C7CRTX87GWmTSVxBGqTT9oDUk4PDFObl/fUk7+t6nOi4fP4SrxKW6NAhv1W
         Z/ghv+5uwze0PAadblouYeHpm1cEMz31x66Tshkm/LfyDaBFWRcpOJt/2KHiHph0m+9w
         HyxS7JQri+S1kExEiUWRXMCfsIWMR23HL9094aJgS+sZo9Dgf2WUbJZ5T5xV7mpVBdJ6
         FEIg/g29RZ7qo3zuGYoMBZXkEUlIcW6cQVHdqG9LH7h7MNg3UbZkRZ96asPsysl5FUj9
         bGJJfkn2jKyQ0A/FcWVcgdHLy0lnVqeeso38WnPumDyGkXSynsT4uC1newiW+kkK1bYA
         7abg==
X-Gm-Message-State: AOJu0Yzo+gkS+Msxp+O6frU2FVNZcCKCTnqIxdAhq/Hdl2JPRvXZytkZ
	3+7Ou8S0MdNndfOIKC0mW+i1rJSJ9ElSikceKxH7JZ6RuwwIGTZSGmScCGmuLb2BHP9Mrtwf0aS
	r
X-Google-Smtp-Source: AGHT+IHGqxFdfrcbySROaHj0hrrGYT+Lc5OyhLy7TCuRt6bZ1Izn7JG2+AwYm4qXi9myDuXfJJYXTA==
X-Received: by 2002:a17:906:6849:b0:a3c:c8de:7a66 with SMTP id a9-20020a170906684900b00a3cc8de7a66mr1490751ejs.13.1707754252058;
        Mon, 12 Feb 2024 08:10:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBtdkPPv+0QPCHKCu+w4p2h/5cEmKZkaya/ScmMAtK3pVVI9yaAGzxY1/Sir5yHLQhjMQTj6q47TWBFHrxqvVlMzdlC7NU6KzaO0BNF+iWrw+N+/BJfSIynKlD4fzWaLXNsjbO4rjkk+Gnfux6It0ZaALQZerQ2nnpvue+UASRDcLQSbpqAEna91xt0ThqpqlEDZM6nT0ROg1qia8o5PGFTJZ+p4E+usNBwusDIHFIaAhY994hsxsNlNu5h8KAelX6VaEsxbA34zSynnOWUlh/fhJWfUYDzAWF1wjitvkfi5epUc8WKHqkbMzDCuJ44teN+Gk/talCLPGP47XDjfyW
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906118700b00a3845a75eb7sm336246eja.189.2024.02.12.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:10:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v7 0/2] Get rid of some magic writes in drivers/clk/qcom
Date: Mon, 12 Feb 2024 17:10:45 +0100
Message-Id: <20240212-topic-clk_branch_en-v7-0-5b79eb7278b2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVDymUC/yWN0QrCMAxFf2Xk2cAMQqm/IjLaLHPBko1WRRj79
 wV9POdyuBs0qSoNrt0GVT7adDGHcOqA52QPQR2dgXq69HQmfC2rMnJ5Drkm43kQwxgmypElhRz
 By5ya4H/21t6luFyrTPr9Xd3u+34AABEET3oAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707754250; l=3032;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eyOTJutJI1wmLY7JN5BD4EoCMWpHkMKGwKJZTeOKvDA=;
 b=qSRv1EXLfRLPtimq13infRYGrPO6eLXx5oQBb4BFvtArxeRHkkGKy0/DHFm/+BmgoKITc2Y89
 h3oVDv0cxQvDGEdqfSrs/6ACGWsKs8KPB+Xyz6981j8OI3g9s0fJuPS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Changes in v7:
- Separate out this cleanup part from the RPM/IS_CRITICAL part of the
  original series
- Unwrap the regmap_update_bits call in patch 1 (Bjorn)
- Rebase (take x1e drivers into account in patch 2)

Extracted from:
https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: branch: Add a helper for setting the enable bit
      clk: qcom: Use qcom_branch_set_clk_en()

 drivers/clk/qcom/camcc-sc8280xp.c     |  6 ++----
 drivers/clk/qcom/camcc-sm8550.c       | 10 +++-------
 drivers/clk/qcom/camcc-x1e80100.c     |  4 ++--
 drivers/clk/qcom/clk-branch.h         |  6 ++++++
 drivers/clk/qcom/dispcc-qcm2290.c     |  4 ++--
 drivers/clk/qcom/dispcc-sc7280.c      |  7 ++-----
 drivers/clk/qcom/dispcc-sc8280xp.c    |  4 ++--
 drivers/clk/qcom/dispcc-sm6115.c      |  4 ++--
 drivers/clk/qcom/dispcc-sm8250.c      |  4 ++--
 drivers/clk/qcom/dispcc-sm8450.c      |  7 ++-----
 drivers/clk/qcom/dispcc-sm8550.c      |  7 ++-----
 drivers/clk/qcom/dispcc-sm8650.c      |  4 ++--
 drivers/clk/qcom/dispcc-x1e80100.c    |  4 ++--
 drivers/clk/qcom/gcc-sa8775p.c        | 25 ++++++++++---------------
 drivers/clk/qcom/gcc-sc7180.c         | 22 +++++++++-------------
 drivers/clk/qcom/gcc-sc7280.c         | 20 ++++++++------------
 drivers/clk/qcom/gcc-sc8180x.c        | 28 +++++++++++-----------------
 drivers/clk/qcom/gcc-sc8280xp.c       | 25 ++++++++++---------------
 drivers/clk/qcom/gcc-sdx55.c          | 12 ++++--------
 drivers/clk/qcom/gcc-sdx65.c          | 13 +++++--------
 drivers/clk/qcom/gcc-sdx75.c          | 10 +++-------
 drivers/clk/qcom/gcc-sm4450.c         | 28 +++++++++-------------------
 drivers/clk/qcom/gcc-sm6375.c         | 11 ++++-------
 drivers/clk/qcom/gcc-sm7150.c         | 23 +++++++++--------------
 drivers/clk/qcom/gcc-sm8250.c         | 19 +++++++------------
 drivers/clk/qcom/gcc-sm8350.c         | 20 ++++++++------------
 drivers/clk/qcom/gcc-sm8450.c         | 21 ++++++++-------------
 drivers/clk/qcom/gcc-sm8550.c         | 21 ++++++++-------------
 drivers/clk/qcom/gcc-sm8650.c         | 16 ++++++++--------
 drivers/clk/qcom/gcc-x1e80100.c       | 16 ++++++++--------
 drivers/clk/qcom/gpucc-sc7280.c       |  9 +++------
 drivers/clk/qcom/gpucc-sc8280xp.c     |  9 +++------
 drivers/clk/qcom/gpucc-sm8550.c       | 10 +++-------
 drivers/clk/qcom/gpucc-x1e80100.c     |  2 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c |  7 ++-----
 drivers/clk/qcom/videocc-sm8250.c     |  6 +++---
 drivers/clk/qcom/videocc-sm8350.c     | 10 +++-------
 drivers/clk/qcom/videocc-sm8450.c     | 13 ++++---------
 drivers/clk/qcom/videocc-sm8550.c     | 13 ++++---------
 39 files changed, 186 insertions(+), 294 deletions(-)
---
base-commit: ae00c445390b349e070a64dc62f08aa878db7248
change-id: 20240212-topic-clk_branch_en-97f2b9cea7b9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

