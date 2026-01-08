Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D03382F5
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907090; cv=none; b=lCERfu0c6+xSDjiylLcL4Pc+IEu0pWXwubJrrglIPTzvpkpRJJ74RQGGE0tZPHLv62NJCOic33aeOVlPXCkTaB9Ot2Jvt8dIlZgXiX3Lf/62mA+rjLUEg8byoR1NIM2GdCYM6ZJXj/VZrj4E9uXldkia2J0/v+MRsv4l2uNsVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907090; c=relaxed/simple;
	bh=pxUCYfGPS2BABWCqUrnX6hbF+k2ODFPNH4frKluoHeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhcsEBPmiyv6UAJZudOOQYGa8N06IpT6Q/9rh0Q6g/Xkh6i5FIktUIud3krlWLjuZybVDXZH5amJSqnefg7opSlO1cv6f2tHU6qOLiiM2hbQATNBmu9kkRER2bdS686SJur0gc9e4FTMRjM7Ap8B8PdjD0bqG5xWenB7nCgsuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b5XJjDrz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQYArvmu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5XJjDrz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQYArvmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=;
	b=b5XJjDrzCncn1kFCpP23+ssBn/zMcDM5nteWMm0W5DFVpD8MqsKqj0PiABxgoUGV1HALA4
	i6a/cMd7F5bFnss3XrqfKEofmDEdas44wxpf+GxY717V141XrdZI/WPSZ46SDdhaWZRzBb
	E98X+DipCCiQ4rK7nc/mcRte6V0wwEs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-Yx_f3u8VOJ-b54xg--dAgg-1; Thu, 08 Jan 2026 16:18:04 -0500
X-MC-Unique: Yx_f3u8VOJ-b54xg--dAgg-1
X-Mimecast-MFC-AGG-ID: Yx_f3u8VOJ-b54xg--dAgg_1767907084
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f4ff789c5so10319205241.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907084; x=1768511884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=;
        b=WQYArvmulmLSU+WAF1dj8GfRgY50dWPN/1prvxue6sqhECl3LXlpZ0icNx80BmhnYx
         ohVr46j2KVgPW8xjBo7gFvLlxdVOOPJd5LO9s0iiUKEyrg4yzOPkHLFO4sAKUd28MMj0
         kfDZxI5h40/J8FKXLR/QMr7kyB+/C5e+tT3rlnd9vTTqsO3HcQMEueGc8Nn+KDQTGga7
         NO6X4LqlaRe3d+UQgM++tMAQJ/TTIe8VbuqkRoQCT3W/lj1dzmItxzVxT4ggE6dUux8s
         lmtIARkwOtcm6WvqTr84ZRFpp8wzWOosfLmQvodDE9xcRJL0MOwH6L9DQ0dDRA5xhRVO
         fvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907084; x=1768511884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=;
        b=YYjVRzAa+rErqyaGY2srxWsZXvxc4VRJpdFl+RoAiG5zvlAHn7wx+7eGqVwErXS4iU
         qLMPwUnYxdMSJmD0EfmWCJf+5Z+iF9H69obPfkq6hI3PGcx2NB4t3vuMJFaKQN4hjXZ3
         YSQyOWjBLDvQn5DIKISZgTdwhY7sVM6xT0C+fx6dNVxu/1FjGlf+ESFt2VG/mRCac1Qq
         PKj581ZVfcxJuC8wyvqbNfhpblGidpyvQMX5rJk/vnToAuuXTKfWWVDibfPqnqX/kbaO
         r1RWrQL23iEpby54ayBXCjIJer9G2uh3f8i/GL/BphsZ1Uiarkl+9U3w+6O/Yx9gKTsd
         i3JA==
X-Gm-Message-State: AOJu0YzE7qDaj4b6rVyOP1GJGgIsDspc3qsWDN3NvR2ym2rxvD8lsm0g
	VDWySrUKsLadtt9MCpV154UtyXRMfvS6fpgS28gnpzWObQ0/xDWuXlKSNQPcZYvEGoLnNVGrWIo
	dktLeAIGxJBO2zm+8a0yV03ioGwYUxMDvvW9e3zmRCg9jsDscTKgUzgYaN+vY9g==
X-Gm-Gg: AY/fxX6p9JD7U0XIt63u12Z163AVm+ivMutN3bf3WcmAtb6OEI5gENHNtZpc5ypmR2W
	T9zTmtYF2yqJlzFKOBvgp4gStNyV4MqcQ12MSmoMPewxehyq9N1w5A76Zj/4c5POAvhymprBDPW
	I87V2AXlITlIMuCtGsmUq4REn5Mi4dfUGYeQl3aUKPa0aUh/YzB6n6JxMVuQAXio5wXPclWRfR0
	mbc5CjpDyKrphCZQk4TLABf9U8vrSY7mjxULnP8YfyOz3G6xWYmmPSXNXNDFP0Sxl+x2wgAyDCz
	Mxz7GHgngFynZVLbZ9vvdNuRWSJkwt4pPIg2ayewEz4kwjHxVoajQYTesuLGFvFQsmcTvVw8y5l
	HvMk+DuhOItmY47k=
X-Received: by 2002:a05:6102:3e11:b0:5ed:b56:67b9 with SMTP id ada2fe7eead31-5ed0b566b64mr2961644137.8.1767907083655;
        Thu, 08 Jan 2026 13:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTv5o/bKs6U/aYrJPkks/nMjbsF6EcT0xne2zBDiFaW0gV4z/6X5DCa53LH7to2F0UqpecWw==
X-Received: by 2002:a05:6102:3e11:b0:5ed:b56:67b9 with SMTP id ada2fe7eead31-5ed0b566b64mr2961637137.8.1767907083283;
        Thu, 08 Jan 2026 13:18:03 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:29 -0500
Subject: [PATCH 11/27] clk: milbeaut: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-11-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pxUCYfGPS2BABWCqUrnX6hbF+k2ODFPNH4frKluoHeQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5La/f7qD8a7AgxkHd7gskGtfzVX2SSDR/Z/Wd9Em5
 2t7LnqzdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARfzFGhqUaF22Xrtn94lDT
 51UL2Fr6Ze//YNqZo+18xLV3rlmwTRgjw5L+pzPiOCQ2rTeq3vU0bcGrtuv6na9mTXWacuf0JJM
 fcdwA
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

Fixes: 7b45988fcf78 ("clk: milbeaut: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Taichi Sugaya <sugaya.taichi@socionext.com>
To: Takao Orito <orito.takao@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-milbeaut.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 4e3790b7fc9064484c20a068d0315b8fc8241290..45389db652e04e3c30c2a64da63b047b7922b8de 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -403,10 +403,7 @@ static int m10v_clk_divider_determine_rate(struct clk_hw *hw,
 						 val);
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       divider->table, divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width, divider->flags);
 }
 
 static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

