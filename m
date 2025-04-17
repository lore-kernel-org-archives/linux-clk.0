Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B424E008
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897478; cv=none; b=RN0R0QmbioU/+n4iIujNyVHdl2qsi6PM/cs8P3BMdM8xIAtCv8CM2Gp4/LM5JGeUc5haeNkLEXqKn48w/lWlLG0on4HJFJnOCbY4mcxLQqcdqRAI6Wd1o03Rd5QzsUpkY7zVR1XsR/ybSd5BQJLopsGRdUmMi2/5CQMR0KE8CSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897478; c=relaxed/simple;
	bh=/kYwMkMO7gnkCMvJ018+NoeSWWL7Svbm4MBqPlwzJ8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XKmL6DcjAFH/SZN/HAckX85xMFFHn9Mjb/ipSyPqOAttTgNzppnyUVaStrzRQ61qVjL/hPD8PV0DhtETqQ4K3w835u4/QseUUGBQas48vIcQ82+1UAUwOmD/gc0UMBLX1brY3vi0HpATzBY6BEG5n22OtD1N5gVbybbGeW1elEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1v7LHwrp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1v7LHwrp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so5916675e9.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 06:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744897474; x=1745502274; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8X0xT2F7/EkSVS65Ebk7avzorpujsrjUKh5VwdeOUik=;
        b=1v7LHwrpDQfBhc8Iq3I4PtBaF0Lrh9fuSaRhGKPj3quearBx0la4FN4g6baOnrkZtC
         OifCGk0EqqBehCP98l2n0ziMNPn14ODDfnbQ5WHuYOyalcBrCR8NtOlEIY2gKrkwF+q7
         1cCfNWrTKu8mqv9ljUKSmVdTFS9UxB3BA4rPdr2PvKHebh/QEcfkvIGylcjG5Ru/v8/1
         S4qO6wrfrMsDDiSriH7uQxETdvTr5stqQboOaiFm+ibCR5uQzxVQorIKwliIPvb25HUa
         70OoP5mcX7RL8YwMzUR3nqvkRdkFINehy/0TGd3rEibAlqJDlnFY7H55ZD2oCs1tNalE
         NXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897474; x=1745502274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8X0xT2F7/EkSVS65Ebk7avzorpujsrjUKh5VwdeOUik=;
        b=elGQEpEDe3bUsUB44wjIJ0n0day7vqSYcuOOnTECu7lHtqhQb3Ah5B6HjAS/HissvH
         /uHdDAI1xVrN2ol/traya7GPIZz+fu+ARORUKJDQHFqz4o4lcqVen4tC36pcviQdERCd
         yM5uI3KWEiesaJOPMG3X97HG2r4BkPRWq2NcOWmmYvgfkfR+VIX2eq13vVL3sEE/xcYC
         b3Tu35eEPx1iQa1/8fQMZf9POV5hkigeGkt5yTJEIHgMUadQt4WAL5VBydTrvF1WFHYV
         mecE3t3DexZnwdhDkI/F+JgPi6C5MuFhRhlhNOjLXN+ievr1D+K+SMi1QsOCrF4K8JSY
         dMkw==
X-Gm-Message-State: AOJu0YwabDpCpSsB0944lqPAm0OiyqW/1afvKMgc/k2BuL1/yd4kBOHL
	RMKNtpYRTHn+PDNZEJs2skrG7VfmVs0Tvk4LgatRLvPa2GhlhrwloK3IW5gh6W/3Zxpma0IHXdq
	6
X-Gm-Gg: ASbGncsq7p8eakHKfvgQzXoMFFSZ9CFm11HDwJ+q2IAeCDj8J5gQMKV3+Zv/UJX63QA
	MR7GXUgQVxqnwTYLtDQCmaBlAl+QYsCcs04u4lsjyEmOYrHHPrQ6z5KemxLgGKiMpoDWtg5sChW
	KjIXLqxV/hGQKZKLvLLxWZWHpO8oVh/dFVhGNhemkmGtVXT3LQvEJKh3W+lydH2rCIzI1FR9Zob
	3Yo4hBMk9sCs/PjGiFOKtuI4sgk50WeCEj8MKn88T1GRQtVzecAgbc7ueIo80CjESEn4CNTdyZu
	m6QDxySEwCS0clggcu4KBmF87c7aAJwl7CB+DoxkcB5VY/rAjnJCPZQ=
X-Google-Smtp-Source: AGHT+IE39P5qSh/sHu5PSRb5LN3Kn9/c0ri1uUrIa+zwmGg6WTKdoUUZpNFcB6I3Ih9udrZJtKkY9Q==
X-Received: by 2002:a05:600c:a378:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-4405d5fcd39mr54553685e9.1.1744897474366;
        Thu, 17 Apr 2025 06:44:34 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2167:2c91:1c64:6619])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3227sm54667495e9.20.2025.04.17.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:44:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: add a clk_hw helpers to get the clock device or
 device_node
Date: Thu, 17 Apr 2025 15:44:21 +0200
Message-Id: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUFAWgC/x3MQQqAIBBA0avErBswHTddJVqEjTkkFRoVSHdPW
 r7F/wUyJ+EMfVMg8SVZ9q2iaxtwYdoWRpmrQSttFXUWXVwx3LjwiYHjwSmj04ZoJkXeOKjhkdj
 L80+H8X0/r/SV42QAAAA=
X-Change-ID: 20250415-clk-hw-get-helpers-c2344d404f3c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2963; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kYwMkMO7gnkCMvJ018+NoeSWWL7Svbm4MBqPlwzJ8k=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGgBBbfIdEykO99A0aDKhO0+y7lWF7nQj4YM60P7658ST6pk+
 IkCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJoAQW3AAoJEOb8Dxw38tqF/xoP/j4L
 rtver3gxmoZkS4nA04PLJO6STpxlIC9GOKmFIaQTxaqJkoDdaCOAlD0jWMOCv2MdCzrmWfDGwu9
 Oyp8ds7gUvf+LlNK/IuKOFCFSRuIjHpizvagTpHrZSRak+C+TxyEAX/OlDAhUc+6ShqkUJoSzZe
 /bgW6rgWPzrN//fvcQglC8TUZcK2kHirnec1AlFU3HNq4nw+vhceH50E3CwTL48oDxZu5AWByoB
 j5/VBkzmHu5GRLRc/VN2SFwYZu9kKK67vWinynaLk/dlz9/eMTKe9QdHXDJM4PyDrxmgZVqS5m5
 h7XkGkMumXR/uATpl4yG0rQ2RWDzXtl3jbjMtNIAKCAV+t8rkuyoFHT6CDHh+THhxtiONQymoFP
 AtyF4hFtiE9Vd+Nq2ULexD7rIrrwzdWSUhLzkmci7GwBnqjDAbKV5xxpD2Ohnb+1MSvs6fKcqM6
 CAe1Ogb5zPjQ/KfdXxNJ8hcxxmucSqYLlGNM5HAWHtoDrJpC02IAPqXmIbdmEgyAj1dy10Nf1m9
 Lq0sG3EAZ9ha2xXuAM4xCerZJA/uTteHIEcGe7ttzibYZBfuRb51zJyh2E6nugNtAfy6UIJtRf8
 p43pgTj7IEdoBwt7vDcGloBP8w/rIkOW4ix641/aXKPWr8vz1ntqDOZo8YCLBuD5sXw0MpfcbRC
 F+SqY
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds helpers to get the device or device_node associated with
clk_hw. This can be used by clock drivers to access various device related
functionality. The 2nd changes adds kunit test coverage for the new helpers

This patchset is the v4 of the series previously sent here [1], with the
amlogic patches dropped for now. I'll resume the work on the amlogic
changes when the helpers are available in CCF core.

Added tests run example:
     KTAP version 1
     # Subtest: clk_hw_register_get_dev_of_node_test_suite
     # module: clk_test
     1..2
         KTAP version 1
         # Subtest: clk_hw_register_get_dev_test
         ok 1 clock with device reference
         ok 2 clock missing device reference
     # clk_hw_register_get_dev_test: pass:2 fail:0 skip:0 total:2
     ok 1 clk_hw_register_get_dev_test
         KTAP version 1
         # Subtest: clk_hw_register_get_of_node_test
         ok 1 clock with device reference
         ok 2 clock missing device reference
     # clk_hw_register_get_of_node_test: pass:2 fail:0 skip:0 total:2
     ok 2 clk_hw_register_get_of_node_test
 # clk_hw_register_get_dev_of_node_test_suite: pass:2 fail:0 skip:0 total:2
 # Totals: pass:4 fail:0 skip:0 total:4
 ok 17 clk_hw_register_get_dev_of_node_test_suite
     KTAP version 1
     # Subtest: of_clk_hw_register_get_dev_of_node_test_suite
     # module: clk_test
     1..2
         KTAP version 1
         # Subtest: of_clk_hw_register_get_dev_test
         ok 1 clock with of_node reference
         ok 2 clock missing of_node reference
     # of_clk_hw_register_get_dev_test: pass:2 fail:0 skip:0 total:2
     ok 1 of_clk_hw_register_get_dev_test
         KTAP version 1
         # Subtest: of_clk_hw_register_get_of_node_test
         ok 1 clock with of_node reference
         ok 2 clock missing of_node reference
     # of_clk_hw_register_get_of_node_test: pass:2 fail:0 skip:0 total:2
     ok 2 of_clk_hw_register_get_of_node_test
 # of_clk_hw_register_get_dev_of_node_test_suite: pass:2 fail:0 skip:0 total:2
 # Totals: pass:4 fail:0 skip:0 total:4

[1]: https://lore.kernel.org/linux-clk/20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests

 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk.c                             |  12 ++
 drivers/clk/clk_test.c                        | 215 ++++++++++++++++++++++++--
 drivers/clk/kunit_clk_hw_get_dev_of_node.dtso |  10 ++
 include/linux/clk-provider.h                  |  26 ++++
 5 files changed, 247 insertions(+), 17 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250415-clk-hw-get-helpers-c2344d404f3c

Best regards,
-- 
Jerome

