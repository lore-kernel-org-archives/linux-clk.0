Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD182E2DD2
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012226; cv=none; b=iLnnLOf3g6yfQgByNOYCSHFzqjqRO/UzNrT6/ITzeV9rVK7I/dyrf/ZZlK9S8gk9yZ11CTBPfhOEmbRC1iFJn42laEQJJJLmkwR0m7yaTDIx+yTJqqGJagGSvdF0wbVEjvbvwKYtyqoIrfal3kUsj/YC5b47HbOnRyDndA2IlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012226; c=relaxed/simple;
	bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mcw0mCfZMzWmD2G3QW+bPVgBke5oFuEqKlqxmfRtzk0EM/AvcVPa7VoKpHj6e56U3JVRmswrowxoPt7MAYYoLS4wj1e2FwCQS3Q+jvJxW9ALn+ZRdhZRPYxrTgRMTItsTJSLB23YhzMFZ2JSujPmKwYFrn5bVpXmDCrbaWferq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoABn74j; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoABn74j"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664d22d7337so1625920d50.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012224; x=1783617024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=aoABn74jmc6ri5jbKOTOoCpt9z0X40s/ceqaIhyaC0p9NOqRHV6wNqaz/Iji2dQD7c
         UZepj02NWtBjQSNdaPRJl5QpCjhtBkdztn5f50zSTQrFbnlcOe5lDUpO7CaSPuzCQuKO
         C3FTuWuNpp5oxuvn7kmIkhw6F/uU7E55tLsCC4RMNWk1njx2vA5+6UnhxGpwViOj2/Qz
         ctni57tMsinTf7tEWCnFxDsHdSSuIuDak/geZ8OJfQhLfQJgIaIArsFSEuBvWT2exCHe
         iMWWZCV3LDe9QKbvbtuebSeq/t8mJnJXzHk1SoTJUIWN4hWDYwiSALTcoudINlInuLv4
         R+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012224; x=1783617024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=p+b4vVhQOQvqtomgCYFTCRpLsYbt6U0tVqaj1OBIHIjqTTqwExwXlpP4MLEpH51kF3
         YBJUv/ZuyK2tbDI/zP59Q56Kbpz31c0AyYn0zBByDXEtLC3dxzkAkIbqudK2MG2Coozb
         iXJwNYiAm4NFP8a4l+8zC+1hj6M2YLRfrjhY0EGPg2lR0uIcaINqCSXaxobhHl4rqup8
         T3HIXcUG4ViMsfKio1iFqFLsB3hGnq6BzAu/jdtAVD3hG3/XVfZs1QEnW9QjGUddpBZ5
         ToCHbfrhABA4RfU/c7eLWPgpoG0IZacqldQg7jhpqs/HVRGlzyVEi/Zafh6qFeHU5wt0
         W1Sg==
X-Forwarded-Encrypted: i=1; AHgh+RoZ+KejLndgN//TMFP4e3mBzRfv8VGodjTuSrZousk/Zs5AtBkhuHOxOVjChuCMwo77XB5C3/z0U5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4H4AP/VMi9LVGH16EfK7W9afKKXbd+zrMY0S6N4qA5aQ57bUA
	Bvm5eRin/oGoWvqChufMqdMH/wNOYfRi9npEQ5Z6nK3y0ZpoANusSWX4
X-Gm-Gg: AfdE7cmmXCKZeqtegCUh3rtXDpUTYviuCWxGWikPVG7hDtSgHy+eacAoqt+DAyDKYpL
	nf9yg/oF99Wt6aI2XRBfiY9wV+JqgzWtMvaCihb6E0b+I7574cdqb32X+Jq3O69Ms+olqUCLuec
	Edjd/zPn3MIaPfoLkiDnTJKsQpa33IDsKnHuXUhez4zPih9YQslkzw9SHOMac15ytN6AA2HRQFe
	QzT9TsY5+tCvthpbNUaSx7TmR8es+F2Kv8eXr64pHA7+1WpJk0MUJTskC7RnttI833JU7VHJSrw
	iMN55dI+y90Z6FjK4ayeZRTNPQAPvBQylYho9LzHLHNkxZeGnX75CL3DNCXw3aAt2BMJdIzPdMx
	GUbQbHmG5lVTX5q/EF5Jm2dje+3yFI42ftFuY4OEf0Izyh+NRJWk63AH5AkUWJOIqB70sKO96gw
	3P0+8RU/XDviztGTxPPv408EdVGkU8TaLa+9xZcD8blcBQYhJ9WWJOiiS4oaQU
X-Received: by 2002:a05:690e:2447:b0:664:f562:1fa5 with SMTP id 956f58d0204a3-66636ba95e5mr448218d50.46.1783012223973;
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1354880d50.11.2026.07.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu,  2 Jul 2026 13:10:20 -0400
Message-ID: <20260702171020.836546-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PLLs against the public A733 User Manual V0.92:
13 of the 14 PLL control registers match the manual's offsets
(PLL_DDR 0x0020 through PLL_DE 0x02E0, section 4.1.6.1 onwards).

The one exception is pll-ref at 0x0000: the manual's CCU register list
starts at 0x0020 (PLL_DDR), so the PLL_REF control register is not in
the public V0.92 document. It does match the vendor kernel's CCU
(SUN60IW2_PLL_REF_CTRL_REG 0x0000), so a short provenance note near the
definition might help future readers, same as for the other
vendor-sourced entries discussed in this thread. For what it's worth,
on a Radxa Cubie A7S (26 MHz DCXO) we can confirm at runtime that
pll-ref produces the normalized 24 MHz reference with the hosc-side
clocks reading 26 MHz, so the modeling demonstrably works on hardware.

Thanks,
Enzo
