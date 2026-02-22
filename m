Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100E0360747
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 23:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771804292; cv=none; b=lzm+R3d7LIhCublUwEcco72kul5oAmW+X9HLodt7ZwOD/xS04vP3JnwB8bZR5sE3xw0LawTPae3PjOIZPOMB8gpq8IpKvSlGKKzxvQFqTuglAq2kh/SUjiSNCmND0J5HXQkZiJp2Tw52ZFXshVuhaRPRWKnc/zND0za4vEx3ylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771804292; c=relaxed/simple;
	bh=Vaz/v5iK5xCxuwXrVAC77q7tpyqLodfB6MfmVz11O5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jv0puXclntWFOX9MLiCF2mPdS9zrvVMDfImedfBMDMzAxLl++b1f68lbNzqiBj7mTQQqehNlu2ji+O7TFEuqGcEnkoXGMtNOHnISjYJX9qax363ZGnfG47xfwfK9wMSKII0cCZzBli6ZEFFep9CNpZ6AkXZt3huY+I07xg6j4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZ6WU7pP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=as/2x38S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZ6WU7pP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="as/2x38S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771804290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eaAuaX8i1J4KvXjA55C7U1MLeaCwL4Udn6KaFgAJ3gs=;
	b=VZ6WU7pPIgW2e7oh6fwt6d+LYQTOlQTBzW2PtYJJyHO87zG8eDB7DT8ePnTSKzWqw17MnK
	YwozWMbSuOya4f11uFHem+U37T/eDkILMeKNh6Yw0XJQol4/TFfRESUFnOaXX+DspX+axG
	HQgT8hb8Sv7OMHEgTxS1/aW1/xR3LWI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-pku5ftvaMRKIHvw3d0XjLw-1; Sun, 22 Feb 2026 18:51:28 -0500
X-MC-Unique: pku5ftvaMRKIHvw3d0XjLw-1
X-Mimecast-MFC-AGG-ID: pku5ftvaMRKIHvw3d0XjLw_1771804288
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50341fddb89so459995321cf.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 15:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771804288; x=1772409088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaAuaX8i1J4KvXjA55C7U1MLeaCwL4Udn6KaFgAJ3gs=;
        b=as/2x38SpUK/Y1sVtwsodJVffjbb8dkBdATMyj1lwtvSeem5g/x5qzeYk6x1F4Diz6
         Qbc2ABW2+xfTZxjfBFN7SQot5HHPbjLg+m8O3c6YjPvPGVNHpJkFK5+/SItPc9R4082S
         3Eg8vh4BOAuzOwfT1cBlOemg7ChLmnrICjCgD2xIkIsiSp4fGgVt5qeB00tH8sUH7AcG
         ZD5v/81sqAo6CaoWBIPxqAtWwOJpUeUpDGubsER3VCXaWkJNZ61vMekAk1ai8S73y3td
         UAXnTHhKWWil2q3xFnhvSZydG+QMDyZPICUU+vZvdothXHeiCw1f97Jv1MAkSVIDmLhR
         iOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771804288; x=1772409088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaAuaX8i1J4KvXjA55C7U1MLeaCwL4Udn6KaFgAJ3gs=;
        b=fAF4f3OygF7G+kRLUNPk0HhtEsnLSGa8SQLtppYflD9K1ik5Wcav/cR/zZ+H+AVe+U
         v6yxxFQRVNsJihQZIxDs7t0pUKD1P+yj4V0ySSTdk+aoC7nlPUkaz661ruxbFW/V465+
         46Kr/gHrBNPml6YqpwXthjw3L7IswDPaOEK+wEshYd+FdnuNOTJUhy1Mw62gAXMQy+IE
         8gbr0xmM6JQGt7+DqOtBOrEBtj9shhd1fNFR3WeKak/ttliyHYbvY33BvYOTwdixFbSe
         xitM0Lc2wxU14mxVd3h3wJSQaEqWVOlnGYbR6l64ohSpY2flNYD9fvg0i7EinkOFQK6z
         xiqA==
X-Gm-Message-State: AOJu0YyF9Sskqy5a8FEkP3qxl57YD4zYZOAK69ddOSNJLVq/KFnPxymf
	6D3FS8h4PU7r3HRxVUSKKfvAQ4xqqJZiazpnXDATQFI7Oalp6DayX26z9osqxhSXWy85IMlMQuB
	ycXSKoanzMGbEyivRfzXU+gxSR234PKlMFxgcOSUyu5lJhtV2RqbqtyK+N8jYGg==
X-Gm-Gg: AZuq6aLyKoH9YfNRXh0hs/tDphU+KH4bVaGJ5CGr8/N43/TZaPnGawdhJSD2nJ2MoZn
	BayHfuIGKci1dh+FnCPW/4fUMylaCzEK5qTxSHPtF8qE5oJEWFeTKGFxIgrxWcI1mHDKOH+d1po
	cHHO2rwR3q/J8xQMscdiUnSIDcdSFqPjl3wKxZ+is3ti+RhOyi75NeE2sBqp8kQzsZzBqsWYjjO
	PpDiLx59+Qlg9ruw6wfZX5IqqmpoC4ahW9+isuwpH9OJu12U5KsIkTLR68gDjyRq1pT3eR9qFfJ
	zbwj4IrDCCMXbTjNafnQaPAxY3irXedJbO3YjbM6Q4BOLJhjRPV/xVKD3DhavRe84rgN+jyrdfK
	wKa/tJQOZcHWrtp3qiQI2nTeLucx2e9e+6FbHh+vOepXdp+SDe9iWZK+3li80xw==
X-Received: by 2002:a05:622a:1b9e:b0:506:c13b:f038 with SMTP id d75a77b69052e-5070bcf23b8mr89945191cf.75.1771804288204;
        Sun, 22 Feb 2026 15:51:28 -0800 (PST)
X-Received: by 2002:a05:622a:1b9e:b0:506:c13b:f038 with SMTP id d75a77b69052e-5070bcf23b8mr89945051cf.75.1771804287909;
        Sun, 22 Feb 2026 15:51:27 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c8a771fsm53701036d6.17.2026.02.22.15.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:51:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:51:06 -0500
Subject: [PATCH 3/3] clk: microchip: core: allow driver to be compiled with
 COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-clk-microchip-pic32-v1-3-ceacbcd515d1@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
In-Reply-To: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Vaz/v5iK5xCxuwXrVAC77q7tpyqLodfB6MfmVz11O5g=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTyv3rmrYaLPm5DxXtacbHnYt/ZAza4eQqeKZluNT/
 r4qZNjyvqOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJPEpn+M1+br3yEW/HdTN0
 ahue7kmZuaX5zcc/Jy9pnWze8trDkCWL4b/Dqv5LfQEfuGKFTosruhb03XGskWKY2GDymvlDaeO
 ZDFYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver currently only supports builds against a PIC32 target. To
avoid future breakage in the future, let's update the Kconfig and the
driver so that it can be built with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index 0c03b14699bf083361bb5be8be3cf5305c311549..2864250dcaf8e720695c5a884a5aaf2efde15a1a 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config COMMON_CLK_PIC32
-	def_bool COMMON_CLK && MACH_PIC32
+	def_bool COMMON_CLK && (MACH_PIC32 || COMPILE_TEST)
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"

-- 
2.53.0

