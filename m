Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4720402E
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702252; cv=none; b=gue2d9AFxnBOvUOXzJ5G0s8of0cWoTBS0EeVNCdJ0IMldDAmHN9/mXtPynlbx08DnFbeYvVJcILieDUz6GMbUYlCy5E7wLG32LWC37UChMIEwYJS9syz3+eHJDaZ78Cf8AuJRhfY/aZt9f7xaa32m7hA3RSClN0DV+JPuRQUqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702252; c=relaxed/simple;
	bh=Tf5SSu/dwKpmtutp86BXzxJjLmaIFwSGq4VXqGNb0f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+itFSjkih3Azlq7snxI8AU0dWwkD/iBRvt/GHCJlUQYzybwNn+4wY1/AcW7bEWH0IfgSWGUVrw2/NfCwlsVkWmlrgw3/LHe8LQl7vyVHNxkjitWVWAb8keHUtNBiHtVxeUsboCEU9XH0ag4fGnz3Iq5j6W7uLUe2Qf9aGXPvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Gn8NGfry; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Gn8NGfry"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431688d5127so47409265e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702249; x=1730307049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
        b=Gn8NGfryCnYDFq0f5SzUEVth/qZ6rLF2/hCHopTUqJQJMjphyM2FGLjpHWyXDDfQJ3
         Mv64Far1rQKueknLLYmwE+9KO0fFhhbf1tat2J7vVkJNjQojOe+l8Wsg2F6DlvF5TmmF
         i1USbBDE+qOnwoCCJIiIyW3Pz07aafnVSjrNMnNKbRm8aH8QOFXWbjEI6ONlgbgbDUpp
         VX5sARLoKBqg6ynxAR87zPY/juYGYa9hz+Ww75+ZcZg9P2KPYi9JWgleyQX+y80pNeRm
         y3h6Ad9zjPIzHKmooU3O3OGPxZ9fdyrgDNO33x94axAfYiIfmdKRHGUqqgzwOU6rVz7M
         JilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702249; x=1730307049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
        b=bv0RRehxITyAnLjyGJpdMXn3WnjaAglkTdgv1EzJEse6bXaMKLOqF7vEk3Izyppdn3
         4gb8pPpY31ImFPZHf5ZPNmPLunZhWNQr3YxTZ6O6Bmkh1jo0ZGpNclbYUnWh1wrXfW7Q
         ZlL+gQsJlX2INDwl6euHNpihkhuUCU9kjcXmW0Qi/nZ7ZfrZ4LsfS4oNv5u4RxUbKxxB
         8jELQu6brYvcClfay2wsKhF/gm3H6kGU7mKfk4Uk4PWQQuu9PUOmcOIeGthq2nlHel1k
         +PJIDPW6BW8iVddaJUI4RDerpd2yBpReqq7ChkjwMaTLQmd8bUoYG+6CEmEc81/Us/km
         v1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUlMfyLgUTDfqR152MDuTjSwlcwwRXxsiWDqg3UWXTmEAN1mJVaqE7IFv3WJ4PTMNKEGtudKmD3IuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuC4pveWWNgO9FSFBELaq7EpxfDu5pcwyfIojzrC+q0N0JdQrE
	TEuPzTGXWA3YlZU7Tesv2tV22+Msvf1F5PYlKyklr74t0ZfkkP62NGeBYuivtYg=
X-Google-Smtp-Source: AGHT+IGnOy6934iu4X4nAJLDq42XcldaiFx0K1e85HTnwt0PFdy3j0mfVRmbr6x1y+nTvJQlVW7Bhg==
X-Received: by 2002:a05:600c:46d0:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-4318419f2dcmr33339855e9.32.1729702248667;
        Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:26 +0100
Subject: [PATCH 29/37] drm/vc4: Drop planes that are completely off-screen
 or 0 crtc size
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

It is permitted for a plane to be configured such that none
of it is on-screen via either negative dest rectangle X,Y
offset, or an offset that is greater than the crtc dimensions.

These planes were resized via drm_atomic_helper_check_plane_state
such that the source rectangle had a zero width or height, but
they still created a dlist entry even though they contributed
no pixels. In the case of vc6_plane_mode_set, that it could result
in negative values being written into registers, which caused
incorrect behaviour.

Drop planes that result in a source width or height of 0 pixels
or an on-screen size of 0 pixels to avoid the incorrect rendering.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c084967d3527..94737c587f20 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1230,6 +1230,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -1753,6 +1760,15 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen.
+		 * 0 destination size is a redundant plane.
+		 */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -2135,6 +2151,10 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h)
+		return 0;
+
 	ret = vc4_plane_allocate_lbm(new_plane_state);
 	if (ret)
 		return ret;

-- 
2.34.1

