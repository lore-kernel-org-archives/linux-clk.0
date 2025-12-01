Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36B2749C9
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626822; cv=none; b=qKDz8Ve+9sbXykQC9TMQLkeXjFNsr6YnYdhBtm3qzo/5/+cg9SQwxIr7R3Q117xyfLOWqaldXAAsSxshu6BKCra2m7sCcLWzmsbCQk3UGb6rgycOp6RaRARt7ovL1Jp4BQDMUbxBiJk6Q2qsahQTrpYyDRQE3Fl0iB5L+lD0iwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626822; c=relaxed/simple;
	bh=eJ4HeJ6rO8c2MgIZbO5Cv7q82YLDJcVxSQvdmLLumcY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K3QZ8oar8rXOg9IL5Rf4ZdOxbAgFfuem0ShjldMcWhnm5lqdMmprVad5NxN8Nas5qIe+Zhv4AoZITcEagcl51AE7iGtKn7LAgJvIu8639Uy1mp63HFKLxOmofERDhOaU7sM+hV7bViQ00e8oSZrkn1ZGBW0uZODrJtXb61Tds7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V103F8Yb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMVTda3g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V103F8Yb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMVTda3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764626819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5h+ZaIqdkOT0JUgcYkBXdrYmLZZ5ackczkFtgA0u5ig=;
	b=V103F8YbKFp2xqOKSLhQbf6E6Ne5K9ynJUWJYUwjlVRraj0+GBXgFKYdOzCrqp711HXuss
	yRj23WywNPZQDglU52eXNyUYvQfaaKdyUD3dTfE46Yoq2H88KVtH1pA3ztAFe5FeN1fRsK
	qdspyKDE1GY4BpT1XkKvNiH1TDImhaI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-SCu0VjpnNRif0P8PknXCiw-1; Mon, 01 Dec 2025 17:06:58 -0500
X-MC-Unique: SCu0VjpnNRif0P8PknXCiw-1
X-Mimecast-MFC-AGG-ID: SCu0VjpnNRif0P8PknXCiw_1764626818
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so512785085a.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764626818; x=1765231618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5h+ZaIqdkOT0JUgcYkBXdrYmLZZ5ackczkFtgA0u5ig=;
        b=IMVTda3gHcXTo77f6qJJ4XXSj39TCDs1IHNYwYLsl9mIjcSo04VxW0/FqnZ4ETP4Kd
         ElU3nkehSQDzWdHWq/xE986akRBObeFeVyUPCXRXiHYOwljDtpRaFrae8F3Kihryqv0g
         LwoAehs/WLuCfQegE02wg3npscWC7zQcbCP717hEzrZ6ws7FI86yeZdbNwidxkeFMOky
         VkBBCOmT2ESLNYkb14v4ojt2hY3NzuYxoqOE7CN8yMA958HDHXMKv4DAbThcdJrcC8OO
         Ad2MTe86xQ4vb3XEdeV6aUcLalalNOOAk3xlrVtIzpm2zl3xN+jY0rhqcOOzPF+cKMvY
         cpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626818; x=1765231618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h+ZaIqdkOT0JUgcYkBXdrYmLZZ5ackczkFtgA0u5ig=;
        b=iw+NVfbLBQJDwFK5TPABPha+uU73YULFfbSf2mklkssL1elYCyZoO40b9eIydGOSWM
         nqY+mHt4T+VdFxLutFG7JpOO1/8YkWYgUJxzTMeUNk9Yf7gBTJZ218RNfJPTRVZoJUkE
         OLIbZKCEIbHnlk8y8Dp/b/XzvBChuM7m7E974WrwiDVzI19CaLkjAhbYMPFrtOyzfxLH
         j/avhc/3KgkMccE+yKQvz2jwzAJtxmxQpvPOmHSgPg9WFoE9VIBmwbD5AfPE+K597Etw
         j620l4lALmGNVLLjbHXl48lnExfOVZHg3xANyNrjsCUpUvDw6dToVupdHYZ7wt5k0Px7
         q8gQ==
X-Gm-Message-State: AOJu0YyeJM4MsCGpALLIGDgXXyCgacVfPjfTXJJnffESomKUrdST9AMg
	daoDRcD0IoPcMWdXv7c6cWwWL4ZgiHOjr9g9YrZHqxl0V5rVQbee1LdUIA3dnMZELtAv5LlQZMU
	PO0zMDSgF9dV1ijXxZPGHPvVJXtij2sFFVGcerIcfgWCBYr6ILwavVnu6avvJ7w==
X-Gm-Gg: ASbGncvY+sor7WyuaKjGWW1BRS1LeqLy8/siMWESIZOja+LYdAx058/TP/EmUtjlBJZ
	OB+gYuDUDtA73dVj4slZ+sAMGBaE0K36xfpcRIvtrjy7QTM318FAgcjugskIynkvAdBHlwkIo4E
	2Yl/xpT0wYIJu3k1uYeSadlXx/lkrszdFDE1XVxCjq7wQf7vvdN2AEh4Rzcwhkc1DQLvs2qQPyj
	kQq0q4Zs/V1G+z7xlvVOSGmZWdSUKQ9WVCI1LwpWsm061F8LRLFBci/CX6RyxGV3KEQOHi4aSOc
	2IJ3tsmSGYDRVxYMVrrJE/bhOPTMRJyv8Fe5Uqfum/h9xu5teRZ7wmQIJaR+YtpCJ0SgwqUgCDR
	096Kk2RoI8OB4/2Ql
X-Received: by 2002:a05:620a:390b:b0:89e:a9ea:a374 with SMTP id af79cd13be357-8b4ebdad207mr3503922385a.67.1764626817688;
        Mon, 01 Dec 2025 14:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp+QWQX39+3wMYbQPQ+l88E0IO9Nm4qZs8ChFd+cINGgE00Fay77cs4HZTZ5MBObslmKWX+Q==
X-Received: by 2002:a05:620a:390b:b0:89e:a9ea:a374 with SMTP id af79cd13be357-8b4ebdad207mr3503917185a.67.1764626817236;
        Mon, 01 Dec 2025 14:06:57 -0800 (PST)
Received: from [10.235.125.224] ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529993978sm944541085a.5.2025.12.01.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 14:06:56 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/3] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
Date: Mon, 01 Dec 2025 17:06:36 -0500
Message-Id: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZhOtaisvIdhge1gJwolLSEa0
 rtbOYDL93/e/yskjsIJmmqFyIskCWMBvavA+m58MIorDFppQ6QN2tcTB7ExWC8T9vLmhE6d6yN
 r4l45KOYUeSuKeGsLe0lziJ/tZKFf+n9vIVRYW+qNOR0c3S/XyM53896GAdqc8xfOMkmmtwAAA
 A==
X-Change-ID: 20251125-clk-microchip-fixes-d0864e21ef0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=eJ4HeJ6rO8c2MgIZbO5Cv7q82YLDJcVxSQvdmLLumcY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDL1BOsOTZbV8rj2nc+tPmrt61NRvgq87luezU6bK2V3N
 7VJxMixo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIncYGL4HyDxLEBSxzNY2PKa
 8tarV7VueNW3OLWcWvOrK7hb4eoDFYb/RX0CXx2fvnIp2PtgzYeoHRLzdtg1+RztX3dUZG7x6vN
 szAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that fixes an issue that fixes an issue with my
round_rate conversion on this PIC32 driver, drops an unused include
file, and a change that allows building this driver on other
architectures with COMPILE_TEST enabled.

Changes in v2:
- Add new patch to drop unused asm/traps.h
- Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
      clk: microchip: core: remove unused include asm/traps.h
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 19 ++++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-clk-microchip-fixes-d0864e21ef0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

