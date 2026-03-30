Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7823B5840
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866193; cv=none; b=cZR5zWnqlKsbLqszqwvVNQcHF0GC2NzJHHADCt9sMbBNqdt54mhtqSDTKvSeieRyR/CFoEOkJFAy7zxGSbK5sOQOaUmdA91fJpP2eWu6ffSTrBSRXlvf0tG6Fc70S532BnXgRievVVaoOKTFwmrlswRbB38LsOz/N/P0uWG+ji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866193; c=relaxed/simple;
	bh=2OLJ94HJlikgcrXqeZIl7OisNTmViXdEeC5UBZ+pjOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxsPTA209FLHMnQ6IknUoVSoM2HY1N1ku9yjBd3a8+eKRLAnTCh/gGVRI5eCFT8g+53dgSGqsKTUre8sIUPvFCuwZTi+6BxCPJKQgD1SiT7yyHF/aXB3h8CziOFtSdQzmaIGqRa7oPDOSFmjRXawM7bOL9Sw9EcM8dsAt1N53jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWuRtQ+N; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWuRtQ+N"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1925610b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866192; x=1775470992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=GWuRtQ+N3/ZHQYDY1SRg/nhWJVMV5pcvEmkEgMwldT1nHgfgoe7BtDEqn03L/SXX2i
         TJSfwLsJrhKscuQBzG4El48F+ISBbER58NvOHRXthScCVw3k0fKcwQu4pvy61YUPwF54
         RbgGJvTMwW+rK/z9IDgvWHOBcOsg1X8A2nDLOhP8aCKiw0gD0S2X5hegl2Agaf8a6VhU
         LgG2fnkC/eKroP9IU2T58/F5m9xcBEBPSAnkLQLIsNRXeHGtMtSJtPTB6YHCbOjSDEbG
         Ihy6QEGVli1vxCe+8ThxxUIYnsVtM4TN1sqgwMVwRzyMsNwNId58Y1YEMxtFsu3CZgfs
         WLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866192; x=1775470992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=gjBt0agg/AeGiszqWQRE+gnfH1r2N59PzQtSDGzsmyMZeaENS0+Y4YhKZar+GaN5Yj
         B0G7u0/YWbT1GanV6SFzR+QCFnZFQvdaexiwATmiIkJ+48dl3uRJs9+PB9ZGxOr7YGk4
         oPx4o9ImbzvBWxRj7HRSadRf9KEiMVZVrssfhuoJrNOc8k/8rfLiXaV7ETn6/5TXbK8L
         /dDe7nuYKsRPeqPgZfEHU3gxjp7+ihQdYIrQuzxqNH9ziAh45q9nGULzcRfLc338+Gdq
         uKZt7KZs/tgqZMhS3XaXceaAXd/1TOnCp6VgEeYuXtr5SvS7svqsmUgqBd+BaA34ZHsq
         omsA==
X-Forwarded-Encrypted: i=1; AJvYcCUzm1P/MzklRkyacXDd/vFiGzjSWdQIVfBAO8craQDyQXv5IQakTG8vJzwpsBdB7Z0xR2CZizsLdgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7WG1X6kxWcvNF/WHPf+NRjq58P05Wjt9IS+MiDlCLiG4/8UV
	/MN8kWUUxrHU2m2PqO+L3DQYmzBUM6jDpe+ubfhliETBEc41muxfocUH
X-Gm-Gg: ATEYQzwGUjmN0YJsTjbQi3alXCVKibryFozySBQsq6l1SvXYVUr6xFX8ohXdp2yqopt
	y3gEVo9NRWWYfnMksYI+E11ROXlO6a7JO2bx2kI1M1BV+PHFSkAruKp0Tvw4Alp2KNBDQOAGFZE
	88n6wyzaAhfc51nvOs/GNpXVbG73o9AVIZmGn+UQQ+YSkQHKuIarUg2eQ0tZZ+tVTx3ma1S+/++
	+90EMtij3NR6FN24SXuvZlMMNySb4Y7NYseSJ5MeTToNceye8PGzVTtoDcHdYlhM5/e5QZhI8u7
	xFGhFSEpoMpDHHvtyAPUMValgVuUEFCYpSi/O/u7uRfv/NffFggnI2UMpjXbnWBbOWM558Db4JB
	OMgrgNYq3pVDyo+f7ecQ8CsyU/U6qYYPh+LZaRBVtJ+XqIbSu2pEslfKWaq3ZmFhxqo93hQIwgw
	M3G1kqoms4+SBR1mp0n3A+WWiM/E3bTb4=
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr11682638b3a.47.1774866192040;
        Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
Received: from ArchLinux ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm6948403b3a.48.2026.03.30.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:23:11 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Mon, 30 Mar 2026 10:22:55 +0000
Message-ID: <20260330102256.17631-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 29 Mar 2026 04:47:55 +0000 Biswapriyo Nath <nathbappai@gmail.com> wrote:

> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 

v3 of this patch series was sent here[1].

[1]: https://lore.kernel.org/linux-arm-msm/20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com/

