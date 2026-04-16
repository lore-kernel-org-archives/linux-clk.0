Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDF3CEB93
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347069; cv=none; b=rpqVgS5FWh1noC5VLrDKkDNg5GdNbgVHOGGYePGvXb6Kd9HUm5DUuOP4vSFDqUVNLmaRD7KhWJXI4R+Z/8Agz771C1PgjlAgsqcPbFdWqd0KId8eNgz/PMVMAuLzFrWLYQ57mJslr7ymNmXHC3FW1Y2ob/GIJVGH0lJ8RZfee/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347069; c=relaxed/simple;
	bh=YUBIHQ6vOyWADg6NA3iKgMyw3HPZcQRKnuaPJ5Oo6es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYVhViiPhd6cVZu3G8WknX53O8DbYadj6iEuaSjgERlcVRFb7pqfltAch0NKTrUsD6/6At8JMNljOXWQ58UyfNZ0Ag2r8lJiHbU5lzINhRi3GLtVBhTdKbGDsfUN6ddFB+az+GmCfHTFjV3WsjFiw2k2vha1jAX75MZurhFkz90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3KSvbNp; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3KSvbNp"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7982c3b7da9so78628897b3.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347058; x=1776951858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=U3KSvbNpp35twvtf3aPtv2dGsRzOTTM208QLC7aO3+2jMI5h0+oh1pkD4YiHStL23A
         Qt3RlpZ9uU8/nrbFem4a6rPWqPfO5u3ABv6gKHuYdtMEA4aMkOzBrrsQVTmuAvOo/xQt
         DYwbTtkUhQvpYkXEwZWzKgHsCC3m0EerIyeM+Umb4/tcfdXk3p8+rvCIoK4T+igsNRvb
         5b+UhElNM2/4rWqpgYM6s+dUY/UhuuD5mv0DFeheXcSBu7/RCnptMJ1wjSGCVlmEyFz8
         MLTMJp2qxRfbF+bcTnnO4GkP1Rl5QU/fpNC+iwkUkQGfQleHQyBdGy1ie5Gr5tPbglsU
         nLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347058; x=1776951858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=gXoV/MHmeIhHJLOSzytAzPS5s3He4bIYgIF+Re6jKNXdzlkCd1ZP6ZPe8tXd615Rrm
         eZ8BBr57tMTUEDOMYSL/yOUaahZllpzV/j4DeVZQh6HyY44dd4+GkMjsuydvpyfwElF1
         qhSCgd9nysQWg+XcRMie5FqhxjXUJ/CMhPzNdxlbvYP40qWHLvvw//gdPa9iv6U2PuVS
         A3gGQVPyjOPoVBOTsN3A1YTFsPApXyctHuScHfUexNnAlp21EjKvFDM7v61RR0KnyGfw
         9WgV7PJLFzTJ614svtVu6GX+BZP4xAMYynrB+dcK48QyivnPal5wLRGnQ8CDd/Zp6jyV
         F7XA==
X-Forwarded-Encrypted: i=1; AFNElJ9SRpUy4UCWPrDwSBAB/OnHhS7jAfX1B4SKJ3jYnKqWl1PdYgVL0LUNpXGV70pup06tKLvW3M80NAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrqdEtNFYy2gAEgtMCAkhbHRGGTepxdD1lOjfVl0jrEsvkdbG
	w5NbyaTtWy8dBtRc/JhsFEriGjRdCdyi++h2XQx58wXpl0uxMvq4sOtqCGkrcN9Mv/4=
X-Gm-Gg: AeBDietFCgWrG+UIKC4GIRGwJ/wanqn6yIyzAVBFCawmxjs9rw89Q0tdfGW/dHWtygT
	SuuyLpQR8FwyCbWH5RurDhIku6sJd4I1PftctCW1hY3fKFRprFDeM2iX7BpvOFaVRm8WIjv7x+O
	xV2HlbxzO4sNdIXeNUqOEJUujjyHD7tOpHi0Q1v/qQQAu4j04UKxmtd7lSz8PJdGrzyXCCCuSGL
	+1VZAYGGT7WKVm3ptXA934XyYC7KZFy4+5Er11xom/6DVFMzwLG3jOIkGBQClUeSOxuCQYxmXTM
	yQbEuGO5zf1smLi2GsWBJqRkqr5c/He5vLWh7HnrnSLxNmXKdza17QUNde9m4dNZCMFaoj23LIs
	kqIqOGkMdTDty5hO6AwLWZ5tNC3XIebKkXLmBhwu2BEcyEadvL8SEXNHxVWh9xWOPUspy/N4QjX
	6lomKOzcLbSlXYESnmAMNMNLy2s2YYav3hfL3T
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136804687b3.42.1776347058339;
        Thu, 16 Apr 2026 06:44:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:50 +0300
Subject: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.
Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
vcodec0 so they can be enabled accordingly.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..b67cf1628f1c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,44 @@ static const struct venus_resources msm8916_res = {
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
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec0_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1159,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.53.0

