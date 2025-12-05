Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1E3328F8
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 19:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964013; cv=none; b=eW6Ew6IVTnGJBToTvl9OnQj5te7wzspPN4GtBeeTv7v+8mpIqek6pI1yLMefiq3QJTjdvd4mCKeMoOYxsmdLyO3h01Gp24Enz52aeNoRA34It3g/HpTjEaG9wUyRyW6RDu5xxCw4T8HZJNMBC1kE1qmR82BsFolLgEcKpeBPFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964013; c=relaxed/simple;
	bh=FC+GJ8Z4m1O4lBnPslL2Qw89/ibfOmRaMGfSDL4Ca8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pOT0J50v3FQSA6cDamZAHTr6EyoR5vB2CnmGRCF1l6bXyavDmrICLITk5rP2lV8Mh/1QFUNRL/he9Im/6DDzm3u514INLRGbGauqAdv7E3VNiEByMm3vBxdo6vMUqkMjTZp/76tvDyHOkgV2jZvgQKmbCIzjDYhUDm8kf+/pUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpefCYsw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pCRSXx3h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpefCYsw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pCRSXx3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764964010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0rqje85ZFAIzh9CImtN63fmvx9XWrEFzk3z+rlYzxIc=;
	b=HpefCYswtiK0lthUnQ5UMYgDVg8BwD+Wi64nuqURuHvWYt2w9+SwmfA39yrBb6tjwMFiSf
	qr3WbwQbShnvvSzDFvHwNEPk3zBAMjHlYyFtn2VWqbJGlwj1BnRi7TAmqOFcyVZg0Z4N1/
	HNZ2H8pvVGK07+ztyQjjfJmlCTLin2g=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-PcX-3uzwPS28hRNGWVGkVA-1; Fri, 05 Dec 2025 14:46:47 -0500
X-MC-Unique: PcX-3uzwPS28hRNGWVGkVA-1
X-Mimecast-MFC-AGG-ID: PcX-3uzwPS28hRNGWVGkVA_1764964007
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-63fac789cdeso3125865d50.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764964007; x=1765568807; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rqje85ZFAIzh9CImtN63fmvx9XWrEFzk3z+rlYzxIc=;
        b=pCRSXx3hE3q9uXyMsIR2AKR/5GPOsAKfArgUK8ayAcvJG+vMuyCIXoxL2PL7gluv4T
         dUNtxLED/cz5FOiuyULPDFLp/rPA/i73/V+irY41P0NJ1YQztPNeZkpVoZQzjozi7sgk
         FXPHTt36AqM4UoGVBv5Pd1Y6hayY/6nmPHUp993bshScvGBIF5XxHsjuQ6PZlfGxHTnf
         BYEK2Ei1WsGTvEVsa+7qWl/m6oAQRnJbtMpiDlRVCcBCxkBR/Co5G+21S6CS0fYqe4c4
         dr5z5BlT5cruV6dnkygfxYtiXwC69TQRddtFT1slvZTnx8A5hn9bQ3IDtas6uY+oXY1Z
         ky9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764964007; x=1765568807;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rqje85ZFAIzh9CImtN63fmvx9XWrEFzk3z+rlYzxIc=;
        b=NZNq4uA2dGf/+8ACipi1/yPDHDIKveElifb0HUiZDls2iYVD1aOk+qlFmArRME8ePi
         u5NRzAYuQ9q3ZTCNunKe4joNGQihIwW+XnEqgRF1uKxN9393iS9p7RoQMBMrwVp73l9o
         jjSk1B6QzM1jH3oXiJPJkX+sBosXbb3G+BznpATSEYWuv1rWa9+8QhXHRjNojcE0oDQU
         prUGsFCGelCK8CCeYUPc0R9CotqBIOnwtMY6bk5Hr6B2AZDOgE05+Oj9TlwivxbSpAyL
         NXupe/gDP3ItA5EdpyZeSbMNtJ1gLlolc2OaDGbkB+TB1xPMeb8dEyTfhFHdI+gIimlp
         gROw==
X-Gm-Message-State: AOJu0Ywi/j4vNYi/Hl+mkdJ+xcf8ohYJWiQBEhwYQjM6g1ymBXevkgfZ
	19vph8rc9W+QBgqImwklyqKd/AjfjFNi2HVP77VfnvAlvca2qc25BEQElGD8+WdpFurnCjJRh+c
	ouXMLdOvqHdI2S8I9Ux76Bw1uRXgy0sUhmgGYbTjuT2YFkRVtkXGK7UiBulsjoQ==
X-Gm-Gg: ASbGncvxLVeke5wzoZp8KzxlzCK1AzOq+mmCes/fjW2YQfJIq7sWBfkhgecNNBlajo3
	v1zHe+vMyGlbMYZJFuDkgjwULDfb51UFgcT3+e4Dn2hFN2+emhdbs1x19cwvaqQ5K/oDPKYM0ri
	UaF96oe1KjzD6kJv1WKg63skc2jqVe3lsQdXw9Plc0lAVZtftznP+2MUo46vMhWdv04yoP12zuU
	JbDxVfOQMpOhQOemIBrqR6CE6i6kyxm0MNttTBt5ZyxljhIGVSanfd1GeRUx6OQ5dIJjolgXcUE
	NRZBiHNtRwpHBtCc+kiLmnZ2BwJ9FgLlvIQGmPkzlklLE9mUND9jYlqo0l3jLa7a7ofpI+an3LW
	CNg82wIM2TDO6QuSuM3ro15Y+UO9E31l6QnwfFi2cQyVLYm2Z
X-Received: by 2002:a05:690e:159b:10b0:63c:f349:cb97 with SMTP id 956f58d0204a3-6444e7b9cb2mr77604d50.41.1764964006806;
        Fri, 05 Dec 2025 11:46:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQHZvHQR4/S+O0razrhgjH4ftKi1QzNSsf29gttGL5LM78iYE5CUOIYyaOzyZAb8eU+GZGaA==
X-Received: by 2002:a05:690e:159b:10b0:63c:f349:cb97 with SMTP id 956f58d0204a3-6444e7b9cb2mr77592d50.41.1764964006498;
        Fri, 05 Dec 2025 11:46:46 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2151181d50.9.2025.12.05.11.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
Date: Fri, 05 Dec 2025 14:46:26 -0500
Message-Id: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQrCMBAF0KuUrI1kUlNbV95DXMTM1A5qU5ISl
 NK7m3Yjgrj8f/hvJhEpMEVxKCYRKHFk3+dQbgrhOttfSTLmLLTSBkAb6e43+WAXvOt4kC0/KUp
 UdbUjDdQqFHk5BFoPeXg659xxHH14rU8SLO1/L4FUsnLQGrMvES7NMRB2dtw6/xALmPQH0Qp+I
 zojDRqr0FrEpv5C5nl+A3Lj5Mj8AAAA
X-Change-ID: 20251125-clk-microchip-fixes-d0864e21ef0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FC+GJ8Z4m1O4lBnPslL2Qw89/ibfOmRaMGfSDL4Ca8k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKNzZb8Srz1ZemnGadOmDvdnnTD1udU1MmUQw1/z91US
 zc6nP/4YkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATcQ9k+GfE7zhHVtohK/vm
 nuC+7NyiSVecWQTutdy7ucjGRelGzR+Gf+reF/64zCrfXvDf6E+NRsmZWsbdK7dlHWC7mcqpdEX
 1NAMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that fixes an issue with my round_rate conversion on
this PIC32 driver, fixes a minor bug, and allows building this driver
on other architectures with COMPILE_TEST enabled.

Changes in v3:
- Mock out cpu_nop5() in the case of COMPILE_TEST
- Don't return -EINVAL in *_get_parent()
- Link to v2: https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com

Changes in v2:
- Add new patch to drop unused asm/traps.h
- Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
      clk: microchip: core: correct return value on *_get_parent()
      clk: microchip: core: remove unused include asm/traps.h
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 68 +++++++++++++++++++++-------------------
 2 files changed, 36 insertions(+), 34 deletions(-)
---
base-commit: b0db9cfd941e8ec63947e39ae29d9abc8be2559d
change-id: 20251125-clk-microchip-fixes-d0864e21ef0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

