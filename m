Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C54183A0
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542637; cv=none; b=c8TNofofGPl9qiFTPS9AAWzugemCGJYUXGzAd58KVJbfLk4OiCsag9JAKpQxDbAUf3SVm+bRcsEwyAx34WwZxDRfpkIJoaJQLO99N5Agoqj+srUXgk8a0ZMEOMv6zftL/1Lvl0ijxL3pFlRQmp/TImx2xnrwaPs3tPuzlEGYa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542637; c=relaxed/simple;
	bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGPSfANdoOAYvsShBERicK3ny3ujuVPLFovLmue32ZFiOdb6HL2DCi7CMe5TmsG6QGmzDvAsm2EwcA3GV+n4gs9YiEqKD/MAt0JVZ9irY0BwXamFcg8zVFWnUpgX+7rS1+ld0Vg5lRp3cNPZ77RDYB/6P/dEM7WYxxYWOS9gMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7y/vxpm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7y/vxpm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so36152385e9.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542634; x=1782147434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=n7y/vxpmE0zsY2wMuUR+SfyWEUlbOeFm1Ekn9BChRC9EmctRzTMINuuwH2CRE3Vrfr
         nSUXY8I3GGAd3e1H2VvX/t9GALp/qgQ2L4GVeiIEmijkpc4YAfQcVDIYuqMdScYvaMM9
         ck4GWexKkcmugdV8/NlpvuD4d3C7rLSH1g4sm6Qy/nLXPcOt2QIGkSjsnVSFkvQKCI1E
         KdMT7nFzrSRB6+G7WymYtu/ZpmQfWKppceplu3lY0s4MLd46TEjp7pZ3VpOAhq1se90m
         JcopVEgVEZ3Io6/Qm251ARwjVjQyAso6tTNXl6fbnia+Z4DtxZ1ElChVI+z4U0xTPnUF
         c7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542634; x=1782147434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=ZvVYSV5fqZ8KNChsntkaPrd6uXzipD/mvDoPBflEQyqL6U5b5t3JiyuLeXYlzARx7k
         cqXBrVOlx/0cywtaRME3XvAXifGiSUnsL3doNp2pucqED6ZtXqB+EM8VDnj34ptjRPBB
         WUyfUONfo3cu0aRST0B51OoFtzusIlBwOBJ4OqSXrjifhEK/RZk8jAvXVOJPHmkhn4z8
         26ouES8jJ8NIDaCdv+G7jspplrSOrxZa35twR0PktM3QS00JYz22v/4DHJNyUu9/Jwmu
         EuZSq1D3UwO/bLLmrAndax5xBeMucGCCPDa/AqFDHCQECUU8r/8qVRP6nY11c2jhBVw5
         S+GQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Jy0sllbfq1pf30WIO6ZnyZ6w7ZKzoM2m0r8VI5shVT2apwo2FwT8edu5a5w6kfU9VvAlqFfUSSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvU++wapx5CFT35mJNQBqpTVO5u2V9UAK1jP++vx9TMblQH7u
	E6QDcmNkjzc4QUmjfzjo3m8cnx6aF62/e7nMxG6nBq37l9uwyDVFtblBRtbydIRVvUU=
X-Gm-Gg: Acq92OE6bul1u2dZHz28mVjvBioqdJOe6HkdxeOQ/9iOX5ui1ksE6dAghEcaonPUfkC
	BHfb4LrqotMOUEmmaxFfRlUhN2tG/zASAf1ecM+jQ7uOyoGVyWuqDqGzKUAz0koYF1dNsVdLLer
	RF724osuOmtxQB4VlioPfr9+DUOd5sZNWyJaQSkOicTGCy0TvWaolWZQML6ozGTlOrQmATpQHqR
	5UGHui3BjYTE8PyWcTZdOrdBX6WyJ3d8YU08J/erZRV9jeeuJO4Zfy+PPmEkdnnBSAhPVuwZkCI
	u/soVEe6bpUT+YKbmcLYWl/mX9dCxWV+cW4/bZ6u46oU2CLK9tHhzVShU8EOlbzRiZP1sHXZMni
	ML21Q9ITkTSZj0h1U9uc6KGjun3x/sDBz6hWd4CBHr/G4dHbkA58/yYyqvf7nIa7STs1vsZx2Em
	aKDlMZezoTlzpEYuqXOP94TXS0ibOazkFTUdyM4qnTaUFR
X-Received: by 2002:a05:600c:3f07:b0:492:1e36:bafc with SMTP id 5b1f17b1804b1-4921e36bb41mr153680045e9.36.1781542634466;
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:07 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-6-6b5752dd4747@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7jZAiJqW5AmB1lC7UlqNt0vIWrJRHtTC326me0
 PmXRnEiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4wAKCRB33NvayMhJ0S34D/
 4wC9TFzb6OByWn6XRk30aSwG1MOO6TDGE/O8Zy/RyeNfPPs4cZUoUxa1Eg4qAVm6ut2RlvzxTReou0
 b7Lg/kHLVRGnN5mUOw/ebWHNwtxi3RwiINm1PAV42JmYueR/g/IVKAodgxcb5ojsRFOmqifs3Qzcdu
 BlbOzm8Hr/KaUYQV5JbDiaSJDkuMBeUjtXbH4ZWQYUYYnwrcD6j0uR9GlsEmIEyYx6Bo+su3j3HGGA
 a7yQAT/KaqQyzND2fqPYy3SF4hxUNWUiJbpKEqXelYVABd+KRW2c5fYCmhpF1cBlQ/2yr/aTI/L5Az
 inpmUVKLEWqWgZ+GfPDFUfluY1F+NkeMCbBgWEEYDhjMdR98tW2fe0AXhQMp6XkpZGlW0n58andf8/
 VozIOiApMLpUGlBWqUnNbzeb+TbhW2iA7UsumTuisIbG1mxHE+Wr4nFErwQnhRdz9eOlzDnajk3sPn
 cRfPqaadeGMVht5+vF4C5VOkBnwB18MXktAVrQQpTKcKsHRZZNnxrMsFWqhlb/5IPxdtOOtxPbeOXS
 sdA+rwlfITleBcmVmtHErPBzvIBXupBjwuhmlicGQFMOGvCzognf/ayoIEi3f5OPXrw/nCO8382tks
 cErQXKVTpGgKGvRKh1n8sv1K7eHjSK/3I5/LWxaIdJ9iuW5oigJ9u05DViTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..8365e97436d6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1963,6 +1963,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

