Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481723BF90
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042541; cv=none; b=gcTayhfJg53TfK5I8VfADALQ2UTE1cH6q7dgWaeIp5xImHjtXdiCN/MCCL/NFnub0IqGyg6L1UulWrrE6XSNkkbCIFH7oj351AYLkf2WEyeq48sOIm75R6JCnMJJ4PboAChhnmPEVTCN2Ffd090hZ4nOUcEliNJrTD3L18T7+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042541; c=relaxed/simple;
	bh=j9JOgzmcmvDWHrhUDefHzjBfMqmkn65YnVmg+X/UHck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AekxCn1sxIY4G/Eb3/P57ZXM7kWxbSRL9ToFx49lLGZsFOdbcQnz1yLxx+nrGHel/WHXq+Dmis2/qzQhmHDZpY2mB8YfWvN2v6v740to+QnquPNFA3D7/3u2LvvO/vnAFHo6ljXX/EfLYnFoQPVZe7ff0T6QySGcw3eGc3wVTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNcaZywe; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNcaZywe"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54961dcefd4so122226e87.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042537; x=1741647337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvxvtp/PgMA+KOB5zPz/+gF3wZdvPxrXXnP8gY1icsI=;
        b=LNcaZyweoqme/xlGnNO+1hGw9phHQZmJpbsGABYj8/EXBay54/emWwFkCmAwUioOni
         Yt7m1xSHjXL9nQFz3197eq2beCjLgY60g8NJC1BGwTkdLwBTc14ISiVpz4evTHAdPVtz
         gREv9RXyH2isBHurXT75c5sD3dQw8yfk1uzT6RYe1kc1Umzhy3xDOj4Pgo7+EFE1lTEq
         6RPDTOe28O1TSSqEfM4wlyE142VpMCT45Vs752Ykw8NBy63vwtrXQmm9dp/a3Qzc/jMN
         2AxLFg8FZMkdLdgm6biJQ34VL6vpcXpNPCVOit3XmL7e+E1oq9kabC9to+F7j+CmxFb9
         7FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042537; x=1741647337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvxvtp/PgMA+KOB5zPz/+gF3wZdvPxrXXnP8gY1icsI=;
        b=boLxxTIDOV5IKuCuycKxAvviLJHodQ54jEBC03hJSGtwFrebJcZwWKK21AVTcTAKzf
         l7s8dByHHkKFhusj6R4lhhAKPilJJmW+L74+2cbowsY2ZtRn3UsdP44kRRlLDZg8o5uu
         8lTCBFaDW9ZxLgRyIFvFMG+A4Oo7Nta8f7EHgC35VPzmRhe8mMtRWcGTDqa2nIjBAVIj
         xpnlOqee+iIph1IkeaGnlPllntIQ7/Yj5H3R7Y3mMSobDLX4scOYVzRzOIfnBtfPmHeO
         M16BB24A7IBPtVwpw2cidIZHkekushM9t9z58h7jUIvMsbslXcqCB5bIql1y7GxzT+LV
         9NLg==
X-Forwarded-Encrypted: i=1; AJvYcCV1lpONSM6DpxSucarFT3qQ+t6iUSV1fTrsMIcpoRoLdopOqzxu/ntKbMy17bYB16g/HC1mV++wQ3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Yec04V1LrrlDyiAH2e5/NleLUiaLIskxmr4BsoCfSA/Xjaw5
	uKNlDhU1QT43pX7I0mZOiGCUH0kO2KIDsMmEZajKvWtvpHYv+Zhm10VDi6BMKIE=
X-Gm-Gg: ASbGncvpjpIRo5iw+20pX0vqazHaMnDNTkxv+WIqBHC1T8zPl/vpkYG2bk/icfC3q2Z
	wpd8tkCYOgVT7RyGmZ55MXrwgba9d28uTpcjLD3l1qN3VvQHvBcOy2e3+5PHkD7YTTA0aml1hCe
	AwRJRdu/9KtOQF2EF76eHnQTULevhLWHXRqU8Jlj9RjeKdv0T6bc9hHo/MCiB+qdR3IEw2I/EwG
	ZZ7zkSISCe33yb9RLYm1UO5tOiT1TeQ+KLYfKTX1Mnwi3gQfxZWF7XKEUEf/vfHP7n/aulGuFsD
	9GF0wudkIXQYvha/JpVoBDJLfoifdUxbcLekgVdEfDxjm/YgZiCzyFlfrQJI28L5MQWakqBw/FN
	b232mXV8Rhdoz1Tk8B9V/6mTByX+0wenr1w==
X-Google-Smtp-Source: AGHT+IHzrwEy7B1YWBxSPh2b/rjqFRLEHa6zuKP4h6nXsDizpRThpZqROcTmTjkAlkgT4Q8oWxRx6w==
X-Received: by 2002:a05:6512:2810:b0:545:6f8:232a with SMTP id 2adb3069b0e04-5494c3682d2mr2008050e87.13.1741042536678;
        Mon, 03 Mar 2025 14:55:36 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:36 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
Date: Tue,  4 Mar 2025 00:55:21 +0200
Message-ID: <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM8550 Camera Clock Controller shall enable both MXC and MMCX power
domains.

Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d02d80d731b9..d22b1753d521 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd SM8550_MXC>,
+					<&rpmhpd SM8550_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0

