Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284584;
	b=rh6vfZow4H1j8XSh7nUW4DMWczv0Y3cz/95dG4o6ionlSa6ssh8wSjLmHwwivKIFnLI/
	 I9/3g4wu+G7YNvw9G8zFaRF+c74TnGN9FijQsg/uQYCkBMCxZ4XwiypihU1awXLDVD8n9
	 yIxcf0j9bi3SXv0VzK3LvpCI7aJBu4n04SaKvDosA2h1NcaNjz4T09YisaVlrgRIoPVqH
	 l42ETJkkrsKP+/9aa43iOZKKElhbTspp8RfK5RFABKJmjwmIpDwstGLbSC8BTGjaRUVII
	 I6SKNb28IXo2cG3IGoGIY/Fl6mJjJCxRB6Qqg+S0jEFllLtc0XYVqhBBOEM8Bruzunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
	b=leQ0K8Fcw35GttDpQ0yE8gNhC48S2Pe8W45vMTd5iHSumWmk1uaMyZCXrzqd51yxx6NL
	 LWTkK40AStx7xs9VFoPXQmPbMZheFzw/77WrTfndNIYdB6mvs+OoGvJf07o63Sk2zPpqL
	 l6gFEPVgR7y4Yi9pziPcRkZU/PDw3RDRShj9gyhXbiMU8ojGp0qw74M6FDuGJTytRoU1K
	 FLgAac7qdu343SBXBcnBKxPnPGrZoTq4v3XX8zM0JzTKtWog8ZtVpuY8ea/9kZzvDMRwe
	 PLzrWS0dmolR8qRIjEWwV6pKgStTBLR91i7cFG80DmkFiq6yJThNljMeeLzYSh+6oAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GJCfjyuA;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D186C606A31E
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 14:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D186C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GJCfjyuA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17608245e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793284581; x=1793889381; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=GJCfjyuA58h2dAVGnto1aSgexQNg9qENa5Z7ZZYnZIvS2PJBSWKxkxcFYcbCd332l9
         v/nPCEJKYAuLKfEent4po3W8AgtrBJjcKmj7s87g54VRT7Q9cim7dcVlHu8uKlItn+MC
         Ag8Pyzp/GIte9drLIBouJwcpD77Db/qK4o0dc2MtAzzu4/jgEmZtuFf3dgVp+9h2BeWu
         xf/WXFcb30CZkA7UsGm0dCGtQ82nRrntwqWWgcijRnsS8EUrZ7Dy9qln3xoEodmEsdWk
         Ppy7tDcH6A4rs8VoZlRTznNaqf1GHw8u1s8fUA5nC8enz2YTZyYYBQKzKLLmKCyyTt1p
         70cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284581; x=1793889381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=0ghEdNNWac7LbeEEFdiJFwlIOrHP8Rfk3ob1bcrM48Elre/9zy0UgsB9GE8PazkIt+
         SFrDAZkTT552YJNXSl06/a0YGhjNNAlgVvemaUx7MmRYXHgpxuUa/22JCOOLafGcN6ET
         wa13xk/P6nvseK23JnxJR9gxs4OjGcSB31WZ6OjHgVzkwl3yL683endSnS3qJeLVwI2P
         RxnmcZJPksCaIaHLcp5F/cz9jbWS1g7GHFbaCiXTxGNxW0o9kSvLJ8WwAM4enfdHz/rA
         51BFmv0BktfZzwkWhafr2kUcPGeVCEl8lI+llFIrAXm5XxZPgVZteEe/4WBNvet+0tsw
         8c8A==
X-Forwarded-Encrypted: i=1; AKwUvByG39pzPGNMd1bXAWXECShFGl1JW3mSR3yxHgQNx8Gc0izkvRwYwrdmqfJUhgCkwBam7xrxLLOWeVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ5l0QVVBRiewUlTzt29bdr1rD8yuQGdj4sR1qsUaO5zxZgR6p
	D+I9ftW2UtORTyVCainE7xymU1FPgdFRIlqhnsbQy2xGlIVhysSSKS/2mniaPLscWoY=
X-Gm-Gg: AYBFou2zfJujN1IGpVsO3jnTfAk1pgnaFIdto5hAdeL53gSY1pnjfjT36fHPKe7zbG1
	wmoo1Bq6oINxXwouAMOGSwV/YPyLEBlwi1JgQXLATj1N+lKE6zr2R1xG+8BaHQf6Qz/5flGiiGT
	GvFSSWLl/wt85HJlp1XbUGN+EDKONpcSrqyfwdq7i0kyM2ir0zS6nUorcuUPPdR9cH6QbdlpTox
	nOkueMcLPUADGkXm/iQIkIlXL6pHltZzopOdbisyF/hGGAwzul5/7bWdC+pW1F6qQCNyZN/btsZ
	ujJCc4K+YWsGq0sYGRv5OHGNkNN/CYNCOufdIiXZpyop64aOBa55FRAPtgXSfdwDn5JQK+cXm3f
	x1lf3YVrGVNJnxAvNqz0KWRVuIQSkqQ/KfjsM5qw/yMZSiRyKhVDetCAbFakU02eDmNnLb42oJ0
	m9qGjLUzBnw+JdbOfn6s+sx3pfDC9zuTMYwEB/rWSvlbwWfxEorBsvgEsJssKXhnOilkHYBu52O
	vCTLUolqEFNFz16hFkbYN0/tyI3ay/5+uL0d7AZtSuv5CLNe/Iio1fp2tI2vWeFhfDTQ9L87N3h
	lvOn0q/BgLlAVDka6HJ88EsXjb9Z+9CHHg9wH4aKOlnEdngC
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr115101135e9.5.1793284581222;
        Thu, 29 Oct 2026 07:36:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a32eef4sm80612955e9.3.2026.10.29.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:36:20 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
Date: Thu, 29 Oct 2026 15:36:17 +0100
Message-Id: <179328457778.1865333.17367903644168961694.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=328; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6EvPRMH0NyoJrkviiRd+YwWhq7FQ66k6ghPBYl+JiM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPIx8LPbxyy0ci6kzfIiapRZva5gtGLNK0DJVjmvol9
 kQC74+rHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiIghojw5bD68TulT3j+8wp
 V/biuueWSxOFT7/cVbHvs/upiYzn51cwMjyJdD/z4eTLD9z51W7b7z/cIHlEU6d+n8HFS+1bvD4
 wSfEBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
> the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
> it in the three drivers.

The commit description of patch 3 apparently does not really make sense
in the context of the S4

A part from this, it looks good

-- 
Jerome

