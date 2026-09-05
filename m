Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C449F109
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611700; cv=none; b=LYjha/s0pWi2J+wzumvon0pLIQX03GKN0USTgE4lUXCHPsjkM1eFtkCyKhl2s/a9wj75IgVOmVXd7NffhKFwJvy8VGAVcktlD8705AJZlUvyL9lwS1DMh599h8GiaYcsBtXKtpcNpedTpb+eSiXrPHU2YODAjbci6PeB/w4EAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611700; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWYUPkfPbVX2FYdJTnZigfJ/odzxODj0e7VAGLfCs8jPNjd1l801TAzC2kull/n7SK8By2MndeE5Jiddt61DZzKjD8S83ktxAMZjMb0Mi9mhjHayglupM81w2Q1PZT0WrB6vch31/Iicbx6Ot209yoy0ECxliF6q275EwcNjuI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtbnSs8q; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtbnSs8q"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1781359a12.3
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611696; x=1789216496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=YtbnSs8qfPdzgH+oeRaodn+q8Vb2tox19c9H6lxT0EFKc+LY1/TEPedO12k3EV0weq
         ZubHW2aMvu5d9wRdvZ2JZKz7OYJGt9lSYnONx4iIPgTgklB3Zi9nQUeDscBHQNI2nipN
         8PAydIGehlYBeD+FYQjwg6pUJGFz8Zv+UkkQ3/NrLop+gj8ozrTjmwWo2IbPI+M0RoI2
         BN+5/uzNIMcpl8wO3T4RqLVBYURIS6zQbCgT+MIiipkpQV3o9deat8Ivesk3Ege7KHGV
         agTdBI1D8e/AHP9rHdTaJMom7wYS+xvDGlXRUX3Io89bY3cqjDkY4ewjOrVt3ANdSDC6
         BPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611696; x=1789216496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=IsFk1hMObaHT/rF0Al2eMZkniGh5o6MIPL6zbI5aXfK4/NMRlQ0pGNatPnmEjIYlw3
         jimIn/sTk9nXoRRlC2w1hfCWFeDQgCbdScMqJU8uOUKrNv6vfnXfbnkZik7XXk6gYHX7
         IcirCXDn/+/p4NpmF9eQ8uEapXYRAL7Z6Ia1Z9jy96jfE36qROT7F3ed76bZnObXBphH
         SwsoG/dEKNRRDGmkQW2+FgE6DikIxaRdzxKzSO6qXy6++Rm0Hy8SyAuiJU1nX7m30DeJ
         Vmq8/X5SBfrniR/Mb9++osyCNyo7gLgyocmjcd2kz29VF5U1nRq0LDB1v7LmNWPBE0ho
         xLCw==
X-Forwarded-Encrypted: i=1; AKwUvBwSi8+nNO7uHNFelVSf5yeAYhJwiUXHcXQyHYVPZ9bdT0AUrMR4TBqSlf4cZYfcH/S4Rm+riM64SJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kMbFvdNYKMiiC6D1lkzXFS3Jyje8pi6EtHmVrhNlJEGBEa7vNx
	FFug9mKYvReRCYiMBMxKqsA5SjY15cYQjV9q1lS1CC1ZTsitClq5KSuZ
X-Gm-Gg: AYBFou2AP36v+VwV+Ki9C2vz5J5n+Vko4FLKcR0dvS4ALtu/HYdW5Lq1k42/aXpEi2x
	iZJ/fCBsAjiHO7QrJB5X30KnZesp0qMbwpjGd4pbiH/C+PL4a21HSqM6kPjtPn0JhVOEsLGntW/
	AGmlUVkcTK4DQ/go9wCQ9XLNQZPdngC64fRdjaKbV6JKp6F8mUoCrHYe1YcClWx8zIPGZUnh/S0
	vxEI+q86z/cT8aysXHba75khcxJPZ+RYBC6X7wl8kPneRZ6b3Fj0SB86ifE2RWORIaj75Dx05J7
	0a/XAeqtVLrlo39+I/iuq+XWPawo5DTiid7EBxF83+f1pznr7RaS4va24PXubHz4JLsyB06UGTW
	dpRVnBAvjgayw1m03TFcUdt6YT7tGyk6x5NIPDWNyWdyiWI+yACudRdJWlFpTivXxvbHjlDFW3Z
	3HsNRO3GJaNKs2FYkc9XmPOySnrH4LWn7QU9VF52PmtchDsl127t7Qm8jM/A3e5JrFs/5B+gQ13
	bJgq1rRqEF9TVAcbjyFAhBVmko6Rfzq
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr17366120a91.18.1788611696373;
        Sat, 05 Sep 2026 05:34:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v6 1/4] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:34:47 -0300
Message-ID: <20260905123450.5620-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

