Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508573FCB2F
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491596; cv=none; b=s5aSsAwZJJreIvSHmx9XFTS4LunddZK5uSXsLxWFQjsBAIC6vBWmwhlRWLCHIxF+Ca1czKRzf8CF/i4ugu+RUg5RZPEQt/srLZj61vm6llwl7LG+VZsAm0pE8jkIOgPgZhGiwENhvuPtpLDlowvJVaTAuDkJLoIqAVGsdlTzzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491596; c=relaxed/simple;
	bh=4C/sb0FsOyRTobfskpY6am3zXhp6RBvbExjHUf950gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKZUNMbtMrWJ1vL8216ey9RWLo8CbeFaHYVNxYlsA/j9Ldf6EzyWxFb8N7seVxIzjD0+WFbK8yKuNiaZeKPSe6vE8558PufGrMytkxtOx1z8atL2Rkqlw4uZRmTisPp3DGMvG2AVFomRaO2/imZlj0SVSSpeTKrFt9rsAO0XgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJMaqtT4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hUIf8hOE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJMaqtT4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUIf8hOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
	b=TJMaqtT4G5r43eFhfmKEimS882GuQLXssBCuEu0kQApOEjGJ2e0WZ2KXs+xmIPnURgqEdi
	x0IndM4jND1QHa49moAbSFCbX3iufwG8W7KrDdJBlaYo2uA4owcZf45/wDtrKCXo1g+iH/
	VDmqee05DCOc232/nS+Kwci4K4WbJTw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-YRuesoIVO4SydHL6uShcNQ-1; Fri, 26 Jun 2026 12:33:12 -0400
X-MC-Unique: YRuesoIVO4SydHL6uShcNQ-1
X-Mimecast-MFC-AGG-ID: YRuesoIVO4SydHL6uShcNQ_1782491592
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dba00e17b5so13278386d6.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491592; x=1783096392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
        b=hUIf8hOExws3Vc/5J+tpfDPrddIHPsZSmkccUxGki744XehdibnWha7gKaFg4xYbn2
         3IV38Jo9oASlTrGWgzprk+iR2t9w64Mila6rK2idxq72wAWmeJZMxKLtNhmTJ6e6xMe4
         UxoFiRjXIpS2XcVsqANK3XImeetQPRNA/DUu4oqGwHkz78i7rTys0NKeA68viIK5SS1y
         fjWh4i8I4NG+sMXDb/VOYn9bGV6iosHozvGc75UU7dZomvRRM5T1Pn1yDGhLKtJp5d+d
         2zNN1gWY41VpmSP1/IQdNI43jk83alLIzfyVbagUIH5HmPwOizf7ZWUiOdClD5GCbgnb
         hogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491592; x=1783096392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKtP6QhUoWmCLEY2y4AAmxBC79rLmGi+P5ljjJKkkTk=;
        b=Fi5rTTpdbmTE65gIOHmlGAA98zG321vzRchXXgtUnyMS7zPZwz+N9yY5YrLabbAaCC
         WAyb5yL764Ne/RQjx201EqomrIuyftfrQBzBSu0wg6C3S9/l68I9FV5tgxrzvvO3mw5C
         4kDeittdalZ8ZWUDBl9v8iy4dsVfc33PCsc8rakKEIFrKYqnTzV60CN6bx6Am/hNAFAS
         RGK4buM9aVgMzXIwkxKzhh3QnWnnLU+TpwiSDdKNTtfQAy8RsyK4TQ2ac+vIZ5kOjrkj
         K1kYDVxyJAcjYG718ILUdkd12iCqzI2ppEwlYysoK7MTOOiAFbJrEQJxBMJfkdcRSucl
         95Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqBdfeHFIL0xTrZqPa1iTwcISWGEpthC/bXSpgiWagjqPL2p4RUK9/tL6+DW7RiFxAbiY3EZT4x3Q8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22Q1euJd5M9EfbVy9AT3U+CdA/UbjhqZohlHFk17z+Hfz9auV
	awtv7nU6LXa9PJ3svgcQOLiamanSW+/amuqNGA3+bVVDYW5+EKYotZM5bzRsnFr6K+rD/MQDkAC
	7LzX5PGLl/h+tEG0oZ/WLjqZXXyxIKDW0Ff8aHGQ61OI8lHnlihFPZPX0XLFWP/VrmUEQFw==
X-Gm-Gg: AfdE7cnL0grjkwnzE6rLoNRAJS/8oZ6gBS+VCMV1i/nJPiGXN5zqXd7JPQnnJaiX/Q1
	ydEBx5nW53/q5jYkvhNfRdqWmvnBDaR3GU2AyEBYNY2x72Hzx1U9rL6CiYd/vD1jzc09v0mxgxK
	DXTDocz7sEro7sff4wvLPRP8m9pzqYUNs7MSOGMwOMRMQfyrTaH+1DSTeDsJNf0YRDC06m0Jz5d
	kHx2DaavUMhi4zfQPGrwThEToWx+HoeESVTKApBf9slfH6+cgopVj6qsdYAQNr6ybN+zOdD2AvG
	4PD8oNN4hETLqqYMPP2vMnSfSzyEeuxGQ1RUMYbugEMSJbmYoWw6GqS9OITqr0gzseRSf7W1C2k
	gbGTc98/dl79Z9c341HfrABCa8QD1GsamWUQpxW/AWieDcE6/rA==
X-Received: by 2002:ad4:596d:0:b0:8ce:a033:eef9 with SMTP id 6a1803df08f44-8e6d7f0b3f4mr122000316d6.26.1782491592114;
        Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:8ce:a033:eef9 with SMTP id 6a1803df08f44-8e6d7f0b3f4mr121999726d6.26.1782491591564;
        Fri, 26 Jun 2026 09:33:11 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:42 -0400
Subject: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=4C/sb0FsOyRTobfskpY6am3zXhp6RBvbExjHUf950gU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh7UZno7S3biD5fKPXEuv/YJVRyo2sQZ1veigv26y
 9aUTyyPOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIdy7DP6PzF968+Otc56fo
 0vo33mdyC2NZ9hodLV69poWz5vZZ6jP8066+uMKW2T3K0mbbus98X5RFvL+I/GvRyPoZXZUYcn8
 zOwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains, resets, etc. We
currently have dev_set_drv_sync_state() where a framework or driver
can set the sync_state callback for a device node, however it currently
only supports a single sync_state callback.

The pmdomain subsystem currently sets up a sync_state callback in the
core framework, and the clk subsystem will setup it's own separate
sync_state callback in the core framework. These can collide with each
other on some types of devices that have multiple types of resources.
Additionally, some clk drivers already have their own separate
sync_state callback already defined.

Let's introduce support for allowing drivers and frameworks to add their
own sync_state callback via a new function dev_add_sync_state() so that
multiple sync_state callbacks can coexist.

Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/base/base.h    |  7 +++++++
 drivers/base/core.c    | 29 +++++++++++++++++++++++++++++
 include/linux/device.h | 11 +++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index a5b7abc10ff0..339db4afbeb4 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -178,6 +178,8 @@ static inline bool dev_has_sync_state(struct device *dev)
 
 	if (!dev)
 		return false;
+	if (!list_empty(&dev->sync_state_list))
+		return true;
 	drv = READ_ONCE(dev->driver);
 	if (drv && drv->sync_state)
 		return true;
@@ -188,10 +190,15 @@ static inline bool dev_has_sync_state(struct device *dev)
 
 static inline void dev_sync_state(struct device *dev)
 {
+	struct sync_state_entry *entry;
+
 	if (dev->bus->sync_state)
 		dev->bus->sync_state(dev);
 	else if (dev->driver && dev->driver->sync_state)
 		dev->driver->sync_state(dev);
+
+	list_for_each_entry(entry, &dev->sync_state_list, node)
+		entry->fn(dev);
 }
 
 int driver_add_groups(const struct device_driver *drv,
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..acc12f402dd3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2612,6 +2612,7 @@ EXPORT_SYMBOL_GPL(device_show_string);
 static void device_release(struct kobject *kobj)
 {
 	struct device *dev = kobj_to_dev(kobj);
+	struct sync_state_entry *entry, *tmp;
 	struct device_private *p = dev->p;
 
 	/*
@@ -2625,6 +2626,11 @@ static void device_release(struct kobject *kobj)
 	 */
 	devres_release_all(dev);
 
+	list_for_each_entry_safe(entry, tmp, &dev->sync_state_list, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
+
 	kfree(dev->dma_range_map);
 	kfree(dev->driver_override.name);
 
@@ -3239,12 +3245,35 @@ void device_initialize(struct device *dev)
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.defer_sync);
+	INIT_LIST_HEAD(&dev->sync_state_list);
 	dev->links.status = DL_DEV_NO_DRIVER;
 	dev_assign_dma_coherent(dev, dma_default_coherent);
 	swiotlb_dev_init(dev);
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
+int dev_add_sync_state(struct device *dev,
+			   void (*fn)(struct device *dev))
+{
+	struct sync_state_entry *entry;
+
+	if (!dev || !dev->driver)
+		return 0;
+
+	list_for_each_entry(entry, &dev->sync_state_list, node)
+		if (entry->fn == fn)
+			return 0;
+
+	entry = kmalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->fn = fn;
+	list_add_tail(&entry->node, &dev->sync_state_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_add_sync_state);
+
 struct kobject *virtual_device_parent(void)
 {
 	static struct kobject *virtual_dir = NULL;
diff --git a/include/linux/device.h b/include/linux/device.h
index 7b2baffdd2f5..b7a3dd4b56ed 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -642,6 +642,8 @@ enum struct_device_flags {
  * @driver_override: Driver name to force a match.  Do not touch directly; use
  *		     device_set_driver_override() instead.
  * @links:	Links to suppliers and consumers of this device.
+ * @sync_state_list: List of sync_state callbacks added by subsystem
+ *		frameworks (e.g. clk, genpd) via dev_add_sync_state().
  * @power:	For device power management.
  *		See Documentation/driver-api/pm/devices.rst for details.
  * @pm_domain:	Provide callbacks that are executed during system suspend,
@@ -723,6 +725,7 @@ struct device {
 					 */
 
 	struct dev_links_info	links;
+	struct list_head	sync_state_list;
 	struct dev_pm_info	power;
 	struct dev_pm_domain	*pm_domain;
 
@@ -1137,6 +1140,14 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+struct sync_state_entry {
+	struct list_head	node;
+	void			(*fn)(struct device *dev);
+};
+
+int dev_add_sync_state(struct device *dev,
+			   void (*fn)(struct device *dev));
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {

-- 
2.54.0

