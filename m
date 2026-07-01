Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866421A275
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 00:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864770; cv=none; b=iZVF/OGnGm97zPVtiKzGcXHVCiuSXZphdWE1uwb1JZdGm+cmxdRSf1I+B/YUgek6qZRWAON5Kzet/E3ElicRTeeh369Rj5lvidZMMhxrRU6oa+RlZ4DIB7G5y83xdU07pDnv9M63OieqlfYSCxXxVFfe+NyVtliEPttsMG54LNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864770; c=relaxed/simple;
	bh=/981d2iTu3k1moKZIW+6c8HWAdcMNNwAINHe6ojx3ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KoEen/1mqCcHYnqX38gTxJ+e1P5gvmisY7SxWC66F7lwbM2lfbTBQMNJx2+fe0YIOEpOyK05g0qe1LGa1F/Ir4ZUF21z+ZkxATTu0QZaL0rxyBS5GpiOw+w2hgK31i0PHX9FTiyZYzMvEdsBd1TET32G6weoZWPRJR4Jjt2mCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Asl82RKt; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Asl82RKt"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39afd6a6b98so58671fa.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782864766; x=1783469566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTuETi34i3b/LACJpmuwFm7FuPpOJ/h6Tsgd07zA5JA=;
        b=Asl82RKtdhgWG1374HI47aESPdTPE412kflysG6vsvn+i7E7pBJ0PH3aeerkqzRhjH
         9ryOlFQG7w44gg8qmzLcmGCXXmfcmX63/KXHrV6RllMD1snkFtHdk2K4EUlZx4br8f7+
         srQERIOZxpGPwuBgOjgC/yzb9OCc1Nee0JCS1j4ZXZClsr5IBsaWePV/wfoX6DRsDSoN
         0MUJgfAHBzo6XSU6t1pAafTvazXoiq2sK0Zos0l1iH5p65T8f2kRGBZDibcdMFaqlf6q
         iV4QW8QdP9E9kPdGlYE7ogOnDmLSJOyqie85vCN7Ievs/+K6m6IoHwI/si4DOAw/29UG
         3FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864766; x=1783469566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTuETi34i3b/LACJpmuwFm7FuPpOJ/h6Tsgd07zA5JA=;
        b=Fhy/ysWdeyRWeiIDiSMktIBQIg0GXJsaa4hD3jRmdQkc4r56NCHJuK1WQ4KfowsM2Q
         ygB/hrlAm/fQS8jrfdkqntf4bmmwcOLZbLGXLYUDeZXOcyYZbdTqBfV/dRTS/pV2dh3f
         QX4M2w+9ZdIseDoYUCIPnLHInHwC+wBT6xnyyk9IzGGa0TxVHy3zoHF/SCKtQ0DZr0pz
         6HmFZLYvIoTZWD7yfImxPLtrKAdXTDcJ2qQbm/WqbhEPY8ob/VOLmTf+V3HkJuumLA1g
         dy3qTCTjUgyDl6kYlR+jhYQPHy9SS9KXeNcBQx2lIYRoVvBCvOHRqXcJyEl0ZClBTDrz
         kVRg==
X-Forwarded-Encrypted: i=1; AHgh+Rqq3ccOcxak0SMZ0MzuoLzM2a/v3K/KCV0IQ/VM5cwjes0qZxS3IA5rbfWYU/haNMxaa1spACe9R5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJL5/Sd0fUd+3ChJKA+Of85XwROanYDfyr+V87kmjKGVajh88u
	4PmHXvJM6K1UZTgCoP3q/wmFRgnSZsngoE5Kujxdb0JMJVbmvr+/9lB0OghM3oMS8co=
X-Gm-Gg: AfdE7cleDhv3/T8mIzkl0f1jTxUQEcEKcHv5DPFF9nECvpbEtw3cnxdVZRyUPyTyXkq
	Hpxmz78d3bxWmn9jGzPS6rRtQkoRYXBnmZJjEh03cILVrSWHxk4qvQJcxRpXBUuDTiN5GTrJio7
	VANo2u8GUYQ3c6bXk8w2HLcBS6Ys3gS//r0UaWyXZK0Fx+4HEfAt61UrJctjuSat9k5TiqvUaO4
	yp3udZD/EePMXB8SOosuDh26nZMeryiQFfhCT+QuuIpDiCSBrK/uWxIpnpjBt87KE7+aYqG+GbE
	vcOFiPQAdJpbE66T4Lof245tn6WKc4MhiRPXmuPMuyb8cWkPGp+3rPWoiE3EI382FX2Ib2Fc9Y+
	xhH9KEXiCd/KAFBYgVMzfpigA4hg5Powjbqt1XmNx2KVKqBIPRMZv9Png6mC0OUH3zf58S8Tqoj
	v30vsehp5NjPrX1UJ0ktPbPEirgx3DOMf1k75WTGIdzTTq3F1mkZBrnw==
X-Received: by 2002:a2e:9659:0:b0:396:a453:746d with SMTP id 38308e7fff4ca-39b1df91c88mr4688811fa.8.1782864765673;
        Tue, 30 Jun 2026 17:12:45 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b2f9da2a7sm591721fa.22.2026.06.30.17.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:12:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Val Packett <val@packett.cool>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for pixel clocks"
Date: Wed,  1 Jul 2026 03:11:47 +0300
Message-ID: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.

The commit causes quite severe problems in runtime due to the introduced
cyclic clock dependency:

* dsi@ae9400 platform device and its probe depends on dispcc clocks,
* the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
* at this stage DSI PHY PLL cannot be locked to complete driver initialization,
  the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.

On RB5 board with no connected display panel on boot I get this error report:

  DSI PLL(0) lock failed, status=0x00000000
  PLL(0) lock failed
  dsi0_phy_pll_out_dsiclk already disabled
  WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
  ...
  dsi0_phy_pll_out_dsiclk already unprepared
  WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
  ...
  Tainted: [W]=WARN

The problem has been already reported and discussed before [1], the original
commit was done for "preventing potential stability issues" reason, and this
time fixing a potential issue introduced the actual one unfortunately.

[1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e59cdadd5647..cdfdb2cfb02b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
 };
@@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
 };
-- 
2.53.0

