Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA622B8BD
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044657; cv=none; b=OKmuMtVB9o63inPl7WnxSDoIL1SxYhMK8RGf5WAf1CxePZ5WbCykyH5Y32r4J0yhqfljitg3JMKa2/twlYnw765te67MXxoGwvB01yylq/0mZj3HWXQhQj9omPd+cV+0IGhHSHs+HbbZuvlT6qUUEGfVbHDQx/d2CAnT28WFpD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044657; c=relaxed/simple;
	bh=nUWZF98ghIiDFehR/zBnh39AR18NiZdQyJkoLJFENPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUqVX+jppVhSNS+qmD8Tcc4KJ5rPjL7XqsnAf7mxCwZgoclzMzCnkKgvsy62wwjXXHpNfDL1vg/elzcOJU/u+0JjtQCtv6DNj9SbHX/rKBMhUXe32Faj6uGykBPdaRBqcje1r7h/+ZuoeGHxpNAlxRLpqyCOXzFiOq38s9DTHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jJUSA4tz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jJUSA4tz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436249df846so7453905e9.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044653; x=1737649453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVz8bC00NcJv/IZ0bhV7772W619cZqGGdaBgIBaPg8g=;
        b=jJUSA4tzymQb3m6boCKUduHg+PLTxl6bt7N55k7n1ZHrUY9byIxoQImfIl4ciwZcXN
         /DRrbDf3wwwM8VFI8+jozA0SKt7hyuuD7fVf7/dbL9QkwMkAo839PXamPxgTChwXwF0S
         ZKcHhlbS0dtqmeq2fM5LhCTeNT4/bR5voEKJ08lOEReQZ+c21KMsZC7/SoU0Fe2UGa+C
         lvkFDZgV7SR/isGpXajNc7r4hfm6RiJoCO2AWOdlG02r0kQyarf8NajoQ5SCJBFB/2YL
         kWG7/e2ZLHS0rAthLJNgqBKijicg9g31PQKKe+QHxS9jB31+X1Hwf+MHEWbwSLLZWF3z
         FDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044653; x=1737649453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVz8bC00NcJv/IZ0bhV7772W619cZqGGdaBgIBaPg8g=;
        b=ae75UmJSE4HeK5omooHaYatm11mDGTJ0Za5oLFfv6cTwAPyLIfEqMBDKfVdBd9uXn/
         83251frpeuVCkq8gqmM2RhDFHosaX3W6xHtKA7fq05MmIer9NZW3tesOSAqcGIPL5d3w
         a1pKWzW1PXLlPPyBb+plJKOBcCu9piIIzzWzPyQ1qlD3YaVH+O64DNU49xn/ee/suKCp
         jtCYJ9/p7DIkgTBUKq11m/zM5kFI0j+rGBv/44o7WSV/LPElatZUF14Vhg82PpH6TnjE
         3R27keeTIN8P7yJWwHiDUSd0Gkzrm9DLiwdTtzGILkSTvmzsChDG5K1nNPZ0o7Vwi0oM
         cVIA==
X-Gm-Message-State: AOJu0Yx9dP0pDR4UOveAYjOL1fmhfhBxS4ZflxA7Z+PIxMEUHhit1JCZ
	Q1OEdEopJA4Hos+CoQbxCcEMxNeAKhdbmSWWqJCrunKutJPasqQ/DN4Co+E5x4E=
X-Gm-Gg: ASbGncuRG5r8vVQAfogN2HGfUHknoPHqA4PkCCnwZpN7ZFbN4xRK+EeV+l45miIfbyn
	nnbvJ2HxtnDj/ctD7VdwqrGkfgFBrDf76CBQMtF0tNTUfvpNHQmxDAlCncMGHSlgWt8LHI2ELM9
	UtAMFIa50ctHF4tgIYj/Vk4DFGv3rWdeIW64gSGK3sBcvYjKL9JejA0SMvszWgWFwBLrGsf/ggs
	XeUj+3H23ulv1CLWfy8StrirNHwikhf9v/udzhhSchKTCf6
X-Google-Smtp-Source: AGHT+IFsOpMBJ93/MMR+dU+EaZC/TmrWLHZaiOoyuDyhD3Z2W0qeIr52x3Uzv4hcGCmCAktAv12ABA==
X-Received: by 2002:a05:600c:468f:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-436e26ebe46mr326154805e9.31.1737044653375;
        Thu, 16 Jan 2025 08:24:13 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:08 +0000
Subject: [PATCH 1/5] clk: bcm: rpi: Add ISP to exported clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1

From: Dom Cobley <popcornmix@gmail.com>

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1

