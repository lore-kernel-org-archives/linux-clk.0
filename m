Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321433BBBA
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907158; cv=none; b=Ks9SWw7vdPllFfT1SllujJrz03zBUSW5NCZCIwTOiw05r1y+S1RHWhO1DevssQzTvFPfHCMpk+pjwn+3wdMyV9zWx8np0P/v2lub+5/SmN8BzOTdk0+4cXzOfO74XoX0WhGI7tRRIT8YgpZTcXtQCIu/QcKxjpuzkFB+9LbxTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907158; c=relaxed/simple;
	bh=obGg7UzQWRzDKZpy5Gk4sjLlNTrtDOG8AhKUHRKX6zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+K/g6GydhcTRVIkUm+D/+4tuGE2jOroV9m0xdWWgKFI88mC3QMTdPajRyPcpy4rxd0V9Qb7E8AHRw5uFvrWeQZVV1l0Mcn5OM8r8APAWXsG0xVbq0AG+Z8PBLfVWWZGtzlXlg8KCdqnpFM+a1f93nfTJBFluPBrB8eTWdJzu9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/WA5AQe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fe9z7U9K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/WA5AQe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fe9z7U9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=;
	b=H/WA5AQeaEe/AEGI1YLs2d2Y73P0xEiVdivifWpPiq43uCm/l+r0Oetq/F0Ew35XAETpLN
	G+FUf6t6t0EY5Zrs3P6OvjSJNCvH+Jfat20Qkk1hAQE1KAU/Kq3knX2oemT4Ua9xv5OEZs
	7qk3IAuDEVbqXvCidFOmhYCgHxbE2gU=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-Kbq7gl2cMXeMm7PzPgchjw-1; Thu, 08 Jan 2026 16:19:09 -0500
X-MC-Unique: Kbq7gl2cMXeMm7PzPgchjw-1
X-Mimecast-MFC-AGG-ID: Kbq7gl2cMXeMm7PzPgchjw_1767907148
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9413e5ee4b9so9744174241.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907148; x=1768511948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=;
        b=Fe9z7U9K6ioHwnfasvVHXkHjugnpG4qvbN0qNEVzJjaL8Si+V5sdfiypWHcsCBRWn5
         eD5bBId94pokjHjtuAVPYg3vvC+n3Vj5e+z7iii5u1PXf5UsrHfyX7QOw4cIeK4xL3pr
         efON6eiCyNieJmNQLJsKdnDCBvoTYWLmfd5JDPFuFL/QSs7rlXEpa851P3J1ZqZXi/GM
         8iekdBD8DNAZC/ssYDTH+imUCQw34BrCKVn38TU41wvKVikn8+7TSe/zSBYY8km79Usn
         +sEIt9LRDU21mJNCKYdnPz5fq6LsjlXstel5UkboGcc6Ku/rwl8KjLmJ9KoDPMGHV2Mk
         mDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907148; x=1768511948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pi8aTSDXEqFb0AtS29g5AANtZt1DyRnbPSfQSa91eEQ=;
        b=BZpUNB583RcxGUsg+34zC5T4FfenaboP3AVCj+A2aDzyMJcy+iAw+ofyQyBighNW92
         vFiQ++ZGn4SEfrV0vWi9e0YvWqjitwLDrhoimCS3/ehAYlZc5VhlR3rhjlRGHeqz9Bpg
         wimscN0wTANhN+k88/bXqsLtMVaDs3L6+3o1UbyUzRl4WwHI7nIzWswge0+lOUIRCPoQ
         zL++ggWg7mK/9DhytyHjehxGoahMIv1amN3vjyjPwqdzfESvbDie8x5H0hwvljMLoWrO
         bQmvwy899LN3dmwZIAuzA1MdcCIG19rl+vyftWu3U4yX1KPFH6hHfN0NmwlBxtlUGh2Z
         jpqg==
X-Gm-Message-State: AOJu0YyEqGydqsTNGiCpjiUDA4eQDJnhG0x+24akBE6GpWmOKWKNErHa
	yDPg85qqwvmD9xAQnX7du1FzJNcNrA8W3cnwvvs9y2Ys3zBJg8q9rwAgJTGHzMABtu15/DFX+2k
	UOXZfOH7u0Atoc9FxNFpWvXjxVFELry4d8aBn0zk2wXu4RXjwmtsSCwz8bFTnAMTggqQPGw==
X-Gm-Gg: AY/fxX7czdz4vuzFnE+roDuK7ESM0iCz2eLJBqdK6m6RrUBhHzJDVzU+uei7kkaY5nA
	R/286iUAqwaCTJmYhj3im7azG/Ej9fdyo94wsGBlxFtxcoD8/F5TddlK7tS9NTN9GlbAyEHKuZG
	kFnvK85Wu7c+TvaT2Q9fHjzu6rUBcnyon34Z4bqN/sEyPV+m+LEwExPTP4CblR9a5YI0RX4j2Jk
	TS8jwq09k851XolKGr8jWT42VkFI2IMJGVnZX0NJnl90fFNsvxhNi8rQSI5MVEIyPiIzfrc2sf4
	ygDPox+PMUsm6eczoqOL4NlAb9JysB2ke+e+jXBa3iOpoWmj2CM7kXVyiiyn9evE39sTe9R9qMe
	fUsT41BghR7WgHcY=
X-Received: by 2002:a05:6102:419e:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-5ecb1e6f442mr2910877137.4.1767907148415;
        Thu, 08 Jan 2026 13:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjkDxe401WB7XCmqhdQfn1Yq9q/xtZIkqczooAI9hDDE/Fw/5ZqkXt9GSFjs3KqeCx/N8xaw==
X-Received: by 2002:a05:6102:419e:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-5ecb1e6f442mr2910863137.4.1767907148014;
        Thu, 08 Jan 2026 13:19:08 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:41 -0500
Subject: [PATCH 23/27] clk: zynqmp: divider: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-23-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=obGg7UzQWRzDKZpy5Gk4sjLlNTrtDOG8AhKUHRKX6zk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb93Mva9tclyPhOy56Un696Q2YrvHruccon7rjkh
 C/bN+7811HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEvhgxMswNc/g1N/iT6PZH
 G/5LGXkHrD8o0Xhj62/bnZklTBfNVxYxMrwInrTR6Ne1vN1MkkfTZpZNn1UrVOtnubLn/OVL9Vu
 PfeEDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/zynqmp/divider.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index c824eeacd8ebd4d670d78f1af2186e61008bdae2..de6f478d527d89881a9c0deb04e7bc0a5bf6ebba 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -151,8 +151,9 @@ static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
 
 	width = fls(divider->max_div);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL, width, divider->flags);
+	ret = divider_determine_rate(hw, req, NULL, width, divider->flags);
+	if (ret != 0)
+		return ret;
 
 	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
 	    (req->rate % req->best_parent_rate))

-- 
2.52.0

