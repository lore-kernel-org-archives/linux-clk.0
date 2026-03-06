Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A2B369223
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804927; cv=none; b=dJ3sx/AlxwpMDs+uaJ7B9v/1dRQzI0ll19ZvkiM1f0hTdkVlHqmfXJYpw2wMK7mhwpmoq6hHaVQr9wS2GZToFZ8F3G6yYp+5RBmNFa146Um2UFcbiJhnE1IiA1AlUxgWUcq3jgofww0YtpnodlQwXZyOLwbFVHuIdlT5h+c9WiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804927; c=relaxed/simple;
	bh=tHyTmNiv3FTZ/H61OgV2oLKpsfPNjLHaPzrbeiCniH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8Ii/bHvNK2yta9vmGa3japsasKn8UvYB0vdHZNUKNnZoeFgg9Iq5smSAp2RdEkaNp7SChZp2JIRj+Ve7K4dYhxnEkzjScZZHfD7/iLxrhdlar7st/4NlH3xMcvgvsjhQFGDK6u7Ift03YPlSp8fPQG0NvzV/LrlKsAfVo1YARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rLGgAIJw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rLGgAIJw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b790af67so3468273f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804924; x=1773409724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHspA1nMRRBKEdBmLpX8hhFfkCXZ2adzsDZvyJnXm0g=;
        b=rLGgAIJw7BXlVX6FxlAkIh2yZ3H27oHy/DkVDrW9N/dDCIujL7maXI0XuJ39WQJhOv
         g0EqpwRP0EJ183KR/QHVpce1NncGU8pPwqz8vTgehOtAdEtuObSIhRnQkwahZCByN0uf
         0MshdaYGM89XkqlS5SuTuh8N4x8zRnRfsg3wOSGxBMqG0FCPj/rh4br0R1j1uSo0epdH
         u7Fatw35uyWroEk9w84RUwDs35nh8Q+SaJMIzCkUni4Jm74/pGLNSIj62Ba70A4K6Im9
         0s19HIekXYnfSfX8EVCpeSaw9ZdiS1FAJRB0b97Ybbie7LkWrS3wKGrruH0X7yiEw13B
         uNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804924; x=1773409724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHspA1nMRRBKEdBmLpX8hhFfkCXZ2adzsDZvyJnXm0g=;
        b=EyHaIEMLYMUvEVT5dtjI3BiqR/HQVhMoTHU1GMm9rxHArmH7uxU/pdgVQ/c0GadFIN
         Q/dSf6hRCDImgzZrCd+VO4xXQahLpvafpjZpcJUTWren/LX4DgiffzgEFBm8gsWkREjE
         QqkvEnPTQI/XZLJRZgPXQOi//MsyS1HxlpolMWFAd/obyQdCsESe1l6FM3+Aht0aZ/t7
         1FsIvE04h8e7lF2TEKTu4pX7sdnQer9RYD8mXf60UkBFBmY1saALsbyfNRPJzAiBp3cb
         avCpfYxMz2gw2N6DmUFFGaf7VXDld1vDhJO2lPV6xbEMScdJ/Hdo+JGSAVHXFOglSFdB
         7uCA==
X-Forwarded-Encrypted: i=1; AJvYcCWSeqrXUumgJ3D8gOdRteRBBw3d+T8ZomnpJB0SaGlvUT5nhEHq9OQcM6A/gEwWYjWc7NP8JtY5SAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrbjDA4T9TWV8OigM6v3XW9tUwyfk0TWpv7q7QHooHrfO28EF
	tnZ4Pri8yqe9tS2tKvqNHTBZ8Igr8XLXnY1RVsxEWTXWRtqxJXD8ZZwegP092ltD4qM=
X-Gm-Gg: ATEYQzw6zIrkXSdnaXF/tLoEs+wU9VnLQi9dLs0+5xADuolP0F+oQQev2fEvcIPfJ+z
	hOZIZeajn5x0nkgyfUemKoZD7DdLv3g5Q9lgp8omqkbmmCnKq6V72UZ6JvOY6lXGnTVhEtK3oou
	/g9+1MsoC3cgGSbDqvEqFc1HBiPEUnUk4WaY3xMiPe+Atfj8qPJECX0hbRVSUmtfT+O5jqQ+kVY
	KUU5TK+txn1+39bE9OHLyY8NVvnrLs7ZenO14eNT0CuZisZ47NJz3NK2YwYfKVwDgKo4J7wK6Z7
	b5y+2J01f6x0G1JzonWUcgjI4O0aVwHdd+qv4eAiHwsZosCECYv7qFT4hW50G30HeVY2L9oJ871
	1kFZqQzTAOUjqKzMLuAR1A7nQo7aX1B3YAJx+NFE8O5XkVIKNzZALmg8bJziVgXenkueOstp5n0
	WGlWNEcYKQ6N+0en+chS0eJP8MdRwMoLKXAvtcNxxjTCsSFAY6FonO56z8+wAsxyk0g31SZVXKr
	1F5
X-Received: by 2002:a05:6000:1a8d:b0:439:b79d:b9a6 with SMTP id ffacd0b85a97d-439cfc2e4d2mr11182498f8f.11.1772804923848;
        Fri, 06 Mar 2026 05:48:43 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:43 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:38 +0100
Subject: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=1876;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tHyTmNiv3FTZ/H61OgV2oLKpsfPNjLHaPzrbeiCniH4=;
 b=4pe087HcAY+QR4HJ6YGSGYK4ICTRgOj/8Hw/nMu1G9mRpX2w56izbXTkcBw02XWagU9dot/cB
 1Z9e0EOR3KdBBc9jDo0Ezlux02aqD0/0sCLmPhx36LU7cxbb6QH6+Mf
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 90ea21c3b7cf..155830140d26 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..d3899420d6f2 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);

-- 
2.53.0

