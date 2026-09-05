Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A14A091F
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611709; cv=none; b=mhyQ+sItVRVqcZkB7tasjxsrzKM5BMkY8ww2IYJSQ3O/e0547oz/Chua8lAXD5F2BVycOxR+RVBmLgJzeWe2UQxCKw+9oJ5wTE8A5+m1f0E4mbx/Ddx4j7ACYefIBH4E5qi8A6cDzzcpD0RUygGb9MdbqkhAVb/Vsy2/7YTg7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611709; c=relaxed/simple;
	bh=FscHQeKZUzuZgsN1YVbqBe6K3v3ip/hOfNYfXM/WTBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWS6+yz6BXpJAkRDMBnJYAwITVXF10S7Y49CErsOAF+y3nptVSzKVldiJHz66SnbxjiTUOELl2sJt2ZOiCAv/Pzdc6OaZxMXyIbY1DuP5al+c0DMpcPqHgWU3iPcfyBAOAIeW4TRvAkGXnrIfjE5OoO5zLxMK9f2iP+ubFbpBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq6R15W+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq6R15W+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so20811395ad.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611704; x=1789216504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=sq6R15W+LwD+kmsvTOKEA+PH8eCVuIb+1vaKtbyQvD4np3FXcyLlQJuLuoMBeTjPtP
         ixi1GTFZ6bATx5DEa7Wz2Ne7YY0dhCMVHnBXwCvepA5YIF/oVofBWl9kcI4lWRLgbSfw
         SGp3z3JybK+8Ra4yPJZ3QEjvzBVtN81HAx27gWpnpvFi9MqU/v0AjrTOtunyHEqlQkYG
         dw8gFTw4BzpQQxuxDeYv69HlLxSwoGg2S9FfrMxMbpamFswRGHG6Cwp357FJ2U+eUS/y
         StgY13ZCrLoMCgU/SAJAcPvOI7HYYx6TQWLLahcl//OQyqqCDXNmbEpbtWwlQGgwFSoa
         kjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611704; x=1789216504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=irhglR227bjHDm+owlMyhV+roNy4fRJWsopdNcFXxfNBLKQXxaOfEmIBTnSQ7U1xyo
         UhQGhsPF5YdtetpPhBIev54VyB43iILaiOaKiB3F/+gSJtMmef86jORpvSGOp4dBO2LF
         s3+UulaB7C0VCSkRmdSEkMl9pvXnGiAzL4STs2A1XqXYljPajMKmv8zz7DIptiuB+rV8
         HH/BQIOLl/Rfu0l2oiiNYhRi0Xt+P79l79oKgECmiXi1BWKMAu+eZ35L3TUhjr0vXSIB
         bl27Zww4bpgbwuP4O5To+qTAtx35gNMNIcKCkP+iPB02RzQ/3/rKM/HkIIUPNmKpOIgl
         zYKA==
X-Forwarded-Encrypted: i=1; AKwUvBzEeAnPT+Pbe+6QCgKl/PYwicFnof4doJ3zTAJCJt+ntJpSuPRjevoWOWDm7nRDrB/wdpbE8QHAjOM=@vger.kernel.org
X-Gm-Message-State: AFuF++nnPCyOHY5PZIVq/KTsAgozCRtZWlvP+Mj4JRR/n+qROp5mhbRB
	ue4r5l4OxM9oDpw+yoKnsslkGh+dKdUNxuycce35/bnX0rW1nmB3c0ln
X-Gm-Gg: AYBFou0NnsFuCHzxthrnYWEtibS+kkxAqGelMzYqEPBY0Z7xv1g+/OsGzgHlDHGOZCg
	hs5xCHFyDBF5V+cpDI6C+EzOQirrJQw6X/FRwfTlCMn62fnKuuYLY+DU5piVQrUdeHtZUELxefF
	PeyA7PH5LSJwgK2yoOj9aS9DLJthlK9ybAcx2v1fBZCNx/BTOFatJcSjT+3mqfzc1fQ+MJ4mgyr
	Fh6vQSVMFieH8CZA7/nI/9wgdpA6At2K+fdba7eOTwqn2quOGtgDX4G/l9Gtl1sgblSqMyX+xbG
	BeHEh9yu3YwUo45NTU6KZg4x8CJvCnhMZGmOkNHGIyTSa+/9WIaBNsFB9uRBMsJg1QaPMTupy4F
	JKCSj+gHR95DhCYEfSw6iNcMJlcCdIFdiQW77X8eI+AJQyJnx2E6HysTnl8SU4nMle65YyrBN/Y
	pq+b8I/co03sszLvtfk3JYtIvk/VOiKRA+dzJSM30ows47J9qGIAFvYCmYzxXWU/shcpZkFG+x4
	sNkyGiHLdoofEtqfigyp9FSHGzQHOehleLe7R1qFuU=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr19491750a91.11.1788611703632;
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 3/4] media: dvb-core: remove defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:34:49 -0300
Message-ID: <20260905123450.5620-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c due to severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..3b503695e 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,7 +68,7 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 /*
  * The code inside DVB_ULE_DEBUG keeps a history of the
  * last 100 TS cells processed.
@@ -320,7 +320,7 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 	if (ule_where >= &ule_hist[100*TS_SZ])
 		ule_where = ule_hist;
 	memcpy(ule_where, h->ts, TS_SZ);
@@ -659,7 +659,7 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
+	#ifdef CONFIG_DVB_ULE_DEBUG
 		hexdump(iov[0].iov_base, iov[0].iov_len);
 		hexdump(iov[1].iov_base, iov[1].iov_len);
 		hexdump(iov[2].iov_base, iov[2].iov_len);
-- 
2.43.0

