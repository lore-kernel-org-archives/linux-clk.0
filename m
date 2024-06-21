Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD371E531
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978506; cv=none; b=ICZ4YWxuH5Rk9KubMVGPr9xR1mgvbJQagyV5Bw0tAVt4FgcMCpQAV+S3bdcf+aZCigaMN+v0xLAQCxkeAqI/6Y0MSvMSzUuIQ9bONOH7QlOPhyxD5drWQS2ZYjm13sz1I+NGL38lKMGTW8iUJc74JuPRBtomcqKV4Va3CD75ZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978506; c=relaxed/simple;
	bh=oGrmc0XB9LSJarsVOjFyX4XSnECK5zhHeu982vZU8Rg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FhB1VxkZVhuiwdDbzg1PqrgjpH4C7Dx22WoZL5GcWYNiCrMbS2wEK4x800LZyykFMhd4B8zyhcibi+SxeDzguIuzauXSrplAM/mYueQQoWSz9F3Zu/c3csAEKsis0XZGfA9gsVQgBUQWMPsROE8/JknhDu69oDQjcJ3BH/aJQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTyOQgKk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTyOQgKk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-362bc731810so1874546f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978503; x=1719583303; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL8PbmWAvJC3BUdKXzXJ1QtZ8bojOGv8Qiv+2xzYpbY=;
        b=JTyOQgKkzleH5pJnhfLAN2/FuSwMUjzcd5E3lUg1c+Q+MD+HwiZ6mzFG7RJuaeEDDU
         r4qOcCipRy8wKKwrQ8lFdEtAa96Xxkire1vuy9bgkVwiTf6PWNNuzkSJyhidW+0hPNGR
         pL/P4Jszjs+sizhjhXiLTHyssU+3vUq+nB9/IXkdAwFxV0Y8tUDRWqMIWU+mhw6ydVL0
         4M/BqVr6lX2tSbQ/STNPBBvvJjetLIVGU0e3Xk3saupTTKJHUy3qf/qgqr+HWlOx3FYN
         prVyimiE77cwTXYnjqUG3XFB9c4D371e4GBktGSASxI0l45FMz+ue5ABTcNitKE7fP2a
         oLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978503; x=1719583303;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uL8PbmWAvJC3BUdKXzXJ1QtZ8bojOGv8Qiv+2xzYpbY=;
        b=ocA0g4iS+LcqMwdNySDFoUaX5TmujJ2nngsUmiXKKmEEZMHMg/LX/N8+QHLO+WAe7Y
         loz6gn0pPhblE7H65Gk4o95/CHaYhCgTHyY+obpmg7IzDMAF2z5D5ZaNFKzf0+dTNHIg
         1N6vZlmCvntwccs/GEg132MsmVm9rlWlRxPI1J4DRjjqScG0aPdkCJ9orcQs7nhh0YtP
         JefwS9i3y0e2gs1ZaZZM022V97hIjicROAfGDhY30Ut49xCQvjgVzCK4OdYbFC7HmVT1
         iduVGE+E8HH3kRn2EWK0qydgGUdvD6619F2sZqo3bv1gsBsTwPpfngDJhtjmSBxCC+MP
         xMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUImWulB+a6bSDaPrudQirhEZHuwIsmvmg9UrkrF7x6GxO9KzfHfeM7QmITQ9YMQKQccHrfg8L/WYb9mP7JZYDkvbm3XKZDb+9U
X-Gm-Message-State: AOJu0YxCTUQy1iL313Mg1AI/pPv5ZYAJYY59zkm4QhVwZtCr+bUoYXo9
	Qw+YnHBoQRmKQ+Ah6s2uPuyoVVwTrRzpBDw4UBJ7IFSvVnmBJjQCoHY3YCwJME0=
X-Google-Smtp-Source: AGHT+IEJrqGDwa2OlfhmVSAfQya1PPREv+/S9OIEfl4/7iR6WmOoLA/VUw3tvDhd/S2o9awQlxYEDg==
X-Received: by 2002:adf:e9c7:0:b0:35f:2fa7:ef13 with SMTP id ffacd0b85a97d-363192d0013mr7220533f8f.44.1718978502302;
        Fri, 21 Jun 2024 07:01:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] clk: qcom: dispcc-sm8650: round of fixes
Date: Fri, 21 Jun 2024 16:01:13 +0200
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmHdWYC/x2NQQqDMBAAvyJ77sImatB+pfQQ1q3dQzRktQji3
 w09DgMzJ5gUFYNnc0KRn5quSwX3aIC/cZkFdaoMnnxHwTvc1qyMlobQE+7ZtiIx4UcPnNQyM0Y
 3jh21AxO1UDO5SLX/xet9XTcxdcQKcgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oGrmc0XB9LSJarsVOjFyX4XSnECK5zhHeu982vZU8Rg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfCP2mmg4BxVFrMGBj86AhvwcJxtldPwyM8Fltz
 k/Aa+ayJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHwgAKCRB33NvayMhJ0WpGEA
 CtHFhw8I7K0B31nnLcPfz+FB+tq9D6Cr0KbUY9XKQPy4drz73GDQ0QKBoLqPhN/h9ugiHo3YENaFrq
 F2HBDVI8hhrDO6CaVt+b4/yu4+Q7BZo70A8q6zY0OKeCXsX+xhLSF5lnU8OQhPcNx/ofSq6yV/cP+l
 LD8Kb9QXq2xqG6EKwXzxGdud4SmDrHSNr5XyHgxTO1aCqg8X+nVrLPMfA81tswQc9ZbyR1WTDCMf5V
 flVgVG6e/gMrqm521ijJyGArSrYfleVveFoxwMZ1zXKKb1wtQpBCucq2E+xAOambB/FL0yp3FyiqER
 WuoVRdnpRQoluZTJ8k9q1Jo/ieWw0MhF9LXYgdv3zvpRW5Xuu2reINkDNc2r7ACZcXMEpN8fRM4vS6
 WJPPcYpAsnr6pcpxU9ALZvfOLC2inu3QoLK2Os8h7tj54OIYaArRI1tuqrrd1IGw8VGv9q3rOTn359
 WJ/wLCbz+KMvBu9NgVrhwq/ra97n30lGY4Mhu+ssBA/96700ioKZVsY5Z37oBDU6MvBYLKbV1ShSn7
 4BAKMNXlViOD4DduT/M2H/rhnKYgIjRDwG6KzngaJwjtyrcYA75djo7DgxFc8/mukstmAY+j/L5ajT
 0dQzdK4FhFtZz1jSA+eocK1kTRwVXHC1wttsk169OhmC9QbpRWUblEYJInsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While trying to fix a crash when display is started late in the
boot process, I ran on multiple issues with the DISPCC clock
definitions that needed some fixups.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      clk: qcom: dispcc-sm8650: Park RCG's clk source at XO during disable
      clk: qcom: dispcc-sm8650: use correct clk ops for dptx1_aux_clk_src
      clk: qcom: dispcc-sm8650: drop TCXO from table when using rcg2_shared_ops
      clk: qcom: dispcc-sm8650: add missing CLK_SET_RATE_PARENT flag
      clk: qcom: dispcc-sm8650: Update the GDSC wait_val fields and flags

 drivers/clk/qcom/dispcc-sm8650.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)
---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240621-topic-sm8650-upstream-fix-dispcc-a1994038c003

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

