Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03D3803C0
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350177; cv=none; b=pCfBBYRLyDHXbq2j384FS19Ikf+FHEHzHY7/ixCmQJ36h9UMJeH4X7fncPl1pfqEhTPW7285lhQNRKQt6iXSvFtNE6g0PWb45IupL/NjSoGE7x81qIwYJs+xb386wvf0/LC5c1RbvPE86qggxKKbRmc9m7xxKGRQELplec9Vbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350177; c=relaxed/simple;
	bh=vxfXIFdpH2DkubO4qsVjWm99Icp1mKYD9x6L3Ptu088=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DyU26HQEsziAupblihOaaqLFwf46NI6wVrBvzOcMDyh3+U9VTAICuWd/Ojz4uuFo0VPSF84nxx1UihPPlMky7KVbm9TFuiTaCgby60REv0CwFFuoybpwSFeRDH0ki33Dur/wVLNbQGPjrf1yr9kxO0tFadTVQhla1gYJsfDSzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnWrzR96; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnWrzR96"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso21899955e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350174; x=1783954974; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=UnWrzR96/yntAx2i5Hmq7Xw2Z2AawuGATmVXjtRXF2QMj33fMTE64cuj8mn6Vks0rR
         DKpLulwd8nOFiDpD0JCFRTE4+ZfIHqqafyPgfHlvw1oA/Ufm79Fa9r/ZigIH3xW1YY7C
         8e2vb6E04M+GXvoNaivOr/FiNLUiYyMW63RHh2sW72ptdVwv6CDPiZr2lgzysIzAvgMV
         77oaLuSdcSXpAZM9ywwAa66T9HdUZphY+eq5x2DrLoZKli3x+fvvXLEMsQwa/sooZP/k
         YyCyJi5+NoLnnF4vWNNlg9ccp2ExDEbnuB+RA5tpjN7kunwWpM2lMFwYXv+d2lt/3JFN
         Q+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350174; x=1783954974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=oljz8WWW67CGrvRAYlDVbvtGVHbDUnLWIPptrpohD9+jAzULSXc3iPABhOSVgdMixB
         hKz+XUZfl5U4vtnXRrlnFvvDC1GVD71QQ4JqrZg6nbzVUVW+0VVKoHJAd+uJyNhRTCYZ
         zNQqI6FAT3LuLyD7z7cSHlDj9ZnfDl1MKN6oo+o6FmTSxLkUMjabYKjtMnEuAuSsHPqv
         B4RjeQe3hqFUCSFHiHFljJUxWVU4Mtlox/TRzWA/ahZEokpjUgunn0dly/DqCurxi35J
         WAy+d/z9nvuauWSsgrcg0Ed9d7GPwrk55Vsh6D6f/8jPOzS4xDJl01BoFsMjC0VmF0eP
         eUYw==
X-Forwarded-Encrypted: i=1; AHgh+RqkXagBSSeBGmp4XDml35jn6hCV9B7/ilO7NLPC7bYKwC2SVYyuRV+81sooDKL6REvpPz2p/kXZaPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqOQWGlGfqv0sMd2ui5ly2uVJpsiVPDPWzZI1HV8k8ZFxpjvb
	rQDuKhij6VMaghKeWXgG/q4Nx1tfsrP4IXX5IfCPtTix+pMxyE3Xfx+6gsSthsV2imA=
X-Gm-Gg: AfdE7ckHTJiLLIMRHGG/53e8unAXfeksTAlpQOJMSJTplaYMEILPqajDFFMlpDylvMV
	Bf3hDF5vE1p7H105+EOBBOooLGYiqvs8KOE1vH2I7yvHMN2wo46h2nptNJmzNBRSFIvpyZwfZ1w
	lDx4p1rsLDAdpuWWUBwcXXJNP0YFSZGhFfHb5ZiaI3KqalYq8VVBADgWyOF368BXrNgg3Dsbbn2
	JHzyq50DbJRCu/KgAJVOEGsMLrOeVuyNFdWNKakTFL59Mi5kv+MUumNK49Xr80Qav/+eJQmVUgo
	1u1B/IXVexCB+l6gYAbVDEnZ1A0J232rNX8irQFnxLe0x0l6d5JnfGaEOQKml2D4X3NTeuNG+MZ
	dD782tKZ7IWRmTSS3/vqZcHYMUCAM/EiTZsexnZaUMuZRvTrNEg7m/K1zTMyG05ysOD6nwY4FW8
	xCmICCt31rJSku8bFMUhihEcfYcA==
X-Received: by 2002:a05:600c:5395:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493df074984mr10650625e9.15.1783350171023;
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 00/12] clk: qcom: Assorted fixes for gcc-mdm9607 (and
 gcc-msm8916/39)
Date: Mon, 06 Jul 2026 17:02:07 +0200
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/DS2oC/4WNQQ6CMBBFr0Jm7Zi2USiuvIdhUdoBRoVqi0RDu
 LsFD+Dy5f/3/wyRAlOEUzZDoIkj+yGB2mVgOzO0hOwSgxIqF7ko8Wl9j/Z+w971ZS4KbPhNEbU
 02knpaqcFJPkRaAuSe6l+HF/1ley4rq2NjuPow2d7nuTa+3sySRR4pLKQRWMafVDnOw8m+L0PL
 VTLsnwBEr9AfM8AAAA=
X-Change-ID: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The gcc-mdm9607 driver was originally based on gcc-msm8916, with register
addresses/frequency tables - where available - replaced with the values
from the downstream clock-gcc-mdm9607 driver. Nowadays, gcc-msm8909 is a
much closer match, so comparing the two drivers revealed quite a few
mistakes inside the gcc-mdm9607 driver.

This series fixes them, together with a few other related bug fixes in
gcc-msm8916, gcc-msm8939 and the dt-bindings for qcom,gcc-mdm9607.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Konrad, Taniya, Krzysztof)
- clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
  - Replace with new commit that drops the BIMC PLL entirely, together with
    all related consumer clocks. Similar to newer SoCs, we now define the
    NoC-related clocks without parent. (Konrad, Taniya)
- clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
  - Drop now unused static gcc_xo_gpll0_gpll1_gpll2_map variables (Sashiko)
  - Clarify commit message, looks like the apss_tcu_clk_src exists in the
    hardware, but at a different address. We don't have any use for this
    clock though, so leave the actual change as-is. (Konrad)
- clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
  - Clarify commit message, the system_noc_bfdcd_clk_src is really missing
    in the hardware. (Konrad)
- dt-bindings: clock: qcom: gcc-mdm9607: Drop incorrect clocks
  - Keep APSS_TCU_CLK_SRC since Konrad mentioned this clock exists in the
    hardware. We don't use it in the driver, but the dt-bindings document
    the hardware, not the driver.
- Link to v1: https://patch.msgid.link/20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org

---
Stephan Gerhold (12):
      clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
      clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
      clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
      dt-bindings: clock: qcom: gcc-mdm9607: Drop SYSTEM_NOC_BFDCD_CLK_SRC
      dt-bindings: clock: qcom: gcc-mdm9607: Add missing "clocks" property
      dt-bindings: clock: qcom: gcc-mdm9607: Use proper address in example
      clk: qcom: gcc-mdm9607: Drop redundant register update during probe

 .../bindings/clock/qcom,gcc-mdm9607.yaml           |  18 +-
 drivers/clk/qcom/gcc-mdm9607.c                     | 193 +--------------------
 drivers/clk/qcom/gcc-msm8916.c                     |   5 +-
 drivers/clk/qcom/gcc-msm8939.c                     |   5 +-
 include/dt-bindings/clock/qcom,gcc-mdm9607.h       |   1 -
 5 files changed, 29 insertions(+), 193 deletions(-)
---
base-commit: 696bef37f7f22f894ffc2059bdf9ec76b309cf8f
change-id: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>

