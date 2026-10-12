Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A24A2608
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819681; cv=none; b=qUR39wIWOTJfNIobDKk/SB8G4+wgXxB3Lnvl3oWAEEoN5IMGkp/nt1SijOvl3Mt52WHk5mQxhGEbNRRtsxL+fZwE5q3E6IP2plTjKDcAHGRDpXa3jqmIg3IAqnqMZBVM6wwWEvlPyn5SkHwPIqf8bd/8ta8M8lRVdLXQbjRdpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819681; c=relaxed/simple;
	bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkOBBl2r0NLIT3ZNAaiU8/IQkThDOnlT7+wmIU+OzNjoFSIxcMFrjnKA4jxLgvx6SSqLivgbO8ls5gcYzLRao0eODzNPP4V84eC2xF9amMhiQve8DBdDlTe2U4M0ho4jXKoZF083iqs3Nnm84PwrQEdYVps7swjSW5mFMLllTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpuGW4KW; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpuGW4KW"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8266c388b67so1808407a34.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819679; x=1792424479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=gpuGW4KW9LnmTOy0Rkpk0eLmfFcKer0z9/Bp/LoP928DUGexTkTuvJc4lvmn5jkbWv
         qpke3MmB21yxBww5utUTXqejrqwyaCn2GTmJCK30u71HSQVHtwwL3oEXtthQQnHL+NQV
         PS6szeMIEDzJVPkNAnf0gGPhF5YykZMNyG0dSuyX7xEKCFEB5giA0FwaRK/9/tl0wnov
         PTF6xJkainmFspTWQzOvCtqVMGiq9XdWU67NZJItMKIqvfBOSIPP5SNg7Z8wgueCRDNG
         r9xcGL05oKjQCWY1s8Q5au859jbWM1WvZ3xwduapSkWuwcS6Yzvzl2yQNcLt5q3VCrXH
         OI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819679; x=1792424479;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=m2cqbQuzOjb2Lpcze1exZC32r35whMsu3jUUvNmyI3TeZPGjPBg4T9l23LsIut/Evx
         L0e3RI5D9NPcV1DrQkKFj+nnbiLtiL+GrX6mdSXuuyoCoTwHpMPXDkyZfFlYVOh3cd8F
         vLHqKKx45yaPLqXR8IQFHKwaYWs2Qeg4bWKc4tHBFy1e1ge3+beXgLhTaWQ4Ki1kfIWh
         5sYd45D2E+IlTvZLTXj7RcO8JnazCiTTLOZ2ZcKS+QWCoQjRCeLclW4uUW6lUshU9S09
         SsIcYZk8HELTFKOK8GQoCGkdhuDG7sF7DZQKe9ggOOvivhjKMytb63KkndREnM6/uJPp
         KJJg==
X-Forwarded-Encrypted: i=1; AKwUvBwsXeugcccpHlNyKmyGCAzJxb54oa+KYRDlkpUkfNkRWt4Ss+L21QtT0GP/0V8VVpRvQUNXm9T6QIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhhETcAIcRtSVDgqOoYFQ4K3U9rXzYmbhqBdymw7ocHtKnDYse
	U5F8nHRZoEemy+uOmR/FUTd4SYd0u1rYDXeXdR0fyHiqhNpAJOVG5fyQ
X-Gm-Gg: AYBFou2K4TM7d520BNseu7mFx7F1/azovx1dvkBqiLOGc3Bg5ZlrVhpU8Z7bYkL1KeQ
	PRcqhJjlWhXZuyi+N1XfzvOWGLqgFr8G8cPCAbIjHnRRH4Jkf5mVbxFI105Cb5Wz0JvSNEEi+Kg
	cF/2T2lrV1n6i6OtIMLM7wNGVUkILZZnp2bGpnIb6rymBldGQK2lQeYUeYIoM+lTtd0KWW7cuK/
	qJ2UabLLDt20ztjTzQbntbIE+odQQsAj9uoQMMWbh1QEznPvzbfRhFck/RZy8a0NOJeKvDK1zZY
	hgcIzyqHtTn9Nc8dRJfVHlBXbjPH2Nx0MHiW31RuIawk691RvMch2na9YRWjrlxv+Pt65TO0jW2
	kfXWhhhwjUxy1MvpBa5zX3wPTGEGi/TSFSFSFUfpUFaVJe+fF3+LpVlh4Bf1C5fakwI9PmkAwdV
	hG1mw4s1quiJs2iO096eI89FN+Hwumw9t5+l/cM3dlbxy2RYYekh+AlQPEhPozn5+5AA2oq+Hpq
	RvkNZT2bwuDnH+TFnfrt1t9OtIUwp2tBgTOgU2AVjID/LWOsbs=
X-Received: by 2002:a05:6808:c40f:b0:4f4:d914:8603 with SMTP id 5614622812f47-50c4c7a2ecamr11290630b6e.15.1791819678716;
        Mon, 12 Oct 2026 08:41:18 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-518a72a6048sm5842486b6e.5.2026.10.12.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:41:17 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Mon, 12 Oct 2026 11:41:16 -0400
Message-ID: <20261012-a733-ccu-v6-a7s-test-eff62a3e9eba@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui, Vinicius,

I can add a scoped result from a 4 GiB Cubie A7S using the vendor boot
chain. With v6 unchanged, unused-clock cleanup enabled and no
clk_ignore_unused, all eight CPUs reach a RAM-root console.

Ten cycles of 15 seconds idle followed by a 64 MiB O_DIRECT read show
mmc0, bus-mmc0 and ahb-store disabled while idle and enabled during the
read. Two additional 4 MiB direct reads at each offset give matching
hashes. Card-write counters stay zero. GIC remains enabled at a reported
480 MHz; MMC operates at 50 MHz, 4-bit, 3.3 V. The board returns to vendor
Linux after the test. This agrees with the parent-gate behavior Vinicius
reported, on a different board and boot chain.

Correction to my earlier storage description: this is microSD on
SDMMC0, not eMMC. The eMMC footprint on this A7S test unit is unpopulated;
this result says nothing about eMMC on A7A/A7Z variants.

The test kernel is v7.3-rc1 plus the public dependencies and local
pinctrl/MMC prerequisites: IRQ-bank allocation, firmware bias preservation,
a read-only PF supply provider, MMC error handling and two DT pinctrl
retry/parser fixes. ITS is disabled in the board DT because enabling it
still stalls early initialization with this vendor boot chain. The GIC
clock is already marked critical in v6 and remained enabled throughout
these tests. I did not add critical flags to the storage clocks.

A further eight-CPU run read the full 119850 MiB card with O_DIRECT to
EOF, with zero card-write counters, and returned to vendor Linux. This
is a microSD/boot test report, not whole-CCU qualification. I have not
validated LPIs, voltage switching, native PSCI reboot, suspend or other
CCU consumers.

Thanks,
Enzo

Assisted-by: Codex:gpt-6
