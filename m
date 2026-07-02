Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA02DEA98
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011972; cv=none; b=GcfCeWdnrt7YwPXVL8jmbPnRdqxMLfndULb0ywhZf/zsunquCaAKio62U4USw30TNlkpR3Rw/YSTxrNCS8vCO8cKYdntrj4Ejf4/yjjvtyUyUkHfRx+BXrlTyw8r6jUNEW+gJEIedw5l+pfp8PbRwoW2/2kD+Xdslj9RfYDBOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011972; c=relaxed/simple;
	bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVE+uQ+FRpnXp23EYXO/d8jhDo/psmJ9vuLkJVjOfFlME5biyVMSvL0JBk+10UzfRHFHIekORpzNUga0JIBl8q60gv0u0I+85vOMHK5QDF5F2S7hwXBoAHECbzRWkxxDD0ep/BoGWeJkNFXVSIOjPXeoE0T+fFOEqmV0ggOjYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPaV+eWW; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPaV+eWW"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-737de525d2eso1231155137.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783011971; x=1783616771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=kPaV+eWWOnJzGSoWZnLH03js3d1Md1ErXYMyLeG6DFrVPiXji5/W2I+CpL62RLROR5
         KvgDeDyG9+QIL1c3Hmo1X1EW1KvddvyWAa8d9vQSqZ10hixRdtVCK8+r0rroTcY21Qjr
         cFhEFJ95jBKrtkffsZTRMdF1aG8tsu2kMrXwqCpoCFBwcSQm9Far3JDWKWfIh64K796V
         FCevOM7Z8uJLJmEm7rmO8LtnwCClWOimXXyxwnZBnAa6bnZ1hTgKeTAVa03YHsgHMYmP
         yKQu1QostDzh7EeUDVwiiiy9olU6ly7mWLv6g8kOSz3AgoStHUklmDuBlawX6paMCK/+
         v2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011971; x=1783616771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=QOmXXh1Vm73s06PHtrv8sM7yVUifwm/ngX+3G1Pk6zZEUEQgZ0Kw7FqV+redr6anfI
         Fnkv7ECsy5y+qz2+hdQEnFkIKGtcEFob29+/fuAR9nWAXEs2MR+/BzdDs2u5s+dZYwIj
         /EHbHDdTLsWEUfd7civEnxOtCYqVoM8cwDCwwE/RYS6SxHkkJDrJ8/5f9hye7KdsJMtl
         J5rY2mGrqyUVFfVXJdugefjG6d5ypCU53nc+ZAkylikUC04IjFnTF9XcSsX+uspHMGEc
         1FlFc7RsG5U8HDL1UPbzOP1zInlBjvsYsW5Nxhp3rDvUKH7ekhdF54vHv5ocTMtJycgX
         FOnw==
X-Forwarded-Encrypted: i=1; AHgh+RrtvS597xF9snULh71d7nXO4+FVJZPKrOYLQLCPPyZtDm0vqyknxFMX7HA512GEu3mRkmhjDmEgfXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3GQ6cKJ9aS33/5sFzeoVK2ajkZbC1F1BxVb6yd1O7Kc+Kew0
	8JhNU1mh748yVm9tlUft941Pvv392X/BZyYATB8urmiWP1yMoynaKjCU
X-Gm-Gg: AfdE7cn9YUiIiYwgP2yCqE0lN7M64mdSL7jA3vNAzxS8fK2QTYj0NBmnquvuVlubWhN
	pLjklhuPicK+iKwq+MJ06C+GoiX4oDkRFqDhP9xFACuhZVn3jGlx5K6KmjesNkOQdysTN/H6Kyg
	9BLUdR/LdxdnRN0vWH5wvOHZJDG3Bmcg+xIb4YojHJnLS5zJfvNr9EwBfthwjDO4LhPLFOes7zj
	GmAHRfLz16mSUuJKZithPNSX0dcGET/sRmVLg1SNuwTFYPWvt8WIVkYH2cz3U0GtJFRsZVvwWbU
	X8yGw2eSl6KhgW74VQAwFnEKqqEKxbPnZCb/nSJG6SKAb/1YO8A5HnMCOkWAhhVO3nYYYwvvGib
	RWxSBcDwXOXrkm5uz3uPGMF9itoOhhhDUuEspE33aNs/NrFLafxOEm4PKAj7AJMsg4zj68tPJrP
	pikSaytJ18dtk2z0ESy6CXTpkVsStAAyQtV0OmXCGI1aD6YiDMjSDmQy2nxbI+
X-Received: by 2002:a05:6214:2d46:b0:8f2:8b5e:3b98 with SMTP id 6a1803df08f44-8f3c63d68e9mr104833466d6.9.1783011625104;
        Thu, 02 Jul 2026 10:00:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm30106746d6.21.2026.07.02.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:00:24 -0700 (PDT)
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
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Thu,  2 Jul 2026 12:59:44 -0400
Message-ID: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PRCM driver against the public A733 User Manual
V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
offsets and bit positions. No discrepancies found in this patch.

For what it's worth, we have also exercised the R-domain at runtime on a
Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
misbehavior attributable to the PRCM model.

Thanks,
Enzo
