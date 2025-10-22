Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D0634DCEA
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142910; cv=none; b=b4DOzjDsmpqlshZU9E3jvto+/iPHw2s01GKMnVDZs5eprO8w82E6VB/J2tOcyOOzNcWx6Q0V8+Gaznv7CuM7qx+H7ahnT5zZROzkUzuac4dum+6gLbJXhtAVz5RdBtQtt5eiuYgxJTBEd2T+t72v+yH6DPyYbSigkImBDvn6ZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142910; c=relaxed/simple;
	bh=PeHm1wrR0AAPSTDMxiNgwUZQ4BKQBSCJMUznSgFPtDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2XLxORyTCyGU51u07X4SoCvgOwHToAWpDlA9CYd+fb46tp2JofvlY/4K+djxgiuuYpFfetn0raSsMXs3TJ/9fJEt4WbkbKsOg939B2BCCR1zlMnkRS0jSlIWQkdtFhvhV0K8SDd73dO4+Lu1Qd3QiBo1zlKGbiWD6SFGD1dlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBoDw4dO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBoDw4dO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4710683a644so9496985e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142903; x=1761747703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=PBoDw4dOVdungSvoQ7R8Nd8jMHcVY6n2Ef4TXgdWaOZGgbTQBR09IlTLcf1PDpUnM4
         +oJS2OASDBNhsg8KY0r/47x4LEpuyCt/9xxi9ZfhaP/gKkmDhHdTcVWqRg0t2eHSXLVN
         UbEgSleb9pdbF9MZonU9wzUUUC0HVmi+pAjGX2ZQlGRPA/o9aGm0Bfa1dPQ9Ugwk7cAZ
         bx60rBwAQocbIUAJ5okAFyV8IeT+JplZmYt8Rskrf68oCjbic8nWQ8w7vFzOHbGINoC2
         yyPaj119da/Cai7tN2FU2jhuUT+MvhgHkxZKpq1hfqim3RHnuHKnDpRQh62KYb9BlE7o
         +3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142903; x=1761747703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=dmCb+TRUEUIjJBhSoKwu+/9FTbfXqKwOP1wuqr4O8f/aOuiaA3QUixOf7uW+ySjBW0
         cYHS8aB8pJNe433RluHqu1M2SDc8Y4cBOjIlxULFlblYTcGaVXmJPStbWvpcT635N3pE
         gIkFsaYoZjPDXptWHE7jT8yJpfhddGUOgYBwdxzkF8IMCQUZc6Obtn5jYzLr0/KKSJiH
         dqaF13WPpeRbflSjwz3z2bOHZ9yd+avBw+JcbC/in8SeM6AY2kSU4G9cj4MJUX0gM83+
         5ShobwIK2/zifQwsZ3wNdkXhL9eh27AaEDhvX5t3kwqYJ3UKBiN4GvCS/FFGh8SISwWv
         nDzg==
X-Forwarded-Encrypted: i=1; AJvYcCWDa1Giz31RWbO98+asXa+9we7CUdbdA1FiwUyC4s1qPKJcgJX5xeap+L7rLcsED6IDCVp7cM3IBB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfc39g0+bMOn/9R3KWW2dk+uMR4ewWWSVfJt8wXm67wcONL3dI
	Nm8fKDGwCNddgDzKeZ6NLsBXcjeMqnt73lrQ8inO/i3Ye2vKn5JoChQj
X-Gm-Gg: ASbGnctEniIm7ykPR8BKjjyXS/Kaqwbgur4cM3yta1UvHwQ5T48RhJqkWDCDq+ZhtIC
	AOCqdfTDN8+PwH8ZJedEOsK7vo+ZzEDVCrDOAByl3lhBtp+XZxGjRsmlDUTiZUVO+ro0E3Pl2iz
	XPWhPbPQZHiK7/uCYDvmZ5u+/w0xn35ujvYIr5r7NntSHPqY+1T7uKOawxyMaoYM9QrOMmW4N/d
	DMzNLB/3E++v+Uzgc/houiv3orwyDNloWTVJm4KvzAvMBtOZYnyJU5CvRwxEKaFGTsjrab27hws
	EJKQW/A414Tni8WH7iaY7TziqjgQlxMr82F1hoqA+IMnfGAeh4cleRl/BMQNrRgreV/YSuwvSQ+
	YU2eQDk81MEYbUL5wmnc0eRUPHO0YjsNGX0TB3o/7FshZUmKYzhBeCYsxLClcf+3NIUnVdTQ16E
	G7Dw==
X-Google-Smtp-Source: AGHT+IFzZOOF0atmxMPwb2Ue8vrmfwejiEjF1/G9gDbf31n6b2z7qklg1cXO9eefJTfh6D3ezEa6PA==
X-Received: by 2002:a05:600c:8b84:b0:471:793:e795 with SMTP id 5b1f17b1804b1-475c6ed4639mr13800775e9.0.1761142903064;
        Wed, 22 Oct 2025 07:21:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:42 -0700 (PDT)
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
Subject: [PATCH v5 11/23] staging: media: tegra-video: vi: improve logic of source requesting
Date: Wed, 22 Oct 2025 17:20:39 +0300
Message-ID: <20251022142051.70400-12-clamor95@gmail.com>
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

