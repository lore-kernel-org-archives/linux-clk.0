Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C0413D8C
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542636; cv=none; b=V04TASYgYOK6/DUkNNPCVZToKy2IOJL13Uno3anfPA3/RyJ/GXhrij2NqivJmFVP+tl9bymcelnUYD2DnNtSi9sIrCKoTGHpjBacqCe8xs2xT/0lBAsAwF9Fm3sORp58RShX2v6+MHjyvtV7f36E0LMbw0pjgGNBTZW3TX8Dp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542636; c=relaxed/simple;
	bh=PCUXhod+G671w4vUvWFPXNpCLPlsoblTqqTprXc2Vkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krTkSr11eFXNVIeonXGJbS77AUrhdl6ZbtfD47OEjq50ssp6Bpf/HHgGyG7zYaMxiaaws5Dv6itOY0RW/urygxn1gWqIbsOFrGfFZthJY6IVvjfcmbD1aO/hCAwKDu4Du2AMg3OhgYg+VwsR70sdlW0NHD1iYNNcS57JR8Q83tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HcHbnnNE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HcHbnnNE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so28357185e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542634; x=1782147434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKlRW1qlXgDZgdi+0feudhAKynCZkmS9W38oGOlcoOI=;
        b=HcHbnnNEXK94JfyTX5C35PLTc4HN9/tNtpNyn/6CyWMSJCXjItpvjF4S+StNAxUewi
         gJsaTHX0sNXPs4B9DgLtOZqhkyt3Z6/qbwJAkSpn+W2ddlxuO3WqptF7tUHqn2E78x3E
         t8fW2qV5WwKJpKO3K3JQ5UGSpvTpm5NZOnPEYJpKx1ahHClhhhaZR/IDIg6ioKDC8+nm
         RiajWa4S5ZKYKGxSpeizgR+jV8nmBjB6XhzlFrGveDOeNKF0NAAwAmQQDPp9Y1rxuSTo
         rB24R1HLn6fclTo8cZKKTiYuWldD1wNgn0TOV7WQ7b5vO8e1L2sjdgVkGN+WpNWmJCpN
         QR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542634; x=1782147434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKlRW1qlXgDZgdi+0feudhAKynCZkmS9W38oGOlcoOI=;
        b=qqzfVEOo39OD8nLEvUUyDg9+kKQ3VHCG6Y+aYjWW+DwPaaD+ZWk9jKjxKmayN+y+ff
         7/+jD19twO8q1Ra7Mst/wxN0wWtAmmBdRi1kVzoyguCyXSD0wh54pdYh9qLW29LqYkRE
         BuH9Nkgw+JIl1fs4amsTk49WEHZDj+d0lv9yCgbV+Ev+3J3gThojECC3rRwfj2LEdaV7
         0gdLIISDXeJtWELY/dt4Lwwr+GfiMjmsLO7ehn933qubhKg1onXRoE5qJKcqgmMnI8aI
         G18EWgB2/4F8L24sSa/+t0EBHS5T+YEYzNfWnn2EK853dDqNNLYL8Rx6J4WtN55IUANU
         P8Rg==
X-Forwarded-Encrypted: i=1; AFNElJ9FWaLHD11QrdQAmOgwUM7cYJHIBWbGIUlO3xHpbzh5bQPed63fjdHPEGCUtWwMwL3rIJ1+QMN4uJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqdUqA2SLdT+0coeuvD/LAQeRkeTATP6HP8NvGpNm0zgjow9w
	mFz8xkA4JRU61jYE2NIDOpCCn1QtdWM4PYozVuAGtVdG3OWu/4oqwMN51sL8VVDnMzE=
X-Gm-Gg: Acq92OE67zkO3oJEqJz7gEF47y7H1CvwUatab+lAO8MxEFg/kMHqyCAllW8yS237i81
	lyuZjIx3xoVIaQKS65niGG7zDcIjj7wFmW87U/GkuLNd4Be0Tahkq4VcGx71wKOP6c45hQOajVx
	S9wlzp8N/88pxc8Qq6ml0mVc+h4PNDxawoRCAqQ4zU71NzJa9QMZOy5EX7oZ0wT2iFQT91yQ3/1
	CXGrzwe3XX8qKE84LxdEaK3tT+Me+eIOOJKx/6IcIrf/kBoXwLSBkQVpmcWWCQMzgmvimsvBZb+
	d1uyP7knv/ew2P92Ii/tvJda3a7uCuiyESGa26xLN/b5lwrdKZeUPgU0/hNxHRTTmkpSDq30Hkv
	wWFeuvBOzMOiC7FdvDB0N9cW/cv9yshU0rMGMiN4t6e1qNRTPSqWMD8QG8uEklxYRFz79tdLslu
	5W6RHfXBrrEh07FxKcHcKSgOZmyKY0BxcvZ2fs7hclVKyE
X-Received: by 2002:a05:600c:1392:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-4922ff8f4e5mr321065e9.8.1781542633569;
        Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:06 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8550: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-5-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PCUXhod+G671w4vUvWFPXNpCLPlsoblTqqTprXc2Vkw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7i4+nuxTiSlWuoxId+PwSbeQd9NP3UQAexdLt6
 z/bMD1KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4gAKCRB33NvayMhJ0SxdD/
 9areyZ0bJsyGJXkq/cgj0jyfNVuuPFhUeAPqdIFBdpUTIONT3roVsj6XShy7wdsb++WpSGal+x2Hlb
 nJuTOPcYINi7BEt1chiuUl3CrWF0O3y3Jki65TDElJQ0G0CRjf2qeN+R2SleMohKk9BZa4OrayiVHb
 bNW+l3YDUBjcJLVfO88wIeI4FlR3kA+iByQ9yqXw9ce2Cr9+BIR3POJLGIl5elZRKvFXc6MHPx1NHa
 DazoKngSrXzgXRJViucKv1EkPImLEO8d9j1p9FMT66DyuCuKvHV9sYfcdSDf4YmYlyjUYqcZWso7Z9
 TmcqJTxrFy4GWpNbyg7ZHfaiOPWc6F89SdmquiY04DWGFPngtN313SuTr7dqxQ+OW/+UIbXb7SPaTN
 UcG/MEFts1yMz3ZKm2x2gW0sYgjrcOrfgx4dhUV+JAMbCEIf2ye1TT2tElrz+8eOelT1xFPMVzNy33
 bkjOkbWmStUZVE+y5yPyNoNjZ7LcxaS/Ojh/RZrOwjQiqavEeam5xJJc6ybhu+vJ6+j+aXQrDJCLvY
 o1C/HupigiYdZQoiop7BXXWeP+O8mrlauHD0p616/xwp4UkIJNxLG6qkG91uwYXeh45OICXzgkjafl
 XYxzI1/s04k1aZ8ilHHwDBC36aUNbtUUkUtrFOEG0NyK67r6NxPV1OLG9B7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 396201905ef2..2cadcaae9e01 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1183,6 +1183,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sm8550-gcc";
 			reg = <0 0x00100000 0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

