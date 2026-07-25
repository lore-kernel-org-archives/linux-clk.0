Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0E388885
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949592; cv=none; b=rxIJwm+6sfrXASzZbk6ZIZmgPRmUZ7XVG4/b/Y2JUVv/BqFCDAXydIJU37VeRvYzI3b7LHhSubSCGu7W5b0HkGTaEdX/zk+oUrNmSdI9Co/tiNIRy3Mm2T56Vdxu2/1+hNA8jIE3GnLUpD7moCfIP41J9nQjaESrc86DtoqfW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949592; c=relaxed/simple;
	bh=w6ttYgU0lJiv/SJUYAPaXSKPoe0j2NwHgYQpCKODV1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnj9IxAgNzBIuhNnxgxE4VUK6vUmT5s+DvC6fhEd1MNwHpNNBvOJixbzNEsWECt2kZZXuUDjAJd0E2bRas6UDDXrmZYuyEpw9yJf6584Jmo3naq7e2bg6r4TRqke0eQFXFplM4t0x9Me1rzrf95kpRCDYq0zsX3PXJERhAgqXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chjdcqve; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chjdcqve"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7d1dc4554so538837a12.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949584; x=1785554384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=ChjdcqveBv+j98UA3BUm5jM9h+n2ym4s/+4heEtse7qfCRM9EXeZyCjSCzq6VhF4cd
         R0HHyAv9WFequNhlMXsK04hdZtN98FtqvRGyTzNnlIcQUQvzHAw5nma0B2ErQdhduiOm
         3IF+5wD2UhZiBn7LdJSrOB5ThHzSBf/HrTJCU36qUQ7wjNGYpbvzWAklVdUBWWNgRbX4
         oZOjXHRkToS8V0l99osKBGa82rJPygoeF0EFsA/IBeomZvEW0Dfq01QtVXWg39JUInfF
         0ErbuGfTTxr872+vJFBnXYZJs4T0i9TwObRrsNuMJvS4jEk0tevA9wZ9KqdYCoPDQtgw
         kqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949584; x=1785554384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=kqpDsTP3E+Bj5XdoTHfTGmmWW8s2l7iFN3OnqGxu0JTp4A4zig7Xlqha3lBjCCEzi6
         C62TBxYMJC8VeMkz+qcGjQOEW0Xyut8UUxVchqZg+K/f/5mTq40J+Ncr2AeK/5LPDa8/
         qKbXpEuqcKsvteSmapTT6t9hcnTHJe+5AQ+0jExcLN21Do8tpCeb6W+ClqlzG1m1xwXI
         T4vJ7GeP9fcyaxIKG0vRzTgt27b77zdnSMDZIowLJoMltbvXm4cHkQH+1xDML05U8ELi
         vgfo1LUmmEkCWWwwH0kHypv0KJQwn85f2jDnSh/ZXZZo9KGraD8ZNaeyzBDw5PRmAinW
         oRyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqnb5jbZ9ZQiMcFwNK1xEoYJ+2qerCiKaJD1CyM0Pl5fM8/zp2CCEuEgaTCUoXdMiShRP6lREkPEQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwRc5qo1aLWNI/rebrN5dF5vb2tpVJaLDn9Z4mlK9vXeqyiOP
	C8WFAbjbach/L+OLOd0YBzx3XA5zKKy0tS4AREJQVWVmRhinPAOi+Y9E
X-Gm-Gg: AR+sD10iNjc6TSBvSVHD/h1VT3tLPQzNahcH/hu0KFpKmBQQVIIbY/GkwwrG8S3vgUw
	CH6GlfA38AJ05t9cov4Q0lOBIu7Jyd1wCkJNroFH1tPOYAfMJHyNJqcghOo8l9WO2RzNTdqPSuo
	Q+juqe8ckYNi6jJkiatjfFrHJDtP3A0yoi8mynPwXOOqxszoofpIrrLQwegqHOEVVmE0Y3DXnQf
	ubdjjSfiQ66bhJbkP7ftKznJTOqR3jmel5z8diIcUcq7/c2EMr2fUSQLxxtTA1IDJrda6qQER/w
	JmPyzVrBoBL50ri0Q53xbGCxHICMe7Rn4y7blOQ2M6JZj0l4uOXi/ea/qkzLuAhcLPcvBQY3uh+
	1QDiEvFPzE1pZ2Tnxrsz5DzHQmSo+c6099F24BQbLdSb03mepms0KeIM=
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr647092b3a.13.1784949584567;
        Fri, 24 Jul 2026 20:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:49 -0400
Subject: [PATCH 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-17-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0

