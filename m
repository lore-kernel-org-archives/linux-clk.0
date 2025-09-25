Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5F30AAAF
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813457; cv=none; b=eKiIQdCDVwXQhxtcraJsgn/1n94dOYmbj3a0IAuGiLXwWdNqiZru2q60iHuXAQmLGC53S9wC5myE2mWEfeo+f5V0rJ2PZ7YFY/QY4rULJQzSBcOmxn6BB/Gzta2HvR8Zx9NNSqIMSE/kwvyZJr+NsLVdqIlSoYOX9OsBGwGS6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813457; c=relaxed/simple;
	bh=PeHm1wrR0AAPSTDMxiNgwUZQ4BKQBSCJMUznSgFPtDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qgq3D9GV7PVxqyHI5icm4ya5e58jI7gxSBW5n2o0ug77Y0ABYt2IpHcv9pSiWTmbZcBz+KuRz7Xs5yezD+UrhuZ0nBO/5Cg/pOoPF2k9oRg0RBEgffi5htiVfYcrFMqTvoCjCOWTBGNUZkh/Ac4z02Y+HPVRsnsWJW3c20VVFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuCwawbh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuCwawbh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-578ecc56235so1057264e87.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813449; x=1759418249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=AuCwawbhRtZV71jWeHmlH94Gb8pbThQbmDXt4vUEfYGY7WrPvgEGuE170iOp6USlo5
         zzQMn/hylFJmv9fOOK4X2FHpNYRSrabIVT77WalF0vlEW0qlcoEZAoqGozYiOSEi/E2z
         YcHuIkPOcLBwptpYl5dZXAg+hUsZOwxXsaM+sLV07NbPDHDWBSLP2JX+zBFM3E5ZtPZ7
         vw1REY7l355u9ASKYx4lom8N5uyvfG3LajqTI00RXIf1cDsNKry3g40SXreXMDnZFrsE
         lusRhQmT0wv7FrA9vr6JfbmDAEBpTnKRGEA1suqdzLaa9wjSMwa+IFcnYsmNM3SwvGSQ
         nZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813449; x=1759418249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=kRuMNnsQuqJnLViWttmWYntcZzRJ0ntiLnY2hbmgYYzVpfbPnWCPzMDNrVK1ntN0vr
         UOKj47oNv2yuoNkvczCnRfric6toGhNZKaf6WWY5BlndW12Hq4cfXU+hGO63vckmbL74
         c7fLuL+mMnukEpf/MWZ6QxO+EQKt/8ncBciTlt1mf+f3lsSxwYurlZ7oHhtLreri/T4u
         AEQ+ShYmuJkTmzL8/DEFn0jma1G071qYaoYjxZSmqFuzJ1rOPYLFUwYN7g5R0IGtqypi
         iPdCT011zSp8rHS10IWAKpmNyUwUwwFvc6a4P5Xc4crk8ELiyUDE0KkDc2QO7oL+Jra4
         /GYw==
X-Forwarded-Encrypted: i=1; AJvYcCWScYRjO2CmRVBuNjQ4E2NwkjAtuf8J6YjVywihNOVx1vDaW3s6/F6jFzOkjfiNwR3E9TMpg0sI5KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFMdqL1xvaTzi2SLRXHZhYw6FNWk85RpRu0qpmhdgzVrmuqC2
	TkrQMgmFsnKRzzY4NH7YTaIK/iLIHZgNrh1MSx7DY2l1xBkatdDCDHbn
X-Gm-Gg: ASbGnctfZevhZ6MXwIOoKp8PsTgsRGbeax4yxXWWGfOMiBSR0zzrOB23NJYrbkqOxpE
	9uWY3m3hfWOVudAc9w9wsz3/UgbwszVLNxTIdRJzr5EGfd3Qwp9JJbhRuQte3yhwD797nFPXKFm
	CSe2uXQ34XiOwZpICM3/o6qeEKSIU37vB0lG79h7KHE51FajZVtlgwjeRkY0eBp1H9MwVxDL8OY
	6m8bfj3XWUHYAB5KDqb2rRZBiDotAGfIutm+RMFSR39VRRokEh/w3n/wRDPy6WEZRZGcQyUxeuw
	xzR1txaet8I8RD0FQTrdzeBbXilW0VBR7BX/PjFmIgoenhpnH4N6TRBtOsLXXnh7D2XLVc+WRW0
	2+Ceyrvy82WHg2w==
X-Google-Smtp-Source: AGHT+IEpmsCgXoe+pHNnDNycPilUYF9YFAYkKb7YBcFS/w6Rr+i+BRLl5E2waSe2wlPmiZ/s/OW9iQ==
X-Received: by 2002:a05:6512:2213:b0:57e:ad46:b0a0 with SMTP id 2adb3069b0e04-582d092f19amr1131015e87.6.1758813449054;
        Thu, 25 Sep 2025 08:17:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 10/22] staging: media: tegra-video: vi: improve logic of source requesting
Date: Thu, 25 Sep 2025 18:16:36 +0300
Message-ID: <20250925151648.79510-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST.

Define tegra_channel_get_remote_csi_subdev within CSI and add check if
returned device is actually CSI by comparing subdevice operations.

Previous tegra_channel_get_remote_csi_subdev definition in VI rename to
tegra_channel_get_remote_bridge_subdev and use it only in VI driver since
core VI driver does not care about source and does not call any specific
functions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..ef5f054b6d49 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..04b538e8b514 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,8 +160,8 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+static struct v4l2_subdev *
+tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
 
@@ -182,7 +182,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	struct media_entity *entity;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev)
 		return NULL;
 
@@ -204,7 +204,7 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -217,7 +217,7 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -1630,11 +1630,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
 		dev_err(vi->dev,
-			"failed to get remote csi subdev: %d\n", ret);
+			"failed to get remote bridge subdev: %d\n", ret);
 		goto unregister_video;
 	}
 
-- 
2.48.1

