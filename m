Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702595;
	b=BKPgQgex42rSIsVzJ2A8fWI1AbMJN19xTR/lpWc9GFIgbr5Y025Bd8g/O662+/bgq94s
	 DxYFG1pOqqD63+7RL0cMUdeQoEWUR60/ylSDzKLPj85/nKwbj6yXVrlzV9nFPdvZPl3/B
	 2XnYB03oTksiP0M/y2iCTKBWZIPvvdvLgKHcdvhWA5yKsvNxtED1rOd3aMOBO081Sx9B7
	 vEuQpz+VHB9Axf2Vu6hWnWl2l/cLXrO05EFa3KvDWadkHintR9De7pXnT6VHLvAYmWySB
	 oobsWnnLfZEyEwwV+iQXVST4Mta71Z5gvaZb4+Xnl8+RlcbZPNij/SB7ZTMjnRaFXKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
	b=133iDKj7I7m2+h1Zmi3XFt5REzf0Kvb2WWhGDaRL7zFVyej7W12PLHhgbyuVy1h5oFj4
	 /oSpcFOholc4SS8Qhy1FCdp4cMbqCmbSbMBZYTOXZPA3+Dua4C8sIXcOafLBCdRe95RNV
	 VXt73uyGsGYuFTBo0B3AQAOK118Wl4Sv7SPISa+LX8x2Oolgtiz5jRIgM3gRu/cWZU84c
	 CZl7vvybCKY/KJIU3Ebz646t029M8pDSlW3q0LFRjyUVLjFB6Z3734tKyNkNgC9KJMSqI
	 j/8x1FNuRfr35Q0FP4F9U4taVyh+ICDD5Ci8brqotbGizXxU1wmaQWo2Bu3r1S8vm2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca6g6POx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89355606A319
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89355606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca6g6POx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so1396165e9.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702594; x=1793307394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
        b=Ca6g6POxZb6qQwDnJdcJokgEXMTAz1Gl3EXHXFPtFsUx7anJqMogEB0Ss8gSBY1bZ3
         +b0aNL/mURUd1xGZ+q4GYSf31H5MJkmclzZZvQ0rW+RQVss5mmIYZ1SFQx42QVQHJVVS
         MjJbasoV7J70gAWEfHc8qrLiVz0sRwZCrt7l1HOQm1fZPuTRwC6uLG1roG8xvZ0JuEQp
         BpxaLfW9B9AgTdmIDF6gN93Jo1qwd9zY43TjVTE1Yq0QFqZF+h9JovXJ2dhd38p/CmxY
         YxhGebmVRK15icGR3mJnkl7+3LVq1ybdMzgxXMhLGtuASyAksPZLiBPaTLmYQ6Q2PtrT
         5Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702594; x=1793307394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
        b=dLMBcVFVGket2a7h+zHdAvm9tL9YR4SWEPEMHKY5RTkjBO0nuD1mA8qq0TJQg7SaoA
         4+SPD3d+hnYzxn3u/tY6/zud5aY8tjcBcviwS7QhDLRnEyFIse7QoVMgm1o4ydJ7Swfy
         GWMnwfW7h5euZHKhfdRar3rsmXitnDi0dBmhRDwuBp9XovM7MFOg3R2zRt2KwegnjeE4
         C3nA+CJFEzcp702jao00sX/2BYl/iKlXRCQGeQdGb490w4jiQKwMGo1K6u7KsTdr4B3y
         /qX8bqhS3RJ7f3307dAZ5AHv1eTOe3hO/5vfuv6CpHDPIIhz9aQLWhLQmopYTMKHRf/8
         lZ0w==
X-Forwarded-Encrypted: i=1; AKwUvBxi8os1FGU0QzAHYEBIJs2JmpuBbUcFdMZSyVIogBUlMi3kbaBk5BMsUKkMsq1f1cfqAWWUvqVV9iI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8WfPdTzg1DNgg/fIsioOcM4DyhrNi3mZFnIaxfLwCXLeTTVF3
	jODxDkgK5mOVr8JxWLfXt//nKPt2e27fxl6ldFc72Qm6tbwxH7vh9yBE2i+v2g==
X-Gm-Gg: AYBFou0k0j9YwGOwfpL2npaxzXeiso9pFeXSrf1Oo+AEFYONr20YvL1uQ39+tLe2I13
	Vfw7ppKiEaZvbDqMzcuNr1ixtTNsnehRMp2Gv1GOqzLNva++ewX8lQPLTpE6l2olUXYp3fDBUNU
	Uqy9jHt0SoaxuxXgNAGBI2RDazi7zJToW5330w452UVSHq3wUVnr99CcIWsfUkDGKvawvyJpj2q
	klY5P+9oWvj8LhUWOEa0f0gOR7r7f/fbJ+XYNAR/hluINdle4ErCxiUbhsICqdbnqKWfUc0IaNl
	uJn7cxlg08/dW/VQtLsNCNCol+rmjQYsqFcJ4bHZ27PmWTsKTRJM67pR+9DMef4mgwQoF2GvtNy
	4lgavx+BFGXuP4YK5PvJSaY8i4kE4SIMeh8xaYeKNVhJ/Fqrv9WM0cL3OBTx034E/fEYkJgbOCk
	9CwXUWNRbUmE7neJIp+YoYEdfhxdQYL3SS5OgMekw49kJTJhRM5k9TCWPmCbucgz8nqxNM4ESR8
	KXZgWAKx2sTGjafBtBia0PMvtPZKE9jft663L7bn7yPAuUZhkpQ5uQdiAyzK3DRpDTqs3BhLAu9
	F9IMj3f2dHzh4VxO6OYE3mancyeoeVSNWQKgnS9aG0E1yxMYU/l9WnZgJnWg
X-Received: by 2002:a05:600c:46c9:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a211f371bbmr3488455e9.35.1792702593749;
        Thu, 22 Oct 2026 13:56:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Thu, 22 Oct 2026 22:55:32 +0200
Message-ID: <20261022205535.688352-1-ansuelsmth@gmail.com>
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

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 222 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 198 insertions(+), 24 deletions(-)

-- 
2.55.0

