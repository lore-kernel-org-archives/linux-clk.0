Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0A2882D3
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626828; cv=none; b=O6yBA4iXy3fnwfkRC8g6lwTwgMDm9Z6OPopo+I9zYI60UYKiPcYUbOH3FbjrwQF++uMytKP2XzidIvbOIXiTMDy9AP9oZYhu+lH7Uvmn+l9kiiwew/0+yMgF0TMmggxwHnknsUufP1RUEQqSnehn0TLhFmv/mvj1KTt5Mx4t78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626828; c=relaxed/simple;
	bh=VP0N3C08fHvnKsxPvf8B/wpLw1ZhtLz4uOGvrMd0TVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPHimiNAc1a1acjiTSzSO24OdJWIq08Jg+2s+Lq98X2Gp/uP637kKCsjCWZgMY6qHX5e8HioB6K858PZ/4bZzSoO0/1FfWqE72MSyNACqF28iD1DRf8zf7wDzfteTRptLC7uTCbaeasKLsOjRFLk+M9MHCURta++0ZdgUwksZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CVskr/d/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xo2C2KSU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CVskr/d/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xo2C2KSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764626823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sS5L+19oe8OW4sxzxCqOmwJ5pWvDAD7M5Q8/Znrc39Q=;
	b=CVskr/d/rZdAX4dkfdBltJiMSDxX70ATWUre7ua0P8VsexwC3rTKQ8DeYPEcqhQdkdnbW7
	PE7eJvK3suml+p3VyBPaWYnHS+jRgtmSPE4Y0JzPbO011hT5zUhWFBgIpGbpyHQGLOotSV
	SW//n+MkIylzdabLDEPIEXB9QcFTP70=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575--esUvcQwNMGf7lOMQzjyew-1; Mon, 01 Dec 2025 17:07:02 -0500
X-MC-Unique: -esUvcQwNMGf7lOMQzjyew-1
X-Mimecast-MFC-AGG-ID: -esUvcQwNMGf7lOMQzjyew_1764626822
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1386633085a.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 14:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764626822; x=1765231622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS5L+19oe8OW4sxzxCqOmwJ5pWvDAD7M5Q8/Znrc39Q=;
        b=Xo2C2KSUtXRNEeBwKVSnUR9RBbMWyjnTPG0OqfTbrbzevQEXEbZpU0VHvPK7HM+hzZ
         V8LxhWL4e4B2LhD8UFEIljBXKQlxvJWWpladn0eUHmOfE5OFSwc453YjdwDu2CZ86Jb6
         uZXVOJ7Fos79OgRzppyI9KK6hYoTqoMFk8/AC/zKVD1ejbpdWZJpVkEa/XMjGiOdyKZQ
         u2SFd6oki6LECMa/RdfKyh/TIa10ESpJ6s/9/zQ2q9IhY/T4ElTL4WDp5svYJeGMBPrL
         rdVuF4S2UL2d/uvy7RrJoaMzeVTlDyC7E4NxGsXs31Ok34J+jnmEyVbFiEJmZ+ZufmR4
         x5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626822; x=1765231622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sS5L+19oe8OW4sxzxCqOmwJ5pWvDAD7M5Q8/Znrc39Q=;
        b=mF/D13quVESMx98+z4uzIAnFBmB6k+ctl4V+Qt2ZEx2ZK+cU/QL15OVkKM8P8/CWZw
         r8LVohY2PUYfDxQOaKMN+aK1kdBYky+GxodQJamEJk4nNjpG6V228PJkT276MgWx1/A9
         4P8mIyWsmdYKK29w5fGAF3iRwaMCoEHX6SPsVmcUmmjCTBZRZ7+lEUV2Yz6x1ux5ETsZ
         A/fLmRQm3BA/J6HVx9j1iEO5ort29BTVRHD5p4gqVgU+mR+uCghLffAHCsXimEhV66Bu
         sF6Kiwc65iX7cVqgHAQtYNpP/N4XjqHINNHP7F17VY2GIV2w2p5Pmt+qv91JmFaVUy2s
         XV1w==
X-Gm-Message-State: AOJu0Ywiy1PCkH1dHbDQtlDWqK4ME6iu+59N2amsqP3jc3KNe+dh8Ju0
	z6OPVRxTxOyQslH9eCxO/7Y7DRMCLvAzYaDFxSRxTP5L3h6ZABKe2DCzrbo1HWIgI6rFxzFXtam
	AjrMV9gY5JGSfcjsZ3bM4pLLj14r/Dfz2lCrHbt0nrbzHMBVZwWt2YxrTGlXN0Q==
X-Gm-Gg: ASbGncupIQKNfwzjnpQIg6KsxOAl5/HXSFY78yz292KMaFZ/YZV0dk+hf2qoodLrUrY
	Bkhau8tb8uac8226XkUvi89ebcs7oTvedOYf96hLH7P+Up4unLpnE95qE1wr0ZjvpBvP4uSYsu+
	bW6BhMlHxl0/WGQFGTHzhclbsmasyLDE3Zy47LzVaf/jGlQgwARbUDZcLfK82ulfJRCpHM22bD1
	MoeFUwHH9zNBMzN04yopX4s+lokiUt3gDnyY7D0vIPhvXQEajCEOZZD5US8i0IGu2mopKy/I5uP
	lTXoJt7DFwiiw8zQxC4l/+YtG/VxZz0muX7PrhSvdXrCMzgt2R2Jzkv6IRm2lJgV3ZhK8GojDtS
	2Jz/mwjEUEkmRqaHy
X-Received: by 2002:a05:620a:25cf:b0:8b2:ef6c:8025 with SMTP id af79cd13be357-8b33d1fd671mr5349448685a.28.1764626822193;
        Mon, 01 Dec 2025 14:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPKLyaKSz+Vz2dbOnEy5u5Artk0mtbUClygyiCDMVLpPlgv2PUFfK1Y7KkvKxZsR3qwb3MWQ==
X-Received: by 2002:a05:620a:25cf:b0:8b2:ef6c:8025 with SMTP id af79cd13be357-8b33d1fd671mr5349443385a.28.1764626821774;
        Mon, 01 Dec 2025 14:07:01 -0800 (PST)
Received: from [10.235.125.224] ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529993978sm944541085a.5.2025.12.01.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 14:07:00 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 01 Dec 2025 17:06:38 -0500
Subject: [PATCH v2 2/3] clk: microchip: core: remove unused include
 asm/traps.h
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-clk-microchip-fixes-v2-2-9d5a0daadd98@redhat.com>
References: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
In-Reply-To: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=VP0N3C08fHvnKsxPvf8B/wpLw1ZhtLz4uOGvrMd0TVo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDL1BOuz1zuWlC6YcFHfYGaDQtkBoc+8iv9YBbw3d9trx
 NkKnHTvKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCKzpjL8j975tbdRtoXtmqSK
 WPJFgyuBFqknVxnNvvqidtehb01JzQz/MzsNz2Y275HrVF3pmfCO0VXw/hLuUB0lvgDDjdtnchp
 wAgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The asm/traps.h include file is not actually used, so let's go ahead and
remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index a0163441dfe5c1dfc27dae48e64cf3cb3d6b764f..664663d9d7765ee0c61203ea11211da54b709377 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <asm/mach-pic32/pic32.h>
-#include <asm/traps.h>
 
 #include "clk-core.h"
 

-- 
2.51.1

