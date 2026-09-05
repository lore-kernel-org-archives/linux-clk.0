Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05619D065
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566825; cv=none; b=Nh2iKo1dc4lvE4VHB6Qn7RQZ25Xu89vpNHseRNw0VHp0fCNM1QkXSDUT37h/iWY87Xtf3PrpaxDzvA+6HlWeJFcAFS1Wa2NWpHLZaUJ87rpcYmmqVmv/ii4hfD4grwLaOMdPQAieZztFbmsqbNSKTCDn9+OkuUqe4gmsI4LiQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566825; c=relaxed/simple;
	bh=AbGCPD867X/zR4JWWABXmcYRuDetze/f0050Gy5ULXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prNx+5OY9eVpNo7/aL8PjQRnoIvUhtJ0Uo0vK0Lueu/SSsOfRR6y+uYXH6KNRy2ZpDUiFRZB5SshMnU9KT2oQ0gGzKbwtAB7mxjlKNvouPBfLrSPEDJmPXKepqFwRux/9Lu0ZBuogjEBz09SnIWcgNG7TLtooHJ+LO18hT4n5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbtPtVDy; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbtPtVDy"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-784a1696a21so1203044137.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566823; x=1789171623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=NbtPtVDyUe4EiV1PyvB3ifcEKyiJkW+gPdb9/8kwE1w7b+jj8eHLByRqzahzHJTk15
         pIyJyn22VdYuawT7Wu7McepZpzTxxNWtIXnjjulX1BXc5sfUDt4Ua0VQoy/Zzco5T6b8
         /G6318j5/Q09afTMClrwY6N8L08CX75DcCgXZTYmFqOr+JlJojzmeI9WRkuwpGKqbJLe
         97oXpAptFxOD3WzGPCIwetnSUAhotj93foByJI1FxS2MsmRRxUNJXyd0D2V1KxqM65pL
         XTE5yntgRUyinSXb++6JwefTnC1DwGNHHK511HWMs83Tzn/HinnJk5r4Yvg9O4fQ6E4V
         QxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566823; x=1789171623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=hEi8RBcTp5H7mLG4R0kcmmpOA2OAu/f0wJaSG+Hvbk0Mq+tUf0MXKwCKuCbCy+AcaU
         Z+7Zscal7nBg5rtB0EkS+eVKwiWSLATKs65b6BkQuZhxibmhw6Oxr0tKBDnlpnB+dNzW
         JR4wOBW6/Pv+CBy3cISG0QH+XHibN/SqxShpG83bQrnV/a0QPNe/CBCS9dUSkcPwMFV3
         6dLU2k3Knc15PnZSBpK14DuHfhEdG6kUPp1qxMAmbhj4ZLjbwyg0vyssEh22aUi1p1Hh
         mDXlTPOJflTEbWoiCecAykpgJgzYiBYueffzG1lkmx5V4N1hi7PpMIVNIR/SFM6vdnw7
         PeUQ==
X-Forwarded-Encrypted: i=1; AKwUvBySxT947m+5pzMZ79dEJ+GYhmxU4YeXjTU79H/zZoXnpqjsxYWYBjPWLpsrq7sTNLclspVlJ6fT/BY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+3IrJGfpA5Hx8aU3HdEed6PhJvRCWNuPJdm7OkzGI3QQ86ZHY
	0rLlZtW2iSAr8olmqFE/YPyESmva53ULurzYG18CZVexTbsHjjH9GDZR
X-Gm-Gg: AYBFou2Khulo178IHub9aX9npfa8C9mI/kqI83lF8E0GUpuGRu4GfFKoTW0Ff0oZZ6h
	Rx3HOWRJSFSCeCKz4knvP4VykDVAWPEeEiJLzJlwx4p4DIEAxUCZnNn5C89XHq3I5SK5uGTUpao
	gPSnnAgtf6IsrNmFeuBXorspWBJQCIw6mVYHUr0EZ/M/IylP7c5f2fXrNx27KfKG/9CuR9N7XEi
	yX1K6cUV21zx/ZTmx+m2oAy/4zH6yd1O0mW8o+vG080RLVo9/M2kXk6TAnytVmlrpFTVFB17QkS
	u9bXfKVihJpOUHPdRgClSqyGAcwFqI9unFv76ssadV63on5B5h/ehJr3ickS9bnP1dtBQxwauY8
	ghcGi2XO4AICensxRAp+TCX9ZxtdGezwQNwjVjGXoCmCsjiE1yuhFeBshpO9AMnLg5UWF33i7OD
	BUJ8PQ/ZObXp9AV8hb38OLDHBjM7T14Tl2d62xfJND98+DbgqTWnTJ2qVTFO+0PqBC0E9IvMGJK
	cT4a0DEzNaZRnM6+FCV0uSwki/D51IT
X-Received: by 2002:a05:6102:554b:b0:786:4607:bdaa with SMTP id ada2fe7eead31-78a4a8983c7mr3967271137.4.1788566822540;
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm2735870241.13.2026.09.04.17.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v3] Kconfig: fix typos in core makefiles/code and purge remaining ghosts (v3)
Date: Fri,  4 Sep 2026 21:06:55 -0300
Message-ID: <20260905000655.103429-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analysis from Sashiko AI revealed that several legacy options were not
true dead weight, but rather victims of pre-existing copy-paste typos
in Makefiles and C code.

This patch:
  - Fixes MediaTek interconnect typo mapping mt8196.o to MT8195.
  - Fixes MediaTek regulator typo mapping mt6316-regulator to MT6315.
  - Fixes missing CONFIG_ prefix on DVB_ULE_DEBUG macro in dvb_net.c.
  - Retains critical PCI_IMX6_EP and Tegra audio prompts to keep hidden
    symbols selectable.
  - Cleans up the dangling comment in drivers/leds/Kconfig.
  - Purges the remaining verified ghost weight.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 Documentation/admin-guide/index.rst           |  1 -
 Documentation/admin-guide/lcd-panel-cgram.rst | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 Documentation/admin-guide/lcd-panel-cgram.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index cd28dfe91..70c0bbc87 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -152,7 +152,6 @@ How to configure your hardware within your Linux system.
    gpio/index
    hw_random
    laptops/index
-   lcd-panel-cgram
    media/index
    nvme-multipath
    parport
diff --git a/Documentation/admin-guide/lcd-panel-cgram.rst b/Documentation/admin-guide/lcd-panel-cgram.rst
deleted file mode 100644
index a3eb00c62..000000000
--- a/Documentation/admin-guide/lcd-panel-cgram.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-======================================
-Parallel port LCD/Keypad Panel support
-======================================
-
-Some LCDs allow you to define up to 8 characters, mapped to ASCII
-characters 0 to 7. The escape code to define a new character is
-'\e[LG' followed by one digit from 0 to 7, representing the character
-number, and up to 8 couples of hex digits terminated by a semi-colon
-(';'). Each couple of digits represents a line, with 1-bits for each
-illuminated pixel with LSB on the right. Lines are numbered from the
-top of the character to the bottom. On a 5x7 matrix, only the 5 lower
-bits of the 7 first bytes are used for each character. If the string
-is incomplete, only complete lines will be redefined. Here are some
-examples::
-
-  printf "\e[LG0010101050D1F0C04;"  => 0 = [enter]
-  printf "\e[LG1040E1F0000000000;"  => 1 = [up]
-  printf "\e[LG2000000001F0E0400;"  => 2 = [down]
-  printf "\e[LG3040E1F001F0E0400;"  => 3 = [up-down]
-  printf "\e[LG40002060E1E0E0602;"  => 4 = [left]
-  printf "\e[LG500080C0E0F0E0C08;"  => 5 = [right]
-  printf "\e[LG60016051516141400;"  => 6 = "IP"
-
-  printf "\e[LG00103071F1F070301;"  => big speaker
-  printf "\e[LG00002061E1E060200;"  => small speaker
-
-Willy
-- 
2.43.0

