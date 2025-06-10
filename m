Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC22D8DBE
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564400; cv=none; b=FqyofurMHA1FiJ1Q+U5V1u7ua2QSem69IiyNTo545galPimlLpOK7xE05kEMZLbjdHc/kV5MjGE6WwU2klAJOJM2sPQclDHwQ5GIqlDf0e4Nac+XQ4aNHC/VwMYyobqWWKIl5kC3Mk9/f2hG2v+ru4CcKXokgLEWaaDxLnPd06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564400; c=relaxed/simple;
	bh=Ez4rm6PFGrlujB66CVWxeGwNOdP1q/LlPEEBuX2j8C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7W/yfS4o96NQY/CTchBFlJlm5v5XjGE/S3eddkIgavK6OyudX/lmlRBgPHMXrnZ+lIaR5HH/eRP/ctdhKTNCi/SNfMZDzBt5azAFNQwQCF8PqVDqDNlbsbpZk1Hajtmva+gV+tSSlJAHd+Ux05vlgbYSR+3MhTmxRIwAZ2C3oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFbUKNOn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFbUKNOn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso5767315e9.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564397; x=1750169197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhJitdsInvgOOCf0kNoqN1nTD4JPV3++bcIAyD0Ca8I=;
        b=HFbUKNOnumaRPpCOBpghWfX7K/MNC+w2rIYpKBU3RsdunyHaUNz+7d4XzjGAuoGuhI
         7L5dd8Uc3QVzO9QutlZbXdH7vg0duauNK9KnRQEomJc2BgmMKzMlBSfbpYJNq3CF+CE1
         GUZrQzmgE3rdVeOXDbcq1jYp6eD5L2N+t6Pm/nmNYwuGD8ZV3A5BegKonZTNb2DPXV5B
         Dys3gFmfRv+AfzT3IhsWAKfxD972EZXdY2NrwwUgfCXM4HwmkMGAbG6noIDHY+KztkMK
         nr1hh4h7A1OlZ0Bd6f+XOFueEAOwOwQgIZgYDjpHCZ7T6F6ai/d2eETIEUZiZDS6yIKZ
         9XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564397; x=1750169197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhJitdsInvgOOCf0kNoqN1nTD4JPV3++bcIAyD0Ca8I=;
        b=pWBwsybIX2OO16il6cTUnpqcEdUOTkGhXWg7cMokcTEULs5/2ayxWFL/dQKdxsu2qH
         xDo5kkpOI56EDCNmbDGXd4m4OOdSzMYvp35s6gVt4sZDbJ+7cELO3/iuMleozOk3bKiL
         8h5jrYkOc6ajYR9cMMtDF7dn/TD2AM6aITLhrMWhdyUG0II2p4Iow2rAHK9BcU3sU56K
         IrUxCfSgS0ZEjDMkzWyL9LFyEWEPAmUJkfCj9pzH8cvUeHVdcXWspg9l6vVv7MvCBNaR
         rwtIrqE05HHYpi+Sn9hYxVwI93D0HGi+nCj30Rz54oEXW/qbPggT+6wFIawSnk4R530F
         WsPw==
X-Forwarded-Encrypted: i=1; AJvYcCWwrV8X6TpjbFTY7bJJzEt5XMWxj4XVrZv/R/uhXdyOhKo9wn6KWOoapC3TZTYUSAc+vg/fA4wKRHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUz87Er4P7SOpVhjrA9LwQvawduv78ytD9X3QOhF0Ar5ho5CZ
	Z2cJ8aphEE5nqWunkmOeGI+5MxyJYmnp0xrjVnHFxkXecMwIsaUWdEU0VFzuSjyS+9A=
X-Gm-Gg: ASbGnct5JE2R7PrpfPMoyGlS06dfLDPy8md2fPAr+mc0+Q2UhcF6zqVfiDE25GtWDQe
	yUn63nAwukbrOT9S3a2FTvR9pZlcU3HkKiA5IhLw4s/fL3SneYYwdC8Z9eEAuimjAR1yEjFxFdx
	PjO66ij8D+cLcPUceTHPXkOfEh+GcKe4/M/Uni42kkNXyIc7Be2+Ro5+zT7pVnZJuI3SOLAMMqa
	EeEaRMSAhhZ2LUnWOkRquLrfZLSmKfQHCDybNr8am9QWSsoyOHWxpn1eFwFw6NyvR3sMiW9Sxzt
	jnW8I5//WhPxnnMwWOVFL2x1wUy465z4H7CCfi8RsY3hDSII/+nSiviCbTaX7TExjm6edN4kjot
	L7gLKpw==
X-Google-Smtp-Source: AGHT+IEkH48jxAjPmiEs0V1xdB1+qZh5Jetyjq3/Ap+Rl/OUN1o0Eg/cerOxzkAbgtRzEPBpAjOIVw==
X-Received: by 2002:a7b:c4c9:0:b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-4530bf18a02mr23985445e9.5.1749564396855;
        Tue, 10 Jun 2025 07:06:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:51 +0200
Subject: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ez4rm6PFGrlujB66CVWxeGwNOdP1q/LlPEEBuX2j8C8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvKYX8JuZ1utyAFUJbhgbb79o5eUdq4TvxK1
 hFfk9Ce+16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7ygAKCRDBN2bmhouD
 19NHEACKFn9KQdCuFYHuUiAx1SJj6eWYi2vMCctzJy0GkaTeERePkDCenqfQWHqMJqqGadJIt01
 beXorV+bpdEiyCuukJ2gh16oYGdLswG4iyUIlqD35bMqNv6OXQgHA+AfRoq44t/QPJwL4yu4eQU
 UjdTG+5B2AyD8RfNX8FfdUaOh5PPOjyvgcWeGxf4m7ZFNVOB2ar33N9nvwLupa9ecRX6z9wRchB
 6RTSdwwUn4kc7pwnOn3Ei0eorgR+VreMbzEi6sXDkOYJ5Ghat71CissNbX7lSBqofFjyBdMXMsY
 pgRx9IPqUbyVhI+4IpS0ntiYI/WysKbLt5dyD3HJMpb03iQZ8dDJqeBTGuquJ2YW6gwx/KSI5LI
 X/xL9Np6O5MesXjYg39F+DNK4SsyZE5HMRpNqP25BNWVH3fuRla3f36tS1Xswr6uWwajfsyal6G
 u1ksimaH4DA7MIgnq7CT3sThAqCMKuYiewP5+KHR6pw0DpijUS2cOiEmv7SQQOxktzlUrjdWvtO
 P4yEAIMQqRJpN5WK9Tzsdo6LUbLi+hYj6oX/M3W2ECeq1JNV2htKxnkAmiekL1uDnOkXuyl3Hlg
 3yZvxfv5wQndm/A/+hk3LfZgnKLgnavxakOlW08NB+ZcCvgKVJLM0FecSicaxQZz8aHE5nfa7Ja
 ambj9gvO8vvfGDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Linux coding style asks to use kernel types like u32 instead of uint32_t
and code already has it in other places, so unify the remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
-	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	u32 blend_op;
+	u32 fg_alpha, bg_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
 	bg_alpha = 0xff - fg_alpha;
@@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	u32 lm_idx;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-
-	uint32_t lm_idx;
+	u32 lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 

-- 
2.45.2

