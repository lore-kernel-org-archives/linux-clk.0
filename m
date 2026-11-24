Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562302;
	b=ElW3IBD7Ww+70qi0F6TBdH+SPn7bWuKuT4wTD01Cclned5dfRH1ImbMusxTD5/o37I2G
	 WsaHI7QVL//O1bYEt5FwNqmlzU5gSzIJUIXOQkpaWKyaZGKBhZ8Pk0blCC8EPUhcQtKCQ
	 VDKxSS0hZ5aHMZUTODRXO6Ge88bZFIEsbRDYqHrClg7Yks+Pn/6r9+tsZqBwgSd2BZJcX
	 6Zglvuk52/23nyzuyUcA72Ka4ISi59VncvOYrDVoLDSf7wnY4QIiKsZ8cUibueF0bNPEw
	 +vfJTwnDGzaxUmTJG8eFLGu/0ZyyzCtIgImdGvP8C8moVMN1GMQQKptZyasTPkOe/Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
	b=cDGkuRZzRvPo1KY0lylcmAHGKRkJAPlzlxcxQ9DbUguveIXnd7j9q1SLW8W58Cl4MKAe
	 0b0/AsgGOuxTXFSIbjN0ZmbncpASIqhOOh77kD7b8FjDo5rBfVp1xiHUdn/QorEYaXLiV
	 +GZtnDYcF/XREBGjaOXXzTClObpUWlbUg1Aw/6eJR29Dsd84YDj9LkizZb+b5whrTZlv9
	 zE66X1zawh1SozcDvawX0DaGUbUOrXmAtGdfGPvL/8QB/OD0NC+SCWQeNEAtrmoQutu0Q
	 sCRHb8Q/F2+jx/Z7/Gp2WEqW7FIFXGssDhzcXEa9MqbOUbHlfca93XbDxcHe68W8/Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOgQ3NpE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC23606A323
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 23:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOgQ3NpE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso63241375e9.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562300; x=1796167100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
        b=DOgQ3NpEzCbCZHBNopzI9L4pY6W1mIKYTtDbgTvdg+TVgzmSA9nd4ObNa3ZiqOV9SJ
         6w1rHmZRwxLzH+KM41443RQQ2wSunBU0GbTxCcvaj7+SgGbiMwtRSj+ZRkZkDuq8JcdJ
         uMH5ojswndafo4c6Y9JAaCF0q5L1HSNw5GDUAyznzzLTEmVuARW/wPPdvYqxcTTXt3uw
         nF8OrGFmBosbYbD6VyeRcoExSMFBlh8aY9U9Zh56iucC8OizvRPtcDe5FKje0zDZZI2h
         6XstjlFN4cycHu1LVRs8S4issiFBHhup+vqmXxkpcbAPZVtvrq20b3vfweZjMEVCmbfB
         U2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562300; x=1796167100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
        b=jAYgtAToVEjnKbCkIvQrb4DZu8tAbJMKR3mMwwp82NaM9Qejauh/KCNodJ+sHUhVCh
         hsZ4G19JwC7tnb+Hum/+Iwh2sa6+YVShC0ByPc9XGtyuX5H4xTcbcBDDb7x5rL7dOxRT
         fViIgK2Ai0ag7L6R2FU996yMwbk5Dyc5XhXp3MA4Bz4+/7YYO2vgOgr+LygLhY8IesI7
         zf4U9DDnyqO0gRVSOwvOpXoKMTTURdLbJ4Zphnfm+quAr5VlIkOq9MuXmUftgd5ivc9t
         G8RR52Lj5eopA0MOr/hC1Z8PINCum+ut8OhtrCu0TNlAZqxfXsN/D4PEPmJg3ujIw7Kn
         Ry9A==
X-Forwarded-Encrypted: i=1; AL+hErEvQgyAo7fksh9faWSO7XUuZQWPGQ7bXNh962ybJnGh6rirhuMgx0GWPR4f9XJLYctUGBW0DcJjhvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OVKFweA5GHh7bFru8WGL/YNwrF4t6NrH7/x5uMvVVIX6JGlGt
	JiAS9xnNyIhHNSBeNsCY7o1Xl6V3O5zLDOUxil+mWlbe8K+/wUX/DoMv
X-Gm-Gg: AZFdTZc560bL8S+ClNKqMvuC6AJRTKGTJwm+sk3VFl+O64+vMI5yq2oYmvVhbSzhQPo
	jvA+41d8LdPnlur5eqKqAYhaDoYEAkGMDoZ1hR2kxjupqocfWeWSZ/zb6n8ots0CWJW7pU8xuz7
	MXZCW4IPlxUj+JkHoklsOnXq9GNtT3CF1j5eiR5i5Vj9iZfohGswu7JLFXbkpKuqhnNw9w8yxL+
	zelmuPaEycWl24m9E2s5EtNqklB1hMdIc/JoO7lYPuFBb3m9eZRsfV/dgOLSQkVCmh467v48Pc+
	qNu1+RHdw/oAeikjIAQNEWDBsjkzXmLyrD6FGOCmAxIT+ZxvjhVo4u43rKCOt/6A5UTBAPPQ3N5
	eKuqqZubBBAgTlKmapRQdQn6qUiOr7ZVl7Sa0dOrpzw5DUofBgcs9YvfxkuJ7m72gLmMaSE7Ai+
	nqgG30QKZXQ3bVtw7Xut2C5PbAdzH9qByZHljcEXEjcR+Gu9ud3ZSteXRDa5bHp395mSQgwo5E8
	wK5vZpsjUZmXm1uQv2hTwZJwy+cJs6HTjXYhXK38dr25ype7RMlIURCEVLS7222Sa0Zladw3R/7
	CzpkRL3KvQtzMwSjxSmHkh/82QvhT0YkMRC4s+/UMp6noE52vYjgU6FocwTvoOBPVDOupDSd
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr336047105e9.35.1795562300065;
        Tue, 24 Nov 2026 15:18:20 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:19 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v3 0/3] clk: allow a clk_hw to be registered again after unregistering it
Date: Tue, 24 Nov 2026 23:17:48 +0000
Message-ID: <20261124231751.83938-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers with statically allocated clk_hw structures cannot register
their clocks again once they have been unregistered, e.g. when the
device is unbound and bound again. __clk_register() sets hw->init to
NULL, so the second registration has no init data and oopses, and
clk_unregister() leaves hw->core and hw->clk pointing to the clk_core
and clk it releases. On the Raspberry Pi 5 / CM5 this is hit by
unbinding and binding the RP1 southbridge, whose clk-rp1 driver uses
static descriptors.

v2 worked around this in clk-rp1 alone. Following Brian's review, v3
fixes it in the clk core instead, so that the other drivers with
static clk_hw structures benefit as well:

1/3 keeps the init pointer in the clk_core and puts it back into the
    clk_hw when the registration fails and when the clock is
    unregistered, and clears hw->core and hw->clk on unregistration.
    Init data on the stack of the registering function is not handed
    back. This is decided at registration, as object_is_on_stack()
    only looks at the stack of the current task.
2/3 adds KUnit tests for this.
3/3 resets the cached rates of the clk-rp1 descriptors on probe, which
    is the part of the v2 fix that is still needed in the driver.

Testing:
- CM5 hardware (arm64), 6.18.64 backport: the new KUnit tests pass, and
  repeated RP1 unbind/bind with all RP1 drivers loaded runs without an
  oops.
- x86_64 QEMU with KASAN: the clk KUnit suites pass (138 tests,
  134 passed, 4 skipped as before), no KASAN reports. Without 1/3 all
  four new tests fail and KASAN reports a slab-use-after-free in
  __clk_register(). With init data on the stack handed back on
  unregistration, the stack test fails.
- arm64 defconfig with CLK_KUNIT_TEST, MISC_RP1 and COMMON_CLK_RP1,
  W=1, GCC and clang: no new warnings. checkpatch --strict and
  kernel-doc are clean.

Claude Opus 5.5 (Anthropic) was used to help write the tests, the
changelogs and the clk-rp1 change, and to run the testing above apart
from the CM5 runs. I have reviewed all of it and tested it on CM5
hardware.

Changes in v3:
- Fix this in the clk core (Brian Masney), with Brian as
  Co-developed-by
- Do not hand back init data that was on the stack
- Add KUnit tests
- Reduce the clk-rp1 change to resetting the cached rates
- Add Fixes: and Cc: stable tags

v2: https://lore.kernel.org/all/20261121181650.143474-1-joshuacov@gmail.com/
v1: https://lore.kernel.org/all/20261121163915.86681-1-joshuacov@gmail.com/

Joshua Covington (3):
  clk: allow a clk_hw to be registered again after unregistering it
  clk: tests: add tests for registering a clk_hw again
  clk: rp1: reset cached rates on probe

 drivers/clk/clk-rp1.c        |   6 ++
 drivers/clk/clk.c            |  23 +++++
 drivers/clk/clk_test.c       | 191 +++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |   5 +-
 4 files changed, 224 insertions(+), 1 deletion(-)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.0

