Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4576350B
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684946; cv=none; b=KiJlHpYz6zUTCoaqfwp/+3AHwtZoR8UPjecxjlORW/Jajt1zkMpKhZ6CX5hMuhF6YN5Cu6SzXUt7iR5PtsMGwPIZbm7LJK1Xomi9DBL/rMBMT01ZQKw6b1ft/7/9ppW/FXJjk7aHRoWRWRP7B+RA87R6kHZp0Hp6CONJ4AQ3bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684946; c=relaxed/simple;
	bh=ROl06bKVN5C5JMVM/k0aozEkWtTHx+mchi2GT8R0eL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujQpMs3TOsIr5nBuOZxXMpf0By6jUXltLddBM9KsGbwlCr8CXzJGDdP8Xkr6I8g+pQFa4lCacfz6g7nn/j5daJ+jnX5/vcha5klfF4ggLuvlp5Q3xIROIBs/2kRvqOBM3PqwfbVKhKG5gqWYErqvQxUWOCquIohD5cvJIIIQuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ie9O1BMH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ie9O1BMH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so2613383b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 23:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684944; x=1707289744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9oRSAu04dlCPd12GT5wZXY8U+i0UJEJNPn5iJdXIgA=;
        b=Ie9O1BMHkoW9pJr2jmDLcbg/LaPtxc6M5VRjZ5AK6NxQu3Hq1ZJ6toTs7hghp5Nc+K
         BG8s0qqShF0rQgxzOBWTq/XKlGbzPkzEwkcYrdy+FHTDNoNsjy2slGQjxYCb3JXtyxPh
         A4abz+333oWLI/Sd5g4JkasQAvodpIA0K3666aaZncdqii3gANvujl6Y0fycLPsH+/f6
         3MQD9CGbbCGO2juDzfPMRRvj6/4pfuD3iTuhV8qM7stwWC96SOj4a9xIjOSaTFTKm42D
         dGaXWtb0EB/jEZa/US9ZBaV14argjzLSqmFJlhffUTp2+ykxLV3oXz5+QlOzJeWueqtr
         SrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684944; x=1707289744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9oRSAu04dlCPd12GT5wZXY8U+i0UJEJNPn5iJdXIgA=;
        b=X9G+JVirFVbDiim27Wv5Ahn79pKChBNQdhgG1okdfsXOC7sa+kTkN0Ce1otr7v58/7
         lVQfMN059d0xWX6ZNXpWq0q+hV5o1hHiBbtJZPS62EYcc9qPeGzLXgBX8HHB56PQvx62
         TOPgP2NePyUQRJ75KKPpFtWqwrG4Feo9deklq/DEV2NKKac06qCLZZ91bmQ/94Fmj1BT
         m5VwBKm4vcqlmwKAJz1S3WZyjSc9ZI87/DirPySnrGgovNycCuMEdZp8gJUMp7WahiSD
         idr/s/6j7JekhlqB0rRO3LhYG2R+EBNidobDvU/8M8nG2RXNT77hCA6G91zQSV0EfqTm
         YwJQ==
X-Gm-Message-State: AOJu0Yw1iHMIf/QHvIziY6sK6VnjE8FKwsmZbxWhmuh/v9bWbmV1P8bV
	UcFlFgZDXSSlfYZgLK8wYFMGErhGmm/rq7isGd3h94UIfiMsUL5BWpiW0Edq9g==
X-Google-Smtp-Source: AGHT+IHZyBeQI6x6hJT6GYjp+TEq7RFTYqHZ3UOz5mdIL2YfygnxhP80fmM1OmJz57MlcaGiJbIX8w==
X-Received: by 2002:a05:6a00:938b:b0:6dd:db87:6356 with SMTP id ka11-20020a056a00938b00b006dddb876356mr1201124pfb.7.1706684943548;
        Tue, 30 Jan 2024 23:09:03 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:09:03 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:34 +0530
Subject: [PATCH v3 11/17] arm64: dts: qcom: sm8150: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-11-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ROl06bKVN5C5JMVM/k0aozEkWtTHx+mchi2GT8R0eL0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG9iupD1/Y4aBPSYlnuMUF3Udkm8VJwVjvGz
 uoQhWBDgyWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvQAKCRBVnxHm/pHO
 9YyOB/47DylBxJWasrkUuurfb0gcQALAFgW3b7qLrDKrxTl/uNX6iZj7wgH2YdtS3/PK96mUaXK
 wB7CxJOcNjN/25xYGPRnyCTK/qkRl7jwXKD1YuMsE0HQaWYjQSTehD6GZwk9OpoGc89D30CmNjY
 2krUhFisIhqOYNl+MMZYPcJ48WnsA3uJFiYfjCVE4CKhdcfGrsFEgz2MZf1BpKWi8gNXQdRHYES
 O88WjY1ujPXxjyUL9/GZRdqqbpucDSRDJsqtU/pwFgR6pvICvAmRqz4mMFY+L808ETRMIthPUpD
 hbkKONYrb2Wkwd+OH5Ih/Lonh4C+dr7mr2PvDZLPL5AgXY1J
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in SM8150 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 3834a2e92229 ("arm64: dts: qcom: sm8150: Add ufs nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ad1af87991ff..eb1acea2631b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2095,10 +2095,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 

-- 
2.25.1

