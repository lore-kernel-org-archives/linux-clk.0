Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F5253B45
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031593; cv=none; b=Osv5AqmRX1n6xnugIjg0BoVHqrgaQyVdX/MkwtDf68+u0J5YKaTsNMS7btywrONkugz1d5xBaw8hZyWSbGaJyMYhJ91/Cg8MooGQms1RcPJIBjma9sfungZZJau+R094DHF+CNfWTcVAB9ajPI0/GpirTM1xaJfI7FRIpqfLMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031593; c=relaxed/simple;
	bh=e6qZfNXFV9KHcehcp9uEWUrK8S0Xj92UaYp1vjRpE1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=OSvVoEPNWvNgmxMBuQwcUoVCDrJWwyv1AR7tFysPVBpWKpHBmjAYtHQgaQGUofbgLGkKbC5Zr5TWx0wFMOPn9gQhKVj98RQMZ4wOmUioHwn2xjXwyrzrvdxxFBFnd4r+g0cNKdUDZzcSplR6UPb8fbM84hYhjkDKLuXCwz3KMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQvPoIvD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQvPoIvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rgznpyMWyyNl1d6TDrUHzLlVmDIGh6R0MoIe4PNIF4Y=;
	b=UQvPoIvDVxSPlZ/+/a+BYemgdd9u0UN6/DGTcWKiNMPp5dQ/KojBtHxLrBhcHV3AaMZ1rX
	FHc8BmRpcXZxH27pM/+dI/TCC7qNXC4EZJBXywrM4+vb1Xumhk6roRmCQ4/qrK7oHXkVuL
	T+01NcFutdui4qODS4ZiuGr22KQ4GjM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-8w5jmQQFOESzICfVH48sqA-1; Mon, 07 Apr 2025 09:13:09 -0400
X-MC-Unique: 8w5jmQQFOESzICfVH48sqA-1
X-Mimecast-MFC-AGG-ID: 8w5jmQQFOESzICfVH48sqA_1744031589
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c572339444so706191985a.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031589; x=1744636389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgznpyMWyyNl1d6TDrUHzLlVmDIGh6R0MoIe4PNIF4Y=;
        b=dPqLZZ+XkV6dD45Gy2uGPQsObJCGdGM2wWsNGLfEB/v7KTHlsxczZ5VyjdUe3b88Ui
         1fQqz+uz8KAvJq/cN0O4rDyAAx180Qtr/ZVvkDESQkHUADZYt3EAq+wr0msWZx179btP
         LzATkGT/7O/VZtcHNbtDq9llTqhzr6TzVFV36yPP5XOuAMAg8dkAYy68DpnQCt5T0a4u
         GEBkYnelv81CJIbpKgudmhrAGlZL6yIIBQncJ/CVI4VdjrwlAwDP7gR/ujXSOM5+JWE/
         DlkVf0jHeJIGkt9l85D26YojivLMjP/EJU+a5rwC4RYlgJU1xLK1BJfWchA6aZk8eRuk
         htuw==
X-Gm-Message-State: AOJu0YxU2TA8U55ZGOaICLseJAPHtHfRPkvSff/D2HbyX4VLqnkSAZzZ
	cS5CBqC5jqM7JC+A/Vrz5VWNAJuDTaqEVkGDQDFi86nWNg0ZWeomb0FOG+F6hqBNobmotZOjmTZ
	HLMauM6bcZmIni1NoeBbhlPwr3zHhtv2ytpq7U31as1cdWodOqvF61rWO5g==
X-Gm-Gg: ASbGncvo6Yyl/+9/P38ugnFWq0dD5pZIz3/R7BX9FF94mnzEmXVHEpE0h5TbyxrH99w
	VJfB3X4VDkbC7KDCjh1Lo70UwHZtMF93UWEnDvxN8Yggo007/q/ALoK08ofKBmZ6BUqNp2bZys+
	urWhb23KPAfSOXo7+JlI6Xm/FVYmrmPw2WiPQhu7TfO3CeuZCwbzQK6povs18+l3Ltkq4Ck+Qus
	Qm/uyUxYWjTaT9VOp8y0ty/3fRJeZVrEtM2fM2vA+uvPs1GtSgHoUjA5Dx5YHxpMxziUSKV8sdN
	fXpR1rHkrul8poEMNYyBYoidQGNpR4fbf+R6J6Inag==
X-Received: by 2002:a05:620a:4310:b0:7c5:3e2c:8e96 with SMTP id af79cd13be357-7c77dc86307mr1184828585a.0.1744031588815;
        Mon, 07 Apr 2025 06:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUyE+ItAa90VvpOU1RkokCmvm1NRb66YGJ2muPLWlF9I82IhCdaEzjXLo4bO/wFecOUiIHuA==
X-Received: by 2002:a05:620a:4310:b0:7c5:3e2c:8e96 with SMTP id af79cd13be357-7c77dc86307mr1184826285a.0.1744031588521;
        Mon, 07 Apr 2025 06:13:08 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 0/8] clk: test: add tests for inconsistencies and limitations in the framework
Date: Mon,  7 Apr 2025 09:12:50 -0400
Message-ID: <20250407131258.70638-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Here's a series that introduces some clock provider kunit tests. These
tests are centered around inconsistencies and limitations in the clock
framework that may lead to some clocks unknowingly changing rates during
a rate change of their siblings.

The intent of the clock framework is to keep the siblings clock rate
stable during such an operation:

    clk_set_rate(clk, MY_NEW_RATE);

However, it assumes that the sibling can generate that rate in the first
place. In many situations, it can't, and it leads to numerous bugs and
solutions over the years.

https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

We intend to fix these issues, but first we need to agree and document
what these shortcomings are. These patches are meant to do that, even
though some will be skipped as they are currently broken.

Special thanks to Maxime Ripard for the guidance and feedback on this
project so far.

Brian Masney (8):
  clk: test: introduce a few specific rate constants for mock testing
  clk: test: introduce clk_dummy_div for a mock divider
  clk: test: introduce test suite for sibling rate changes on a divider
  clk: test: introduce clk_dummy_gate for a mock gate
  clk: test: introduce test suite for sibling rate changes on a gate
  clk: test: introduce helper to create a mock mux
  clk: test: introduce test variation for sibling rate changes on a mux
  clk: test: introduce test variation for sibling rate changes on a
    gate/mux

 drivers/clk/clk_test.c | 601 +++++++++++++++++++++++++++++++++++------
 1 file changed, 513 insertions(+), 88 deletions(-)

-- 
2.49.0

