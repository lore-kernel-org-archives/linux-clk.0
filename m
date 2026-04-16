Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747E3CBE7F
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347049; cv=none; b=VymVNIjhkyroCL00uVWaY5feJl0/PDoCgacOiO7OM0QVRjXTXRujQQrSJsJJu0HnNmzeeCsBF/PjzG58/xV4I3aC0ZApjZEpJWsUdhBF7fe0toFlAoUyOtT2pGYhRFYPjWNNLbK2fvosWuTs1dorVJQZ/I6Cw6/0TphmM4P69iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347049; c=relaxed/simple;
	bh=Vb2BjE43Rj7+B5nWp9dgRNQNG7l6Oph7RvS6ZEaJ7QQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wj2Oy81lp2fCvGc8nEx/44utk9Q8rwQquSk51zUsg5iTfN24onZj3j3MOIt4Th1FFCQ2SdDN7x3XEk5BbnKWwIYOm3hDynOFvPBIeA0Ub07LdfXEivNyaD3a5vdQfsME05kvJMIAdWyAE6g3/3hVUhvoooOjsQFBWY3psy51beU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJH9CrUL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJH9CrUL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so30526827b3.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347043; x=1776951843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=PJH9CrULMHMRp2wDjf2bfsZIb7I3ZL+ZhTVErbdCWEkNI3hWAdiKIj9lFDyik/z8uT
         ioDtXzEfn6s9jUYWiRg5N+15+DUHfKNrCvIjqCR3sIJL37QfK80JFoN97EBMtr5+mmJF
         6EaNZX3k14Zzx5NtJKhBHdND2Lkb0f5rcTCKLXrNmnYHz8D5Dt731HjYaqa+fNAXhQVp
         cyimAp57JnSZZprh3LrpITbBTDqijma2O0yAnG27VqPQRwVt2+PHrvkEg+H0x/ckTpVk
         JXGxsiEnLmRVVG6KqvIn14jIx/+cPucPIguij5c7N1rSugFwVP0hKAd1HmfSTjlpOKlg
         P90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347043; x=1776951843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=TYnW1rUe6iiZCrTVUHcJL8uQycqqvUk1gE8wwXqWSavfbcsgahFmAXtQvPaZHxBAVt
         bm8j1MXRJ9BRVOfDxt8RM1vb3vgHi8wyTCVI6lR+jXj1fsjIZSSUHhTSfgzdDPT+f3al
         AW3X3Dpo/rvGrT85s0iAcsspoi2iTCbHQYmgSkKGEaF8gRKEK/UPFG3ERv+E980My1xJ
         fH2gQs/2AqEGKXMABhTA2v9SgNu/PHMQCGmSewViXYgnxypVJ8CXF4CLvWrwiqtKm6IF
         x5sNbEnc0YFGLDORBHTotsu9v92Ha9xSv/nqZGI61sTMkNrixLm8k3NwokGfEIIYVxSO
         e+mA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZlOQ2JDJQL/ojC3Fyfaj5WfbFEjvLPW0bd+VBbdCyJiXdy775x0hzU6QiUBn86KOLEM2yVXV+kew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYlyA53Y228OKz/zaETm9CdHq7EesATB8DzRlORxl9Q4MP+OR
	1lmGtp7WtW0JweJUYGEU3dcqnk+Nbi/luOBpr8C71ZGtzNgNlwXmfEwj
X-Gm-Gg: AeBDietgaSL0mfm910KrdSy5FWbepeb3bsTP2lXW0uJy3aIW/Fx40cK8YiM7FyXVEpO
	gtfYgB7Wpgyh+y8WNhWlfmdvldUWvohLW/QkahvUQIiKmVT0tfxzOi6uci5rugEhxkUkWBPDvR7
	Zwsd6N8tWLbnEh01vaFZxykD3lkkrp+hWNHBFelRZ5CSjVURSuxSoqXI7xlw4g9/q+R0RMr9Awg
	AfdtMlRd1PLaV4UHp1+wtH3v0x+X8GlhB159y8ZQ0QY54svwNMobfy9s+PvG1cbDTID5cdjLwrJ
	IyA4bD5yeSBXhTBs8RjbPF+toXm5A5Z/IKNqOIx0nE6a/o9IzqKYcgfwuku9+REAhlgS2kk3FXd
	KFuRaySz7RK+EpXa2ZJacY0cQ8gtMbEEB4kadQ9Jv7SEAHf9AHHkaedKEDWyPNeERnnhIyP5yfc
	Nl+vvQoJJ5Ad8Ih3t8p2EVSqef2Q==
X-Received: by 2002:a05:690c:4990:b0:7b8:c19c:ee89 with SMTP id 00721157ae682-7b8c19cf5f3mr23684577b3.42.1776347042637;
        Thu, 16 Apr 2026 06:44:02 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
Date: Thu, 16 Apr 2026 16:43:47 +0300
Message-Id: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3dziXAtLY0vdstS80mLdorRk3WQDI9Nkk2Rzk7TEVCWgvoKi1LT
 MCrCZ0UpBbs5KsRDB4tKkrNTkEpBpSrW1APOsIyp6AAAA
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
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

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: venus: core: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (6):
      media: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: venus: add power domain enable logic for Venus cores

 .../bindings/media/qcom,msm8939-venus.yaml         | 104 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  39 +++++
 drivers/media/platform/qcom/venus/core.h           |   8 +
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 10 files changed, 374 insertions(+), 32 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

