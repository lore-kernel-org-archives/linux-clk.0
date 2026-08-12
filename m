Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9093383981
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565708; cv=none; b=pO1/7kJ8h51GO5zeR6tWcEOcnOqhwD4mlE1GJLLLWYi5yF3pB0iOXfUtgYnfoOGio2LUBFtWfGJHpPByK4Ug5fnonGRdFiMcyXG3f8HD7y5inb8vd2RlUxKfegQBw14fpXB11NUwo+W3AFDpmRiJMqvrJ4VyQGtMz0OPiNjFhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565708; c=relaxed/simple;
	bh=ZzzMUPtD2agEDVD+V4pqZV+58Sk+VvWYf9jduKlg61M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oITCifQUxjek5jljW1e6++LRehR38RO45Tls9WMdl20NxT1M2I9GMPselYUx4Dsz+awkN1Tu1uIOCTRb3kpXzqCAUM9PUPu00BagTEzS5AdaXYT9DKF2Ok4PlFPEHVWbbtgTA1VNfmsALDiR3sh51RSmrUyBEVzUJjxzL/wcSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9FHfIph; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9FHfIph"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1226142a34.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565706; x=1787170506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=e9FHfIph6iivtrF1fPMic1BeQRZEsgWRraDMMMjGuchZskXX2nmkfy9U0jG34oava8
         7r6k/62RDiqsfs3/1cd4EtulE+pVbyjwozIRW0MVMisDeBpTw/POwdnEgCQlqtBkICde
         5prtfgawQECyVlP8nDyQE6OkTwtar62OOeRpGqj0XZ3jQQo5LJ4T1sv6jgDF8wM6+Y5r
         lJbwdbzJrQ0UwQVKCblZ9JBHQJzkHZrDxbZ1h/C4nPi7qvRtYBR1fKlIodoD0Hb8z5B6
         v5wJJpsYnj5nWyppp6dPaVwNgwbbrZiHEkRx28vO/zgOMXq5DgTy4oz344OmqJDTzvAR
         xgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565706; x=1787170506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=PmU14SWxXxppFdz0rj4UbSk7F9s3jOsTL2sS7GTW9CzEwl32zh/f+zQOK5w95ZStuT
         fJlGoX2GbjKQTrbqOtkoKd6nwUcux/+E4Qc6/6B0tqmhw55mzmNPPNELP+HSqDLc92bs
         BX1YLxHtlgEHTnGhy31J8Ifkm0gm2r+z+QSt0LmAQXdaXCMAz1ivHD/2mE4EFUDVsz/T
         VH9r5ReDe82AHTI7hck5U8v519KXMn7v9HhB5wjnK7VsBLtDXE/+mdUEQvwU9PD0mmmu
         ZwvLqjTuY/tzPpGfeN4dQb7YDqMaJbD2LvbEarcmmIsZcHmDKClIILSp+4HnxB6rCKBy
         rjFw==
X-Forwarded-Encrypted: i=1; AHgh+RoH7qTkNvx10Fvvf4uDtRcOPJq6e7gUYMwYtITktrbYlokHkZHlUhD83E1S6EMTJXyYLlfsEW6qv+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCu7akADqd6wZ8FyGcSh4XlFct0zlA35vKq3aF3hoeA3MhBvs6
	WTjVDb45XKChJdA7fd/SG73XP+IkCu1+Ra00viIJlv+fbLNHEHQ2Lo/r
X-Gm-Gg: AR+sD12FrvqEUt6yHTO5NIUOCvTV0DU93Uz9LQb51j4ML9RbNFfoLftHTz6VlTFfZ0b
	Utl4iavP3Oa4djxnVsBupoqgt28wcmipI3bXB0DK1eHmd07dRgpuzXiaAMQRfQeaBjSQGVSy83a
	ROZGbJOadFFLn46C61a61/2Lo2tcj3MZzX0HcuG5v3BWn/id38bpioB4Vw9zN8ui1XgroO6eItz
	8NANCFkyTZDipcHH3gIZSYuxJ814CNbH+ItAcs+bMXQO5I35MZ7tLvmGn9l7aVG2OTU0QfOVoMT
	X7RiTfdqdGbbzO52nlKUnqSGHZ8ZNrdHN0TNMtsvHG4fU1r/HYIwfMeHO+BN4tFfTZ5wW5w5XDy
	ThV1QvqFqM4nsRSsXFO8kaYy3rjwOxy0bOj/IXPzRF0TPRB4Zjr2VG/At5Gqi1ZoMMHv5SQGcv0
	IF+FoJaa/wscLqyTJsfrSGzgxnftx94JJianF7mzGGJvr7y3xZIaWrVyNunAbvLoeKW5h+NyJ7y
	hy9NfGBTdSEd9gV38ngaCPRpHIUnFqQ4PsuOhtX
X-Received: by 2002:a05:6830:828a:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f3ca8b718amr328737a34.9.1786565705503;
        Wed, 12 Aug 2026 13:15:05 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:04 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Wed, 12 Aug 2026 16:15:00 -0400
Message-ID: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723004856.55158e84@ryzen.lan>
References: <20260723004856.55158e84@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andre asked whether we would post the A523/T527 conversions for the clocks
whose ccu_mp descriptors declare one divider field with width zero. This
series implements those conversions.

Patch 1 adds a feature-aware M-divider helper so M-only clocks can retain
the CCU update-bit handling. Patch 2 converts MBUS, IOMMU, and DRAM to that
M-only class and converts HSTIMER0-5 and R-TIMER0-2 to the existing P-only
class.

I do not have matching A523/T527 hardware, so this is deliberately an RFT
series and carries no Tested-by claim. The series has passed semantic and
register-bit preservation models, KUnit tests, strict checkpatch, sparse,
GCC and Clang builds, full arm64 Image/modules/DTB builds, reproducibility
checks, and hostile review. It also applies and builds cleanly together
with the current A523/T527 GPU clock-model v2 series.

not tested on A523/T527 hardware; testing on actual hardware is needed.

In particular, testing of clock rate changes and affected users of MBUS,
IOMMU, DRAM, HSTIMER0-5, and R-TIMER0-2 would be appreciated.

---

Enzo Adriano (2):
  clk: sunxi-ng: add feature-aware M divider helper
  clk: sunxi-ng: a523: use single-divider clock helpers

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 drivers/clk/sunxi-ng/ccu_div.h           |  18 ++-
 3 files changed, 96 insertions(+), 95 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.53.0
