Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864268;
	b=hRSTEuAboPjaoRgOO97/snvqkRuuLkd1ScMrW8ptBMmGbdyPs1/BdiG4UeblSdCka6Fh
	 3feHpe7XesjtR+tYq4AF0MuzXGMuDl0QcYHx0dC2abnLfJLYnhvSM2/9UNa+mYyXt7qCx
	 a5y/KWlUFCrnQzsV9bSSWF4sjx02TwNFAqzksbDxprxJZJ7wd92mwvozvxjgTY7dnxIlR
	 34PNC79+ExWrXVtGCPs4S/dAYYOqa6OCNS0z5fPKJZN90L6LazhA37sInoTwx8oKJ1s2J
	 3CwGtW1MCQ+MqGs/T2Pjj3tOytTeMmDJvBuBnmlp3HBXHNNqcbxiePMCSffVk7S3qSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
	b=ECtWAyLCXlz6HjbwpwR8JIyWfOxt+ZvgS7kTaWmy1vhAG9EFjJ6lJfkvf/Rak8GxnjMf
	 fU9ZfXI97sDRUwFWVKdOm9zaUrWI6uyhn/G3GHQqftMYuF/t7q7p9l3ntdribqHg6I1pl
	 sV7ECYEPdW0r3eocK6mvNhAo3yCtQaYSmRRfqNWzVw/DT79GGmONlVLUIRT3ltBDpFeEv
	 5i3dg11kITA6IOjx4fanNlgfnzIgjXG7fU7zVwydV+Byd9Bjr6vIhnjyu2J8brsghJskN
	 iFVs5D8n+XTl6R1M+HtV/lWasJBA+qU3VMFc3RaZ/BPE6KyRNZD4RYHAtXrkGq6sezw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837FB606A322
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837FB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so193608f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864266; x=1795469066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=juy0Ini1YCCl1DbqXHd9Am/uDxlGe4PFtG8GyDtQM8Yy9fqEcKuyZCICFaQv0iQXET
         MyHh/WhuPMcqOVXnKk6qJ5TVHBCO6xMMlTCnVGdITFJg/lS6vQxgH4lg4cUp4p1GlYVp
         ihdw0RrKSjzIDIyOO9eGusBtzL5aQg7+n5GXl8R2HMOHo2eK3o6Rv3NtsX0+QTf4q3Zf
         TAG6JVMp2Lv9ACtz5tf4kIQq88jSD5E/bAGRX+s4McU+XiYW8lBnBr11zLMsfD4SKCG+
         P8+tiYvPyyQZKtBEZMVxF+5ox7ZrVBsXl6rDYZMikOONvIAriDSdYHGbAeZmUTjk9vOf
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864266; x=1795469066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=odCgF9YctNHlXPjItoD25sevNWHjU4E3hKBvzCiTmN1iJ51S/gx9xoQ05woDmRzufm
         2GyaZcWHGbm3hM+P6DZgqYtwUlyToi2ZxCgMMbL3m48eaHbz4RA+o5OosJ/1peJdrrJ2
         t5kasMCmZnAyt6fi+qJiCPgDCQoLjFGhgTbt5XFccPYYLFWy5JFv6GJOoXnV/hlbfy/k
         2V2TtopwVIzwTgNX6c7VAh53vE5METWjPsrwStcbFv+KLV4pTT6uWpbQunAFeqWb0oj5
         dLHWOBrKSlaxZ1+dHnW11HYF4O8X+bqGCjbMVZqbTMcl5PMKcaJnotf/2zphqAjcK+PN
         xknA==
X-Forwarded-Encrypted: i=1; AL+hErH9Rm5IuBxA7zB2OilL4inA6Jwiyt4zyVM9YbEAz8gEE7thluFdjYxqjrngViJMwGArm0kIvvzDwpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QppVYaKt+1jUZXBV2l6MJmyOsUwrCD6CAMydxceQ/TWwpqaEs
	WieBRRTAnqVhceVr/d2gDnTT/h2rtuKNWx3tqQRv3BpLMtOXKCD84pyU
X-Gm-Gg: AZFdTZdQ4BMkR4zdSDtheUTn/1VKAfSX58n4DNw93F0TXX1UiNx3TZSfa4qOT20mWqd
	8xjKF5+H68bVQEb/BTPEASHr1BVpupI9vaQw662dbsicDePuBssveYqEwyvsbgbkZv+ApDf0cMC
	pApOwFypkIi6QGP0kfpoXZKwOGeYG9UEUrohnCV6ts9Sawncr85OYLWJAw/dwNZNRwfOaK2TVgF
	i4M4QD+CIBszh+v+NNkpCpgxPb/SKWFKkOk2DBFk95IrZY9wWOj7grHtgMLb+YnsaXaxRKJCzEB
	TkwI1hVf+oM0D2gmb7DrGiv/PZF96ATsJ43d7K2pJ/x5uXr/Owkquox1hT4dxKTvd/o/EaxJYpB
	zEu2qglIIWUwG9aZFz/wA3Wf6gkowo/QFfsAxPT+oa3tM2FVGtCORn0Eqim8A42T/YtUCr7qKnQ
	h1caLKS8Iim3bSh9lktmGqs3Ikm33YdTkp5ItJMiVf46a5ciSiEm/OnMVPX5Jl8aNrbRxKSAln2
	xxUSV77ZSo82/yDMTN1gbqfWKYl0iPjqBI6ChwqoySQKAHPbK8MNjBMHeughwmf43tfX6VH8V9j
	U6GK88GZGQAma8SypFeg3rLe8x6+TXrYbpBO4L3g
X-Received: by 2002:a05:6000:41d7:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-49c7353c794mr23553821f8f.46.1794864266042;
        Mon, 16 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:24:18 +0000
Message-Id: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ0+2oC/1WNyw6CMBBFf4XM2pq2KAFX/odh0ccAowVMi0RC+
 u8WjAuXJzn33BUCesIAl2wFjzMFGocE8pCB6dTQIiObGCSXhRC8ZJ1yjqxamHEPlhdSVLw5NWd
 rIU2eHht677lb/eXw0nc009bYjI7CNPpl/5vF5v3S1X96FowzyU2uVamRa3tte0XuaMYe6hjjB
 xff0P66AAAA
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2616;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1wKNlxbUO05hN5xuomY/VWb202BKFBlZseityHzBS6g=;
 b=QLeMRLS3lJhKq/slwW2g7GS+lXLf7jP40aImaALzbPkpD1trwZ+XOVRhn6iAC4ieIOkTp5e6j
 v7kaITBUy8mAfz7eyrfabPUk1zp5iwyVBaDR5tE9u/x4K+DSeNrTXCG
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

The series is based on v7.4-rc1, like clk-for-7.5. Patch 4 conflicts
with commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family") in v7.4-rc2, which touches
qcom_clk_ref_register(): the resolution is to take that function from
this series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- common: Return a NULL clock, not -EINVAL, for a protected clk_ref
  with an ID above the last regmap clock (Sashiko)
- common, clk-ref: Use devm_kzalloc_obj() and devm_kzalloc_objs() for
  the clk_ref allocations
- gcc-halliday: Reuse the wrap0 S0 frequency table for wrap1 S0/S1
  (Sashiko)
- Link to v1: https://patch.msgid.link/20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com

---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   90 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   68 +-
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3533 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4016 insertions(+), 52 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

