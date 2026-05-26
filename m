Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A963F8883
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802296; cv=none; b=iksLypZ7dHqti31P1dbGX4qB8jl5Buv7OCRkyIh2snfqawAZ6lG3JjF+MR7TwCfxYE7PIq4oE9vo8PJeJ0C4VelDipsPrKwsr2Ra/bNXF7XljbVWsMivs706TQmAMY075FJTT3h8zq/FIqJMJZxRz7Dj46/evhjnjv5/NbKSv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802296; c=relaxed/simple;
	bh=4LPn246sZQ7GUeZYHYVe97OQMA2AVBQuSkUX8Kzlk8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OL/dUjlaODr799IzKZwuRwEs+E6PR70MtYjxI6OGXUHNShOqKFCEhYld/q1gyJ50Y83q6JjAqnal/n9YBM/PTnoNobBiSmcmmjz7A2TWrhH08yqmnlyJr9CKulwAnBMjhOg3CzVhdk8mvdrDVoo2wSuhmMnT4L5BDoAZC5Zf9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q892Qets; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q892Qets"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so37408315e9.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802292; x=1780407092; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n5ZbQUwp/G3ciXRXlB/UDEsWvDsE0SWate1awvibH8=;
        b=Q892Qetsp+LeVA+IAsGNSqX6UoXdJZcMVKcoUO/WdCnbA0lTkmdi/rwe4z3ij9kGsG
         bHQq9krG51CCTkCU+TBtgFwtMxF/VfbrfLJWI8xoECgHbsY5b6ubZGGYLXnZDcAcBfkZ
         mA0VgUdzBwmQF3DIMJVT1/Oh8HVJsEZhRqKy10YPtk3xHpyvDPKWyDyeqIdmV47lke9i
         ZIoqI+XQEHBAavCnqM9Xssosqru5n5QTU95pHd7+JtzIRJ3GchnI/Ichduz5GK2MG+qH
         WWqJYyZS4aZi9uIoqlmDdG5dBduCXYNVMdJ5O3INUU/MLP/Gqo31TUNpBSm6wPeJkWQe
         jhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802292; x=1780407092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n5ZbQUwp/G3ciXRXlB/UDEsWvDsE0SWate1awvibH8=;
        b=r4oA+LszVTei/FTPzKcpaUKTTT/zkMiPlx6xR+e88OeS4DDfQlbvqc+vFljVSWWOOP
         xCRZteR3HSgdqN2GIv2PhDbvLYwwOxxKTbKfcTF6+hXdWYnUhn0aGbH1mnkvp04p/W7n
         gx8EdyubY6LvcTpKU0yDaFzyuYeVw0Q0JmQR0NtI08FVpUxS+bKfLrR+BMW5GDT05gdI
         7xSYoL7jWzijDRkUpEl5ylgJ+JiPgCdobRtDnDz8iajkwIApE8jEbXg1qepWnnn9mDgT
         aKV68qLfD1DRPqbKBs4lt1pNUjDmLwZ+z8DYHun/duK4pG2RE61+981qgT2UJwipjXWz
         CyFA==
X-Forwarded-Encrypted: i=1; AFNElJ/a8TezDA6N2bp66Rl8uw0MtsEiccD49YMiyFvzALkdE70vlsK4v7LqOC2LzYuEklGaZeYXtf1JoYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvDJwwcZGj9Q2skJs8015vP2mP8Jj+SYWvILUflCbTwOo+S6d
	3x+1BI/fpTHgyUxCEcr9kkVk9KJQSUsWMSJzmAcJXNEg59L0G4RlT+PD
X-Gm-Gg: Acq92OFmRmTPkyo2OUmMT51uguXhOm07pQtJ+O6GjX3renmvsuLXF0143fdH/IK5Ume
	uMIHXEXEF6kSDUar52mTz22umgDQ+hWSmE2ziWwRGPuKckv6XsRVMDc/JchjQPPyDeMjfepDRzy
	dkbPCve+c4R3czaW3ICh96i94N2gSlmU/s0MwbRwHZ44d8DlmcynzOfCGL8+6ZwPnN45rtmR1jF
	PlIL4l6GHz+Fl113R/h1vxUAqJJ4IpSLzuU233/51tvF+9Suc1Kav9T3M7fJXvI+y8EH6AAwRuX
	6lG0MPdtH8PYoAvDzHGrQRpi6nMPiGyhVZpuaCVKBDi1MyNX33nKAeFMNQOgP8w/sn08rAclMEL
	qfbB3gQvXnhzuPB0fodGdFayi/w4RRxMiFTbjWvziq+S2PY86HwpQySdXEB9UxHBsaBCDog9uOZ
	oZu4H00UrHYgu8vquEgjW69XfLYyKeA50t4iDY
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr256118175e9.24.1779802292035;
        Tue, 26 May 2026 06:31:32 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v9 0/8] media: qcom: venus: add MSM8939 support
Date: Tue, 26 May 2026 16:24:23 +0300
Message-Id: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwU7DMAwG4FeZciYoceKk5sR7IA6Nl2xBtEXNV
 oGmvjvpOFCViuMv/f5s30SJY45FPB1uYoxTLnnoa6CHg+Bz25+izMeaBShwymonu9I1ZEhOsb8
 WOSaWrADZsrepjaLOfYwx5c+7+fL6k8s1vEW+LNDSOOdyGcav+9JJL73//ElLJVtFiRMwmGN6P
 nVtfn/koROLP8FKANwToArJUUQIxoHyW8GsBb8nmCpA02jCEDzpP4L9FVDtfmGrQGQTxgDQctg
 KuBZ2b8AqHH3A2AJHJL0V3ErQak9wVYiOrEPjkZTaCn4t2D3BV8EYduxSIGhwLczz/A0XolHpU
 AIAAA==
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
Changes in v9:
- Squashed conversion of MSM8916 to a new blacklisting mechanism back
  into one commit.
- Extracted passing hardware control to GDSCs into a new function. Power
  control is now passed to hardware after core clocks are enabled, not
  before.
- Set halt check for Venus core clocks to BRANCH_HALT.
- Link to v8: https://patch.msgid.link/20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com

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

Erikas Bitovtas (4):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  45 +++++++
 drivers/media/platform/qcom/venus/core.h           |   5 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 146 ++++++++++++++++++++-
 9 files changed, 318 insertions(+), 10 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

