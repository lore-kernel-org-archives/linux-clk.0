Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E33BADAA
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857856; cv=none; b=Uiz3fgc6tSMZPDp8RAxAywOIpicciBWsiaZUIMS2cSMXjpU2faYgmHa0u0PA/lfsemapdcHeksLYLoSN0CVAiK+s8wp69xcLIOtPF+5gzJOLKiEvOfAl2cfxKVCzAqlEWG64AB0aWV4HxVE2KPdRdoQcJQgA4brXhK6qBv/QC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857856; c=relaxed/simple;
	bh=eFaoDQgcBVpXvmYROG7CHEbvWN191W5PaxPHD+Fu4Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MPOta6PnBvNubtmT+Vww3flGuOzagWVJBDbkiHt4VxX6ss+wZ3LfAlUpaaBg50fO9kfAj0srG/9BU5hriFqXPMFgVceG+5rCoI/aNqXESDUVnuy7OEoZqz/+gR897xYW1B+uL1fCJkRy+WiVFeNw4KZJ5AqucStXwH+P7gQUFgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=vtLN3y0v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="vtLN3y0v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9156565e9.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857851; x=1779462651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXODE/NTGCJkDa5xfgOEVReczB1+IN57f4gNY1vtwBs=;
        b=vtLN3y0vM/q2SugR6Xia3ivha+3XfTE900U+CPKkEgsZx7KsX9XQ/9KtZks1QNLIEn
         OtoX4ycvMc0PlevkkdnQxiwnK1gPKeYoGZwcNiR+EpaXHhLllTlUUfdrdN/H7bUrzwFY
         qfUVuu31+jTzcaXw8gKxc+vwcI13dLqypRXKI9UpX1ZbKRs9/ZX3XaDqpR9ICnCK+nCd
         iwtnov6q6Tscs4vaxctOKy6/e0+x9bD42N7s3ICYbBWs+gbhnwMYdBlu8UeSJoKPC6bb
         hmmq5+R/2e8MnRA5xTk0GtXzlBHgi/BS78WVXMYAuShLxmzg7Tkp3fkOLjQpLH9roMJe
         Q8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857851; x=1779462651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXODE/NTGCJkDa5xfgOEVReczB1+IN57f4gNY1vtwBs=;
        b=J1wlUg+JKy6d0jusUdJkfZaXU3t4t6WyGQ40HwzuYRV4lHEu0R/s7gpSG6q92kVnn8
         EDh7iFqT0BbSv/+sSWO0zAEXaBDXC1P0+/0qpKF5rCx4pl4XtnKI6y8n2iNmLZjTtC8K
         183VkyXY6W+s8ETFRHrQlC1o1RYQYNLZsi4NmfUTKwS9Mqtv8h+1+L63vG8opmYVq8k3
         5u/v0ZvHp3PRWpzHUHK53Rd+NQMxi+7jdla+Fe5tAImNCHmUdI5yz6v06MIRroG+Ig2u
         kgsMIh0IeRmHDhS8UVb+taRMKxwYs3JGT3cXJfhLZYBDrecQ7kmobOEKHKbdj6Amr98e
         kD+A==
X-Gm-Message-State: AOJu0YwfsHXscKU+a5kHtP6L6nzprs0RCnT52r0UH6tmzEM3tm08GgPS
	ScDdtnFAG+PjCF95cek+4TouArRPKS8fQQf7GxbyYIfbl+nx3gi0GbQgrRZfcv8W938=
X-Gm-Gg: Acq92OHIuev/ejhyT/UEVg+n9IBY39qFV3BpM99BQwNv0a6X9ZlpZ6TgHmeHTcU67H9
	Bvmy2nOUA2nnk4fKg28L8iG321jTQxAPhSyD1O16Aqevzyd9vYYqzp8m70nsS7T6Koe66/N2K7C
	aNsHc9OojMqMZaJ5epY3+0IdAlvADEfk0R3ER2BxzIJ9z3DTiPtcjARBvfk1oQaQbOvu9smqXi2
	uMmH9G4gBZ3pumJmITSWqmXC3COqe9VWZ4AzhnOAuwr1jxQ9bkYIcUsbKXYaUey1Zov/oLzoc8M
	LNIJnaAaupojIH1N2QVa7jzOU/p5aOryPehMlwLD24IaZP10eJFyc6mL7/zRBay7D6uBjDi6q3H
	2WB+8YX5BHgy1mZhL3nj+jcoiFmcjeXvAXt6rMsaRBONtdBlfAdK+sYEVtTS8kDvzoTCLz6Mu0O
	swVtCEq3DKIKTvpE9Ohd3JYQN4gtkjiyxVAczKZ1/HwLFml0wAloXE8O2k/BXBq4uyRZhxNbHkT
	XaeLOhKNqjTO9J6QiYRBgkF7g==
X-Received: by 2002:a05:600c:609b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48fe4cadfeemr67312565e9.2.1778857851309;
        Fri, 15 May 2026 08:10:51 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48febe6aff4sm15781205e9.25.2026.05.15.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:10:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>
Subject: [PATCH v1 0/2] clk: Rework initialization of i2c_device_ids
Date: Fri, 15 May 2026 17:10:38 +0200
Message-ID: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3526; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=eFaoDQgcBVpXvmYROG7CHEbvWN191W5PaxPHD+Fu4Zo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBzdviSjcyKi/OHKLevhCeCFz1YEVDSQn6Rs66 a7AxNI69M2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagc3bwAKCRCPgPtYfRL+ TnGCB/9+ZjPKjSnnGVwVtjVeYb5Qkr/BOC/D3DqhoRNArMhBkVmTK0XrhQ/XfSy+YTdS7EW7hJJ 10nZEmCQNCbLZdf4O29IiEeHJ0Hn5nQePTMJfT27ANWLyJj3MhXDb2HE2bqePOghixvYZYrE7pE 6f5hGpLXuTUxGTbFZAric84hjGpYegrMsvaOgEOdngL1bOj5C01qXcZ9u59VmHdecQ6DpQKU6ln E4KbFT3Wl02GlKNRX4haDe0vGSZSMQuK3rB0tH4Hyc6L0INtfscTFv+ICVOqwnnrDsvosbRha+4 CVA/YBIMdT84oZSkhD21mTsZ+ulZyo5S/nnL51CxuW7fXIXx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series is a preparation for

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..84272ba65d08 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
	 
	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
		struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
		struct regulator_config config = { };
		struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-			(struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data_ptr;
	 
		chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
		if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a good example in drivers/clk, so an
regulator driver was used to demonstrate the gain.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

The first patch drops unused assignments to .driver_data in one driver.
The second converts all clk drivers to use named initializers for
i2c_device_id.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  clk: si5341: Drop unused i2c driver_data
  clk: Use named initializers for arrays of i2c_device_data

 drivers/clk/clk-cdce706.c      |  2 +-
 drivers/clk/clk-cdce925.c      |  8 ++++----
 drivers/clk/clk-cs2000-cp.c    |  4 ++--
 drivers/clk/clk-renesas-pcie.c |  6 +++---
 drivers/clk/clk-si514.c        |  2 +-
 drivers/clk/clk-si521xx.c      |  6 +++---
 drivers/clk/clk-si5341.c       | 10 +++++-----
 drivers/clk/clk-si5351.c       |  8 ++++----
 drivers/clk/clk-si544.c        |  6 +++---
 drivers/clk/clk-si570.c        |  8 ++++----
 drivers/clk/clk-versaclock5.c  | 16 ++++++++--------
 drivers/clk/clk-versaclock7.c  |  4 ++--
 12 files changed, 40 insertions(+), 40 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

