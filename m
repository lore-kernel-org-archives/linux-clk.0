Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D044A4414
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360564; cv=none; b=s59w+7bprmoiLIsS+rsHgOiWlGUaBs8ntQSda6kJZbsoqHvlBqNf8+AKsLtF6bhgHDEAdMFqu/nzMbn4f5A8rndc2fAObFOvQew4BkQvy9BIBLH7Q1DpwprsXGk8x5N6KaHPWBoKSZZscw/5KdW9dhwDJVt1GfQ7DQsFaOP7QrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360564; c=relaxed/simple;
	bh=o3ilph5W2vSVFluZzVmnRj0Zf/2T3yXy4uJ/eJj36UI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=poEexRM+qJjLNh+hhxSBnSH4fP82KLry7AU0qxTJ2lOrWlnUcq1/yPAUB6hyD5sUV96/nMMjcxNDc3xvCjYDOKE4Y8L24ijZ6Q2oQ9H1Hb/Lh7gPw++5dawTcBqZMbLVuHaw6+L57N07JoOod5BORiDA57gsrbpTvNPPIrKn4xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L9kbnnbO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nck7uxVb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L9kbnnbO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nck7uxVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788360560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=;
	b=L9kbnnbOMr4eZBelfYGJ9k0y1oVeppzlgx9iYz1l8M6CrnjvDu0AIh2Av2aM7QH2SmSi1u
	sRBOoG43v/R1VaPVK7z1vqegltmPRSwwO7RjNn1cg6TovIFU9LL1WE0Ol4/ngyJ/C1b3ae
	nsGHi7hqdtqvzu7Z1MGEeeh+b2sok/o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-l1SCuAMbP16rROCzzlr0mw-1; Wed, 02 Sep 2026 10:49:18 -0400
X-MC-Unique: l1SCuAMbP16rROCzzlr0mw-1
X-Mimecast-MFC-AGG-ID: l1SCuAMbP16rROCzzlr0mw_1788360558
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8013741eso12124476d6.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788360558; x=1788965358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=;
        b=Nck7uxVbOT95Jisqv+FV1qhJppIYU8HSPkF0c+Orl7YSQ6B4HthA7OgZdudlVZQrm4
         iD02DQ9ApI0tuTDAruumtpohojgVu970JHvdZbtwhWwpIqGJWFlnSZkSb5sc8nnN/epH
         wK5skCoXn78Hak25qB3wDsu0cFw47nB9aj8aaBQGfXIluarxXHvQ3wXXE9Gr4rL4TZOU
         Hk3JKWdjmVE7VgheHcS2gGGyXVywQ8SyXJ1yIE0K8hW8c84OgEAMddRb8/MYbWlVE4jH
         tbrG+xEsjU31QZhbmntKBmAWgK+kwKGglvr5B0iHbFxEIa1ay5750wE7DKi+ADIT5nM5
         l64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360558; x=1788965358;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=;
        b=j0eZU911SBxNmAtJECYrYIEVZV9gsiCqXB2dyxcoFI22DaL+qwPNvsoAkEFN/8jeqs
         4YmoRrSUyPEb6dp9YCoWbk9Cjop2rLvS1qwNVADBThf8rU0S1Q1dCjrAKGkwfoo71ua9
         1kgh6HyW0NKi/3bkFblzFfjvS2LZvKk8a6wtVURzrdEvKpkyYp8v9zS5xazKN0eA6gIw
         ygcDMxZLCF4YYJPmOpdEPk3Zv3sWcRuXLkNCW8ExfZOTsEhn25wA0VBdx9lmGYCK3BYb
         z20eZi7z8Hkjd4Ha5Z5xYMwVN4aFs6JsPC89I7f8PwQHxuYcT8U/CapoypxMhFb1TrHg
         HjJw==
X-Forwarded-Encrypted: i=1; AKwUvBxL433A/o9QFbPkPZVOymL3s3OyXcDuyieMCqOW2UAT5GIQYzjPTbH9qxH7k4gRwGm2xO2cLJBuudk=@vger.kernel.org
X-Gm-Message-State: AFuF++nu/kK5Yjqf6XDxEjdsb0PoPFnfhZv8oqq7NVVP7uXQRK9D8TQT
	fheRvtVSHUhuTNBSSWV9ZiXyRtISilLfi1hBq/glT7Q495p8DdycS99/SOjoRLhBMYo5TTptoUz
	+zqIluIWi0mfdRZ4GR2g9Rd0OT/9hcnIy/iUTwkN77OY24dbsrloTpK5PiM9Xjw==
X-Gm-Gg: AYBFou2OHl67ctOry9CkdHjGvRIlwTRfHhAG2chVqY9Yw9Nf11rf1BRwAjK/IjYFMij
	HKKRiYtB7p/hG3fRTtxjZMHELdMTo6dgombrir8NcGPVm24lN5OXiEtwXdlltHB/WojU8S8vTb5
	rjdUwTRt0BDyJilyfrvv909cSi82W5yjjTtrhDJMb/b0tOu90LiypEtGOjlqRXeLzP3hJwwoeER
	pFOvIjn0jE96zb5cJhBFLXup4JK5zNaK4sIwp96sJkH3KoLf/o40hz6hXXNtifPNcMS9Nf/kIje
	2Hz/c7B2o/Tbyi1E2ezB4nXwNIP+80KQV2BgyNsDKESOt8UbKqYkqSSg3TwlKoCfq+aH6F6wyCl
	eh6jMMaJPc4kZp0QsDBA7cVvf+CCejuhjjBsmOzI=
X-Received: by 2002:a05:6214:2b0a:b0:90e:8dcc:4e5 with SMTP id 6a1803df08f44-90ebafb8fefmr72182216d6.28.1788360558158;
        Wed, 02 Sep 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0a:b0:90e:8dcc:4e5 with SMTP id 6a1803df08f44-90ebafb8fefmr72181126d6.28.1788360557564;
        Wed, 02 Sep 2026 07:49:17 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8482sm19647986d6.31.2026.09.02.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:49:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Daniel Palmer <daniel@thingy.jp>, 
 Romain Perier <romain.perier@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
References: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
Subject: Re: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock
 array allocation
Message-Id: <178836054100.2017040.16035095251394555993.b4-ty@b4>
Date: Wed, 02 Sep 2026 10:49:01 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=332; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=idLPkDsA8mhI1Ih+j5hSWIEMKho7R3PzR+kQbEfB5mg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmmKdNeOt2NXwvq8a0uXzTGK91flEzf1zEn9/tJ7lxd
 uxx2eagjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS94jhn36ndiwDS89kU/kU
 4xW5Rw2qK/X+qds+mnL19/FU5s3S6xgZGm8m+nMnrD7x/5+EmK2SqqDHZFsBaaMLxtKucwwemrY
 xAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 24 Aug 2026 22:28:00 +0800, hanzhijian wrote:
> clk: mstar: msc313-mpll: fix off-by-one in clock array allocation

Applied, thanks!

[1/1] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
      commit: 712b75152c00a8ab0c56dbfe34caf88e3870ddde

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

