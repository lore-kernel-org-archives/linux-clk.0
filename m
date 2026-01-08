Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0E3382CD
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907103; cv=none; b=WNt47KHItno2tKfeBm9RAeSq1+g8uD1ODR7+oulHe89QeX2k8MQY6nK4cWjlCKRrAZdpb84z22dPAmkBgPjefXsYgFhgnKsv+jdmD0eqd1du2OMc5vjn+0xv3SLYhG1pJKKgxiwROVLN7XJD/bAZ1m1YkkcxCfAG1AquP+TfU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907103; c=relaxed/simple;
	bh=7HOzNeGSRizgZeFkVaCLBp3lcLY0zAl5xQHRspPP9B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaQpWctcW2F/9dso5daHHvjPW3nBIMpv1zh3AP9dtSUsivQWwUU/zVUss5pANshVyw+okJj5pMbqCSC6QtyV5miGNCRhdwSQeU/5JSxV+joiDwChuI1XL+SsmhpYVqqbLkr+7an5wci5rdZyYJWH21eU3uuDj2Bv5/ieyJ3uLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auOyC47B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KSTVCXgV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auOyC47B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KSTVCXgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=;
	b=auOyC47BAQiFb7FuH1xeX4EBc2qV5gAvVS9J0QabJIpKy7ygEir5u6KOjos/J/InUfWz71
	5VThCFogL2nQRJpo27bdZ3ar6jCbn6v7xu/ggpYH2udJZqsMLT0u/pWXo/Muf4x7x704gW
	DwuOV1GMKZppcLBsVP+cp9g9WHDN8S4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-rku7RSsxNXS4RjavomyTrg-1; Thu, 08 Jan 2026 16:18:15 -0500
X-MC-Unique: rku7RSsxNXS4RjavomyTrg-1
X-Mimecast-MFC-AGG-ID: rku7RSsxNXS4RjavomyTrg_1767907095
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9412e0b1ec7so2916524241.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907095; x=1768511895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=;
        b=KSTVCXgVrurCKPg5WcvFYbfPBVWJxckSuOsqEeC4VthHaMR/2Yy+jrOuB3+1i+WwPW
         KQ5YH1yKwO/DctNkJGWFDIwOsHGXLqXm1xPu7uhgyE/Lz9fOpcOORSDufCaeqvWHD/WD
         tIwwe7oJqpXFefKRKqsABlzWjTL1C4DegKaOHYxtBCKcoxsdCxClWRHy9KK6VbisdlqC
         hNf6Xk/lkJmBEo7UMmyiqN2bM4zT83+Jjh8pHeQ7WnvJXQ5I8SYCKBf5fsEQGNprCvqe
         snJXRdVMUmmpnk9fwpjeWv8ip6A61f3PkI0Lhm4nR0SB99PBvGK52ZrJN24JBpItyfWn
         wS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907095; x=1768511895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=siOywqRVhauF6+2pNczXHVdhiBY3N5/g/CIcxw4d/Ec=;
        b=UWbZKA1nQSQji7RnMaTSzYRuo+uKlw/rjfakgqYl6g+kJkx25PzyNLMTTq/zFjF2aU
         E51ykx8eVdh4XZ9Y11iKj5+scB0mQyFU7QUSNller+Gl3OAxPmL3naWNaCCsrfnKuRKG
         +IOqgT++7le12JuNqZY+py0Dsu0VJ7AtFi16NcrR8QWKfSOLy/7TKAZAX6VICJ+l75R9
         JLHBem/d8WFv6S6KmDNliKP0mzMfWWcoG+6/j8sNWoeyOgeJahpMJ2RR6fRPAOKQ9YM9
         RYbWZNBUl/yPxUrWGnJk9SFWycWdIACul5vvau0dwKQzGR/Ty9t+Lz689cYZKAMeYwVO
         QtWg==
X-Gm-Message-State: AOJu0YwOAbwNpbra32a41yK11j5iHrfrxKsOIYm7cJc8TpGqH/CNnkx+
	G7U4RpvbTzHXeaYnV18qyLZspTwgAhklB7abC0te2yyLMIGPOOdpwTvEYdN2xyCrO0BGasLoqgA
	88aH0Li9RQQTAukzH7oJfiJU7iNrHIkCvmkRxY1n+/kMdxQc9yufLhSbHP14Mnw==
X-Gm-Gg: AY/fxX6fwQ/iTXDqhpU5+K7r0Vpabt/Swg0L+5xqUxUoo5zJNxzZr+5sAkplU4y6AeM
	mJXId5TX/z9BJE7hyhUTdWjyHB2BDTxAWaJlU13p13djKP4uO5Pc/5hPfIvNCqL5Sj49UHWKurL
	Z+X6xmIMPtfoK+CEY8a9csKMactFIekE5g7+7dJtHOuR8UfB5FysIKMhUU1oWh5Xb6Fw9XVWn7Y
	Opzn99uRHzT8gPjfTcvEpQpbsPEFQaUKWD6HhjPGQ/1irTvGcVbOSk8C83hVARY/nAbKB9EsYFK
	0l0k1PtuNvrVMjo6H98QqydIsHg4i4uNLfAlZqAfVU2zwvQFPmUZvISfNcMvNC7SLcbqanWopfp
	UJMlti0A9EXo2+OY=
X-Received: by 2002:a05:6102:2b90:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ecb6875afamr3022773137.16.1767907094764;
        Thu, 08 Jan 2026 13:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7pmFryhw0KW5QeCDQ/EVRIv8eiyPnJcDCTHIYHaP0Lu8xIO3tTA2mJwSeqtxfokatvgQWw==
X-Received: by 2002:a05:6102:2b90:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ecb6875afamr3022759137.16.1767907094229;
        Thu, 08 Jan 2026 13:18:14 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:13 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:31 -0500
Subject: [PATCH 13/27] clk: nxp: lpc32xx: convert from divider_round_rate()
 to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-13-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7HOzNeGSRizgZeFkVaCLBp3lcLY0zAl5xQHRspPP9B8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ4Cx5blLbRy2D+HbH0rDTjV57vL/nFHeNb/8hvi
 d3CKpf1HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEtYrhrwjT44OVfnfMT7N3
 aJt2ruH5U2LEOjnNy2Ci/yarG2zLeRkZVvRejDyU/55nqpbJYvvDVQ85osViLA6/vJ9zQltoldN
 8fgA=
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

Fixes: 0879768df240 ("clk: nxp: lpc32xx: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Vladimir Zapolskiy <vz@mleia.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/nxp/clk-lpc32xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 23f980cf6a2b59ee1c93a2519fe5188d251fa12f..ae2fa5341a2e4fbe5f2d3ef9a6cf9e9d75180d59 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -975,10 +975,8 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       divider->table, divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

