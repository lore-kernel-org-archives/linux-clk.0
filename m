Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031E3358BD
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907068; cv=none; b=fE+88cVU/dnRu0ANdQXrp7580bxS3fheeTOJqeHmRgtB19qnC42UVGID2e4YTiPeqTIemsIdiVDLXPN7nr4cDbvnCi2nnwgOoWt92LR9Q9LybtKG2qnAS14myP01vE7YuTK7PTLMD4ABDKX/HmnbYRyJtjeIEDxAk+0Wcgz2gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907068; c=relaxed/simple;
	bh=ezyZCBz7BY8t8FxF4YFrSSzgfQvODsPKF5EJi4+BluE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMXrdcPoXHyFqptDljvaSWnDNU0F4qXOUyE9wMU7M8eG4oLSY6o4uJnAyke/nJ6pdu1ioFKH2dageDiSpVX89mCV38zDgFALgAcHhAM7/LlDsBUG0mVv0oAtSFVg8cVtgtEclpE6YwVeaRaFMWyHQF6B2gi28v33mT+z1/Pmh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPHLptqc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNNolNQM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPHLptqc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNNolNQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=;
	b=cPHLptqcUUeWrSsE8Umx78BeS4IDmMweezo+KP7AqbTof4sU6cPwwdcDWzOxxJ8i6o26Vn
	OwN5DtQsy4BNxv7U/Lq4v8kxU3tfsJ6WBzcaF72rAZgLc8tpwdJ2XhldXJifd4hr5McejE
	tt1xc/ObE4EgA0MWSLbHySy0q/IxvZY=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-w0VbE_ysPhi5-vFJ13CFqg-1; Thu, 08 Jan 2026 16:17:39 -0500
X-MC-Unique: w0VbE_ysPhi5-vFJ13CFqg-1
X-Mimecast-MFC-AGG-ID: w0VbE_ysPhi5-vFJ13CFqg_1767907059
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f65d0a94eso4521974241.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907059; x=1768511859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=;
        b=VNNolNQM/rvJbSwWpTIwO2aSIl2zecp3eVgjqZXD0DKanY2b24EkmKBN7Ea+eIzvIt
         Hvvy+l4yJRMkWD9y91mjiPl7uK6Th3l3/a/CtGu+Ry/6z4673+x7hoL3HYv04vjBJrhK
         yhgkVBnr1mnLJAFq2DU2t03oL9DHzNydBY9ZZ2yzukpTq3cGPX6WO7UvESHyBTEeFmct
         RZVePQhtXIrHXJ7YRstAWvlt/Bm8n3vo9wmYHqR9us+fs2EL8Cak3jAj32J0kI2c87yB
         1w+jhzrPfZfBl6CnV+izPXDr85VK75CR+Nf6H0ErkWgD335oLYnBB6ha9mnmbtdGUgRf
         kmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907059; x=1768511859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D5cIhvc8dQLYctZYfUjuPlu8cNI3Cxecf0YI2Axf+TE=;
        b=Zc2RiKyS75xo+kdWNWVTljyNsM+ffiU7SFR3AuKaNdUsxQrd+9k/yd0LRiRrPDQCZY
         3gfVd5ZZ5xdv09TsPLy776Rs9/zb8VjkrDpHLysWfn0ZjxGeXPrj2pEHOXFTdmnWv1Mv
         QayH5LiFDorTjPDDeYEIL16cY7YB0Z2KoTFwvY8boGXOCPXSLyplLiiycNa1eH0bR3Go
         DN34NliTxJm9nLY5VuxIpcj5tpTENcEFOrWzczMmpUtQaM6hK1+BRK9jSAIkzX7KZyQf
         9fDQB4C41GoFp74BtW5epOzr3CMmpNERAEsUEJc7E7n62q8REicYrZ4tMfPd3EDtFyIb
         treA==
X-Gm-Message-State: AOJu0Yx/iu18+WmOHd6ZQ74gQEdNaiVLUUnXI+5qjK374CL1paH2tKR6
	p6F9CdrLzpPwDF4yAAfQnZYjN248xap20yP+yKVoIS6zH+zsKFATBwbhAEoAAzy489sZ4a+2DVO
	pm9fCSuPGBe1mAP1/xKvJoJukjKM5j+03vqScphL+qoFpv31bulzBbuaVycD0Lw==
X-Gm-Gg: AY/fxX7PN7f3EKDaRakw83yDWNtUiVVyMExFWe4P//+IL3Fvsz2/suouLym5Zs9/iF/
	DfSM6RVlU2yhFKFI3N9bzM8qPwyKZcw8rY9Iftbuafj2htay8l6wv4dVsdBkEPAYEBvXLHTY9K0
	iRFDluIEM8UzNb58pdxqEyJ+c7PhP8byjCwNVsGUylJAhDHTSCKys6Emt4qPv9HGVjfzsWZwskq
	2uI1bZVGHIjiVHpI5n7ndIf1GOi8ZqFzaiEtqO/e+ls2DRG8W3it68/Q6GqrZ5mpRtTBOHWEAPq
	hfcYkHdeWZUUA/2Hx6dfQGDPDzSM/WbpXlrHeKZD4yFhVwOqkiocqDaFgzPqKcALciEJoLe/DcN
	37Jcyf3ohejP9tz4=
X-Received: by 2002:a05:6102:4a84:b0:5dd:b28a:2e7 with SMTP id ada2fe7eead31-5ecb06087f2mr2463944137.0.1767907059171;
        Thu, 08 Jan 2026 13:17:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFevT6XpqiDw3gC3iSZKj1S68mskdqd8KLh1Xh266/vYweAbfuv8F4ugSPmroYppR3BxoB4zw==
X-Received: by 2002:a05:6102:4a84:b0:5dd:b28a:2e7 with SMTP id ada2fe7eead31-5ecb06087f2mr2463933137.0.1767907058653;
        Thu, 08 Jan 2026 13:17:38 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:37 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:24 -0500
Subject: [PATCH 06/27] clk: bm1880: convert from divider_ro_round_rate() to
 divider_ro_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-6-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ezyZCBz7BY8t8FxF4YFrSSzgfQvODsPKF5EJi4+BluE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LZNOKPG16VUEnn81U/VWLG4RcoK2v5JAkZRG78V6
 B/MlsnrKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJbzjIy9LvtvBGpMGPnhpVT
 feuFfI2KuvhvKL2yO5qdw/pl6uWui4wMMybKCE0RTCsvjvfmLhbm37/SxXh7R9LmRz9tMx/FLsz
 gBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cf1d95fa0c64 ("clk: bm1880: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-bm1880.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index dac190bc6e19a6dd4be413ea52d41f74934a1aa9..536df8e828eab83fbd3812135139c703aa7a1ce3 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -621,12 +621,8 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
 		val = readl(reg_addr) >> div->shift;
 		val &= clk_div_mask(div->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  div->table,
-						  div->width, div->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req, div->table,
+						 div->width, div->flags, val);
 	}
 
 	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,

-- 
2.52.0

