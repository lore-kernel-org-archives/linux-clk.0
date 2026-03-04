Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6036D4F5
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664695; cv=none; b=MgoyjLxn0bMo3o4Y7lXqTDdKKJynTJDrmYbh72PIUpnhds3vbTNUugn0GrcNaIDfiZhH4196XjHEar8HtUYoa4kDXyvGw/H8jkfmTX8IQ7flJANykLUZ984auwVJ/10Uzgg1qWPFqcfaoeCqI4Stfrsogim/vxPfuWv6jsORnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664695; c=relaxed/simple;
	bh=dKV+Tlj15Tdqdqkiadliz9buPl2xuOV++2lCpfSoEOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bauT8ND7gULRWpoZDXwWa1RGBmsxSWIU3rMuz6CIeMZn88dDI/ZrqEzj+PZwZ8ck+2zV+favBZet/u7R3VQ3uhgoTcYYKpBZtKOZhsX1VB2ZXeMgQo7+xXgunrrBnlYGpKbfDpSmPkHXxzB8+09AO66lmcKGR0pTTcIzhMBXiGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpI5DJ0v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rI1IVvpL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpI5DJ0v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rI1IVvpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772664693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vHGE5sTPNTR4b6kWgS+4bCWHwWjCNASy9HLY/5bMHjY=;
	b=dpI5DJ0vr8QCoM4TBkJspmXLGM7JQ38qgTH2IeYuS9+HojQtif1G2uS12rIEKnRLZXP0TG
	aSe/860+xerLvHAakLd4aAv2y8ZEREj74c9xdFlRKI23TUZuPLIn19g882hX5b3sOWlCA0
	15MHHCmRox+1Qyd1ZKer9LEHTTW2sXg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-6ufYALUdPoyURQAKDDpEaQ-1; Wed, 04 Mar 2026 17:51:31 -0500
X-MC-Unique: 6ufYALUdPoyURQAKDDpEaQ-1
X-Mimecast-MFC-AGG-ID: 6ufYALUdPoyURQAKDDpEaQ_1772664691
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-503915b0a88so74385511cf.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772664691; x=1773269491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHGE5sTPNTR4b6kWgS+4bCWHwWjCNASy9HLY/5bMHjY=;
        b=rI1IVvpLPQIU0cwrp8oUlEjF4J3jzCLCOUpHESJeeNfvs1eyWWE/mycpUKWam76P5j
         RyspZA0AnDzsRhIRC2A7eduqAcvLEWJWpX2yijhNZ31ZrqECB0Yr2UVRVQ2oOiArpaO6
         InQrbaZoBBf8a75gVDdJajxLmVJtCebCbCPRiCiBf/ODArs0had9sfAddI3RRx+CKHsB
         slz7TivHdDaDgfcdmfU7mbXjaBuza6CNi1KevwGL3xpk8w3P3RJJlJq2B/74ROhznCvY
         49uHV7p8G0MM/lIc3NpfbdPiwbGCT+52wkzQpLsO96FlC6LHsHXI1Rc12B3WQI7mVxuX
         SyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664691; x=1773269491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHGE5sTPNTR4b6kWgS+4bCWHwWjCNASy9HLY/5bMHjY=;
        b=fnfU5kW626pH+vQaVGRr+IOnDV6K/FqYc63vrAnyaG/CSJKiWbfkqQm7hBBJGUzDh5
         nDGM6V7jB9q7Z4YQa0bHcgn4OA622yNdiZYWLfFMwpiRW8P12vurgcWKazgpuyk2qeeJ
         7LxsRSXuZlYTaqLbspmLHEmM2Z9yAq44Ukfa5zrshnADCIbTA4DBOzdBPYN9k9pcL9YC
         vrDQm2Sdi5AfX3h0iU0YCwJwdrHmXVAMS42hw0N4q4KBNWok0/VnXEJncPjrwUR60+JA
         Y+N7AJS/nMCqylf1edgQxr/bxAndbBnslpgKYrVjXOv4+8vKoB9SWQRsIy1pzaJDVXm9
         MLHA==
X-Gm-Message-State: AOJu0Yx++6h/1ugzkn8bxx1xs+7NRy2eL5Q/6rNRIBumvOgmbyYAz4Eb
	XbRTTaNzhUh1Ux4WqmVz0ywWTDuadQ6A/Iefmrt7L9GnHeILt4Qh1lwQVh6p4u6sv0gaZcgHTxj
	gZVM35co3YzpXm2YjeAvev9vD2arp4M6/CtcDoiaAlJ/KmoDDnnCJnLt22ZZegw==
X-Gm-Gg: ATEYQzwr06qeZQe8YI+s+G/EhitMwH86F+M6gJ6rzwqOTu7WDYvc1hWiZ/OYhbb4P0k
	qoYfNmrb3Z4bmpgD87sDyNad1LRmHDZ1e9KUBQCKbrDs7MuWml5MKQ544FWlc4mC0c9wT6cZ/h2
	9j/SsT2/VcaigFzoqCFq0kt9ZdmNE0v1gpfZZr9jOozEk8eUvvtrRI5JiP9tTEtIC5qdc6f/70P
	TxskrkUqSxJI9trtJDvAPBUAjjvUnstFkL+dfD3URXbNuWtlkJqeXDdSbHc7IFy0STKpGIUTNap
	ts0BJGaIwNpcmnLtSrntQHeNKIxIFehVFUBe/RiTykhmAd3QebXVHFJfB5cLJEIt1FWrcMWdAwZ
	Ifsvo/1SN9sEXSwfz8xpgCREpAdpo
X-Received: by 2002:a05:622a:241:b0:506:a142:6124 with SMTP id d75a77b69052e-508db283308mr51980621cf.24.1772664691315;
        Wed, 04 Mar 2026 14:51:31 -0800 (PST)
X-Received: by 2002:a05:622a:241:b0:506:a142:6124 with SMTP id d75a77b69052e-508db283308mr51980351cf.24.1772664690933;
        Wed, 04 Mar 2026 14:51:30 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:7705:162f:3db4:e16a:e5d8:352e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449b4dc0sm157558891cf.14.2026.03.04.14.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:51:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] clk: add kernel docs for struct clk_core and update
 tests to use HZ_PER_MHZ
Date: Wed, 04 Mar 2026 17:51:02 -0500
Message-Id: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3eScbN2U/ORiXYMkU3OLNBMjQzMDAyWg8oKi1LTMCrBR0bG1tQD
 ZmndzWgAAAA==
X-Change-ID: 20260304-clk-docs-0b578f421600
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dKV+Tlj15Tdqdqkiadliz9buPl2xuOV++2lCpfSoEOs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXbE/nvbnt6ou1qnXM3K2t6+Pj5h8/x5AmLWYgzLRh9
 qqOfZ+VOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIoxYjw1uX1z8c38995jeX
 r4LnygSlU/Uaj00P/O5OCNj7+Y4aXwkjQxtDfpvAdof88uaMnHm9fx82aD/dMYWj8sF8rqyvl79
 +YQEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's two patches from my v4 clk rate change series at [1] that should
hopefully be good to go. This series documents all of the members of
struct clk_core, and updates the kunit tests to use HZ_PER_MHZ.

Changes from what was previously posted:
- Add entry for new field hashtable_node that was recently added.
- Update description of duty member.

[1] https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      clk: add kernel docs for struct clk_core
      clk: test: convert constants to use HZ_PER_MHZ

 drivers/clk/clk.c      | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk_test.c |  7 +++---
 2 files changed, 63 insertions(+), 3 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-clk-docs-0b578f421600

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

