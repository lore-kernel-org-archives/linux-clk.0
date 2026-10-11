Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3D1A682C
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748938; cv=none; b=Y2tL3NMZS2y63Sh9OEJnRur0vzWyqHzXFZGfeS4FKITHhIXRC2Itd3m4XDMwZ6bUATp3cLu7/Z5C/8wHZfr3zS1ntgFpzdNCQVlqZi+W+kt0/C/FsbyWExoYrhIAiuD6ujPUBjXy1NECLK5VtmEOSPBiIqyl5N6c5MmYfz90Az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748938; c=relaxed/simple;
	bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcGhjTD+7YhlpZhvgMVxCc8JHRwpICk2LW9lmlSAmrkfITl1r0jgwDbUHHBKPXR6gdhOMMSOBc9nGPjvk483OWuWXJRxWLSS2qJfjCakJGLHNuFa6/WRM9aTMnBHsy1hgZRscAtQqDNIJRr7gHhdAF8EWuFplc6fvQRO/j5JVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDhfjHBt; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDhfjHBt"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c1916da745so2925570137.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748935; x=1792353735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=UDhfjHBt77VezRIIZD0tVhDWSWWbXuxFXAlyIcYRRVBJXjPSjCgp/7ZhZC3OCKYr+H
         FMPyp4TYP7atvfP28V15D6GbMQHXTf3TEZ4IXAsAA5kzUTmbzliohhL44aTn8YfuoNWQ
         ipzNjrpJ36TWtisZjgzgpzjBCpru6ADiSvsN/arX903iHl81tqAP0CxnD3bdjQn3J2lT
         IhNpOcpUfU9OVu1JeRwdq3zn+bh6YYn18aHZQlLOYrfB2+pf32kJ0gd0+El6441f9nt/
         +OFRMPVaGKxmqS/AIAQK+v0lrjRTT1N8aTne5PuEZ4p8Vql0a604ts/Vtg/F+XqQ1MAC
         uFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748935; x=1792353735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=Sl8s4Ibbp0RhLTDZ7pznlBgIOKbbzaN55T5X30FXssX22kWIa7PHiPmCe58knB4Cs1
         SeX+EI08iXZio4gXqxUp570lkUPeqYC2H3uB8LuIdIgAw9LFhvv6P33ThJ4Tuxvn5E6c
         6tfjWP3IKVCIM9/wNqmY2aiIx7PzopiQkie0/35yZj0Li/yEPhFOIRJZMQbhTxFtBdyS
         JcnRAF9itxbwqbLquIX7xn/ocM78UmhEgqHLhV1JdguCRSCWYKRYftg5B1HhLHwYEXlv
         AXtG+LDucZy3c4G1ioW8Ivj/u1J/9O+7+ntOdUNAnUgKiN55N3RkhMma7YbfELRexeOz
         tFMg==
X-Forwarded-Encrypted: i=1; AKwUvBw8KCUdbdRM60DN47AOWZIKiAIJOmKMB/5baq+E9M1vJw4wRhOADm0vptzw5JnMvAFc9zBSsI4jKYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsqS2cZGGizG0RcXGz9P39e5qRUGwe5ct+PBcgKiF9uSGSihit
	gJzuEqrYklY1CobwczRtSTcrpOFC5fQcRNozMwFDeeJgFkfDNuqcPXqA
X-Gm-Gg: AYBFou2jJt2ufDCwY4pT0yr+S1qOftkmcoK8Z8tTiEvMmnrVzABllKO1AEXeIZ5z1vU
	sQHr7JFRq69HoIMbNgqA4s4iZmLCg8fz+BJ64z9vej4aTbBSJ6mbQcwnx+OeChI8cPn3zCXshn6
	ATNIKEZvX9PcM5wwODtwUZ1cxjIDygpsV+NTcXx41ZBTILQ4dsmc45ZHL4p+zuqfnf7+BxjXoJ6
	iM+aOMDBjxqzxs6dqXIojbtzaInnn1TMFxYjd1CfhKnGcr3z0BgjQBVL6X7VZ/Gz1LLhwQ0OzB1
	I24WpIIrEFj+9lLjYwhnovAPt4oOxHsOX7o1bUhpPqvGY8crlZkyaozWYA87/hwak2bpJM36GJ4
	9rtMltjXl42nlP+5WBjvxLHqy84S+hZvUZhiLPtfQTP2A+HvYYdYb+avFwm85Z+3+pU4tfOOAA0
	81sD2GllcGqvUPTIXvixYNqe7qFbGvNlOUOOBqcotS5xUnAc+k/xbDTu2nM5MZEnr48kSnaZZDd
	81YMR5UBeWowDR0zaONcgfN04++n/jk900ejm6u0t4fTxjrQ4WL01xQbtAEBl7V4KdFKy/BJAtW
	dKWjORG293vhrq04Rw==
X-Received: by 2002:a05:6102:44c1:20b0:7c2:37c5:dd21 with SMTP id ada2fe7eead31-7cb39ffa0c0mr1416020137.17.1791748935266;
        Sun, 11 Oct 2026 13:02:15 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ee656bsm5190361241.5.2026.10.11.13.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:02:14 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Sun, 11 Oct 2026 17:01:53 -0300
Message-ID: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

I tested v6 on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), Linux 7.3-rc6
with the eight patches as posted. On top of that I have Andre's pinctrl,
Enzo's DT work and my local DT/UART/pinctrl changes. TF-A and U-Boot are
built from source, with local changes; boot0 and SCP are still the vendor
ones.

It cold boots from microSD to systemd with 8 CPUs, with the unused-clock
cleanup active and no clk_ignore_unused.

About ahb-store without CLK_IS_CRITICAL: clk_summary showed mmc0,
bus-mmc0 and ahb-store disabled at idle, enabled during O_DIRECT reads,
and disabled again afterwards, over three cycles. The hashes matched,
and there were no MMC or clock errors in the logs. mbus-store stayed on.

A native PSCI reboot also worked without the local critical flags on
bus-r-riscv and bus-r-msgbox, and the data was intact afterwards.

These tests cover boot, MMC and reboot on this board, not all clocks,
resets or secure boot.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Thanks,
Vinicius
