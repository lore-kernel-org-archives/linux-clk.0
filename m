Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00341C94
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730424177; cv=none; b=OEI/wh+VY+BX8XfRO0Kll2H0w83kx5emIMZEaSw+La/hMOSwFqtJiAwdtRm2WBFZXfPglz5XSaLS2h2NugLe3ppTVU6tuWxiilqBH6VxtjAQe4INZi0y3v8CkK2hCEXFdDi99iN6fBGaXbdDkT8O5Y3qCMIPVQB1TVCnJERKxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730424177; c=relaxed/simple;
	bh=y3W0QlF0pHUhgxWrrr5HTFUY6Bau3zJlqfQaSdHHzJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgO5pWS2Q7+oR/Vw/sZwE91XOLhUIzlDrUi6fAbI+ebu4prF77HAxNWiokMFx/Hqpr8X5Rl4I2uBf7moSfl0E92Nv9HlpNBABmV0Z/cHmwnNH7r0KSR7OaE+ksCMg7hZqYIY+RlVm8vmfeuE2U09u3HqisI1pvdA3I5IYQbKfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BbF74Irk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BbF74Irk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314f38d274so16404765e9.1
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 18:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730424169; x=1731028969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4kry6m/4mklH5IfU4CmPkq9g/NGwiE8SJ27fMIJ2k=;
        b=BbF74IrkReJAHDw/0zZBwj8V17ANBg4V7puDhrKw7i3LaTQ0zasANVfFYNPvqyY7Dm
         86qmFC3qn6Z0NPKE+wsELDnvz+Cip3HzhT/9XXIYoXJ1cxEOf6Kluq0a+vW/oHCYS9Pj
         j1WwobR664sztxNx2uhKxfczJ1csVKyEx3/afYCxX0PQ1HLuIz7rhuOabwtNcpRMfDD2
         F6zbP5YvQ0pLgoRbMrWrGeACmkm13ENrfi2Uvd9HbWnfPg90a6pqZKSkvH/MOdl3akRW
         JLLXvWM70bU8Lumz9LqmQdLXsIh7YWF6dyAXkAJqd2V0ZmJTA/LjzAdOqnt5E095maJc
         IzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730424169; x=1731028969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn4kry6m/4mklH5IfU4CmPkq9g/NGwiE8SJ27fMIJ2k=;
        b=Y/vnoZyZyQ+CttvliDttJsbOxdm+eUwXAZ+VYMFZdy1NrojwNDegXBgIGlPIYt1hmN
         oWErhUnSfq4Mq8xbjyUUvQuzJX9IN3g0zpEqHDvpNqZUkejX3c9un2o+jxcQAoZ9J/Rn
         rX8bSwGgHYEAQb36A90rtDWlyrFK3Zg7sHMaBaIc/2wfxbYKB1zy0PNz/o3z5GzR8O0Z
         1bJ+Rg1+yZN7swU+7s1BexqM29cqPHoPtbKbpI8jZSClg96BF/+RX8ixBesfhM7Y/mE+
         Fkp0QsiPWO/UiSD3LSa8PA4RzQIYBcFyNtxiUfVysvxC67+abJrL+7JfEZsu3fA54KdP
         5pfg==
X-Forwarded-Encrypted: i=1; AJvYcCWy2/kzlmSUWWalSa0jP87OUe9S80rLmAj5nKidL90J/K8NcRENoPRJ0AdPCnH8+cPJ26CN6ohj7Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83vQStYAB1ee04ggqF0D8FpXJFw0uuXnaangX1hGpp1+NBFX3
	x3dhNesOMJHzpmv6TvImSo+DC3Xz/onav6M3wH2OVlEIKtKyYXttsjqyvZmAIU0=
X-Google-Smtp-Source: AGHT+IEd3p8ING9n6nUBlO8Ke9VQAg3GlSiKlwo36+DVc7pK/fktIh4uuK1JDCaWsyMf+QwtDc/8UA==
X-Received: by 2002:a05:600c:5121:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-43283295905mr16252715e9.32.1730424169610;
        Thu, 31 Oct 2024 18:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ad3fsm3501622f8f.95.2024.10.31.18.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:22:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v2 0/2] Qualcomm sm6115 LPASS clock controller
Date: Fri,  1 Nov 2024 01:22:45 +0000
Message-ID: <20241101012247.216825-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is one of the required dependencies for audio support on sm6115 and
its derivatives SoCs. This was written by Konrad Dybcio, however his linaro
email is already invalid. Konrad suggested sending it as-is and keeping
him in c/c. Some updates may be still required, for instance the
maintainers line in DT bindings file.

This was tested on QRB4210 (Qualcomm RB2 board). The only changes from my
side were fixing compilation errors and small changes in commit messages.

This is second attempt and v2 as suggested.

Changes in v2:
 -- added Reviewed-by tag to first patch;
 -- removed the second example as suggested by Krzysztof in the first patch;
 -- dropped patch "clk: qcom: reset: Increase max reset delay", the change
 already landed.

URL to initial series by Konrad:
https://lore.kernel.org/linux-clk/20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org/
URL to failed attempt to send it recently:
https://lore.kernel.org/linux-clk/20241017005800.1175419-1-alexey.klimov@linaro.org/

Konrad Dybcio (2):
  dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
  clk: qcom: Add SM6115 LPASSCC

 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 46 ++++++++++
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sm6115.c             | 85 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++
 5 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

-- 
2.45.2

