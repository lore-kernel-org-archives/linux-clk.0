Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3D59B672
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889676; cv=none; b=fDuJo67egLy/7aZ9IgJm8qHz+fGeRMvHVamVBp20s6mGjZsknMKTKrlOr+vbSsdt6AO2NQ2FrYd2gXMkRhhOmJQs5Bh5TuQtD3bP9SpG4/im/ykSs/tG5HT7wlUQDVZBdyxJxIvuM4JCaOABG30jB+G9pnPLHbgt2SUe2N4VPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889676; c=relaxed/simple;
	bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1gMIk9CswO3Yo0Y8W3e3HDbqwRw4BcLGdGx3xk94O9pCB9JicfobptYNTDCmxuLOsZoYB3bd43mel4vsZMqHt2U7uAoaJEXGC5n4asqv8bfIDAPc1onkhGfZ0a4dNF8QQitDxn77CN9CZwaYYlmVs7saDe+xyPfI1yo2jjjDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEpD3lv0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=INZTmeAr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEpD3lv0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="INZTmeAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
	b=fEpD3lv02f04aYjZUVDaJ0R9SYa4aDVRsg65vmkOQMPwoEQm3Au4jIomW0c8DcTJOUnZys
	HesPnXLSekdbMKESz+SiThvPnnkaqK+0mKwgLMY4sbExcru+vt+itLhNOJKmsxOUKVp3QV
	y6v9+nMBSpvLFhX2VD32ROOYPBM/Bzw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-Z0R-bn9jPPydgHROhtmxhA-1; Tue, 08 Sep 2026 13:47:52 -0400
X-MC-Unique: Z0R-bn9jPPydgHROhtmxhA-1
X-Mimecast-MFC-AGG-ID: Z0R-bn9jPPydgHROhtmxhA_1788889671
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso765415785a.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889670; x=1789494470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=INZTmeArUqdr7G9C5GPpTY8peKGyjO7G373EkSRbssiKYjZrXVdS9Oia+fyi21Rlmu
         SsaDmPaJX0ETC9qr3bAA9uRhJoSliZjF+q9mP7P0ZZlybFq3DVGMBuNie8jN7z7oZyNR
         +oSu5+SBDh2NjXODQpxMPlvqGf2ucc9CIudWijAG58zGD1BPIYgAVTgioUi9vY7VVseI
         gAHjvAJs2cLodaoP9/E45nylgyF3/Egvcg+Y8fW9SP1PFvvMsoJvcIu3M8ULqKKRfKyh
         LJlXIOprMV6LZLjTQvyZXiqNqqOH7lf2/4JxpvJHKdlOo/tKk2AhWUjLCXPG20T5WM64
         8G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889670; x=1789494470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=LM82tGnH/VtnNM1qoowFt5Yq0VA7OE9xkNmu8waxDax4ZOW0fOwdsyB945keWHL4F2
         aoyor1FxSRnsXvCMRic6RP8Tlp27L6JmYzs8ZbNx1qV+hxYmfXyTf5IZwfyFVSBGtoZ+
         mqgjbhMPR3BIt+aNuqFX9I/r6mrTTfWHbKMmvPs1I7LwZEK9xp4LDYKq1XealSgIJ32G
         1nBBEWgpgZTKyleseHxirTQixFFAk43h+zWLClP3IQKD2bdzqvI8x8zvhbgPTbPIftew
         F+P16reNmcX25zNozUW9nYlCH/A7oSteTWIHF/qlo+KB3BVl2cv264MMUpNY2oQGjgk+
         MtZQ==
X-Forwarded-Encrypted: i=1; AKwUvByroeoAiJwNnCwRghpfOaDdrLb3GpRDK9PzK3YfHxhYDA5/UxBwWr1if6OzdB+yJlqOPsczb9IHcXg=@vger.kernel.org
X-Gm-Message-State: AFuF++lUsNA4gR+n7PWuOmk24YcItPcCgRT8cNI+bDu8UAmVb6YW55aO
	le+fNc8FlHh6hWq4jlM83ZK4n/YwJ2QixlniGmyr8v6FnuC5VMFvQEiyiPUWy/g0X8tIzP8XoQ0
	BeTYLYyUrtPvJbM9vF0owr0FlotEUxTZP1udszjkKO1hmx6Lol7HMbzKUkPSrNw==
X-Gm-Gg: AYBFou0/wRzSQhn2tA43ev70BcuzKFuGthYoqv3hFatRvRd9cL3qQB9iD+yhh9JQMBC
	mSFKF4iUrg/W/PA9yNwHxSE+SNgrXrZSEJSt6zj5vplqu9dAiUW7kkxPzY/Xdsupp1YTIxbNaH8
	scXOhQc4Ks5pBoBrKIhnFdbIv1QMFsld3Dv8zNHv+ILkW7hGik/yPaLhwgZZbr/8X7CvaY4W3pl
	ny0PwJaRca3ir+2AUBETT7cUbPwB7By1+pvW/44YVUizV/Vt7hyJ5jJF0ZI6oWUsu8ujqz/Sxbc
	V+6Tdvcb2cWQhj2DhrWwMqDt76+CZT7HZG9rqvbAEwkUIwDvcaUV929QauXXCNKu8pKRagDDO2s
	5z0eB0lTLe1NaBFYdvqtST4mDAk6kAxF/5e3b1xA=
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213678285a.21.1788889667415;
        Tue, 08 Sep 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213671985a.21.1788889666833;
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:18 -0400
Subject: [PATCH 1/4] driver: core: add subsys_driver() macro
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNn2tBU1Ni1/dSggNbqg+dfChvjbuQt/uU6Q59qeu
 buBSUCwo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlUcTMynEjas5VdRKHyXNSp
 jwynb6XoznuXmfJN85R/9wbxuKPTTjAyzIwrYIzpUotZnHuvkkEkgW9DRFtASu7/n+a/65dJC07
 nBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new macro subsys_driver() to eliminate some boilerplate code in
drivers that need to register earlier in the boot at the subsys_initcall
level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/device/driver.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 768a1334c0a1..29fbc01ef06f 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
 } \
 device_initcall(__driver##_init);
 
+/**
+ * subsys_driver() - Helper macro for drivers that don't do anything special
+ * in init/exit but have to register earlier, at subsys_initcall level, when
+ * built in. This eliminates a lot of boilerplate. Each driver may only use
+ * this macro once, and calling it replaces the init/exit boilerplate.
+ *
+ * @__driver: driver name
+ * @__register: register function for this driver type
+ * @__unregister: unregister function for this driver type
+ * @...: Additional arguments to be passed to __register and __unregister.
+ *
+ * This is meant to be a direct parallel of module_driver() above, but with
+ * the init call promoted to subsys_initcall() for built-in drivers so they
+ * are available earlier during boot. When built as a module subsys_initcall()
+ * collapses to module_init() and the normal module init/exit paths are used.
+ *
+ * Use this macro to construct bus specific macros for registering drivers,
+ * and do not use it on its own.
+ */
+#define subsys_driver(__driver, __register, __unregister, ...) \
+static int __init __driver##_init(void) \
+{ \
+	return __register(&(__driver), ##__VA_ARGS__); \
+} \
+subsys_initcall(__driver##_init) \
+static void __exit __driver##_exit(void) \
+{ \
+	__unregister(&(__driver), ##__VA_ARGS__); \
+} \
+module_exit(__driver##_exit)
+
 #endif	/* _DEVICE_DRIVER_H_ */

-- 
2.55.0

