Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTV2rMZs"
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6351BC3
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:52 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54b0073d50fso171974a12.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284390; x=1701889190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HenhY2pL5lYSQm0WezKfdotYd53Dd8BD9hscXNx1qNI=;
        b=ZTV2rMZsDJMtP9QDRUPVjix6nhubDrEibKRHcYwCXqECVbIUSHbiPaFSWEbvlLkNfm
         meDhgm1NfVN4t+9U8PjUVlS7e8raIw2PRHXp/XmAqYhApcod50xSH/4yensthb+fwEd9
         ZLAwQKvjoNHRVcfOeuHNxQzXxp/SCQrt3oBFvggQlVi/F8jLiziiiNdOplsEc+M9LNqU
         DbTu1rOgC5oAD/t4NSjdizx1D0hmKTwi3TSGoQziVm6/xRjQffCy78NkhUCjKlv9bUFX
         0xxJTBzRK3ImiUKU0tcWBuS/HYr62pshCSfAKD9JuhXqKEdBp4DrwKWmMrZSJ61bqrJK
         bsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284390; x=1701889190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HenhY2pL5lYSQm0WezKfdotYd53Dd8BD9hscXNx1qNI=;
        b=LADkiPz4Ns3wRellBxDsdhU07GdRTQE+sz9YZDbdkamZdhAHBMsls/yCzrpI2mfN99
         JHlxVgGiZwgtZZgjh76GxcIen2d5zsXOzqGOMgXFy1cKJc+LAaOziKxpIc/XO1sNOcia
         7d6ocZ+HFrRh7xijjDarexitYohbmqZWKCxUYw4nMu8/G5APkQFtDEayz5J0c/mc1757
         6zUHhJKkyX9gPjvm9rdsILdP6cgr+1QcwgAeyx2moJRP/yGii3+QMR5RxC/7Gj9VnBXq
         ThPXiqRnVpjwDN7y8F8eezmzOFWyPOJ2GvGEm8dYZZf4meSVTlUTwfZ28O9LysCg/5BQ
         WLQA==
X-Gm-Message-State: AOJu0Yy38jx31gzDBtSuQJ5GLkWc/I5NIeqSb6GriABvc2FZGLxxLvQP
	iOP55CdxSxBt2dw4icWbT2IhQw==
X-Google-Smtp-Source: AGHT+IF+DV+tK65bZXghJs2OH5MWJD9dz3lAPr2HHv7FvC3DfIIbqR+nOBhl4Jaj9yb3VRf4UFqgQQ==
X-Received: by 2002:a17:906:6a05:b0:9e6:2dcf:e11e with SMTP id qw5-20020a1709066a0500b009e62dcfe11emr16754012ejc.5.1701284389903;
        Wed, 29 Nov 2023 10:59:49 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:49 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:32 +0100
Subject: [PATCH v2 13/15] arm64: dts: qcom: qcm2290: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-13-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=764;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fJldxbybZb58TCYQstSH4l7dt65IqWW9Bm2ku/RGmU0=;
 b=yoWbXtsY3z0k5FyIZ6sWSid7XEhBNGO2jZpAW8kbsVWmi5NMnAgSHR+VhPsF4LIrTOVpV0kf4
 TFROdF3mBxRCVp17LHuuZiYi5RZU7sKxBmh+Z0ms8z7ObIpNE5WiKkd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index d46e591e72b5..a3191e3548c1 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -622,6 +622,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd QCM2290_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0

