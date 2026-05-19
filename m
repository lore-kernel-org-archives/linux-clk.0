Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2923DDDAE
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203602; cv=none; b=Kkjtl8d309PBer/+8eOHtjtM9Rj1LA510z/NxdUsZBdZBkjMr1yeTt9T5XY7wV63Jf0YKSa/+JnbrbGvksqHbikzQzmT3OacHJ9tCzSwiqFVCBsMQcIqCp7eHM/C0mpgYaPQ1EGgN07fU2UObSvoHe3mmEhtzF6z7pRlC3AyYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203602; c=relaxed/simple;
	bh=K+kJKbvXPW88Oa7p0gODZiBRpGr+iOkCDH6/id8w14s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OtpVdP0wwyib4kJHDhky9qzC9AjGz/Tuu2mPp7mneBtwlJr7DmditnVOSic3M4t7EWQX0p25uoIAXW8dwN2T2zC4027rTtQXIK3M96iKThsBJyTlAci5U8b3+BfnZBnytbNzE7F3DuLILBKhX1sza7k7qHm5im4vySWP+pQGZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL9EjWYR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL9EjWYR"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so5522097a12.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203599; x=1779808399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpC2oUS51Lj9ty9gOUkVj4nIoOC8+fY+yRPYKX23s6Y=;
        b=BL9EjWYRNsy4oJMpaQBktI8FUC4mSpAP0N82ypauCsARV3vLIfvAfC46dS9PD4vWM0
         JPSHgB6IkCDJJgLglHFjwplQl5jdfuQr4agJ101PfBEOOghIN1vMqxfICVei7ETDjVDS
         D/cmiDedGPugoRMm/7f0GhIBxFijPE0qLYpbQIlfol1N5SUo/JsbQDHJv+DRWidx4h23
         lG31hiYds0mWIpWQWjSTnKnffTiQuJxDlhw/fML+lbzDeDxWyeERXlpn7UxtTOmjL2pY
         73HQV6rivX10NNB3eYM3iFjw/8BabajaXQ1ZumUpD6D9lmosTt6oDbhlCL+DZBCREp46
         Lqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203599; x=1779808399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpC2oUS51Lj9ty9gOUkVj4nIoOC8+fY+yRPYKX23s6Y=;
        b=Y9RREAis1xuswZJbtFfhrl0B7mneHOPDgrJgdNanwL2fjgev6x3na0ZSeTfiQJiTFS
         GKQQIoaorRcs696mfBqEJxJwbFRGTp+BBK8nDc0m/EcqFZu6e5lnedKHXZ9OikEt7uT8
         0Xi0VTOvjYUsTXEN6t60mTpgW6jdqPofNZxyIZy4ygU/2SSD3bFTJnwZ0NAq85KLzbPt
         YryFtJ+a4sAYQ77jdhxqq7nAZLJWtSemcQH+i7LwzHdf2rUSQA/JwrP2QD0eDVlM7Fvl
         Z007iDu/Sjc+KcdLdcYLcbZwdS42bwcW2/rUrNyDT09p7C700OENf6nODrDX5LLVdMFr
         kQBA==
X-Forwarded-Encrypted: i=1; AFNElJ+T5R6yh8Ucep8Jyzh1ELFxTTLDgdfEtkk0hLbu87CGwsufiQZfntm/xZpGnmm+8YWgGtR0caof+lY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNE+xfpy6eWh1tn2dIEo23i7k2Js7EQQEb18yfqrqtPed/4P8R
	X+Y1VfDaFcrNQ8GIYVRyDZ41FcwyWXXCADaA9j4P/y7eiKAZKrkhaScM
X-Gm-Gg: Acq92OHcPyK0FaYUkAAtQaQrSJR56LlvmXJGTss3QOxGm47hSE33H4Ym6kIEvTTETX3
	xnV0cmji+fojBYBxxuHDk9YPKD6gfDVO1ys/ooFT0NEPIUNNATvi3QxiSV2I2nV9ayqcR+DSC1m
	gkXDkCH6ALgeaMmS6zEOcOSVIFMasin+iwRegAe52B19+zYHWY+qUqY/AmXW4eH37qbRgsSePLN
	9tBbxiHRLKz/M8vFxn12ywiI/A0VP2+IZs2r1k+TTLwaLx+CVHnc+4tbZwUB5NdN4GzpcCSVSPT
	Wrf2xPKEQSmGtssTPCuFk72mgQHRTnjzBevm811/2VFneqroNh0PHYDp5mGeHfDKgl8DXDIRF2Y
	09wF91zGfkaE/+DbU5N8AxKjePz+o11KnPNVrvJ483eRelB+u0bod7X3n2a2wybRG+MlzkZ7DSV
	34fMvoP/26QXQzSW2FoBtDZyExQQ==
X-Received: by 2002:a05:6402:e04:b0:67c:5745:ba00 with SMTP id 4fb4d7f45d1cf-683baa39509mr10623913a12.0.1779203598493;
        Tue, 19 May 2026 08:13:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v8 0/9] media: qcom: venus: add MSM8939 support
Date: Tue, 19 May 2026 18:10:45 +0300
Message-Id: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwU7DMAwG4FeZciYoceKk4cR7IA6N52xBtEXNV
 oGmvjvpOFCViuMv/f5s30ThMXMRT4ebGHnKJQ99Dc3DQdC57U8s87FmAQqcstrJrnRNMEFO3F+
 LHBNJUoBkydvUsqhzHyOn/Hk3X15/crnGN6bLAi2Ncy6XYfy6L5300vvPn7RUslUhUQICc0zPp
 67N7480dGLxJ1gJgHsCVCG5wAjROFB+K5i14PcEUwVoGh0wRh/0H8H+Cqh2v7BVCMEm5AjQUtw
 KuBZ2b8AqHH1EboEYg94KbiVotSe4KrAL1qHxGJTaCn4t2D3BV8EYcuRSDNDgWpjn+RsxifvIU
 AIAAA==
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

As per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v8:
- Only enable vcodec clks if power domains attatched to them are
  present.
- Reworded GDSC clock commit. Frankly, I'm not sure why exactly it
  happens, I only know that if I don't set this flag and pass control to
  hardware, the cores won't power up.
- Extracted conversion of MSM8916 to a new blacklisting mechanism into a
  commit of its own.
- Fixed GDSC power domain not being powered off after failing to pass
  control to hardware.
- Reordered commits to include schema first, then driver changes, then
  device tree source.
- Link to v7: https://patch.msgid.link/20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com

Changes in v7:
- Moved codec blacklist mechanism to be applied before MSM8939 struct is
  added.
- Vcodec power domains are attached with a managed method now.
- Removed duplicate clock rates in msm8939_freq_tbl.
- Redid the merge of vcodec_clks done in v5.
- Removed the {vdec,venc}_{get,power}() methods and moved them to their
  respective core_* parts. Vcodec cores are now powered up along with
  the core.
- Switched HW_CTRL to HW_CTRL_TRIGGER in Venus core GDSCs. They are now
  powered up first, then their control is passed to hardware.
- For now, document just the change of halt check in the commit message
  of setting GDSCs to hardware controlled. I'm not sure what happens
  exactly, but if they are set to BRANCH_HALT, probing the driver fails:
  https://pastebin.com/EYQekR1p
- Given the power management behavior has changed substantially in the
  power domain enable logic patch, I removed Bryan's "Reviewed-by: "
  tag.
- Link to v6: https://patch.msgid.link/20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com

Changes in v6:
- Added a more generic mechanism on blacklisting codecs.
- Reworded a commit for setting Venus core GDSCs to hardware controlled.
- Reworded a commit for adding HEVC decoding to MSM8939.
- Link to v5: https://patch.msgid.link/20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com

Changes in v5:
- Undid the merge of vcodec_clks, they are split back to
  vcodec{0,1}_clks now.
- Extracted a dev_pm_domain_attach_list() call into a function of its
  own to reduce nesting.
- Added missing "power-domain-names" required property to device tree
  binding.
- Renamed vcodec clocks and power domains to match other Venus bindings.
- Reordered commits and grouped them by subsystems. Now first come DTB
  patches, then clock, then media.
- Removed "status = "disabled"" in the device tree example.
- Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com

Changes in v4:
- Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
  vcodec_clks instead for MSM8939.
- Inlined video decoder and encoder device tree nodes in the driver and
  removed them from the binding.
- Kept vdec and venc methods for HFI v3 separate from HFI v1.
- {vdec,venc}_get() are now called as early as before, since it is no
  longer needed for us to attach power domains to dev_dec and dev_enc.
- Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com

Changes in v3:
- Added missing vcodec1_clks to resource struct.
- Removed enc_nodename from resource struct since we include
  video-decoder now.
- Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com

Changes in v2:
- Enabled GDSCs during encoding as well.
- Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
- Reworded commit for marking GDSCs as hardware controlled. Same
  situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
- Clarified the reason for missing firmware-name property in device
  tree.
- Clarified the reason for moving vdec_get and venc_get for later.
- Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: qcom: venus: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (5):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism
      media: qcom: venus: migrate MSM8916 to new blacklist mechanism
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  42 +++++++
 drivers/media/platform/qcom/venus/core.h           |   5 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 124 ++++++++++++++++++++-
 9 files changed, 293 insertions(+), 10 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

