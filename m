Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9850121D008
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747055; cv=none; b=RlX6TqdaXfu4eNQ8JX30Hz6ueR4SDhf7vMB+kUXyXhRAbne6E7jNIUYxqlWR1ingzM0gshMX9nc9BbFuMeg92UUZo9nromP4RK7qiKA/mGBTNUCzOOEJILhIStOTp/iMITbYKh3ZT7wMOvndTOZRQC1kXfBNxaaPLoCbgu5ylsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747055; c=relaxed/simple;
	bh=2ItpBQPODjnIYSjwoQvA06FlkQRZbhoJv5RXLp+oLuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kot/cv88oXy2Qq0rom9xv/0UF4iGevPPM2P/7htGsK8+/cknkRrNSDMNCRyyHkSNhSAFT0cawjMiASSzQTXiU+6BOpHns0/7vZ8+DLMRVKFxauV90XlBzqLekQEluuu2fx+WgUNpI0TdSMnXZ4vS8UMaz+cWm7mXcAOMcNxf/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FufHW/pQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FufHW/pQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so217556a12.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747052; x=1734351852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GhPtI8wgOnDMaTV/aebDQBDsWOSAP4QkIO0/UH54kQ=;
        b=FufHW/pQUrV6WYzCyKuEDPZmvfI9Q7AAb3H/XHFhb6lSXL41DlcMWxgiBUNlU6mD5P
         vKLFJV5QSfNxT84CLxkLeChRMS3DDjvKtVMB3QgZSTnyU7cnhPpwwkE41ZovmXZkIhTh
         4To1QLWqqgv2e1611bFyWqjkHpkZkV47SIgeF1+9sFCx+91xwiN2/Oe4c07rhjn9DdPg
         i8fqFqx5Z92KmSY0SiqlF0YGlICvZ/JOagWufBUrYiVvVfDvThmCsAk1U6FllYIrNXK8
         aau/EeBnCKGqHVqTFrMAUbhie7LU/7W35rDakhi5jrbyQQHABYpNE8OprtaD5FNIEhsm
         IGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747052; x=1734351852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GhPtI8wgOnDMaTV/aebDQBDsWOSAP4QkIO0/UH54kQ=;
        b=hhJJzbwxmPW9ONGu2z/+KiwTdiEZPNTEYSsQx0RjvWeTaw0jbn2NM4xUHPbQV2k7MZ
         7qUejDsVdA0i5vVajULSwNIJdXkhdRnUJ8TgNUbjok+D8yWvXEtfqjVf4cSD6HN1Lf8w
         RZMzXHG9iBJa0aJ6NRS4mhENzoy8saKpYAtOirz8UoQ3UyWsJT1v17LbaB7nXD1z+nOn
         3eELxaqn+P9TkT5M7eRcr3hJ0ds2RSeYVRIFfaR9944Jv7ZKDYaBN3NqDL17eYg3AjGo
         9fkJWBqLF11/f5nhemBs2N8ERTpZpL+WA3oMNIg1zg+XTGry/9Zhm6HgQJuMPoeOODCE
         Iw7g==
X-Forwarded-Encrypted: i=1; AJvYcCUbJzFNRf13ZDb9kfnF+MGuBrMwsDuScV3JvjXwNfPS+7+kocbGvl9V+dxcLGYO1+uxelv5auRp2QM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5amqBk22GaS8lfn3m/iNXB/TQl0pPJcmU1sqDkioKiTz5a85J
	SF+YHREYHRHHEHhdv4YhDSaVI2DVCBbj/8VpPYt6ymgcXYiS6c2kkznIzzfZ61E=
X-Gm-Gg: ASbGncuWidGewyay0B0Wv1WDb+v91/hxcmGeWuHKCYMklf1PQSZIvWad5DsF5E5x0e5
	q6YjXGMjgabx17VMqDonzraRNCVq29gprCaDgc5XqxCFb8cd5VFDMTTQD4ibbJ+c6oTM4kLMmgT
	f5LQNPEgxcuaN98hKcyFzGTkX3vFRQmBTEkrQDa9WPEusBxg6H/LbVSz5ORMzb/YUylKWiACvQx
	6SnHUrULm2JYr8086gr4CF1TkN9qiOy/dDOyw7CqPUMiEXhFdgpGiOHUFVIvJj45g==
X-Google-Smtp-Source: AGHT+IHOTya6h+M4f2qaVjLOGQqZ6THQS3TTb1fVk2LGehqwscKKRp3o8NGiskXXumu0NDWCobOvLQ==
X-Received: by 2002:a17:907:3f24:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-aa69c29dd7emr15261366b.3.1733747051987;
        Mon, 09 Dec 2024 04:24:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm309925866b.159.2024.12.09.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:24:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 0/3] clk: qcom: simplify locking with guard()
Date: Mon, 09 Dec 2024 13:24:03 +0100
Message-Id: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPhVmcC/4WNvQ6CMBSFX4Xc2WvaSio4OcjqoKNh6J/QiC220
 mgI727DCzh+5+R8Z4ZogjURDsUMwSQbrXcZ6KYA1QvXGbQ6MzDCSlKxHarBCDeN2GM3iaAzP/C
 l/BOZ2HNOCJGy5JDnYzB3+1nVN7g01+Z8gjbnvY1vH77rY6Jr+1+eKBLklZQ1J1TVWh8H60TwW
 x86aJdl+QGBIKycyQAAAA==
X-Change-ID: 20240823-cleanup-h-guard-clk-qcom-2a766000bb46
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2ItpBQPODjnIYSjwoQvA06FlkQRZbhoJv5RXLp+oLuc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVuFnCVQSN2Xt7Diw10/bZEjtDrP5veCHDkbPR
 eHx1ZloLmSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bhZwAKCRDBN2bmhouD
 1zITD/4rAJjeVDGqDdJHuFMtCcZ4nTslkuTsYFzw2NFIjrL0hBVzs+l/xgH8BseAHD3ZdDuknGx
 k3Ha/RJOGmLYIHHuq8bynkElOex7ggmCHa+YaiDtXcCN9go+BLt8eMFZ5dyhD0yeV2K9+Zlmi3D
 qOnW9MkCDw5CEZ4qDJyFMBr43nSJEIOGUbJDz+6I2Yarddkc/3F3+jFo+P5tymXAPxxKddmSkFg
 XPlfwTo+x6AD3lxyvOVlppqCJArK+H68CenofZ2PdPkgCbLKRynGU+BflBRC0W1qC4mTiX4i7iL
 ahmCd6qwcpfM8Ld7MV4GcU+dkrIwhSYx4Vxq1CeB29d2BPr3WvfzBEca0JZ7vLcFarPLNoyrMZB
 wxCDZWSzBCzHO6CC4Qi7iv/LbYLm+M+F1v2/uMWrM6rDmsI3qpnQ5EU8EWMGootTdfz0lz38auG
 BoSi/EpKYtkAFwDeh6W+z5dmAjEH8pRLpLfkmJ59asbPF+tVoW0UEKCTvH4FOGHxpZ/Eft49liY
 DBMOxnymQFtVYp/rdT9d7VhcUtQFp2cX+t7O2NdxEEej3Qf8LJ1tY1NKFODqtUr3aPowRycDSqX
 cZNlG4jt538P1GZbtdh9dDItoXxW1cY015Xy1nSMCgo4K2OGGBaEvK4QPYWNydZZw3mIE8XaTCf
 LX9WGs8JMxnYhpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

No feedback, resending.
https://lore.kernel.org/r/20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org

Simplify error handling around locks with guard().  Less gotos needed.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      clk: qcom: rpm: simplify locking with guard()
      clk: qcom: smd-rpm: simplify locking with guard()
      clk: qcom: spmi-pmic-div: simplify locking with guard()

 drivers/clk/qcom/clk-rpm.c           | 27 +++++++++++----------------
 drivers/clk/qcom/clk-smd-rpm.c       | 25 ++++++++++---------------
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 3 files changed, 26 insertions(+), 39 deletions(-)
---
base-commit: 294c646feab33931bd459930fa28360f5e97c294
change-id: 20240823-cleanup-h-guard-clk-qcom-2a766000bb46

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

