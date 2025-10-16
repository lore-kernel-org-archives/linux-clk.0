Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283832D0D1
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630910; cv=none; b=g5h1lFdo4xClLzAC4SUOq1BzbHs9MdtqNycIFSSKOJV2Xov1MIN7B1enDagONOLCmNCbuhOD6S2HyZDAUHTc0wgQrJDL1WexYnX/K3SWO3WfbOeQli8s2UiwpPJu2bppLoBIOxytWyQ8zDX/Ma6KCyqPCBiD7MGqh+e9I6t0S98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630910; c=relaxed/simple;
	bh=1W6726b6s8hC+gJBj2Ljp1SG20lHiAdl2ClI15dwHqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bwHPLW4SZH+5ayr+xmWXoZMq+mTkDywLwSPXut1omi4RC223l5b0WhttytZ/Pt8se74L4K2LXU7HH0Kq/1s9aelZfUMO1BZIXSyW6G4BSHF7jIV0gWEX9HROZ0aKXzkMHhgQpk5AopomZGFm2Uy9dedAa+LRuFkx1Ol/KVnFiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WL9FNAMm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WL9FNAMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760630907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
	b=WL9FNAMmeiAwgZuVtIpHft/HeMw6h8JjNXmm999kgNP9+SpsZ7hBdttGeMmPqXMd62LXxi
	J35vD+bWbbixDRlzXJ57vfzNuBqF4ePP2lDWATYLisEidN8stbboVj6EWq+PZ+J5eb44vk
	UA2DSSuFLnvKhvXYtQByzFglIzJXFKE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-5ydB6cxeNqiU1KlWLv3h2w-1; Thu, 16 Oct 2025 12:08:24 -0400
X-MC-Unique: 5ydB6cxeNqiU1KlWLv3h2w-1
X-Mimecast-MFC-AGG-ID: 5ydB6cxeNqiU1KlWLv3h2w_1760630904
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1f18cbc6so17501616d6.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630904; x=1761235704;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
        b=BBakygw5PiPiWZQPKAeAzwT0G5qKMajq3jY+E2AIxBx47VBI8HLdHmXuVLjApUs/ub
         YNThzPo+SxS3XbZ4t5pu1V2NxIWbhP4oMR8Q5y8k2NXRYRbSy20LLUG9Prv2LBsU+qBD
         AQ/PHXNRnPMhXslDIqWxngfPn0GGXnDTeWBspzueq3coLQFK/zMs/+aJ4ZUu+u1DgLCx
         H8/nSC9jRSwa2YI11GbwAJjNS0u2l/+ZcyL9zT3pXc4WblnVr0MgrvPRoR0q3pezXHVd
         Cva3M1exSZBVV114kA+/jVR80wZ+PWmRUFkBKXRvD0xOKmkPayllaSWcljLZZkW8uqOg
         jT8w==
X-Forwarded-Encrypted: i=1; AJvYcCUcWwpN/8knvD9LU/8YhfnFF9Od8OGgiK7jjmwzmiARWLTcHaUehl/+6VeVOlqB+EONBeGKcPCIyaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkRKTtqZN0RVdSzQT1SINej6PPIqrqjl3iloF1r5SljuWfUay
	umK1kJvQx/yXeno9MCyIBbKfQ4ZMw7BtaipIU9+rnGZvKivEMl2VXX51W46uy3gnifo45+MPZLq
	nX6TU7n3s73Zl7sD9B3VNeXoZQH6xZoxKWJHJfKxncogQmsfzGKkHACZ5kjNXPQ==
X-Gm-Gg: ASbGncsflQ5Y3xE9c0vXKL1jE0xesCr8Fpdt/loXY0NHfLAO4Pcqxc2oux64SDiyK2s
	oW+GcuUXbI6YRnOW/CyRdzqv1YmzEcoN89XCj7vY/zppvGS+rA9uN4JWnnAVoYjJBLyJ4+DbDBk
	ANR/ZCfcXfFQgM3N4x6DbBQ0d9Arpk2HFDuGe0MqGAEAjkqv04FUzt3/nTBUaAN8q0iuWlCB0FQ
	k46dO0eyDuBSlroc2iU7HTgYLyTECFEJjQhS3HQQDtu8SUzQRsf14Xv5zsPNoJeuG6GugoYobox
	IBGglWzAXX9X6VsBbtZeSFSzBhTTTOyLY/bEMpN5c3RFZqDqOZ/3qG5uPlLhS6jQ9RYsajKxgsG
	/llt8GQ6EQVSsCBjws7n0zxUCnwdfUExm7pWDRc5zYUTVLAO/2HGy0UbauukgPQzpjBjhag==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9077361cf.79.1760630904324;
        Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZrwo8eKunqrW1ZX26p0P/KX7TpXb/FgnwTi4CXt26VbUSEz89WMw80Ziq/vE1CwQ6xEdig==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9076761cf.79.1760630903879;
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e89e723033sm778991cf.36.2025.10.16.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:08:12 -0400
Subject: [PATCH RESEND] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-i2c-round-rate-resend-v1-1-96dd1d725e8f@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGsY8WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mz3UyjZN2i/NK8FN2ixJJU3aLU4lQg2yAx1cg8xTzN3NTIUgmot6A
 oNS2zAmxutFKQa7Crn4tSbG0tAIG/XihvAAAA
X-Change-ID: 20251016-i2c-round-rate-resend-0ae27d7f7529
To: Andi Shyti <andi.shyti@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1W6726b6s8hC+gJBj2Ljp1SG20lHiAdl2ClI15dwHqQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SpRdj7zNMjvRJearcyn3jvcCybGbvzCpT/zf80RFZ
 bakgINVRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABdxZvgf2ty/NiPw2Wmf3y+k
 wjw/Sgh1SvIc3c68oL70Vk3QcZubjAx9KQfdhaLOvZ/5oe8Kx7O0/wkzcubZlK+NmSm+fW6363Z
 eAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
My original posting received no feedback.
https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/
---
 drivers/i2c/busses/i2c-bcm2835.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 8554e790f8e36c5a1cf56c0aab8556b377f2bbdf..0d7e2654a534e92a529f27fdc049812359678522 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -137,12 +137,14 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_bcm2835_i2c_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	u32 divider = clk_bcm2835_i2c_calc_divider(rate, *parent_rate);
+	u32 divider = clk_bcm2835_i2c_calc_divider(req->rate, req->best_parent_rate);
 
-	return DIV_ROUND_UP(*parent_rate, divider);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
@@ -156,7 +158,7 @@ static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
 
 static const struct clk_ops clk_bcm2835_i2c_ops = {
 	.set_rate = clk_bcm2835_i2c_set_rate,
-	.round_rate = clk_bcm2835_i2c_round_rate,
+	.determine_rate = clk_bcm2835_i2c_determine_rate,
 	.recalc_rate = clk_bcm2835_i2c_recalc_rate,
 };
 

---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251016-i2c-round-rate-resend-0ae27d7f7529

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

