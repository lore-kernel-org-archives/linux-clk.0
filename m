Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22241A8412
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553147; cv=none; b=egzeqzJh7UuL3P3T/saGdWaO3hntx/u9JYVeY6jmsxTk6mFq4/8SbaZQjmnjjd1trtRDSThRTObZAYEG8HGRppg2+36LPT85Kr7bYXmtP10UFm+1VrPbyfAQXITrfshiLjQg7NIjLQlZYr4QmHVvD6xXfm2I++JIK2eP7yPPD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553147; c=relaxed/simple;
	bh=jRIu0W1JuXkE/BIb2o38vY5micOCt0sjxd4/0huHplY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nkzvT0aNwhRUe+2sERj8UrWGaSvs5meNfbsbL/NQ/ooUpAZyhWkoEBKoky+Z+KhiG4aSLU18PYJop7F60cQdafrn8bphg/Lxd++qY+N3krCQfO/P/gHAjy7KErLM0lmf1v/rN/ofc4TnZtkHznJZIdunh2XIpQkGVo3wcz1MKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEQFzSJE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEQFzSJE"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-337e43f9c20so380591fa.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553143; x=1758157943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+o6r5L1XUbiBxCB1fojD2F0CMjkyCBE1OL+/oMjXBI=;
        b=iEQFzSJEKMepG3aAUbfnunbfMFi2C1grULp4zUadbSAtbRctsjKyPLcycwXlSU/j1v
         PgPk1yuGDEzMNrli6Zr1AwzQvpWF6S+UUHdpaH+w4GRi1uQMcs0WMdE6V3rE2LIlOpWW
         NVQB7IMRgtFd7yvHhdd7vUHkkizWDA20LIteUJ/Def6B90ktLlXYCteqdsUSq/Vuf4eo
         y9Nmp327zX2XaXT9i2e/fvBh+OWN/DjkyOXDpNH4msuAZXvhR2IgCXgYjQ96uSV2Ry3j
         bSKEVbxBG9+VimS9rzma0j+YrowpIssOwdpTuyOUq+F6iMiIdoR7mmLvvzfw/1N5KtqG
         HSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553143; x=1758157943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+o6r5L1XUbiBxCB1fojD2F0CMjkyCBE1OL+/oMjXBI=;
        b=GVw4hU4nUYdu/7Q2WVG7yVQIX4K5HDHR/mwxLs433nhLXEo9Ovd0EPaN6Sy1Tz27qo
         sIHUpqbKwA/poKl3mR27Ft7ifADQOkFv/Id5coOLhpi3NBQbcqI/Xw6H9ln6F1IvHoZo
         7nNfvVaf1o7uXf9+RKC2yyjmzJ8kFHU6zUFSA9hNUmZfOHdmA+ri0n5CjagAzZiHcEOi
         nlEj44AznRU2HECTYyrmniJKi8+PXYKi2DcC99ggAdvhi1gxtd3CXgsFM66kPgUXht0v
         UXPMQtDWHsSioC0QR+tNNH9M3SGdknZ06npMwW++XeOvNMBO3OKTeqr1q4ZyhbnQ60ms
         ZrJg==
X-Forwarded-Encrypted: i=1; AJvYcCXZywOlKEqweR/0q/Zh9PQRi0H1wpbrIdtvV3u5GerIODIh00PZnpQILtq6kwOP04gs1XNNS46sLjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsw7c9HrFfapdi2CYZ4KkH64FJglKquRnf0f8DgFfoLfg9gRXh
	8qVioPO3nqHC24rO8y8ipYkiww3BBrRjQd6U2WmkS98eXCxX4ZlVidlIkKH4qSGJ33f8CbUspMK
	9HuNt
X-Gm-Gg: ASbGncv5dSINNZ5zIG83/duUnumzO+jA74ZO7ERGPRTmEKHgSyRbu+2BQTJRKHLDPUC
	aq35r5WnH639cLa4PpwCvNDEZoddJZXbBG/4Hhq9BiH4SRCUdtu6vQ7+kIxJqW+xmAqHKudhKsr
	C3WYzYZZGRuqklSlocTMD5eYBrBIvvswll4TnFpuQV41odfmuBDU5AK8TACRi+PgCpwYRWVydmL
	PofNpHQtjpn/vY0cQR9+ZbhwB/k2uFp+j29QodOb0W6GeSaiQYnIiY6YXRo+T1AHWPwD/106Hjy
	SeKvATN/xW6V2GC5v9NqYlH7SvzDlXFCvfO7TWFGFN6Mkpq9jeRFxZp+TAbfnGP2mJPZvPwh3P4
	1LlUUPy8I//6xpCRM06SWba8d3xKV+hMmDqdpYnGgb+VmdbelYcyU5LTBR20GLizwefY6ufjJSd
	F316ecbg==
X-Google-Smtp-Source: AGHT+IFVdqTcDiCzur0w1bVAWzy/bLKra6iG62K6s8w3CEbwZmYv0G51c/W/3EcnWcWyujF0k+gzZg==
X-Received: by 2002:a05:6512:3a96:b0:55f:7066:ce87 with SMTP id 2adb3069b0e04-5626058cd0dmr3089123e87.1.1757553142729;
        Wed, 10 Sep 2025 18:12:22 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:12 +0300
Message-ID: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the Qualcomm camera clock controller to enforce a correct
sequence of enabling and disabling power domains by the consumers.

Only two Fixes tags are given, because so far there is no any consumers
of IPEx, BPS or SBI GDSC power domains, however the changes of making
an explicit PD hierarchy with Titan on the top will be helpful in future.

Vladimir Zapolskiy (6):
  clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
  clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
  clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI

 drivers/clk/qcom/camcc-sdm845.c |  3 +++
 drivers/clk/qcom/camcc-sm6350.c |  7 +++++++
 drivers/clk/qcom/camcc-sm7150.c |  3 +++
 drivers/clk/qcom/camcc-sm8250.c |  3 +++
 drivers/clk/qcom/camcc-sm8450.c |  3 +++
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 6 files changed, 29 insertions(+)

-- 
2.49.0

