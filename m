Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F03D667D
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312721; cv=none; b=maOzBLKR2y/nEwwAL+OLjbpGTk658qzKnqWyGWFN40AIdbzBFNtovhob+IZLkUQaGTDnqMwW+ZsfkQYFLaoCOVwl9GxQKfuYYL0dfBW4293+CMo126g3Ti5o2l9Mq8MNmLMX9qwb3UKHp2p9QUq2kImHmQii2UKKDy/XxXOCaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312721; c=relaxed/simple;
	bh=/8ZPi24r+2KjLGP7S/vkRpBzqTPelKRknbWu+/4Pfq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=shM/s37bHKf7RI5MXv/h1l8LMP55DDTYFJ7nb32ow/SMwID6xfhIbwPggok7ysyh1bzgC44yad3/Gcf34znnWMJM53gzZ4j9f6WbcafaikslX81me+2MF6Zg//a7I5hc8Iq9MM6FAlVdyGYxVrNb0igi+FLhuvxFBwzMncmObhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq7d2KcZ; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq7d2KcZ"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-654672a6d68so4839965d50.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312719; x=1777917519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDDYwvsriCdPFU1Y3E6YCoMsHtkfAqF5QUr0mwz7Of0=;
        b=Hq7d2KcZNoA0a0fK29wCEghyCF07aIfpeuEULvw8i1nmBHrX5H6SgK+QK1/RVZFA6P
         dgUBmXW/V3CGXeOLWW5neiXcosOL46sugrjwcu1QfsLapPuGaOgDqbO7T6fODPEtGFP+
         lCk4yYklxzZCv1EiNiBJRF6tQt/dsNh9CNV3w+Vg2wbOVFOSynpbIeo2aneHqlRyK8Ak
         qBPe61g0er2yEgADNBSve/4H81LHAhnO5XWGllTsTb7tUgbuda5Wh90/b1vrxNXghsuE
         u/W40jwDsWVOwTJYWTRt9QdswZjQd0QY20leZXUWC745XVIZbVirMKMC22Y00MaYQ5NF
         oBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312719; x=1777917519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDDYwvsriCdPFU1Y3E6YCoMsHtkfAqF5QUr0mwz7Of0=;
        b=la+24Ndoetl5vxCt0aQZK85WHianDCYbGBmK0uDujK7iUi0xm+ruRVslIHlOxvdg4m
         zSV/IlCjXtANLx9FD7ya5T6brE6HB0iPqS3RFTcSC4HoeKAs3rVKz7vZxdwQGZwkouv1
         CTdpmrb/QmWgNsag3Fm8AZHakBC/Ttp9gObi4FCtcJYbx9gyoOyqFqbtau2DpeNHxL+F
         hETvWj1/TTdRWrHKsguHsDG9qn21XXd0vY0c8wBiJdboisqY7aAqbIWutlMkn7W9ECOM
         5khLKZ2VeInlSxroOnIuqRc0o1zdD9yVTEoG1yFxKdbdDLSpMwnjPO0lD54hU9lDuJW0
         YBUw==
X-Forwarded-Encrypted: i=1; AFNElJ987POZrqmMVYi4B+pE2WaNg+b7g/GX4xQ1NY1RHHZcDBDbGONDezAl240lj2H8piq3Fj/vnoEz3as=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMAsyBe0k2AiBuGz/sfUQn5njnv44aGlFaPfc47OG5YHBG4zO
	h8SOilexjKDgodmcpsS++pwMXqwfVg9VZojGGGhGyUyIMTCm2ozofld+NfBTh9waXEI=
X-Gm-Gg: AeBDietTjC0iFvyK74CDkEEgng4nwuHWDADYtlA00iU9qfAK8UA3vEJRsKqKUZzwbxX
	w+E7JQNUNAIJoOpc3wwtV7oE8ZqwU+YhL8JkMffQIRBDOHhNaImCz5DEUx1YNEzy43LkfdrWh3x
	d5JHK+UAWD/rHqKoeEIatZ9w+Hc3DeAvJKQ3CzBI1TeD2favoAEjcWlkKsKYP+uUAEf/5cijwQS
	naogvXLuKeEAoSaELsyEit9z9Y7utPAP0Ohvalf85GuU+ZtYwwT3JeKsnCSy1cLVBiiaUQ0Zkrf
	eYqDStHR+eS4ueGuP/EV1c6sHAIkj6ZyuSFQj8YHOQ+rof8lGIEb6lRUFLQoj8bUElPNJTYsy48
	pvNyFuWCO9L+KVZ55r8MIBAJ7+h7y1wqJHAy1qspjine3Q+vlbzhBNQCZjsuhUmijyb/8XxAmsV
	I6hqYRchbUgeELtcpmcs9uWE2btKDvunoTesstL/RFADu1d3Y=
X-Received: by 2002:a05:690c:12:b0:79a:cc18:19c6 with SMTP id 00721157ae682-7bcededfdecmr3022397b3.34.1777312718633;
        Mon, 27 Apr 2026 10:58:38 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:38 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC v3 00/11] media: qcom: venus: add MSM8939 support
Date: Mon, 27 Apr 2026 20:58:22 +0300
Message-Id: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrq0pAxRxZWLiAdwaFzBMoUbAt
 NBoCHe31A0L4/JP/rw/MUtGk2WHzcQMOW113/kQbzcMm6KrievKZwYCpEgiyVvb7vM454660XK
 jkKOAFBPMElUQ839PQ0q/gnlll/OJ3b5HO5Z3wmHRllqj7dCbd1h2USj/GXERF7wQuUIFCHGlj
 nVb6McO+zb4DlYCpL8E8IKSOaVQxhJEthbmef4AoE2cMAsBAAA=
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

This patch series is marked as an RFC. Before submitting a non-RFC
series, I would like to have some details clarified regarding how Venus
works in order to improve and eventually upstream support for MSM8939.

1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
   for vcodec0 cores have only decoding bits enabled, as depicted
   by qcom,bus-configs property of qcom,msm-bus-clients children
   in qcom,vidc node. Do I understand correctly that these cores
   are only needed for decoding, and not for encoding?
2. Currently in device tree there is a video-decoder subnode for Venus
   node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
   subnodes. Does this mean it should be dropped for MSM8939 as well?
3. MSM8939 supports HEVC decoding, however, as the patchset is written
   now, it does not work. It can be enabled, however, it will result in
   breakage of Venus for faulty MSM8916 firmwares, because the code
   disabling HEVC for HFI v1 needs to be removed, and as per commit
   c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
   this would break support for some MSM8916 devices. What could be the
   best way to work around this?
4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
   vdec_get and venc_get later in the probe. Should this be avoided, and
   is there a better way to attach vcodec power domains?

There may be some other issues with this patchset - this is WIP code, so
feedback is very appreciated. Thank you!

Also, as per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
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

Erikas Bitovtas (7):
      media: qcom: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: Enable HEVC decoding for MSM8939

 .../bindings/media/qcom,msm8939-venus.yaml         | 147 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  34 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  42 +++++
 drivers/media/platform/qcom/venus/core.h           |   6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   3 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 11 files changed, 430 insertions(+), 33 deletions(-)
---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

