Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC236D513
	for <linux-clk@vger.kernel.org>; Sun, 30 Nov 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764539244; cv=none; b=No1BrJ2Pp5OH2Put+kR9G/xuNFXF8NGd7E6dp2v16AtQUtX9jIlC+2sm699UkVFoiTuN10FfRrL3Q7o65tkRDsFg0AhZcvoic0/0q49jOg3lX9ZA5vBUdLewrTN/OlcMSw8eLIboKhWq3ZBV2QMxZg346b+9/wNgjeXazsh6qw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764539244; c=relaxed/simple;
	bh=6S7nBbuPTB+FAl/66fneTfXioiQUgO5UGKrFsl5wsCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WY+QrsAx6Wfr5WCzXcPDl9ZgdXTL6miRoyCdkcTj0WxLH9WEFVaSwTxSo51NyJSujFwU7Oz9Pm8XnuxRBIDeIGC/4P6koyA9Y/LqgjYqP5eL0Me11/ObmhFH9qfqtb8mOUV4PcsF15WEK8M9Ph+wWil1LtSVuL4YW6K047UoJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSLPyxWK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSLPyxWK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775895d69cso14694925e9.0
        for <linux-clk@vger.kernel.org>; Sun, 30 Nov 2025 13:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764539241; x=1765144041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBugWXr0W4W+Hzgn8IDtB0dsNgmHRSn7AnpA6WlL/No=;
        b=bSLPyxWKjieWsjA2NgEQ0AZMr6+Sx7wExZW7R6MrW4Rtnsqtbap9wVK+zXE2mwhxQF
         TLQXvhebiEfa/nIiH7VRmHQF1QiUO/l8f43qYRqaDCpKBH2bicxfHfzhq+kpkOCu3mIk
         BCscR7sQhGnvr6E2IJpzQnbkPFolxIGqHE/o+/w4kheYFp6mUJHS8YOhfWwbGTGVARFZ
         y44EEoDjoNqM/yHwZ7FApJCA9Arj7xSKOcqGwFQoMzjiRgHjobONjFRBt3651o9FXF9N
         pfFkA15s907kfXbD61DA/gSYwUPOn/Pi/p/4wpWb9recw7TLZX0vFJM7Cbznoz0oy6Tm
         t2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764539241; x=1765144041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBugWXr0W4W+Hzgn8IDtB0dsNgmHRSn7AnpA6WlL/No=;
        b=IQZc+PxZYL4f0NxANI5B5fNVHx/nWzTlKaaCU4oI4jeV1PXBKBR7Rj+KGpL8ouabmt
         E0odO/tH8XPRB4XiZfScbFI9Qtb+Fbuye69G6GeHcj06gKynMAkf7+t/Cv0r1clDXpkl
         g+WnNUG43HDIMXUhj9/C7FQRZHLjOU7XBjjOwF7dTg4FfNc02sje0bpi+yODpwHhGXHC
         VJe4pn9YgPymL4HwoGAnpPDoeqGaIIZO0ebVEzV7TcKZoAmrg7QlpaCzQx8R6c8jH2Do
         yb60ZJN8081+VqxOhQVr4N/tkI6EiBA1++C2y7sWgQu2hShOq5+Od7L7UjhK3WR3M6EJ
         VIkg==
X-Gm-Message-State: AOJu0Yz6FopYkU/NrWUbYsZzDktWVQpMaO5jG4aXdfJWIglxldkdY27S
	BSkuxLUU5lgVzRZgfhHse+JBmzRU9SBEbcrigjt4xHoUXFTOy/hUggGU
X-Gm-Gg: ASbGncvtWYRffZVmS9zuWy/zAD6Ds1404uUTWVBc7+UUkmAyLHUVVTE+mZ+/+fZDUlF
	z1AjOrUVi2jt9Cx6EkgZYAAD9FvBzwz0R//fvU7x/VLNUv97lxE+RA5BatRIi7s3cAXPDbDXMBR
	7UlTZAUASGzkQkyozdMQSntp6KaMcXSaEhF7Ko8ajQHwNz5jcdemLz06/r4O1bGpMXenHsv/rBR
	ePKy28Bp590Sh8qPd5ETCCGaRTbqb2bMWteHjx0S7kD3FzlMce9JZGNTHnZ+AjnTxDnFyZW77cw
	2sTuosMH+7RA0AudqsKG515C0iaN75nK+PUwjUGdj20hECtGuIkn008HiVtg57grCz2Yrk4JLLC
	y/BPYBsznHs50KHpFaGfym2wnb1ekRhZuKrgazYGOlli1XTgwtt1lWAjhrQ6F/nwcHcL5SmpH1i
	6cj+6CG4b5tWN+q0E0q9RpDGy7uoDyLs9XatfRNlWwGj22xkz4xnF3nIAodus6u+ICyxRcy8GIU
	Uzcto6r4xHOY50yGTs/Jwpt
X-Google-Smtp-Source: AGHT+IF4QxMp0aTvDRY355JuwUgyvZ3yhSlRdkouUY8BgzWQpkQqXAUhd1xmSSESH/71OEIIa7MZEw==
X-Received: by 2002:a05:600c:1c0d:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47904a6867fmr263421295e9.0.1764539241265;
        Sun, 30 Nov 2025 13:47:21 -0800 (PST)
Received: from archlinux (ip4-46-39-168-190.cust.nbox.cz. [46.39.168.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d365sm201659225e9.12.2025.11.30.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 13:47:20 -0800 (PST)
From: Peter Novak <seimun018r@gmail.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	Peter Novak <seimun018r@gmail.com>
Subject: [PATCH] clk: hisilicon: fix compile testing
Date: Sun, 30 Nov 2025 22:47:20 +0100
Message-ID: <20251130214720.394745-1-seimun018r@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hisilicon clock drivers can be selected when COMPILE_TEST is
enabled but they are never actually built because the Makefile
guards the subdirectory with CONFIG_ARCH_HISI.

Enable compile testing by allowing the build system to process the
hisilicon drivers unconditionally.

Signed-off-by: Peter Novak <seimun018r@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b74a1767c..b1452489d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_CLK_BAIKAL_T1)		+= baikal-t1/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
-obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
+obj-y					+= hisilicon/
 obj-y					+= imgtec/
 obj-y					+= imx/
 obj-y					+= ingenic/
-- 
2.51.0

