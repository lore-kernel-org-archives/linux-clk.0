Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6034C98E
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142901; cv=none; b=ZZySRJn35HE6icT5KCD9rGw8WqDbPPvMVSetxvhD1xxCM1AzgzRyBQS0JUEgGIjP5+OKAvgbwlw2tn6B24P6m8B95+ezuf2LpCKNNlWLYRJ62yXQ9oJYQ8KOm/0kTXofnLL9u8AWYdwU2UwJsEdpaZ3dCF/khSv8alOy05dUrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142901; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFjXB4/wMRrtZPTBAFhLR97UVahFsRLd8+EKYCrNA566pnKvkLwqjynZxZxKRkGc4VjZNXk4+AS8JV658hd9BtPWZYDy4Hjvo16vCQr+lKLjsPNiDa2j4iY64RFVnmH6TYsp8xWo4c1GMMuPm2AeUsjMxEPbRTf6ri1WIcjoYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UucIpg2n; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UucIpg2n"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-474975af41dso15805475e9.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142895; x=1761747695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=UucIpg2njXrElxJXn0QVRH13QlN1mvRoiWg0ERm3uZvdhE50xg5vLmw3mwWc3qdkcp
         WjqWpoE0C3UDFjRfOuMJ3Kcek05+mnxMAuVWw3EwVEOMx0vRm+lRuk+zfxlTMsLsrxTB
         P77z2S1TPqGH/CAH60uPaRBO6QrbIi3e2CV1XXiRE8ug2ZABlinb1BMlLFE+KP8mpPMY
         nuSqvCckxpnXWdzgOHrkI6q42+NtqQReoIWMrWdcp/2vGf4+PKGVH4f2/HG2TXpDmA6z
         aq49WcEjPYH/9QzJdcshTXkIVN5GJZg4VB6lHuYFQKf4a/aJjIfZb69Gy77RDP3gybA8
         o/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142895; x=1761747695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=poAh85wX5t71ncIaGujUtSQ0T4UhaiUahi0/TD8dsHGpWplEoXeTraVkISedhCMJ7t
         BqIVjGA67QRBCB4fa1zScVIfieP/ZBY2q7MYw17qUH5jxYBPfPODULNrD5g2CeXD2s6D
         Uo1wTk2RkyxpbLq6BGLEraKo+wRUoe6E6gRNJLwzhpRKV+d9GG2h89Tjrn2JETSglqM/
         oyoJ0o7idfH91uYeedVdXzfpGN8jlBHMtoObT+tjiM9R0n+W9Db7dtd9TCqSwkQr5RVr
         kVvrl+rkv5rl3VoUIs05XtlBZMRx0eU0RfFSruqpiTEUao72vSTwnDn8DJ4tKmRShZxD
         cZog==
X-Forwarded-Encrypted: i=1; AJvYcCULvT03mBVjjGxidjjg3/Cq5x6iu18scIJCSFn1UzFBihjo0RMNTkRJzYH0W0QQsi4OV5IUOYdy5OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5MNWUTpk4a872glFV7EyIQuk4/d+PQNpLQ1woaJEhKdk1WjJ
	xisRdJA+dls0XmtanZG5ymwjtCyhx25gw6ib8cWC3ZWDdfzww1ma2K4z
X-Gm-Gg: ASbGncsIciSXTl5Xdm8km15lwC6dgmDpSS0vDmRvxqUEvAtvnmkgwkIP2DujWg80mF2
	s0cmp804bX2W6jen7ijp0l664PyNq94uetR978rq0PvyQEcsOWLigPy+jKSsOie8u928EgAA2vN
	SPrzldmoDCsJQX7ctsoNjmnzu0tj3x4fTtAkjkzV1KCIcvCugh5GYJF8RPlVwDAIh4YQTeN+hDy
	GQiZUtTjx8FTDrSJaAY72X1DujQVzlu0eauAt2kDTDfZwHXjzDe0uZOpF2xcLss7yHqPZL0PKDW
	qMCxSLpjZjn0P6auo16vOB0GVkWKpnsPaNjjx2XnOAnNkwKoTB3i8FG29aB1DChQJUg9m0wr/gp
	I0AuXLe4pEDNdGUL7MFtBa6n6qFavDSwXo0b5ZmFmGF+9Gp6VUnhiYzyYcOEyf2LANDBDWG9O76
	HSzA==
X-Google-Smtp-Source: AGHT+IGaJGEihzS9F6fnNyhHVGRwXCsOXdE9dlWNhp4wiYwBqGQCgmFf5u4C0KR9SkCEnEJDDokDBg==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-47117925da1mr126433075e9.38.1761142895124;
        Wed, 22 Oct 2025 07:21:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
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
Subject: [PATCH v5 07/23] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Wed, 22 Oct 2025 17:20:35 +0300
Message-ID: <20251022142051.70400-8-clamor95@gmail.com>
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

