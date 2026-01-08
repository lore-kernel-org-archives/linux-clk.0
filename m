Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C049C337BBB
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907146; cv=none; b=aQ5Cs0VPN7qAxo63S4v3FbPs7wsEytSftSk13dmeE1tu7Di0RRs99hQCKg9qJGDIpOeLJFgWvKZGitozSRhlqA+/GvXmY8deFH2m8TkQX9XEBN2fksHur0QNsRwRzSqYxFoK51xc7XcqKkyoYHT9neRAR5R4i05/MA7ao3dNgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907146; c=relaxed/simple;
	bh=v7XIJHZpMR0cQbSpuTH2cUTubvW0Ol+ykoAl9JRLUp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRW6oXfTYB2XmuFiuI7Frvlmq0HiwNyFTzpPv3dve/FWVf08ztvLPe7a9kf9j/c32CZHm0lKY1YUJGURMEDe/NUt2v+dCpJliz5cFCLXxSz0hZYqFvFpB3C2boVaHtT9xOi9LhilrjCao5EnBGWw2+xDYBAJSp6NkgGM4Y2JSho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZpEKTQw6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qAyVcxY1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZpEKTQw6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qAyVcxY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwMF/YzgsDLcFOqF60EJZjUvJRR28RQS8hRys022L+0=;
	b=ZpEKTQw6IUpgWwqkmI62UHVQatDlNyWsdYNx3jVILquY9WAc8ZDU7CG4udVDK+BURPIfwQ
	mEkXN0yQWvzd/KwgMw7EOoi6dpcWbMZfWB8pItM3mHoTtVLvIjXP1epb1IrvyVDP51xHnv
	H3j8yCA7oTgDjxl5lJrzw3vMz+lpHT4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-LN8KMS9NOeqBUihPQR2YrA-1; Thu, 08 Jan 2026 16:19:00 -0500
X-MC-Unique: LN8KMS9NOeqBUihPQR2YrA-1
X-Mimecast-MFC-AGG-ID: LN8KMS9NOeqBUihPQR2YrA_1767907139
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ed0b446b24so3016960137.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907139; x=1768511939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwMF/YzgsDLcFOqF60EJZjUvJRR28RQS8hRys022L+0=;
        b=qAyVcxY1Bh9Smo0JBTq/8x7NIg0PRUbGB/fA1X8U3ZNpSlhsMuT1I3Ulh9RYx4Vrn1
         Uz6QfUlYO9IDaJnBEVVnopHJKGSG0bmWSfk/Jp/r3lk6cl4WTHPiDswLCmlOVJSu6X0X
         PwlplOO7gxmcXIgp0ES36O/27KQT3LFtA15PIiUjMILak/srAgSryyZa5NzoDKLwnRHV
         7haDU2M/8HA5ReUcrTgqIIM/52A5oOBfgF1lRxEaGdJzFdUxMoUedyvpaBsZrAMtwsa1
         pXUyKAoATP391IgJIrY65MKOIFhAJSf6V+iQ+7NepYM3QUK5fsYF4CW1jfRp5DSZQcIE
         7+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907139; x=1768511939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwMF/YzgsDLcFOqF60EJZjUvJRR28RQS8hRys022L+0=;
        b=sGcprbnUrH1oMxCBHlCCZXchJ3gesWd2+uY7BvfG8NmEUrMQO3kPJaJjydNIAkHQN+
         XQwy7Hbd7WoReCn7TpcXzluE37MsjTJrywfjmto8wHBB+xmwyy0P5eEzyVQXIrDnb4wF
         JO5k+ANCmb+SO6Mu5UWgkbQGa42lOexl0vZpKxL1ZUDKTGpcP8HT3CaZU0DdONMxaejj
         a1J0aaM1aQbrDNJ8Tjj8jZfrX7XR3hKnXnXiQgFVrbQiWBJs4bqHuAaltUkWDd7wjiRo
         mHF58YNhcicjLG0nKqtr+PD9Ky4fiPeWtl4tenjpVnPNVJmkrdgrTZ6pEWJY1onwfD03
         PH1g==
X-Gm-Message-State: AOJu0YyozAUxRpqpbvTUpDsHlENmmVWHH+SuJhb2OmWrSLSK+GWTQc3+
	5B65aLqSlllihdLOescaK6hY7FH/nswSHojaMLDj8V8xtkOfLWbVYLNqZHNgLVqfku0QN2uYmpO
	8WH6vbqYM1jxoRlNBlU6iXAVgPf7tZwKk2V/wY+uL4fDLz79Dm+WD9d+EwBB9vw==
X-Gm-Gg: AY/fxX4YSCBXEXZ40s5YmOirxtDp9XfYHnXULp9hS4vvK/5yoIyXR6z8rVNAb8Ana1g
	JIBEtc/xix3l0wQvt9rTKx3pKEouviF6BvUFwYSj2O8vaSe2gebs3np2xAVJnjIJ+UCBNWGmg7q
	5pn26rLYLCindxrbUFsfNJb3aOeVbv1lSuoYWuxSrsshAF7QU6oIFVo3Tjf9SNpsK/5aM7ds3tT
	70lzhW2LdQX4XaqaMy2woMMG+mO9MiduOHVLfslcz57pQZ5zrqBmvJjHojvwywTrMJNRtLuDXYJ
	Fhoyx1yVZ2VN6Cc5InGvAQtEGzsHncfMQOO/lLnJCI5g7+MnqnKL6SNNwNm4gwWc0y5Q5wkP/RJ
	/2YY1guHBswmIFHA=
X-Received: by 2002:a67:e104:0:b0:5ee:9e4d:75bf with SMTP id ada2fe7eead31-5ee9e4d770emr1519415137.2.1767907139440;
        Thu, 08 Jan 2026 13:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU2lyFtxNP3zRs5RK4fjm4OFMGg8gxCBxy7hDmOZfwcrt+e+WuuI0PExneoxtBtYYq/QW4lw==
X-Received: by 2002:a67:e104:0:b0:5ee:9e4d:75bf with SMTP id ada2fe7eead31-5ee9e4d770emr1519410137.2.1767907139148;
        Thu, 08 Jan 2026 13:18:59 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:58 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:39 -0500
Subject: [PATCH 21/27] clk: versaclock3: convert from divider_round_rate()
 to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-21-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=v7XIJHZpMR0cQbSpuTH2cUTubvW0Ol+ykoAl9JRLUp4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb+9/inenCV+6t/N30dSgNvPgtxdo2XOtipE3D2w
 frFB3fLd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR+wmMDL2tWjl2S0qM5t+p
 EZkv6rFEdOJSh45HUkyb1qR/2K8nMpfhNxu/Bvu0bYrrls1f3vp+6hyBQnk3pXUKU079tNNo63s
 iygAA
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

Fixes: 9e3372b2ebac ("clk: versaclock3: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-versaclock3.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1849863dbd673f3b133b9a295dc608ea43931de6..27b6cf70f3ae1bff1264933d8bac4ccc65481a1c 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -523,11 +523,8 @@ static int vc3_div_determine_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       div_data->table,
-				       div_data->width, div_data->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, div_data->table, div_data->width,
+				      div_data->flags);
 }
 
 static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

