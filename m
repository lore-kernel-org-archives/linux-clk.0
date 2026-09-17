Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6D381EBB
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669737; cv=none; b=GvUxwnp6+R4JnaDTG0IvZbr1EYW/L7mrHZ8A7gMYqiMLUFI+nXZhiVolsOCBCXCgA4JvYlzGVn3ukroN7PYIt+LIFI8VFzSui+ZkyF/qSQ2XBL8/PmTV8vm9w/sSJvUo1+PGOLT1+iPFHJZaomEQG/OT/uMzFBvgXUcs05uZqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669737; c=relaxed/simple;
	bh=2SpGKqTp/JfwTgeFMmRyNuW7aoTJomcaZ2jk3HniGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLTbiUELtrSpPwBAWJHtkb36nn8Ix5p9aXi1m4NpUmFpeeJlOsLRJDskz+5OlgJjIWmK+xv4RJBBI/W37o3wSzrzNzfgdYbmy1fhirghCZB5T5XjXTuoQF9hh7h2pbBIjXzYlGJX6Rz2FdgnwwDlDZ3HwZeyx8zJU0bMC3V95HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRncQcJY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRncQcJY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so408788f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669733; x=1790274533; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=eRncQcJY4sMUbwzceyh4B0YQ5s+BD1pI7g/eQQnIuKvJIog0PgF1BHuODVFIgavUNY
         EWJWSYdQ1g8noErj9sc8OLN1Zoxan7iHLFRNTL7m3ItL7EShAU/lyIgkRFHzh3Q1/FHc
         0rz3StzGzHAOkoqNMCjCctgBpgVPZgkhKMA5En5bEgFFvsCSR2+/m6TcjheErvWk/2GI
         vCsl+AHbAnKrmovi1OuG8NOsBIFrKP6a4lGQ2hls0c2WNRiliV4/6aHpQT11dSxyjrfm
         JAEbg7GqmnyftjUD1w8nZlOYmfk35dUhFdkiwcgiuWSrvtCFblhxaZzOiI30llauaPpI
         A/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669733; x=1790274533;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=m4qhk1vWh3cGRBynmDHc8/6gpdowINxrq40zPche7ab/ZTi7oJINb1izyNsSQGYYmY
         0zvDTLZXhL4Dk4xxh662xdQSrgpZSy94xTJDr+M8SmLt7tS9qb82AwqijADSJKvQrwPx
         mffOZcGzO43v7cYS71FDVd/C+JReY9SVpiInaeCTkEl3EhTLJ2njghiCIeKWFC0lMvSz
         GZuPua/C2K0dpTT5cm0/SoCF+gaMhb+q1+TFH+AS3oFRupdItmQAgxXThiTiDTzw0BM3
         XkRLZ0IWBfgXCbDQ+bwI/Y2PJAVfxf8NUjBKQTy2ko6rILvFJTFdJ6QQndJV8N+EdeGL
         QXBQ==
X-Forwarded-Encrypted: i=1; AKwUvByGoWK90yEYrbC6Xcxino/iO3h5coE5/g6MrJ0lBi5eeoDR0cNivbTOj6sBvtPigcypW1t4Z899KEU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7BXXBEjGh9RUBhdLj7pEnxBew6sx3AoNp1xiEgHx+f9D8vAzW
	vCt2jd94AkmHHtFc+I4453r3fY/bSqqxM4oUqsbRblCJLjUcLuYicChv
X-Gm-Gg: AYBFou289gkJYKcThNN0M+7P/WBGGgju/8Cg6Sh83+2h0ZCOCS/hk8jikYN1V10sBw8
	dIYfyTCc3nuSlq3dIPk2va/KDBwpi1if5lZL1L2XZcy1qgECyngJX0sSX8m+hdiYrXJ2WNHmbWG
	leWapJK1qcpslDa/BwglbOlDWRzKwtMD0XUKeE3iIbHeui78+kCC10EK30D/RKvLCPY6IXCPFNd
	J4NwTnAi3XSHdZEwIHhzScW7oaf/hjI9eSsfuATkU4638e3I/+KkwunU4Ofb28K8gY0fJma3BPk
	VNVNnWVzcr2ndxHOpEEYV+LUbGFCb4uWaa/oPNEXUGPl6+990TrVAZKgCijTa+Nz1HBQrOa1Wli
	I8v9tUVCw73CdL99PBpLb5rtlipV1F4HMkhnm3nSg/vIgylqSalb5t+981ICy+DDk3xIoXAK/HI
	nygNKps0GNTcuSFI46QJ8Th/mAbBh3MOaEk8lkHi92fppkfDtaxkHNDVkiIJ6MF3I+T2/HT43aa
	BDmFQ==
X-Received: by 2002:a05:6000:708:b0:487:11:d053 with SMTP id ffacd0b85a97d-4871d915c41mr24943f8f.0.1789669733272;
        Thu, 17 Sep 2026 11:28:53 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm17422129f8f.14.2026.09.17.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:52 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com> <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartElaGoEJaRnaci40IYCPnGA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
Sie:
> Hi Lee,
> 
> Thanks again for your review!

This is a ping regarding my reply[0] to your review from last week. Do you 
have any comments on my responses?

Thanks,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/x9tzyTnKRAOyrdtSGnka0g@gmail.com/

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqsMVQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiw48P/3we1ILZFxaaGd9dUpM9
EPNR5ZVYal8qGKGBQRRFG5L5iI9qCAETVZTl5UuYFjjcs3U9+f2t8HbH5pd6hZSt
C2F3WDGrsGddEGAPArMF7962KRKHHPUDoEOokUhrdp0/J7XFAZRDjCPJJdZxTHZD
cpnqNPNwoTUAWYs4kLINKy7fY7PW+sJqUmAqvnB47RLoFURA9/DYcNxa/1esTScd
Vyzm0NEsRFuZVSYTSjbBffTn266IrxNRSBnCJOxRAEv4edO2dkkqy9OZBDQLkcYn
LJDrdJY/bAPJFapkXGuowmd5kVtYjG60V8+0suU1m+2HLlSipyfl4XeYHAS8gT5x
UbXlsxgwtxCnMHWed3RbtXUGsYuBCsuO2HRz0Rv6Cduc2qY4XeEtgFxShiQbtq4w
bxxE8DTlxoYjflISxEYYp/fD79irBB3hsp7oeSzP8PUyHsuFfCKpb2kfwnUtwRIQ
Ov2oPm29JViaAFvrF1h5FQEU2zLsdNBquOIlsqamK07yjEPcELwlAByNv9e65/Zn
3HUXepbTgovCaAofjQsggxDdSLLb4O5FjNn26DgHxz9d6ONWOjyqOIalTG2SbujQ
ZDmnp3aIX6ETZBue8mBr5Df9zQTmCwYmmAh4PtqvOfy8R72pr+i3SSUdTXIj8h4X
3h6c3+ubcO2oiEqVFEPbus5o
=NhYp
-----END PGP SIGNATURE-----

--nextPartElaGoEJaRnaci40IYCPnGA--



