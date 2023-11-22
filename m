Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8uEAIlM"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46923D4A
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 05:42:20 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9fd0059a967so169449766b.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 05:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700660539; x=1701265339; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fdn6CPD0LA3swDmQEp9eVXBCvDauP/1IlEvd50qAFY=;
        b=b8uEAIlMdTBB6fVXRRefzdUdEC+ESLJ34KqRdDx0eZ/pKKlo0StN5UdfFE/DIoFAxB
         zYis/CVNUEzxsaZ62CAytC8CTPOzgmhc1HPpRdTCCkhk/WGM37ltD2hLRZz7H2gMJvXL
         OPdqnI346Irm5OSnlfEKRckd1T0YiAczhlEPcIvwiCY/0hJp/swzG4DdQ6R/wxxY26Vi
         992O4uUp1jh8yGwX/SwcwD0OoA6NV/R3NmWZ3AD7+6BUgdLEJUldI8HqcJifU9bf5f8b
         HArFNWuzLhP4FFeXku1S0EY8FcaZjJ3SVMrp4iRUTEyi0Cr+Bwf58xFYfaardFwuNEHg
         7KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660539; x=1701265339;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fdn6CPD0LA3swDmQEp9eVXBCvDauP/1IlEvd50qAFY=;
        b=eX+acR5ZeCG/a0kZY1Zst88lk6LbUvWnpfArFDy3x2xDICw8uJj4aVA6icLutRD5d8
         NTAJ9cnvSB1RcXQQwLFf/cfRbz0DjJlh9KqprUquM6GbSMRrzxwaMpn2/4Pz6Bm5VDvv
         8UCURFLxGpvWIMPt/gh3f2UhLgJaQixS4AXmuvjpHOYiagmiSyoZ8EfdLZ2MnSpHool1
         kxagtxvjv0kSLa+vM32QvnGT/hxn62mbd1aWJUD4XFTNtLDdYRUxm6ijv7AllI1wnO2/
         WS3iRPK1nc2672L8tAUrvrCjKVPZ0fwBmIZA84xxURl8OQaap3XgF1FWLYTu3ndzWCCH
         3HHQ==
X-Gm-Message-State: AOJu0YxPjsKVlDroYDEHgDLzo8lClvODJh9x6ZKOtLanxNZzaOYhd9CU
	QsWY9Og9eSM1IPhyrOnD4z9ExA==
X-Google-Smtp-Source: AGHT+IH/s3X/fn5j+aKFt/t/P56qouWZFUbacwaPrkXlao2VGK7sVg5Lr/4rxdaa+R/XOOHMJJyD/Q==
X-Received: by 2002:a17:906:d152:b0:a01:d701:2f1d with SMTP id br18-20020a170906d15200b00a01d7012f1dmr1696001ejb.14.1700660538742;
        Wed, 22 Nov 2023 05:42:18 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906190100b009a19701e7b5sm6676797eje.96.2023.11.22.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:42:18 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] clk: qcom: Add TCSR clock controller support for
 X1E80100
Date: Wed, 22 Nov 2023 15:42:11 +0200
Message-Id: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQFXmUC/x2N2wrCMAxAf2Xk2UBSB15+RXxos9QFS5V0ymDs3
 y0+ngOHs0FTN21wHTZw/VqzV+3AhwFkjvWhaFNnCBSOzCHgynomJkIpT1ykuQjmMaUTZeaLBOh
 lik0xeawy97Z+Suny7Zpt/a9u933/AWXhSGF6AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dL3+krPTgLJmS3n9AGxxmwpSLou+Rw2ZG0JZlwn4lSo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXgU119ErV5hpFTqR5JzG0OQYYflfEg/Am96Ru
 oibQ4en6ESJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV4FNQAKCRAbX0TJAJUV
 VoVUD/9r6YJy685+ZQPZJtQdn5G4kshAGAtgy+pyeoIKoNVTKgbanGxxum60TEWYOy0Dcq99cE5
 q7GWPImAFgKW4H23AqP3j6Jl8aN2eQot0zQgyNtDoNfbW9g8iF7amK/yIyRrbZpEAcHOobcQmOM
 KkDZGjzU4HKqBOxxsocWcctbn3uXHQsn/NcHvKH0P3Pw+ZUMNkzFw1UlxWkFEkT9fR9E2quQOCr
 bBT0esfuGglRpz3a3aAIx2NTLGRJcdps77gmnpcDzkA9kivs3ht82Aj93EgNu4p0OiDGxBQGcnP
 prXv/V5o/spgSzICLepwHFNmYdKH0i/PacvUHYJ7RKvItdBSQhSwkJb9bw1mrAz5+Ox/y+JrbKg
 6xEr3usr3b2WAaKFYRG7vlVqRXHZ6QYL3Ubj86aAO+zd2W2sR8GLgf7hWQnuCXtJbzepRspFUIL
 QiataS3kdG0ci2X9SVH/8NY2B4RjqVAbcT3I+dZIV1VgVDaIffLPSIstgyWQ8sAAN9sFUJSmL1z
 vwC3598nZQUjLbfMR35G5eU2TIA3h74icXctu5pyaoqIoX00eLPhO9gWJ8+RdteOhugFF4xX7W+
 5FpJv6cgQ19UDUXzlOC07PDPtqTHeRZ9Or5xMuCJd6F58Cxrh3bwCrDQp4Id2ERZdZ8Gn0EQoEO
 BfCWjFF3lz4NJLQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for the TCSR clock controller for the new
Qualcomm X1E80100 platform along with the bindings.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: clock: qcom: Document the X1E80100 TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for x1e80100

 .../bindings/clock/qcom,x1e80100-tcsr.yaml         |  55 ++++
 drivers/clk/qcom/Kconfig                           |   8 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 295 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     |  23 ++
 5 files changed, 382 insertions(+)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231122-x1e80100-clk-tcsrcc-f4bb70f119c2

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

