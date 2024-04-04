Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280BA126F02
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233672; cv=none; b=asiKp8bxkXnO6fsIfi03wSI5uMd5bAqr9QyKyXqEeuIGB9UEIXsFqlmJ19DEh/EF+eZL5/I19n5SPN3fZldmwH8izAgy/KezBwcQtcDDPVEj8m/FThMpiEvj84FRB0o6LQgDECbGyc/DKT9QI0q8HYTeM/EYgWlDuPc+2tX+njs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233672; c=relaxed/simple;
	bh=1usg8EVo8lpQx89y6EqbzjPZs8xvMoC2TNFiu1OGw0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc4ns5GvZtzbWKnoSWkvB8ogckpPdY7wcehIMpuiyC80EHFigieKbr/NCeO8nUAsjx3ucv5vhCAhVTLyz4ni0ozng8z8xx6iItxJqr5+aYdvQYoqHWtcS9GxrpUtSWIS2vxU9C0O7pgSkYDbhN3D5XKJJBC/jB5w2fXAHoQ9YVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZIzIfnH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZIzIfnH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33edbc5932bso671664f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233669; x=1712838469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2/Kxl6LpRi19aNU0GnPRsNjsIub/vSGQr1JFgUlFR8=;
        b=WZIzIfnH6HJ7sajXhnlneF1gm+bprHF1U58Ah9UEwE+H9i6X2vMO4oV6ihl31ghRwl
         MNRQYj8fjJZletlEGf74dOmfA+EuisSxrs2Tw7Z/52TAy0DCubRAWXXIpYo7hGREiO2f
         auejeMaB2Seshjovc5VYLUa55cRKk8YN/w4lHTlDzM++NOFLJXVBM6RzNRUDoOOXUoH0
         HA/wWgMobQp26f9xQq76gMQexyXcpc+6gjUIFUQCotuW4xA8isLyDkAaxVtvQNddGv23
         HXHsiTteEBllJNCkSNO2/vaTYr2OtkN409KlidGqsuVThurbaxN82/9q99XmQpBUdBzd
         cT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233670; x=1712838470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2/Kxl6LpRi19aNU0GnPRsNjsIub/vSGQr1JFgUlFR8=;
        b=ZE0yDuYjcbpqlmESQc0B/93T/hU+n9EydRontN5BKfLDBA7yknHpVuxrrrDzPFAcF9
         1ZQRinDSvRKDkLheedV2Ajar8Zgoas2TIvdjQC7WRIKKLTnsZ7mF/WCe+ZMBiXSQbYAO
         N7EpFRKQrS1vFhvTxdbLmeU7ijgIQzqGTTSX7NN9j6kSQWTwriXbAKJMXRRGSI4MbHWn
         adW7aRd9PTjOS5DDco2zUtKLBEoFi0rpIBkomZBQMEzXz5sQRAOzSIwygHD/1nVO0I1F
         Aq9uxrRZxfk2RFiQjqVJrklQqhHrsEVe/WFC5IaREv5FQZeuoBncrUeowJ+evn/devno
         yPPg==
X-Forwarded-Encrypted: i=1; AJvYcCWWR5OyIlIT/rccKickeBpJ1YyWhCJasAatVm13IPNGLTmM4uySfhTbZkHUm9jZXaqM8MbDDYsLQiM96N4Y+BRioSkRZw2I8a9P
X-Gm-Message-State: AOJu0YxjX0JTvCOG/2mHcZbWJpaLFNPBqvcZD3w46qpZErEC1X2jNfKB
	/pXAzHQR6OmlJnAHWD0UImZSBLqDT8TNlwZ8bVo/uCz/hNlYM+gneVFJvbDBP0Q=
X-Google-Smtp-Source: AGHT+IE4lWG03NrsYGIMb38leE/EL6KNHhTvu/DlJtCiu5w5jF8R4KkplAWIhngCJVQJeXTuDbWSsA==
X-Received: by 2002:a5d:58e6:0:b0:343:419d:ba87 with SMTP id f6-20020a5d58e6000000b00343419dba87mr1780461wrd.13.1712233669746;
        Thu, 04 Apr 2024 05:27:49 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 17/17] MAINTAINERS: Add phy-gs101-ufs file to Tensor GS101.
Date: Thu,  4 Apr 2024 13:25:59 +0100
Message-ID: <20240404122559.898930-18-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the newly created ufs phy for GS101 to MAINTAINERS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 491d48f7c2fa..48ac9bd64f22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9256,6 +9256,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
 
-- 
2.44.0.478.gd926399ef9-goog

