Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295734E772
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142916; cv=none; b=Ybe1UqokDC02ugEAGbwzRE1k1xG1SI4G2kH4lq2QZyW67mGwzpCXh+m/oEFaWu0hWdJyyeG2XQFhuS4EZt78S3ZjavYJRRf3CrqXAfaNhgGg/AWTasxiV3c/hosLiCy1hAKkZzAtZPB+PNqdIE4NOjkCYQ6wJnpU86V7ATQEF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142916; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwwSmNvIcObkj8dMOdeXW7pOKi4cXJzibMjJh9f+DLzIpr9ebNEmzY+dajOxXooe7An8Ylm5iA1pBbykjo+hWt0x960fHGOcP59t9SiHzEnfheS5TuKbseskkR/nMRsEyguAtTNFQgHg1Saho+q5/9yEEZhUDmVNX1SbSFOv/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0iDgEC4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0iDgEC4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso51214835e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142908; x=1761747708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=U0iDgEC4ll1KzUailgHGuGg2dvZyYCcri8Ik2xZvDn4/tK8FExWCzrToiAITWWja5V
         4jA3X4YERXMM9ose00DPofRZvynA0plLfBdirZ+SLHMXJDhxw038TC+K4JWDaExEV8fZ
         fE9zZoLkSlqs6q9fItnenRl5Yfz6XTV5qf3ZY1Hhfuk6ufYWP0V1hvxwFN207DqgjV7s
         FVrvLOEccT6+4RkEzP4SfokwquimM/ZnYXqIjE3zKrKNaaeAVprEYqS+0GdE/gFxgJd+
         YzSmsWK+zrVU2RpXgH8LYJ1C5rkqUWt4hgBjFrOyBIFg4rYhMu9vxk804vRtX4fXX5i+
         xbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142908; x=1761747708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=IpVR4fArivg/+ZmdlWK9Dv0FRe/RUQ8YC3Qe0XVccQysAnGoAKW/AhkE0i5ZS6CMYh
         4CxtG8f9/jsoAMzLUvrHwqUjkT8HSBzNjypFlmj2/b3Vi3iF0/50fZDk7GTSGcY4M6hR
         +qcon3RSC86XKygqS2BXHm5799aHWypvNn6W9PYNr0VcutafpHlCIolTrQDgi+mOMNAH
         cfUSeJ9Xyn8QMzI8yi6ATSgpAsEIMtrNzH3ldO9boWFEfZm2Cy5aEfa7Hm1rtMyGCd/I
         ved+ANGqafQwXMW3hTFHa4iKxzNqfK82Lm8c5WWhBXSpZsRMYORftmzJwoaYuZfVv2wU
         z5sg==
X-Forwarded-Encrypted: i=1; AJvYcCWzwaRUnquXkmp6RZGKLrR7W0dk/D5YLw0Kwm4tzBumhmfJ6EpMXrqqMIiTGnP6sruWE/9hQykun2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfyAOz7J2Tc7xbVf938MS3NhLwy8fDC6ZM3CKAEaVTXJo5ZB9
	tiqdCs/MD+mcW42/kkZOQ1QMgnYy3KrHV9Mspo4KQuceyvIxi/YgGloy
X-Gm-Gg: ASbGncvgakrLRl+K09MfkUV4qrdUaoCDpiQwWtFHL7CF5Nc9ZknupNv+X/zUqjq3D0Q
	Rl8IMo4n73vGA5kALr6NE6vhZKhcJhvdIV2JvB8KYl1fGp+4MQsxgH8ANf+dHiprdgeoFR6d2/h
	Hvc2asMBmKeAxu7cOv8r5VWRTXTh4cTUhFK9RG8EbZW1pskjqvrv1YbLmoxScj/OJCTxDU2OOtP
	nOqPU+1qdcyW64846wfK5eXVmNneOSmTEJphqxZK4ViH+5fZ7f/cOvMMwrBIBhU5w8Qmua3gXi8
	ukkbSI5v06ja+UP9zi1tdnYx5k8dHN4IZeiKDFPB3btGGWsEd63W/NlHSsfH4MVo4OOR+1YDDFD
	gXyJ6Owf+urDXTS9lr7iZS4DDtLXapdhOvwqJ5Qx8Gmk2L0ww+Mgvab4C2aH9IQiAddhVgCX8F2
	w1dw==
X-Google-Smtp-Source: AGHT+IFq9V87Zw7qGeTmSRrPB3JwZR7jtskG/uf8ikZdxsnRyJSInvVy1UaH8yLg4G5ahmvQ9XgogQ==
X-Received: by 2002:a05:6000:186f:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42704d7eb23mr14938377f8f.12.1761142908345;
        Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed, 22 Oct 2025 17:20:42 +0300
Message-ID: <20251022142051.70400-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

