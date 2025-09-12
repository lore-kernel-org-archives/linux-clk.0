Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E1301012
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677028; cv=none; b=uO0DLAFqfK3KqwYpOLXI1/2cOCRcMgJ9Ste5F7x26yDIMvIHKO8xefgrYmABwyLyf9hPl84GAxr7clIrto933Lj5L6T6WXzUli63G8Re0DeqDbxQYwicdm+4JT8kskurvNf6pUI13uyV56eOJKhdOjhNxy72UoESy6Dy4kUpdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677028; c=relaxed/simple;
	bh=ujDEv08XqW7rfLhPYFByABK56QwgaG48UU/oBf6Umk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flz8nyO10mZysH68NjbIkYOxvlpMPpf/l/mTvfnAXxCpQIIZHmc8X1JsYWOA1Kq1ZAbSUUrDQAKLGNLfPRWVnOXoGYaFaq3saZJTobI2mZtLnxzSbmpMfvBENp3VHZ50ZyZKydYZDpasvzRMQYsO4iBkT6pTISvJZmY50Bsh874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO+SzWsv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO+SzWsv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso15029725e9.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677024; x=1758281824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agTs24kXpvfK2NjZ1FaOGupYKSjo+weNDR5D/xFPjyE=;
        b=EO+SzWsvQUUhOK2jsNK9eUvYhtAfRngmFU+w/lalkCbyqML/fR2/NxU2CJiTLa4p5B
         NBc7V8hloO8WaNYi2C9CXggUhjpz0Ye3BTSF4WSnjk+bdqTmfBr2iciTKzIq9U9M712R
         izqWeqRdnkBgkUSlr1FDKgNAqM7uceTvFzSk9ZR6E0qOBIFiHYvHRqsvTA7zadyf56t2
         hrZdBCnDr2rIyik9+HMuSzHcm1/1ae/OEUCCDr5AHIwquS2a9n7JhhKg5Y2DxyaXfuqu
         sJ75qsS61AQ8T+owPXTI64e32UmYGQPVX0hVhDViDAeC4gN2591txZAlLTrLIMT5PpOH
         7h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677024; x=1758281824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agTs24kXpvfK2NjZ1FaOGupYKSjo+weNDR5D/xFPjyE=;
        b=XHR3asf4Elf9ik11w5m84Qh4pP8LO8JKPK9eGv31FS0Xz/dAr5/MYPUdiKEzjyt43k
         XQlUxSDr7dK2A+fB5Zv1eoVExxUE7Lqck/RFAr0KscnLz0J50jiwS+FAwtqU1hDrkoqz
         bvxkDdhfaj5ooHH6mQWb7IJ+MBM8wOIknPVcORXbd6P03QFdhfLGNtOgLCR/PZtN6qnl
         Mzs6SvwkILBHOU22eqF72K9WgANviQtX/p1BAag4m8+Y/qvnzTsr3HfLn2Ey4MWF8Qz/
         9OVo4ZTxdBbzEIhSVTV9wWbg9pLVDkaaHNjLcYPDgmO/MyAWPnsiejbGvSIMZhFFIbn7
         auYw==
X-Forwarded-Encrypted: i=1; AJvYcCX9iISrZM1jgVILoiwj8HAIcpRGNf34Ch/E10hzbVbibhhDKjGpF36bs/EUDvLj0R4pkGGQoGfPIk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZHa+GN7doNz/9kTrAJlqWYvB6BO8Kv0BbQOcqn++5lqh4WLqI
	CFi8Mftr8a7e2O6G70h2cBdpObzFI8edoNnRnOqVb9+CM/h+DiHOuu2L
X-Gm-Gg: ASbGnct+kkDHHkvGCe95FNOvf+djWRcaJpewQmdCegOj+MBcw6qntptJskd5YGVGYg0
	+Wyh7Qc1l9c1Qmj+/CNL0NQOoBaaBGXRpk/8lHV5M8Y9Ky+0dl+bJtxemy0Bm9CvTv94PMrRAlQ
	P3u8lGiFmKvCkwdWoz+wiHTCl+uhbtU7edjIcXyvVLQuWFv6RI6k/enn0Ihkh4E85auAIDbPsV+
	m6eHY4WPmUh8PwIbIT1qOjU8WZ4f9NIOVeol4s6oAqtfyes93SR4Um4jrpViFLQnNVOhNGG0DP6
	mCbwK3cq21kJMCLuL4OjgBhweFYToWoce/rpTUu7i5v/ioNZ4GXSvPsW+2YHnf516MCXkCY2TIO
	2wOJUFnlxpduBDSXkFqiZnM3ItjMCG852mA==
X-Google-Smtp-Source: AGHT+IHOXut1I/Z15yQu3rGyIZEgCBIGbBt3BHVc1SqSraXZwCae3IepHS8Czi07Y3I58t3FyF/w4Q==
X-Received: by 2002:a05:6000:22c6:b0:3d5:4967:1886 with SMTP id ffacd0b85a97d-3e7657811ecmr2096629f8f.9.1757677023763;
        Fri, 12 Sep 2025 04:37:03 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607d77b2sm6491829f8f.45.2025.09.12.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:03 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Fri, 12 Sep 2025 13:36:09 +0200
Subject: [PATCH v2 2/5] media: include: remove c8sectpfe header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-master-v2-2-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
In-Reply-To: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=ujDEv08XqW7rfLhPYFByABK56QwgaG48UU/oBf6Umk4=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoxAXbbHsyzdy44VlXwGhO6OZBx2i22mfaSN4x7
 cadnfNuO8eJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQF2wAKCRDnIYpo1BLC
 tRcVD/9nFbywKwcQcdzW5NDPLqob8jPfoJ9m7ujpVDr3PyQE+T5FVIrcEmk4/bqxHw4ticlM4T4
 NrqTTLxdBlLMprrBWIoJGP+hOHZzUchcn+bIBsjGQJU5mD8uPBYNOR4sWGOCMRrWB/q/Jl8h1cf
 bHbfaEgEPAZZpoYgAStYq6g7nfdvh/UjXZRC5y1Pl5IN5UtHNLWxXWqQZxXmNBHBJtLfr9p0w0y
 x0RxbvnPWydU3JXQpDODyBkbLyyOcAazoBLyWEe/uzb1OW0pjnuMYjdVSwfL2iNCQatG9YWuxNc
 64Fj8AgKA3qIVWD3aqbb8qEE4MiEpxbY3vCmHFLaNalh7pO8agSXQainf0aOlzuOEq54Cg2+Mfm
 roXQfRybIa6XPZsqJrCRJHtwzLwyMH8inDRdx/gwIJlEpWqFgn5wRvU93dWCPf1puhx1T50Lf9F
 YhY8aGfrr/7vVUXRf2zE794A69xHzxEaz/7BZXKL6m9J5Hc0IbsXjESeQBbso/DpMTr0iAd+HsV
 Cg6sXBnL/Iq3RojEWpjZuczYT9helpbhXkX0ighKcf4AKZQNGeuxpMj9FmEduIsasg4oenfBMA/
 wjNBXGCgd1CL1ATztFuRN6O/l+w6fbLfA9andVHKAd6lDgdSn02XIbSuqVJHZ4q/DFb+ML+dJDp
 D+RHMnDP9W2ofdg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Driver is not used anymore.  Remove header file.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 include/dt-bindings/media/c8sectpfe.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/dt-bindings/media/c8sectpfe.h b/include/dt-bindings/media/c8sectpfe.h
deleted file mode 100644
index 6b1fb6f5413b8c5fbcf7dc2d786468ee3428caaf..0000000000000000000000000000000000000000
--- a/include/dt-bindings/media/c8sectpfe.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_C8SECTPFE_H
-#define __DT_C8SECTPFE_H
-
-#define STV0367_TDA18212_NIMA_1	0
-#define STV0367_TDA18212_NIMA_2	1
-#define STV0367_TDA18212_NIMB_1	2
-#define STV0367_TDA18212_NIMB_2	3
-
-#define STV0903_6110_LNB24_NIMA	4
-#define STV0903_6110_LNB24_NIMB	5
-
-#endif /* __DT_C8SECTPFE_H */

-- 
2.51.0

