Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184157;
	b=uNYlKlCafOl2YQlTGA60011OKn/E5Q1BRHo8WmHAJj6P32JzvGfZabTUkTzko23mmIJp
	 /VDE+uoT19Y3cEOSXpdYXKkFik8qIrN/DwYT3Ydfe5l2WL3/gaFcMWsjRzRHGXegbwp5h
	 QdYGnx25FFPZkPacFRMvy/VOnmPM66DXUV8f1ZF0VDvS8GfRc0TamH9zMonaHqa7v44KL
	 7b2nP/glmfD8gInL21N8hdYhqyn/Ij1AJTJJEQSwpVQNCeucvxN5E9n43+lEkxn0EFM9/
	 1xuY7bgzvaF3HI2p2oxtaFreMNurNJHPq9aush+29spMxBPwIq6wLF9k/vtETxAsJew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
	b=2zAJTZ5fYNeQemEiHHV+wwJOZwJyPyO32wVn8jLa42LU4GeS1crMCj4vAwuiyCJi614s
	 6c8Sofgnfrqjsdlp85aIucttqOdYMxD8etCQG3HjGhTRBHuY0sy7buf8BDmW1l9h7A2LG
	 6M6GnIuXuGFz7SI7RT0boVM/rRURHnSPf84Ocl6ofd7yY+5RLayqvHbKLaY5AmdmnO8pW
	 R6MArVZGLtb73ajs8TKB0TneaEPPpwkuehCoyixDHO8V3+22lcinsT+kqiKM8kKOajpGg
	 2P18u/lU2zCULxVhdStRbBJ5HjnZp0BNCLTOhPPtQjzv4g+EibGUX/xo7T7D5Q6NHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBFF606A31C
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2384525e9.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184156; x=1794788956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=XeHVO1eHmzTpneED2NyUHi6QH0SGLEunvqndFg4qax/rhqQtMVeT/ES4fdDAiF3YTB
         ILc5TnUa0c5R1wx7DDLpX6VKiRNuQOoU/VVJ1MGfRbvSl9QKw4fAOF5Lw51dwGeYQ3QB
         wi4c+IMQqigaQl916Xw0Ad58fDMEHwobfwsei6eBkDruR84dzSrIE+VV23cjKD1Wq0Ys
         au0dWvo/sZ9LO//UrJHDYp1H+Do0tB7b0Rlx1GtRJTO/oDOzpOam2Sr+0trDj0XvFS1t
         m/JKtkd7PtVoCWJWOnRM9Vk+R+x/VddsEjWilgWqy+Pi4vDB2igl0gZOFOVCSruYILYq
         AMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184156; x=1794788956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=q2Cm+IHBvi//V/ECUyvGCaPmwFpRt+g5EVflEAVddcxH/oSAzM+bVFH3KdI3pp1qLf
         GUkxI16wSKxgWSZZuvif9FUdgqaIEe9i0UgdW3G9NpK+n1RdSUFVEIOaUAfhUraNqMX5
         8c/Rcb7a3BH5gSKb8bPYeGFWOzuxQTAnYYK+oJ2UkewqE0txIS0V0nbaeg2hi8o4d94C
         s8SYhh2eVv97rv+A/FsU2ZObWWgB0GlxBSc4CNd4ZewTWoiStHffq7Xs0t0gBSTgEgiy
         Mp4IyzIKEshVQa83THjWn68yw/Bo9psBlNk0coVs/PQXY0TZsNC18mDGhqAjGMG33uIJ
         cEcg==
X-Forwarded-Encrypted: i=1; AL+hErEb2MSUyzvKX8mQ8dl9DFoUjuoJNpaJTQ3g2A67LQ03bAXwf1bIhCYb7VE7NTBpZyipQCYWKmqL9m4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LGYNU3VZjWLJi8JpD0gaJvsmQVxZseJ77OHLvFXBKErIbHVeK
	AxjdgDd6xhH0wOk+23zLx8OkdMjA7JpY61ruqHY3YDdoZh9VwmTuQTpj
X-Gm-Gg: AYBFou08HVjEGRs4aVYQqreg62lO9TjmL6PvPv+Q3AGZJZd0utLODI8b8Fwa0Fxjkap
	EpbjaRWNQmA87fip1lDrDQhRhdHfNhNYno14zkkQZrDcieiRrwFQzDi8gqJLToaAcWZ1T/kMyFP
	AQMB0mJd2YRc2TEFqeZF2KMl2z0OXfHmLNIS+Hl5WEmr7LjzEzf1EIjvppQQtOb8Ohy7F+rOyqr
	YkdLxlum9JzrRa0rS3l1WTfDaofFxxA09qiE+PttngRkVgZXbIGUUu/2oyV6FER41QcBr8wbpnO
	sQBO13MXZY1+i6PFm09MW40aEHrsko/bfJ8nbPs4hI91xxpamfZnqQaf/H0LoDEdTUQnqSYY23M
	bSrHkpjb9HEBA/2FQ9pdip1MnfOjJG71Yvcrk0X3qzKdxAFg4KWH0b4Nni6qqXGzHDWJ4e+oAiB
	WTgkDs8PFHyvamtay66DlHgPwoFo2F2GHJPHjkEBTbnAYRH2Gi3iqlZcqTEmHOf47tpy/DHeR4+
	VTKKMQIvmzlOEyNfEXhlyUTYMy2JvNRva5wLbMRfE6X/+KMCBIOnXWCbkxOhkXxTZ59A2m+bBEF
	x9/M9NLwMYVqBQTDBnGlFvsvfeISi1TlZXTN28Tv
X-Received: by 2002:a05:600c:314a:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4b963c74205mr50122005e9.21.1794184156029;
        Sun, 08 Nov 2026 16:29:16 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:09 +0000
Message-Id: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANUT8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwML3YzEnJzMlMRK3eScbF1jMyNDS4M0kzTTlBQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA6Hz2LXAAAAA=
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=1914;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=uKIpXSczL5GAI4liZmQ8OnhhHWMDKyKJ4I+wY+f+SRo=;
 b=jsWNwHFjnQup72vwLh+no3Ao6fRtevTWkJLU1Z/hEE5gAg5Re1X1JEkAl9lJnkkO0Q9uKeyFF
 5gBpTLle99/C9THaABeA1BqvXjQ/BbTsh8DHsSw9A3tE17VgISMKKtj
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

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
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
 drivers/clk/qcom/clk-ref.c                         |   91 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   60 +
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3552 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4030 insertions(+), 50 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

