Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627740;
	b=4CEadsyZ5VDtEyCXUKcdwp6tT1synraVrgYHRtHFSZt/qxzd1xVyoSnmIRuZ++R3A4TT
	 ANcv4zqnVNAvaPixx65s601c5/rlHkXeH/a0oeYfqDXfXH3+DCs6oB9xbArKViCCZrXjq
	 jSFSXsNYtUDenVYprEg6mTVQbySCjFad9Y0I70CUbJe7YPRo5MPBlvmsT1hzTwXPCI8z3
	 eMpB+QEq8FrrEdLekM5od/LIyxGxYyPYZXD7V3/ldbWCHzB0Xm6LxIKD9SbZt4D331ctP
	 Ns7CBgj3ykgT/VNQCuelAvNKrqzbmbTaOMEGg7Eyur0OzSVxA3AAtLLGDn4KuzKsxWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
	b=xuhrUAM2k4Km+29gjAn34EvPH75ddmyyMms8UpVgXXdfi/7REHUSz+jiJCDOvIhIBAHA
	 992oYc7ZFY29Vt+dokxEdB7DLJRhygDQu0MbEq2WPtj/5TJnKU9SOALWyb9yyT7fEyy8a
	 QCf768czpInvhhnhy1020TOl0pzn9W3Qx5d0NTYBrzw/jJOhNagS8cLkGY4to2AIwRM9s
	 1cOImj/z2QMq6VUNVct3Fqe6chfMKox1YsDiAAiU7KdUUIeIopdS6ZC4T++K5/LKboexV
	 W8JpM/JIVlvlZv2mW6UXaz4OuDWlsyXZrE6KsvIUvBb5lkOBOIK+MaJlE4u483teXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2OUWgwt;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D441606A31F
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D441606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2OUWgwt
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-703be215729so548498eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627738; x=1793232538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=a2OUWgwtx/KHDACojfn9sbwMDoKmjkLUEnhlEPEvQ667sdj1ISSUjYaHRcX5RzfUVO
         TiXfpMht3AoHSZKwdd3WPJzAXpVHUPVTd8Qrmtdcaa+E6eDkJqGEmy6pgDKbSYfxQUIF
         EXlNWtki0Y183F6cWhygbf8xu4XT6/dYiyCsLyeRcS0mRsniC5KNtrE+u88kypK3iZ9t
         oRAW+sMJR5KRxmMsgckA2obs1inmaN7b2WMsPKRRH9dH3skgZRXFaVn6f0mu0G1DqeD8
         hoK6Ln+Q6dYAeKeHRdbBnKQJM9BVgkycZYLcNg975AlitSiaLqQMpgf4rn1XsoiGRWTO
         Bh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627738; x=1793232538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=oBV3pvluP/LXU0LRvbQZFgjWuUF2jEmrHYKzkemtP8oQY08Tgq/JWEAQcMOFfYMPlJ
         X76wgPdz6dieKBsz9jW3BS0or1OyXklw8b3obreiGrWQUXS82AmA7VSX/pEvIalymF/i
         aT/7RoaIp6Fs05slDQqWz/w3m1dFh0B8NKP299/YEybonwRupoPkfpZV806ciUvx/Ki+
         WoFhVNOmfksEqVuJy2VJFnFWPxeT6JUkrrCPBp2RxUEDRCVCbUGz2QFTfSKqh22O3wa3
         MXRnDZY0pgNxgztWjOnlTyxAdDVVGZAt6uoMYOPJks9QHm4oOc+ktL2lrCDQJpaH8Z/r
         w0Ng==
X-Gm-Message-State: AFq9FYKm4GTBLnS7Z04dknTKIukRfqYf7WLKfFDnhf2yy3UWbWfs+B8l
	d1bOJFTTAXV55sh+3g10LrGkRgvIkoLE4UGFEtoV0M39pCFaJ5quB2tg
X-Gm-Gg: AYBFou2+GinYdfjdBKt8vOsdF39bl3QqPtmasryIlHRs4zEt228gLLXYvbw13+n3i6m
	vQW12M6JPTmJNZGSXEyiaSrKwvNfqF56ax6CoKews8NdrDci1cwJJE8Wri0u958WNFGgBuw+sjm
	EGIUnpmZ6dN9eSt0+bgCXQ79g94E6nqrSdbtUMAtvhfJYnKCWy9TOJoX9cxuDaONHzrrZjhk/f/
	Uh+x2IWQe+VMABnhtHOOacysQIikfV6gJN7d+Y9kX98SgDPf8yvrLBcPnQAbLbDryoPSLqpY9ed
	J3mIpFM12QMRB6Vn39uFLtKUFyuRFL4hjtbK8EDzccqGCUVTWhRYyAIqJi7gffs/cZHLDB9OqKc
	lW24fP+MEZIDIu12FE2LzVpHss0cFpKiSNIH2/xR5l1YPqpyQPBTliJXiE8ZyVCTvXHVB9cxhBQ
	0ouig823WB+sQmGp/sC3NdceUdVDEWZBmHw+u2CI/seu6e6ZnKfi9iZ57Bxc+rj+t6HGiw2lX+M
	V1Oq6R/gVDyrDjX3lETmS+xZsGEgeEpHcZlVNFBhw8eS0cTDnEQyUzHqjYcN6QVXTRSUpMI8+EL
	blQzYqoc6N7v2im30dmn+LRkQP4SI9Hzm5+30YI8DbERB7vHKDX4kqIbUyF5t77O0qcSPm/9Lqd
	fOd95OPWvcHk0yRw4G4Qo3ccqBLR4Pwll0Kl1Pbw0t17+Okeqy+0LoIFVuJZoWxX0sFKXnBSLPB
	o9GA==
X-Received: by 2002:a05:6820:5715:20b0:70a:1787:268a with SMTP id 006d021491bc7-70a178733admr1123581eaf.89.1792627737623;
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: export the APB2 clock
Date: Wed, 21 Oct 2026 18:08:54 -0600
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2dW20Qr8ivHQrousYCEtEhLCv
 1v0NHmTyZsVEkfhBHWxQuRZkgwhgz4UQK0LT0Z5ZAajjNXKaEwf/5YpR7gowdZqi270BqkfqMN
 Zo61YOeKqrEoPWTNGbmT5Xdzuf86OF9O0e/eFd4nRRxeo3ausXuREfYfNEPF6PMO2fQE4WH1Sq
 AAAAA==
X-Change-ID: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose APB2's existing clock ID so device trees can reference the UART baud
clock independently of the per-port bus gates. Add the public binding ID
first, then remove the redundant private definition.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      dt-bindings: clock: sun50i-h616: export the APB2 clock
      clk: sunxi-ng: h616: drop the private APB2 clock definition

 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 3 +--
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16
change-id: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

