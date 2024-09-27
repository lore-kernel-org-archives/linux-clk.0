Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CD18005B
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433141; cv=none; b=WYPO7ciTNGmHtsQxmT+In7SPwbkpSiXy/JFSRTaKEYhjDiRpGOm11B9Xxm2KA4l6FfWbXzhx19XxGjFs1W2u9EA91/cYJypC6FS+zUixjj0An39KDc1anVIMXV7TGQ7rtSjYRv7/XH+tm5XVFLOsH1jy0dFb2E+0TububMqozmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433141; c=relaxed/simple;
	bh=C7Hxs+HC/ifLeiiKtif708I376fPCdxcOuzTP0vRhl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnWfX3V0J2Cw/FWkhIx+Gp4WJ46VgFNOaAHV5V0Kbh6C/pMbep2dAGQxQPuZePhdSoZLAOgRQH/l9gjaKiUdPSK6LNU0szkYidC9KBFcB7miF5rMKSo4xy5ck55GY9jEA9mMB6rxlsNbp6W/v655D5C5MKOeJw46YcRl+QP724s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6vrRkwA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6vrRkwA"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f77d142aa2so1411311fa.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433137; x=1728037937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmYQRWcHraN87elAumemtaDWeWpnnzbAiL7EynhJvRA=;
        b=A6vrRkwAJbKQ7zw7Qi6Xq7SSMA38/y3Nmb3ISE9dYbuzIKS2Y3SqLjlzKSo8v5GOCz
         UgJ08b3x4UmG0alDIfkssk9dM2CS3XRX1Z6NK5DX737FJAsyyxp4l5MHsLurbt6G+w28
         5xV364yQrnGWKtq0mH045295zBrrbCDag287GNV0fOXBGeN5hlFQr0VOiGtNNFjV2M4N
         j6vOV3JAlg851uNLw6w9m3eeuI33/rfUX/L78rIP4qA+7sTPRo3jl1L/HAbo3qJHxP2S
         n8gQDfIqvgngvqACDTE5pVY/RFcg3wnuyYp+34BRVTmCTj3RZBl9XsDZZMb48j3OI3RD
         7y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433137; x=1728037937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmYQRWcHraN87elAumemtaDWeWpnnzbAiL7EynhJvRA=;
        b=kA6+h265b2sRwDgsEkgZiX6/NCgVamHeC9LB6it+f96ZAU0ypa8Nio38m1H+/2V/uA
         yiv7x310qKXE4sYDbF05v0MHy6wx6Wyt3wU66j/iDyQzAz7J/4nNi0Ax8bu8LyCe1AKs
         PG0TWlA5qXOaNuLuUW6NFpU8mnRlBfTFr92AvUK+TleVP0jys3kL+gGboSDV6096ykqE
         S9kIv1fNxl7SSwjQn1cj30oimDj9y7By+mFUqURiWJZY9XWHShSrJ3xOofrtLZRRTUzV
         4WOXEHNzaqTeTfDSzGRVouO3hrlG0LZdmK1vPnofyl90tiAil1HnVnglG8k9w8/A8bD3
         cc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+jLMEmjXctaXW2aas+p6ls4QqYOgnqU8P/d+WL/5TVnZHVBsq1ATOBZWl0U/b+nSDMIiUvzux69Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YygRxEPUDJI5w0OXwh3B3c9BVNtBxeyfWqKYcIcw7+nUDR43M+H
	g1PJH+ntVNk2SYzSe42EK19Ra0nfysWHIZDmUOofONdmVd7ejQvCbA3LGMaq2s8=
X-Google-Smtp-Source: AGHT+IElxSo702cqPwsugm8OpCJGFtQiZ4b5dufgAVqi2Si8o/Q21PrT7aCpXsL9JYb7O/JinLyfUg==
X-Received: by 2002:a05:6512:39cc:b0:52f:10b:666c with SMTP id 2adb3069b0e04-5389fc43cd7mr476649e87.5.1727433137130;
        Fri, 27 Sep 2024 03:32:17 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8550: Change camcc power domain from MMCX to MXC
Date: Fri, 27 Sep 2024 13:32:10 +0300
Message-ID: <20240927103212.4154273-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any attempt to enable titan_top_gdsc on SM8550-QRD fails and produces
an error message that the gdsc is stuck at 'off' state, this can be
easily verified just by setting cci0 status on:

    cam_cc_titan_top_gdsc status stuck at 'off'
    WARNING: CPU: 6 PID: 89 at drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x154/0x168

However if MMCX power domain is replaced by MXC one, it allows to turn
titan_top_gdsc on successfully, even if MMCX is remained off according
to /sys/kernel/debug/pm_genpd/pm_genpd_summary report.

Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..5c07d1b35615 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2846,7 +2846,7 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd SM8550_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.45.2

