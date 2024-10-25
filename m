Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CC20BB39
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868646; cv=none; b=J7t7CIvxwL2oi4+grjXD8Q8XRy7UayT1z/Jl5f3LCRZnf5UvIJjXooAF1ad4LEfbTnA9dsbfNCqFwW+jmm/PaPy3RQ98E1TV2Bkm1fSkP1RCMNWHUYTcVxVSjFXZ3tbGLQJ19BCvKz1r7sCxweVS6XU2Dt0fFsy16bxV3lZrot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868646; c=relaxed/simple;
	bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+NrTIrXkTPweUiE25etD9NgSygsntMQ9GFw0dj48mNgRoOMlfbgMj3f5kc+giWQCtlChXhfbiECBhwBMaeYNfvqS8c8+Wy5qlE5aCjeRUVTT8tP5aGmJCnI8A2IJHSnm/IjRvqCfrVIsypcJUiV667XX/UmJChKyN6kH28dFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvBUHz3f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvBUHz3f"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so3027167e87.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868642; x=1730473442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=RvBUHz3fjIK8uin38Zh0dDgIkbG4BBNFViWxn7EQqrfRbVhutFLSoewvieblVAPwrz
         Ex4Cvn+VgFd8v9blwIYtibJbY+2Da2yA1TIjTBgSUhvHQSTMjCN3EYVKP61SwuTb5Zcj
         fwimA8JrfOqRnEyALF2WND6MRozCYa7EpYBonupzAjWRfA45379eMdpXaoH6hpf5RVxl
         qIXHvzl4Y/R4cM7L6d8uPoDjN6JwZWQGb+IaPjgQXIg0PkH1TUZ3TMWua+5z0zeHSKoJ
         qIUZ0xe2i8yuSlhsg9IwNI7rXV6Q2A9r5ffcx10Bz4lGGccBDPkoc1zv+rf+MVGg0Vrt
         GC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868642; x=1730473442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=lz9nmdZxUpFHgaipROZBd59bZ3SqXmtx8hGGuNk9uNIrhuF2hhtXFebx2LBJkJ8ujo
         nWuEzAds1d6TPFE/Ikvy1kwWLfDtTCMX9KQsZssIxKiG6zOJv0RDNx6Ef0RokU7oXyND
         xQ90ybScdXGglFsr0QH0VuZrfG8AvlNMCJaJgO21fEmysxBGAx8p3ut/18yMrAG89bdu
         XjyPGulS55fBDTzMM3OkqvMF7cW3c8Ra4jz1TEiq/QvOvMmMrAdrQBXTAv5q2ZX2m2lo
         0NRTs8tL4M4ZCLgW7Np45546JA2zJUn8c2KuW1R53wLs8iqBtL3vqvBBig9nNOwxMWjh
         0T6w==
X-Forwarded-Encrypted: i=1; AJvYcCUK5OONB7mHx76/UJl8U2WuoeVrKQ8Kf9W+yXR4H7+P8m3dUq0vC2PP7RvVAeKE+3SeDeNfsZbjQhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7WrvhGuiSYJsqLA1FwNmLmoTjJVReXlk/VHTUPZlEHSysBIsK
	7Rnto69p+h69JcFlIUg2OpsYoQ82frealeO48cZSb3nxtQVlBBvNazqYBJzZS8k=
X-Google-Smtp-Source: AGHT+IECfUMNuij0OEb/viOuZg2ykGWBGYRB+L3RTyUW9yp9zGDcfJayS9bbOjvKw02U8IhZ8RCCuQ==
X-Received: by 2002:a05:6512:6c3:b0:539:e279:b3da with SMTP id 2adb3069b0e04-53b23df5806mr3956862e87.18.1729868641818;
        Fri, 25 Oct 2024 08:04:01 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:04:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:38 +0300
Subject: [PATCH v3 04/11] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-4-48f1842fd156@linaro.org>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
In-Reply-To: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NT8z9plW8KBjZXRmqz4/Zirb2WORwUh6Elq
 whtvHvwDa2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUwAKCRAU23LtvoBl
 uO6ID/0a+ucu8G9rRD/BvzGvMMamQmTfEZo6qDwDWU3+a+OZGpDwtCMrMYB+/D/Hu8GNFmCEBFl
 1OGOfR2VnHKO4UVVuLRAFIatum8YkT1vLjRk6iN6r+ci2plZx5KkenZsAHQXBrNgeThWDC+kClJ
 oibti16QVR8itcQTq1AxflFr67NHj2WackmXS4/2gTs0l+fcBJ8vkGT2UY5re0bbjdCg29x/UuH
 8n7MgnaTP52hKM7N8uBqR8trcerBbt8KW3ZN67jfsRUSKG08v7J3sxUuaEw0QCh2YERaCVVQqah
 tsY0XGGFGWU6W/1LhBLQLXph5qIOcvuqKYXg1T2as14PWm9NBIhJuhgNvyAY0mJIqvTqg25IdsT
 yI+R5+YQaQAzW/SkxINMdTRNBPd14+Fajz4kMFKyJzanbVPo3/Z13FKAcLWGj1BnrVhgJVgQyuB
 jak8teNq0RZrJVf0wuDwbvAynf4khf1Fs+3/gwM1aOp+9eGohIEGmsTlS2g1ItfdYAkl7uxOqtO
 j7hWJAQCFej9mMLGFtPEyF1pudMEDZzDvKOSUCbTCSJDwirFVLmJo049JpmLwl3jEySZmdRY54i
 GGAArelXcBcm4PIUD6oJALqnZpg1iOsYNBl/3ecNOju5WR/aittVdLeej8GbMhXxO/6jdydt866
 wDjvLKaEXoIWrLw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c17035a180dbf3dde715a281bc54165122739618..c57d55a9293c214c4c101902cdd9603074e2243d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -22,6 +22,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
       - qcom,x1e80100-dispcc

-- 
2.39.5

