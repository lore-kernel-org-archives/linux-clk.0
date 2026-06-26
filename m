Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D93FDBF8
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491601; cv=none; b=hUpq4KBdgQ3ObosWnvJ7lMDDQQGy3AXLt86Il0ISsgB9LrVAAPvXlgpHb/CY95MG3SasYCMMEVEHvtoE1Gry7YK5sn0mGsT15+pvbgf9LyLXBMeRIlmqMjNJK4Q9cS7jB6zLNN/4YddU0kzbp1PIKdYtOXPf1oCjhjmmk5EHRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491601; c=relaxed/simple;
	bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXpWmjXMMSk8QEskAtg8yn0Qv1liyN+3yjWAM24wZDLv8eE3vNarTvzl9AvOw+Q4EOKgwd6kOOSg4wCgwGNAlaNii9rCdokec6uZcqoJd28hjnQUR6AeS7y5uHSbDGsg1xGG5Gg64AQPcvBEi3cirKTJZ44sREVrLKe8TXgU5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQ1cg2CX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ppQtAJW/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQ1cg2CX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ppQtAJW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
	b=UQ1cg2CX4uF9nqtcmb9WyzV+lyzjHvnfDLJRisAUTbKfFxK8wOln/bVsH+pFZCjgceoo7I
	Y1jSvUMC0oGcMa42sZB54tFCSzHQ1/FF+DGGr3TVyzansVtC27mFUwMozU1YTMPgSpd8+s
	uOXgXWq+SokEGvYFSOlnnbHaEgigC88=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-T2OlPOJnPaK6l_kCGuh2aQ-1; Fri, 26 Jun 2026 12:33:18 -0400
X-MC-Unique: T2OlPOJnPaK6l_kCGuh2aQ-1
X-Mimecast-MFC-AGG-ID: T2OlPOJnPaK6l_kCGuh2aQ_1782491597
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e06f4680bbso25107796d6.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491597; x=1783096397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
        b=ppQtAJW/PXCDrl+6fBWoYy9NB5yYuYtFUoKealljDsoPAuJFDE/yW1HrAm/aulYk2L
         4gW8Y2LAFx+qGrN9DdZ7bpp/glEXgG6Wmyd85SYohk70z2U3cBFLJ1ZjmuR3DX4/+pRF
         qddNrTt0t5l9rrSsunMKx9vXTiai0GzLV7DSyiR/KQMzsuxHyKjIsfRJ3UahCr/WfTrV
         QNZWvmxQpfiR8suiBIPkTOc7bAH5bqplS+JDffAXeWYqK19QKyqbq9tUCyhuSnm2Ynl3
         gziFHxPP85VeZ04bEje9XUd9IzHR9gpGJUzPSQC/6WQewFsUguRa66OusT2oEpsfsW0+
         513g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491597; x=1783096397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
        b=oQVQYZDjExZyd0g2bZtA1EwGX57NinNw/xeVZCozBlTMESOxfYeSibNAVZekyG42KA
         IElfVTnywAwsNm8rg2WJJwUktgGspvO5SW3riV3aD1KV/kALaYOeYlfTGKYSjJKcGNye
         UapzkbAO44Uw7gOQx48SapWstosI35PhIiWGmsO9lR7Sh/3EgWAmDlmGrNZHkVeLDYAC
         GIzytE7ae0IGksEl0zIeSzAEkFWqcJlG20mVXe5dcm5mwpH1V4l6U03O5EHOX5XxPkDj
         tI0rKX9mdE6qYV973JZRRjXIKouY62iWC/JYVygcoCivf8u+LFxYYi3PjA5Ko+4GF2ri
         U/sQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIbEAJjL9AYRFNT8N7TX5SydFw8dMDWYgHpcp5oky5mN02/nwsyoVffF23end+L1r6yRdO47ecJLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydwNLGJY7d/99sAoT5fXd+xZ0d/6rF7slVYWheqqGm15lb4mgH
	7zI34yznfcj8K9u4omNLaNWhlgjdJIlAj51xb9kIWQtyxly/GnCN0hlvbjQGGyl9kfsxGnOYkZ6
	QRlkCbY5GZ8TOka59JpJmDDCd8PJujmsH3moWpQ5fTwg6IA0OcS8Uer0U7pUCFQ==
X-Gm-Gg: AfdE7ckSABu8BYuxKFtgUk2o5D1NZoPF6nLIeqAACHNsCfq+vnWxJhCk0cjocgklx8m
	VmtbT+oo5R4zL503mG20Tg3WO+PyVwY3bOQUpqwrMxS+7rDv2gETEyyll5ZxTfPk4r0bQg5OBWr
	TYBNShYXmQZMv3M08s2C9gfYueiBvL31lp2o7x9dtZIt5q4utfaWlr63VNxpGY/vjx6htc+vrgZ
	0dRf+PW8whzL/Xi7XDj3k/ZFl+Ha/lfVyGHHOLKy5ew/j4zxV2nyX4ID2bVz8hMIEOKa+varaWQ
	622PI/qEMSCfvxYzJ0mAHr1ap8JfoYAoKUImarL2hpmJIhVuAiob/WbPYPzjJxedIOGpCO5+MQ9
	0x/qx4nTxLS5tCQqYDCxVThtJAJyReEPYMwFDZoYLYkIC+OG/6A==
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126316456d6.39.1782491597318;
        Fri, 26 Jun 2026 09:33:17 -0700 (PDT)
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126314206d6.39.1782491595157;
        Fri, 26 Jun 2026 09:33:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:44 -0400
Subject: [PATCH 3/4] driver: core: remove dev_set_drv_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-3-4156d8196dc8@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh4SmnZ/eu+lX9xbTjbc2WlU6P9o2mTu3INrcnQOn
 quTl1vq0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEttYw/LPqCjq9dLLlFIv4
 vS+OMCRdDS6NnFbj9jikMjbqctaWUGFGhoXZFyZ9r5+SOvGeS1TQ5jVLJsy9HVIYb5ivJH1gc9/
 hdRwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

dev_set_drv_sync_state() is no longer used since all users have been
migrated to dev_add_sync_state(), so let's go ahead and remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 include/linux/device.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index b7a3dd4b56ed..7f71217ecd48 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1128,18 +1128,6 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
-static inline int dev_set_drv_sync_state(struct device *dev,
-					 void (*fn)(struct device *dev))
-{
-	if (!dev || !dev->driver)
-		return 0;
-	if (dev->driver->sync_state && dev->driver->sync_state != fn)
-		return -EBUSY;
-	if (!dev->driver->sync_state)
-		dev->driver->sync_state = fn;
-	return 0;
-}
-
 struct sync_state_entry {
 	struct list_head	node;
 	void			(*fn)(struct device *dev);

-- 
2.54.0

