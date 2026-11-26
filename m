Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678842;
	b=gY1Egdnuw7QSKCgd0GVCPFx5FBwCjlLoFT2GNgeApYqFIWbEFIjBFweRkZVZrSBdaxOc
	 9nzsDAYzy8qAtXvdQ+/4nDIo9fynMKanGmzzjsdbvBHWj66ZohlumqcT0NZutO7JR/m2n
	 SziE0RCYQ0VT18RCDSA5Q566FAvOnhFzc3gz0mKJAWxwhCU+Sup50mBlLtSB2Tyz2XfaZ
	 l7TjB5Cf98PFM/mF6P/ebaFrlQwcQOVUhB7t+3K5SqhON1FhfQEwY9ILpp/QX/vcMFb+w
	 /ceqVGq6yL2AGndxoo5ha5YTH2pLN1pt8STUpfe68ymOJwb9Qo3ODEOrQRtlg4VkcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
	b=m2ZGQcysagt6olWPIYI59I0r8ZHK/LSUe32XwWhZK19h0mA7atRQyO320mGhpEvMRh8a
	 paMtoxWX4F7JIpugTJhF/BJwJZ/UyUJ2pBC4vgru4IoI7gvwN+1uiNL4XWLOcovc4RJp7
	 mcWrwYPJXguoi3BLF/BuKTJg1Efey0F1MX7SO86sS/l2bZduMdwAlpzoqpY0fJ8Tt0Fay
	 IrxG+3e8oGRuMXvwh1NSHzUZiVfkgUbeqddKBxOthKTH4J3S/DiWcEWtvqMZ109ojQ7V5
	 ii+JNLcvBHzw+bueiaKQRtl2emFy1yed2HCQFt7K18gIQnuWNoD9rbQ2eCSo/VzgeGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+i9gdUR;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4F606A68C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE4F606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+i9gdUR
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so393055e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 23:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795678837; x=1796283637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
        b=m+i9gdURt12WvcYA3+Ma7ZMye6NVvbXEljn0s4sToSjmsJX6iqFzLVeKmPoc2VWo1q
         DVWxhYrliolRwFL/bkGHdsolf7+nkv0N2r+uGR1Z/00MAMQws+qfeDb3BC9dnXZgvhjP
         xYXsFNLcXoT8z1FxAhjDKPKNoQt2XvWuvFKoG8gyXQEp/TI+w/G3egBlFpvsiUIyQtrk
         5iHynqxZvVRLS0XHx+HZfR+odjwskybTAgAIEzrNpHdWd/k2VOUkzrv/6mug85t5mvlZ
         Q5kqP83zNMBdtc28BayGQA/zqqnIBAIG3psVVaUG0SiZ/eHusCeBUhvgHnF2MfB++j2M
         XsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678837; x=1796283637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41zv5RzYIPm5yVXR4qWN7+yvtS7MaY4Uz8JUaUkw5xk=;
        b=XlHJnFXzS8SxUBWQquj8ofPbZAtOwYM/fGrplnHj5rroDthoxwThlaYiUO4w20RS+x
         PMNDtVTDvBPeePzgPKeWL2iwaO+CyCeRmGunGeFmrC1bpaDVGUdQ57oSIy+5SQBWjXsY
         srAARh24l/NS7Dmks7iZ3c1geNuKTumKdx2ra8kYaFcfV1ZyWr834wRF59sa1QkH5xmW
         nXqTRDbHkGydKFdv9qqQA8ookcCkRhqAumuF4lS7L59KsDROoDbGUOIVr+Ka69H+jqfG
         q6bt0Bbb+I+/u6Y2qM+Nd3D2nnnO/4vkBCHEvwtDW5HLOx/mhvS8Djm2sp2umNb4EGi1
         YlTQ==
X-Forwarded-Encrypted: i=1; AL+hErHzxJbiAm9z6dUAX2uzrSQytem831VAzRE+Z1ocKK1qya3jV2HpIU7stl/YE6nwEIs0/YcnEnz5TKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I0gL13OHzIJZSYlvDDeHLbkuh0Xo36/d3XxQBH7p5d1Km6FKW
	txO3dW+P84j5els1hrHXOg8YhtYzSLEnzmrp9gpK6fDhqyYEVQJS7Nu2VKjUBnO2nrk=
X-Gm-Gg: AZFdTZdX8/uim+iIZ2qO7LxQuj42OjE9SG7C3bdAy1fQ+1Yhl7IEqUi/PXeHUV2WS74
	PaKtjiR5AehW3krj21NDA5N/2ol85Pdwyvui47omGmqEjO5zqar0cQaLoJ3LyeDDWoYT8gnfJqA
	zGIJv4+zbmyffOTKAh5ItLS//P44WYUiS2wZn2CjFjoyH7oxBAb61U6cneXOYfFIduMEynOtDs6
	Nz1gxFZBTAsFhgfRS4lp8PROJ4AyGpsyYD38gez5uUrlbWYpF8wCv4JxjtXvByDCf1SrkSL6KnR
	qayx3lrLIqLG9cW5UDKwLDhq4eXixZVjjjLzd7Kiy/kB82Q9FljaTCsEe8mG9AReDVdbd2qevD0
	AfZTYJ4I7WzhTg/DJxPXPq33gOOw9KHDpXi+GtBzPoCgnsq+qc0cKsL+aIy+u53hPqrPYCDOzpP
	SNLVfkfSTDHMeyx4yEKSvg8WDd700k5t27BrtOg+q8p+ibcFVZgPAOfPEsDsMk0uRHzLFzthgBn
	zMCGX+KfrZlegOIxH+W/39z2Xxrp6wG9XIWfN4+Gzl1KvHRnlmY1Avh5A4RKVIC3Wd91z3MZYr2
	PZf3eHG8ld48xDB6HoHvA0IBGFOdP10uNaTRxdr2ytsxBdqebdnwr73Y6Z1pck47SYXLmPMypYC
	XbjrYBdq+YLrcgxk=
X-Received: by 2002:a05:6512:318d:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5c1bc78eb99mr7625087e87.3.1795678837561;
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm4984521e87.64.2026.11.25.23.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-qcs615: Fix GPLL0 AUX2 parent of CPUSS AHB RCG
Date: Thu, 26 Nov 2026 09:40:23 +0200
Message-ID: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The always-on parent data of the CPUSS AHB RCG lists GPLL0 twice, while
gcc_parent_map_0 describes mux input 6 as the GPLL0 AUX2 output, which is
modelled by the gpll0_out_aux2_div fixed divider clock, and the non
always-on gcc_parent_data_0 refers to it accordingly.

The RCG frequency table has only the XO entry, so the kernel never selects
the GPLL0 AUX2 input itself, however if a bootloader leaves the RCG on it,
then the clock framework takes GPLL0 as the parent, and the RCG rate is
reported twice higher than the actual one.

Replace the duplicate GPLL0 entry by gpll0_out_aux2_div clock, as it is
done in the downstream driver and in the other GCC drivers with the same
parent map.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index f205de3a9361..4c7d44187dae 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -229,7 +229,7 @@ static const struct clk_parent_data gcc_parent_data_0[] = {
 static const struct clk_parent_data gcc_parent_data_0_ao[] = {
 	{ .index = DT_BI_TCXO_AO },
 	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_out_aux2_div.hw },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
-- 
2.53.0

