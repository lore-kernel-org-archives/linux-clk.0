Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CB495527
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017563; cv=none; b=euFRtpm5QASG/dldUEep4fplSPHYdXNmgYI72UfRnWStp/VdqillqNnBuasOP5HlX/6esbWhEg9q+ZTMhu6uLqZ1pW6Cq6ldxdnYlABtqcIyW1W0BF2LLcpPKIhBtJFzR5CHQ6hwuwPaW/RLS8zJcRDkOWPjek8det1Sl9i/QmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017563; c=relaxed/simple;
	bh=vJYzAXbPfCbAJaswowQbOeDCxV6PLVD1NV5VrklEQlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6EAyrQUxr3QjcyDAkpGqQqmifrdRFSf/gTZBxcwy5bpgYJ8+H0nHIfODpCyobMDcGaiIt9b/zjuF1NfFB3RePJ4JdnuT31kZrqPyaeyrMVmm/yxjvO5PUuaC+uMfWMXnaTmAAQAsJ7QLA3mu2YGQoOSDfP2Qig2qBjGHx1GraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b03c5jwR; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b03c5jwR"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bd8cb26219so14462237b3.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017561; x=1778622361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPTICstFofCWSe/VAQJ+1i2Ou3dGd2vNpDTutFRZN8A=;
        b=b03c5jwR6c4yDMNz7aKs52mI1+zmkV0REbCklQSVLOrCIb30djAvBrGbMRQ13aoHjX
         s91cBORtB2SczCgixZqO2H+ehtoJcVCC5wm3U76LnPwarnZ8mKUZjNPqaPnDYkz796a2
         6pZ3hVbmurLRANHo6acFLGuf8u2p4E0I8g0XqGFQgAwKl68bHj9sv7X4IkC7ZKcOsdEv
         8shgZhicfQ7lAUE6xDo4hjl8YrnY4W1GpRfhBUB5HeFGNV1K7K8VGBy0cYl0Ma7mL8+b
         /gF+lx3NIDP0rUtmxXMKJJtA9RrOQUdvmnH+v8nuk0iyyUjm58+tXXgW5CV92MvpaxM/
         WF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017561; x=1778622361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPTICstFofCWSe/VAQJ+1i2Ou3dGd2vNpDTutFRZN8A=;
        b=F/5pCy6TeEd7pYVHg7v6BndmIACl64eFUhuPLei6oTXrTs6buuspGTjmDv5IlC9L0i
         i6gHU1lWolY3ZSkGyZwG2nTQpLaHkKPXfdBxKgEBlyiQFh0Ufn3TDsuuO/9LTyCAuN3c
         z7rbatV4moVRcgkrayFWNjRVP1CjUZODbSYGoi/LcOUFEx/RxgbssBs2MeucOVEavOxe
         3RcMfYLjXJm7HmqAliCKUkZ5Cr/dUv+UM/lnYC7L7qhBUBjnKLwEgtUl9O48A/xRe+v0
         Xf/BD9jRIOb2SDwYaRDRpP0nAs+cFSIOTMiQu6VXP+0FF0t2GhpDzqm2Cn1wHX8hg3Nw
         ljCQ==
X-Forwarded-Encrypted: i=1; AFNElJ998XvOc8+QQBD++yhv1OPsVChBad+UJkhVTAg8jE2eqnSnG8P4JUoFrIgGyHUR5t22orp6Y5T+tuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuEj/k25OtTPMNGvNpGSZXULy+r3ft3rCdhw0x2jjQ1QjCkpFh
	XBJj9WCEndbw4omb1Pz8kgMQ7m5ixGT0Kjbo7t9YjyqI1Ex613Xsl+Ly
X-Gm-Gg: AeBDievJQ20OIHoKmbfMwRrzSppz79VcZ7gLTnnwmjQdIgkIOSvpk31oWBrDt/NdbMb
	1Bl/Yg6Sc9B3VhxPH4q3yxy1nCQ52LzVyH7/WghMWUy1gJV4nwXiM6BfWye3PHTd7Hz+gxZ5p+H
	olKYCvB4kT+7chw++sRECqwXQITHB5na+xFiiMpKIc65PdkkMmi+2b68bPXKLONEpx4wzn01LKj
	LKo2wOLQyI3xNs7Y1Dwv3DjB21lvYGu4ZeUELYGhmfTg/w6whFH7MtaCC4R6vwGxRBigWLxlmUq
	xOn1yJwak55OLqB0DN77fDjy/e96WuP5YbHIlwBK6clryXnC9cv3lEqnwNwVNqCNEJP2PLU+NkB
	QXcZs+F7Yvf/cb2LzPF3cY7cNVem5cNQ8ZwpFsNN7d8aZJmmNnzQxcrGUhtVvpG7+bK4REK8ONA
	jpx+YXJyo+XJu56UEiD317VoKFlDf9qLV1fqJome44e/t+wj0Wgj1zpBdkww==
X-Received: by 2002:a05:690c:e64b:b0:79b:cf31:9787 with SMTP id 00721157ae682-7bdf5e6575emr8174507b3.28.1778017561163;
        Tue, 05 May 2026 14:46:01 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:40 +0300
Subject: [PATCH v4 3/9] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-3-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1871cf3830ac 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "core0", "core1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1160,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

