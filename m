Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2D2BF015
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496549; cv=none; b=KFFaJBi5Xj392+cHtzgZkhaVFrmuiX5zyf6Smva1uGMIJ4qxxYxSKncuU9GWM7o63gDvw253xweiv3dpsELLba2s4TQATW7QNoBs3SEXXEL/2IA2PNck7giB8VVtu2ZmMrTtKQVMfVTvAJ3yJy1bduS0jawhGGo7RG1k7KPhiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496549; c=relaxed/simple;
	bh=nDP5LFAVbjYGLvWXVvokRNhMQqzRd+3/OyQyYLUyuHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCfa+ERCp29l7Ug7+N3SObaFFWoq5Z3YAYdH6uXXFg137Ts25kDMU/Tzn0UXiQH6diC0AIB5fMdFcDU52RhsKq+BuoO+L2P2tHNpcJUttTc0ehfh2rLwy6tQj1HOS5a9hxNeT0VjY5tk2tDl9IxNY4GJ9c2KXS1ElgyXLUiEH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=foy7C2q0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hHfst5GU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="foy7C2q0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hHfst5GU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765496546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iPPMy6avhGmJfM3UKWEi6Dk72x27M45G8zTWKRGwglg=;
	b=foy7C2q0A1Pw8FFEgHmXRkKB7MjoN+qinAbIgBYorZVp8oV6VlwOD43o4lHP5xxG07BVz2
	qhpPkNkEK3gJ8UUfN+yz9FhIU/mBKkVyqjW5x0n7CUN/iYqU+lBA/dD1sKj3H0wneRPL6/
	k66eG1scyX/9YrCDVi9lVB9tXcTxzO0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-aaCPBaM-OSe9Yi8OdkTzJg-1; Thu, 11 Dec 2025 18:42:24 -0500
X-MC-Unique: aaCPBaM-OSe9Yi8OdkTzJg-1
X-Mimecast-MFC-AGG-ID: aaCPBaM-OSe9Yi8OdkTzJg_1765496543
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c261fb38so1002779a91.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765496543; x=1766101343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPPMy6avhGmJfM3UKWEi6Dk72x27M45G8zTWKRGwglg=;
        b=hHfst5GUYRDX9KBB551EO5IhFHt0o8PF2TZ6B788Eb8PYjwoEoupUwsmh0NUebZClN
         6uXi5puwqDqFoonkuJllX7O65c2iqxKjsjf04XSjUegRzRn8VPqFh5siGQgHn1EfaPKy
         58qYSe1ryftj4+GNyEpSIm3EVBtAk6/op8V+S6a7QiCb70sxMWSv4UpUW5QiIShabjgf
         B8U4/5vDXRXB1B0a+hEflgJr3B2pA9u16wh/UqGOpTBiVTUWRTZmst6h25ftArPUyya6
         yY0twIglDPAug9vqbpgJpLD8sZkZa1NHNyFqoGMlEe8sftRSVs0zPWfd0LQXtv3uLmcJ
         pMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765496543; x=1766101343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPPMy6avhGmJfM3UKWEi6Dk72x27M45G8zTWKRGwglg=;
        b=Bhs0yHM05urWOMBIt5EeMCDcD3SisZcWoitYfwywkboLVfIz/Bu6jPGQEo5NPtbtFa
         p4/c3W0DYT4lADqaO81hlyb1sx/Pz+gXcMhDkLi+PsO2ueKuaXV8Bp9DwRXVLYKLOMV0
         +m33M4lGIqaURHocpraXA1/aW+iWe2jGjVUdZF2agIqAh7QJ6iOGaZaZwdwDXvvgm3lq
         PGexDlX19T743bDyex5lGWoXZPkeVaARnq+Zr5ExaU5w1eFDYJWjEOiCHsy5SEDdIzMD
         cfAcN8xizIsPRtbWRbDU87eudpDyWVIjLgu86P7gYAbanaSadAkKTnhhgQF2b1baupbh
         H8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSHFFW5lQFjzoe7Rma80zYmd/GgRN0Wwk6BmmsM/l5C7+RLMcq0pxMGi8yLMsYBPeJoemnxpFZ29M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AVC/nVn5t9PrClRv1DLh/nfVpIiWXh6bl0j3MzLugFlmO1Vp
	JT9EneJpuSj+l28WsbiBoSpdzbQkAHyTLBMztSq7CnBdhQXv9JIri1AznD7CsrTbxUA2+ZIQOxn
	9gcUgNM2KI97zWu2AR0CcMisbhYENzNm6nyncBO1jUUsFhk2GrS3z1TZyI+uTjg==
X-Gm-Gg: AY/fxX69fAaUMuRwB7hZT3hllFJNzrpvOKmApiZnPk/H/HxZzte824uXzzbRsL5+IpW
	QTFwRg/B3knDdCFMy1KTGjSbARumh2++uMklnzbJF1/bhYrR0QYy72+nec2bkBQTe7I+o0prv73
	vhcyeUIO67TELyxSV4JbRo8Ut+y4LarceKAeI0MYkwKYXpNinfdIA34cWDIGzrRgyfKTzorIO/o
	cLtF6tlIk808LGPNkHVX2y4TzkH0RFTW2CTjtA7JQ0IDfeS1CHFeGrewR4ZfmrwHZwa4DmTcUyZ
	GSPx7DjJ4aLJLT1FRblvVE3z8wNjV5Z5K0xDs05du+g/O0BZOG3az/KV6Xwv6MvL2p/9KkrIDsn
	bjFvvg4wDUyKYnWtjaQZBZJ8q3Mg9QkqGhC241aHfolJ3JExXWYKeJA==
X-Received: by 2002:a05:7023:88d:b0:119:e569:fba4 with SMTP id a92af1059eb24-11f34bc7218mr234312c88.19.1765496543385;
        Thu, 11 Dec 2025 15:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb4Y61cpVSMwLeUilrF3K3LnTmnr2Iiza+yLFHG0DS+GcS+D7ax+7bdtQ12062fmdt53OFFw==
X-Received: by 2002:a05:7023:88d:b0:119:e569:fba4 with SMTP id a92af1059eb24-11f34bc7218mr234303c88.19.1765496542943;
        Thu, 11 Dec 2025 15:42:22 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm12034395c88.13.2025.12.11.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:42:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] clk: remove round_rate clk op from the clk core
Date: Fri, 12 Dec 2025 08:41:39 +0900
Message-Id: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XMQQ6CMBCF4auQWTtJW5AKVzEsCh2kUQtOodEQ7
 m6VBcv/Je9bIRA7ClBnKzBFF9zoU8hTBt1g/I3Q2dSghDpLJRV2jzsyPcdIyOPiLbKZCS+2pVL
 khWh1Bek7MfXu/Xevzd5MryXx8z4eep39bKGlwGn47P4BF8Zo6mUpeqrqmEOzbV9WOlMdtAAAA
 A==
X-Change-ID: 20251212-clk-remove-round-rate-8dbe60340b79
To: Jonathan Corbet <corbet@lwn.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nDP5LFAVbjYGLvWXVvokRNhMQqzRd+3/OyQyYLUyuHw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtw66Wndr4uIHx7bGmX+Vm2aLXCuxmuaTt4tpfaNGd9
 3la4P/nHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkw3mG/07Zydmb3gfxr1UW
 qt8icGrLzqi9y8Na9r6c/zXF5PTT5TKMDMfzFD99/vbhnfnW9ByFxdwe/6261iyJf6EryH4smCP
 uDRcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a small patch series that removes the round_rate() op from the
clk core. This series depends on this series that updates the phy
drivers to use determine_rate():

https://lore.kernel.org/linux-clk/20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com/T/#t

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      clk: test: remove references to clk_ops.round_rate
      clk: composite: convert from round_rate() to determine_rate()
      clk: remove round_rate() clk ops

 Documentation/driver-api/clk.rst |  9 +--------
 drivers/clk/clk-composite.c      | 38 +++++---------------------------------
 drivers/clk/clk.c                | 39 ++++++++++++++-------------------------
 drivers/clk/clk_test.c           | 16 ++++++++--------
 include/linux/clk-provider.h     | 18 ++++++------------
 5 files changed, 34 insertions(+), 86 deletions(-)
---
base-commit: afdc809e90f24a0a3adbcfdf69ca3b3d2877f554
change-id: 20251212-clk-remove-round-rate-8dbe60340b79
prerequisite-change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9:v3
prerequisite-patch-id: bf41493a2336855702a3f400bd0d4a50a199c44d
prerequisite-patch-id: f41843a2ccf6c4a54655965cfd9f542d362eca43
prerequisite-patch-id: 9baf2b6865fa00be8a7cd5e47f52b5e4569992c2
prerequisite-patch-id: 70135b3d02841cc018c509e3150358cd28b72cb3
prerequisite-patch-id: c5a3ca2d94df2027b011d127e0d79f4afa50a558
prerequisite-patch-id: f08b46260dcd37e2108752b770539b2c72e8b3fd
prerequisite-patch-id: ffa69faf29d4bc016e0947d18f505741a6393205
prerequisite-patch-id: 2a06f73d60cbe3bf565552d8c12152a5fd6606b4
prerequisite-patch-id: 2a401b7745c5dc70e484a0097f06bebf7b49952f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

