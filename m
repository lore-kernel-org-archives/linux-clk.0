Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298364;
	b=uu0y5phuKd8MYiT8UWYlZ77eE/hZmNDoWHonKbeazK+yC+6e1zkBfh5o5WDvOsrknNye
	 ysGtwdjlFrnlVdF6fVt/4r/ROV+Cj4wUXBBSU03kx7+5Q2AgVOFWq+D2cySe4c4Bij0up
	 sjaSwIrPuJDfmlO0O6Z2IZMu+YK5y3/wCq6Ra8i5hl2PdEGXNSvrkrPN6i4Ems0SMZFVn
	 5+ozm0qVlxcOHpY1dfa2yvEuuQ3uk9ksNTxPLKq9b/MCJUcEi7pYoAsWgPClo1L3RT93B
	 +lOI/xmkTpudP+mqM10jwuHHQk7wDgytp6GiqOB5suDsyYHbsQwsXAufcsVPrfbGNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCQgnNHZzP+PNKKdD4C2o7v4LNGaQ1ePdwhzcrVNroc=;
	b=fJZGhbO90vfJPMKZVwXKLgrQMN4JNlFyZ/9KxQpb1cgrDVQKfF9l6RSw2XIOdlNY3Deq
	 AqBZYkRr96zNDLtGObO94Uw//8xlbo3wm4ckeXQQzj5BMMwrp8zOM1eFg0j/JXFcJ+gkI
	 DX0ZTYZuxop3o4hi/rC7FM7YTbNjp7/sxgxSrhCxiZdvpTtfIm/RZ21h52no0KpC5Ujrt
	 PGehNuApoxsGBjt4LOfSNFCupLCSmw2gveKCFQpa4VY2JhS7i8CVURfNun4aGASwvec2Z
	 AzRt5rh8EAfPZmSTGjqvxcFiLZ6/FOnssjFC+Xh9w9VOlQZVKodohkqvLmLaefKOydw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdcHviTd;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A48606A334
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdcHviTd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15809675e9.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298363; x=1795903163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCQgnNHZzP+PNKKdD4C2o7v4LNGaQ1ePdwhzcrVNroc=;
        b=IdcHviTdFJne9J8+x2v522N29b5MYCECORqKPNgq+/Jy/ZZMQPz+3BrknAD+rkIzF2
         0SCo6g8eOVWNJVPU4wxtZm5PFUQ0+PGCnOzQLn2ZKealsJBXep2QX5XdBdz265MtspaU
         Nc/mMMjUNUoo0kC2XcU6H7jmRGaf7rCm4icXhib59bKL+TPCTTT/OgiHRemC4XuGhra9
         CWVSXHFPp98fF6xlYv6y3+Q2SRR+D9OejHOZZ5ZaxpnuV0huBk4PqNh9+aoCW4U9gYuv
         QPk88nj+wcOLJFPha1JOlG1sA0XXJVEnnM+07CYfXUN9efuNeVPdlJ5py0CfjPsvFecc
         2tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298363; x=1795903163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCQgnNHZzP+PNKKdD4C2o7v4LNGaQ1ePdwhzcrVNroc=;
        b=FCTvODQw1WivRwBXbM0fFfBbByVsTpitK7aPJZg4W+vySqmBWHE6IxuHSflZyEcJs1
         UqFUdkxGYqWTdYlx8YVnq96q6XNu/tPrYrRbBnKTHbsj+7mLNEwL3YUMo+T0jHYYNAOe
         IzwObx65LCIZpI4hB3+LUwopcMsFes5ZGg1GgcIRZ9G1brcQBOPu1YIthuzzi0OoRCVS
         BBqEskTz2hM6PUiBJs7bxnhV2J1JfjaVNKs1ZfS8OyJJoFvRgvIyBjlEs25lacOM9qcW
         1uSKlWsnp8hbxGz599IgRMIcpL2Uq5wvrLxHxAv9Y9T6+AB3LaxtMqYjjsEpfLD+pU8n
         i3Tg==
X-Forwarded-Encrypted: i=1; AL+hErFtK+dAiV+/R6e6t64PyQH7bfIt545hFeJpK1iUutIwetbqd8hl2DJ4XXMCgaIJXwvcG7VOawd63TE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DBLhaTxTmIet8aOZaDhTedFdyu32MYUWFwKoUaseo7wWcrZWH
	vmfXXBuOBFZiWyQMCrgSeEcbU0t7ctFU4I7TYhDbIlxEJp1YibBiOs3V
X-Gm-Gg: AZFdTZeF9YOlcoUe06i29KlPWgYfe0MZSVq2UsPWygWQqRsDYMUJHYZAUk1G+V+YnHq
	ztdwyT5NZoVYz7epp3/BUZB6kz+JhbHx+cYIEw8g2di1rTk5fqAh8xroQJjZKq5x8V+hHXYDmWe
	xB9140rLVrl4Lf4X5owlJEh61IIfN5eJ5GnhDoHKf4M5U3Z5W5eBLUmlpNwWG+TU4oz1bj7ebLY
	ZmZQA7yY+p3ZHH/tsTKXU6I4LWR9UhzvuUOL1AuZwFQlD/TaRvruG/nPNQrPP6o5qhSI+WF4ykT
	LGAw8u0SILSXf/t0u+Z5+/i8ml7pKWoeo2znI7/f4Lgs1LbIV/Hp1oF5BUHKgqArMME4NzB2efV
	5SjOHcDQnU06Lx/JTxj0DvidncLgbL2xsPGxPKGS82LTzsW3moYIWx45UfmHq06Js+HXoS1tGRp
	dbKvxKGIHWv8WyRN+XqUIkaMOnxlLv7iwQSe9dtjtyJN/Qvd50qjTIqGAly5LaSGEd/bd3xSvpb
	wdBnycBRDrg3bf8D4oGcwkpiXaRaBKMmuWiBLcTCoT5+N5B5/l9c6E2fmywtCiK62lQ0rQkGsiQ
	8JIjNjG58ixes7MiLFv/40DTJNmw2/eM+MX95rg7dHAX3wEN+eoGmPwl7aeFNrtaUTcnd5fZtmE
	u+X3hRgWyPsYTMcJCTrgAD3Z5f+sBw8XKXjCrusXeF96/Z+r/z2H0niNTtuRzOHH/2bFTh8lK
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr154679205e9.1.1795298362933;
        Sat, 21 Nov 2026 13:59:22 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm253651735e9.7.2026.11.21.13.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:59:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Sat, 21 Nov 2026 22:59:14 +0100
Message-ID: <20261121215918.183705-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v8:
- Handle corner case with div by zero in en7581_find_best_rate

Changes v7:
- Address some formal improvement from Brain
- Back again to register clock returning error
- Actually round rate on determine rate

Changes v6:
- Rework to use div_table entirely
- Switch determine_rate to calculate best rate

Changes v5:
- Handle requesting 0 rate

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 444 +++++++++++++++++++++++++++++++++------
 1 file changed, 381 insertions(+), 63 deletions(-)

-- 
2.55.0

