Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611AB1BA07C
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718914486; cv=none; b=QiNpz31uIzQ383j7NaZMH2/6u9E8dFV04ftXf7FSFEPh+Jk4QPXcO3ZZT5NkenKD+kDQ7YC3c5jYvzwKxu9s7FYy+mbLHysc6kp9B89h+fpp/tTmhURsyiexlZ0nq6QGpIPaTMZMiXfUFFllKlhawOVHi+tY1Gwfn3r1IER7pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718914486; c=relaxed/simple;
	bh=2j3mQFB7iTl1buIKWTw++t/Z3MBaEzKNVz4k5V+ti+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hx1r9xHrC7yQr5FD191fRTH6D3/094hhsPH+NFzXxaGvgqa0HoWiG5kXQWemmU0VxABGIXgwDS7nSbhT9ZLmD9gw6NkgWMoZJSn6Ou0z5ooHoHbLgmI1Hbe/1frxHyOhnUFi8V2bukK06WZ1VpRd5yx7nAoj/z3xAjaU3HyjhKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9gayOoH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9gayOoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718914484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=stWFvKfQWMunoN+aSizxyUNPbtT8PDu9EoTxxN5jaME=;
	b=Z9gayOoHCm1Srud0PTV27PzzICUcc+1MsX+DrlCgZnB0QAYqeOPsJUu6dS7vP/h2itS3h4
	H1XSu8hRyIB7LKbmdeH+oXYp1lHcBFfeEXDmxSmiywYeMj1H++szdki+u9hv87f5I8z7Zi
	nCxvMXSjd5Eq6BFYuJldFPth0kuv0dk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-v2xOVbG4P1OwjSHjLeDZAg-1; Thu, 20 Jun 2024 16:14:43 -0400
X-MC-Unique: v2xOVbG4P1OwjSHjLeDZAg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57c6e28b151so696919a12.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 13:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914481; x=1719519281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stWFvKfQWMunoN+aSizxyUNPbtT8PDu9EoTxxN5jaME=;
        b=qen2n+VjNUn5SxhOTz5q2+OrhfP3gTjZi4H1VjYJ5lDSdY1C4p4OhE1Y7QHWcVRTN0
         x0j0BJKeua0NxS7u7B45mAtBbSpR7oh3uiKikEEu9spMPMVypy2PYLCsJy0ibJwb4cBO
         JCEHAGrQTHKXwh/IAuKN/PQKtnwZLgB7jIKloGTvapJ1/MCNVOaJOXMDruZ7pxZbwPla
         A9/g/S4snku1yUYtugPm9nfIMLXtbbtE1d3tLdCCXXT6IjrQjcYPNbD7PRWE06UerKS2
         F1T8mPf5wHu2I2foZ4xTgWxaPywj7+bDMWjAtSigcZlCPe2X9IfLOnOwbIwl9tXXtbja
         5FDg==
X-Forwarded-Encrypted: i=1; AJvYcCXAeYR7knmWqMBbyjRjqTdQIRe9DZ+Umnc6CDbcIOlft9GO35pc27ZIHDezzOYHOq+qpKNzae5qu7ZpGZVR4SCkhF2pcR61oYNQ
X-Gm-Message-State: AOJu0Yy5v9dTOO228lWnADBr9Gay4/DftQThiCsAoz1qGn969SksUhYC
	EsFdF/eSPUN6g1UYlJmTUJOYix7fPKmu6l4g6vGdgcNuneouOp5tOQQ6uY3C85xnjQQFskGDo0r
	UX86tFMufLi38/JUurC3E5QW3vB5sZCbCAHn6Qcp4JNwmP5p1cfHbonWQBxchEU68Hg==
X-Received: by 2002:a50:9b1c:0:b0:57c:a701:2311 with SMTP id 4fb4d7f45d1cf-57d07eb266emr3541326a12.26.1718914481515;
        Thu, 20 Jun 2024 13:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwT2V8ppfUQALHQ2Gx2dIUCQcXKuvxeXgHo5UbL20yvWmBKnofAzONZopukB2iwYsqsq/PEg==
X-Received: by 2002:a50:9b1c:0:b0:57c:a701:2311 with SMTP id 4fb4d7f45d1cf-57d07eb266emr3541312a12.26.1718914481052;
        Thu, 20 Jun 2024 13:14:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743b032sm10020898a12.92.2024.06.20.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:14:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: select right config in CLK_QCM2290_GPUCC definition
Date: Thu, 20 Jun 2024 22:14:31 +0200
Message-ID: <20240620201431.93254-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
adds the config CLK_QCM2290_GPUCC, which intends to select the support for
the QCM2290 Global Clock Controller. It however selects the non-existing
config CLK_QCM2290_GCC, whereas the config for the QCM2290 Global Clock
Controller is named QCM_GCC_2290.

Adjust the config to the intended one.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f72838aa573b..ef3c2852f531 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -68,7 +68,7 @@ config CLK_X1E80100_TCSRCC
 config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select CLK_QCM2290_GCC
+	select QCM_GCC_2290
 	help
 	  Support for the graphics clock controller on QCM2290 devices.
 	  Say Y if you want to support graphics controller devices and
-- 
2.45.2

